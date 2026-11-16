package com.battlecry.meta.model
{
   public class ModelAttackEnum
   {
      
      private static var _id:int = 0;
      
      public static var ATTACK_NULL:ModelAttack = new ModelAttack(-1,-1,0,0,0,0);
      
      public static var ALL:Vector.<ModelAttack> = new Vector.<ModelAttack>();
      
      public static var SINGLE_ATTACK:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_SINGLEATTACK,0,0,0,0);
      
      public static var SPLASH_BALISTA:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_SPLASHCANON,3,0,1,0);
      
      public static var SPLASH_CANON:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_SPLASHCANON,3,0,2,0);
      
      public static var SPLASH_STEAMCHARIOT:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_MELEESPLASHATTAQUE,1,0,2,0);
      
      public static var SPLASH_GIANTFLAMER:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_MELEESPLASHATTAQUE,6,0,1,0);
      
      public static var STEAM_BEHEMOT:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_MELEESPLASHATTAQUE,1,0,3,0);
      
      public static var CASTAOEMELEE:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_MELEEAOE,0,0,0,0);
      
      public static var CASTALLUNITS:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_ALLUNITS,0,0,0,0);
      
      public static var CASTENEMYUNITS:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_ALLENEMYUNITS,0,0,0,0);
      
      public static var CASTFULLLINE:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_FULLLINE,0,0,0,0);
      
      public static var MORPHDEMON:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_MORPH,0,0,0,0);
      
      public static var CASTSQUADFRONTLINE:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_SQUADFRONTLINE,0,0,0,0);
      
      public static var CASTBUFFSQUAD:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_BUFFSQUAD,0,0,0,0);
      
      public static var CASTBUFFEVERYONE:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_BUFFEVERYONE,0,0,0,0);
      
      public static var CASTBUFFSQUADSINGLEATTACK:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_BUFFSQUAD_SINGLEATTACK,0,0,0,0);
      
      public static var ONATTACKLINE:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_MELEELINEATTACK,3,0,1,0);
      
      public static var MINE_EXPLODE:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_MINEEXPLODE,0,1,1,0);
      
      public static var FLAME_THROWER:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_MELEESPLASHATTAQUE,4,0,1,0);
      
      public static var CASTRANDOMMELEE:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_MELEE_RANDOM,0,0,0,0);
      
      public static var BATTLE_HAMMER:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_MELEESPLASHATTAQUE,2,0,1,0);
      
      public static var CASTFIRST3LINE:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_CASTFIRST3LINE,0,0,0,0);
      
      public static var MORPHSQUADDEMON:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_SQUADMORPH,0,0,0,0);
      
      public static var CASTFIRSTTARGET:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_FIRSTTARGET,0,0,0,0);
      
      public static var BUFFALLNONUNDEAD:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_BUFF_ALL_NON_UNDEAD,0,0,0,0);
      
      public static var CASTALLNONUNDEAD:ModelAttack = CreateModelAttack(_id++,ModelAttack.TYPE_CAST_ALL_NON_UNDEAD,0,0,0,0);
      
      public function ModelAttackEnum()
      {
         super();
      }
      
      private static function CreateModelAttack(id:int, type:int, leftSplash:int, rightSplash:int, botSplash:int, upSplash:int) : ModelAttack
      {
         var m:ModelAttack = new ModelAttack(id,type,leftSplash,rightSplash,botSplash,upSplash);
         ALL.push(m);
         return m;
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
      
      public static function GetFromId(id:int) : ModelAttack
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            if(id == ALL[i].id)
            {
               return ALL[i];
            }
         }
         return ATTACK_NULL;
      }
   }
}

