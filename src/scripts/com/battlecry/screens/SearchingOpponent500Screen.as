package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.meta.MetaEnemyLoaded;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import playerio.DatabaseObject;
   import playerio.PlayerIOError;
   
   public class SearchingOpponent500Screen extends BC_Screen
   {
      
      private var _enemyArmyStats:DatabaseObject;
      
      private var _enemyArmySelected:String;
      
      private var _waitCounter:int;
      
      private var _fullEnemyArmyname:String;
      
      private var _cancel:Boolean;
      
      private var _enemyLoaded:Boolean;
      
      private var _screenToClose:BC_Screen;
      
      private var _enemyName:String;
      
      public function SearchingOpponent500Screen()
      {
         super();
      }
      
      private function onCancel(event:MouseEvent) : void
      {
         Close(true,null,false);
         this._cancel = true;
         BC_Game.instance.metaEnemyLoaded = null;
         BC_Game.instance.isRanked = false;
      }
      
      public function get anim() : MovieClip
      {
         return visual.getChildByName("anim") as MovieClip;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_cancel.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCancel);
      }
      
      private function SuccessLoadEnemy(a:Array) : void
      {
         var s:String = null;
         var q:QuestionScreen = null;
         if(this._cancel)
         {
            return;
         }
         var r:int = Math.floor(Math.random() * a.length);
         var o:DatabaseObject = a[r];
         this._enemyArmyStats = o;
         if(o)
         {
            if(o.key == Main.instance.GetPIOid() + "_army1" || o.key == Main.instance.GetPIOid() + "_army2" || o.key == Main.instance.GetPIOid() + "_army3" || o.key == Main.instance.GetPIOid() + "_army4" || o.key == Main.instance.GetPIOid() + "_army5")
            {
               this.LoadEnemy();
            }
            else
            {
               this._fullEnemyArmyname = o.key;
               this._enemyArmySelected = o.key.substr(o.key.length - 5,5);
               s = o.key.substr(0,o.key.length - 6);
               this._enemyName = s.substr(3,s.length - 3);
               PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("PlayerObjects",s,this.SuccessLoadPlayerData,this.FailLoadEnemy);
            }
         }
         else
         {
            q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
            q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_ALONE_IN_RANKING));
            Close(true,null,false);
         }
      }
      
      public function get AUTO_0() : TextField
      {
         return this.searchingOpponent.getChildByName("AUTO_0") as TextField;
      }
      
      private function LoadEnemy() : void
      {
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.loadRange("ArmyListSmall","Rank",[BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank],null,null,25,this.SuccessLoadEnemy,this.FailLoadEnemy);
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(this._cancel)
         {
            return;
         }
         if(this._waitCounter > 0)
         {
            --this._waitCounter;
         }
         else if(this._enemyLoaded)
         {
            BC_Game.instance.TransitionTo(this._screenToClose,BC_ScreenFactory.ID_LOADGAME_INFOS_SCREEN);
            Close(true,null,false);
         }
         if(this.AUTO_0)
         {
            this.AUTO_0.text = TextFactory.instance.GetMsg(BC_TextFactory.ID_AUTO_SEARCHING_ENEMY_0);
         }
      }
      
      private function FailLoadEnemy(p:PlayerIOError) : void
      {
         Close(true,null,false);
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._cancel = false;
         this._waitCounter = 60;
         this._enemyLoaded = false;
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId == 5 && BC_GameProgress.gameProgess.CurrentSelectedArmy().GetArmyValue() > 500)
         {
            this.btn_cancel.visible = false;
            return;
         }
         InitOkBtn(this.btn_cancel);
         this.btn_cancel.addEventListener(MouseEvent.MOUSE_DOWN,this.onCancel);
         this.LoadEnemy();
      }
      
      public function SetCloseScreen(screenToClose:BC_Screen) : void
      {
         this._screenToClose = screenToClose;
      }
      
      private function SuccessLoadPlayerData(o:DatabaseObject) : void
      {
         var s:String;
         var enemyProgress:BC_GameProgress;
         var params:Array;
         if(this._cancel)
         {
            return;
         }
         enemyProgress = new BC_GameProgress();
         params = (o.savefile as String).split("*");
         params.shift();
         s = params[0];
         s = s.substr(1,s.length - 1);
         try
         {
            enemyProgress.Decode(s);
         }
         catch(error:Error)
         {
            LoadEnemy();
            return;
         }
         BC_Game.instance.metaEnemyLoaded = new MetaEnemyLoaded();
         BC_Game.instance.metaEnemyLoaded.fullArmyName = this._fullEnemyArmyname;
         BC_Game.instance.metaEnemyLoaded.enemyName = this._enemyName;
         switch(this._enemyArmySelected)
         {
            case "army1":
               BC_Game.instance.metaEnemyLoaded.metaArmy = enemyProgress.getArmy(1);
               break;
            case "army2":
               BC_Game.instance.metaEnemyLoaded.metaArmy = enemyProgress.getArmy(2);
               break;
            case "army3":
               BC_Game.instance.metaEnemyLoaded.metaArmy = enemyProgress.getArmy(3);
               break;
            case "army4":
               BC_Game.instance.metaEnemyLoaded.metaArmy = enemyProgress.getArmy(4);
               break;
            case "army5":
               BC_Game.instance.metaEnemyLoaded.metaArmy = enemyProgress.getArmy(5);
         }
         trace(BC_Game.instance.metaEnemyLoaded.metaArmy.teamId);
         trace(BC_Game.instance.metaEnemyLoaded.metaArmy.GetArmyValue());
         if(BC_Game.instance.metaEnemyLoaded.metaArmy.GetArmyValue() <= 0 || BC_Game.instance.metaEnemyLoaded.metaArmy.teamId == 5 && BC_Game.instance.metaEnemyLoaded.metaArmy.GetArmyValue() > 500)
         {
            if(this._enemyArmyStats)
            {
               this._enemyArmyStats.Wins = 0;
               this._enemyArmyStats.Losts = 0;
               this._enemyArmyStats.Draws = 0;
               this._enemyArmyStats.RankLvl = 1;
               this._enemyArmyStats.CurrentRankCount = 0;
               this._enemyArmyStats.Offline = 0;
               this._enemyArmyStats.OfflineCash = 250;
               this._enemyArmyStats.save();
            }
            this.LoadEnemy();
            return;
         }
         BC_Game.instance.metaEnemyLoaded.metaFlag = enemyProgress.metaFlag;
         this._enemyLoaded = true;
      }
      
      public function get searchingOpponent() : MovieClip
      {
         return this.anim.getChildByName("searchingOpponent") as MovieClip;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_SEARCHING_OPPONENT_SCREEN);
      }
      
      public function get btn_cancel() : ButtonSelect
      {
         return visual.getChildByName("btn_cancel") as ButtonSelect;
      }
   }
}

