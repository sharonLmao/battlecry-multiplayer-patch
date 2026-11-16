package com.lachhhEngine.io.externalAPI.dataSharingAPI.fields
{
   public class MetaCustomField
   {
      
      private var _key:String;
      
      private var _expiringType:int = -1;
      
      public function MetaCustomField(key:String, expiringType:int = 2)
      {
         super();
         this._key = key;
         this._expiringType = expiringType;
      }
      
      public static function GetObjectFromArray(array:Array) : Object
      {
         var att:MetaCustomField = null;
         if(array == null)
         {
            return null;
         }
         var objAttributes:Object = new Object();
         for(var i:uint = 0; i < array.length; i++)
         {
            att = array[i];
            objAttributes[att.key] = att.value;
         }
         return objAttributes;
      }
      
      public function get value() : Object
      {
         return null;
      }
      
      public function get expiringType() : int
      {
         return this._expiringType;
      }
      
      public function set key(key:String) : void
      {
         this._key = key;
      }
      
      public function get key() : String
      {
         return this._key;
      }
   }
}

