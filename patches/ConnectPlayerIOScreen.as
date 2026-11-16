package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.meta.model.ModelFlag;
   import com.battlecry.meta.model.ModelFlagEnum;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.externalAPI.GamerSafeController;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.io.files.FileManager;
   import flash.display.MovieClip;
   import playerio.DatabaseObject;
   import playerio.PlayerIOError;
   
   public class ConnectPlayerIOScreen extends BC_Screen
   {
      
      private var _currentLoad:int;
      
      private var _screenToClose:BC_Screen;
      
      public function ConnectPlayerIOScreen()
      {
         super();
      }
      
      private function onErrorConnect() : void
      {
         this.Close(true,null,false);
      }
      
      private function onStart() : void
      {
         if(BC_VersionInfo.isArmorGames)
         {
            this.CheckArmorGames();
         }
         else
         {
            this.LoadArmy();
         }
      }
      
      private function CheckArmorGamesMTX() : void
      {
         Main.instance.CheckArmorGamesMTX(new Callback(this.LoadArmy,this,null));
      }
      
      private function CheckArmorGames() : void
      {
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.payVault.refresh(this.CheckArmorGamesMTX);
      }
      
      private function SuccesFailArmy(p:PlayerIOError) : void
      {
         this.LoadArmy();
      }
      
      public function SetInfo(screenToClose:BC_Screen) : void
      {
         this._screenToClose = screenToClose;
         if(!GamerSafeController.BC_HasName())
         {
            var ls:LoginScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_LOGIN_SCREEN,false,true) as LoginScreen;
            ls.SetInfo(screenToClose);
            this.Close(true,null,true);
            return;
         }
         if(!PlayerIOBattleCryController.getInstance().mySecuredConnection.connected)
         {
            PlayerIOBattleCryController.getInstance().SecureConnectWithPIO(new Callback(this.onStart,this,null),new Callback(this.onErrorConnect,this,null));
         }
         else
         {
            this.AfterSave();
         }
      }
      
      private function SuccesFailArmy500(p:PlayerIOError) : void
      {
         this.LoadArmy();
      }
      
      private function LoadArmy() : void
      {
         var s:String = null;
         ++this._currentLoad;
         if(this._currentLoad <= 4)
         {
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyList",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.getArmy(this._currentLoad).teamId,this.SuccessLoadArmy,this.SuccesFailArmy);
         }
         else if(this._currentLoad <= 5)
         {
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyListSmall",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.getArmy(this._currentLoad).teamId,this.SuccessLoadArmy500,this.SuccesFailArmy500);
         }
         else if(BC_VersionInfo.challengeWith)
         {
            s = BC_VersionInfo.challengeWith.substr(0,BC_VersionInfo.challengeWith.length - 2);
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("PlayerObjects",s,this.SuccessLoadChallenger,this.FailLoadChallenger);
         }
         else
         {
            visual.visible = false;
            BC_Game.instance.Save(new Callback(this.AfterSave,this,null));
         }
      }
      
      private function FailLoadChallenger(p:PlayerIOError) : void
      {
         BC_Game.instance.Save(new Callback(this.AfterSave,this,null));
      }
      
      private function SuccessLoadArmy500(o:DatabaseObject) : void
      {
         if(o)
         {
            BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerWin = o.Wins;
            BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerLost = o.Losts;
            BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerDraw = o.Draws;
            BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerRank = o.RankLvl;
            BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerCurrentRankCount = o.CurrentRankCount;
            this.CheckFlagUnlock(BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerRank);
         }
         else
         {
            BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerActivated = 0;
         }
         this.LoadArmy();
      }
      
      override public function Close(remove:Boolean, c:Callback, quickClose:Boolean) : void
      {
         super.Close(remove,c,quickClose);
         BC_Game.instance.isConnected = true;
      }
      
      private function AfterSave() : void
      {
         BC_Game.instance.CheckInitGame(this._screenToClose);
         this.Close(true,null,true);
      }
      
      private function CheckFlagUnlock(rank:int) : void
      {
         var m:ModelFlag = null;
         for(var i:int = 0; i < ModelFlagEnum.ALL.length; i++)
         {
            m = ModelFlagEnum.ALL[i];
            if(m.lvlToUnlock != -1 && m.lvlToUnlock <= rank)
            {
               BC_GameProgress.gameProgess.flagManager.UnlockFlag(m);
            }
         }
      }
      
      public function get anim() : MovieClip
      {
         return visual.getChildByName("anim") as MovieClip;
      }
      
      private function onConnectErrorPIOArmor() : void
      {
         this.CheckArmorGames();
      }
      
      private function AfterSaveChallenger(o:DatabaseObject) : void
      {
         BC_Game.instance.CheckInitGameChallenger(this._screenToClose,o);
         this.Close(true,null,true);
      }
      
      private function SuccessLoadArmy(o:DatabaseObject) : void
      {
         if(o)
         {
            BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerWin = o.Wins;
            BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerLost = o.Losts;
            BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerDraw = o.Draws;
            BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerRank = o.RankLvl;
            BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerCurrentRankCount = o.CurrentRankCount;
            this.CheckFlagUnlock(BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerRank);
         }
         else
         {
            BC_GameProgress.gameProgess.getArmy(this._currentLoad).multiPlayerActivated = 0;
         }
         this.LoadArmy();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         ExternalAPIManager.getPremiumAPI().HideBar();
         this._screenToClose = null;
         this._currentLoad = 0;
         this.anim.play();
      }
      
      private function SuccessLoadChallenger(o:DatabaseObject) : void
      {
         visual.visible = false;
         BC_Game.instance.Save(new Callback(this.AfterSaveChallenger,this,[o]));
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_CONNECTPLAYERIO_SCREEN);
      }
      
      private function onConnectSuccessPIO() : void
      {
         if(ExternalAPIManager.getSavedFileAPI().isEmpty)
         {
            FileManager.instance.TransferSaveFileToExternalAPI(new Callback(this.onConnectSuccessPIO,this,null));
            return;
         }
      }
   }
}

