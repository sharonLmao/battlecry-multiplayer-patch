package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.meta.MetaFriend;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.BattleSelectionScreen;
   import com.battlecry.screens.FriendArmySelectScreen;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.utils.Utils;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import playerio.DatabaseObject;
   import playerio.PlayerIOError;
   
   public class FriendView extends ObjectView
   {
      
      private var _battleSelectionScreen:BattleSelectionScreen;
      
      private var _metaFriend:MetaFriend;
      
      private var _objectView:ObjectView;
      
      public function FriendView(o:ObjectView)
      {
         super(o.visualMc);
         this._objectView = o;
         this.btn_Delete.addEventListener(MouseEvent.MOUSE_DOWN,this.OnRemoveFriend);
         this.btn_Fight.addEventListener(MouseEvent.MOUSE_DOWN,this.OnFightFriend);
      }
      
      public function ModeRemoveFriend() : void
      {
         this.btn_Fight.visible = false;
         this.btn_Delete.visible = true;
      }
      
      private function OnRemoveFriend(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         Utils.RemoveFromArray(BC_GameProgress.gameProgess.friendList,this._metaFriend.friendName);
         this._battleSelectionScreen.ModeAddFriend();
         ScreenManager.instance.RefreshAll();
         BC_Game.instance.Save();
      }
      
      public function SetMetaFriend(metaFriend:MetaFriend, battleSelectionScreen:BattleSelectionScreen) : void
      {
         this._battleSelectionScreen = battleSelectionScreen;
         this._metaFriend = metaFriend;
         this.Refresh();
      }
      
      public function get btn_Fight() : ButtonSelect
      {
         return visual.getChildByName("btn_Fight") as ButtonSelect;
      }
      
      public function get btn_Delete() : ButtonSelect
      {
         return visual.getChildByName("btn_Delete") as ButtonSelect;
      }
      
      private function OnFightFriend(event:MouseEvent) : void
      {
         if(this._battleSelectionScreen.fightafriendload.visible)
         {
            return;
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         this._battleSelectionScreen.fightafriendload.visible = true;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("PlayerObjects",this._metaFriend.friendName,this.LoadPlayerInfo,this.FailLoadInfo);
      }
      
      public function get friendName() : TextField
      {
         return visual.getChildByName("friendName") as TextField;
      }
      
      private function FailLoadInfo(p:PlayerIOError) : void
      {
         this._battleSelectionScreen.fightafriendload.visible = false;
      }
      
      private function LoadPlayerInfo(o:DatabaseObject) : void
      {
         var enemyProgress:BC_GameProgress = null;
         var params:Array = null;
         var s:String = null;
         var f:FriendArmySelectScreen = null;
         this._battleSelectionScreen.fightafriendload.visible = false;
         if(o)
         {
            enemyProgress = new BC_GameProgress();
            params = (o.savefile as String).split("*");
            params.shift();
            s = params[0];
            s = s.substr(1,s.length - 1);
            enemyProgress.Decode(s);
            f = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_FRIENDARMYSELECT_SCREEN,false,true) as FriendArmySelectScreen;
            f.SetInfo(enemyProgress,this._battleSelectionScreen,this.friendName.text,this._metaFriend.friendName);
         }
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_Delete.removeEventListener(MouseEvent.MOUSE_DOWN,this.OnRemoveFriend);
         this.btn_Fight.removeEventListener(MouseEvent.MOUSE_DOWN,this.OnFightFriend);
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         var realName:String = this._metaFriend.friendName.substr(3,this._metaFriend.friendName.length - 3);
         this.friendName.text = realName;
      }
      
      public function ModeAddFriend() : void
      {
         this.btn_Delete.visible = false;
         this.btn_Fight.visible = true;
      }
   }
}

