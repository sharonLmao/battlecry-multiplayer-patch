package com.battlecry.meta.model
{
   public class ModelRanking
   {
      
      public static var RANKING_SERF:int = 1;
      
      public static var RANKING_PEASANT:int = 2;
      
      public static var RANKING_CONSCRIPT:int = 3;
      
      public static var RANKING_SQUIRE:int = 4;
      
      public static var RANKING_MEN_AT_ARMS:int = 5;
      
      public static var RANKING_SOLDIER:int = 6;
      
      public static var RANKING_MERCENARY:int = 7;
      
      public static var RANKING_ELITE_SOLDIER:int = 8;
      
      public static var RANKING_CAPTAIN:int = 9;
      
      public static var RANKING_KNIGHT:int = 10;
      
      public static var RANKING_BARON:int = 11;
      
      public static var RANKING_DUKE:int = 12;
      
      public static var RANKING_LORD:int = 13;
      
      public static var RANKING_CHAMPION:int = 14;
      
      public static var RANKING_COMMANDER:int = 15;
      
      public static var RANKING_GENERAL:int = 16;
      
      public static var RANKING_BATTLE_MASTER:int = 17;
      
      public static var RANKING_HERO:int = 18;
      
      public static var RANKING_ARCH_DUKE:int = 19;
      
      public static var RANKING_CHANCELLOR:int = 20;
      
      public static var RANKING_WARLORD:int = 21;
      
      public static var RANKING_KING:int = 22;
      
      public static var RANKING_OVERLORD:int = 23;
      
      public static var RANKING_EMPEROR:int = 24;
      
      private var _nameID:int;
      
      private var _value:int;
      
      private var _id:int;
      
      public function ModelRanking(id:int, value:int, nameID:int)
      {
         super();
         this._id = id;
         this._value = value;
         this._nameID = nameID;
      }
      
      public function set value(value:int) : void
      {
         this._value = value;
      }
      
      public function get nameID() : int
      {
         return this._nameID;
      }
      
      public function set nameID(nameID:int) : void
      {
         this._nameID = nameID;
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
   }
}

