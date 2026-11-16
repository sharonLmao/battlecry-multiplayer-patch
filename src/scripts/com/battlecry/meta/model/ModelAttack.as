package com.battlecry.meta.model
{
   public class ModelAttack
   {
      
      public static const TYPE_SINGLEATTACK:int = 0;
      
      public static const TYPE_SPLASHCANON:int = 1;
      
      public static const TYPE_SPLASHCENTRALPOINT:int = 2;
      
      public static const TYPE_MELEEAOE:int = 3;
      
      public static const TYPE_SQUADFRONTLINE:int = 4;
      
      public static const TYPE_MELEESPLASHATTAQUE:int = 5;
      
      public static const TYPE_BUFFSQUAD:int = 6;
      
      public static const TYPE_MELEELINEATTACK:int = 7;
      
      public static const TYPE_ALLUNITS:int = 8;
      
      public static const TYPE_ALLENEMYUNITS:int = 9;
      
      public static const TYPE_FULLLINE:int = 10;
      
      public static const TYPE_MORPH:int = 11;
      
      public static const TYPE_BUFFEVERYONE:int = 12;
      
      public static const TYPE_BUFFSQUAD_SINGLEATTACK:int = 13;
      
      public static const TYPE_MINEEXPLODE:int = 14;
      
      public static const TYPE_MELEE_RANDOM:int = 15;
      
      public static const TYPE_CASTFIRST3LINE:int = 16;
      
      public static const TYPE_SQUADMORPH:int = 17;
      
      public static const TYPE_FIRSTTARGET:int = 18;
      
      public static const TYPE_BUFF_ALL_NON_UNDEAD:int = 19;
      
      public static const TYPE_CAST_ALL_NON_UNDEAD:int = 20;
      
      private var _upSplash:int;
      
      private var _id:int;
      
      private var _botSplash:int;
      
      private var _type:int;
      
      private var _rightSplash:int;
      
      private var _leftSplash:int;
      
      public function ModelAttack(id:int, type:int, leftSplash:int, rightSplash:int, botSplash:int, upSplash:int)
      {
         super();
         this._id = id;
         this._type = type;
         this._leftSplash = leftSplash;
         this._rightSplash = rightSplash;
         this._botSplash = botSplash;
         this._upSplash = upSplash;
      }
      
      public function set upSplash(upSplash:int) : void
      {
         this._upSplash = upSplash;
      }
      
      public function set rightSplash(rightSplash:int) : void
      {
         this._rightSplash = rightSplash;
      }
      
      public function get leftSplash() : int
      {
         return this._leftSplash;
      }
      
      public function get botSplash() : int
      {
         return this._botSplash;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set botSplash(botSplash:int) : void
      {
         this._botSplash = botSplash;
      }
      
      public function get upSplash() : int
      {
         return this._upSplash;
      }
      
      public function get rightSplash() : int
      {
         return this._rightSplash;
      }
      
      public function set leftSplash(leftSplash:int) : void
      {
         this._leftSplash = leftSplash;
      }
      
      public function Reset() : void
      {
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(type:int) : void
      {
         this._type = type;
      }
   }
}

