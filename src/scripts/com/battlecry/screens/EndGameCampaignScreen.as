package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class EndGameCampaignScreen extends BC_Screen
   {
      
      private static const VICTORY:int = 1;
      
      private static const LOST:int = 2;
      
      public function EndGameCampaignScreen()
      {
         super();
      }
      
      override public function CreateVisual() : Animation
      {
         if(BC_Game.instance.roundManager.victoriousTeam() == VICTORY)
         {
            return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ENDGAME_CAMPAIGN_VICTORY_SCREEN);
         }
         if(BC_Game.instance.roundManager.victoriousTeam() == LOST)
         {
            return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ENDGAME_CAMPAIGN_LOST_SCREEN);
         }
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ENDGAME_CAMPAIGN_DRAW_SCREEN);
      }
      
      private function onContinue(event:MouseEvent) : void
      {
         _context.ClearRoundManager();
         getContext.isRanked = false;
         BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_CAMPAIGN_SCREEN);
      }
      
      public function get btn_Continue() : ButtonSelect
      {
         return this.pannelContinue.getChildByName("btn_Continue") as ButtonSelect;
      }
      
      public function get mainPanel() : MovieClip
      {
         return visual.getChildByName("mainPanel") as MovieClip;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         BC_Game.instance.Pause(true);
         Jukebox.instance.DestroyAllSounds();
         InitOkBtn(this.btn_Continue);
         this.btn_Continue.addEventListener(MouseEvent.MOUSE_DOWN,this.onContinue);
         Jukebox.instance.FadeAllMusicToDestroy(12);
         if(BC_Game.instance.roundManager.victoriousTeam() == VICTORY)
         {
            Jukebox.instance.PlaySound(BC_SfxFactory.ID_STINGER_WIN);
         }
         else
         {
            Jukebox.instance.PlaySound(BC_SfxFactory.ID_STINGER_LOSE);
         }
         animation.playChildren = false;
         this.Refresh();
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         super.ShowIdle(context);
      }
      
      public function get tipTxt() : TextField
      {
         return this.mainPanel.getChildByName("tipTxt") as TextField;
      }
      
      public function get endStoryTxt() : TextField
      {
         return this.mainPanel.getChildByName("endStoryTxt") as TextField;
      }
      
      override protected function get idleFrame() : int
      {
         return 32;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         BC_Game.instance.Pause(false);
         this.btn_Continue.removeEventListener(MouseEvent.MOUSE_DOWN,this.onContinue);
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         if(this.endStoryTxt)
         {
            this.endStoryTxt.mouseEnabled = false;
            this.endStoryTxt.text = TextFactory.instance.GetMsg(BC_Game.instance.currentCampaign.endStoryTxtID);
            this.endStoryTxt.y += Math.abs((this.endStoryTxt.height - this.endStoryTxt.textHeight) / 2);
         }
         if(this.tipTxt)
         {
            if(BC_Game.instance.currentCampaign.tipTxtID == -1)
            {
               this.tipTxt.text = TextFactory.instance.GetMsg(BC_TextFactory.GetRandomTips());
            }
            else
            {
               this.tipTxt.text = TextFactory.instance.GetMsg(BC_Game.instance.currentCampaign.tipTxtID);
            }
            this.tipTxt.y += Math.abs((this.tipTxt.height - this.tipTxt.textHeight) / 2);
         }
      }
      
      override protected function get closeFrame() : int
      {
         return 35;
      }
      
      public function get pannelContinue() : MovieClip
      {
         return visual.getChildByName("pannelContinue") as MovieClip;
      }
   }
}

