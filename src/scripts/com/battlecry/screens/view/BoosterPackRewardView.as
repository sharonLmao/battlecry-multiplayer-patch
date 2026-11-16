package com.battlecry.screens.view
{
   import com.battlecry.BedUtil.ScrollBarPanelView;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.ItemDescriptionScreen;
   import com.battlecry.screens.view.scrollItem.EquipementViewSquare;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.screens.ScreenManager;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class BoosterPackRewardView extends BC_ObjectGroupView
   {
      
      private var _scrollBarPanelView:ScrollBarPanelView;
      
      private var _descriptionScreen:ItemDescriptionScreen;
      
      private var _totalItem:Vector.<MetaEquipement> = new Vector.<MetaEquipement>();
      
      public function BoosterPackRewardView(visual:MovieClip)
      {
         super(visual);
         this._scrollBarPanelView = new ScrollBarPanelView(visual);
         this._scrollBarPanelView.Init(5,5,true);
         this._scrollBarPanelView.Refresh();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         if(this._scrollBarPanelView)
         {
            this._scrollBarPanelView.Destroy();
         }
         ScreenManager.instance.RemoveScreen(this._descriptionScreen);
      }
      
      private function onRollOverItem(event:MouseEvent) : void
      {
         var mc:MovieClip = event.target as MovieClip;
         var v1:EquipementView = GetViewFromVisual(mc) as EquipementView;
         if(v1 == null)
         {
            return;
         }
         if(v1.metaEquipement.modelEquipement.id < 0)
         {
            return;
         }
         this._descriptionScreen.SetMetaEquipement(v1.metaEquipement);
         this._descriptionScreen.Show();
         v1.visual.addEventListener(MouseEvent.MOUSE_OUT,this.onRollOut);
      }
      
      override public function Update() : void
      {
         super.Update();
         for(var i:int = 0; i < views.length; i++)
         {
            (views[i] as EquipementView).Update();
         }
         this._scrollBarPanelView.Update();
      }
      
      private function Clear() : void
      {
         var e:EquipementView = null;
         for(var m:int = 0; m < views.length; m++)
         {
            e = views[m] as EquipementView;
            e.visual.removeEventListener(MouseEvent.MOUSE_OVER,this.onRollOverItem);
            e.Destroy();
         }
      }
      
      public function get viewSquare() : MovieClip
      {
         return visual.getChildByName("viewSquare") as MovieClip;
      }
      
      public function Init(group:Vector.<MetaEquipement>) : void
      {
         if(!this._descriptionScreen)
         {
            this._descriptionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ITEMDESCRIPTION_SCREEN,false,true) as ItemDescriptionScreen;
            this._descriptionScreen.Hide();
         }
         this.Clear();
         this.BuildView(group);
         for(var i:int = 0; i < group.length; i++)
         {
            this._totalItem[i] = group[i];
         }
      }
      
      private function onRollOut(event:MouseEvent) : void
      {
         this._descriptionScreen.Hide();
      }
      
      private function BuildView(v:Vector.<MetaEquipement>) : void
      {
         var e:EquipementViewSquare = null;
         for(var i:int = 0; i < v.length; i++)
         {
            e = new EquipementViewSquare(AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_EQUIPEMENTVIEWSQUARE));
            AddView(new EquipementView(e.visualMc));
            this._scrollBarPanelView.Add(e);
         }
         for(i = 0; i < views.length; i++)
         {
            (views[i] as EquipementView).visual.addEventListener(MouseEvent.MOUSE_OVER,this.onRollOverItem);
            (views[i] as EquipementView).setMetaEquipement(v[i]);
         }
         this._scrollBarPanelView.Refresh();
      }
   }
}

