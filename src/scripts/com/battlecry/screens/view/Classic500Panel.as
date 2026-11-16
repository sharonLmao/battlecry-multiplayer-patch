package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.BattleSelectionScreen;
   import com.battlecry.screens.QuestionScreen;
   import com.battlecry.screens.SearchingOpponent500Screen;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import playerio.DatabaseObject;
   import playerio.PlayerIOError;
   
   public class Classic500Panel extends BattleSelectionPanel
   {
      
      private var _armyStatsView:ArmyStatsView;
      
      public function Classic500Panel(visual:DisplayObjectContainer, battleSelectionScreen:BattleSelectionScreen)
      {
         super(visual,battleSelectionScreen);
         this._armyStatsView = new ArmyStatsView(this.armyStatView);
         this._armyStatsView.btn_Refresh.addEventListener(MouseEvent.MOUSE_DOWN,this.onRefresh);
         this._armyStatsView.btn_showLadder.addEventListener(MouseEvent.MOUSE_DOWN,this.onShowLadder);
         this._armyStatsView.btn_activateArmy.addEventListener(MouseEvent.MOUSE_DOWN,this.onActivateArmy);
         this._armyStatsView.btn_desactivateArmy.addEventListener(MouseEvent.MOUSE_DOWN,this.onDeactivate);
         this._armyStatsView.btn_rankedMatch.addEventListener(MouseEvent.MOUSE_DOWN,this.onRanked);
         this._armyStatsView.btn_ResetArmy.addEventListener(MouseEvent.MOUSE_DOWN,this.onResetArmy);
         this.Refresh();
      }
      
      private function FailLoadArmy() : void
      {
         this.Refresh();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.multiPlayerStatLoading.visible = false;
         this._armyStatsView.Refresh();
         if(BC_GameProgress.gameProgess.getArmy(5).multiPlayerActivated == 1)
         {
            this.btn_Army5.visible = false;
            this.btn_army5_Activated.visible = true;
         }
         else
         {
            this.btn_Army5.visible = true;
            this.btn_army5_Activated.visible = false;
         }
      }
      
      public function LoadArmy() : void
      {
         this.multiPlayerStatLoading.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyListSmall",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,this.SuccessLoadArmy,this.FailLoadArmy);
      }
      
      public function get btn_army5_Activated() : ButtonSelect
      {
         return panel.getChildByName("btn_army5_Activated") as ButtonSelect;
      }
      
      private function onRanked(event:MouseEvent) : void
      {
         var q:QuestionScreen = null;
         if(this._armyStatsView.btn_rankedMatch.isSelected)
         {
            return;
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().IsEmpty())
         {
            q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
            q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_ALL_ARMY_EMPTY));
            return;
         }
         var s:SearchingOpponent500Screen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_SEARCHINGOPPONENT500_SCREEN) as SearchingOpponent500Screen;
         s.SetCloseScreen(battleSelectionScreen);
         BC_Game.instance.isRanked = true;
         BC_Game.instance.currentCampaign = null;
      }
      
      private function FailLoadArmyReset() : void
      {
         this.multiPlayerStatLoading.visible = false;
      }
      
      private function ArmyActivated(o:DatabaseObject) : void
      {
         if(Boolean(o) && BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated == 0)
         {
            BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated = 1;
            BC_Game.instance.Save();
         }
         this.LoadArmy();
      }
      
      public function get armyStatView() : MovieClip
      {
         return panel.getChildByName("armyStatView") as MovieClip;
      }
      
      private function ArmyCreatedSuccess(o:DatabaseObject) : void
      {
         var q:QuestionScreen = null;
         if(o)
         {
            o.Wins = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerWin;
            o.Losts = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerLost;
            o.Draws = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerDraw;
            o.RankLvl = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank;
            o.CurrentRankCount = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerCurrentRankCount;
            o.Offline = 0;
            o.OfflineCash = 0;
            o.save();
         }
         else
         {
            q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
            q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_ALREADY_ACTIVATED));
         }
         BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated = 1;
         BC_Game.instance.Save(new Callback(this.AfterSave,this,null));
      }
      
      private function onArmy5() : void
      {
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(5);
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated <= 0)
         {
            this.CheckArmyActivated();
         }
         else
         {
            this.LoadArmy();
         }
      }
      
      private function ArmyNotActivated(p:PlayerIOError) : void
      {
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated == 1)
         {
            BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated = 0;
            BC_Game.instance.Save();
         }
         this.LoadArmy();
      }
      
      private function AfterSave() : void
      {
         this.Refresh();
      }
      
      private function SuccessLoadArmy(o:DatabaseObject) : void
      {
         if(o)
         {
            BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerWin = o.Wins;
            BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerLost = o.Losts;
            BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerDraw = o.Draws;
            BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank = o.RankLvl;
            BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerCurrentRankCount = o.CurrentRankCount;
         }
         else
         {
            BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated = 0;
         }
         this.Refresh();
      }
      
      private function LoadArmyToDelete(o:DatabaseObject) : void
      {
         if(o)
         {
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.deleteKeys("ArmyListSmall",new Array(Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId),this.SuccessDeactivateArmy,this.FailLoadArmy);
         }
         else
         {
            this.Refresh();
         }
      }
      
      private function InitialLoad() : void
      {
         this.btn_Army5.Select();
         this.btn_army5_Activated.Select();
         if(BC_GameProgress.gameProgess.getArmy(5).multiPlayerActivated == 1)
         {
            this.btn_Army5.visible = false;
            this.btn_army5_Activated.visible = true;
         }
         else
         {
            this.btn_Army5.visible = true;
            this.btn_army5_Activated.visible = false;
         }
         this.onArmy5();
      }
      
      private function ResetArmy() : void
      {
         if(this._armyStatsView.btn_ResetArmy.isSelected)
         {
            return;
         }
         this.multiPlayerStatLoading.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyListSmall",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,this.SuccessloadArmyReset,this.FailLoadArmyReset);
      }
      
      private function onResetArmy(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_QUESTION_SCREEN) > 0)
         {
            return;
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_YES_NO,TextFactory.instance.GetMsg(BC_TextFactory.ID_DO_YOU_WANT_TO_RESET_ARMY),new Callback(this.ResetArmy,this,null));
      }
      
      public function get multiPlayerStatLoading() : MovieClip
      {
         return panel.getChildByName("multiPlayerStatLoading") as MovieClip;
      }
      
      private function onActivateArmy(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         this.multiPlayerStatLoading.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.createObject("ArmyListSmall",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,null,this.ArmyCreatedSuccess,this.ArmyCreatedFail);
      }
      
      private function ArmyCreatedFail(p:PlayerIOError) : void
      {
         this.Refresh();
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_CANT_ACTIVATE));
      }
      
      override public function Open(c:Callback = null) : void
      {
         super.Open(c);
         this.InitialLoad();
      }
      
      private function onDeactivate(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         this.multiPlayerStatLoading.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyListSmall",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,this.LoadArmyToDelete,this.FailLoadArmy);
      }
      
      private function SuccessDeactivateArmy() : void
      {
         BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated = 0;
         this.Refresh();
         BC_Game.instance.Save();
      }
      
      public function get btn_Army5() : ButtonSelect
      {
         return panel.getChildByName("btn_Army5") as ButtonSelect;
      }
      
      override public function QuickOpen() : void
      {
         super.QuickOpen();
         this.InitialLoad();
      }
      
      private function SuccessloadArmyReset(o:DatabaseObject) : void
      {
         if(o)
         {
            BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerWin = 0;
            BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerLost = 0;
            BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerDraw = 0;
            BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank = 1;
            BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerCurrentRankCount = 0;
            o.Wins = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerWin;
            o.Losts = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerLost;
            o.Draws = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerDraw;
            o.RankLvl = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank;
            o.CurrentRankCount = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerCurrentRankCount;
            o.Offline = 0;
            o.OfflineCash = 0;
            o.save();
         }
         this.multiPlayerStatLoading.visible = false;
         this.Refresh();
      }
      
      private function CheckArmyActivated() : void
      {
         this.multiPlayerStatLoading.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyListSmall",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,this.ArmyActivated,this.ArmyNotActivated);
      }
      
      private function onRefresh(event:MouseEvent) : void
      {
         if(this._armyStatsView.btn_Refresh.isSelected)
         {
            return;
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         this.LoadArmy();
      }
      
      private function onShowLadder(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_RANKMETER_SCREEN) > 0)
         {
            return;
         }
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_RANKMETER_SCREEN,false,true);
      }
   }
}

