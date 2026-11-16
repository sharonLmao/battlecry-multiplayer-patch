package com.lachhhEngine.games.factory
{
   import com.lachhhEngine.games.meta.metaObject.MetaMusic;
   import com.lachhhEngine.games.meta.metaObject.MetaSound2D;
   import com.lachhhEngine.games.sfx.MusicTrack;
   import com.lachhhEngine.games.sfx.Sound2D;
   import flash.utils.getQualifiedClassName;
   
   public class SfxFactory
   {
      
      private var _dict:Array;
      
      public function SfxFactory()
      {
         super();
         this._dict = new Array();
         this.AddGameClass();
         this.AddEngineClass();
      }
      
      public function get uiOkSoundId() : int
      {
         return -1;
      }
      
      public function get uiCancelSoundId() : int
      {
         return -1;
      }
      
      protected function AddGameClass() : void
      {
      }
      
      final public function get nbClass() : int
      {
         return this._dict.length;
      }
      
      final public function FindIdByString(className:String) : int
      {
         var theClass:Class = null;
         var exportedClassName:String = null;
         var importedClassName:String = null;
         for(var i:int = 0; i < this._dict.length; i++)
         {
            theClass = this._dict[i];
            exportedClassName = getQualifiedClassName(theClass).split("::").join(".");
            importedClassName = exportedClassName.split(".imported.").join(".exported.");
            if(exportedClassName == className)
            {
               return i;
            }
            if(importedClassName == className)
            {
               return i;
            }
         }
         return -1;
      }
      
      public function get uiRollOverSoundId() : int
      {
         return -1;
      }
      
      final public function GetClassAt(i:int) : Class
      {
         return this._dict[i];
      }
      
      private function AddEngineClass() : void
      {
      }
      
      final public function PushClassLink(pClass:Class) : int
      {
         this._dict.push(pClass);
         return this._dict.length - 1;
      }
      
      final public function CreateSound2DInstance(metaSound:MetaSound2D) : Sound2D
      {
         var i:int = metaSound.instanceType;
         if(this._dict[i] == null)
         {
            throw new Error("Invalid ID");
         }
         var soundClass:Class = this._dict[i];
         return new Sound2D(new soundClass());
      }
      
      final public function ReplaceClassLinkDEBUG(pClass:Class, i:int) : void
      {
         if(this._dict[i] == null)
         {
            throw new Error("Class at " + i + "is null. Can\'t replace");
         }
         this._dict[i] = pClass;
      }
      
      final public function CreateMusicInstance(metaMusic:MetaMusic) : MusicTrack
      {
         var i:int = metaMusic.instanceType;
         if(this._dict[i] == null)
         {
            throw new Error("Invalid ID");
         }
         var soundClass:Class = this._dict[i];
         return new MusicTrack(new soundClass());
      }
   }
}

