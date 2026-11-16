package com.battlecry.specialEffect.statsModifier
{
   import com.battlecry.specialEffect.SpecialEffect;
   
   public class StatsModifier extends SpecialEffect
   {
      
      public static const TYPE_CASTINGTIME:int = 0;
      
      public static const TYPE_LIFE:int = 1;
      
      private var _type:int;
      
      private var _value:int;
      
      private var _id:int;
      
      private var _limit:int;
      
      public function StatsModifier(id:int, type:int, value:int, limit:int)
      {
         super();
         this._id = id;
         this._value = value;
         this._limit = limit;
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
      
      public function set type(type:int) : void
      {
         this._type = type;
      }
      
      public function get limit() : int
      {
         return this._limit;
      }
      
      public function Reset() : void
      {
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set limit(limit:int) : void
      {
         this._limit = limit;
      }
   }
}

