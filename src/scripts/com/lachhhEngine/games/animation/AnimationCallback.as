package com.lachhhEngine.games.animation
{
   import com.lachhhEngine.io.Callback;
   
   public class AnimationCallback extends Callback
   {
      
      private var _repeat:Boolean;
      
      private var _frame:int;
      
      public function AnimationCallback(frame:int, fct:Function, scope:Object, params:Array, repeat:Boolean = false)
      {
         super(fct,scope,params);
         this._frame = frame;
         this._repeat = repeat;
      }
      
      public function get repeat() : Boolean
      {
         return this._repeat;
      }
      
      public function get frame() : int
      {
         return this._frame;
      }
   }
}

