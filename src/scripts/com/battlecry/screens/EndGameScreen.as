package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.meta.model.ModelCampaignEnum;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import playerio.DatabaseObject;
   import playerio.PlayerIOError;
   
   public class EndGameScreen extends BC_Screen
   {
      
      private static const VICTORY:int = 1;
      
      private static const LOST:int = 2;
      
      private static const DRAW:int = 3;
      
      private var _endGameStatus:int;
      
      private var _cashReward:int;
      
      private var _enemyCashReward:int;
      
      private var _newRank:int;
      
      private var _oldRank:int;
      
      private var _showChangeRank:Boolean;
      
      private var _myCashReward:int;
      
      public function EndGameScreen()
      {
         super();
      }
      
      private function StartGameAfterReferential() : void
      {
         if(ExternalAPIManager.getPremiumAPI().loggedIn)
         {
            BC_Game.instance.CheckDailyReward();
         }
         BC_Game.instance.currentCampaign = ModelCampaignEnum.CAMPAIGN1_1_1;
         BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_STORY_SCREEN);
      }
      
      override public function CreateVisual() : Animation
      {
         if(BC_Game.instance.roundManager.victoriousTeam() == VICTORY)
         {
            return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ENDGAME_VICTORY_SCREEN);
         }
         if(BC_Game.instance.roundManager.victoriousTeam() == LOST)
         {
            return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ENDGAME_LOST_SCREEN);
         }
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ENDGAME_DRAW_SCREEN);
      }
      
      private function AddReferencial() : void
      {
         this.loadRegisteringData.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("Referencial",BC_Game.instance.challengerName,this.SuccessLoadReferencial,this.FailLoadReferencial);
      }
      
      private function SuccessCreateReferential(o:DatabaseObject) : void
      {
         if(o)
         {
            if(!Utils.IsInArray(o.ReferencialList,Main.instance.GetPlayerName()))
            {
               o.ReferencialList.push(Main.instance.GetPlayerName());
               o.save(true,false,this.SaveSuccessFull,this.SaveError);
            }
         }
         else
         {
            this.StartGameAfterReferential();
         }
      }
      
      private function RegisterData() : void
      {
         this.loadRegisteringData.visible = true;
         this.loadRegisteringData.play();
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId == 5)
         {
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyListSmall",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,this.SuccessLoadMyArmy,this.FailLoadMyArmy);
         }
         else
         {
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyList",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,this.SuccessLoadMyArmy,this.FailLoadMyArmy);
         }
      }
      
      private function FailCreateReferential(p:PlayerIOError) : void
      {
         this.StartGameAfterReferential();
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         var c:ChangeRankScreen = null;
         super.ShowIdle(context);
         if(this._showChangeRank)
         {
            this._showChangeRank = false;
            c = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_CHANGERANK_SCREEN,false,true) as ChangeRankScreen;
            c.SetRank(this._oldRank,this._newRank);
         }
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         BC_Game.instance.Pause(false);
         this.btn_Continue.removeEventListener(MouseEvent.MOUSE_DOWN,this.onContinue);
      }
      
      private function FailLoadMyArmy(p:PlayerIOError) : void
      {
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId == 5)
         {
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyListSmall",BC_Game.instance.metaEnemyLoaded.fullArmyName,this.SuccessLoadEnemyArmy,this.FailLoadEnemyArmy);
         }
         else
         {
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyList",BC_Game.instance.metaEnemyLoaded.fullArmyName,this.SuccessLoadEnemyArmy,this.FailLoadEnemyArmy);
         }
      }
      
      private function SaveSuccessFull() : void
      {
         this.StartGameAfterReferential();
      }
      
      private function SuccessLoadReferencial(o:DatabaseObject) : void
      {
         if(o)
         {
            if(!Utils.IsInArray(o.ReferencialList,Main.instance.GetPlayerName()))
            {
               o.ReferencialList.push(Main.instance.GetPlayerName());
               o.save(true,false,this.SaveSuccessFull,this.SaveError);
            }
         }
         else
         {
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.createObject("Referencial",BC_Game.instance.metaEnemyChallenge.fullArmyName,{"ReferencialList":new Array()},this.SuccessCreateReferential,this.FailCreateReferential);
         }
      }
      
      public function get btn_Continue() : ButtonSelect
      {
         return this.continuePanel.getChildByName("btn_Continue") as ButtonSelect;
      }
      
      override protected function get idleFrame() : int
      {
         return 32;
      }
      
      private function SuccessLoadEnemyArmy(o:DatabaseObject) : void
      {
         if(o == null)
         {
            this.loadRegisteringData.visible = false;
            return;
         }
         switch(this._endGameStatus)
         {
            case LOST:
               ++o.Wins;
               ++o.CurrentRankCount;
               this._cashReward = Math.floor(this._enemyCashReward * 0.25);
               break;
            case VICTORY:
               ++o.Losts;
               --o.CurrentRankCount;
               this._cashReward = Math.floor(this._enemyCashReward * 0.125);
               break;
            case DRAW:
               ++o.Draws;
               this._cashReward = this._enemyCashReward;
         }
         o.OfflineCash += this._cashReward;
         if(o.RankLvl >= 20)
         {
            o.RankLvl = 20;
            if(o.CurrentRankCount >= 10)
            {
               o.CurrentRankCount = 10;
            }
            else if(o.CurrentRankCount <= -11)
            {
               o.CurrentRankCount = 0;
               --o.RankLvl;
            }
         }
         else if(o.RankLvl <= 1)
         {
            o.RankLvl = 1;
            if(o.CurrentRankCount <= -10)
            {
               o.CurrentRankCount = -10;
            }
            else if(o.CurrentRankCount >= 11)
            {
               o.CurrentRankCount = 0;
               ++o.RankLvl;
            }
         }
         else
         {
            if(o.CurrentRankCount >= 11)
            {
               o.CurrentRankCount = 0;
               ++o.RankLvl;
            }
            if(o.CurrentRankCount <= -11)
            {
               o.CurrentRankCount = 0;
               --o.RankLvl;
            }
         }
         o.save();
         this.AfterSaveEnemyArmy();
      }
      
      private function FailLoadReferencial(p:PlayerIOError) : void
      {
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.createObject("Referencial",BC_Game.instance.metaEnemyChallenge.fullArmyName,{"ReferencialList":new Array()},this.SuccessCreateReferential,this.FailCreateReferential);
      }
      
      public function get loadRegisteringData() : MovieClip
      {
         return visual.getChildByName("loadRegisteringData") as MovieClip;
      }
      
      override protected function get closeFrame() : int
      {
         return 35;
      }
      
      private function onContinue(event:MouseEvent) : void
      {
         var add:int = 0;
         var tournamentRank:int = 0;
         var baseReward:int = 0;
         _context.ClearRoundManager();
         if(BC_Game.instance.isChallenge)
         {
            if(BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl <= 1)
            {
               this.AddReferencial();
            }
            else
            {
               BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_ARMYCREATION_SCREEN);
            }
         }
         else
         {
            if(BC_Game.instance.isTournament)
            {
               BC_Game.instance.gotoBattleMode = BC_Game.BATTLE_MODE_TOURNAMENT;
            }
            else if(BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId == 5)
            {
               BC_Game.instance.gotoBattleMode = BC_Game.BATTLE_MODE_CLASSIC_500;
            }
            else
            {
               BC_Game.instance.gotoBattleMode = BC_Game.BATTLE_MODE_CLASSIC_1000;
            }
            BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_BATTLESELECTION_SCREEN);
         }
         BC_Game.instance.isRanked = false;
         BC_Game.instance.isChallenge = false;
         BC_Game.instance.isSurvival = false;
         if(BC_Game.instance.isTournament && BC_Game.instance.roundManager.victoriousTeam() == VICTORY)
         {
            ++BC_Game.instance.currentTournamentLevel;
            add = BC_GameProgress.gameProgess.tournamentGold + BC_GameProgress.gameProgess.tournamentSilver;
            tournamentRank = Math.round(add * 5);
            baseReward = 200 + Math.floor(tournamentRank / 5 * 50);
            if(baseReward >= 500)
            {
               baseReward = 500;
            }
            if(BC_Game.instance.currentTournamentLevel >= 6)
            {
               if(tournamentRank != 0 && Math.floor(BC_GameProgress.gameProgess.tournamentSilver / 4) > BC_GameProgress.gameProgess.tournamentGold && BC_GameProgress.gameProgess.tournamentSilver % 4 == 0)
               {
                  baseReward += 5000;
               }
               else
               {
                  baseReward += 1000;
               }
            }
            BC_Game.instance.tournamentReward = baseReward;
         }
         BC_Game.instance.isTournament = false;
      }
      
      private function AfterSaveEnemyArmy() : void
      {
         this.loadRegisteringData.visible = false;
      }
      
      private function AfterSaveAllyArmy() : void
      {
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId == 5)
         {
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyListSmall",BC_Game.instance.metaEnemyLoaded.fullArmyName,this.SuccessLoadEnemyArmy,this.FailLoadEnemyArmy);
         }
         else
         {
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyList",BC_Game.instance.metaEnemyLoaded.fullArmyName,this.SuccessLoadEnemyArmy,this.FailLoadEnemyArmy);
         }
      }
      
      private function SuccessLoadMyArmy(o:DatabaseObject) : void
      {
         if(o == null)
         {
            if(BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId == 5)
            {
               PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyListSmall",BC_Game.instance.metaEnemyLoaded.fullArmyName,this.SuccessLoadEnemyArmy,this.FailLoadEnemyArmy);
            }
            else
            {
               PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyList",BC_Game.instance.metaEnemyLoaded.fullArmyName,this.SuccessLoadEnemyArmy,this.FailLoadEnemyArmy);
            }
            return;
         }
         switch(this._endGameStatus)
         {
            case VICTORY:
               ++o.Wins;
               ++o.CurrentRankCount;
               this._cashReward = Math.floor(this._myCashReward * 2);
               break;
            case LOST:
               ++o.Losts;
               --o.CurrentRankCount;
               this._cashReward = this._myCashReward;
               break;
            case DRAW:
               ++o.Draws;
               this._cashReward = this._myCashReward;
         }
         o.OfflineCash += this._cashReward;
         this._oldRank = o.RankLvl;
         if(o.RankLvl >= 20)
         {
            o.RankLvl = 20;
            if(o.CurrentRankCount >= 10)
            {
               o.CurrentRankCount = 10;
            }
            else if(o.CurrentRankCount <= -11)
            {
               o.CurrentRankCount = 0;
               --o.RankLvl;
            }
         }
         else if(o.RankLvl <= 1)
         {
            o.RankLvl = 1;
            if(o.CurrentRankCount <= -10)
            {
               o.CurrentRankCount = -10;
            }
            else if(o.CurrentRankCount >= 11)
            {
               o.CurrentRankCount = 0;
               ++o.RankLvl;
            }
         }
         else
         {
            if(o.CurrentRankCount >= 11)
            {
               o.CurrentRankCount = 0;
               ++o.RankLvl;
            }
            if(o.CurrentRankCount <= -11)
            {
               o.CurrentRankCount = 0;
               --o.RankLvl;
            }
         }
         this._newRank = o.RankLvl;
         if(this._endGameStatus == VICTORY && this._oldRank != this._newRank)
         {
            this._showChangeRank = true;
         }
         o.save(true,false,this.AfterSaveAllyArmy);
      }
      
      public function get continuePanel() : MovieClip
      {
         return visual.getChildByName("continuePanel") as MovieClip;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         Jukebox.instance.DestroyAllSounds();
         this._oldRank = 0;
         this._newRank = 0;
         this._showChangeRank = false;
         BC_Game.instance.Pause(true);
         InitOkBtn(this.btn_Continue);
         this.btn_Continue.addEventListener(MouseEvent.MOUSE_DOWN,this.onContinue);
         animation.playChildren = false;
         this.loadRegisteringData.visible = false;
         if(!BC_Game.instance.isFriendBattle)
         {
            if(BC_Game.instance.concede)
            {
               this._myCashReward = 0;
               BC_Game.instance.concede = false;
            }
            else
            {
               this._myCashReward = Math.round(100 + BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank * 25);
            }
         }
         this._enemyCashReward = Math.round(100 + BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank * 25);
         this._endGameStatus = BC_Game.instance.roundManager.victoriousTeam();
         if(BC_Game.instance.isRanked)
         {
            this.RegisterData();
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
      }
      
      private function FailLoadEnemyArmy(p:PlayerIOError) : void
      {
         this.loadRegisteringData.visible = false;
      }
      
      private function SaveError() : void
      {
         this.StartGameAfterReferential();
      }
   }
}

