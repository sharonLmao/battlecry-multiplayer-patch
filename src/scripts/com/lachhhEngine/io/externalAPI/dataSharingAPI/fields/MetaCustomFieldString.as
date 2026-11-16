package com.lachhhEngine.io.externalAPI.dataSharingAPI.fields
{
   public class MetaCustomFieldString extends MetaCustomField
   {
      
      private var _value:String;
      
      public function MetaCustomFieldString(key:String, value:String, expiringType:int = 2)
      {
         super(key,expiringType);
         this._value = value;
      }
      
      override public function get value() : Object
      {
         return this._value;
      }
      
      public function set value(value:Object) : void
      {
         this._value = String(value);
      }
   }
}

