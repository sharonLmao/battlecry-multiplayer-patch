package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.enemy.BC_EnemyManager;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.screens.view.ArmyView;
   import com.battlecry.screens.view.TopMenuView;
   import com.battlecry.screens.view.UnitGroupView;
   import com.battlecry.screens.view.UnitTransferView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class ArmyCreationScreen extends BC_Screen
   {
      
      private var _unitTransferView:UnitTransferView;
      
      private var _backupMetaArmy:BC_MetaArmy;
      
      private var _btnArmyGroup:ButtonSelectGroup;
      
      private var _topMenuView:TopMenuView;
      
      private var _init:Boolean;
      
      public function ArmyCreationScreen()
      {
         super();
      }
      
      public function get btn_army1_Activated() : ButtonSelect
      {
         return visual.getChildByName("btn_army1_Activated") as ButtonSelect;
      }
      
      public function get btn_army3_Activated() : ButtonSelect
      {
         return visual.getChildByName("btn_army3_Activated") as ButtonSelect;
      }
      
      public function get btn_army5_Activated() : ButtonSelect
      {
         return visual.getChildByName("btn_army5_Activated") as ButtonSelect;
      }
      
      private function onEdit(event:MouseEvent) : void
      {
         if(this.btnEdit.isSelected || this._unitTransferView.unitGroupView.selectedMetaUnit.id < 0 || this._unitTransferView.metaArmy.unitInventory.length <= 0)
         {
            return;
         }
         var u:UnitCreationScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_UNITCREATION_SCREEN) as UnitCreationScreen;
         u.EditUnit(new BC_MetaUnit(-3),this._unitTransferView.unitGroupView.selectedMetaUnit,this.GetInventoryPos(this._unitTransferView.unitGroupView.selectedMetaUnit,this._unitTransferView.metaArmy.unitInventory));
         u.setInfo(this);
         this._unitTransferView.unitGroupView.SetSelectView(BC_MetaUnit.EMPTY_UNIT);
         this._unitTransferView.pendingUnitView.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
      }
      
      public function get btn_Reset() : ButtonSelect
      {
         return visual.getChildByName("btn_Reset") as ButtonSelect;
      }
      
      public function get btnEdit() : ButtonSelect
      {
         return visual.getChildByName("btn_edit") as ButtonSelect;
      }
      
      public function DeActivateSaveArmy() : void
      {
         this.btn_saveArmy.Select();
      }
      
      public function get btn_army1() : ButtonSelect
      {
         return visual.getChildByName("btn_army1") as ButtonSelect;
      }
      
      public function get btn_army2() : ButtonSelect
      {
         return visual.getChildByName("btn_army2") as ButtonSelect;
      }
      
      public function get btn_army3() : ButtonSelect
      {
         return visual.getChildByName("btn_army3") as ButtonSelect;
      }
      
      public function get btn_army4() : ButtonSelect
      {
         return visual.getChildByName("btn_army4") as ButtonSelect;
      }
      
      public function get btn_army5() : ButtonSelect
      {
         return visual.getChildByName("btn_army5") as ButtonSelect;
      }
      
      public function get Ranking() : TextField
      {
         return this.mcRanking.getChildByName("Ranking") as TextField;
      }
      
      public function get topMenuView() : MovieClip
      {
         return visual.getChildByName("TopMenuView") as MovieClip;
      }
      
      public function get btnCollection() : ButtonSelect
      {
         return visual.getChildByName("collection") as ButtonSelect;
      }
      
      public function get btn_army5_Locked() : ButtonSelect
      {
         return visual.getChildByName("btn_army5_Locked") as ButtonSelect;
      }
      
      override public function Show() : void
      {
         super.Show();
         this._unitTransferView.unitGroupView.selectedMetaUnit = BC_MetaUnit.EMPTY_UNIT;
      }
      
      public function get btnArmy() : ButtonSelect
      {
         return visual.getChildByName("army") as ButtonSelect;
      }
      
      public function get btnNew() : ButtonSelect
      {
         return visual.getChildByName("btn_new") as ButtonSelect;
      }
      
      public function get btnBattleField() : ButtonSelect
      {
         return visual.getChildByName("battlefield") as ButtonSelect;
      }
      
      public function get btnDelete() : ButtonSelect
      {
         return visual.getChildByName("btn_delete") as ButtonSelect;
      }
      
      public function set unitTransferView(unitTransferView:UnitTransferView) : void
      {
         this._unitTransferView = unitTransferView;
      }
      
      private function GetInventoryPos(selectedMetaUnit:BC_MetaUnit, inventory:Vector.<BC_MetaUnit>) : int
      {
         for(var i:int = 0; i < inventory.length; i++)
         {
            if(selectedMetaUnit.id == inventory[i].id)
            {
               return i;
            }
         }
         return 0;
      }
      
      public function get RankingIcon() : MovieClip
      {
         return this.mcRanking.getChildByName("RankingIcon") as MovieClip;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         if(BC_GameProgress.gameProgess.currentVersionInfo != BC_VersionInfo.GetVersion())
         {
         }
         BC_GameProgress.gameProgess.currentVersionInfo = BC_VersionInfo.GetVersion();
         ExternalAPIManager.getPremiumAPI().HideBar();
         BC_EnemyManager.UpdateId();
         this._backupMetaArmy = new BC_MetaArmy(-1);
         this._backupMetaArmy.CopySquad(BC_GameProgress.gameProgess.CurrentSelectedArmy());
         this._unitTransferView = new UnitTransferView(visual,new UnitGroupView(this.UnitSelection,this),new ArmyView(this.armyView),context as BC_Game,this);
         InitOkBtn(this.btn_RenameArmy);
         this.btn_RenameArmy.addEventListener(MouseEvent.MOUSE_DOWN,this.onChangeArmyName);
         this._topMenuView = new TopMenuView(this.topMenuView,this);
         this._topMenuView.SetCurrentScreen(BC_ScreenFactory.ID_ARMYCREATION_SCREEN);
         InitOkBtn(this.btn_army1);
         this.btn_army1.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect1);
         InitOkBtn(this.btn_army1_Activated);
         this.btn_army1_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect1);
         InitOkBtn(this.btn_army2);
         this.btn_army2.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect2);
         InitOkBtn(this.btn_army2_Activated);
         this.btn_army2_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect2);
         InitOkBtn(this.btn_army3);
         this.btn_army3.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect3);
         InitOkBtn(this.btn_army3_Activated);
         this.btn_army3_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect3);
         InitOkBtn(this.btn_army4);
         this.btn_army4.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect4);
         InitOkBtn(this.btn_army4_Activated);
         this.btn_army4_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect4);
         InitOkBtn(this.btn_army5);
         this.btn_army5.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect5);
         InitOkBtn(this.btn_army5_Activated);
         this.btn_army5_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect5);
         InitOkBtn(this.btnNew);
         this.btnNew.addEventListener(MouseEvent.MOUSE_DOWN,this.onNew);
         InitOkBtn(this.btnEdit);
         this.btnEdit.addEventListener(MouseEvent.MOUSE_DOWN,this.onEdit);
         InitOkBtn(this.btnDelete);
         this.btnDelete.addEventListener(MouseEvent.MOUSE_DOWN,this.onDelete);
         InitOkBtn(this.btn_saveArmy);
         this.btn_saveArmy.addEventListener(MouseEvent.MOUSE_DOWN,this.onSaveArmy);
         InitOkBtn(this.btn_Reset);
         this.btn_Reset.addEventListener(MouseEvent.MOUSE_DOWN,this.onReset);
         this.saveArmy.addEventListener(MouseEvent.MOUSE_DOWN,this.onSaveCampaignArmy);
         if(!VersionInfo.debugVersion)
         {
            this.saveArmy.visible = false;
         }
         this._unitTransferView.SetMetaArmy(BC_GameProgress.gameProgess.CurrentSelectedArmy());
         this._unitTransferView.Refresh();
         AddViews(this._unitTransferView);
         this.InitArmyButtons();
         this._init = false;
         this.DeActivateEdit();
         this.Refresh();
         Jukebox.instance.FadeToMusic(BC_SfxFactory.ID_MUSIC_UI_ARMY);
      }
      
      public function EditBack(metaUnit:BC_MetaUnit, quantity:int) : void
      {
         metaUnit.quantity = quantity;
         this._unitTransferView.RemoveItemsFromInventory(metaUnit);
      }
      
      public function get btn_army4_Locked() : ButtonSelect
      {
         return visual.getChildByName("btn_army4_Locked") as ButtonSelect;
      }
      
      private function onReset(event:MouseEvent) : void
      {
         this._unitTransferView.ResetArmy();
         this.CheckActivateSaveArmy();
      }
      
      public function ChangeArmyName(armyName:String) : void
      {
         BC_GameProgress.gameProgess.CurrentSelectedArmy().armyName = armyName;
         BC_Game.instance.Save();
         this.Refresh();
      }
      
      private function onSaveArmy(event:MouseEvent) : void
      {
         if(this.btn_saveArmy.isSelected)
         {
            return;
         }
         BC_Game.instance.Save();
         this._backupMetaArmy.CopySquad(this._unitTransferView.metaArmy);
         this.DeActivateSaveArmy();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated)
         {
            this.mcRanking.visible = true;
         }
         else
         {
            this.mcRanking.visible = false;
         }
         this.Ranking.text = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank + "";
         this.RankingIcon.gotoAndStop(BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank);
         this.armyName.text = BC_GameProgress.gameProgess.CurrentSelectedArmy().armyName;
         this._topMenuView.Refresh();
         this.CheckCheat();
      }
      
      public function ActivateEdit() : void
      {
         this.btnEdit.Deselect();
         this.btnDelete.Deselect();
      }
      
      private function CheckChange(backupMetaArmy:BC_MetaArmy, metaArmy1:BC_MetaArmy) : Boolean
      {
         var i:int = 0;
         var m:BC_MetaUnit = null;
         var m1:BC_MetaUnit = null;
         if(backupMetaArmy.metaSquad1.speed.id != metaArmy1.metaSquad1.speed.id || backupMetaArmy.metaSquad2.speed.id != metaArmy1.metaSquad2.speed.id || backupMetaArmy.metaSquad3.speed.id != metaArmy1.metaSquad3.speed.id || backupMetaArmy.metaSquad4.speed.id != metaArmy1.metaSquad4.speed.id || backupMetaArmy.metaSquad5.speed.id != metaArmy1.metaSquad5.speed.id)
         {
            return true;
         }
         for(i = 0; i < backupMetaArmy.metaSquad1.unitVector.length; i++)
         {
            m = backupMetaArmy.metaSquad1.unitVector[i];
            m1 = metaArmy1.metaSquad1.unitVector[i];
            if(m.id != m1.id)
            {
               return true;
            }
         }
         for(i = 0; i < backupMetaArmy.metaSquad2.unitVector.length; i++)
         {
            m = backupMetaArmy.metaSquad2.unitVector[i];
            m1 = metaArmy1.metaSquad2.unitVector[i];
            if(m.id != m1.id)
            {
               return true;
            }
         }
         for(i = 0; i < backupMetaArmy.metaSquad3.unitVector.length; i++)
         {
            m = backupMetaArmy.metaSquad3.unitVector[i];
            m1 = metaArmy1.metaSquad3.unitVector[i];
            if(m.id != m1.id)
            {
               return true;
            }
         }
         for(i = 0; i < backupMetaArmy.metaSquad4.unitVector.length; i++)
         {
            m = backupMetaArmy.metaSquad4.unitVector[i];
            m1 = metaArmy1.metaSquad4.unitVector[i];
            if(m.id != m1.id)
            {
               return true;
            }
         }
         for(i = 0; i < backupMetaArmy.metaSquad5.unitVector.length; i++)
         {
            m = backupMetaArmy.metaSquad5.unitVector[i];
            m1 = metaArmy1.metaSquad5.unitVector[i];
            if(m.id != m1.id)
            {
               return true;
            }
         }
         return false;
      }
      
      public function CreateUnit(metaUnit:BC_MetaUnit) : void
      {
         Main.instance.ClearAllCaches();
         var unit:BC_MetaUnit = new BC_MetaUnit(-1);
         unit.Copy(metaUnit);
         unit.ChooseAnimSet();
         unit.id = BC_EnemyManager.getNextId();
         if(unit.unitName == "Unit")
         {
            unit.unitName = "Unit" + unit.id;
         }
         unit.maxQuantity = unit.quantity;
         this._unitTransferView.metaArmy.AddInventoryUnit(unit);
         this._unitTransferView.SetMetaArmy(this._unitTransferView.metaArmy);
         this._unitTransferView.Refresh();
      }
      
      private function onNew(event:MouseEvent) : void
      {
         var u:UnitCreationScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_UNITCREATION_SCREEN) as UnitCreationScreen;
         u.setCreateUnit(new BC_MetaUnit(-3));
         u.setInfo(this);
         this._unitTransferView.unitGroupView.SetSelectView(BC_MetaUnit.EMPTY_UNIT);
         this._unitTransferView.pendingUnitView.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
      }
      
      public function get btn_army2_Activated() : ButtonSelect
      {
         return visual.getChildByName("btn_army2_Activated") as ButtonSelect;
      }
      
      public function get btn_army4_Activated() : ButtonSelect
      {
         return visual.getChildByName("btn_army4_Activated") as ButtonSelect;
      }
      
      public function get mcRanking() : MovieClip
      {
         return visual.getChildByName("mcRanking") as MovieClip;
      }
      
      public function get armyName() : TextField
      {
         return visual.getChildByName("armyName") as TextField;
      }
      
      public function get saveArmy() : MovieClip
      {
         return visual.getChildByName("saveArmy") as MovieClip;
      }
      
      public function CreateAfterEdit(metaUnit:BC_MetaUnit, i:int) : void
      {
         Main.instance.ClearAllCaches();
         var unit:BC_MetaUnit = new BC_MetaUnit(-1);
         unit.Copy(metaUnit);
         unit.ChooseAnimSet();
         unit.id = BC_EnemyManager.getNextId();
         if(unit.unitName == "Unit")
         {
            unit.unitName = "Unit" + unit.id;
         }
         unit.maxQuantity = metaUnit.quantity;
         this._unitTransferView.metaArmy.AddInventoryUnitAt(unit,i);
         this._unitTransferView.SetMetaArmy(this._unitTransferView.metaArmy);
         this._unitTransferView.Refresh();
      }
      
      private function CheckCheat() : void
      {
         var metaUnit:BC_MetaUnit = null;
         if(this._unitTransferView.metaArmy.teamId == 5 && this._unitTransferView.metaArmy.totalPoint > 500 || this._unitTransferView.metaArmy.totalPoint > 1000 || this._unitTransferView.metaArmy.totalPoint < 0)
         {
            Main.instance.ClearAllCaches();
            while(this._unitTransferView.metaArmy.unitInventory.length > 0)
            {
               metaUnit = this._unitTransferView.metaArmy.unitInventory[0];
               this._unitTransferView.RemoveUnitFromInventory(metaUnit);
            }
            this._unitTransferView.pendingUnitView.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
            this._unitTransferView.pendingUnitView.SetIdle();
            this._unitTransferView.Refresh();
            this._unitTransferView.metaArmy.totalPoint = 1000;
            BC_EnemyManager.UpdateId();
            BC_Game.instance.Save();
         }
      }
      
      public function get btn_saveArmy() : ButtonSelect
      {
         return visual.getChildByName("btn_saveArmy") as ButtonSelect;
      }
      
      public function get UnitSelection() : MovieClip
      {
         return visual.getChildByName("UnitSelection") as MovieClip;
      }
      
      private function InitArmyButtons() : void
      {
         this._btnArmyGroup = new ButtonSelectGroup();
         this._btnArmyGroup.AddButton(this.btn_army1);
         this._btnArmyGroup.AddButton(this.btn_army1_Activated);
         this.btn_army1.visible = false;
         this.btn_army1_Activated.visible = false;
         this.btn_army2.visible = false;
         this.btn_army2_Activated.visible = false;
         this.btn_army2_Locked.visible = false;
         this.btn_army3.visible = false;
         this.btn_army3_Activated.visible = false;
         this.btn_army3_Locked.visible = false;
         this.btn_army4.visible = false;
         this.btn_army4_Activated.visible = false;
         this.btn_army4_Locked.visible = false;
         this.btn_army5.visible = false;
         this.btn_army5_Activated.visible = false;
         this.btn_army5_Locked.visible = false;
         if(BC_Game.instance.IsInFirstAct())
         {
            this.btn_army1.visible = true;
            this.btn_army2_Locked.visible = true;
            this.btn_army3_Locked.visible = true;
            this.btn_army4_Locked.visible = true;
            this.btn_army5_Locked.visible = true;
            this.btn_army1.Select();
            this.armySelect1(null);
         }
         else
         {
            this._btnArmyGroup.AddButton(this.btn_army2);
            this._btnArmyGroup.AddButton(this.btn_army2_Activated);
            this._btnArmyGroup.AddButton(this.btn_army3);
            this._btnArmyGroup.AddButton(this.btn_army3_Activated);
            this._btnArmyGroup.AddButton(this.btn_army4);
            this._btnArmyGroup.AddButton(this.btn_army4_Activated);
            this._btnArmyGroup.AddButton(this.btn_army5);
            this._btnArmyGroup.AddButton(this.btn_army5_Activated);
            if(BC_GameProgress.gameProgess.metaArmy1.IsMultiplayer())
            {
               this.btn_army1_Activated.visible = true;
            }
            else
            {
               this.btn_army1.visible = true;
            }
            if(BC_GameProgress.gameProgess.metaArmy2.IsMultiplayer())
            {
               this.btn_army2_Activated.visible = true;
            }
            else
            {
               this.btn_army2.visible = true;
            }
            if(BC_GameProgress.gameProgess.metaArmy3.IsMultiplayer())
            {
               this.btn_army3_Activated.visible = true;
            }
            else
            {
               this.btn_army3.visible = true;
            }
            if(BC_GameProgress.gameProgess.metaArmy4.IsMultiplayer())
            {
               this.btn_army4_Activated.visible = true;
            }
            else
            {
               this.btn_army4.visible = true;
            }
            if(BC_GameProgress.gameProgess.metaArmy5.IsMultiplayer())
            {
               this.btn_army5_Activated.visible = true;
            }
            else
            {
               this.btn_army5.visible = true;
            }
            switch(this._unitTransferView.metaArmy.teamId)
            {
               case 1:
                  this.armySelect1(null);
                  break;
               case 2:
                  this.armySelect2(null);
                  break;
               case 3:
                  this.armySelect3(null);
                  break;
               case 4:
                  this.armySelect4(null);
                  break;
               case 5:
                  this.armySelect5(null);
            }
         }
      }
      
      public function CheckActivateSaveArmy() : void
      {
         if(this.CheckChange(this._backupMetaArmy,this._unitTransferView.metaArmy))
         {
            this.btn_saveArmy.Deselect();
         }
         else
         {
            this.btn_saveArmy.Select();
         }
      }
      
      public function get btn_army3_Locked() : ButtonSelect
      {
         return visual.getChildByName("btn_army3_Locked") as ButtonSelect;
      }
      
      private function onChangeArmyName(e:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_CHANGEARMYNAME_SCREEN) > 0)
         {
            return;
         }
         var c:ChangeArmyNameScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_CHANGEARMYNAME_SCREEN,false,true) as ChangeArmyNameScreen;
         c.SetArmyCreationScreen(this);
      }
      
      private function armySelect1(event:MouseEvent) : void
      {
         if(this.btn_army1.isSelected || this.btn_army1_Activated.isSelected)
         {
            return;
         }
         if(this.CheckChange(this._backupMetaArmy,this._unitTransferView.metaArmy))
         {
            BC_Game.instance.Save();
         }
         if(this.btn_army1.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army1);
         }
         if(this.btn_army1_Activated.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army1_Activated);
         }
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(1);
         this._unitTransferView.SetMetaArmy(BC_GameProgress.gameProgess.CurrentSelectedArmy());
         this._unitTransferView.Refresh();
         this._unitTransferView.SwitchArmy();
         this._backupMetaArmy.CopySquad(this._unitTransferView.metaArmy);
         this.DeActivateSaveArmy();
         this.Refresh();
      }
      
      private function armySelect2(event:MouseEvent) : void
      {
         if(this.btn_army2.isSelected || this.btn_army2_Activated.isSelected)
         {
            return;
         }
         if(this.CheckChange(this._backupMetaArmy,this._unitTransferView.metaArmy))
         {
            BC_Game.instance.Save();
         }
         if(this.btn_army2.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army2);
         }
         if(this.btn_army2_Activated.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army2_Activated);
         }
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(2);
         this._unitTransferView.SetMetaArmy(BC_GameProgress.gameProgess.CurrentSelectedArmy());
         this._unitTransferView.Refresh();
         this._unitTransferView.SwitchArmy();
         this._backupMetaArmy.CopySquad(this._unitTransferView.metaArmy);
         this.DeActivateSaveArmy();
         this.Refresh();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._unitTransferView.Destroy();
         this._topMenuView.Destroy();
         this.btn_army1.removeEventListener(MouseEvent.MOUSE_DOWN,this.armySelect1);
         this.btn_army1_Activated.removeEventListener(MouseEvent.MOUSE_DOWN,this.armySelect1);
         this.btn_army2.removeEventListener(MouseEvent.MOUSE_DOWN,this.armySelect2);
         this.btn_army2_Activated.removeEventListener(MouseEvent.MOUSE_DOWN,this.armySelect2);
         this.btn_army3.removeEventListener(MouseEvent.MOUSE_DOWN,this.armySelect3);
         this.btn_army3_Activated.removeEventListener(MouseEvent.MOUSE_DOWN,this.armySelect3);
         this.btn_army4.removeEventListener(MouseEvent.MOUSE_DOWN,this.armySelect4);
         this.btn_army4_Activated.removeEventListener(MouseEvent.MOUSE_DOWN,this.armySelect4);
         this.btnNew.removeEventListener(MouseEvent.MOUSE_DOWN,this.onNew);
         this.btnEdit.removeEventListener(MouseEvent.MOUSE_DOWN,this.onEdit);
         this.btnDelete.removeEventListener(MouseEvent.MOUSE_DOWN,this.onDelete);
         this.saveArmy.removeEventListener(MouseEvent.MOUSE_DOWN,this.onSaveArmy);
      }
      
      private function armySelect4(event:MouseEvent) : void
      {
         if(this.btn_army4.isSelected || this.btn_army4_Activated.isSelected)
         {
            return;
         }
         if(this.CheckChange(this._backupMetaArmy,this._unitTransferView.metaArmy))
         {
            BC_Game.instance.Save();
         }
         if(this.btn_army4.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army4);
         }
         if(this.btn_army4_Activated.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army4_Activated);
         }
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(4);
         this._unitTransferView.SetMetaArmy(BC_GameProgress.gameProgess.CurrentSelectedArmy());
         this._unitTransferView.Refresh();
         this._unitTransferView.SwitchArmy();
         this._backupMetaArmy.CopySquad(this._unitTransferView.metaArmy);
         this.DeActivateSaveArmy();
         this.Refresh();
      }
      
      private function armySelect5(event:MouseEvent) : void
      {
         if(this.btn_army5.isSelected || this.btn_army5_Activated.isSelected)
         {
            return;
         }
         if(this.CheckChange(this._backupMetaArmy,this._unitTransferView.metaArmy))
         {
            BC_Game.instance.Save();
         }
         if(this.btn_army5.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army5);
         }
         if(this.btn_army5_Activated.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army5_Activated);
         }
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(5);
         this._unitTransferView.SetMetaArmy(BC_GameProgress.gameProgess.CurrentSelectedArmy());
         this._unitTransferView.Refresh();
         this._unitTransferView.SwitchArmy();
         this._backupMetaArmy.CopySquad(this._unitTransferView.metaArmy);
         this.DeActivateSaveArmy();
         this.Refresh();
      }
      
      public function DeleteUnitAfterEdit(metaUnit:BC_MetaUnit) : void
      {
         this._unitTransferView.RemoveUnitFromInventoryAfterEdit(metaUnit);
         this._unitTransferView.SetMetaArmy(this._unitTransferView.metaArmy);
         this._unitTransferView.unitGroupView.SetSelectView(BC_MetaUnit.EMPTY_UNIT);
         this._unitTransferView.Refresh();
      }
      
      public function get armyView() : MovieClip
      {
         return visual.getChildByName("armyView") as MovieClip;
      }
      
      public function get unitTransferView() : UnitTransferView
      {
         return this._unitTransferView;
      }
      
      public function get btnFlag() : ButtonSelect
      {
         return visual.getChildByName("flag") as ButtonSelect;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         this._unitTransferView.Update();
         this.CheckCheat();
      }
      
      private function onDelete(event:MouseEvent) : void
      {
         if(this.btnDelete.isSelected)
         {
            return;
         }
         Main.instance.ClearAllCaches();
         this._unitTransferView.RemoveUnitFromInventory(this._unitTransferView.unitGroupView.selectedMetaUnit);
         this._unitTransferView.Refresh();
         this._unitTransferView.pendingUnitView.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
      }
      
      public function DeActivateEdit() : void
      {
         this.btnEdit.Select();
         this.btnDelete.Select();
      }
      
      private function onSaveCampaignArmy(event:MouseEvent) : void
      {
         var s:CampaignArmyCreationScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_CAMPAIGNARMYCREATION_SCREEN) as CampaignArmyCreationScreen;
         s.SetMetaArmy(this._unitTransferView.metaArmy);
      }
      
      private function armySelect3(event:MouseEvent) : void
      {
         if(this.btn_army3.isSelected || this.btn_army3_Activated.isSelected)
         {
            return;
         }
         if(this.CheckChange(this._backupMetaArmy,this._unitTransferView.metaArmy))
         {
            BC_Game.instance.Save();
         }
         if(this.btn_army3.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army3);
         }
         if(this.btn_army3_Activated.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army3_Activated);
         }
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(3);
         this._unitTransferView.SetMetaArmy(BC_GameProgress.gameProgess.CurrentSelectedArmy());
         this._unitTransferView.Refresh();
         this._unitTransferView.SwitchArmy();
         this._backupMetaArmy.CopySquad(this._unitTransferView.metaArmy);
         this.DeActivateSaveArmy();
         this.Refresh();
      }
      
      public function get btn_RenameArmy() : ButtonSelect
      {
         return visual.getChildByName("btn_RenameArmy") as ButtonSelect;
      }
      
      public function get btn_army2_Locked() : ButtonSelect
      {
         return visual.getChildByName("btn_army2_Locked") as ButtonSelect;
      }
      
      override public function close() : void
      {
         super.close();
         if(this.CheckChange(this._backupMetaArmy,this._unitTransferView.metaArmy))
         {
            BC_Game.instance.Save();
         }
      }
      
      public function get btnShop() : ButtonSelect
      {
         return visual.getChildByName("shop") as ButtonSelect;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ARMYCREATION_SCREEN);
      }
   }
}

