package com.battlecry.meta
{
   public class MetaType
   {
      
      public static var EMPTY_TYPE:MetaType = new MetaType(-1,0);
      
      public static const TYPE_SLASHING:int = 1;
      
      public static const TYPE_BLUNT:int = 2;
      
      public static const TYPE_PIERCING:int = 3;
      
      public static const TYPE_EXPLOSION:int = 4;
      
      public static const TYPE_FIRE:int = 5;
      
      public static const TYPE_ICE:int = 6;
      
      public static const TYPE_POISON:int = 7;
      
      public static const TYPE_HOLY:int = 8;
      
      public static const TYPE_DARK:int = 9;
      
      public static const TYPE_LIGHTNING:int = 10;
      
      private var _value:int;
      
      private var _type:int;
      
      public function MetaType(type:int, value:int)
      {
         super();
         this._value = value;
         this._type = type;
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function set type(type:int) : void
      {
         this._type = type;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set value(value:int) : void
      {
         this._value = value;
      }
   }
}

