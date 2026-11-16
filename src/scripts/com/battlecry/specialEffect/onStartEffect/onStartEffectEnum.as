package com.battlecry.specialEffect.onStartEffect
{
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelStats;
   import com.battlecry.meta.model.ModelStatsEnum;
   
   public class onStartEffectEnum
   {
      
      private static var _id:int = 0;
      
      public static var EFFECT_NULL:onStartEffect = new onStartEffect(-1,-1,-1,-1);
      
      public static var ALL:Vector.<onStartEffect> = new Vector.<onStartEffect>();
      
      public static var ALL_MYTHIC:Vector.<onStartEffectMythic> = new Vector.<onStartEffectMythic>();
      
      public static var TULORAN_PLATE:onStartEffect = CreateOnStartEffect(_id++,ModelEquipement.GENRE_CREATURE_HUMAN,1,onStartEffect.COUNT_ALLIES);
      
      public static var ANCIENT_BLADE:onStartEffectMythic = CreateOnStartEffectMythic(_id++,ModelStatsEnum.ATTACK_SLASH,2,0);
      
      public static var ANCIENT_ARMOR:onStartEffectMythic = CreateOnStartEffectMythic(_id++,ModelStatsEnum.ATTACK_SLASH,0,2);
      
      public static var RAMPAGER_ARMOR:onStartEffect = CreateOnStartEffect(_id++,0,1,onStartEffect.COUNT_ENEMIES);
      
      public static var INSECTOID_QUEEN_ARMOR:onStartEffect = CreateOnStartEffect(_id++,0,0,0);
      
      public static var AODAN_MYTHIC:onStartEffect = CreateOnStartEffect(_id++,0,0,0);
      
      public static var YASUR_MYTHIC:onStartEffect = CreateOnStartEffect(_id++,ModelEquipement.GENRE_CREATURE_UNDEAD,1,onStartEffect.COUNT_ALL);
      
      public function onStartEffectEnum()
      {
         super();
      }
      
      private static function CreateOnStartEffect(id:int, creatureType:int, value:int, count:int) : onStartEffect
      {
         var c:onStartEffect = new onStartEffect(id,creatureType,value,count);
         ALL.push(c);
         return c;
      }
      
      private static function CreateOnStartEffectMythic(id:int, modelStats:ModelStats, value:int, defenseBoost:int) : onStartEffectMythic
      {
         var c:onStartEffectMythic = new onStartEffectMythic(id,modelStats,value,defenseBoost);
         ALL_MYTHIC.push(c);
         return c;
      }
   }
}

