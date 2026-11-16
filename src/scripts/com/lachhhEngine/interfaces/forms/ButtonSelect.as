package com.lachhhEngine.interfaces.forms
{
   import flash.events.MouseEvent;
   
   public class ButtonSelect extends Button
   {
      
      private var _isSelected:Boolean = false;
      
      private var _toggleButtonMode:Boolean = false;
      
      public function ButtonSelect()
      {
         super();
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function get toggleButtonMode() : Boolean
      {
         return this._toggleButtonMode;
      }
      
      public function set toggleButtonMode(toggleButtonMode:Boolean) : void
      {
         this._toggleButtonMode = toggleButtonMode;
         if(this._toggleButtonMode)
         {
            addEventListener(MouseEvent.MOUSE_DOWN,this.onToggleDown,false,0,true);
         }
         else
         {
            removeEventListener(MouseEvent.MOUSE_DOWN,this.onToggleDown);
         }
      }
      
      public function Toggle() : void
      {
         if(this._isSelected)
         {
            this.Deselect();
         }
         else
         {
            this.Select();
         }
      }
      
      private function onToggleDown(e:MouseEvent) : void
      {
         this.Toggle();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
      }
      
      public function Select() : void
      {
         this._isSelected = true;
         canGoto = false;
         gotoAndPlay("selected");
      }
      
      public function Deselect() : void
      {
         this._isSelected = false;
         canGoto = true;
         gotoUp();
      }
   }
}

