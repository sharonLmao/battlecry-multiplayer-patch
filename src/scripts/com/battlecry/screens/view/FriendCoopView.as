package com.battlecry.screens.view
{
   import com.battlecry.meta.MetaFriend;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class FriendCoopView extends ObjectView
   {
      
      private var _metaFriend:MetaFriend;
      
      private var _objectView:ObjectView;
      
      private var _survivalCoopPanel:SurvivalCoopPanel;
      
      public function FriendCoopView(o:ObjectView)
      {
         super(o.visualMc);
         this._objectView = o;
         visualMc.useHandCursor = true;
         visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onSelect);
      }
      
      public function SetMetaFriend(metaFriend:MetaFriend, survivalCoopPanel:SurvivalCoopPanel) : void
      {
         this._survivalCoopPanel = survivalCoopPanel;
         this._metaFriend = metaFriend;
         this.Refresh();
      }
      
      override public function Update() : void
      {
         super.Update();
         this.Refresh();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         var realName:String = this._metaFriend.friendName.substr(3,this._metaFriend.friendName.length - 3);
         this.friendName.text = realName;
      }
      
      public function IsSelected() : Boolean
      {
         return this.btn.isSelected;
      }
      
      public function get friendName() : TextField
      {
         return this.btn.getChildByName("friendName") as TextField;
      }
      
      private function onSelect(event:MouseEvent) : void
      {
         if(this.btn.isSelected)
         {
            return;
         }
         this._survivalCoopPanel.DeselectAll();
         this._survivalCoopPanel.SelectFriend(this._metaFriend.friendName);
         this.btn.Select();
      }
      
      public function get btn() : ButtonSelect
      {
         return visual.getChildByName("btn_friendCoop") as ButtonSelect;
      }
      
      public function DeSelect() : void
      {
         this.btn.Deselect();
      }
   }
}

