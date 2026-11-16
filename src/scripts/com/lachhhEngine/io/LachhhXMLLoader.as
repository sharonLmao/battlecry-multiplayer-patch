package com.lachhhEngine.io
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class LachhhXMLLoader
   {
      
      public function LachhhXMLLoader()
      {
         super();
      }
      
      public static function LoadXML(strPathToXml:String, callback:XMLCallback) : void
      {
         var loader:URLLoader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,callback.onEvent,false);
         loader.load(new URLRequest(strPathToXml));
         loader.addEventListener(IOErrorEvent.IO_ERROR,OnIOError);
      }
      
      private static function OnIOError(e:Event) : void
      {
         throw new Error("Problem while loading XML : " + e.toString());
      }
   }
}

