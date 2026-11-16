package com.lachhhEngine.multilingual
{
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.LachhhXMLLoader;
   import com.lachhhEngine.io.XMLCallback;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.FileReference;
   import flash.net.URLLoader;
   
   public class ExternalLanguageController
   {
      
      private static var _callback:Callback;
      
      private static var _targetLang:Language;
      
      private static var _fr:FileReference;
      
      private static var _loader:URLLoader = new URLLoader();
      
      public function ExternalLanguageController()
      {
         super();
      }
      
      public static function LoadFromXML(xml:XML) : void
      {
         _targetLang.DecodeFromXML(xml);
         TextFieldFinder.Update();
         if(_callback)
         {
            _callback.DoCallback();
         }
      }
      
      private static function SaveCode(l:Language) : void
      {
         SaveString(l.ExportInAS3());
      }
      
      private static function onSaveError(e:IOErrorEvent) : void
      {
         trace("Error Saving File : " + e.text);
         _fr = null;
      }
      
      public static function SaveString(result:String, nameFile:String = "AllLanguages.xml") : void
      {
         _fr = new FileReference();
         _fr.addEventListener(Event.COMPLETE,onFileSave);
         _fr.addEventListener(Event.CANCEL,onCancel);
         _fr.addEventListener(IOErrorEvent.IO_ERROR,onSaveError);
         _fr.save(result,nameFile);
      }
      
      public static function LoadExternal(path:String, targetLang:Language, c:Callback = null) : void
      {
         _callback = c;
         _targetLang = targetLang;
         LachhhXMLLoader.LoadXML(path,new XMLCallback(LoadFromXML,ExternalLanguageController,null));
      }
      
      private static function onFileSave(e:Event) : void
      {
         trace("File Saved");
         _fr = null;
      }
      
      private static function onCancel(e:Event) : void
      {
         trace("File save select canceled.");
         _fr = null;
      }
      
      public static function LoadExternalAndSaveAS3(path:String, l:Language) : void
      {
         LoadExternal(path,l,new Callback(SaveCode,ExternalLanguageController,[l]));
      }
   }
}

