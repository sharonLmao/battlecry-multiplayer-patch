package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.screens.view.ItemTransferView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.KeyManager;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   
   public class UnitCreationScreen extends BC_Screen
   {
      
      private var _editUnit:BC_MetaUnit;
      
      private var _editQuantity:int;
      
      private var _startMetaUnit:BC_MetaUnit;
      
      private var _itemTransferView:ItemTransferView;
      
      private var _edit:Boolean;
      
      private var _motherScreen:BC_Screen;
      
      private var _init:Boolean;
      
      private var _filterType:ButtonSelectGroup;
      
      private var _backUpI:int;
      
      public function UnitCreationScreen()
      {
         super();
      }
      
      private function onSave(event:MouseEvent) : void
      {
         var q:QuestionScreen = null;
         var nbrUnitScreen:NbrUnitScreen = null;
         if(!this._itemTransferView.CheckCreatureEquip())
         {
            if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_QUESTION_SCREEN) > 0)
            {
               return;
            }
            q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
            q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_NEED_CREATURE));
            return;
         }
         if(this._itemTransferView.CheckAnyEquip())
         {
            nbrUnitScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_NBRUNIT_SCREEN) as NbrUnitScreen;
            nbrUnitScreen.SetInfo(this._motherScreen,this,this._backUpI);
            this._itemTransferView.getPlayerUnit().unitName = this._itemTransferView.getCreatedUnitName();
            nbrUnitScreen.SetMetaUnit(this._itemTransferView.getPlayerUnit());
         }
      }
      
      public function Back() : void
      {
         this._motherScreen.Show();
         Hide();
      }
      
      public function get edit() : Boolean
      {
         return this._edit;
      }
      
      public function get btnUnitBack() : ButtonSelect
      {
         return this.LeftPanel.getChildByName("btn_UnitBack") as ButtonSelect;
      }
      
      public function get btnArmors() : ButtonSelect
      {
         return this.RightPanel.getChildByName("btn_UnitCreationArmors") as ButtonSelect;
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         super.ShowIdle(context);
         if(!this._init)
         {
            this._init = true;
         }
      }
      
      private function onFilterType(event:MouseEvent) : void
      {
         var b:ButtonSelect = event.target as ButtonSelect;
         this._filterType.SelectButton(b);
         this._itemTransferView.filterInventory(b);
         this._itemTransferView.Refresh();
      }
      
      public function set edit(edit:Boolean) : void
      {
         this._edit = edit;
      }
      
      override public function Show() : void
      {
         super.Show();
      }
      
      public function get btn_PrevRarity() : ButtonSelect
      {
         return this.RightPanel.getChildByName("btn_PrevRarity") as ButtonSelect;
      }
      
      public function setCreateUnit(metaUnit:BC_MetaUnit) : void
      {
         this._startMetaUnit.Copy(metaUnit);
         this._filterType.SelectButton(this.btnAll);
         this._itemTransferView.filterInventory(this._filterType.selectedButton);
         this._itemTransferView.setCreateUnit(metaUnit);
      }
      
      public function get LeftPanel() : MovieClip
      {
         return visual.getChildByName("LeftPanel") as MovieClip;
      }
      
      public function get btnAll() : ButtonSelect
      {
         return this.RightPanel.getChildByName("btn_UnitCreationAll") as ButtonSelect;
      }
      
      public function get btnShields() : ButtonSelect
      {
         return this.RightPanel.getChildByName("btn_UnitCreationShields") as ButtonSelect;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         Main.instance.ClearAllCaches();
         this._edit = false;
         this._editQuantity = 0;
         this._editUnit = new BC_MetaUnit(-1);
         this._startMetaUnit = new BC_MetaUnit(-1);
         this._init = false;
         this._itemTransferView = new ItemTransferView(visual,context as BC_Game);
         this._itemTransferView.Init();
         InitOkBtn(this.btnUnitBack);
         this.btnUnitBack.addEventListener(MouseEvent.MOUSE_DOWN,this.onBack);
         InitOkBtn(this.btnSave);
         this.btnSave.addEventListener(MouseEvent.MOUSE_DOWN,this.onSave);
         InitOkBtn(this.btnUnequip);
         this.btnUnequip.addEventListener(MouseEvent.MOUSE_DOWN,this.onUnequip);
         InitOkBtn(this.btnAll);
         this.btnAll.addEventListener(MouseEvent.MOUSE_DOWN,this.onFilterType);
         InitOkBtn(this.btnWeapons);
         this.btnWeapons.addEventListener(MouseEvent.MOUSE_DOWN,this.onFilterType);
         InitOkBtn(this.btnShields);
         this.btnShields.addEventListener(MouseEvent.MOUSE_DOWN,this.onFilterType);
         InitOkBtn(this.btnArmors);
         this.btnArmors.addEventListener(MouseEvent.MOUSE_DOWN,this.onFilterType);
         InitOkBtn(this.btnSpecials);
         this.btnSpecials.addEventListener(MouseEvent.MOUSE_DOWN,this.onFilterType);
         InitOkBtn(this.btn_PrevRarity);
         this.btn_PrevRarity.addEventListener(MouseEvent.MOUSE_DOWN,this.onPrevRarity);
         InitOkBtn(this.btn_NextRarity);
         this.btn_NextRarity.addEventListener(MouseEvent.MOUSE_DOWN,this.onNextRarity);
         this._filterType = new ButtonSelectGroup();
         this._filterType.AddButton(this.btnAll);
         this._filterType.AddButton(this.btnWeapons);
         this._filterType.AddButton(this.btnShields);
         this._filterType.AddButton(this.btnArmors);
         this._filterType.AddButton(this.btnSpecials);
         this._filterType.SelectButton(this.btnAll);
         animation.playChildren = false;
      }
      
      public function get editUnit() : BC_MetaUnit
      {
         return this._editUnit;
      }
      
      public function setInfo(motherScreen:BC_Screen) : void
      {
         this._motherScreen = motherScreen;
      }
      
      public function get btnUnequip() : ButtonSelect
      {
         return this.LeftPanel.getChildByName("btn_unequip") as ButtonSelect;
      }
      
      private function onNextRarity(event:MouseEvent) : void
      {
         this._itemTransferView.NextRarity();
      }
      
      public function Compare(startMetaUnit:BC_MetaUnit, currentMetaUnit:BC_MetaUnit) : Boolean
      {
         if(startMetaUnit.playerEquipement.creatureEquip.modelEquipement.id != currentMetaUnit.playerEquipement.creatureEquip.modelEquipement.id)
         {
            return true;
         }
         if(startMetaUnit.playerEquipement.weaponEquip.modelEquipement.id != currentMetaUnit.playerEquipement.weaponEquip.modelEquipement.id)
         {
            return true;
         }
         if(startMetaUnit.playerEquipement.shieldEquip.modelEquipement.id != currentMetaUnit.playerEquipement.shieldEquip.modelEquipement.id)
         {
            return true;
         }
         if(startMetaUnit.playerEquipement.armorEquip.modelEquipement.id != currentMetaUnit.playerEquipement.armorEquip.modelEquipement.id)
         {
            return true;
         }
         if(startMetaUnit.playerEquipement.specialEquip.modelEquipement.id != currentMetaUnit.playerEquipement.specialEquip.modelEquipement.id)
         {
            return true;
         }
         return false;
      }
      
      public function set itemTransferView(itemTransferView:ItemTransferView) : void
      {
         this._itemTransferView = itemTransferView;
      }
      
      public function EditUnit(metaUnit:BC_MetaUnit, backUpUnit:BC_MetaUnit, backUpI:int) : void
      {
         this._startMetaUnit.Copy(backUpUnit);
         this._edit = true;
         this._editQuantity = backUpUnit.quantity;
         this._editUnit.Copy(backUpUnit);
         this._backUpI = backUpI;
         this._filterType.SelectButton(this.btnAll);
         this._itemTransferView.filterInventory(this._filterType.selectedButton);
         this._itemTransferView.EditUnit(metaUnit,backUpUnit);
      }
      
      private function DontSave() : void
      {
         this.Close(true,null,false);
      }
      
      public function get btnSpecials() : ButtonSelect
      {
         return this.RightPanel.getChildByName("btn_UnitCreationSpecials") as ButtonSelect;
      }
      
      override public function Close(remove:Boolean, c:Callback, quickClose:Boolean) : void
      {
         super.Close(remove,c,quickClose);
         if(this._edit)
         {
            (this._motherScreen as ArmyCreationScreen).EditBack(this._editUnit,this._editQuantity);
         }
         this._edit = false;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._itemTransferView.Destroy();
         this._filterType.Destroy();
         Hide();
         this.btnUnitBack.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBack);
         this.btnSave.removeEventListener(MouseEvent.MOUSE_DOWN,this.onSave);
         this.btnUnequip.removeEventListener(MouseEvent.MOUSE_DOWN,this.onUnequip);
         this.btnAll.removeEventListener(MouseEvent.MOUSE_DOWN,this.onFilterType);
         this.btnWeapons.removeEventListener(MouseEvent.MOUSE_DOWN,this.onFilterType);
         this.btnShields.removeEventListener(MouseEvent.MOUSE_DOWN,this.onFilterType);
         this.btnArmors.removeEventListener(MouseEvent.MOUSE_DOWN,this.onFilterType);
         this.btnSpecials.removeEventListener(MouseEvent.MOUSE_DOWN,this.onFilterType);
         this.btn_PrevRarity.removeEventListener(MouseEvent.MOUSE_DOWN,this.onPrevRarity);
         this.btn_NextRarity.removeEventListener(MouseEvent.MOUSE_DOWN,this.onNextRarity);
      }
      
      public function get btnWeapons() : ButtonSelect
      {
         return this.RightPanel.getChildByName("btn_UnitCreationWeapons") as ButtonSelect;
      }
      
      public function get btn_NextRarity() : ButtonSelect
      {
         return this.RightPanel.getChildByName("btn_NextRarity") as ButtonSelect;
      }
      
      public function set editUnit(editUnit:BC_MetaUnit) : void
      {
         this._editUnit = editUnit;
      }
      
      private function onBack(event:MouseEvent) : void
      {
         var s:QuestionScreen = null;
         if(this.Compare(this._startMetaUnit,this._itemTransferView.unitCreateView.metaUnit))
         {
            if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_QUESTION_SCREEN) > 0)
            {
               return;
            }
            s = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
            s.setInfo(QuestionScreen.TYPE_YES_NO,TextFactory.instance.GetMsg(BC_TextFactory.ID_AREYOUSURE_NO_SAVE),new Callback(this.DontSave,this,null));
         }
         else
         {
            this.Close(true,null,false);
         }
      }
      
      private function onUnequip(event:MouseEvent) : void
      {
         this._itemTransferView.UnequipAll();
      }
      
      public function get RightPanel() : MovieClip
      {
         return visual.getChildByName("RightPanel") as MovieClip;
      }
      
      public function get itemTransferView() : ItemTransferView
      {
         return this._itemTransferView;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         this._itemTransferView.Update();
         if(KeyManager.IsKeyDown(Keyboard.ENTER) && ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_QUESTION_SCREEN) <= 0 && ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_NBRUNIT_SCREEN) <= 0)
         {
            this.onSave(null);
         }
      }
      
      public function get btnSave() : ButtonSelect
      {
         return this.LeftPanel.getChildByName("btn_save") as ButtonSelect;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_UNITCREATION_SCREEN);
      }
      
      private function onPrevRarity(event:MouseEvent) : void
      {
         this._itemTransferView.PrevRarity();
      }
   }
}

