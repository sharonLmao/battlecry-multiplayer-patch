package com.battlecry.screens.view
{
   import com.battlecry.BedUtil.ScrollBarPanelView;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.MetaFriend;
   import com.battlecry.screens.BattleSelectionScreen;
   import com.battlecry.screens.view.scrollItem.FriendViewSquare;
   import com.lachhhEngine.games.animation.AnimationManager;
   import flash.display.MovieClip;
   
   public class FriendListView extends BC_ObjectGroupView
   {
      
      private var _battleSelectionScreen:BattleSelectionScreen;
      
      private var _scrollBarPanelView:ScrollBarPanelView;
      
      public function FriendListView(visual:MovieClip, battleSelectionScreen:BattleSelectionScreen)
      {
         super(visual);
         this._scrollBarPanelView = new ScrollBarPanelView(visual);
         this._scrollBarPanelView.Init(0,0,true);
         this._battleSelectionScreen = battleSelectionScreen;
         this._scrollBarPanelView.Refresh();
      }
      
      public function SetFriend() : void
      {
         var friendName:String = null;
         var metaFriend:MetaFriend = null;
         var a:Array = new Array();
         var v:Vector.<MetaFriend> = new Vector.<MetaFriend>();
         for(var i:int = 0; i < BC_GameProgress.gameProgess.friendList.length; i++)
         {
            friendName = BC_GameProgress.gameProgess.friendList[i];
            metaFriend = new MetaFriend(friendName);
            a.push(metaFriend);
         }
         this.Clear();
         a.sortOn("friendName");
         for(var j:int = 0; j < a.length; j++)
         {
            v.push(a[j]);
         }
         this.BuildView(v);
         this.ModeAddFriend();
      }
      
      public function ModeRemoveFriend() : void
      {
         for(var i:int = 0; i < views.length; i++)
         {
            (views[i] as FriendView).ModeRemoveFriend();
         }
      }
      
      private function BuildView(v:Vector.<MetaFriend>) : void
      {
         var e:FriendViewSquare = null;
         for(var i:int = 0; i < v.length; i++)
         {
            e = new FriendViewSquare(AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_FRIENDVIEWSQUARE));
            AddView(new FriendView(e));
            this._scrollBarPanelView.Add(e);
         }
         for(i = 0; i < views.length; i++)
         {
            (views[i] as FriendView).SetMetaFriend(v[i],this._battleSelectionScreen);
         }
         this._scrollBarPanelView.Refresh();
      }
      
      private function Clear() : void
      {
         var l:int = int(views.length);
         for(var m:int = 0; m < l; m++)
         {
            (views[0] as FriendView).Destroy();
            RemoveView(views[0]);
         }
         this._scrollBarPanelView.removeAll();
      }
      
      override public function Update() : void
      {
         super.Update();
         for(var i:int = 0; i < views.length; i++)
         {
            (views[i] as FriendView).Update();
         }
         this._scrollBarPanelView.Update();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.Clear();
         this._scrollBarPanelView.Destroy();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this._scrollBarPanelView.Refresh();
      }
      
      public function ModeAddFriend() : void
      {
         for(var i:int = 0; i < views.length; i++)
         {
            (views[i] as FriendView).ModeAddFriend();
         }
      }
   }
}

