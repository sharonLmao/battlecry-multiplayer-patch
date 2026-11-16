package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.battle.RoundManager;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.meta.model.ModelTutorialEnum;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.screens.view.ArmyStatsView;
   import com.battlecry.screens.view.FriendListView;
   import com.battlecry.screens.view.TopMenuView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.KongStats;
   import com.lachhhEngine.io.externalAPI.statsAPI.MetaStatData;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import playerio.DatabaseObject;
   import playerio.PlayerIOError;
   
   public class BattleFieldScreen extends BC_Screen
   {
      
      private var _referentialToGive:Array;
      
      private var _offLineCash:int;
      
      private var _winsSent:Boolean;
      
      private var _friendListView:FriendListView;
      
      private var _armyGroupSelect:ButtonSelectGroup;
      
      private var _armyStatsView:ArmyStatsView;
      
      private var _topMenuView:TopMenuView;
      
      private var _showTutorial:Boolean;
      
      private var _offLineArmyLoaded:int;
      
      private var _referentialLoaded:Boolean;
      
      public function BattleFieldScreen()
      {
         super();
      }
      
      private function FailLoadArmy() : void
      {
         this.Refresh();
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_BATTLEFIELD_SCREEN);
      }
      
      public function get btn_army3_Activated() : ButtonSelect
      {
         return visual.getChildByName("btn_army3_Activated") as ButtonSelect;
      }
      
      public function get btn_ChallengeFacebook() : ButtonSelect
      {
         return visual.getChildByName("btn_ChallengeFacebook") as ButtonSelect;
      }
      
      private function onAddFriend(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_ADDAFRIEND_SCREEN) > 0)
         {
            return;
         }
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ADDAFRIEND_SCREEN,false,true);
      }
      
      private function onDone(event:MouseEvent) : void
      {
         this.ModeAddFriend();
      }
      
      private function onRanked(event:MouseEvent) : void
      {
         var q:QuestionScreen = null;
         if(this._armyStatsView.btn_rankedMatch.isSelected)
         {
            return;
         }
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().IsEmpty())
         {
            q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
            q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_ALL_ARMY_EMPTY));
            return;
         }
         var s:SearchingOpponentScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_SEARCHINGOPPONENT_SCREEN) as SearchingOpponentScreen;
         s.SetCloseScreen(this);
         getContext.isRanked = true;
         BC_Game.instance.currentCampaign = null;
      }
      
      private function onChallengeTwitter(event:MouseEvent) : void
      {
         Main.instance.TwitterLink();
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         super.ShowIdle(context);
      }
      
      public function get btn_army1_Activated() : ButtonSelect
      {
         return visual.getChildByName("btn_army1_Activated") as ButtonSelect;
      }
      
      public function get btn_army3() : ButtonSelect
      {
         return visual.getChildByName("btn_army3") as ButtonSelect;
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
      
      public function get btn_army2() : ButtonSelect
      {
         return visual.getChildByName("btn_army2") as ButtonSelect;
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
      
      public function ModeAddFriend() : void
      {
         this.btn_AddFriend.visible = true;
         this.btn_RemoveFriend.visible = true;
         this.btn_Done.visible = false;
         this._friendListView.ModeAddFriend();
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
      
      public function get btn_army1() : ButtonSelect
      {
         return visual.getChildByName("btn_army1") as ButtonSelect;
      }
      
      public function get friendListView() : MovieClip
      {
         return visual.getChildByName("friendListView") as MovieClip;
      }
      
      public function SetFriend() : void
      {
         this._friendListView.SetFriend();
         this._friendListView.Refresh();
      }
      
      public function get btn_army4() : ButtonSelect
      {
         return visual.getChildByName("btn_army4") as ButtonSelect;
      }
      
      public function get btn_Link() : ButtonSelect
      {
         return visual.getChildByName("btn_Link") as ButtonSelect;
      }
      
      private function FailLoadReferential(p:PlayerIOError) : void
      {
         this.LoadAllArmyMoney();
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
      
      public function get nextReferalTxt() : TextField
      {
         return visual.getChildByName("nextReferalTxt") as TextField;
      }
      
      private function LoadAllArmyMoney() : void
      {
         var g:GoldRewardScreen = null;
         var g1:GoldRewardScreen = null;
         ++this._offLineArmyLoaded;
         if(this._offLineArmyLoaded <= 4)
         {
            if(BC_GameProgress.gameProgess.getArmy(this._offLineArmyLoaded).multiPlayerActivated <= 0)
            {
               this.LoadAllArmyMoney();
            }
            else
            {
               PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyList",Main.instance.GetPIOid() + "_army" + this._offLineArmyLoaded,this.SuccessLoadArmyMoney,this.FailLoadArmyMoney);
            }
            return;
         }
         if(this._offLineCash > 0)
         {
            g = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_GOLDREWARD_SCREEN,false,true) as GoldRewardScreen;
            g.SetReward(this._offLineCash);
            this._offLineCash = 0;
            BC_Game.instance.Save();
         }
         if(!this._referentialLoaded)
         {
            this._referentialLoaded = true;
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("Referencial",Main.instance.GetPIOid(),this.SuccessLoadReferential,this.FailLoadReferential);
            return;
         }
         if(BC_Game.instance.isFriendBattle)
         {
            BC_Game.instance.isFriendBattle = false;
            if(BC_Game.instance.concede)
            {
               BC_Game.instance.concede = false;
            }
            else
            {
               g1 = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_GOLDREWARD_SCREEN,false,true) as GoldRewardScreen;
               if(BC_Game.instance.lastFightState == RoundManager.VICTORY)
               {
                  g1.SetReward(200);
               }
               else
               {
                  g1.SetReward(100);
               }
            }
         }
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
         }
      }
      
      private function ArmyCreatedFail(p:PlayerIOError) : void
      {
         this.Refresh();
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_CANT_ACTIVATE));
      }
      
      private function InitialLoad() : void
      {
         this.multiPlayerStatLoading.visible = true;
         this.multiPlayerStatLoading.play();
         this._offLineCash = 0;
         this._offLineArmyLoaded = 0;
         this.LoadAllArmyMoney();
      }
      
      private function CheckArmyActivated() : void
      {
         this.multiPlayerStatLoading.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyList",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,this.ArmyActivated,this.ArmyNotActivated);
      }
      
      public function get fightafriendload() : MovieClip
      {
         return visual.getChildByName("fightafriendload") as MovieClip;
      }
      
      private function onActivateArmy(event:MouseEvent) : void
      {
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.createObject("ArmyList",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,null,this.ArmyCreatedSuccess,this.ArmyCreatedFail);
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._showTutorial = false;
         this._referentialLoaded = false;
         this._referentialToGive = new Array();
         this._armyStatsView = new ArmyStatsView(this.armyStatView);
         InitOkBtn(this.btn_Link);
         this.btn_Link.addEventListener(MouseEvent.MOUSE_DOWN,this.onLink);
         InitOkBtn(this.btn_ChallengeFacebook);
         this.btn_ChallengeFacebook.addEventListener(MouseEvent.MOUSE_DOWN,this.ChallengeFacebook);
         InitOkBtn(this.btn_ChallengeTwitter);
         this.btn_ChallengeTwitter.addEventListener(MouseEvent.MOUSE_DOWN,this.onChallengeTwitter);
         InitOkBtn(this._armyStatsView.btn_Refresh);
         this._armyStatsView.btn_Refresh.addEventListener(MouseEvent.MOUSE_DOWN,this.onRefresh);
         InitOkBtn(this._armyStatsView.btn_showLadder);
         this._armyStatsView.btn_showLadder.addEventListener(MouseEvent.MOUSE_DOWN,this.onShowLadder);
         InitOkBtn(this._armyStatsView.btn_activateArmy);
         this._armyStatsView.btn_activateArmy.addEventListener(MouseEvent.MOUSE_DOWN,this.onActivateArmy);
         InitOkBtn(this._armyStatsView.btn_desactivateArmy);
         this._armyStatsView.btn_desactivateArmy.addEventListener(MouseEvent.MOUSE_DOWN,this.onDeactivate);
         InitOkBtn(this._armyStatsView.btn_rankedMatch);
         this._armyStatsView.btn_rankedMatch.addEventListener(MouseEvent.MOUSE_DOWN,this.onRanked);
         InitOkBtn(this._armyStatsView.btn_ResetArmy);
         this._armyStatsView.btn_ResetArmy.addEventListener(MouseEvent.MOUSE_DOWN,this.onResetArmy);
         this._topMenuView = new TopMenuView(this.topMenuView,this);
         this._topMenuView.SetCurrentScreen(BC_ScreenFactory.ID_BATTLEFIELD_SCREEN);
         InitOkBtn(this.btn_AddFriend);
         this.btn_AddFriend.addEventListener(MouseEvent.MOUSE_DOWN,this.onAddFriend);
         InitOkBtn(this.btn_Done);
         this.btn_Done.addEventListener(MouseEvent.MOUSE_DOWN,this.onDone);
         InitOkBtn(this.btn_RemoveFriend);
         this.btn_RemoveFriend.addEventListener(MouseEvent.MOUSE_DOWN,this.onRemoveFriend);
         this.ModeAddFriend();
         InitOkBtn(this.btn_army1);
         this.btn_army1.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy1);
         InitOkBtn(this.btn_army1_Activated);
         this.btn_army1_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy1);
         InitOkBtn(this.btn_army2);
         this.btn_army2.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy2);
         InitOkBtn(this.btn_army2_Activated);
         this.btn_army2_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy2);
         InitOkBtn(this.btn_army3);
         this.btn_army3.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy3);
         InitOkBtn(this.btn_army3_Activated);
         this.btn_army3_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy3);
         InitOkBtn(this.btn_army4);
         this.btn_army4.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy4);
         InitOkBtn(this.btn_army4_Activated);
         this.btn_army4_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy4);
         this._armyGroupSelect = new ButtonSelectGroup();
         this._armyGroupSelect.AddButton(this.btn_army1);
         this._armyGroupSelect.AddButton(this.btn_army1_Activated);
         this._armyGroupSelect.AddButton(this.btn_army2);
         this._armyGroupSelect.AddButton(this.btn_army2_Activated);
         this._armyGroupSelect.AddButton(this.btn_army3);
         this._armyGroupSelect.AddButton(this.btn_army3_Activated);
         this._armyGroupSelect.AddButton(this.btn_army4);
         this._armyGroupSelect.AddButton(this.btn_army4_Activated);
         this.fightafriendload.visible = false;
         this.fightafriendload.play();
         this.ManageArmyButtons();
         this.Refresh();
         this.InitialLoad();
         animation.playChildren = false;
         this._winsSent = false;
         Jukebox.instance.FadeToMusic(BC_SfxFactory.ID_MUSIC_INTERFACES);
      }
      
      public function get topMenuView() : MovieClip
      {
         return visual.getChildByName("TopMenuView") as MovieClip;
      }
      
      private function onDeactivate(event:MouseEvent) : void
      {
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyList",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,this.LoadArmyToDelete,this.FailLoadArmy);
      }
      
      private function ChallengeFacebook(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_SHAREONFACEBOOK_SCREEN) > 0)
         {
            return;
         }
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_SHAREONFACEBOOK_SCREEN,false,true);
      }
      
      private function ModeRemoveFriend() : void
      {
         this.btn_AddFriend.visible = false;
         this.btn_RemoveFriend.visible = false;
         this.btn_Done.visible = true;
         this._friendListView.ModeRemoveFriend();
      }
      
      private function onShowLadder(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_RANKMETER_SCREEN) > 0)
         {
            return;
         }
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_RANKMETER_SCREEN,false,true);
      }
      
      private function FailLoadArmyMoney(p:PlayerIOError) : void
      {
         this.LoadAllArmyMoney();
      }
      
      private function SuccessLoadArmyMoney(o:DatabaseObject) : void
      {
         if(o)
         {
            this._offLineCash += o.OfflineCash;
            o.OfflineCash = 0;
            o.save();
         }
         else
         {
            BC_GameProgress.gameProgess.getArmy(this._offLineArmyLoaded).multiPlayerActivated = 0;
         }
         this.LoadAllArmyMoney();
      }
      
      private function SuccessDeleteTabReferential() : void
      {
         this.LoadAllArmyMoney();
      }
      
      public function LoadArmy() : void
      {
         this.multiPlayerStatLoading.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("ArmyList",Main.instance.GetPIOid() + "_army" + BC_GameProgress.gameProgess.CurrentSelectedArmy().teamId,this.SuccessLoadArmy,this.FailLoadArmy);
      }
      
      public function get btn_Done() : ButtonSelect
      {
         return visual.getChildByName("btn_Done") as ButtonSelect;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.nextReferalTxt.text = BC_GameProgress.gameProgess.GetReferentialReward(BC_GameProgress.gameProgess.numReferential + 1) + "";
         this.multiPlayerStatLoading.visible = false;
         this.ManageArmyButtons();
         this._armyStatsView.Refresh();
         this._friendListView.SetFriend();
         this._topMenuView.Refresh();
      }
      
      public function get btn_army2_Activated() : ButtonSelect
      {
         return visual.getChildByName("btn_army2_Activated") as ButtonSelect;
      }
      
      public function get btn_army4_Activated() : ButtonSelect
      {
         return visual.getChildByName("btn_army4_Activated") as ButtonSelect;
      }
      
      private function FailLoadArmyReset() : void
      {
         this.multiPlayerStatLoading.visible = false;
      }
      
      private function onRemoveFriend(event:MouseEvent) : void
      {
         this.ModeRemoveFriend();
      }
      
      public function get btn_ChallengeTwitter() : ButtonSelect
      {
         return visual.getChildByName("btn_ChallengeTwitter") as ButtonSelect;
      }
      
      public function get armyStatView() : MovieClip
      {
         return visual.getChildByName("armyStatView") as MovieClip;
      }
      
      private function AfterSave() : void
      {
         this.Refresh();
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
      
      private function SuccessLoadReferential(o:DatabaseObject) : void
      {
         var i:int = 0;
         if(o)
         {
            for(i = 0; i < o.ReferencialList.length; i++)
            {
               this._referentialToGive[i] = o.ReferencialList[i];
            }
            PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.deleteKeys("Referencial",[Main.instance.GetPIOid()],this.SuccessDeleteTabReferential,this.FailLoadReferential);
         }
         else
         {
            this.LoadAllArmyMoney();
         }
      }
      
      public function get btn_AddFriend() : ButtonSelect
      {
         return visual.getChildByName("btn_AddFriend") as ButtonSelect;
      }
      
      public function get btn_RemoveFriend() : ButtonSelect
      {
         return visual.getChildByName("btn_RemoveFriend") as ButtonSelect;
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
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_YES_NO,TextFactory.instance.GetMsg(BC_TextFactory.ID_DO_YOU_WANT_TO_RESET_ARMY),new Callback(this.ResetArmy,this,null));
      }
      
      public function get multiPlayerStatLoading() : MovieClip
      {
         return visual.getChildByName("multiPlayerStatLoading") as MovieClip;
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
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_Link.removeEventListener(MouseEvent.MOUSE_DOWN,this.onLink);
         this._armyStatsView.btn_Refresh.removeEventListener(MouseEvent.MOUSE_DOWN,this.onRefresh);
         this._armyStatsView.btn_showLadder.removeEventListener(MouseEvent.MOUSE_DOWN,this.onShowLadder);
         this._armyStatsView.btn_activateArmy.removeEventListener(MouseEvent.MOUSE_DOWN,this.onActivateArmy);
         this._armyStatsView.btn_desactivateArmy.removeEventListener(MouseEvent.MOUSE_DOWN,this.onDeactivate);
         this._armyStatsView.btn_rankedMatch.removeEventListener(MouseEvent.MOUSE_DOWN,this.onRanked);
         this.btn_AddFriend.removeEventListener(MouseEvent.MOUSE_DOWN,this.onAddFriend);
         this.btn_Done.removeEventListener(MouseEvent.MOUSE_DOWN,this.onDone);
         this.btn_RemoveFriend.removeEventListener(MouseEvent.MOUSE_DOWN,this.onRemoveFriend);
         this.btn_army1.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArmy1);
         this.btn_army1_Activated.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArmy1);
         this.btn_army2.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArmy2);
         this.btn_army2_Activated.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArmy2);
         this.btn_army3.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArmy3);
         this.btn_army3_Activated.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArmy3);
         this.btn_army4.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArmy4);
         this.btn_army4_Activated.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArmy4);
         if(this._friendListView)
         {
            this._friendListView.Destroy();
         }
         if(this._armyStatsView)
         {
            this._armyStatsView.Destroy();
         }
         if(this._topMenuView)
         {
            this._topMenuView.Destroy();
         }
      }
      
      private function SuccessDeactivateArmy() : void
      {
         BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerActivated = 0;
         this.Refresh();
         BC_Game.instance.Save();
      }
      
      override public function Update(context:MainGame) : void
      {
         var r:ReferentialRewardScreen = null;
         super.Update(context);
         if(!this._showTutorial)
         {
            this._showTutorial = true;
            BC_GameProgress.gameProgess.tutorialManager.ShowTutorial(ModelTutorialEnum.TUTORIAL_MULTIPLAYER);
            this._topMenuView.InitGlow();
         }
         if(this._referentialToGive.length > 0 && ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_REFERENTIALREWARD_SCREEN) <= 0 && ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_TUTORIAL_MULTIPLAYER_SCREEN) <= 0 && ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_GOLDREWARD_SCREEN) <= 0)
         {
            ++BC_GameProgress.gameProgess.numReferential;
            r = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_REFERENTIALREWARD_SCREEN) as ReferentialRewardScreen;
            r.SetReferential(this._referentialToGive.shift());
            if(this._referentialToGive.length <= 0)
            {
               BC_Game.instance.Save();
            }
         }
         if(this._friendListView)
         {
            this._friendListView.Update();
         }
      }
      
      private function onLink(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_LINK_SCREEN) > 0)
         {
            return;
         }
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_LINK_SCREEN);
      }
      
      private function onRefresh(event:MouseEvent) : void
      {
         if(this._armyStatsView.btn_Refresh.isSelected)
         {
            return;
         }
         this.LoadArmy();
      }
   }
}

