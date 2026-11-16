package com.battlecry.screens.view
{
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.ItemDescriptionScreen;
   import com.lachhhEngine.games.screens.ScreenManager;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class ItemRewardView extends BC_ObjectGroupView
   {
      
      private var _descriptionScreen:ItemDescriptionScreen;
      
      private var _totalItem:Vector.<MetaEquipement> = new Vector.<MetaEquipement>();
      
      public function ItemRewardView(visual:MovieClip)
      {
         super(visual);
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
      }
      
      public function get unit0() : MovieClip
      {
         return visual.getChildByName("unit0") as MovieClip;
      }
      
      private function Clear() : void
      {
         var e:EquipementView = null;
         for(var m:int = 0; m < views.length; m++)
         {
            e = views[m] as EquipementView;
            e.visual.removeEventListener(MouseEvent.MOUSE_OVER,this.onRollOverItem);
         }
      }
      
      public function get unit2() : MovieClip
      {
         return visual.getChildByName("unit2") as MovieClip;
      }
      
      public function get unit3() : MovieClip
      {
         return visual.getChildByName("unit3") as MovieClip;
      }
      
      public function Init(group:Vector.<MetaEquipement>) : void
      {
         visualMc.gotoAndStop(group.length);
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
      
      public function get unit5() : MovieClip
      {
         return visual.getChildByName("unit5") as MovieClip;
      }
      
      private function onRollOut(event:MouseEvent) : void
      {
         this._descriptionScreen.Hide();
      }
      
      public function get unit1() : MovieClip
      {
         return visual.getChildByName("unit1") as MovieClip;
      }
      
      private function BuildView(v:Vector.<MetaEquipement>) : void
      {
         var e:EquipementView = null;
         var a:Array = new Array(this.unit0,this.unit1,this.unit2,this.unit3,this.unit4,this.unit5);
         for(var i:int = 0; i < v.length; i++)
         {
            e = new EquipementView(a[i]);
            AddView(e);
            e.setMetaEquipement(v[i]);
            e.visual.addEventListener(MouseEvent.MOUSE_OVER,this.onRollOverItem);
         }
      }
      
      override public function Destroy() : void
      {
         this.Clear();
         super.Destroy();
         ScreenManager.instance.RemoveScreen(this._descriptionScreen);
      }
      
      public function get unit4() : MovieClip
      {
         return visual.getChildByName("unit4") as MovieClip;
      }
   }
}

