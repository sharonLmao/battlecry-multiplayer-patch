package com.lachhhEngine.games.screens
{
   import flash.display.MovieClip;
   
   public class MetaScreenBtnEvent
   {
      
      private var _priority:int;
      
      private var _target:MovieClip;
      
      private var _fct:Function;
      
      private var _event:String;
      
      private var _useCapture:Boolean;
      
      public function MetaScreenBtnEvent(target:MovieClip, fct:Function, event:String, useCapture:Boolean = false, priority:int = 0)
      {
         super();
         this._target = target;
         this._fct = fct;
         this._event = event;
         this._useCapture = useCapture;
         this._priority = priority;
      }
      
      public function get event() : String
      {
         return this._event;
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      public function get fct() : Function
      {
         return this._fct;
      }
      
      public function get target() : MovieClip
      {
         return this._target;
      }
      
      public function AddEvent() : void
      {
         this._target.addEventListener(this._event,this._fct,this._useCapture,this._priority,true);
      }
      
      public function Destroy() : void
      {
         this.RemoveEvent();
      }
      
      public function RemoveEvent() : void
      {
         this._target.removeEventListener(this._event,this._fct,this._useCapture);
      }
      
      public function get useCapture() : Boolean
      {
         return this._useCapture;
      }
   }
}

