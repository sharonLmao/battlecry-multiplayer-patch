package com.battlecry.meta.model
{
   public class ModelStatsEnum
   {
      
      private static var _id:int = 0;
      
      public static var STATS_NULL:ModelStats = new ModelStats(-1,-1);
      
      public static var ALL:Vector.<ModelStats> = new Vector.<ModelStats>();
      
      public static var ATTACK_SLASH:ModelStats = CreateModelStats(_id++,ModelStats.ATTACK_SLASH);
      
      public static var ATTACK_BLUNT:ModelStats = CreateModelStats(_id++,ModelStats.ATTACK_BLUNT);
      
      public static var ATTACK_PIERCING:ModelStats = CreateModelStats(_id++,ModelStats.ATTACK_PIERCING);
      
      public static var ATTACK_EXPLOSION:ModelStats = CreateModelStats(_id++,ModelStats.ATTACK_EXPLOSION);
      
      public static var ATTACK_FIRE:ModelStats = CreateModelStats(_id++,ModelStats.ATTACK_FIRE);
      
      public static var ATTACK_ICE:ModelStats = CreateModelStats(_id++,ModelStats.ATTACK_ICE);
      
      public static var ATTACK_POISON:ModelStats = CreateModelStats(_id++,ModelStats.ATTACK_POISON);
      
      public static var ATTACK_LIGHTNING:ModelStats = CreateModelStats(_id++,ModelStats.ATTACK_LIGHTNING);
      
      public static var ATTACK_DARK:ModelStats = CreateModelStats(_id++,ModelStats.ATTACK_DARK);
      
      public static var ATTACK_HOLY:ModelStats = CreateModelStats(_id++,ModelStats.ATTACK_HOLY);
      
      public static var RESIST_SLASH:ModelStats = CreateModelStats(_id++,ModelStats.RESIST_SLASH);
      
      public static var RESIST_BLUNT:ModelStats = CreateModelStats(_id++,ModelStats.RESIST_BLUNT);
      
      public static var RESIST_PIERCING:ModelStats = CreateModelStats(_id++,ModelStats.RESIST_PIERCING);
      
      public static var RESIST_EXPLOSION:ModelStats = CreateModelStats(_id++,ModelStats.RESIST_EXPLOSION);
      
      public static var RESIST_FIRE:ModelStats = CreateModelStats(_id++,ModelStats.RESIST_FIRE);
      
      public static var RESIST_ICE:ModelStats = CreateModelStats(_id++,ModelStats.RESIST_ICE);
      
      public static var RESIST_POISON:ModelStats = CreateModelStats(_id++,ModelStats.RESIST_POISON);
      
      public static var RESIST_LIGHTNING:ModelStats = CreateModelStats(_id++,ModelStats.RESIST_LIGHTNING);
      
      public static var RESIST_DARK:ModelStats = CreateModelStats(_id++,ModelStats.RESIST_DARK);
      
      public static var RESIST_HOLY:ModelStats = CreateModelStats(_id++,ModelStats.RESIST_HOLY);
      
      public function ModelStatsEnum()
      {
         super();
      }
      
      public static function GetFromId(id:int) : ModelStats
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            if(id == ALL[i].id)
            {
               return ALL[i];
            }
         }
         return STATS_NULL;
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
      
      private static function CreateModelStats(id:int, type:int) : ModelStats
      {
         var m:ModelStats = new ModelStats(id,type);
         ALL.push(m);
         return m;
      }
   }
}

