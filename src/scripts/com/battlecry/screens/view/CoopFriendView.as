package com.battlecry.screens.view
{
   import com.battlecry.meta.MetaFriend;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class CoopFriendView extends ObjectView
   {
      
      private var _flagView:FlagView;
      
      private var _metaFriend:MetaFriend;
      
      public function CoopFriendView(visual:DisplayObjectContainer)
      {
         super(visual);
         this._flagView = new FlagView(this.allyflagView);
      }
      
      private function get armyRankIcon() : MovieClip
      {
         return visual.getChildByName("armyRankIcon") as MovieClip;
      }
      
      public function SetMetaFriend(metaFriend:MetaFriend) : void
      {
         this._metaFriend = metaFriend;
         this.Refresh();
      }
      
      private function get friendName() : TextField
      {
         return visual.getChildByName("friendName") as TextField;
      }
      
      private function get allyflagView() : MovieClip
      {
         return visual.getChildByName("allyflagView") as MovieClip;
      }
      
      override public function Refresh() : void
      {
         var realName:String = null;
         super.Refresh();
         this.allyflagView.visible = true;
         this.armyRankIcon.visible = true;
         this.friendName.visible = true;
         if(this._metaFriend == null)
         {
            this.allyflagView.visible = false;
            this.armyRankIcon.visible = false;
            this.friendName.visible = false;
         }
         else
         {
            this._flagView.SetMetaFlag(this._metaFriend.metaFlag);
            this.armyRankIcon.gotoAndStop(this._metaFriend.metaArmy5.multiPlayerRank);
            realName = this._metaFriend.friendName.substr(3,this._metaFriend.friendName.length - 3);
            this.friendName.text = realName;
         }
      }
   }
}

