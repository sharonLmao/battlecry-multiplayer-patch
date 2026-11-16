package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.meta.MetaEnemyLoaded;
   import com.battlecry.meta.MetaFriend;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.BattleSelectionScreen;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import playerio.DatabaseObject;
   import playerio.PlayerIOError;
   
   public class SurvivalCoopPanel extends BattleSelectionPanel
   {
      
      private var _metaFriend:MetaFriend;
      
      private var _coopFriendList:CoopFriendList;
      
      private var _coopFriendView:CoopFriendView;
      
      public function SurvivalCoopPanel(visual:DisplayObjectContainer, battleSelectionScreen:BattleSelectionScreen)
      {
         super(visual,battleSelectionScreen);
         this._metaFriend = null;
         this._coopFriendView = new CoopFriendView(this.coopFriendView);
         this._coopFriendView.SetMetaFriend(this._metaFriend);
         this._coopFriendList = new CoopFriendList(this.friendListView,this);
         this.SetFriend();
         this.btn_BackRow.addEventListener(MouseEvent.MOUSE_DOWN,this.onBackRow);
         this.btn_FrontRow.addEventListener(MouseEvent.MOUSE_DOWN,this.onFrontRow);
         this.btn_Fight.addEventListener(MouseEvent.MOUSE_DOWN,this.onFight);
         this.friendLoading.visible = false;
         if(this.anim)
         {
            this.RecurPlay(this.anim);
         }
         this.Refresh();
      }
      
      public function SetFriend() : void
      {
         this._coopFriendList.SetFriend();
         this.Refresh();
      }
      
      public function get armyRankIcon() : MovieClip
      {
         return panel.getChildByName("armyRankIcon") as MovieClip;
      }
      
      public function DeselectAll() : void
      {
         this._coopFriendList.DeselectAll();
      }
      
      public function get btn_Fight() : ButtonSelect
      {
         return panel.getChildByName("btn_Fight") as ButtonSelect;
      }
      
      public function get FrontRow() : MovieClip
      {
         return panel.getChildByName("FrontRow") as MovieClip;
      }
      
      private function FailLoadInfo(p:PlayerIOError) : void
      {
         this.friendLoading.visible = false;
         this._metaFriend = null;
         this._coopFriendView.SetMetaFriend(this._metaFriend);
      }
      
      public function get BackRow() : MovieClip
      {
         return panel.getChildByName("BackRow") as MovieClip;
      }
      
      private function onBackRow(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_Game.instance.myArmyBackRow = true;
         this.Refresh();
      }
      
      private function LoadPlayerInfo(o:DatabaseObject) : void
      {
         var enemyProgress:BC_GameProgress = null;
         var params:Array = null;
         var s:String = null;
         this.friendLoading.visible = false;
         if(o)
         {
            enemyProgress = new BC_GameProgress();
            params = (o.savefile as String).split("*");
            params.shift();
            s = params[0];
            s = s.substr(1,s.length - 1);
            enemyProgress.Decode(s);
            this._metaFriend = new MetaFriend(o.key);
            this._metaFriend.metaFlag = enemyProgress.metaFlag;
            this._metaFriend.metaArmy5 = enemyProgress.metaArmy5;
            this._coopFriendView.SetMetaFriend(this._metaFriend);
         }
      }
      
      public function get coopFriendView() : MovieClip
      {
         return panel.getChildByName("coopFriendView") as MovieClip;
      }
      
      public function get anim() : MovieClip
      {
         return this.friendLoading.getChildByName("anim") as MovieClip;
      }
      
      public function SelectFriend(friendName:String) : void
      {
         this.friendLoading.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("PlayerObjects",friendName,this.LoadPlayerInfo,this.FailLoadInfo);
      }
      
      public function get btn_FrontRow() : ButtonSelect
      {
         return panel.getChildByName("btn_FrontRow") as ButtonSelect;
      }
      
      private function RecurPlay(mc:MovieClip) : void
      {
         mc.play();
         for(var i:int = 0; i < mc.numChildren; i++)
         {
            if(mc.getChildAt(i) as MovieClip)
            {
               this.RecurPlay(mc.getChildAt(i) as MovieClip);
            }
         }
      }
      
      override public function Update() : void
      {
         super.Update();
         this.btn_Fight.Deselect();
         if(this._metaFriend == null)
         {
            this.btn_Fight.Select();
         }
         this._coopFriendList.Update();
         this._coopFriendView.Update();
         this.Refresh();
      }
      
      private function onFrontRow(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_Game.instance.myArmyBackRow = false;
         this.Refresh();
      }
      
      private function onFight(event:MouseEvent) : void
      {
         if(this.btn_Fight.isSelected)
         {
            return;
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_Game.instance.isSurvivalCoop = true;
         BC_Game.instance.isSurvival = true;
         BC_Game.instance.survivalMove = true;
         BC_Game.instance.survivalLevel = 1;
         BC_Game.instance.metaEnemyLoaded = new MetaEnemyLoaded();
         BC_Game.instance.metaEnemyLoaded.enemyName = this._metaFriend.friendName;
         BC_Game.instance.metaEnemyLoaded.fullArmyName = this._metaFriend.friendName;
         BC_Game.instance.metaEnemyLoaded.metaFlag = this._metaFriend.metaFlag;
         BC_Game.instance.survivalCoopArmy = this._metaFriend.metaArmy5;
         BC_Game.instance.TransitionTo(battleSelectionScreen,BC_ScreenFactory.ID_LOADGAME_SURVIVALINFOS_SCREEN);
      }
      
      public function get btn_BackRow() : ButtonSelect
      {
         return panel.getChildByName("btn_BackRow") as ButtonSelect;
      }
      
      public function get friendListView() : MovieClip
      {
         return panel.getChildByName("friendListView") as MovieClip;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.armyRankIcon.gotoAndStop(BC_GameProgress.gameProgess.getArmy(5).multiPlayerRank);
         this.btn_BackRow.Deselect();
         this.btn_FrontRow.Deselect();
         if(BC_Game.instance.myArmyBackRow)
         {
            this.BackRow.gotoAndStop(1);
            this.FrontRow.gotoAndStop(2);
            this.btn_BackRow.Select();
         }
         else
         {
            this.BackRow.gotoAndStop(2);
            this.FrontRow.gotoAndStop(1);
            this.btn_FrontRow.Select();
         }
         this._coopFriendList.Refresh();
         this._coopFriendView.Refresh();
      }
      
      public function get friendLoading() : MovieClip
      {
         return panel.getChildByName("friendLoading") as MovieClip;
      }
   }
}

