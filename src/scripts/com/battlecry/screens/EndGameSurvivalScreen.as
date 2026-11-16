package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.io.BC_GameProgress;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.KongStats;
   import com.lachhhEngine.io.externalAPI.statsAPI.MetaStatData;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class EndGameSurvivalScreen extends BC_Screen
   {
      
      private static const VICTORY:int = 1;
      
      private static const LOST:int = 2;
      
      private var _currentWave:int;
      
      private var _moneyToGive:Number;
      
      public function EndGameSurvivalScreen()
      {
         super();
      }
      
      public function get CashReward() : TextField
      {
         return this.survivalResultPanel.getChildByName("CashReward") as TextField;
      }
      
      private function onContinue(event:MouseEvent) : void
      {
         _context.ClearRoundManager();
         if(BC_Game.instance.isSurvivalCoop)
         {
            BC_Game.instance.gotoBattleMode = BC_Game.BATTLE_MODE_COOP_SURVIVAL;
            BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_BATTLESELECTION_SCREEN);
         }
         else
         {
            BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_CAMPAIGN_SCREEN);
         }
         BC_Game.instance.survivalLevel = 1;
         BC_Game.instance.survivalMove = false;
         BC_Game.instance.isSurvival = false;
         BC_Game.instance.isSurvivalCoop = false;
         BC_Game.instance.isTournament = false;
         BC_Game.instance.survivalCoopArmy = null;
      }
      
      public function get survivalResultPanel() : MovieClip
      {
         return visual.getChildByName("survivalResultPanel") as MovieClip;
      }
      
      public function get btn_Continue() : ButtonSelect
      {
         return this.pannelContinue.getChildByName("btn_Continue") as ButtonSelect;
      }
      
      public function get WavesNb() : TextField
      {
         return this.survivalResultPanel.getChildByName("WavesNb") as TextField;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         var sLevel:MetaStatData = null;
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
         if(BC_Game.instance.isSurvivalCoop)
         {
            BC_Game.instance.CheckUnlockCoopSurvivalFlag();
         }
         else if(BC_Game.instance.isSurvival)
         {
            BC_Game.instance.CheckUnlockSoloSurvivalFlag();
         }
         this._moneyToGive = BC_Game.instance.survivalLevel * 100;
         this._currentWave = BC_Game.instance.survivalLevel;
         if(BC_VersionInfo.isKongregate)
         {
            if(BC_Game.instance.survivalLevel >= 1)
            {
               sLevel = new MetaStatData("Survival_Wave",BC_Game.instance.survivalLevel);
               KongStats.SubmitData(sLevel);
            }
         }
         if(BC_Game.instance.survivalLevel == 1)
         {
            this._moneyToGive = 0;
         }
         BC_GameProgress.gameProgess.cash += this._moneyToGive;
         ScreenManager.instance.RefreshAll();
         BC_Game.instance.Save();
         animation.playChildren = false;
         this.Refresh();
      }
      
      override protected function get closeFrame() : int
      {
         return 35;
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
         if(this.WavesNb)
         {
            this.WavesNb.mouseEnabled = false;
            this.WavesNb.text = this._currentWave + "";
         }
         if(this.CashReward)
         {
            this.CashReward.text = this._moneyToGive + "";
         }
      }
      
      override public function CreateVisual() : Animation
      {
         if(BC_Game.instance.roundManager.victoriousTeam() == VICTORY)
         {
            return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ENDGAME_SURVIVAL_VICTORY_SCREEN);
         }
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ENDGAME_SURVIVAL_LOST_SCREEN);
      }
      
      public function get pannelContinue() : MovieClip
      {
         return visual.getChildByName("continuePanel") as MovieClip;
      }
   }
}

