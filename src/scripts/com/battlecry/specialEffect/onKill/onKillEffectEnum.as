package com.battlecry.specialEffect.onKill
{
   import com.battlecry.battle.Summon;
   import com.battlecry.meta.model.ModelStats;
   import com.battlecry.meta.model.ModelStatsEnum;
   
   public class onKillEffectEnum
   {
      
      private static var _id:int = 0;
      
      public static var EFFECT_NULL:onKillEffect = new onKillEffect(-1);
      
      public static var ALL:Vector.<onKillEffect> = new Vector.<onKillEffect>();
      
      public static var NECRON_BLADE:onKillRaiseUndead = CreateOnKillEffectRaiseUndead(_id++,1,Summon.TYPE_UNDEAD);
      
      public static var SAINT_BLADE:onKillHeal = CreateOnKillEffectHeal(_id++,1,onKillHeal.DEF,onKillHeal.TARGET_SQUAD);
      
      public static var MECH_BEAST:onKillHeal = CreateOnKillEffectHeal(_id++,3,onKillHeal.REGEN,onKillHeal.TARGET_SELF);
      
      public static var UNICORN:onKillHeal = CreateOnKillEffectHeal(_id++,1,onKillHeal.REGEN,onKillHeal.TARGET_SQUAD);
      
      public static var LIVINGSWORD:onKillStats = CreateOnKillEffectStats(_id++,1,ModelStatsEnum.ATTACK_SLASH);
      
      public static var LIVINGBOW:onKillStats = CreateOnKillEffectStats(_id++,1,ModelStatsEnum.ATTACK_PIERCING);
      
      public static var OKKORAZHAMMER:onKillHeal = CreateOnKillEffectHeal(_id++,10,onKillHeal.DEF,onKillHeal.TARGET_SELF);
      
      public function onKillEffectEnum()
      {
         super();
      }
      
      private static function CreateOnKillEffectStats(id:int, ammount:int, modelStats:ModelStats) : onKillStats
      {
         var c:onKillStats = new onKillStats(id,ammount,modelStats);
         ALL.push(c);
         return c;
      }
      
      private static function CreateOnKillEffectHeal(id:int, value:int, type:int, target:int) : onKillHeal
      {
         var c:onKillHeal = new onKillHeal(id,value,type,target);
         ALL.push(c);
         return c;
      }
      
      private static function CreateOnKillEffectRaiseUndead(id:int, raiseTimer:int, type:int) : onKillRaiseUndead
      {
         var c:onKillRaiseUndead = new onKillRaiseUndead(id,raiseTimer,type);
         ALL.push(c);
         return c;
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
      
      public static function GetFromId(id:int) : onKillEffect
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            if(id == ALL[i].id)
            {
               return ALL[i];
            }
         }
         return EFFECT_NULL;
      }
   }
}

