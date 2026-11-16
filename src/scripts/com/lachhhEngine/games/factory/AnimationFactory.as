package com.lachhhEngine.games.factory
{
   import com.berzerkstudio.exported.ANTI_CHEAT;
   import com.berzerkstudio.exported.BERZERK_HINT_FF3;
   import com.berzerkstudio.exported.BERZERK_HINT_FP10;
   import com.berzerkstudio.exported.FLASHNEEDED;
   import com.berzerkstudio.exported.SCREEN_AD_SHOWER;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationAsset;
   import com.lachhhEngine.games.meta.metaObject.MetaAnimation;
   import flash.utils.getQualifiedClassName;
   
   public class AnimationFactory
   {
      
      private var _berzerkHintFP10:int;
      
      private var _adShower:int;
      
      private var _empty:int;
      
      private var _flashNeededScreen:int;
      
      private var _dict:Array;
      
      private var _cheatScreen:int;
      
      private var _berzerkHintFF3:int;
      
      public function AnimationFactory()
      {
         super();
         this._dict = new Array();
         this.AddGameClass();
         this.AddEngineClass();
      }
      
      public function get ID_EMPTY() : int
      {
         return this._empty;
      }
      
      public function get ID_BERZERK_HINT_FF3() : int
      {
         return this._berzerkHintFF3;
      }
      
      public function get ID_BERZERK_HINT_FP10() : int
      {
         return this._berzerkHintFP10;
      }
      
      private function AddEngineClass() : void
      {
         this._empty = this.PushClassLink(Animation);
         this._berzerkHintFF3 = this.PushClassLink(BERZERK_HINT_FF3);
         this._berzerkHintFP10 = this.PushClassLink(BERZERK_HINT_FP10);
         this._flashNeededScreen = this.PushClassLink(FLASHNEEDED);
         this._cheatScreen = this.PushClassLink(ANTI_CHEAT);
         this._adShower = this.PushClassLink(SCREEN_AD_SHOWER);
      }
      
      public function get ID_SCREEN_AD_SHOWER() : int
      {
         return this._adShower;
      }
      
      final public function CreateAnimationInstance(metaObject:MetaAnimation) : Animation
      {
         var i:int = metaObject.instanceType;
         if(this._dict[i] == null)
         {
            throw new Error("Invalid ID");
         }
         var animationClass:Class = this._dict[i];
         return new animationClass();
      }
      
      protected function AddGameClass() : void
      {
      }
      
      public function get ID_FLASH_NEEDED() : int
      {
         return this._flashNeededScreen;
      }
      
      final public function get nbClass() : int
      {
         return this._dict.length;
      }
      
      final public function ReplaceClassLinkDEBUG(pClass:Class, i:int) : void
      {
         if(this._dict[i] == null)
         {
            throw new Error("Class at " + i + "is null. Can\'t replace");
         }
         this._dict[i] = pClass;
      }
      
      public function get ID_CHEAT_DETECTED() : int
      {
         return this._cheatScreen;
      }
      
      final public function GetClassAt(i:int) : Class
      {
         return this._dict[i];
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
      
      public function GetAnimationAssetGroup(a:AnimationAsset) : int
      {
         return -1;
      }
      
      final public function PushClassLink(pClass:Class) : int
      {
         this._dict.push(pClass);
         return this._dict.length - 1;
      }
   }
}

