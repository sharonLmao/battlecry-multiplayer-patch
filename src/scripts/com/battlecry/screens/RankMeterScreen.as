package com.battlecry.screens
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class RankMeterScreen extends BC_Screen
   {
      
      public function RankMeterScreen()
      {
         super();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_Close.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
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
      
      public function get lowerRankIcon() : MovieClip
      {
         return this.lowerRank.getChildByName("rankIcon") as MovieClip;
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
         return panel.getChildByName("rankScoreView") as MovieClip;
      }
      
      public function get lowerRank() : MovieClip
      {
         return this.rankScoreView.getChildByName("lowerRank") as MovieClip;
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
         animation.playChildren = false;
         this.Refresh();
      }
      
      public function get currentRankText() : TextField
      {
         return this.currentRank.getChildByName("rankTxt") as TextField;
      }
      
      public function get btn_Close() : ButtonSelect
      {
         return panel.getChildByName("btn_Close") as ButtonSelect;
      }
      
      private function onClose(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      public function get lowerRankText() : TextField
      {
         return this.lowerRank.getChildByName("rankTxt") as TextField;
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
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_RANKMETER_SCREEN);
      }
      
      private function get currentRankLvl() : int
      {
         return BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank;
      }
      
      public function get currentRankIcon() : MovieClip
      {
         return this.currentRank.getChildByName("rankIcon") as MovieClip;
      }
   }
}

