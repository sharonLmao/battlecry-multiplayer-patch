package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.battle.RoundManager;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.screens.view.BattleModePanel;
   import com.battlecry.screens.view.BattleSelectionPanel;
   import com.battlecry.screens.view.Classic1000Panel;
   import com.battlecry.screens.view.Classic500Panel;
   import com.battlecry.screens.view.FriendListView;
   import com.battlecry.screens.view.SurvivalCoopPanel;
   import com.battlecry.screens.view.TopMenuView;
   import com.battlecry.screens.view.TournamentPanel;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import playerio.DatabaseObject;
   import playerio.PlayerIOError;
   
   public class BattleSelectionScreen extends BC_Screen
   {
      
      public static var CLASSIC_1000_PANEL:int = 1;
      
      public static var CLASSIC_500_PANEL:int = 2;
      
      public static var SURVIVAL_COOP_PANEL:int = 3;
      
      public static var TOURNAMENT_PANEL:int = 4;
      
      private var _battleModePanel:BattleModePanel;
      
      private var _currentSelectedPanel:BattleSelectionPanel;
      
      private var _referentialToGive:Array;
      
      private var _offLineCash:int;
      
      private var _survivalCoopPanel:SurvivalCoopPanel;
      
      private var _winsSent:Boolean;
      
      private var _friendListView:FriendListView;
      
      private var _nextPanelToOpen:BattleSelectionPanel;
      
      private var _topMenuView:TopMenuView;
      
      private var _tournamentPanel:TournamentPanel;
      
      private var _classic500Panel:Classic500Panel;
      
      private var _offLineArmyLoaded:int;
      
      private var _referentialLoaded:Boolean;
      
      private var _classic1000Panel:Classic1000Panel;
      
      public function BattleSelectionScreen()
      {
         super();
      }
      
      public function SetFriend() : void
      {
         this._friendListView.SetFriend();
         this._friendListView.Refresh();
         this._survivalCoopPanel.SetFriend();
      }
      
      private function onDone(event:MouseEvent) : void
      {
         this.ModeAddFriend();
      }
      
      public function get btn_ChallengeFacebook() : ButtonSelect
      {
         return visual.getChildByName("btn_ChallengeFacebook") as ButtonSelect;
      }
      
      public function get classic1000Panel() : MovieClip
      {
         return visual.getChildByName("Classic1000Panel") as MovieClip;
      }
      
      public function get fightafriendload() : MovieClip
      {
         return visual.getChildByName("fightafriendload") as MovieClip;
      }
      
      private function onAddFriend(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_ADDAFRIEND_SCREEN) > 0)
         {
            return;
         }
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ADDAFRIEND_SCREEN,false,true);
      }
      
      public function get topMenuView() : MovieClip
      {
         return visual.getChildByName("TopMenuView") as MovieClip;
      }
      
      public function get tournamentPanel() : MovieClip
      {
         return visual.getChildByName("TournamentPanel") as MovieClip;
      }
      
      private function AfterClose() : void
      {
         this._currentSelectedPanel = this._nextPanelToOpen;
         this._nextPanelToOpen.Open();
      }
      
      public function get btn_Link() : ButtonSelect
      {
         return visual.getChildByName("btn_Link") as ButtonSelect;
      }
      
      public function get nextReferalTxt() : TextField
      {
         return visual.getChildByName("nextReferalTxt") as TextField;
      }
      
      public function get survivalCoopPanel() : MovieClip
      {
         return visual.getChildByName("SurvivalCoolPanel") as MovieClip;
      }
      
      public function get friendListView() : MovieClip
      {
         return visual.getChildByName("friendListView") as MovieClip;
      }
      
      public function ModeAddFriend() : void
      {
         this.btn_AddFriend.visible = true;
         this.btn_RemoveFriend.visible = true;
         this.btn_Done.visible = false;
         this._friendListView.ModeAddFriend();
      }
      
      private function ModeRemoveFriend() : void
      {
         this.btn_AddFriend.visible = false;
         this.btn_RemoveFriend.visible = false;
         this.btn_Done.visible = true;
         this._friendListView.ModeRemoveFriend();
      }
      
      private function onChallengeTwitter(event:MouseEvent) : void
      {
         Main.instance.TwitterLink();
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
         this.Refresh();
      }
      
      private function ChallengeFacebook(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_SHAREONFACEBOOK_SCREEN) > 0)
         {
            return;
         }
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_SHAREONFACEBOOK_SCREEN,false,true);
      }
      
      private function InitialLoad() : void
      {
         this.fightafriendload.visible = true;
         this.fightafriendload.play();
         this._offLineCash = 0;
         this._offLineArmyLoaded = 0;
         this.LoadAllArmyMoney();
      }
      
      private function FailLoadReferential(p:PlayerIOError) : void
      {
         this.LoadAllArmyMoney();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._classic1000Panel = new Classic1000Panel(this.classic1000Panel,this);
         this._classic1000Panel.QuickClose();
         this._classic500Panel = new Classic500Panel(this.classic500Panel,this);
         this._classic500Panel.QuickClose();
         this._survivalCoopPanel = new SurvivalCoopPanel(this.survivalCoopPanel,this);
         this._survivalCoopPanel.QuickClose();
         this._tournamentPanel = new TournamentPanel(this.tournamentPanel,this);
         this._tournamentPanel.QuickClose();
         this._battleModePanel = new BattleModePanel(this.battleModePanel,this);
         this._battleModePanel.QuickClose();
         switch(BC_Game.instance.gotoBattleMode)
         {
            case -1:
               this._battleModePanel.QuickOpen();
               break;
            case BC_Game.BATTLE_MODE_CLASSIC_1000:
               this._classic1000Panel.QuickOpen();
               break;
            case BC_Game.BATTLE_MODE_CLASSIC_500:
               this._classic500Panel.QuickOpen();
               break;
            case BC_Game.BATTLE_MODE_COOP_SURVIVAL:
               this._survivalCoopPanel.QuickOpen();
               break;
            case BC_Game.BATTLE_MODE_TOURNAMENT:
               this._tournamentPanel.QuickOpen();
               break;
            default:
               this._battleModePanel.QuickOpen();
         }
         BC_Game.instance.gotoBattleMode = -1;
         this._referentialLoaded = false;
         this._referentialToGive = new Array();
         this._topMenuView = new TopMenuView(this.topMenuView,this);
         this._topMenuView.SetCurrentScreen(BC_ScreenFactory.ID_BATTLESELECTION_SCREEN);
         InitOkBtn(this.btn_Link);
         this.btn_Link.addEventListener(MouseEvent.MOUSE_DOWN,this.onLink);
         InitOkBtn(this.btn_ChallengeFacebook);
         this.btn_ChallengeFacebook.addEventListener(MouseEvent.MOUSE_DOWN,this.ChallengeFacebook);
         InitOkBtn(this.btn_ChallengeTwitter);
         this.btn_ChallengeTwitter.addEventListener(MouseEvent.MOUSE_DOWN,this.onChallengeTwitter);
         InitOkBtn(this.btn_AddFriend);
         this.btn_AddFriend.addEventListener(MouseEvent.MOUSE_DOWN,this.onAddFriend);
         InitOkBtn(this.btn_Done);
         this.btn_Done.addEventListener(MouseEvent.MOUSE_DOWN,this.onDone);
         InitOkBtn(this.btn_RemoveFriend);
         this.btn_RemoveFriend.addEventListener(MouseEvent.MOUSE_DOWN,this.onRemoveFriend);
         this._friendListView = new FriendListView(this.friendListView,this);
         this._friendListView.SetFriend();
         this.ModeAddFriend();
         animation.playChildren = false;
         this.Refresh();
         this.InitialLoad();
         this._winsSent = false;
      }
      
      public function get currentSelectedPanel() : BattleSelectionPanel
      {
         return this._currentSelectedPanel;
      }
      
      public function get classic500Panel() : MovieClip
      {
         return visual.getChildByName("Classic500Panel") as MovieClip;
      }
      
      private function FailLoadArmyMoney(p:PlayerIOError) : void
      {
         this.LoadAllArmyMoney();
      }
      
      private function onRemoveFriend(event:MouseEvent) : void
      {
         this.ModeRemoveFriend();
      }
      
      private function SuccessDeleteTabReferential() : void
      {
         this.LoadAllArmyMoney();
      }
      
      public function get btn_Done() : ButtonSelect
      {
         return visual.getChildByName("btn_Done") as ButtonSelect;
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
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.nextReferalTxt.text = BC_GameProgress.gameProgess.GetReferentialReward(BC_GameProgress.gameProgess.numReferential + 1) + "";
         this.fightafriendload.visible = false;
         this._friendListView.SetFriend();
         this._survivalCoopPanel.SetFriend();
         this._topMenuView.Refresh();
      }
      
      public function get btn_ChallengeTwitter() : ButtonSelect
      {
         return visual.getChildByName("btn_ChallengeTwitter") as ButtonSelect;
      }
      
      public function get battleModePanel() : MovieClip
      {
         return visual.getChildByName("BattleModePanel") as MovieClip;
      }
      
      override public function Close(remove:Boolean, c:Callback, quickClose:Boolean) : void
      {
         super.Close(remove,c,quickClose);
         this._tournamentPanel.onCancel(null);
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
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_Link.removeEventListener(MouseEvent.MOUSE_DOWN,this.onLink);
         this.btn_AddFriend.removeEventListener(MouseEvent.MOUSE_DOWN,this.onAddFriend);
         this.btn_Done.removeEventListener(MouseEvent.MOUSE_DOWN,this.onDone);
         this.btn_RemoveFriend.removeEventListener(MouseEvent.MOUSE_DOWN,this.onRemoveFriend);
         if(this._friendListView)
         {
            this._friendListView.Destroy();
         }
         if(this._topMenuView)
         {
            this._topMenuView.Destroy();
         }
      }
      
      public function get btn_RemoveFriend() : ButtonSelect
      {
         return visual.getChildByName("btn_RemoveFriend") as ButtonSelect;
      }
      
      public function set currentSelectedPanel(currentSelectedPanel:BattleSelectionPanel) : void
      {
         this._currentSelectedPanel = currentSelectedPanel;
      }
      
      override public function Update(context:MainGame) : void
      {
         var r:ReferentialRewardScreen = null;
         super.Update(context);
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
         if(this._battleModePanel)
         {
            this._battleModePanel.Update();
         }
         if(this._classic1000Panel)
         {
            this._classic1000Panel.Update();
         }
         if(this._classic500Panel)
         {
            this._classic500Panel.Update();
         }
         if(this._survivalCoopPanel)
         {
            this._survivalCoopPanel.Update();
         }
         if(this._tournamentPanel)
         {
            this._tournamentPanel.Update();
         }
      }
      
      public function get btn_AddFriend() : ButtonSelect
      {
         return visual.getChildByName("btn_AddFriend") as ButtonSelect;
      }
      
      public function SetPanel(panel:int) : void
      {
         this._currentSelectedPanel.Close(new Callback(this.AfterClose,this,null));
         switch(panel)
         {
            case CLASSIC_1000_PANEL:
               this._nextPanelToOpen = this._classic1000Panel;
               break;
            case CLASSIC_500_PANEL:
               this._nextPanelToOpen = this._classic500Panel;
               break;
            case SURVIVAL_COOP_PANEL:
               this._nextPanelToOpen = this._survivalCoopPanel;
               break;
            case TOURNAMENT_PANEL:
               this._nextPanelToOpen = this._tournamentPanel;
               break;
            default:
               this._nextPanelToOpen = this._battleModePanel;
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
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_BATTLESELECTION_SCREEN);
      }
      
      public function BackToBattleMode() : void
      {
         this._currentSelectedPanel.Close(new Callback(this.AfterClose,this,null));
         this._nextPanelToOpen = this._battleModePanel;
      }
   }
}

