package com.lachhhEngine.io.externalAPI.statsAPI
{
   public class MetaStatData
   {
      
      public static const TYPE_MAX:String = "max";
      
      public static const TYPE_MIN:String = "min";
      
      public static const TYPE_ADD:String = "add";
      
      private var _type:String;
      
      private var _name:String;
      
      private var _value:Number;
      
      public function MetaStatData(name:String, value:Number, type:String = "max")
      {
         super();
         this._name = name;
         this._value = value;
         this._type = type;
      }
      
      public function set value(value:Number) : void
      {
         this._value = value;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get value() : Number
      {
         return this._value;
      }
      
      public function set name(name:String) : void
      {
         this._name = name;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(type:String) : void
      {
         this._type = type;
      }
   }
}

