package com.lachhhEngine.games.debug
{
   import com.lachhhEngine.io.Callback;
   
   public class DebugCallback extends Callback
   {
      
      private var _msg:String;
      
      public function DebugCallback(msg:String, fct:Function, scope:Object, params:Array)
      {
         super(fct,scope,params);
         this._msg = msg;
      }
      
      public function get msg() : String
      {
         return this._msg;
      }
      
      public function DoCallbackWithMsg(msg:String) : void
      {
         _fct.apply(_scope,[msg].concat(_params));
      }
   }
}

