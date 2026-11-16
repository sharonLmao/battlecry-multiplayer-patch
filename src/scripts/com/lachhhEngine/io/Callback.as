package com.lachhhEngine.io
{
   import flash.events.Event;
   
   public class Callback
   {
      
      protected var _params:Array;
      
      protected var _scope:Object;
      
      protected var _fct:Function;
      
      public function Callback(fct:Function, scope:Object, params:Array)
      {
         super();
         this._fct = fct;
         this._scope = scope;
         this._params = params;
      }
      
      public function get params() : Array
      {
         return this._params;
      }
      
      public function set scope(scope:Object) : void
      {
         this._scope = scope;
      }
      
      public function set params(params:Array) : void
      {
         this._params = params;
      }
      
      public function set fct(fct:Function) : void
      {
         this._fct = fct;
      }
      
      public function get scope() : Object
      {
         return this._scope;
      }
      
      public function DoCallback() : void
      {
         this._fct.apply(this._scope,this._params);
      }
      
      public function Destroy() : void
      {
         this._fct = null;
         this._scope = null;
         this._params = null;
      }
      
      public function onEvent(e:Event) : void
      {
         this.DoCallback();
      }
      
      public function DoCallbackWithParams(params:Array) : void
      {
         this._fct.apply(this._scope,params);
      }
      
      public function get fct() : Function
      {
         return this._fct;
      }
   }
}

