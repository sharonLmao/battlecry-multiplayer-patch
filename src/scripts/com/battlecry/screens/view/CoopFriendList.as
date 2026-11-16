package com.battlecry.screens.view
{
   import com.battlecry.BedUtil.ScrollBarPanelView;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.MetaFriend;
   import com.battlecry.screens.view.scrollItem.FriendCoopViewSquare;
   import com.lachhhEngine.games.animation.AnimationManager;
   import flash.display.MovieClip;
   
   public class CoopFriendList extends BC_ObjectGroupView
   {
      
      private var _survivalCoopPanel:SurvivalCoopPanel;
      
      private var _scrollBarPanelView:ScrollBarPanelView;
      
      public function CoopFriendList(visual:MovieClip, survivalCoopPanel:SurvivalCoopPanel)
      {
         super(visual);
         this._scrollBarPanelView = new ScrollBarPanelView(visual);
         this._scrollBarPanelView.Init(0,0,true);
         this._survivalCoopPanel = survivalCoopPanel;
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
      }
      
      public function isFriendSelected() : Boolean
      {
         var f:FriendCoopView = null;
         for(var i:int = 0; i < views.length; i++)
         {
            f = views[i];
            if(f.IsSelected())
            {
               return true;
            }
         }
         return false;
      }
      
      override public function Update() : void
      {
         super.Update();
         for(var i:int = 0; i < views.length; i++)
         {
            (views[i] as FriendCoopView).Update();
         }
         this._scrollBarPanelView.Update();
      }
      
      private function Clear() : void
      {
         var l:int = int(views.length);
         for(var m:int = 0; m < l; m++)
         {
            (views[0] as FriendCoopView).Destroy();
            RemoveView(views[0]);
         }
         this._scrollBarPanelView.removeAll();
      }
      
      private function BuildView(v:Vector.<MetaFriend>) : void
      {
         var e:FriendCoopViewSquare = null;
         for(var i:int = 0; i < v.length; i++)
         {
            e = new FriendCoopViewSquare(AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_FRIENDCOOPVIEWSQUARE));
            AddView(new FriendCoopView(e));
            this._scrollBarPanelView.Add(e);
         }
         for(i = 0; i < views.length; i++)
         {
            (views[i] as FriendCoopView).SetMetaFriend(v[i],this._survivalCoopPanel);
         }
         this._scrollBarPanelView.Refresh();
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
      
      public function DeselectAll() : void
      {
         var f:FriendCoopView = null;
         for(var i:int = 0; i < views.length; i++)
         {
            f = views[i];
            f.DeSelect();
         }
      }
   }
}

