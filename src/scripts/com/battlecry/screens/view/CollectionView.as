package com.battlecry.screens.view
{
   import com.battlecry.BedUtil.ScrollBarPanelView;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelEquipementEnum;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.ItemDescriptionScreen;
   import com.battlecry.screens.view.scrollItem.EquipementViewSquare;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class CollectionView extends BC_ObjectGroupView
   {
      
      private var _scrollBarPanelView:ScrollBarPanelView;
      
      private var _descriptionScreen:ItemDescriptionScreen;
      
      private var _filterItem:Vector.<MetaEquipement> = new Vector.<MetaEquipement>();
      
      private var _buttonSelectGroup:ButtonSelectGroup;
      
      private var _craftView:CraftView;
      
      private var _filterRarity:int;
      
      private var _filterType:int;
      
      private var _totalItem:Vector.<MetaEquipement> = new Vector.<MetaEquipement>();
      
      public function CollectionView(visual:MovieClip, craftView:CraftView)
      {
         super(visual);
         this._craftView = craftView;
         this._scrollBarPanelView = new ScrollBarPanelView(visual);
         this._scrollBarPanelView.Init(5,5,true,5,0);
         this._scrollBarPanelView.Refresh();
         this._filterType = 0;
         this._filterRarity = 0;
         this._buttonSelectGroup = new ButtonSelectGroup();
         this._descriptionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ITEMDESCRIPTION_SCREEN,false,true) as ItemDescriptionScreen;
         this._descriptionScreen.Hide();
      }
      
      override public function Update() : void
      {
         super.Update();
         this._scrollBarPanelView.Update();
      }
      
      public function filterInventoryRarity(b:ButtonSelect, setType:int) : void
      {
         this._craftView.Clear();
         switch(b.name)
         {
            case "btn_commun":
               this.SetFilterRarity(ModelEquipement.RARITY_COMMUN,setType);
               break;
            case "btn_uncommun":
               this.SetFilterRarity(ModelEquipement.RARITY_UNCOMMUN,setType);
               break;
            case "btn_rare":
               this.SetFilterRarity(ModelEquipement.RARITY_RARE,setType);
               break;
            case "btn_legendary":
               this.SetFilterRarity(ModelEquipement.RARITY_LEGENDARY,setType);
               break;
            case "btn_all":
               this.SetFilterRarity(0,setType);
         }
      }
      
      private function BuildView(v:Vector.<MetaEquipement>) : void
      {
         var e:EquipementViewSquare = null;
         for(var i:int = 0; i < v.length; i++)
         {
            e = new EquipementViewSquare(AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_EQUIPEMENTVIEWSQUARECOLLECTION));
            AddView(new CollectionEquipementView(e.visualMc));
            this._scrollBarPanelView.Add(e);
         }
         for(i = 0; i < views.length; i++)
         {
            (views[i] as CollectionEquipementView).visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickItem);
            (views[i] as CollectionEquipementView).visual.addEventListener(MouseEvent.MOUSE_OVER,this.onRollOverItem);
            (views[i] as CollectionEquipementView).setMetaEquipement(v[i]);
            this._buttonSelectGroup.AddButton((views[i] as CollectionEquipementView).btn_Equipment);
         }
         this.RefreshColor();
      }
      
      public function DeselectSelected() : void
      {
         if(this._buttonSelectGroup.selectedButton)
         {
            this._buttonSelectGroup.selectedButton.Deselect();
         }
      }
      
      override public function Destroy() : void
      {
         var e:CollectionEquipementView = null;
         for(var m:int = 0; m < views.length; m++)
         {
            e = views[m] as CollectionEquipementView;
            e.visual.removeEventListener(MouseEvent.MOUSE_OVER,this.onRollOverItem);
            e.visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickItem);
            Utils.SetColor((views[m] as CollectionEquipementView).itemEquipement);
         }
         if(this._descriptionScreen)
         {
            ScreenManager.instance.RemoveScreen(this._descriptionScreen);
         }
         this.SetFilterRarity(0,ModelEquipementEnum.SET_PRIME);
         this.SetFilterType(0,ModelEquipementEnum.SET_PRIME);
         for(var i:int = 0; i < this._totalItem.length; i++)
         {
            this._scrollBarPanelView.Show((views[i] as CollectionEquipementView).visual as MovieClip);
         }
         this._scrollBarPanelView.Destroy();
         super.Destroy();
         Main.instance.ClearAllCaches();
      }
      
      private function onClickItem(event:MouseEvent) : void
      {
         var mc:MovieClip = event.target as MovieClip;
         var v1:CollectionEquipementView = GetViewFromVisual(mc) as CollectionEquipementView;
         if(v1 == null)
         {
            return;
         }
         if(v1.metaEquipement.modelEquipement.id < 0 || v1.metaEquipement.quantity <= 0)
         {
            return;
         }
         this._buttonSelectGroup.SelectButton(v1.btn_Equipment);
         this._craftView.SetMetaEquipement(v1.metaEquipement);
      }
      
      public function filterInventoryType(b:ButtonSelect, setType:int) : void
      {
         this._craftView.Clear();
         switch(b.name)
         {
            case "btn_creatures":
               this.SetFilterType(ModelEquipement.TYPE_CREATURE,setType);
               break;
            case "btn_weapons":
               this.SetFilterType(ModelEquipement.TYPE_WEAPON,setType);
               break;
            case "btn_shields":
               this.SetFilterType(ModelEquipement.TYPE_SHIELD,setType);
               break;
            case "btn_armors":
               this.SetFilterType(ModelEquipement.TYPE_ARMOR,setType);
               break;
            case "btn_specials":
               this.SetFilterType(ModelEquipement.TYPE_SPECIAL,setType);
               break;
            case "btn_all2":
               this.SetFilterType(0,setType);
         }
      }
      
      private function onRollOverItem(event:MouseEvent) : void
      {
         var mc:MovieClip = event.target as MovieClip;
         var v1:CollectionEquipementView = GetViewFromVisual(mc) as CollectionEquipementView;
         if(v1 == null)
         {
            return;
         }
         if(v1.metaEquipement.modelEquipement.id < 0 || v1.metaEquipement.quantity <= 0)
         {
            return;
         }
         this._descriptionScreen.SetMetaEquipement(v1.metaEquipement);
         this._descriptionScreen.Show();
         v1.visual.addEventListener(MouseEvent.MOUSE_OUT,this.onRollOut);
      }
      
      public function SetFilterRarity(rarity:int, setType:int) : void
      {
         this._filterRarity = rarity;
         this.ShowFilter(setType);
         this.RefreshColor();
         this._scrollBarPanelView.Filter();
      }
      
      public function RefreshColor() : void
      {
         for(var i:int = 0; i < views.length; i++)
         {
            if((views[i] as CollectionEquipementView).metaEquipement.quantity <= 0)
            {
               (views[i] as CollectionEquipementView).btn_Equipment.Select();
               Utils.SetColor((views[i] as CollectionEquipementView).itemEquipement,-255,-255,-255);
               (views[i] as CollectionEquipementView).quantity_BlackBack.visible = false;
               (views[i] as CollectionEquipementView).quantityTxt.visible = false;
            }
            else
            {
               (views[i] as CollectionEquipementView).btn_Equipment.Deselect();
               Utils.SetColor((views[i] as CollectionEquipementView).itemEquipement);
               (views[i] as CollectionEquipementView).quantity_BlackBack.visible = true;
               (views[i] as CollectionEquipementView).quantityTxt.visible = true;
            }
         }
      }
      
      private function CheckFilterRarity(rarity:int) : Boolean
      {
         if(this._filterRarity == 0 || rarity == this._filterRarity)
         {
            return true;
         }
         return false;
      }
      
      private function onRollOut(event:MouseEvent) : void
      {
         this._descriptionScreen.Hide();
      }
      
      public function SetFilterType(type:int, setType:int) : void
      {
         this._filterType = type;
         this.ShowFilter(setType);
         this.RefreshColor();
         this._scrollBarPanelView.Filter();
      }
      
      public function ShowFilter(setType:int) : void
      {
         for(var k:int = int(this._filterItem.length); k > 0; k--)
         {
            this._filterItem.shift();
         }
         for(var i:int = 0; i < this._totalItem.length; i++)
         {
            this._scrollBarPanelView.Hide((views[i] as CollectionEquipementView).visual as MovieClip);
            if(this.CheckFilterRarity(this._totalItem[i].modelEquipement.rarity) && (this._totalItem[i].modelEquipement.type == this._filterType || this._filterType == 0) && (this._totalItem[i].modelEquipement.setType == setType || setType == 0))
            {
               this._filterItem.push(this._totalItem[i]);
            }
            else
            {
               (views[i] as CollectionEquipementView).setMetaEquipement(MetaEquipement.EMPTY_EQUIPEMENT);
            }
         }
         for(var j:int = 0; j < this._filterItem.length; j++)
         {
            (views[j] as CollectionEquipementView).setMetaEquipement(this._filterItem[j]);
            this._scrollBarPanelView.Show((views[j] as CollectionEquipementView).visual as MovieClip);
         }
         this.Refresh();
      }
      
      public function Init(group:Vector.<MetaEquipement>, currentSet:int) : void
      {
         this.Clear();
         this.BuildView(group);
         for(var i:int = 0; i < group.length; i++)
         {
            this._totalItem[i] = group[i];
         }
         this.SetFilterRarity(0,currentSet);
         this.SetFilterType(0,currentSet);
      }
      
      override public function Refresh() : void
      {
         var e:CollectionEquipementView = null;
         super.Refresh();
         for(var m:int = 0; m < views.length; m++)
         {
            e = views[m] as CollectionEquipementView;
            e.Refresh();
         }
         this._scrollBarPanelView.Refresh();
      }
      
      private function Clear() : void
      {
         var e:CollectionEquipementView = null;
         for(var m:int = 0; m < views.length; m++)
         {
            e = views[m] as CollectionEquipementView;
            e.visual.removeEventListener(MouseEvent.MOUSE_OVER,this.onRollOverItem);
            e.visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickItem);
         }
      }
   }
}

