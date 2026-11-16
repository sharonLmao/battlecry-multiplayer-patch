package com.battlecry.screens.view
{
   import com.battlecry.BedUtil.ScrollBarPanelView;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.screens.ArmyCreationScreen;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.UnitDescriptionScreen;
   import com.battlecry.screens.Units.UnitView;
   import com.battlecry.screens.view.scrollItem.InventoryUnitViewSquare;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.screens.ScreenManager;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class UnitGroupView extends BC_ObjectGroupView
   {
      
      private var _scrollBarPanelView:ScrollBarPanelView;
      
      private var _selectedMetaUnit:BC_MetaUnit;
      
      private var _armyCreationScreen:ArmyCreationScreen;
      
      private var _descriptionScreen:UnitDescriptionScreen;
      
      private var _onSelection:Boolean;
      
      private var _totalUnit:Vector.<BC_MetaUnit> = new Vector.<BC_MetaUnit>();
      
      public function UnitGroupView(visual:MovieClip, armyCreationScreen:ArmyCreationScreen)
      {
         super(visual);
         this._selectedMetaUnit = new BC_MetaUnit(-1);
         this._armyCreationScreen = armyCreationScreen;
         this._scrollBarPanelView = new ScrollBarPanelView(visual);
         this._scrollBarPanelView.Init(1,0,false);
         this._scrollBarPanelView.Refresh();
         this._onSelection = false;
         this._descriptionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_UNITDESCRIPTION_SCREEN,false,true) as UnitDescriptionScreen;
         this._descriptionScreen.Hide();
      }
      
      public function SetGroupUnit(group:Vector.<BC_MetaUnit>) : void
      {
         while(this._totalUnit.length > 0)
         {
            this._totalUnit.shift();
         }
         for(var i:int = 0; i < group.length; i++)
         {
            this._totalUnit[i] = group[i];
         }
         this.Clear();
         this.BuildView(group);
         this._scrollBarPanelView.Filter();
         this.CheckOffsetUnit();
      }
      
      public function RefreshText() : void
      {
         for(var i:int = 0; i < views.length; i++)
         {
            (views[i] as UnitView).RefreshText();
         }
      }
      
      private function onClick(event:MouseEvent) : void
      {
         visual.stage.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this._onSelection = true;
      }
      
      public function set selectedMetaUnit(selectedMetaUnit:BC_MetaUnit) : void
      {
         this._selectedMetaUnit = selectedMetaUnit;
      }
      
      private function BuildView(v:Vector.<BC_MetaUnit>) : void
      {
         var e:InventoryUnitViewSquare = null;
         for(var i:int = 0; i < v.length; i++)
         {
            e = new InventoryUnitViewSquare(AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_INVENTORYVIEWSQUARE));
            AddView(new UnitView(e.visualMc,true));
            this._scrollBarPanelView.Add(e);
         }
         for(i = 0; i < views.length; i++)
         {
            (views[i] as UnitView).visual.addEventListener(MouseEvent.MOUSE_OVER,this.onRollOverUnit);
            (views[i] as UnitView).visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
            (views[i] as UnitView).SetMetaUnit(v[i]);
            (views[i] as UnitView).SetIdle();
         }
      }
      
      private function onRollOverUnit(event:MouseEvent) : void
      {
         if(this._onSelection)
         {
            return;
         }
         var mc:MovieClip = event.target as MovieClip;
         var v1:UnitView = GetViewFromVisual(mc) as UnitView;
         if(v1.metaUnit.id == -1)
         {
            return;
         }
         this._descriptionScreen.SetView(v1);
         this._descriptionScreen.Show();
         v1.visual.addEventListener(MouseEvent.MOUSE_OUT,this.onRollOut);
      }
      
      private function onUp(event:MouseEvent) : void
      {
         visual.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this._onSelection = false;
      }
      
      public function returnUnit(unitView:UnitView) : void
      {
         if(unitView.metaUnit.id == -1)
         {
            return;
         }
         for(var i:int = 0; i < views.length; i++)
         {
            if((views[i] as UnitView).metaUnit.id == unitView.metaUnit.id)
            {
               ++(views[i] as UnitView).metaUnit.quantity;
            }
         }
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.Clear();
         if(this._descriptionScreen)
         {
            this._descriptionScreen.close();
         }
         this._scrollBarPanelView.Destroy();
      }
      
      public function SetSelectView(metaUnit:BC_MetaUnit) : void
      {
         var m:BC_MetaUnit = null;
         for(var i:int = 0; i < views.length; i++)
         {
            (views[i] as UnitView).HideInventoryHighLight();
            m = (views[i] as UnitView).metaUnit;
            if(m.id == metaUnit.id)
            {
               this._selectedMetaUnit = m;
               this.HighLightSelection(this._selectedMetaUnit);
               this._armyCreationScreen.ActivateEdit();
               return;
            }
         }
         this._selectedMetaUnit = BC_MetaUnit.EMPTY_UNIT;
         this._armyCreationScreen.DeActivateEdit();
      }
      
      public function get selectedMetaUnit() : BC_MetaUnit
      {
         return this._selectedMetaUnit;
      }
      
      override public function Update() : void
      {
         super.Update();
         for(var i:int = 0; i < views.length; i++)
         {
            (views[i] as UnitView).Update();
         }
         this._scrollBarPanelView.Update();
      }
      
      private function Clear() : void
      {
         this._scrollBarPanelView.removeAll();
         while(views.length > 0)
         {
            (views[0] as UnitView).visual.removeEventListener(MouseEvent.MOUSE_OVER,this.onRollOverUnit);
            (views[0] as UnitView).visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
            (views[0] as UnitView).Destroy();
            RemoveView(views[0]);
         }
      }
      
      private function onRollOut(event:MouseEvent) : void
      {
         this._descriptionScreen.Hide();
      }
      
      public function Init(group:Vector.<BC_MetaUnit>) : void
      {
         this.Clear();
         this.BuildView(group);
         for(var i:int = 0; i < group.length; i++)
         {
            this._totalUnit[i] = group[i];
         }
         this.CheckOffsetUnit();
      }
      
      public function HighLightSelection(metaUnit:BC_MetaUnit) : void
      {
         var u:UnitView = null;
         for(var i:int = 0; i < views.length; i++)
         {
            u = views[i];
            u.HideInventoryHighLight();
            if(u.metaUnit.id >= 0)
            {
               if(u.metaUnit.id == metaUnit.id)
               {
                  u.ShowInventoryHighLight();
               }
            }
         }
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.RefreshText();
         this.CheckOffsetUnit();
      }
      
      private function CheckOffsetUnit() : void
      {
         var u:UnitView = null;
         for(var i:int = 0; i < views.length; i++)
         {
            u = views[i] as UnitView;
            if(u.metaUnit.playerEquipement.creatureEquip.isArtillery6Case())
            {
               u.OffSet(15,-15);
               u.animContainer.scaleX = 1;
               u.animContainer.scaleY = 1;
            }
            else if(u.metaUnit.playerEquipement.creatureEquip.isArtillery3Case())
            {
               u.OffSet(10,0);
               u.animContainer.scaleX = 1;
               u.animContainer.scaleY = 1;
            }
            else if(u.metaUnit.playerEquipement.creatureEquip.isArtillery9Case())
            {
               u.OffSet(5,-13);
               u.animContainer.scaleX = 0.4;
               u.animContainer.scaleY = 0.4;
            }
            else
            {
               u.OffSet(0,0);
               u.animContainer.scaleX = 1;
               u.animContainer.scaleY = 1;
            }
         }
      }
   }
}

