package com.battlecry.meta.model
{
   public class ModelStats
   {
      
      public static var ATTACK_SLASH:int = 1;
      
      public static var ATTACK_BLUNT:int = 2;
      
      public static var ATTACK_PIERCING:int = 3;
      
      public static var ATTACK_EXPLOSION:int = 4;
      
      public static var ATTACK_FIRE:int = 5;
      
      public static var ATTACK_ICE:int = 6;
      
      public static var ATTACK_POISON:int = 7;
      
      public static var ATTACK_LIGHTNING:int = 8;
      
      public static var ATTACK_DARK:int = 9;
      
      public static var ATTACK_HOLY:int = 10;
      
      public static var RESIST_SLASH:int = 13;
      
      public static var RESIST_BLUNT:int = 14;
      
      public static var RESIST_PIERCING:int = 15;
      
      public static var RESIST_EXPLOSION:int = 16;
      
      public static var RESIST_FIRE:int = 17;
      
      public static var RESIST_ICE:int = 18;
      
      public static var RESIST_POISON:int = 19;
      
      public static var RESIST_LIGHTNING:int = 20;
      
      public static var RESIST_DARK:int = 21;
      
      public static var RESIST_HOLY:int = 22;
      
      private var _type:int;
      
      private var _id:int;
      
      public function ModelStats(id:int, type:int)
      {
         super();
         this._id = id;
         this._type = type;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set type(type:int) : void
      {
         this._type = type;
      }
      
      public function Reset() : void
      {
      }
   }
}

