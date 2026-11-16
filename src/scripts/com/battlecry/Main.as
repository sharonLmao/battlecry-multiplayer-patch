package com.battlecry
{
   import com.battlecry.ammo.BC_AmmoFactory;
   import com.battlecry.behavior.BC_BehaviorFactory;
   import com.battlecry.behavior.BC_BehaviorManager;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.debug.BC_Debug;
   import com.battlecry.effects.BC_GameEffectFactory;
   import com.battlecry.effects.BC_GameEffectManager;
   import com.battlecry.enemy.BC_EnemyFactory;
   import com.battlecry.enemy.BC_EnemyManager;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.hero.BC_HeroFactory;
   import com.battlecry.hero.BC_HeroManager;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.BC_GameProgressFactory;
   import com.battlecry.io.BC_MetaExternalItemEnum;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.io.PlayerIO.PlayerIOConnection;
   import com.battlecry.items.BC_ItemFactory;
   import com.battlecry.items.BC_ItemManager;
   import com.battlecry.levelEvent.AllMetaLevels;
   import com.battlecry.levelEvent.BC_LevelEventFactory;
   import com.battlecry.meta.BC_MetaFactory;
   import com.battlecry.meta.BC_MetaManager;
   import com.battlecry.meta.model.ModelBoosterPackEnum;
   import com.battlecry.meta.model.ModelCampaignEnum;
   import com.battlecry.meta.model.ModelEquipementEnum;
   import com.battlecry.meta.model.ModelSurvivalArmyEnum;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.screens.BC_Screen;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.ConnectPlayerIOScreen;
   import com.battlecry.screens.view.ui.UIEffectManager;
   import com.battlecry.weapons.BC_WeaponFactory;
   import com.battlecry.weapons.BC_WeaponManager;
   import com.lachhhEngine.games.GameManagers;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.SpeedManager;
   import com.lachhhEngine.games.ammo.AmmoManager;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.level.levelEvents.LevelEventManager;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.physique.PhysicFactory;
   import com.lachhhEngine.games.physique.PhysicManager;
   import com.lachhhEngine.games.screens.ScreenFactory;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.games.teams.TeamFactory;
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.externalAPI.GamerSafeController;
   import com.lachhhEngine.io.externalAPI.premiumAPI.KongAPIController;
   import com.lachhhEngine.io.externalAPI.premiumAPI.MetaExternalPremiumItem;
   import com.lachhhEngine.io.files.FileManager;
   import com.lachhhEngine.multilingual.ExternalLanguageController;
   import com.lachhhEngine.multilingual.TextFactory;
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.system.Security;
   
   public class Main extends MainGame
   {
      
      public static var instance:Main;
      
      private var _screens:MovieClip = new MovieClip();
      
      private var _canLogin:Boolean;
      
      private var _serverDay:int;
      
      private var _saveAfterTransaction:Boolean;
      
      private var _maccro1:Array;
      
      private var _maccro2:Array;
      
      private var _loginScreenToClose:BC_Screen;
      
      private var _afterMTXCallback:Callback;
      
      private var _itemConsumed:MetaExternalPremiumItem;
      
      public function Main()
      {
         super();
         this._itemConsumed = null;
         addChild(this._screens);
         instance = this;
         this._saveAfterTransaction = false;
      }
      
      private function handleUnload(e:Event) : void
      {
         Destroy();
      }
      
      override public function Update(evt:Event) : void
      {
         super.Update(evt);
         UIEffectManager.Update();
      }
      
      private function ResetAllData() : void
      {
         ModelEquipementEnum.Reset();
         var i:int = 0;
         i = 0;
         while(i < BC_GameProgress.gameProgess.metaArmy1.unitInventory.length)
         {
            BC_GameProgress.gameProgess.metaArmy1.unitInventory[i].playerEquipement.Reset();
            i++;
         }
         i = 0;
         while(i < BC_GameProgress.gameProgess.metaArmy2.unitInventory.length)
         {
            BC_GameProgress.gameProgess.metaArmy2.unitInventory[i].playerEquipement.Reset();
            i++;
         }
         i = 0;
         while(i < BC_GameProgress.gameProgess.metaArmy3.unitInventory.length)
         {
            BC_GameProgress.gameProgess.metaArmy3.unitInventory[i].playerEquipement.Reset();
            i++;
         }
         i = 0;
         while(i < BC_GameProgress.gameProgess.metaArmy4.unitInventory.length)
         {
            BC_GameProgress.gameProgess.metaArmy4.unitInventory[i].playerEquipement.Reset();
            i++;
         }
      }
      
      public function CheckArmorGamesMTX(AfterMTXCallBack:Callback) : void
      {
         if(AfterMTXCallBack != null)
         {
            this._afterMTXCallback = AfterMTXCallBack;
         }
         var num:int = 0;
         num = PlayerIOBattleCryController.getInstance().GetItemNumBought(BC_MetaExternalItemEnum.MONEY_PACK_1);
         if(num > 0)
         {
            this._itemConsumed = BC_MetaExternalItemEnum.MONEY_PACK_1;
            PlayerIOBattleCryController.getInstance().Consume(BC_MetaExternalItemEnum.MONEY_PACK_1,this.ConsumeSuccess,this.ConsumeFail);
            return;
         }
         num = PlayerIOBattleCryController.getInstance().GetItemNumBought(BC_MetaExternalItemEnum.MONEY_PACK_2);
         if(num > 0)
         {
            this._itemConsumed = BC_MetaExternalItemEnum.MONEY_PACK_2;
            PlayerIOBattleCryController.getInstance().Consume(BC_MetaExternalItemEnum.MONEY_PACK_2,this.ConsumeSuccess,this.ConsumeFail);
            return;
         }
         num = PlayerIOBattleCryController.getInstance().GetItemNumBought(BC_MetaExternalItemEnum.MONEY_PACK_3);
         if(num > 0)
         {
            this._itemConsumed = BC_MetaExternalItemEnum.MONEY_PACK_3;
            PlayerIOBattleCryController.getInstance().Consume(BC_MetaExternalItemEnum.MONEY_PACK_3,this.ConsumeSuccess,this.ConsumeFail);
            return;
         }
         num = PlayerIOBattleCryController.getInstance().GetItemNumBought(BC_MetaExternalItemEnum.MONEY_PACK_4);
         if(num > 0)
         {
            this._itemConsumed = BC_MetaExternalItemEnum.MONEY_PACK_4;
            PlayerIOBattleCryController.getInstance().Consume(BC_MetaExternalItemEnum.MONEY_PACK_4,this.ConsumeSuccess,this.ConsumeFail);
            return;
         }
         num = PlayerIOBattleCryController.getInstance().GetItemNumBought(BC_MetaExternalItemEnum.MONEY_PACK_5);
         if(num > 0)
         {
            this._itemConsumed = BC_MetaExternalItemEnum.MONEY_PACK_5;
            PlayerIOBattleCryController.getInstance().Consume(BC_MetaExternalItemEnum.MONEY_PACK_5,this.ConsumeSuccess,this.ConsumeFail);
            return;
         }
         if(this._saveAfterTransaction)
         {
            this._saveAfterTransaction = false;
            BC_Game.instance.Save();
         }
         if(this._afterMTXCallback)
         {
            this._afterMTXCallback.DoCallback();
         }
         this._afterMTXCallback = null;
      }
      
      public function LevelLoaded() : void
      {
         _game.camera.Goto(_game,300,200,1000);
         addChildAt(_game,0);
      }
      
      private function onLogin() : void
      {
         if(!this._canLogin)
         {
            return;
         }
         var connectPlayerIO:ConnectPlayerIOScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_CONNECT_PLAYERIO_SCREEN) as ConnectPlayerIOScreen;
         connectPlayerIO.SetInfo(this._loginScreenToClose);
      }
      
      public function SetPurchaseCallback() : void
      {
         ExternalAPIManager.getPremiumAPI().onPurchaseCallback = new Callback(this.onItemPurchased,this,null);
      }
      
      override protected function onItemPurchased() : void
      {
         if(!GamerSafeController.BC_IsCheat())
         {
            return;
         }
         var ammount:Number = Number(NaN);
         var d:Date = null;
         super.onItemPurchased();
         if(ExternalAPIManager.getPremiumAPI().IsLastItemPurchased(BC_MetaExternalItemEnum.MONEY_PACK_1))
         {
            BC_GameProgress.gameProgess.cash += 4000;
            ammount = 4000;
         }
         if(ExternalAPIManager.getPremiumAPI().IsLastItemPurchased(BC_MetaExternalItemEnum.MONEY_PACK_2))
         {
            BC_GameProgress.gameProgess.cash += 12500;
            ammount = 12500;
         }
         if(ExternalAPIManager.getPremiumAPI().IsLastItemPurchased(BC_MetaExternalItemEnum.MONEY_PACK_3))
         {
            BC_GameProgress.gameProgess.cash += 30000;
            ammount = 30000;
         }
         if(ExternalAPIManager.getPremiumAPI().IsLastItemPurchased(BC_MetaExternalItemEnum.MONEY_PACK_4))
         {
            BC_GameProgress.gameProgess.cash += 50000;
            ammount = 50000;
         }
         if(ExternalAPIManager.getPremiumAPI().IsLastItemPurchased(BC_MetaExternalItemEnum.MONEY_PACK_5))
         {
            BC_GameProgress.gameProgess.cash += 350000;
            ammount = 350000;
         }
         if(PlayerIOBattleCryController.getInstance())
         {
            d = new Date();
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.createObject("MTX",Main.instance.GetPlayerName() + "_" + d.fullYear + "_" + (d.month + 1) + "_" + Main.instance.serverDay + "_" + d.hours + "_" + d.minutes + "_" + d.seconds,{"MTXAmmount":ammount});
         }
         BC_Game.instance.Save();
      }
      
      override protected function afterSavedFiledRetreived() : void
      {
         super.afterSavedFiledRetreived();
         FileManager.instance.SelectGameProgress(FileManager.instance.GetGameProgress(0));
      }
      
      private function ConsumeFail() : void
      {
         this.CheckArmorGamesMTX(null);
      }
      
      public function set canLogin(canLogin:Boolean) : void
      {
         this._canLogin = canLogin;
      }
      
      private function CheckMaccroUsed() : void
      {
         var maccroUsed:Boolean = false;
         var i:int = 0;
         var p1:Point = null;
         var p2:Point = null;
         if(this._maccro1.length == this._maccro2.length)
         {
            if(this._maccro1.length <= 3)
            {
               Utils.ClearArray(this._maccro1);
               Utils.ClearArray(this._maccro2);
               return;
            }
            maccroUsed = true;
            i = 0;
            while(i < this._maccro1.length)
            {
               p1 = this._maccro1[i];
               p2 = this._maccro2[i];
               if(maccroUsed && p1.x != p2.x || p1.y != p2.y)
               {
                  maccroUsed = false;
               }
               i++;
            }
            if(maccroUsed)
            {
               Utils.ClearArray(this._maccro1);
               Utils.ClearArray(this._maccro2);
               ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_CAPTCHA_SCREEN,false,true);
            }
         }
         if(this._maccro2.length > this._maccro1.length)
         {
            Utils.ClearArray(this._maccro1);
            Utils.ClearArray(this._maccro2);
         }
      }
      
      private function ItemPurchased(m:MetaExternalPremiumItem) : void
      {
         if(!GamerSafeController.BC_IsCheat())
         {
            return;
         }
         if(m.idPayVault == BC_MetaExternalItemEnum.MONEY_PACK_1.idPayVault)
         {
            BC_GameProgress.gameProgess.cash += 4000;
         }
         if(m.idPayVault == BC_MetaExternalItemEnum.MONEY_PACK_2.idPayVault)
         {
            BC_GameProgress.gameProgess.cash += 12500;
         }
         if(m.idPayVault == BC_MetaExternalItemEnum.MONEY_PACK_3.idPayVault)
         {
            BC_GameProgress.gameProgess.cash += 30000;
         }
         if(m.idPayVault == BC_MetaExternalItemEnum.MONEY_PACK_4.idPayVault)
         {
            BC_GameProgress.gameProgess.cash += 50000;
         }
         if(m.idPayVault == BC_MetaExternalItemEnum.MONEY_PACK_5.idPayVault)
         {
            BC_GameProgress.gameProgess.cash += 350000;
         }
      }
      
      public function get serverDay() : int
      {
         return this._serverDay;
      }
      
      public function GetPIOid() : String
      {
         if(BC_VersionInfo.isGamerSafe)
         {
            return "GS_" + (ExternalAPIManager.getPremiumAPI() as GamerSafeController).playerName;
         }
         if(BC_VersionInfo.isKongregate)
         {
            return "KG_" + (ExternalAPIManager.getPremiumAPI() as KongAPIController).accountName;
         }
         if(BC_VersionInfo.isArmorGames)
         {
            return "AG_" + BC_VersionInfo.armorGamesController.userId;
         }
         return "";
      }
      
      private function ConsumeSuccess() : void
      {
         this.ItemPurchased(this._itemConsumed);
         this._itemConsumed = null;
         this._saveAfterTransaction = true;
         this.CheckArmorGamesMTX(null);
      }
      
      public function get loginScreenToClose() : BC_Screen
      {
         return this._loginScreenToClose;
      }
      
      public function LaunchGame() : void
      {
         _game.LoadLevel(AllMetaLevels.A1_Outside,new Callback(this.LevelLoaded,this,null),null);
      }
      
      public function get canLogin() : Boolean
      {
         return this._canLogin;
      }
      
      public function GetPrefix() : String
      {
         if(BC_VersionInfo.isGamerSafe)
         {
            return "GS_";
         }
         if(BC_VersionInfo.isKongregate)
         {
            return "KG_";
         }
         if(BC_VersionInfo.isArmorGames)
         {
            return "AG_";
         }
         return "";
      }
      
      override protected function CreateManagers() : void
      {
         _game = new BC_Game(this);
         TextFactory.CreateInstance(new BC_TextFactory());
         _animMgr = new AnimationManager(new BC_AnimationFactory());
         _jukeBox = new Jukebox(new BC_SfxFactory());
         _screenMgr = new ScreenManager(this,this._screens,new BC_ScreenFactory(),_game);
         _physicMgr = new PhysicManager(_game,new PhysicFactory());
         new FileManager(this,new BC_GameProgressFactory(),1,"Game");
         _gameManagers = new GameManagers(new AmmoManager(_game,new BC_AmmoFactory()),new BC_BehaviorManager(_game,new BC_BehaviorFactory()),new BC_GameEffectManager(_game,new BC_GameEffectFactory()),new BC_EnemyManager(_game,new BC_EnemyFactory()),new LevelEventManager(_game,new BC_LevelEventFactory()),new BC_HeroManager(_game,new BC_HeroFactory()),new BC_ItemManager(_game,new BC_ItemFactory()),new BC_MetaManager(_game,new BC_MetaFactory()),new SpeedManager(),new BC_WeaponManager(_game,new BC_WeaponFactory()),new TeamFactory());
         _metaGame = MetaManager.instance.CreateMetaGame(800,600);
         _metaGame.debug = false;
         _metaGame.gameManagers = _gameManagers;
         _game.Init(_metaGame);
         addChildAt(_game,0);
         BC_Debug.Init(_game);
         _game.camera.SetEase(0.05,0.05,0.085);
      }
      
      private function CheckAlreadyHas(p:Point) : Boolean
      {
         var pCheck:Point = null;
         var maccro1Array:Array = new Array();
         var registerMaccro1:Boolean = false;
         var lastPoint:Point = null;
         var i:int = 0;
         for(; i < this._maccro1.length; i++)
         {
            pCheck = this._maccro1[i];
            if(lastPoint)
            {
               if(lastPoint.x == pCheck.x && lastPoint.y == pCheck.y)
               {
                  registerMaccro1 = false;
                  this._maccro1.splice(i,1);
                  i--;
                  continue;
               }
            }
            if(this._maccro1.length <= 1)
            {
               if(pCheck.x == p.x && pCheck.y == p.y)
               {
                  registerMaccro1 = false;
                  this._maccro1.splice(i,1);
                  i--;
                  continue;
               }
            }
            if(registerMaccro1)
            {
               maccro1Array.push(pCheck);
            }
            else if(pCheck.x == p.x && pCheck.y == p.y)
            {
               registerMaccro1 = true;
               maccro1Array.push(pCheck);
            }
            lastPoint = pCheck;
         }
         if(registerMaccro1)
         {
            this._maccro1 = maccro1Array;
            return true;
         }
         if(this._maccro1.length >= 25)
         {
            return false;
         }
         return false;
      }
      
      public function set serverDay(serverDay:int) : void
      {
         this._serverDay = serverDay;
      }
      
      public function TwitterLink() : void
      {
         if(BC_VersionInfo.isGamerSafe)
         {
            Utils.navigateToURLAndRecord(new URLRequest("https://twitter.com/intent/tweet?source=webclient&text=" + "http://www.berzerkstudio.com/games/battlecry/GS/?friend=" + this.GetPIOid() + "_" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId));
         }
         else if(BC_VersionInfo.isKongregate)
         {
            Utils.navigateToURLAndRecord(new URLRequest("https://twitter.com/intent/tweet?source=webclient&text=" + "http://www.berzerkstudio.com/games/battlecry/KG/?friend=" + this.GetPIOid() + "_" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId));
         }
         else if(BC_VersionInfo.isArmorGames)
         {
            Utils.navigateToURLAndRecord(new URLRequest("https://twitter.com/intent/tweet?source=webclient&text=" + "http://www.berzerkstudio.com/games/battlecry/AG/?friend=" + this.GetPIOid() + "_" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId));
         }
      }
      
      public function GetMultiplayerName() : String
      {
         if(BC_VersionInfo.isGamerSafe)
         {
            return (ExternalAPIManager.getPremiumAPI() as GamerSafeController).playerName;
         }
         if(BC_VersionInfo.isKongregate)
         {
            return (ExternalAPIManager.getPremiumAPI() as KongAPIController).accountName;
         }
         if(BC_VersionInfo.isArmorGames)
         {
            return BC_VersionInfo.armorGamesController.userId;
         }
         return "";
      }
      
      public function GetPlayerName() : String
      {
         if(BC_VersionInfo.isGamerSafe)
         {
            return "GS_" + (ExternalAPIManager.getPremiumAPI() as GamerSafeController).playerName;
         }
         if(BC_VersionInfo.isKongregate)
         {
            return "KG_" + (ExternalAPIManager.getPremiumAPI() as KongAPIController).accountName;
         }
         if(BC_VersionInfo.isArmorGames)
         {
            return "AG_" + BC_VersionInfo.armorGamesController.userId;
         }
         return "";
      }
      
      public function AddDataLoadedCallBack() : void
      {
         (ExternalAPIManager.getSavedFileAPI() as PlayerIOConnection).onDataLoadedCallback = new Callback(this.afterSavedFiledRetreived,this,null);
      }
      
      public function GetFacebookLink() : String
      {
         if(BC_VersionInfo.isGamerSafe)
         {
            return "http://www.berzerkstudio.com/games/battlecry/GS/?friend=" + this.GetPIOid() + "_" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId;
         }
         if(BC_VersionInfo.isKongregate)
         {
            return "http://www.berzerkstudio.com/games/battlecry/KG/?friend=" + this.GetPIOid() + "_" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId;
         }
         if(BC_VersionInfo.isArmorGames)
         {
            return "http://www.berzerkstudio.com/games/battlecry/AG/?friend=" + this.GetPIOid() + "_" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId;
         }
         return "";
      }
      
      override public function Init() : void
      {
         super.Init();
         this._loginScreenToClose = null;
         this._canLogin = false;
         AllMetaLevels.Init(_game);
         MiscConstants.instance.Init();
         this._serverDay = -1;
         if(this is BC_MainLevelEditor)
         {
            return;
         }
         root.loaderInfo.addEventListener(Event.UNLOAD,this.handleUnload);
         if(VersionInfo.debugVersion || BC_VersionInfo.isKongregate)
         {
            ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_TITLE_SCREEN);
         }
         else if(BC_VersionInfo.isOopla)
         {
            ScreenManager.instance.ShowSuiteScreen([ScreenFactory.BERZERK_INTRO,BC_ScreenFactory.ID_TITLE_SCREEN]);
         }
         else if(BC_VersionInfo.isArmorGames)
         {
            ScreenManager.instance.ShowSuiteScreen([BC_ScreenFactory.ID_AG_SPLASH_SCREEN,ScreenFactory.BERZERK_INTRO,BC_ScreenFactory.ID_TITLE_SCREEN]);
         }
         else if(BC_VersionInfo.challengeWith)
         {
            ScreenManager.instance.ShowSuiteScreen([BC_ScreenFactory.ID_SOGOOD_INTRO_SCREEN,ScreenFactory.BERZERK_INTRO,BC_ScreenFactory.ID_CHALLENGE_LOGIN_SCREEN]);
         }
         else
         {
            ScreenManager.instance.ShowSuiteScreen([BC_ScreenFactory.ID_SOGOOD_INTRO_SCREEN,ScreenFactory.BERZERK_INTRO,BC_ScreenFactory.ID_TITLE_SCREEN]);
         }
         FileManager.instance.SelectGameProgress(FileManager.instance.GetGameProgress(0));
         ModelCampaignEnum.Init();
         ModelSurvivalArmyEnum.Init();
         ModelEquipementEnum.Init();
         ModelBoosterPackEnum.Init();
         MiscConstants.ReadData();
         this.ResetAllData();
         Jukebox.instance.SetMusicVolume(0.75);
         ExternalAPIManager.getPremiumAPI().onLogInCallback = new Callback(this.onLogin,this,null);
         this.SetPurchaseCallback();
         if(BC_VersionInfo.loadExternalEnLanguageXML)
         {
            ExternalLanguageController.LoadExternal("bc_lang_en.xml",TextFactory.instance.LANGUAGE_EN,null);
         }
         if(BC_VersionInfo.connectPIO)
         {
            PlayerIOBattleCryController.InitInstance(root,BC_VersionInfo.modelExternalAPI,false);
         }
         Security.allowDomain("*");
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this.onMaccroClick);
         this._maccro1 = new Array();
         this._maccro2 = new Array();
      }
      
      private function onMaccroClick(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_CAPTCHA_SCREEN) > 0)
         {
            return;
         }
         var p:Point = new Point(Math.round(stage.mouseX),Math.round(stage.mouseY));
         if(this._maccro2.length > 0)
         {
            this._maccro2.push(p);
            this.CheckMaccroUsed();
         }
         else if(this.CheckAlreadyHas(p))
         {
            this._maccro2.push(p);
            this.CheckMaccroUsed();
         }
         else
         {
            this._maccro1.push(p);
         }
      }
      
      public function set loginScreenToClose(loginScreenToClose:BC_Screen) : void
      {
         this._loginScreenToClose = loginScreenToClose;
      }
   }
}

