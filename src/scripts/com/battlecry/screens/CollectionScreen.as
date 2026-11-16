package com.battlecry.screens
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.model.ModelBoosterPackEnum;
   import com.battlecry.meta.model.ModelEquipementEnum;
   import com.battlecry.screens.view.CollectionView;
   import com.battlecry.screens.view.CraftView;
   import com.battlecry.screens.view.TopMenuView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class CollectionScreen extends BC_Screen
   {
      
      private var _collectionView:CollectionView;
      
      private var _currentSet:int;
      
      private var _topMenuView:TopMenuView;
      
      private var _filterRarity:ButtonSelectGroup;
      
      private var _craftView:CraftView;
      
      private var _filterType:ButtonSelectGroup;
      
      public function CollectionScreen()
      {
         super();
      }
      
      public function get btnCommun() : ButtonSelect
      {
         return visual.getChildByName("btn_commun") as ButtonSelect;
      }
      
      public function get currentSetTxt() : TextField
      {
         return visual.getChildByName("currentSetTxt") as TextField;
      }
      
      public function get craftView() : MovieClip
      {
         return visual.getChildByName("craftView") as MovieClip;
      }
      
      private function onPreviousSet(event:MouseEvent) : void
      {
         --this._currentSet;
         if(this._currentSet < 0)
         {
            this._currentSet = ModelEquipementEnum.ALL_SET.length - 1;
         }
         this._filterType.SelectButton(this.btnAll);
         this._collectionView.filterInventoryType(this.btnAll,this._currentSet);
         this._filterRarity.SelectButton(this.btnAll2);
         this._collectionView.filterInventoryRarity(this.btnAll2,this._currentSet);
         this._collectionView.ShowFilter(this._currentSet);
         this._collectionView.RefreshColor();
         this.Refresh();
      }
      
      public function get btnSpecials() : ButtonSelect
      {
         return visual.getChildByName("btn_specials") as ButtonSelect;
      }
      
      private function onNextSet(event:MouseEvent) : void
      {
         ++this._currentSet;
         if(this._currentSet > ModelEquipementEnum.ALL_SET.length - 1)
         {
            this._currentSet = 0;
         }
         this._filterType.SelectButton(this.btnAll);
         this._collectionView.filterInventoryType(this.btnAll,this._currentSet);
         this._filterRarity.SelectButton(this.btnAll2);
         this._collectionView.filterInventoryRarity(this.btnAll2,this._currentSet);
         this._collectionView.ShowFilter(this._currentSet);
         this._collectionView.RefreshColor();
         this.Refresh();
      }
      
      public function DeselectSelected() : void
      {
         this._collectionView.DeselectSelected();
         this._collectionView.Refresh();
      }
      
      public function get topMenuView() : MovieClip
      {
         return visual.getChildByName("TopMenuView") as MovieClip;
      }
      
      private function onClickFilterType(event:MouseEvent) : void
      {
         var b:ButtonSelect = event.target as ButtonSelect;
         this._filterType.SelectButton(b);
         this._collectionView.filterInventoryType(b,this._currentSet);
      }
      
      public function get btnRare() : ButtonSelect
      {
         return visual.getChildByName("btn_rare") as ButtonSelect;
      }
      
      public function get btnCreatures() : ButtonSelect
      {
         return visual.getChildByName("btn_creatures") as ButtonSelect;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._collectionView.Destroy();
         this._filterRarity.Destroy();
         this._filterType.Destroy();
         this._topMenuView.Destroy();
         this.btn_PreviousSet.removeEventListener(MouseEvent.MOUSE_DOWN,this.onPreviousSet);
         this.btn_NextSet.removeEventListener(MouseEvent.MOUSE_DOWN,this.onNextSet);
         this.btnAll.removeEventListener(MouseEvent.MOUSE_DOWN,this.clickFilterRarity);
         this.btnCommun.removeEventListener(MouseEvent.MOUSE_DOWN,this.clickFilterRarity);
         this.btnUnCommun.removeEventListener(MouseEvent.MOUSE_DOWN,this.clickFilterRarity);
         this.btnRare.removeEventListener(MouseEvent.MOUSE_DOWN,this.clickFilterRarity);
         this.btnLegendary.removeEventListener(MouseEvent.MOUSE_DOWN,this.clickFilterRarity);
         this.btnAll2.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickFilterType);
         this.btnCreatures.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickFilterType);
         this.btnWeapons.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickFilterType);
         this.btnShields.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickFilterType);
         this.btnArmors.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickFilterType);
         this.btnSpecials.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickFilterType);
      }
      
      public function get collectionView() : MovieClip
      {
         return visual.getChildByName("collectionView") as MovieClip;
      }
      
      public function get btnAll() : ButtonSelect
      {
         return visual.getChildByName("btn_all") as ButtonSelect;
      }
      
      public function get btn_PreviousSet() : ButtonSelect
      {
         return visual.getChildByName("btn_PreviousSet") as ButtonSelect;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         this._collectionView.Update();
         this._craftView.Update();
      }
      
      public function get btnWeapons() : ButtonSelect
      {
         return visual.getChildByName("btn_weapons") as ButtonSelect;
      }
      
      private function clickFilterRarity(event:MouseEvent) : void
      {
         var b:ButtonSelect = event.target as ButtonSelect;
         this._filterRarity.SelectButton(b);
         this._collectionView.filterInventoryRarity(b,this._currentSet);
      }
      
      public function get btn_NextSet() : ButtonSelect
      {
         return visual.getChildByName("btn_NextSet") as ButtonSelect;
      }
      
      public function get btnAll2() : ButtonSelect
      {
         return visual.getChildByName("btn_all2") as ButtonSelect;
      }
      
      public function get btnShields() : ButtonSelect
      {
         return visual.getChildByName("btn_shields") as ButtonSelect;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._currentSet = 0;
         this._topMenuView = new TopMenuView(this.topMenuView,this);
         this._topMenuView.SetCurrentScreen(BC_ScreenFactory.ID_COLLECTION_SCREEN);
         this._filterRarity = new ButtonSelectGroup();
         this._filterType = new ButtonSelectGroup();
         this._craftView = new CraftView(this.craftView,this);
         this._collectionView = new CollectionView(this.collectionView,this._craftView);
         this._collectionView.Init(BC_GameProgress.gameProgess.metaCollection.collectionInventory,this._currentSet);
         this._collectionView.Refresh();
         InitOkBtn(this.btn_PreviousSet);
         this.btn_PreviousSet.addEventListener(MouseEvent.MOUSE_DOWN,this.onPreviousSet);
         InitOkBtn(this.btn_NextSet);
         this.btn_NextSet.addEventListener(MouseEvent.MOUSE_DOWN,this.onNextSet);
         InitOkBtn(this.btnAll);
         this.btnAll.addEventListener(MouseEvent.MOUSE_DOWN,this.clickFilterRarity);
         InitOkBtn(this.btnCommun);
         this.btnCommun.addEventListener(MouseEvent.MOUSE_DOWN,this.clickFilterRarity);
         InitOkBtn(this.btnUnCommun);
         this.btnUnCommun.addEventListener(MouseEvent.MOUSE_DOWN,this.clickFilterRarity);
         InitOkBtn(this.btnRare);
         this.btnRare.addEventListener(MouseEvent.MOUSE_DOWN,this.clickFilterRarity);
         InitOkBtn(this.btnLegendary);
         this.btnLegendary.addEventListener(MouseEvent.MOUSE_DOWN,this.clickFilterRarity);
         InitOkBtn(this.btnAll2);
         this.btnAll2.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickFilterType);
         InitOkBtn(this.btnCreatures);
         this.btnCreatures.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickFilterType);
         InitOkBtn(this.btnWeapons);
         this.btnWeapons.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickFilterType);
         InitOkBtn(this.btnShields);
         this.btnShields.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickFilterType);
         InitOkBtn(this.btnArmors);
         this.btnArmors.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickFilterType);
         InitOkBtn(this.btnSpecials);
         this.btnSpecials.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickFilterType);
         this._filterRarity.AddButton(this.btnAll);
         this._filterRarity.AddButton(this.btnCommun);
         this._filterRarity.AddButton(this.btnUnCommun);
         this._filterRarity.AddButton(this.btnRare);
         this._filterRarity.AddButton(this.btnLegendary);
         this._filterRarity.SelectButton(this.btnAll);
         this._filterType.AddButton(this.btnAll2);
         this._filterType.AddButton(this.btnCreatures);
         this._filterType.AddButton(this.btnWeapons);
         this._filterType.AddButton(this.btnShields);
         this._filterType.AddButton(this.btnArmors);
         this._filterType.AddButton(this.btnSpecials);
         this._filterType.SelectButton(this.btnAll2);
         Jukebox.instance.FadeToMusic(BC_SfxFactory.ID_MUSIC_UI_ARMY);
         this.Refresh();
      }
      
      public function get btnUnCommun() : ButtonSelect
      {
         return visual.getChildByName("btn_uncommun") as ButtonSelect;
      }
      
      public function RefreshCollection() : void
      {
         this._collectionView.Refresh();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         if(ModelEquipementEnum.ALL_SET.length <= 1)
         {
            this.btn_PreviousSet.visible = false;
            this.btn_NextSet.visible = false;
         }
         this.currentSetTxt.text = TextFactory.instance.GetMsg(ModelBoosterPackEnum.ALL_SET_TEXT[this._currentSet]);
         this._topMenuView.Refresh();
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_COLLECTION_SCREEN);
      }
      
      public function get btnArmors() : ButtonSelect
      {
         return visual.getChildByName("btn_armors") as ButtonSelect;
      }
      
      public function get btnLegendary() : ButtonSelect
      {
         return visual.getChildByName("btn_legendary") as ButtonSelect;
      }
   }
}

