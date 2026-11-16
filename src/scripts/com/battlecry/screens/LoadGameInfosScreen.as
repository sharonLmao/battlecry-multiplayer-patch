package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.screens.view.FlagView;
   import com.battlecry.screens.view.RankScoreView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class LoadGameInfosScreen extends LoadGameScreen
   {
      
      private var _rankScoreView:RankScoreView;
      
      private var _enemyFlagView:FlagView;
      
      private var _allyFlagView:FlagView;
      
      public function LoadGameInfosScreen()
      {
         super();
      }
      
      public function get upperRankText() : TextField
      {
         return this.upperRank.getChildByName("rankTxt") as TextField;
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
      
      private function get playerName() : TextField
      {
         return visual.getChildByName("playerName") as TextField;
      }
      
      public function get lowerRank() : MovieClip
      {
         return this.rankScoreView.getChildByName("lowerRank") as MovieClip;
      }
      
      public function get currentRankText() : TextField
      {
         return this.currentRank.getChildByName("rankTxt") as TextField;
      }
      
      private function get loading() : MovieClip
      {
         return visual.getChildByName("loading") as MovieClip;
      }
      
      private function get currentRankLvl() : int
      {
         return BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank;
      }
      
      public function get currentRankIcon() : MovieClip
      {
         return this.currentRank.getChildByName("rankIcon") as MovieClip;
      }
      
      public function get lowerRankText() : TextField
      {
         return this.lowerRank.getChildByName("rankTxt") as TextField;
      }
      
      public function get lowerRankIcon() : MovieClip
      {
         return this.lowerRank.getChildByName("rankIcon") as MovieClip;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(CheckAllLoaded())
         {
            this.loading.visible = false;
            this.btn_fight.visible = true;
         }
      }
      
      private function get btn_fight() : ButtonSelect
      {
         return visual.getChildByName("btn_fight") as ButtonSelect;
      }
      
      public function get upperRank() : MovieClip
      {
         return this.rankScoreView.getChildByName("upperRank") as MovieClip;
      }
      
      private function get allyflagView() : MovieClip
      {
         return visual.getChildByName("allyflagView") as MovieClip;
      }
      
      private function onFight(event:MouseEvent) : void
      {
         Close(true,null,false);
         Main.instance.LaunchGame();
         BC_Game.instance.InitRoundManager(BC_GameProgress.gameProgess.CurrentSelectedArmy(),metaArmy);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_fight.removeEventListener(MouseEvent.MOUSE_DOWN,this.onFight);
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_fight);
         this.btn_fight.addEventListener(MouseEvent.MOUSE_DOWN,this.onFight);
         this.btn_fight.visible = false;
         this._allyFlagView = new FlagView(this.allyflagView);
         this._enemyFlagView = new FlagView(this.ennemyflagView);
         this._rankScoreView = new RankScoreView(this.rankScoreView);
         if(this.loading)
         {
            this.loading.play();
         }
         this.Refresh();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         if(!BC_Game.instance.isRanked)
         {
            this.rankScoreView.visible = false;
         }
         this.playerName.text = Main.instance.GetMultiplayerName();
         this._allyFlagView.SetMetaFlag(BC_GameProgress.gameProgess.metaFlag);
         this.ennemyName.text = BC_Game.instance.metaEnemyLoaded.enemyName;
         this._enemyFlagView.SetMetaFlag(BC_Game.instance.metaEnemyLoaded.metaFlag);
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
      }
      
      override public function CreateVisual() : Animation
      {
         if(BC_Game.instance.isRanked)
         {
            return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_LOADGAME_SCREEN);
         }
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_LOADGAMEFRIEND_SCREEN);
      }
      
      private function get ennemyflagView() : MovieClip
      {
         return visual.getChildByName("ennemyflagView") as MovieClip;
      }
      
      private function get ennemyName() : TextField
      {
         return visual.getChildByName("ennemyName") as TextField;
      }
   }
}

