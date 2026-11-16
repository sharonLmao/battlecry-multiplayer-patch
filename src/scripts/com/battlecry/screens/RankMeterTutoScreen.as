package com.battlecry.screens
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.screens.view.RankScoreView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class RankMeterTutoScreen extends BC_Screen
   {
      
      private var _rankScoreView:RankScoreView;
      
      private var _isFinished:Boolean;
      
      private var _isIdle:Boolean;
      
      public function RankMeterTutoScreen()
      {
         super();
      }
      
      public function get upperRankText() : TextField
      {
         return this.upperRank.getChildByName("rankTxt") as TextField;
      }
      
      public function get isFinished() : Boolean
      {
         return this._isFinished;
      }
      
      public function get currentRank() : MovieClip
      {
         return this.rankScoreView.getChildByName("currentRank") as MovieClip;
      }
      
      public function get upperRankIcon() : MovieClip
      {
         return this.upperRank.getChildByName("rankIcon") as MovieClip;
      }
      
      public function get rankingText() : TextField
      {
         return this.rankScoreView.getChildByName("rankingText") as TextField;
      }
      
      public function get rankScoreView() : MovieClip
      {
         return panel.getChildByName("rankScoreView") as MovieClip;
      }
      
      public function get lowerRank() : MovieClip
      {
         return this.rankScoreView.getChildByName("lowerRank") as MovieClip;
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         super.ShowIdle(context);
         this._isIdle = true;
      }
      
      public function get currentRankText() : TextField
      {
         return this.currentRank.getChildByName("rankTxt") as TextField;
      }
      
      public function set isIdle(isIdle:Boolean) : void
      {
         this._isIdle = isIdle;
      }
      
      override protected function get closeFrame() : int
      {
         return 11;
      }
      
      private function get currentRankCount() : int
      {
         return BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerCurrentRankCount;
      }
      
      public function get lowerRankText() : TextField
      {
         return this.lowerRank.getChildByName("rankTxt") as TextField;
      }
      
      private function AfterClose() : void
      {
         this._isFinished = true;
      }
      
      private function get currentRankLvl() : int
      {
         return BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank;
      }
      
      public function get isIdle() : Boolean
      {
         return this._isIdle;
      }
      
      override public function Close(remove:Boolean, c:Callback, quickClose:Boolean) : void
      {
         super.Close(remove,new Callback(this.AfterClose,this,null),quickClose);
         this._isIdle = false;
      }
      
      public function get currentRankIcon() : MovieClip
      {
         return this.currentRank.getChildByName("rankIcon") as MovieClip;
      }
      
      public function get lowerRankIcon() : MovieClip
      {
         return this.lowerRank.getChildByName("rankIcon") as MovieClip;
      }
      
      public function get upperRank() : MovieClip
      {
         return this.rankScoreView.getChildByName("upperRank") as MovieClip;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._rankScoreView = new RankScoreView(this.rankScoreView);
         this._isIdle = false;
         this._isFinished = false;
         animation.playChildren = false;
         this.Refresh();
      }
      
      public function get btn_Close() : ButtonSelect
      {
         return panel.getChildByName("btn_Close") as ButtonSelect;
      }
      
      public function set isFinished(isFinished:Boolean) : void
      {
         this._isFinished = isFinished;
      }
      
      override protected function get idleFrame() : int
      {
         return 10;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
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
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_RANKMETERTUTO_SCREEN);
      }
   }
}

