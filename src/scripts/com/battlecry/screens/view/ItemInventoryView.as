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
   
   public class ItemInventoryView extends BC_ObjectGroupView
   {
      
      private var _scrollBarPanelView:ScrollBarPanelView;
      
      private var _descriptionScreen:ItemDescriptionScreen;
      
      private var _itemFilter:Vector.<MetaEquipement> = new Vector.<MetaEquipement>();
      
      private var _unitCreateView:UnitCreateView;
      
      private var _filterRarity:int;
      
      private var _onSelection:Boolean;
      
      private var _filterType:int;
      
      private var _totalItem:Vector.<MetaEquipement> = new Vector.<MetaEquipement>();
      
      public function ItemInventoryView(visual:MovieClip, unitCreateView:UnitCreateView)
      {
         super(visual);
         this._unitCreateView = unitCreateView;
         this._scrollBarPanelView = new ScrollBarPanelView(visual);
         this._scrollBarPanelView.Init(5,2,true,5);
         this._onSelection = false;
         this._descriptionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ITEMDESCRIPTION_SCREEN,false,true) as ItemDescriptionScreen;
         this._descriptionScreen.Hide();
         this._filterType = 0;
         this._filterRarity = 0;
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
      
      private function ResetTotalItem(group:Vector.<MetaEquipement>) : void
      {
         var length:int = 0;
         for(var i:int = 0; i < length; i++)
         {
            this._totalItem.shift();
         }
         for(var j:int = 0; j < group.length; j++)
         {
            this._totalItem[j] = group[j];
         }
      }
      
      public function get ItemDropZone() : MovieClip
      {
         return visual.getChildByName("ItemDropZone") as MovieClip;
      }
      
      public function SetGroupItem(group:Vector.<MetaEquipement>) : void
      {
         this.Clear();
         this.BuildView(group);
         this.ResetTotalItem(group);
         this._scrollBarPanelView.Filter();
         this._scrollBarPanelView.Refresh();
      }
      
      private function CheckFilterRarity(rarity:int) : Boolean
      {
         if(this._filterRarity == 0 || rarity == this._filterRarity)
         {
            return true;
         }
         return false;
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
      
      private function onUp(event:MouseEvent) : void
      {
         visual.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this._onSelection = false;
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
         this.SetFilter(0);
         for(var i:int = 0; i < this._totalItem.length; i++)
         {
            this._scrollBarPanelView.Show((views[i] as EquipementView).visual as MovieClip);
         }
         this._scrollBarPanelView.Destroy();
         super.Destroy();
      }
      
      public function SetFilterRarity(rarity:int) : void
      {
         this._filterRarity = rarity;
         this.ShowFilter();
         this._scrollBarPanelView.Filter();
      }
      
      private function onClick(event:MouseEvent) : void
      {
         visual.stage.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this._onSelection = true;
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
      
      private function onRollOut(event:MouseEvent) : void
      {
         this._descriptionScreen.Hide();
      }
      
      private function ShowFilter() : void
      {
         for(var k:int = int(this._itemFilter.length); k > 0; k--)
         {
            this._itemFilter.shift();
         }
         for(var i:int = 0; i < views.length; i++)
         {
            this._scrollBarPanelView.Hide((views[i] as EquipementView).visual as MovieClip);
            if(this.CheckFilterRarity(this._totalItem[i].modelEquipement.rarity) && (this._totalItem[i].modelEquipement.type == this._filterType || this._filterType == 0))
            {
               this._itemFilter.push(this._totalItem[i]);
            }
            else
            {
               (views[i] as EquipementView).setMetaEquipement(MetaEquipement.EMPTY_EQUIPEMENT);
            }
         }
         for(var j:int = 0; j < this._itemFilter.length; j++)
         {
            (views[j] as EquipementView).setMetaEquipement(this._itemFilter[j]);
            this._scrollBarPanelView.Show((views[j] as EquipementView).visual as MovieClip);
         }
      }
      
      public function Init(group:Vector.<MetaEquipement>) : void
      {
         for(var i:int = 0; i < group.length; i++)
         {
            this._totalItem[i] = group[i];
         }
         this.SetFilter(0);
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
      
      public function SetFilter(type:int) : void
      {
         this._filterType = type;
         this.ShowFilter();
         this._scrollBarPanelView.Filter();
      }
   }
}

