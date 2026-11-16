package com.battlecry.screens.view
{
   import com.battlecry.screens.BattleSelectionScreen;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class BattleSelectionPanel extends ObjectView
   {
      
      private var _battleSelectionScreen:BattleSelectionScreen;
      
      private var _close:Boolean;
      
      private var _open:Boolean;
      
      private var _openCallback:Callback;
      
      private var _closeCallback:Callback;
      
      public function BattleSelectionPanel(visual:DisplayObjectContainer, battleSelectionScreen:BattleSelectionScreen)
      {
         super(visual);
         this._battleSelectionScreen = battleSelectionScreen;
         this._open = false;
         this._close = false;
         visual.visible = false;
         visualMc.gotoAndStop(1);
         if(this.btn_Back)
         {
            this.btn_Back.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         }
      }
      
      private function onX(event:MouseEvent) : void
      {
         this.battleSelectionScreen.BackToBattleMode();
      }
      
      public function get panel() : MovieClip
      {
         return visual.getChildByName("panel") as MovieClip;
      }
      
      public function get battleSelectionScreen() : BattleSelectionScreen
      {
         return this._battleSelectionScreen;
      }
      
      public function Open(c:Callback = null) : void
      {
         this._openCallback = c;
         this._open = true;
         visual.visible = true;
         visualMc.gotoAndPlay(1);
         this._battleSelectionScreen.currentSelectedPanel = this;
      }
      
      public function QuickClose() : void
      {
         visual.visible = false;
         visualMc.gotoAndStop(1);
      }
      
      public function set battleSelectionScreen(battleSelectionScreen:BattleSelectionScreen) : void
      {
         this._battleSelectionScreen = battleSelectionScreen;
      }
      
      override public function Update() : void
      {
         super.Update();
         visualMc.stop();
         if(this._open)
         {
            visualMc.play();
            if(visualMc.currentFrame >= 15)
            {
               visualMc.gotoAndStop(15);
               this._open = false;
               if(this._openCallback)
               {
                  this._openCallback.DoCallback();
               }
            }
         }
         if(this._close)
         {
            visualMc.play();
            if(visualMc.currentFrame >= 45)
            {
               visualMc.gotoAndStop(1);
               this._close = false;
               visual.visible = false;
               if(this._closeCallback)
               {
                  this._closeCallback.DoCallback();
               }
            }
         }
      }
      
      public function get btn_Back() : ButtonSelect
      {
         return this.panel.getChildByName("btn_Back") as ButtonSelect;
      }
      
      public function QuickOpen() : void
      {
         visual.visible = true;
         visualMc.gotoAndStop(15);
         this._battleSelectionScreen.currentSelectedPanel = this;
      }
      
      public function Close(c:Callback = null) : void
      {
         this._closeCallback = c;
         this._close = true;
         visualMc.gotoAndPlay(30);
      }
   }
}

