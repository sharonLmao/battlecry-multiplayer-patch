package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.screens.view.SparkGroupView;
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
   
   public class EndActScreen extends BC_Screen
   {
      
      public static const VICTORY:int = 1;
      
      public static const LOST:int = 2;
      
      private var _sparkGroupView:SparkGroupView;
      
      private var _storm1:Boolean;
      
      private var _storm2:Boolean;
      
      private var _storm3:Boolean;
      
      public function EndActScreen()
      {
         super();
      }
      
      public function get endActTxt() : TextField
      {
         return this.EndActMC.getChildByName("endActTxt") as TextField;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(!this._storm1 && visual.currentFrame >= 40)
         {
            this._storm1 = true;
            this._sparkGroupView.CreateSparkExplosion(50,335,235);
            Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_THUNDERSTORMSTAFF);
         }
         if(!this._storm2 && visual.currentFrame >= 42)
         {
            this._storm2 = true;
            this._sparkGroupView.CreateSparkExplosion(50,360,345);
         }
         if(!this._storm3 && visual.currentFrame >= 44)
         {
            this._storm3 = true;
            this._sparkGroupView.CreateSparkExplosion(50,450,260);
         }
         if(this._sparkGroupView)
         {
            this._sparkGroupView.Update();
         }
      }
      
      private function onContinue(event:MouseEvent) : void
      {
         _context.ClearRoundManager();
         getContext.isRanked = false;
         BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_CAMPAIGN_SCREEN);
      }
      
      public function get EndActMC() : MovieClip
      {
         return visual.getChildByName("EndActMC") as MovieClip;
      }
      
      override protected function get closeFrame() : int
      {
         return 78;
      }
      
      public function get btn_Next() : ButtonSelect
      {
         return this.EndActMC.getChildByName("btn_Next") as ButtonSelect;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._sparkGroupView = new SparkGroupView(visual);
         this._storm1 = false;
         this._storm2 = false;
         this._storm3 = false;
         BC_Game.instance.Pause(true);
         Jukebox.instance.DestroyAllSounds();
         if(this.EndActMC)
         {
            this.EndActMC.visible = false;
            this.EndActMC.gotoAndStop(1);
            InitOkBtn(this.btn_Next);
            this.btn_Next.addEventListener(MouseEvent.MOUSE_DOWN,this.onContinue);
         }
         for(var i:int = 0; i < BC_GameProgress.gameProgess.metaCampaignProgress.GetChapterEndActArray().length; i++)
         {
            if(BC_Game.instance.currentCampaign.campaignStage == BC_GameProgress.gameProgess.metaCampaignProgress.GetChapterEndActArray()[i] && BC_Game.instance.roundManager.victoriousTeam() == VICTORY)
            {
               this.EndActMC.visible = true;
               this.EndActMC.gotoAndStop(BC_GameProgress.gameProgess.metaCampaignProgress.GetEndActImageAddition() + i + 1);
               break;
            }
         }
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
      
      override protected function get idleFrame() : int
      {
         return 73;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         BC_Game.instance.Pause(false);
         if(this.EndActMC)
         {
            this.btn_Next.addEventListener(MouseEvent.MOUSE_DOWN,this.onContinue);
         }
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         if(Boolean(this.EndActMC) && Boolean(this.endActTxt))
         {
            this.endActTxt.mouseEnabled = false;
            this.endActTxt.text = TextFactory.instance.GetMsg(BC_Game.instance.currentCampaign.endStoryTxtID);
            this.endActTxt.y += Math.abs((this.endActTxt.height - this.endActTxt.textHeight) / 2);
         }
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ENDACT_SCREEN);
      }
   }
}

