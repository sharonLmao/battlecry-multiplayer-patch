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
   
   public class CreatureInventoryView extends BC_ObjectGroupView
   {
      
      private var _scrollBarPanelView:ScrollBarPanelView;
      
      private var _unitCreateView:UnitCreateView;
      
      private var _descriptionScreen:ItemDescriptionScreen;
      
      private var _onSelection:Boolean;
      
      private var _totalCreature:Vector.<MetaEquipement> = new Vector.<MetaEquipement>();
      
      public function CreatureInventoryView(visual:MovieClip, unitCreateView:UnitCreateView)
      {
         super(visual);
         this._unitCreateView = unitCreateView;
         this._scrollBarPanelView = new ScrollBarPanelView(visual);
         this._scrollBarPanelView.Init(2,2,true);
         this._onSelection = false;
         this._descriptionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ITEMDESCRIPTION_SCREEN,false,true) as ItemDescriptionScreen;
         this._descriptionScreen.Hide();
      }
      
      private function ResetTotalItem(group:Vector.<MetaEquipement>) : void
      {
         var length:int = 0;
         for(var i:int = 0; i < length; i++)
         {
            this._totalCreature.shift();
         }
         for(var j:int = 0; j < group.length; j++)
         {
            this._totalCreature[j] = group[j];
         }
      }
      
      private function onUp(event:MouseEvent) : void
      {
         visual.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this._onSelection = false;
      }
      
      override public function Destroy() : void
      {
         for(var m:int = 0; m < views.length; m++)
         {
            (views[m] as EquipementView).visual.removeEventListener(MouseEvent.MOUSE_OVER,this.onRollOverUnit);
            (views[m] as EquipementView).visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
         }
         if(this._descriptionScreen)
         {
            ScreenManager.instance.RemoveScreen(this._descriptionScreen);
         }
         this._scrollBarPanelView.Destroy();
         super.Destroy();
      }
      
      private function Clear() : void
      {
         var length:int = int(views.length);
         for(var m:int = 0; m < length; m++)
         {
            (views[0] as EquipementView).visual.removeEventListener(MouseEvent.MOUSE_OVER,this.onRollOverUnit);
            (views[0] as EquipementView).visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
            RemoveView(views[0]);
         }
         this._scrollBarPanelView.removeAll();
      }
      
      public function Init(group:Vector.<MetaEquipement>) : void
      {
         for(var i:int = 0; i < group.length; i++)
         {
            this._totalCreature[i] = group[i];
         }
      }
      
      private function onRollOverUnit(event:MouseEvent) : void
      {
         if(this._onSelection)
         {
            return;
         }
         var mc:MovieClip = event.target as MovieClip;
         var v1:EquipementView = GetViewFromVisual(mc) as EquipementView;
         if(v1 == null)
         {
            v1 = GetViewFromVisual(mc.parent as MovieClip) as EquipementView;
            if(v1 == null)
            {
               return;
            }
         }
         if(v1.metaEquipement.modelEquipement.id == -1)
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
      
      public function SetGroupItem(group:Vector.<MetaEquipement>) : void
      {
         this.Clear();
         this.BuildView(group);
         this.ResetTotalItem(group);
         this._scrollBarPanelView.Filter();
         this._scrollBarPanelView.Refresh();
      }
      
      private function onClick(event:MouseEvent) : void
      {
         visual.stage.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this._onSelection = true;
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
            (views[i] as EquipementView).visual.addEventListener(MouseEvent.MOUSE_OVER,this.onRollOverUnit);
            (views[i] as EquipementView).visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
            (views[i] as EquipementView).setMetaEquipement(v[i]);
         }
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         for(var i:int = 0; i < views.length; i++)
         {
            (views[i] as EquipementView).btn_Equipment.Deselect();
            if((views[i] as EquipementView).metaEquipement.quantity <= 0 || this._unitCreateView.metaUnit.IsEquipped((views[i] as EquipementView).metaEquipement))
            {
               (views[i] as EquipementView).btn_Equipment.Select();
            }
         }
         this._scrollBarPanelView.Refresh();
      }
      
      public function get CreatureDropZone() : MovieClip
      {
         return visual.getChildByName("CreatureDropZone") as MovieClip;
      }
   }
}

