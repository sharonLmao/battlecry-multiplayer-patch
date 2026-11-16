package com.lachhhEngine.multilingual
{
   import flash.text.TextFormat;
   
   public class LanguageFontReplace
   {
      
      private var _replaceByIsItalic:Object;
      
      private var _originalIsItalic:Object;
      
      private var _maxSize:int = 8;
      
      private var _original:String = "";
      
      private var _replaceBy:String = "";
      
      private var _replaceByIsBold:Object;
      
      private var _originalIsBold:Object;
      
      public function LanguageFontReplace(original:String, replaceBy:String, maxSize:int = 8, originalBold:Object = null, originalItalic:Object = null, replacedByBold:Object = null, replacedByItalic:Object = null)
      {
         super();
         this._original = original;
         this._originalIsBold = originalBold;
         this._originalIsItalic = originalItalic;
         this._replaceBy = replaceBy;
         this._replaceByIsBold = replacedByBold;
         this._replaceByIsItalic = replacedByItalic;
         this._maxSize = maxSize;
      }
      
      public function get replaceByIsBold() : Object
      {
         return this._replaceByIsBold;
      }
      
      public function set original(original:String) : void
      {
         this._original = original;
      }
      
      public function get maxSize() : int
      {
         return this._maxSize;
      }
      
      public function get replaceByIsItalic() : Object
      {
         return this._replaceByIsItalic;
      }
      
      public function IsEquals(tf:TextFormat) : Boolean
      {
         if(tf == null)
         {
            return false;
         }
         var bCond1:* = tf.font == this._original;
         var bCond2:Boolean = this._originalIsBold == null || this._originalIsBold == tf.bold;
         var bCond3:Boolean = this._originalIsItalic == null || this._originalIsItalic == tf.italic;
         return bCond1 && bCond2 && bCond3;
      }
      
      public function get replaceBy() : String
      {
         return this._replaceBy;
      }
      
      public function get original() : String
      {
         return this._original;
      }
      
      public function set maxSize(maxSize:int) : void
      {
         this._maxSize = maxSize;
      }
      
      public function set replaceBy(replaceBy:String) : void
      {
         this._replaceBy = replaceBy;
      }
   }
}

