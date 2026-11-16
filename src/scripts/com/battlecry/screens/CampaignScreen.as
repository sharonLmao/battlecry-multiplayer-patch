package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.battle.RoundManager;
   import com.battlecry.enemy.BC_EnemyManager;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.meta.MetaEnemyLoaded;
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.MetaPlayerEquipement;
   import com.battlecry.meta.model.ModelCampaign;
   import com.battlecry.meta.model.ModelCampaignEnum;
   import com.battlecry.meta.model.ModelChapter;
   import com.battlecry.meta.model.ModelChapterEnum;
   import com.battlecry.meta.model.ModelEquipementEnum;
   import com.battlecry.meta.model.ModelTutorialEnum;
   import com.battlecry.screens.view.CampaignGroupView;
   import com.battlecry.screens.view.TopMenuView;
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
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.KongStats;
   import com.lachhhEngine.io.externalAPI.statsAPI.MetaStatData;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class CampaignScreen extends BC_Screen
   {
      
      private var _campaignGroupView:CampaignGroupView;
      
      private var _actSelect:ButtonSelectGroup;
      
      private var _tutoShown:Boolean;
      
      private var _currentChapter:ModelChapter;
      
      private var _topMenuView:TopMenuView;
      
      private var _chapterIndex:int;
      
      private var _init:Boolean;
      
      private var _currentAct:Vector.<ModelCampaign>;
      
      public function CampaignScreen()
      {
         super();
      }
      
      public function get campaignPackRightGlow() : MovieClip
      {
         return visual.getChildByName("campaignPackRightGlow") as MovieClip;
      }
      
      public function get btn_Act1() : ButtonSelect
      {
         return visual.getChildByName("btn_Act1") as ButtonSelect;
      }
      
      public function get btn_Act2() : ButtonSelect
      {
         return visual.getChildByName("btn_Act2") as ButtonSelect;
      }
      
      public function get btn_Act3() : ButtonSelect
      {
         return visual.getChildByName("btn_Act3") as ButtonSelect;
      }
      
      private function InitActButton() : void
      {
         this.btn_Act3.visible = false;
         this.btn_Act2.visible = false;
         this.act3MC.visible = false;
         this.act2MC.visible = false;
         if(this._chapterIndex == 0)
         {
            if(BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl > ModelCampaignEnum.ACT_1_1.length + ModelCampaignEnum.ACT_1_2.length)
            {
               this.btn_Act3.visible = true;
               this.act3MC.visible = true;
            }
            if(BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl > ModelCampaignEnum.ACT_1_1.length)
            {
               this.btn_Act2.visible = true;
               this.act2MC.visible = true;
            }
         }
         else if(this._chapterIndex == 1)
         {
            if(BC_GameProgress.gameProgess.metaCampaignProgress.ashesCampaignLvl > ModelCampaignEnum.ACT_2_1.length + ModelCampaignEnum.ACT_2_2.length)
            {
               this.btn_Act3.visible = true;
               this.act3MC.visible = true;
            }
            if(BC_GameProgress.gameProgess.metaCampaignProgress.ashesCampaignLvl > ModelCampaignEnum.ACT_2_1.length)
            {
               this.btn_Act2.visible = true;
               this.act2MC.visible = true;
            }
            this.btn_Act3.visible = false;
            this.act3MC.visible = false;
            this.btn_Act2.visible = false;
            this.act2MC.visible = false;
         }
      }
      
      public function get topMenuView() : MovieClip
      {
         return visual.getChildByName("TopMenuView") as MovieClip;
      }
      
      public function get campaignPackLeftGlow() : MovieClip
      {
         return visual.getChildByName("campaignPackLeftGlow") as MovieClip;
      }
      
      private function onFightAString(e:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_FIGHTASTRING_SCREEN) > 0)
         {
            return;
         }
         var f:FightAStringScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_FIGHTASTRING_SCREEN,false,true) as FightAStringScreen;
         f.SetOkCallback(new Callback(this.FightAString,this,null));
      }
      
      private function InitCurrentAct() : void
      {
         var currentLvl:int = BC_GameProgress.gameProgess.metaCampaignProgress.GetCurrentCampaignLvl();
         if(this._chapterIndex == 1)
         {
            this.onAct1(null);
            return;
         }
         if(this._chapterIndex == 2)
         {
            this.onAct1(null);
            return;
         }
         if(currentLvl > BC_GameProgress.gameProgess.metaCampaignProgress.GetChapterEndActArray()[1])
         {
            this.onAct3(null);
         }
         else if(currentLvl > BC_GameProgress.gameProgess.metaCampaignProgress.GetChapterEndActArray()[0])
         {
            this.onAct2(null);
         }
         else
         {
            this.onAct1(null);
         }
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         var MissionCompleted:int = 0;
         var mComplted:MetaStatData = null;
         super.Init(metaObject,context);
         this._tutoShown = false;
         this.CheckCampaignReward();
         BC_EnemyManager.UpdateId();
         this._campaignGroupView = new CampaignGroupView(this.campaignView,this);
         this._topMenuView = new TopMenuView(this.topMenuView,this);
         this._topMenuView.SetCurrentScreen(BC_ScreenFactory.ID_CAMPAIGN_SCREEN);
         InitOkBtn(this.btn_Act1);
         this.btn_Act1.addEventListener(MouseEvent.MOUSE_DOWN,this.onAct1);
         InitOkBtn(this.btn_Act2);
         this.btn_Act2.addEventListener(MouseEvent.MOUSE_DOWN,this.onAct2);
         InitOkBtn(this.btn_Act3);
         this.btn_Act3.addEventListener(MouseEvent.MOUSE_DOWN,this.onAct3);
         InitOkBtn(this.btn_PreviousChapter);
         this.btn_PreviousChapter.addEventListener(MouseEvent.MOUSE_DOWN,this.onPreviousChapter);
         InitOkBtn(this.btn_NextChapter);
         this.btn_NextChapter.addEventListener(MouseEvent.MOUSE_DOWN,this.onNextChapter);
         if(ModelChapterEnum.ALL.length <= 1)
         {
            this.btn_PreviousChapter.visible = false;
            this.btn_NextChapter.visible = false;
         }
         this._actSelect = new ButtonSelectGroup();
         this._actSelect.AddButton(this.btn_Act1);
         this._actSelect.AddButton(this.btn_Act2);
         this._actSelect.AddButton(this.btn_Act3);
         this._init = false;
         animation.playChildren = false;
         this.InitCurrentChapter();
         this.InitActButton();
         this.InitCurrentAct();
         InitOkBtn(this.practice1);
         this.practice1.addEventListener(MouseEvent.MOUSE_DOWN,this.onPractice1);
         InitOkBtn(this.practice2);
         this.practice2.addEventListener(MouseEvent.MOUSE_DOWN,this.onPractice2);
         InitOkBtn(this.practice3);
         this.practice3.addEventListener(MouseEvent.MOUSE_DOWN,this.onPractice3);
         InitOkBtn(this.practice4);
         this.practice4.addEventListener(MouseEvent.MOUSE_DOWN,this.onPractice4);
         InitOkBtn(this.btn_FightAString);
         this.btn_FightAString.addEventListener(MouseEvent.MOUSE_DOWN,this.onFightAString);
         InitOkBtn(this.btn_Survival);
         this.btn_Survival.addEventListener(MouseEvent.MOUSE_DOWN,this.onSurvival);
         if(!VersionInfo.debugVersion)
         {
            this.practice1.visible = false;
            this.practice2.visible = false;
            this.practice3.visible = false;
            this.practice4.visible = false;
            this.btn_FightAString.visible = false;
         }
         this.InitGlow();
         if(BC_VersionInfo.isKongregate)
         {
            MissionCompleted = BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl + BC_GameProgress.gameProgess.metaCampaignProgress.ashesCampaignLvl - 2;
            if(MissionCompleted >= 1)
            {
               mComplted = new MetaStatData("Mission_Completed",MissionCompleted);
               KongStats.SubmitData(mComplted);
            }
         }
         Jukebox.instance.FadeToMusic(BC_SfxFactory.ID_MUSIC_INTERFACES);
      }
      
      public function BuildNewView() : void
      {
         this._currentChapter = ModelChapterEnum.ALL[this._chapterIndex];
         this._campaignGroupView.BuildView(this._currentAct);
         this.Refresh();
      }
      
      private function onPractice2(e:MouseEvent) : void
      {
         BC_Game.instance.isRanked = false;
         BC_Game.instance.metaEnemyLoaded = new MetaEnemyLoaded();
         BC_Game.instance.friendArmy = BC_GameProgress.gameProgess.metaArmy2;
         BC_Game.instance.metaEnemyLoaded.enemyName = Main.instance.GetPlayerName();
         BC_Game.instance.metaEnemyLoaded.fullArmyName = Main.instance.GetPIOid();
         BC_Game.instance.metaEnemyLoaded.metaFlag = BC_GameProgress.gameProgess.metaFlag;
         BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_LOADGAME_INFOS_SCREEN);
      }
      
      private function onPractice3(e:MouseEvent) : void
      {
         BC_Game.instance.isRanked = false;
         BC_Game.instance.metaEnemyLoaded = new MetaEnemyLoaded();
         BC_Game.instance.friendArmy = BC_GameProgress.gameProgess.metaArmy3;
         BC_Game.instance.metaEnemyLoaded.enemyName = Main.instance.GetPlayerName();
         BC_Game.instance.metaEnemyLoaded.fullArmyName = Main.instance.GetPIOid();
         BC_Game.instance.metaEnemyLoaded.metaFlag = BC_GameProgress.gameProgess.metaFlag;
         BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_LOADGAME_INFOS_SCREEN);
      }
      
      private function onPractice4(e:MouseEvent) : void
      {
         BC_Game.instance.isRanked = false;
         BC_Game.instance.metaEnemyLoaded = new MetaEnemyLoaded();
         BC_Game.instance.friendArmy = BC_GameProgress.gameProgess.metaArmy4;
         BC_Game.instance.metaEnemyLoaded.enemyName = Main.instance.GetPlayerName();
         BC_Game.instance.metaEnemyLoaded.fullArmyName = Main.instance.GetPIOid();
         BC_Game.instance.metaEnemyLoaded.metaFlag = BC_GameProgress.gameProgess.metaFlag;
         BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_LOADGAME_INFOS_SCREEN);
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.campaignName.text = TextFactory.instance.GetMsg(this._currentChapter.nameID);
         this._topMenuView.Refresh();
      }
      
      private function onSurvival(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         var a:ArmySurvivalSelectScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ARMYSURVIVALSELECT_SCREEN) as ArmySurvivalSelectScreen;
         a.SetScreenToClose(this);
      }
      
      private function onPractice1(e:MouseEvent) : void
      {
         BC_Game.instance.isRanked = false;
         BC_Game.instance.metaEnemyLoaded = new MetaEnemyLoaded();
         BC_Game.instance.friendArmy = BC_GameProgress.gameProgess.metaArmy1;
         BC_Game.instance.metaEnemyLoaded.enemyName = Main.instance.GetPlayerName();
         BC_Game.instance.metaEnemyLoaded.fullArmyName = Main.instance.GetPIOid();
         BC_Game.instance.metaEnemyLoaded.metaFlag = BC_GameProgress.gameProgess.metaFlag;
         BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_LOADGAME_INFOS_SCREEN);
      }
      
      private function FightAString(gameProgress:BC_GameProgress, armyIndex:int) : void
      {
         BC_Game.instance.isRanked = false;
         BC_Game.instance.metaEnemyLoaded = new MetaEnemyLoaded();
         BC_Game.instance.friendArmy = gameProgress.getArmy(armyIndex);
         BC_Game.instance.metaEnemyLoaded.enemyName = "Enemy";
         BC_Game.instance.metaEnemyLoaded.fullArmyName = "Enemy";
         BC_Game.instance.metaEnemyLoaded.metaFlag = gameProgress.metaFlag;
         BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_LOADGAME_INFOS_SCREEN);
      }
      
      public function get btn_FightAString() : ButtonSelect
      {
         return visual.getChildByName("btn_FightAString") as ButtonSelect;
      }
      
      public function get act3MC() : MovieClip
      {
         return visual.getChildByName("act3MC") as MovieClip;
      }
      
      private function get metaArmy1() : BC_MetaArmy
      {
         return BC_GameProgress.gameProgess.metaArmy1;
      }
      
      public function get campaignName() : TextField
      {
         return visual.getChildByName("campaignName") as TextField;
      }
      
      private function SwitchAct1() : void
      {
         this._actSelect.SelectButton(this.btn_Act1);
         this._currentAct = ModelCampaignEnum.CHAPTER_LIST[this._chapterIndex][0];
         this.BuildNewView();
         this.SetScrollBarPrct();
      }
      
      public function get campaignView() : MovieClip
      {
         return visual.getChildByName("campaignView") as MovieClip;
      }
      
      public function get practice1() : ButtonSelect
      {
         return visual.getChildByName("practice1") as ButtonSelect;
      }
      
      public function get btn_NextChapter() : ButtonSelect
      {
         return visual.getChildByName("btn_NextChapter") as ButtonSelect;
      }
      
      public function get practice3() : ButtonSelect
      {
         return visual.getChildByName("practice3") as ButtonSelect;
      }
      
      public function get practice4() : ButtonSelect
      {
         return visual.getChildByName("practice4") as ButtonSelect;
      }
      
      public function InitGlow() : void
      {
         this.campaignPackLeftGlow.visible = false;
         this.campaignPackRightGlow.visible = false;
         if(BC_GameProgress.gameProgess.metaCampaignProgress.campaignGlow == 0)
         {
            this.campaignPackLeftGlow.visible = true;
            this.campaignPackRightGlow.visible = true;
         }
      }
      
      private function onAct2(event:MouseEvent) : void
      {
         if(this.btn_Act2.isSelected)
         {
            return;
         }
         this._actSelect.SelectButton(this.btn_Act2);
         this._currentAct = ModelCampaignEnum.CHAPTER_LIST[this._chapterIndex][1];
         this.BuildNewView();
         this.SetScrollBarPrct();
      }
      
      private function onAct3(event:MouseEvent) : void
      {
         if(this.btn_Act3.isSelected)
         {
            return;
         }
         this._actSelect.SelectButton(this.btn_Act3);
         this._currentAct = ModelCampaignEnum.CHAPTER_LIST[this._chapterIndex][2];
         this.BuildNewView();
         this.SetScrollBarPrct();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         if(this._topMenuView)
         {
            this._topMenuView.Destroy();
         }
         if(this._campaignGroupView)
         {
            this._campaignGroupView.Destroy();
         }
         this.btn_Act1.removeEventListener(MouseEvent.MOUSE_DOWN,this.onAct1);
         this.btn_Act2.removeEventListener(MouseEvent.MOUSE_DOWN,this.onAct2);
         this.btn_Act3.removeEventListener(MouseEvent.MOUSE_DOWN,this.onAct3);
         this.btn_PreviousChapter.removeEventListener(MouseEvent.MOUSE_DOWN,this.onPreviousChapter);
         this.btn_NextChapter.removeEventListener(MouseEvent.MOUSE_DOWN,this.onNextChapter);
      }
      
      public function get btn_PreviousChapter() : ButtonSelect
      {
         return visual.getChildByName("btn_PreviousChapter") as ButtonSelect;
      }
      
      private function CheckCampaignReward() : void
      {
         var r:GoldRewardScreen = null;
         var b:ItemRewardScreen = null;
         var r2:GoldRewardGrindingScreen = null;
         var r1:GoldRewardScreen = null;
         if(Boolean(BC_Game.instance.currentCampaign) && BC_Game.instance.lastFightState == RoundManager.VICTORY)
         {
            if(BC_Game.instance.currentCampaign.campaignStage == BC_GameProgress.gameProgess.metaCampaignProgress.GetCurrentCampaignLvl())
            {
               BC_GameProgress.gameProgess.metaCampaignProgress.AddCurrentCampaignLvl();
               if(BC_Game.instance.currentCampaign.goldReward > 0)
               {
                  r = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_GOLDREWARD_SCREEN,false,true) as GoldRewardScreen;
                  r.SetReward(BC_Game.instance.currentCampaign.goldReward);
               }
               else if(BC_Game.instance.currentCampaign.itemReward.length > 0)
               {
                  BC_Game.instance.GiveReward(BC_Game.instance.currentCampaign.itemReward);
                  b = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ITEM_REWARD_SCREEN,false,true) as ItemRewardScreen;
                  b.reward(BC_Game.instance.currentCampaign);
                  this.CheckBuildUnitForTutorial();
               }
            }
            else
            {
               r2 = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_GOLDREWARDGRINDING_SCREEN,false,true) as GoldRewardGrindingScreen;
               r2.SetReward(200);
            }
            BC_Game.instance.currentCampaign = null;
            BC_Game.instance.Save();
         }
         else if(BC_Game.instance.currentCampaign)
         {
            if(BC_Game.instance.concede)
            {
               BC_Game.instance.concede = false;
               BC_Game.instance.currentCampaign = null;
               return;
            }
            r1 = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_GOLDREWARD_SCREEN,false,true) as GoldRewardScreen;
            r1.SetReward(100);
            BC_Game.instance.currentCampaign = null;
            BC_Game.instance.Save();
         }
      }
      
      public function get btn_Survival() : ButtonSelect
      {
         return visual.getChildByName("btn_Survival") as ButtonSelect;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         this._campaignGroupView.Update();
         if(!this._tutoShown)
         {
            if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_SAVE_SCREEN) <= 0 && ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_GOLDREWARD_SCREEN) <= 0 && ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_ITEM_REWARD_SCREEN) <= 0)
            {
               if(!BC_GameProgress.gameProgess.tutorialManager.HasBeenShown(ModelTutorialEnum.TUTORIAL_INITIAL) && BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl >= 2)
               {
                  this._tutoShown = true;
                  BC_GameProgress.gameProgess.tutorialManager.ShowTutorial(ModelTutorialEnum.TUTORIAL_INITIAL);
               }
               else if(!BC_GameProgress.gameProgess.tutorialManager.HasBeenShown(ModelTutorialEnum.TUTORIAL_ARCHER) && BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl >= 3)
               {
                  this._tutoShown = true;
                  BC_GameProgress.gameProgess.tutorialManager.ShowTutorial(ModelTutorialEnum.TUTORIAL_ARCHER);
               }
               else if(!BC_GameProgress.gameProgess.tutorialManager.HasBeenShown(ModelTutorialEnum.TUTORIAL_FLAG) && BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl >= 4)
               {
                  this._tutoShown = true;
                  BC_GameProgress.gameProgess.tutorialManager.ShowTutorial(ModelTutorialEnum.TUTORIAL_FLAG);
               }
               else if(!BC_GameProgress.gameProgess.tutorialManager.HasBeenShown(ModelTutorialEnum.TUTORIAL_WIZARD) && BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl >= 5)
               {
                  this._tutoShown = true;
                  BC_GameProgress.gameProgess.tutorialManager.ShowTutorial(ModelTutorialEnum.TUTORIAL_WIZARD);
               }
               else if(!BC_GameProgress.gameProgess.tutorialManager.HasBeenShown(ModelTutorialEnum.TUTORIAL_TIMER) && BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl >= 6)
               {
                  this._tutoShown = true;
                  BC_GameProgress.gameProgess.tutorialManager.ShowTutorial(ModelTutorialEnum.TUTORIAL_TIMER);
               }
               else if(!BC_GameProgress.gameProgess.tutorialManager.HasBeenShown(ModelTutorialEnum.TUTORIAL_CREATE_UNIT) && BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl >= 7)
               {
                  this._tutoShown = true;
                  BC_GameProgress.gameProgess.tutorialManager.ShowTutorial(ModelTutorialEnum.TUTORIAL_CREATE_UNIT);
               }
               else if(!BC_GameProgress.gameProgess.tutorialManager.HasBeenShown(ModelTutorialEnum.TUTORIAL_UNLOCK_ACT2) && BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl >= ModelCampaignEnum.CHAPTER_1_END_ACT[0] + 1)
               {
                  this._tutoShown = true;
                  BC_GameProgress.gameProgess.tutorialManager.ShowTutorial(ModelTutorialEnum.TUTORIAL_UNLOCK_ACT2);
               }
            }
         }
      }
      
      private function InitCurrentChapter() : void
      {
         this._chapterIndex = BC_GameProgress.gameProgess.metaCampaignProgress.currentChapter.id;
      }
      
      private function onAct1(event:MouseEvent) : void
      {
         if(this.btn_Act1.isSelected)
         {
            return;
         }
         this._actSelect.SelectButton(this.btn_Act1);
         this._currentAct = ModelCampaignEnum.CHAPTER_LIST[this._chapterIndex][0];
         this.BuildNewView();
         this.SetScrollBarPrct();
      }
      
      private function CheckBuildUnitForTutorial() : void
      {
         var m:BC_MetaUnit = null;
         switch(BC_Game.instance.currentCampaign.id)
         {
            case ModelCampaignEnum.CAMPAIGN1_1_2.id:
               m = new BC_MetaUnit(BC_EnemyManager.getNextId());
               m.quantity = 6;
               m.maxQuantity = 6;
               m.unitName = "Archer";
               m.playerEquipement = new MetaPlayerEquipement(BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.CREATURE_HUMAN),BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.WEAPON_SHORTBOW),MetaEquipement.EMPTY_EQUIPEMENT,MetaEquipement.EMPTY_EQUIPEMENT,MetaEquipement.EMPTY_EQUIPEMENT);
               this.metaArmy1.AddInventoryUnit(m);
               this.metaArmy1.RemoveUnitItems(m);
               break;
            case ModelCampaignEnum.CAMPAIGN1_1_3.id:
               m = new BC_MetaUnit(BC_EnemyManager.getNextId());
               m.quantity = 1;
               m.maxQuantity = 1;
               m.unitName = "FlagMan";
               m.playerEquipement = new MetaPlayerEquipement(BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.CREATURE_HUMAN),BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.WEAPON_FLAME_FLAG),MetaEquipement.EMPTY_EQUIPEMENT,MetaEquipement.EMPTY_EQUIPEMENT,MetaEquipement.EMPTY_EQUIPEMENT);
               this.metaArmy1.AddInventoryUnit(m);
               this.metaArmy1.RemoveUnitItems(m);
               break;
            case ModelCampaignEnum.CAMPAIGN1_1_4.id:
               m = new BC_MetaUnit(BC_EnemyManager.getNextId());
               m.quantity = 1;
               m.maxQuantity = 1;
               m.unitName = "Red Mage";
               m.playerEquipement = new MetaPlayerEquipement(BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.CREATURE_HUMAN),BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.WEAPON_FIREBLASTSTAFF),MetaEquipement.EMPTY_EQUIPEMENT,MetaEquipement.EMPTY_EQUIPEMENT,MetaEquipement.EMPTY_EQUIPEMENT);
               this.metaArmy1.AddInventoryUnit(m);
               this.metaArmy1.RemoveUnitItems(m);
               break;
            case ModelCampaignEnum.CAMPAIGN1_1_5.id:
               m = new BC_MetaUnit(BC_EnemyManager.getNextId());
               m.quantity = 1;
               m.maxQuantity = 1;
               m.unitName = "Black Mage";
               m.playerEquipement = new MetaPlayerEquipement(BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.CREATURE_HUMAN),BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.WEAPON_FIREBLASTSTAFF),MetaEquipement.EMPTY_EQUIPEMENT,MetaEquipement.EMPTY_EQUIPEMENT,BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.SPECIAL_WIZARDRING));
               this.metaArmy1.AddInventoryUnit(m);
               this.metaArmy1.RemoveUnitItems(m);
         }
      }
      
      public function get act2MC() : MovieClip
      {
         return visual.getChildByName("act2MC") as MovieClip;
      }
      
      private function onPreviousChapter(event:MouseEvent) : void
      {
         if(this._chapterIndex == 0)
         {
            this._chapterIndex = ModelChapterEnum.ALL.length - 1;
         }
         else
         {
            --this._chapterIndex;
         }
         BC_GameProgress.gameProgess.metaCampaignProgress.campaignGlow = 1;
         this.InitGlow();
         BC_GameProgress.gameProgess.metaCampaignProgress.currentChapter = ModelChapterEnum.GetFromId(this._chapterIndex);
         this.SwitchAct1();
         this.InitActButton();
         this.BuildNewView();
      }
      
      public function get practice2() : ButtonSelect
      {
         return visual.getChildByName("practice2") as ButtonSelect;
      }
      
      private function onNextChapter(event:MouseEvent) : void
      {
         if(this._chapterIndex >= ModelChapterEnum.ALL.length - 1)
         {
            this._chapterIndex = 0;
         }
         else
         {
            ++this._chapterIndex;
         }
         BC_GameProgress.gameProgess.metaCampaignProgress.campaignGlow = 1;
         this.InitGlow();
         BC_GameProgress.gameProgess.metaCampaignProgress.currentChapter = ModelChapterEnum.GetFromId(this._chapterIndex);
         this.SwitchAct1();
         this.InitActButton();
         this.BuildNewView();
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_CAMPAIGN_SCREEN);
      }
      
      private function SetScrollBarPrct() : void
      {
         var currentLvl:int = BC_GameProgress.gameProgess.metaCampaignProgress.GetCurrentCampaignLvl();
         if(currentLvl > BC_GameProgress.gameProgess.metaCampaignProgress.GetChapterEndActArray()[1])
         {
            currentLvl -= BC_GameProgress.gameProgess.metaCampaignProgress.GetChapterEndActArray()[1];
         }
         else if(currentLvl > BC_GameProgress.gameProgess.metaCampaignProgress.GetChapterEndActArray()[0])
         {
            currentLvl -= BC_GameProgress.gameProgess.metaCampaignProgress.GetChapterEndActArray()[0];
         }
         if(currentLvl <= 0)
         {
            this._campaignGroupView.scrollBarPanelView.scrollBarView.scrollPrc = 0;
            this._campaignGroupView.scrollBarPanelView.Refresh();
            return;
         }
         var max:int = int(this._currentAct.length);
         var scrollPrct:Number = this._campaignGroupView.scrollBarPanelView.scrollBarView.scrollPrc = (currentLvl - 2) / max + (currentLvl - 2) * 0.015;
         if(scrollPrct <= 0 || currentLvl <= 2)
         {
            scrollPrct = 0;
         }
         if(scrollPrct >= 1 || currentLvl >= max - 2)
         {
            scrollPrct = 1;
         }
         this._campaignGroupView.scrollBarPanelView.scrollBarView.scrollPrc = scrollPrct;
         this._campaignGroupView.scrollBarPanelView.Refresh();
      }
   }
}

