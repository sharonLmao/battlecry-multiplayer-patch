package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.BattleSelectionScreen;
   import com.battlecry.screens.QuestionScreen;
   import com.battlecry.screens.SearchingOpponentScreen;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.KongStats;
   import com.lachhhEngine.io.externalAPI.statsAPI.MetaStatData;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import playerio.DatabaseObject;
   import playerio.PlayerIOError;
   
   public class Classic1000Panel extends BattleSelectionPanel
   {
      
      private var _armyStatsView:ArmyStatsView;
      
      private var _winsSent:Boolean;
      
      private var _armyGroupSelect:ButtonSelectGroup;
      
      public function Classic1000Panel(visual:DisplayObjectContainer, battleSelectionScreen:BattleSelectionScreen)
      {
         super(visual,battleSelectionScreen);
         this.btn_army1.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy1);
         this.btn_army1_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy1);
         this.btn_army2.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy2);
         this.btn_army2_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy2);
         this.btn_army3.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy3);
         this.btn_army3_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy3);
         this.btn_army4.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy4);
         this.btn_army4_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy4);
         this._armyStatsView = new ArmyStatsView(this.armyStatView);
         this._armyStatsView.btn_Refresh.addEventListener(MouseEvent.MOUSE_DOWN,this.onRefresh);
         this._armyStatsView.btn_showLadder.addEventListener(MouseEvent.MOUSE_DOWN,this.onShowLadder);
         this._armyStatsView.btn_activateArmy.addEventListener(MouseEvent.MOUSE_DOWN,this.onActivateArmy);
         this._armyStatsView.btn_desactivateArmy.addEventListener(MouseEvent.MOUSE_DOWN,this.onDeactivate);
         this._armyStatsView.btn_rankedMatch.addEventListener(MouseEvent.MOUSE_DOWN,this.onRanked);
         this._armyStatsView.btn_ResetArmy.addEventListener(MouseEvent.MOUSE_DOWN,this.onResetArmy);
         this._armyGroupSelect = new ButtonSelectGroup();
         this._armyGroupSelect.AddButton(this.btn_army1);
         this._armyGroupSelect.AddButton(this.btn_army1_Activated);
         this._armyGroupSelect.AddButton(this.btn_army2);
         this._armyGroupSelect.AddButton(this.btn_army2_Activated);
         this._armyGroupSelect.AddButton(this.btn_army3);
         this._armyGroupSelect.AddButton(this.btn_army3_Activated);
         this._armyGroupSelect.AddButton(this.btn_army4);
         this._armyGroupSelect.AddButton(this.btn_army4_Activated);
         this._winsSent = false;
      }
      
      private function FailLoadArmy() : void
      {
         this.Refresh();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.multiPlayerStatLoading.visible = false;
         this.ManageArmyButtons();
         this._armyStatsView.Refresh();
      }
      
      public function LoadArmy() : void
      {
         this.multiPlayerStatLoading.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyList",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,this.SuccessLoadArmy,this.FailLoadArmy);
      }
      
      public function get btn_army2_Activated() : ButtonSelect
      {
         return panel.getChildByName("btn_army2_Activated") as ButtonSelect;
      }
      
      public function get btn_army4_Activated() : ButtonSelect
      {
         return panel.getChildByName("btn_army4_Activated") as ButtonSelect;
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
         var s:SearchingOpponentScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_SEARCHINGOPPONENT_SCREEN) as SearchingOpponentScreen;
         s.SetCloseScreen(battleSelectionScreen);
         BC_Game.instance.isRanked = true;
         BC_Game.instance.currentCampaign = null;
      }
      
      public function get btn_army3_Activated() : ButtonSelect
      {
         return panel.getChildByName("btn_army3_Activated") as ButtonSelect;
      }
      
      private function FailLoadArmyReset() : void
      {
         this.multiPlayerStatLoading.visible = false;
      }
      
      public function get btn_army1() : ButtonSelect
      {
         return panel.getChildByName("btn_army1") as ButtonSelect;
      }
      
      public function get btn_army1_Activated() : ButtonSelect
      {
         return panel.getChildByName("btn_army1_Activated") as ButtonSelect;
      }
      
      public function get btn_army3() : ButtonSelect
      {
         return panel.getChildByName("btn_army3") as ButtonSelect;
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
      
      private function onArmy1(event:MouseEvent) : void
      {
         if(this.btn_army1.visible)
         {
            this._armyGroupSelect.SelectButton(this.btn_army1);
         }
         if(this.btn_army1_Activated.visible)
         {
            this._armyGroupSelect.SelectButton(this.btn_army1_Activated);
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(1);
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated <= 0)
         {
            this.CheckArmyActivated();
         }
         else
         {
            this.LoadArmy();
         }
      }
      
      private function onArmy2(event:MouseEvent) : void
      {
         if(this.btn_army2.visible)
         {
            this._armyGroupSelect.SelectButton(this.btn_army2);
         }
         if(this.btn_army2_Activated.visible)
         {
            this._armyGroupSelect.SelectButton(this.btn_army2_Activated);
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(2);
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated <= 0)
         {
            this.CheckArmyActivated();
         }
         else
         {
            this.LoadArmy();
         }
      }
      
      private function onArmy3(event:MouseEvent) : void
      {
         if(this.btn_army3.visible)
         {
            this._armyGroupSelect.SelectButton(this.btn_army3);
         }
         if(this.btn_army3_Activated.visible)
         {
            this._armyGroupSelect.SelectButton(this.btn_army3_Activated);
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(3);
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated <= 0)
         {
            this.CheckArmyActivated();
         }
         else
         {
            this.LoadArmy();
         }
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
      
      private function AfterSave() : void
      {
         this.Refresh();
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
      
      public function get armyStatView() : MovieClip
      {
         return panel.getChildByName("armyStatView") as MovieClip;
      }
      
      private function ManageArmyButtons() : void
      {
         this.btn_army1.visible = false;
         this.btn_army1_Activated.visible = false;
         this.btn_army2.visible = false;
         this.btn_army2_Activated.visible = false;
         this.btn_army3.visible = false;
         this.btn_army3_Activated.visible = false;
         this.btn_army4.visible = false;
         this.btn_army4_Activated.visible = false;
         if(BC_GameProgress.gameProgess.metaArmy1.IsMultiplayer())
         {
            this.btn_army1_Activated.visible = true;
         }
         else
         {
            this.btn_army1.visible = true;
         }
         if(BC_GameProgress.gameProgess.metaArmy2.IsMultiplayer())
         {
            this.btn_army2_Activated.visible = true;
         }
         else
         {
            this.btn_army2.visible = true;
         }
         if(BC_GameProgress.gameProgess.metaArmy3.IsMultiplayer())
         {
            this.btn_army3_Activated.visible = true;
         }
         else
         {
            this.btn_army3.visible = true;
         }
         if(BC_GameProgress.gameProgess.metaArmy4.IsMultiplayer())
         {
            this.btn_army4_Activated.visible = true;
         }
         else
         {
            this.btn_army4.visible = true;
         }
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().IsMultiplayer())
         {
            switch(BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId)
            {
               case 1:
                  this._armyGroupSelect.SelectButton(this.btn_army1_Activated);
                  break;
               case 2:
                  this._armyGroupSelect.SelectButton(this.btn_army2_Activated);
                  break;
               case 3:
                  this._armyGroupSelect.SelectButton(this.btn_army3_Activated);
                  break;
               case 4:
                  this._armyGroupSelect.SelectButton(this.btn_army4_Activated);
            }
         }
         else
         {
            switch(BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId)
            {
               case 1:
                  this._armyGroupSelect.SelectButton(this.btn_army1);
                  break;
               case 2:
                  this._armyGroupSelect.SelectButton(this.btn_army2);
                  break;
               case 3:
                  this._armyGroupSelect.SelectButton(this.btn_army3);
                  break;
               case 4:
                  this._armyGroupSelect.SelectButton(this.btn_army4);
            }
         }
      }
      
      public function get btn_army2() : ButtonSelect
      {
         return panel.getChildByName("btn_army2") as ButtonSelect;
      }
      
      public function get btn_army4() : ButtonSelect
      {
         return panel.getChildByName("btn_army4") as ButtonSelect;
      }
      
      private function SuccessLoadArmy(o:DatabaseObject) : void
      {
         var biggest:Number = NaN;
         var i:int = 0;
         var Win:MetaStatData = null;
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
         if(BC_VersionInfo.isKongregate && !this._winsSent)
         {
            this._winsSent = true;
            biggest = 0;
            for(i = 1; i <= 4; i++)
            {
               if(biggest < BC_GameProgress.gameProgess.getArmy(i).multiPlayerWin)
               {
                  biggest = BC_GameProgress.gameProgess.getArmy(i).multiPlayerWin;
               }
            }
            if(biggest > 0)
            {
               Win = new MetaStatData("Multiplayer_Victory",biggest);
               KongStats.SubmitData(Win);
            }
         }
         this.Refresh();
      }
      
      private function onArmy4(event:MouseEvent) : void
      {
         if(this.btn_army4.visible)
         {
            this._armyGroupSelect.SelectButton(this.btn_army4);
         }
         if(this.btn_army4_Activated.visible)
         {
            this._armyGroupSelect.SelectButton(this.btn_army4_Activated);
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(4);
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated <= 0)
         {
            this.CheckArmyActivated();
         }
         else
         {
            this.LoadArmy();
         }
      }
      
      private function LoadArmyToDelete(o:DatabaseObject) : void
      {
         if(o)
         {
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.deleteKeys("ArmyList",new Array(Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId),this.SuccessDeactivateArmy,this.FailLoadArmy);
         }
         else
         {
            this.Refresh();
         }
      }
      
      override public function Open(c:Callback = null) : void
      {
         super.Open(c);
         this.ManageArmyButtons();
         this.Refresh();
         this.InitialLoad();
      }
      
      private function ResetArmy() : void
      {
         if(this._armyStatsView.btn_ResetArmy.isSelected)
         {
            return;
         }
         this.multiPlayerStatLoading.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyList",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,this.SuccessloadArmyReset,this.FailLoadArmyReset);
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
      
      private function onActivateArmy(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         this.multiPlayerStatLoading.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.createObject("ArmyList",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,null,this.ArmyCreatedSuccess,this.ArmyCreatedFail);
      }
      
      private function ArmyCreatedFail(p:PlayerIOError) : void
      {
         this.Refresh();
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_CANT_ACTIVATE));
      }
      
      private function InitialLoad() : void
      {
         switch(BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId)
         {
            case 1:
               this.onArmy1(null);
               break;
            case 2:
               this.onArmy2(null);
               break;
            case 3:
               this.onArmy3(null);
               break;
            case 4:
               this.onArmy4(null);
               break;
            case 5:
               this.onArmy1(null);
         }
      }
      
      private function SuccessDeactivateArmy() : void
      {
         BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated = 0;
         this.Refresh();
         BC_Game.instance.Save();
      }
      
      public function get multiPlayerStatLoading() : MovieClip
      {
         return panel.getChildByName("multiPlayerStatLoading") as MovieClip;
      }
      
      override public function QuickOpen() : void
      {
         super.QuickOpen();
         this.ManageArmyButtons();
         this.Refresh();
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
      
      private function onDeactivate(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         this.multiPlayerStatLoading.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyList",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,this.LoadArmyToDelete,this.FailLoadArmy);
      }
      
      private function CheckArmyActivated() : void
      {
         this.multiPlayerStatLoading.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyList",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,this.ArmyActivated,this.ArmyNotActivated);
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

