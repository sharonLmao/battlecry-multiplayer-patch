package com.lachhhEngine.io
{
   import flash.events.Event;
   
   public class XMLCallback extends Callback
   {
      
      public function XMLCallback(fct:Function, scope:Object, params:Array)
      {
         super(fct,scope,params);
      }
      
      override public function onEvent(e:Event) : void
      {
         DoCallbackWithParams([new XML(e.target.data)]);
      }
   }
}

