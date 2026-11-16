package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.MetaEnemyLoaded;
   import com.battlecry.screens.view.FlagView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class RankedMatchScreen extends BC_Screen
   {
      
      private var _myflagView:FlagView;
      
      private var _ennemyflagView:FlagView;
      
      private var _screenToClose:BC_Screen;
      
      public function RankedMatchScreen()
      {
         super();
      }
      
      public function get allyflagView() : MovieClip
      {
         return this.rankMatchView.getChildByName("allyflagView") as MovieClip;
      }
      
      public function get rankingText() : TextField
      {
         return this.rankScoreView.getChildByName("rankingText") as TextField;
      }
      
      public function get currentRank() : MovieClip
      {
         return this.rankScoreView.getChildByName("currentRank") as MovieClip;
      }
      
      public function get upperRankIcon() : MovieClip
      {
         return this.upperRank.getChildByName("rankIcon") as MovieClip;
      }
      
      private function get currentRankCount() : int
      {
         return BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerCurrentRankCount;
      }
      
      public function get rankScoreView() : MovieClip
      {
         return visual.getChildByName("rankScoreView") as MovieClip;
      }
      
      public function get playerName() : TextField
      {
         return this.rankMatchView.getChildByName("playerName") as TextField;
      }
      
      public function get lowerRank() : MovieClip
      {
         return this.rankScoreView.getChildByName("lowerRank") as MovieClip;
      }
      
      public function SetScreenToClose(screenToClose:BC_Screen) : void
      {
         this._screenToClose = screenToClose;
      }
      
      public function get currentRankText() : TextField
      {
         return this.currentRank.getChildByName("rankTxt") as TextField;
      }
      
      private function onClose(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      public function get lowerRankText() : TextField
      {
         return this.lowerRank.getChildByName("rankTxt") as TextField;
      }
      
      private function get currentRankLvl() : int
      {
         return BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank;
      }
      
      public function get currentRankIcon() : MovieClip
      {
         return this.currentRank.getChildByName("rankIcon") as MovieClip;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_Close.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         this.btn_fight.removeEventListener(MouseEvent.MOUSE_DOWN,this.onFight);
      }
      
      public function get lowerRankIcon() : MovieClip
      {
         return this.lowerRank.getChildByName("rankIcon") as MovieClip;
      }
      
      public function get metaEnemyLoaded() : MetaEnemyLoaded
      {
         return BC_Game.instance.metaEnemyLoaded;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
      }
      
      public function get btn_fight() : ButtonSelect
      {
         return this.rankMatchView.getChildByName("btn_fight") as ButtonSelect;
      }
      
      public function get upperRank() : MovieClip
      {
         return this.rankScoreView.getChildByName("upperRank") as MovieClip;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_Close);
         this.btn_Close.addEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         InitOkBtn(this.btn_fight);
         this.btn_fight.addEventListener(MouseEvent.MOUSE_DOWN,this.onFight);
         this._myflagView = new FlagView(this.allyflagView);
         this._myflagView.SetMetaFlag(BC_GameProgress.gameProgess.metaFlag);
         this._myflagView.Refresh();
         this.playerName.text = Main.instance.GetPlayerName();
         this._ennemyflagView = new FlagView(this.ennemyflagView);
         this._ennemyflagView.SetMetaFlag(this.metaEnemyLoaded.metaFlag);
         this._ennemyflagView.Refresh();
         this.ennemyName.text = this.metaEnemyLoaded.enemyName;
         this.rankScoreView.gotoAndStop(this.currentRankCount + 11);
         if(this.currentRankLvl <= 1)
         {
            this.lowerRank.visible = false;
         }
         else
         {
            this.lowerRank.visible = true;
            this.lowerRankText.text = this.currentRankLvl - 1 + "";
            this.lowerRankIcon.gotoAndStop(this.currentRankLvl - 1);
         }
         if(this.currentRankLvl >= 20)
         {
            this.upperRank.visible = false;
         }
         else
         {
            this.upperRank.visible = true;
            this.upperRankText.text = this.currentRankLvl + 1 + "";
            this.upperRankIcon.gotoAndStop(this.currentRankLvl + 1);
         }
         this.rankingText.text = TextFactory.instance.GetMsg(BC_GameProgress.gameProgess.CurrentSelectedArmy().GetRankName(this.currentRankLvl));
         this.currentRankText.text = this.currentRankLvl + "";
         this.currentRankIcon.gotoAndStop(this.currentRankLvl);
         animation.playChildren = false;
      }
      
      private function onFight(event:MouseEvent) : void
      {
         Close(true,new Callback(this.AfterFight,this,null),false);
      }
      
      private function AfterFight() : void
      {
         BC_Game.instance.TransitionTo(this._screenToClose,BC_ScreenFactory.ID_LOADGAME_SCREEN);
      }
      
      public function get btn_Close() : ButtonSelect
      {
         return this.rankMatchView.getChildByName("btn_Close") as ButtonSelect;
      }
      
      public function get ennemyName() : TextField
      {
         return this.rankMatchView.getChildByName("ennemyName") as TextField;
      }
      
      public function get upperRankText() : TextField
      {
         return this.upperRank.getChildByName("rankTxt") as TextField;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_RANKEDMATCHSCREEN);
      }
      
      public function get ennemyflagView() : MovieClip
      {
         return this.rankMatchView.getChildByName("ennemyflagView") as MovieClip;
      }
      
      public function get rankMatchView() : MovieClip
      {
         return visual.getChildByName("rankMatchView") as MovieClip;
      }
   }
}

