package com.lachhhEngine.games
{
   import com.lachhhEngine.io.Callback;
   
   public class WaitCallback extends Callback implements IUpdatable
   {
      
      private var _enabled:Boolean = true;
      
      private var _pausable:Boolean;
      
      private var _callback:Callback;
      
      private var _wait:Number;
      
      public function WaitCallback(context:Game, wait:Number, c:Callback, pausable:Boolean)
      {
         super(context.RemoveWaitCallback,context,[this]);
         this._wait = wait;
         this._callback = c;
         this._pausable = pausable;
      }
      
      public function OnRemove(context:Game) : void
      {
      }
      
      public function get callback() : Callback
      {
         return this._callback;
      }
      
      public function SetEnable(b:Boolean) : void
      {
         this._enabled = b;
      }
      
      public function OnAdd(context:Game) : void
      {
      }
      
      public function get wait() : int
      {
         return this._wait;
      }
      
      public function Update(context:Game) : void
      {
         if(context.paused && this._pausable)
         {
            return;
         }
         this._wait -= context.speedManager.GetSpeed();
         if(this._wait <= 0)
         {
            this.callback.DoCallback();
            DoCallback();
         }
      }
      
      public function IsEnabled() : Boolean
      {
         return this._enabled;
      }
   }
}

