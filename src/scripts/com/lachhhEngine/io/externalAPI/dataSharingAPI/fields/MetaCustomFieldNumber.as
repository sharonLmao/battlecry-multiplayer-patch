package com.lachhhEngine.io.externalAPI.dataSharingAPI.fields
{
   import com.lachhhEngine.io.encryption.SecureNumber;
   
   public class MetaCustomFieldNumber extends MetaCustomField
   {
      
      private var _value:SecureNumber = new SecureNumber();
      
      public function MetaCustomFieldNumber(key:String, value:int, expiringType:int = 2)
      {
         super(key,expiringType);
         this._value.value = value;
      }
      
      override public function get value() : Object
      {
         return this._value.value;
      }
   }
}

