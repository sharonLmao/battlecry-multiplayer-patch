package com.battlecry
{
   import com.battlecry.battle.BattleArmy;
   import com.battlecry.battle.Grid;
   import com.battlecry.battle.GridPos;
   import com.battlecry.battle.RoundManager;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.enemy.BC_EnemyManager;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.io.BC_GamePrefs;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.stats.StatsStatic;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.meta.MetaEnemyLoaded;
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.MetaPlayerEquipement;
   import com.battlecry.meta.model.ModelBoosterPack;
   import com.battlecry.meta.model.ModelCampaign;
   import com.battlecry.meta.model.ModelCampaignEnum;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelEquipementEnum;
   import com.battlecry.meta.model.ModelFlag;
   import com.battlecry.meta.model.ModelFlagEnum;
   import com.battlecry.meta.model.ModelTutorialEnum;
   import com.battlecry.screens.BC_Screen;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.BattleSelectionScreen;
   import com.battlecry.screens.BoosterPackInfoScreen;
   import com.battlecry.screens.EndActScreen;
   import com.battlecry.screens.IngameScreen;
   import com.battlecry.screens.SaveScreen;
   import com.battlecry.screens.TransitionScreen;
   import com.battlecry.screens.UnitDescriptionScreen;
   import com.battlecry.screens.Units.UnitView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaGame;
   import com.lachhhEngine.games.meta.metaObject.MetaLevel;
   import com.lachhhEngine.games.meta.metaObject.MetaSound2D;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.games.sfx.Sound2D;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.files.FileManager;
   import flash.events.Event;
   import flash.ui.Keyboard;
   import playerio.DatabaseObject;
   
   public class BC_Game extends Game
   {
      
      public static var instance:BC_Game;
      
      public static var KEYS_OK:Array = [Keyboard.ENTER,Keyboard.SPACE,90,75,88,76];
      
      public static var KEYS_CANCEL:Array = [Keyboard.BACKSPACE];
      
      public static var KEYS_JUMP:Array = [90,75];
      
      public static var KEYS_SHOOT:Array = [88,76];
      
      public static var KEYS_LEFT:Array = [37,65];
      
      public static var KEYS_RIGHT:Array = [39,68];
      
      public static var KEYS_UP:Array = [38,87];
      
      public static var KEYS_DOWN:Array = [40,83];
      
      public static var KEYS_PAUSE:Array = [80,79];
      
      public static var BOTTOM_SCREEN:int = 1;
      
      public static var MIDDLE_SCREEN:int = 2;
      
      public static var TOP_SCREEN:int = 3;
      
      public static var BATTLE_MODE_CLASSIC_1000:int = 1;
      
      public static var BATTLE_MODE_CLASSIC_500:int = 2;
      
      public static var BATTLE_MODE_COOP_SURVIVAL:int = 3;
      
      public static var BATTLE_MODE_TOURNAMENT:int = 4;
      
      private var _nbArtilleryGiven:int;
      
      private var _survivalMove:Boolean;
      
      private var _isSurvivalCoop:Boolean;
      
      private var _roundManager:RoundManager;
      
      private var _isSurvival:Boolean;
      
      private var _friendLoaded:Boolean;
      
      private var _metaEnemyLoaded:MetaEnemyLoaded;
      
      private var _excelXml:XML;
      
      private var _isConnected:Boolean;
      
      private var _survivalCoopArmy:BC_MetaArmy;
      
      private var _gotoBattleMode:int;
      
      private var _isFriendBattle:Boolean;
      
      private var _unitDescriptionScreen:UnitDescriptionScreen;
      
      private var _currentCampaign:ModelCampaign;
      
      private var _currentTournamentLevel:int;
      
      private var _isTournament:Boolean;
      
      private var _main:Main;
      
      private var _isChallenge:Boolean;
      
      private var _concede:Boolean;
      
      private var _skeleton:BC_MetaUnit;
      
      private var _tournamentLoaded:Vector.<MetaEnemyLoaded>;
      
      private var _battleSpeed:int;
      
      private var _demonWarrior:BC_MetaUnit;
      
      private var _challengerName:String;
      
      private var _ingame:IngameScreen;
      
      private var _metaEnemyChallenge:MetaEnemyLoaded;
      
      private var _lastFightState:int;
      
      private var _myArmyBackRow:Boolean;
      
      private var _immortalWarrior:BC_MetaUnit;
      
      private var _tournamentReward:int;
      
      private var _survivalLevel:int;
      
      private var _descritpionUnit:BC_MetaUnit;
      
      private var _fbConnected:Boolean;
      
      private var _isRanked:Boolean;
      
      private var _friendArmy:BC_MetaArmy;
      
      public function BC_Game(main:Main)
      {
         super();
         this._fbConnected = false;
         this._main = main;
         this._battleSpeed = 1;
         this._concede = false;
         this._isConnected = false;
      }
      
      public function set tournamentReward(tournamentReward:int) : void
      {
         this._tournamentReward = tournamentReward;
      }
      
      private function AfterSaveInit(screenToClose:BC_Screen) : void
      {
         if(ExternalAPIManager.getPremiumAPI().loggedIn)
         {
            this.CheckDailyReward();
         }
         this._currentCampaign = ModelCampaignEnum.CAMPAIGN1_1_1;
         this.TransitionTo(screenToClose,BC_ScreenFactory.ID_STORY_SCREEN);
      }
      
      public function ClearRoundManager() : void
      {
         this._metaEnemyLoaded = null;
         this._metaEnemyChallenge = null;
         this._friendArmy = null;
         this._roundManager.Destroy();
         this._ingame.Hide();
         speedManager.SetSpeed(1);
      }
      
      public function get immortalWarrior() : BC_MetaUnit
      {
         return this._immortalWarrior;
      }
      
      public function set isSurvival(isSurvival:Boolean) : void
      {
         this._isSurvival = isSurvival;
      }
      
      public function get metaEnemyChallenge() : MetaEnemyLoaded
      {
         return this._metaEnemyChallenge;
      }
      
      public function PlaySound(idSfx:int, maxSound:int = 4) : void
      {
         var result:Sound2D = null;
         var metaSound:MetaSound2D = MetaManager.instance.CreateMetaSound2D(idSfx);
         metaSound.limitToAddPerFrame = maxSound;
         metaSound.distPan = 2000;
         metaSound.distVolume = 2000;
         result = Jukebox.instance.PlaySoundFromMeta(metaSound);
         if(result == null)
         {
            MetaManager.instance.DestroyMetaData(metaSound);
         }
      }
      
      public function CheckUnlockCoopSurvivalFlag() : void
      {
         var m:ModelFlag = null;
         for(var i:int = 0; i < ModelFlagEnum.ALL.length; i++)
         {
            m = ModelFlagEnum.ALL[i];
            if(m.coopSurvivalWave != -1 && this._survivalLevel >= m.coopSurvivalWave)
            {
               BC_GameProgress.gameProgess.flagManager.UnlockFlag(m);
            }
         }
      }
      
      override public function LoadLevel(metaLevel:MetaLevel, endCallBack:Callback, progressCallback:Callback, autoStartLevelEvent:Boolean = true) : void
      {
         super.LoadLevel(metaLevel,endCallBack,progressCallback,autoStartLevelEvent);
         this._lastFightState = 0;
      }
      
      public function CheckInitGame(screenToClose:BC_Screen) : void
      {
         var m:BC_MetaUnit = null;
         var m1:BC_MetaUnit = null;
         if(BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl == 1 && BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.CREATURE_HUMAN).quantity <= 0)
         {
            BC_GameProgress.gameProgess.metaCollection.AddItemToCollection(new MetaEquipement(12,ModelEquipementEnum.CREATURE_HUMAN));
            BC_GameProgress.gameProgess.metaCollection.AddItemToCollection(new MetaEquipement(6,ModelEquipementEnum.WEAPON_DAGGER));
            BC_GameProgress.gameProgess.metaCollection.AddItemToCollection(new MetaEquipement(6,ModelEquipementEnum.WEAPON_PIKE));
            BC_GameProgress.gameProgess.metaCollection.AddItemToCollection(new MetaEquipement(12,ModelEquipementEnum.ARMOR_RAG));
            BC_GameProgress.gameProgess.CreateArmyInventory();
            m = new BC_MetaUnit(BC_EnemyManager.getNextId());
            m.quantity = 0;
            m.maxQuantity = 6;
            m.unitName = "Front Liner";
            m.playerEquipement = new MetaPlayerEquipement(BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.CREATURE_HUMAN),BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.WEAPON_DAGGER),MetaEquipement.EMPTY_EQUIPEMENT,BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.ARMOR_RAG),MetaEquipement.EMPTY_EQUIPEMENT);
            this.metaArmy1.AddInventoryUnit(m);
            this.metaArmy1.AddUnitToArmy(new GridPos(2,0),m,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(2,1),m,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(2,2),m,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(2,3),m,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(2,4),m,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(2,5),m,this.metaArmy1.metaSquad1);
            m1 = new BC_MetaUnit(BC_EnemyManager.getNextId());
            m1.quantity = 0;
            m1.maxQuantity = 6;
            m1.unitName = "Pikemen";
            m1.playerEquipement = new MetaPlayerEquipement(BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.CREATURE_HUMAN),BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.WEAPON_PIKE),MetaEquipement.EMPTY_EQUIPEMENT,BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.ARMOR_RAG),MetaEquipement.EMPTY_EQUIPEMENT);
            this.metaArmy1.AddInventoryUnit(m1);
            this.metaArmy1.AddUnitToArmy(new GridPos(1,0),m1,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(1,1),m1,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(1,2),m1,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(1,3),m1,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(1,4),m1,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(1,5),m1,this.metaArmy1.metaSquad1);
            this.metaArmy1.creatureInventory[0].quantity = 0;
            this.metaArmy1.itemInventory[0].quantity = 0;
            this.metaArmy1.itemInventory[1].quantity = 0;
            this.metaArmy1.itemInventory[2].quantity = 0;
            StatsStatic.getInstance().SetValue(StatsStatic.ID_UPDATE_1_11_REWARDS,1);
         }
         if(BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl == 1)
         {
            BC_GameProgress.gameProgess.SetCurrentSelectedArmy(1);
            this.Save(new Callback(this.AfterSaveInit,this,[screenToClose]));
            return;
         }
         this.CheckUnlockFlag();
         if(ExternalAPIManager.getPremiumAPI().loggedIn)
         {
            this.CheckDailyReward();
         }
         if(screenToClose)
         {
            this.Save(new Callback(this.AfterSaveOffline,this,[screenToClose]));
         }
      }
      
      public function set immortalWarrior(immortalWarrior:BC_MetaUnit) : void
      {
         this._immortalWarrior = immortalWarrior;
      }
      
      public function set lastFightState(lastFightState:int) : void
      {
         this._lastFightState = lastFightState;
      }
      
      private function get metaArmy1() : BC_MetaArmy
      {
         return BC_GameProgress.gameProgess.metaArmy1;
      }
      
      public function set isRanked(isRanked:Boolean) : void
      {
         this._isRanked = isRanked;
      }
      
      public function CloseBattleFieldScreen() : void
      {
         for(var i:int = 0; i < ScreenManager.instance.activeFactoryObjects.length; i++)
         {
            if(ScreenManager.instance.activeFactoryObjects[i] is BattleSelectionScreen)
            {
               (ScreenManager.instance.activeFactoryObjects[i] as BC_Screen).close();
            }
         }
      }
      
      public function CheckInitGameChallenger(screenToClose:BC_Screen, o:DatabaseObject) : void
      {
         var m:BC_MetaUnit = null;
         var m1:BC_MetaUnit = null;
         if(BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl == 1 && BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.CREATURE_HUMAN).quantity <= 0)
         {
            BC_GameProgress.gameProgess.metaCollection.AddItemToCollection(new MetaEquipement(12,ModelEquipementEnum.CREATURE_HUMAN));
            BC_GameProgress.gameProgess.metaCollection.AddItemToCollection(new MetaEquipement(6,ModelEquipementEnum.WEAPON_DAGGER));
            BC_GameProgress.gameProgess.metaCollection.AddItemToCollection(new MetaEquipement(6,ModelEquipementEnum.WEAPON_PIKE));
            BC_GameProgress.gameProgess.metaCollection.AddItemToCollection(new MetaEquipement(12,ModelEquipementEnum.ARMOR_RAG));
            BC_GameProgress.gameProgess.CreateArmyInventory();
            m = new BC_MetaUnit(BC_EnemyManager.getNextId());
            m.quantity = 0;
            m.maxQuantity = 6;
            m.unitName = "Front Liner";
            m.playerEquipement = new MetaPlayerEquipement(BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.CREATURE_HUMAN),BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.WEAPON_DAGGER),MetaEquipement.EMPTY_EQUIPEMENT,BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.ARMOR_RAG),MetaEquipement.EMPTY_EQUIPEMENT);
            this.metaArmy1.AddInventoryUnit(m);
            this.metaArmy1.AddUnitToArmy(new GridPos(2,0),m,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(2,1),m,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(2,2),m,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(2,3),m,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(2,4),m,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(2,5),m,this.metaArmy1.metaSquad1);
            m1 = new BC_MetaUnit(BC_EnemyManager.getNextId());
            m1.quantity = 0;
            m1.maxQuantity = 6;
            m1.unitName = "Pikemen";
            m1.playerEquipement = new MetaPlayerEquipement(BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.CREATURE_HUMAN),BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.WEAPON_PIKE),MetaEquipement.EMPTY_EQUIPEMENT,BC_GameProgress.gameProgess.metaCollection.GetCollectionMetaEquipment(ModelEquipementEnum.ARMOR_RAG),MetaEquipement.EMPTY_EQUIPEMENT);
            this.metaArmy1.AddInventoryUnit(m1);
            this.metaArmy1.AddUnitToArmy(new GridPos(1,0),m1,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(1,1),m1,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(1,2),m1,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(1,3),m1,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(1,4),m1,this.metaArmy1.metaSquad1);
            this.metaArmy1.AddUnitToArmy(new GridPos(1,5),m1,this.metaArmy1.metaSquad1);
            this.metaArmy1.creatureInventory[0].quantity = 0;
            this.metaArmy1.itemInventory[0].quantity = 0;
            this.metaArmy1.itemInventory[1].quantity = 0;
            this.metaArmy1.itemInventory[2].quantity = 0;
         }
         var enemyProgress:BC_GameProgress = new BC_GameProgress();
         var params:Array = (o.savefile as String).split("*");
         params.shift();
         var s:String = params[0];
         s = s.substr(1,s.length - 1);
         enemyProgress.Decode(s);
         this._metaEnemyChallenge = new MetaEnemyLoaded();
         this._metaEnemyChallenge.enemyName = o.key.substr(3,o.key.length - 3);
         this._metaEnemyChallenge.fullArmyName = o.key;
         this._metaEnemyChallenge.metaFlag = enemyProgress.metaFlag;
         var armyID:int = parseInt(BC_VersionInfo.challengeWith.substr(BC_VersionInfo.challengeWith.length - 1,1));
         BC_VersionInfo.challengeWith = null;
         this._metaEnemyChallenge.metaArmy = enemyProgress.getArmy(armyID);
         if(BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl == 1)
         {
            BC_GameProgress.gameProgess.SetCurrentSelectedArmy(1);
            this.Save(new Callback(this.AfterSaveInitChallenge,this,[screenToClose]));
            return;
         }
         if(ExternalAPIManager.getPremiumAPI().loggedIn)
         {
            this.CheckDailyReward();
         }
         this.TransitionTo(screenToClose,BC_ScreenFactory.ID_FIGHTAFRIEND_SCREEN);
      }
      
      public function set challengerName(challengerName:String) : void
      {
         this._challengerName = challengerName;
      }
      
      public function get survivalMove() : Boolean
      {
         return this._survivalMove;
      }
      
      public function get friendLoaded() : Boolean
      {
         return this._friendLoaded;
      }
      
      public function get gotoBattleMode() : int
      {
         return this._gotoBattleMode;
      }
      
      public function HideUnitPopup() : void
      {
         this._unitDescriptionScreen.Hide();
      }
      
      override public function Init(metaGame:MetaGame) : void
      {
         super.Init(metaGame);
         instance = this;
         this._isRanked = false;
         this._friendLoaded = false;
         this._currentCampaign = null;
         this._friendArmy = null;
         this._lastFightState = 0;
         this._metaEnemyLoaded = null;
         this._metaEnemyChallenge = null;
         this._isChallenge = false;
         this._isFriendBattle = false;
         this._isSurvival = false;
         this._survivalMove = false;
         this._survivalLevel = 1;
         this._isSurvivalCoop = false;
         this._survivalCoopArmy = null;
         this._myArmyBackRow = true;
         this._gotoBattleMode = -1;
         this._tournamentLoaded = new Vector.<MetaEnemyLoaded>();
         this._currentTournamentLevel = 1;
         this._isTournament = false;
         this._tournamentReward = -1;
         Jukebox.instance.SetMusicVolume(0.5);
         this._unitDescriptionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_UNITDESCRIPTION_SCREEN,false,true) as UnitDescriptionScreen;
         this.HideUnitPopup();
      }
      
      private function AfterSaveOffline(screenToClose:BC_Screen) : void
      {
         this.TransitionTo(screenToClose,BC_ScreenFactory.ID_ARMYCREATION_SCREEN);
         if(!this.gamePrefs.soundOn)
         {
            this.gamePrefs.soundVolume = 0;
         }
         if(!this.gamePrefs.musicOn)
         {
            this.gamePrefs.musicVolume = 0;
         }
         this.gamePrefs.SetSoundOn(true);
         this.gamePrefs.soundVolume = Math.round(this.gamePrefs.soundVolume);
         this.gamePrefs.SetMusicOn(true);
         this.gamePrefs.musicVolume = Math.round(this.gamePrefs.musicVolume);
      }
      
      public function EndGame() : void
      {
         var i:int = 0;
         this._ingame.Hide();
         this.HideUnitPopup();
         speedManager.SetSpeed(1);
         this._lastFightState = this._roundManager.victoriousTeam();
         if(this._currentCampaign)
         {
            for(i = 0; i < BC_GameProgress.gameProgess.metaCampaignProgress.GetChapterEndActArray().length; i++)
            {
               if(this._currentCampaign.campaignStage == BC_GameProgress.gameProgess.metaCampaignProgress.GetChapterEndActArray()[i] && this._lastFightState == EndActScreen.VICTORY)
               {
                  ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ENDACT_SCREEN);
                  return;
               }
            }
            ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ENDGAME_CAMPAIGN_SCREEN);
         }
         else if(this._isSurvival)
         {
            ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ENDGAME_SURVIVAL_SCREEN);
         }
         else
         {
            ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ENDGAME_SCREEN);
         }
      }
      
      public function set metaEnemyChallenge(metaEnemyChallenge:MetaEnemyLoaded) : void
      {
         this._metaEnemyChallenge = metaEnemyChallenge;
      }
      
      public function GiveRandom(num1:int, v:Vector.<ModelEquipement>, result:Vector.<MetaEquipement>, rarity:int) : void
      {
         var pick:ModelEquipement = null;
         var i:int = 0;
         var r:Number = NaN;
         var r1:Number = NaN;
         var maxNum:int = num1;
         var num:int = num1;
         var amount:int = 0;
         var AlreadyHave:Boolean = false;
         while(num > 0)
         {
            AlreadyHave = false;
            pick = v[Math.floor(Math.random() * v.length)];
            if(ModelEquipementEnum.IsItemLocked(pick))
            {
               AlreadyHave = true;
            }
            if(!AlreadyHave)
            {
               for(i = 0; i < result.length; i++)
               {
                  if(result[i].modelEquipement.id == pick.id)
                  {
                     AlreadyHave = true;
                     break;
                  }
               }
            }
            if(!AlreadyHave)
            {
               if(pick.isArtillery())
               {
                  if(rarity == ModelEquipement.RARITY_LEGENDARY)
                  {
                     if(this._nbArtilleryGiven > 0)
                     {
                        amount = 1;
                     }
                  }
                  else if(rarity == ModelEquipement.RARITY_RARE)
                  {
                     if(maxNum <= 2)
                     {
                        if(this._nbArtilleryGiven > 0)
                        {
                           amount = 1;
                        }
                     }
                     else
                     {
                        r = Math.random();
                        if(r <= 0.5)
                        {
                           if(this._nbArtilleryGiven > 0)
                           {
                              amount = 1;
                           }
                        }
                        else if(this._nbArtilleryGiven > 1)
                        {
                           amount = 2;
                        }
                     }
                  }
                  else if(rarity == ModelEquipement.RARITY_UNCOMMUN)
                  {
                     amount = this._nbArtilleryGiven;
                  }
                  else
                  {
                     amount = this._nbArtilleryGiven;
                  }
                  if(amount > num)
                  {
                     amount = num;
                  }
                  this._nbArtilleryGiven -= amount;
               }
               else
               {
                  if(rarity == ModelEquipement.RARITY_LEGENDARY)
                  {
                     amount = 1;
                  }
                  else if(rarity == ModelEquipement.RARITY_RARE)
                  {
                     if(maxNum <= 2)
                     {
                        amount = 1;
                     }
                     else
                     {
                        r1 = Math.random();
                        if(r1 <= 0.5)
                        {
                           amount = 1;
                        }
                        else
                        {
                           amount = 2;
                        }
                     }
                  }
                  else if(rarity == ModelEquipement.RARITY_UNCOMMUN)
                  {
                     amount = Math.ceil(Math.random() * 6);
                  }
                  else
                  {
                     amount = Math.ceil(Math.random() * 6 + 6);
                  }
                  if(amount > num)
                  {
                     amount = num;
                  }
               }
               if(amount > 0)
               {
                  num -= amount;
                  this.AddEquipement(pick,amount);
                  result.push(new MetaEquipement(amount,pick));
               }
            }
         }
      }
      
      public function get grid() : Grid
      {
         return this._roundManager.grid;
      }
      
      public function get roundManager() : RoundManager
      {
         return this._roundManager;
      }
      
      public function set currentCampaign(currentCampaign:ModelCampaign) : void
      {
         this._currentCampaign = currentCampaign;
      }
      
      public function get friendArmy() : BC_MetaArmy
      {
         return this._friendArmy;
      }
      
      public function get skeleton() : BC_MetaUnit
      {
         return this._skeleton;
      }
      
      public function set survivalMove(survivalMove:Boolean) : void
      {
         this._survivalMove = survivalMove;
      }
      
      private function AfterSaveInitChallenge(screenToClose:BC_Screen) : void
      {
         if(ExternalAPIManager.getPremiumAPI().loggedIn)
         {
            this.CheckDailyReward();
         }
         this.TransitionTo(screenToClose,BC_ScreenFactory.ID_FIGHTAFRIEND_SCREEN);
      }
      
      public function get isFriendBattle() : Boolean
      {
         return this._isFriendBattle;
      }
      
      public function get tournamentLoaded() : Vector.<MetaEnemyLoaded>
      {
         return this._tournamentLoaded;
      }
      
      public function get metaEnemyLoaded() : MetaEnemyLoaded
      {
         return this._metaEnemyLoaded;
      }
      
      public function set fbConnected(fbConnected:Boolean) : void
      {
         this._fbConnected = fbConnected;
      }
      
      public function StartRound() : void
      {
         this._roundManager.start = true;
      }
      
      public function set isTournament(isTournament:Boolean) : void
      {
         this._isTournament = isTournament;
      }
      
      public function get battleSpeed() : int
      {
         return this._battleSpeed;
      }
      
      public function get isChallenge() : Boolean
      {
         return this._isChallenge;
      }
      
      public function AddEquipement(modelEquipement:ModelEquipement, quantity:int) : void
      {
         var metaArmy:BC_MetaArmy = null;
         var model:ModelEquipement = null;
         var b_found:Boolean = false;
         var i:int = 0;
         for(var j:int = 1; j <= 5; j++)
         {
            metaArmy = BC_GameProgress.gameProgess.getArmy(j);
            b_found = false;
            i = 0;
            while(i < metaArmy.creatureInventory.length && !b_found)
            {
               model = metaArmy.creatureInventory[i].modelEquipement;
               if(model.id == modelEquipement.id)
               {
                  metaArmy.creatureInventory[i].quantity += quantity;
                  b_found = true;
               }
               i++;
            }
            i = 0;
            while(i < metaArmy.itemInventory.length && !b_found)
            {
               model = metaArmy.itemInventory[i].modelEquipement;
               if(model.id == modelEquipement.id)
               {
                  metaArmy.itemInventory[i].quantity += quantity;
                  b_found = true;
               }
               i++;
            }
            if(!b_found)
            {
               if(modelEquipement.type == ModelEquipement.TYPE_CREATURE)
               {
                  metaArmy.creatureInventory.push(new MetaEquipement(quantity,modelEquipement));
               }
               else
               {
                  metaArmy.itemInventory.push(new MetaEquipement(quantity,modelEquipement));
               }
            }
         }
         b_found = false;
         var v:Vector.<MetaEquipement> = new Vector.<MetaEquipement>();
         v = BC_GameProgress.gameProgess.metaCollection.collectionInventory.slice();
         for(i = 0; i < v.length; i++)
         {
            if(modelEquipement.id == v[i].modelEquipement.id)
            {
               BC_GameProgress.gameProgess.metaCollection.collectionInventory[i].quantity += quantity;
               b_found = true;
            }
         }
         if(b_found)
         {
            return;
         }
         BC_GameProgress.gameProgess.metaCollection.collectionInventory.push(new MetaEquipement(quantity,modelEquipement));
      }
      
      public function get team2() : BattleArmy
      {
         return this._roundManager.team2;
      }
      
      public function RefreshFriendList() : void
      {
         for(var i:int = 0; i < ScreenManager.instance.activeFactoryObjects.length; i++)
         {
            if(ScreenManager.instance.activeFactoryObjects[i] is BattleSelectionScreen)
            {
               (ScreenManager.instance.activeFactoryObjects[i] as BattleSelectionScreen).SetFriend();
            }
         }
      }
      
      public function get tournamentReward() : int
      {
         return this._tournamentReward;
      }
      
      public function get currentTournamentLevel() : int
      {
         return this._currentTournamentLevel;
      }
      
      public function set gotoBattleMode(gotoBattleMode:int) : void
      {
         this._gotoBattleMode = gotoBattleMode;
      }
      
      public function BuyBoosterPack(modelBoosterPack:ModelBoosterPack, SetType:int) : void
      {
         var i:int = 0;
         var result:Vector.<MetaEquipement> = new Vector.<MetaEquipement>();
         if(modelBoosterPack.itemArray.length > 0)
         {
            for(i = 0; i < modelBoosterPack.itemArray.length; i++)
            {
               this.AddEquipement(modelBoosterPack.itemArray[i].modelEquipement,modelBoosterPack.itemArray[i].quantity);
               result.push(modelBoosterPack.itemArray[i]);
            }
         }
         else
         {
            this._nbArtilleryGiven = 3;
            this.GiveRandom(modelBoosterPack.nbCommun,ModelEquipementEnum.GetCommun(SetType),result,ModelEquipement.RARITY_COMMUN);
            this.GiveRandom(modelBoosterPack.nbUncommun,ModelEquipementEnum.GetUnCommun(SetType),result,ModelEquipement.RARITY_UNCOMMUN);
            this.GiveRandom(modelBoosterPack.nbRare,ModelEquipementEnum.GetRare(SetType),result,ModelEquipement.RARITY_RARE);
            this.GiveRandom(modelBoosterPack.nbLegendary,ModelEquipementEnum.GetLegendary(SetType),result,ModelEquipement.RARITY_LEGENDARY);
         }
         var boosterPackInfoScreen:BoosterPackInfoScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_BOOSTERPACKINFO_SCREEN,false,true) as BoosterPackInfoScreen;
         boosterPackInfoScreen.reward(result,modelBoosterPack);
      }
      
      public function set friendLoaded(friendLoaded:Boolean) : void
      {
         this._friendLoaded = friendLoaded;
      }
      
      public function set isFriendBattle(isFriendBattle:Boolean) : void
      {
         this._isFriendBattle = isFriendBattle;
      }
      
      public function get isSurvival() : Boolean
      {
         return this._isSurvival;
      }
      
      override protected function LevelLoaded(c:Callback) : void
      {
         super.LevelLoaded(c);
         this._ingame = IngameScreen(ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_INGAME_SCREEN));
         this._ingame.Hide();
      }
      
      public function set grid(grid:Grid) : void
      {
         this._roundManager.grid = grid;
      }
      
      public function set roundManager(roundManager:RoundManager) : void
      {
         this._roundManager = roundManager;
      }
      
      public function InitRoundManager(army1:BC_MetaArmy, army2:BC_MetaArmy) : void
      {
         Jukebox.instance.FadeToMusic(BC_SfxFactory.getRandomMusic());
         this._roundManager = new RoundManager(this);
         this._roundManager.CreateGrid();
         var a1:BC_MetaArmy = new BC_MetaArmy(-1);
         var a2:BC_MetaArmy = new BC_MetaArmy(-1);
         a1.Copy(army1);
         a2.Copy(army2);
         this._roundManager.Init(a1,a2);
         this._roundManager.SortOnce();
         this._ingame.Show();
         this._ingame.reInit();
         BC_GameProgress.gameProgess.tutorialManager.ShowTutorial(ModelTutorialEnum.TUTORIAL_INGAME);
      }
      
      public function set myArmyBackRow(myArmyBackRow:Boolean) : void
      {
         this._myArmyBackRow = myArmyBackRow;
      }
      
      public function get isRanked() : Boolean
      {
         return this._isRanked;
      }
      
      public function get ingame() : IngameScreen
      {
         return this._ingame;
      }
      
      public function set tournamentLoaded(tournamentLoaded:Vector.<MetaEnemyLoaded>) : void
      {
         this._tournamentLoaded = tournamentLoaded;
      }
      
      public function Save(c:Callback = null) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_SAVE_SCREEN) > 0)
         {
            return;
         }
         var s:SaveScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_SAVE_SCREEN,false,true) as SaveScreen;
         s.endCallBack = c;
      }
      
      public function get lastFightState() : int
      {
         return this._lastFightState;
      }
      
      public function get team1() : BattleArmy
      {
         return this._roundManager.team1;
      }
      
      public function UnlockAll() : void
      {
         for(var i:int = 0; i < ModelEquipementEnum.ALL.length; i++)
         {
            this.AddEquipement(ModelEquipementEnum.ALL[i],99);
         }
         BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl = 100;
         BC_GameProgress.gameProgess.metaCampaignProgress.ashesCampaignLvl = 100;
      }
      
      public function CheckDailyReward() : void
      {
         if(Main.instance.serverDay != -1 && BC_GameProgress.gameProgess.dailyRewardDay != Main.instance.serverDay)
         {
            ++BC_GameProgress.gameProgess.dailyStage;
            if(BC_GameProgress.gameProgess.dailyStage > 5)
            {
               BC_GameProgress.gameProgess.dailyStage = 1;
            }
            BC_GameProgress.gameProgess.dailyRewardDay = Main.instance.serverDay;
            ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_DAILYREWARD_SCREEN,false,true);
         }
      }
      
      public function get currentCampaign() : ModelCampaign
      {
         return this._currentCampaign;
      }
      
      public function set skeleton(skeleton:BC_MetaUnit) : void
      {
         this._skeleton = skeleton;
      }
      
      public function get isTournament() : Boolean
      {
         return this._isTournament;
      }
      
      public function get fbConnected() : Boolean
      {
         return this._fbConnected;
      }
      
      public function CheckUnlockSoloSurvivalFlag() : void
      {
         var m:ModelFlag = null;
         for(var i:int = 0; i < ModelFlagEnum.ALL.length; i++)
         {
            m = ModelFlagEnum.ALL[i];
            if(m.soloSurvivalWave != -1 && this._survivalLevel >= m.soloSurvivalWave)
            {
               BC_GameProgress.gameProgess.flagManager.UnlockFlag(m);
            }
         }
      }
      
      public function get challengerName() : String
      {
         return this._challengerName;
      }
      
      public function GiveReward(v:Vector.<MetaEquipement>) : void
      {
         var pick:MetaEquipement = null;
         for(var i:int = 0; i < v.length; i++)
         {
            pick = v[i];
            this.AddEquipement(v[i].modelEquipement,v[i].quantity);
         }
      }
      
      public function set isChallenge(isChallenge:Boolean) : void
      {
         this._isChallenge = isChallenge;
      }
      
      public function set currentTournamentLevel(currentTournamentLevel:int) : void
      {
         this._currentTournamentLevel = currentTournamentLevel;
      }
      
      public function set demonWarrior(demonWarrior:BC_MetaUnit) : void
      {
         this._demonWarrior = demonWarrior;
      }
      
      private function hLoadComplete(evt:Event) : void
      {
         this._excelXml = new XML(evt.target.data);
         MiscConstants.ReadData();
      }
      
      public function set survivalLevel(survivalLevel:int) : void
      {
         this._survivalLevel = survivalLevel;
      }
      
      public function set concede(concede:Boolean) : void
      {
         this._concede = concede;
      }
      
      public function CheckUnlockFlag() : void
      {
         var m:ModelFlag = null;
         for(var i:int = 0; i < ModelFlagEnum.ALL.length; i++)
         {
            m = ModelFlagEnum.ALL[i];
            if(m.numTournamentToWin != -1 && m.numTournamentToWin <= BC_GameProgress.gameProgess.tournamentGold)
            {
               BC_GameProgress.gameProgess.flagManager.UnlockFlag(m);
            }
         }
      }
      
      public function get myArmyBackRow() : Boolean
      {
         return this._myArmyBackRow;
      }
      
      override protected function Destroy() : void
      {
         super.Destroy();
         if(this._ingame)
         {
            this._ingame.close();
         }
         if(this._roundManager)
         {
            this._roundManager.Destroy();
         }
      }
      
      public function get demonWarrior() : BC_MetaUnit
      {
         return this._demonWarrior;
      }
      
      public function TransitionTo(screenToClose:BC_Screen, screenID:int) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_TRANSITION_SCREEN) > 0)
         {
            return;
         }
         var t:TransitionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_TRANSITION_SCREEN,false,true) as TransitionScreen;
         t.SetScreen(screenToClose,screenID);
      }
      
      public function set friendArmy(friendArmy:BC_MetaArmy) : void
      {
         this._friendArmy = friendArmy;
      }
      
      private function get gamePrefs() : BC_GamePrefs
      {
         return FileManager.instance.gamePrefs as BC_GamePrefs;
      }
      
      public function get survivalLevel() : int
      {
         return this._survivalLevel;
      }
      
      public function set team2(team2:BattleArmy) : void
      {
         this._roundManager.team2 = team2;
      }
      
      public function ShowUnitPopup(metaUnit:BC_MetaUnit) : void
      {
         this._unitDescriptionScreen.Show();
         var u:UnitView = new UnitView(AnimationManager.instance.CreateAnimation(0));
         u.SetMetaUnit(metaUnit);
         this._unitDescriptionScreen.SetView(u);
      }
      
      public function get concede() : Boolean
      {
         return this._concede;
      }
      
      public function set battleSpeed(battleSpeed:int) : void
      {
         this._battleSpeed = battleSpeed;
      }
      
      public function set team1(team1:BattleArmy) : void
      {
         this._roundManager.team1 = team1;
      }
      
      override public function Update() : void
      {
         super.Update();
         if(this._roundManager)
         {
            this._roundManager.Update();
         }
      }
      
      public function IsInFirstAct() : Boolean
      {
         if(BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl <= ModelCampaignEnum.ACT_1_1.length)
         {
            return true;
         }
         return false;
      }
      
      public function set metaEnemyLoaded(metaEnemyLoaded:MetaEnemyLoaded) : void
      {
         this._metaEnemyLoaded = metaEnemyLoaded;
      }
      
      public function get isSurvivalCoop() : Boolean
      {
         return this._isSurvivalCoop;
      }
      
      public function get survivalCoopArmy() : BC_MetaArmy
      {
         return this._survivalCoopArmy;
      }
      
      public function set isSurvivalCoop(isSurvivalCoop:Boolean) : void
      {
         this._isSurvivalCoop = isSurvivalCoop;
      }
      
      public function set survivalCoopArmy(survivalCoopArmy:BC_MetaArmy) : void
      {
         this._survivalCoopArmy = survivalCoopArmy;
      }
      
      public function set isConnected(isConnected:Boolean) : void
      {
         this._isConnected = isConnected;
      }
      
      public function get isConnected() : Boolean
      {
         return this._isConnected;
      }
   }
}

