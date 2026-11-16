package com.battlecry.specialEffect.timedEffects
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.meta.model.ModelEquipement;
   
   public class TimedEffectEnum
   {
      
      private static var _id:int = 0;
      
      public static var INFINITE:int = -1;
      
      public static var LIMIT:int = 0;
      
      public static var TYPE_REGEN:int = 0;
      
      public static var TYPE_TIMEDMORPH:int = 1;
      
      public static var TYPE_TIMEDDEAD:int = 2;
      
      public static var TYPE_TIMEDDMG:int = 3;
      
      public static var TYPE_TIMEDSTATSBOOST:int = 4;
      
      public static var EFFECT_NULL:TimedEffect = new TimedEffect(-1,-1,-1,-1);
      
      public static var ALL:Vector.<TimedEffect> = new Vector.<TimedEffect>();
      
      public static var REGEN_NECKLACE:LifeEffect = CreateTimedLifeEffect(_id++,TYPE_REGEN,INFINITE,10,1,LIMIT);
      
      public static var REGEN_SOLDIERORB:LifeEffect = CreateTimedLifeEffect(_id++,TYPE_REGEN,INFINITE,10,1,LIMIT);
      
      public static var REGEN_LUMINARYMAIL:LifeEffect = CreateTimedLifeEffect(_id++,TYPE_REGEN,INFINITE,10,1,INFINITE);
      
      public static var TIMEMORPH_LARVA:TimedMorphLarva = CreateTimedMorphLarvaEffect(_id++,TYPE_TIMEDMORPH,20,20);
      
      public static var TIMEDEAD:TimedDead = CreateTimedDeadEffect(_id++,TYPE_TIMEDDEAD,20,20);
      
      public static var NECRO_GEAR:TimedDead = CreateTimedDeadEffect(_id++,TYPE_TIMEDDEAD,20,20);
      
      public static var XONAX_SKIN:TimedDmg = CreateTimedDmgEffect(_id++,TYPE_TIMEDDMG,INFINITE,10,TimedDmg.RANGE_ARMY,new MetaStatsList(0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0),BC_AnimationFactory.ID_FX_POISONBALL_EXPLODE,TimedDmg.DMGTYPE_SPECIAL,0,0,0);
      
      public static var DEATH:TimedDmg = CreateTimedDmgEffect(_id++,TYPE_TIMEDDMG,INFINITE,10,TimedDmg.RANGE_ARMY,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),BC_AnimationFactory.ID_FX_DARKBALL_EXPLODE,TimedDmg.DMGTYPE_DEF,3,0,0);
      
      public static var ZAMAROTH_SWORD_DMG:TimedDmg = CreateTimedDmgEffect(_id++,TYPE_TIMEDDMG,INFINITE,20,TimedDmg.RANGE_EVERYONE,new MetaStatsList(0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0),BC_AnimationFactory.ID_FX_DARKBALL_EXPLODE,TimedDmg.DMGTYPE_SPECIAL,0,0,ModelEquipement.GENRE_CREATURE_DEMON,BC_AnimationFactory.ID_FX_ZAMAROTHSWORD);
      
      public static var IMRAILL_MACE:TimedDmg = CreateTimedDmgEffect(_id++,TYPE_TIMEDDMG,INFINITE,25,TimedDmg.RANGE_ARMY,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),BC_AnimationFactory.ID_FX_ANGELIC_BUFF,TimedDmg.DMGTYPE_DEF,-1,0,0,BC_AnimationFactory.ID_FX_IMRAHILMACE);
      
      public static var AZARATIUS_AXE:TimedDmg = CreateTimedDmgEffect(_id++,TYPE_TIMEDDMG,INFINITE,20,TimedDmg.RANGE_EVERYONE,new MetaStatsList(0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),-1,TimedDmg.DMGTYPE_SPECIAL,0,0,0,BC_AnimationFactory.ID_FX_AZARTIUSAXE);
      
      public static var XONAX_MAIL:TimedDmg = CreateTimedDmgEffect(_id++,TYPE_TIMEDDMG,INFINITE,2,TimedDmg.RANGE_EVERYONE,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),BC_AnimationFactory.ID_FX_POISONBALL_EXPLODE,TimedDmg.DMGTYPE_DEF,1,ModelEquipement.GENRE_CREATURE_VERMINE,0);
      
      public static var ZAMAROTH_SWORD_STATS:TimedStatsBoost = CreateTimedStatsBoost(_id++,TYPE_TIMEDSTATSBOOST,INFINITE,15,new MetaStatsList(0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0),ModelEquipement.GENRE_CREATURE_DEMON,TimedStatsBoost.RANGE_EVERYONE,BC_AnimationFactory.ID_FX_DEMONIC_BUFF);
      
      public function TimedEffectEnum()
      {
         super();
      }
      
      private static function CreateTimedLifeEffect(id:int, type:int, duration:int, coolDown:int, value:Number, maxLimit:int) : LifeEffect
      {
         var l:LifeEffect = new LifeEffect(id,type,duration,coolDown,value,maxLimit);
         ALL.push(l);
         return l;
      }
      
      private static function CreateTimedStatsBoost(id:int, type:int, duration:int, coolDown:int, statsBoostList:MetaStatsList, creatureType:int, range:int, fxID:int) : TimedStatsBoost
      {
         var t:TimedStatsBoost = new TimedStatsBoost(id,type,duration,coolDown,statsBoostList,creatureType,range,fxID);
         ALL.push(t);
         return t;
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
      
      private static function CreateTimedMorphLarvaEffect(id:int, type:int, duration:int, coolDown:int) : TimedMorphLarva
      {
         var t:TimedMorphLarva = new TimedMorphLarva(id,type,duration,coolDown);
         ALL.push(t);
         return t;
      }
      
      public static function GetFromId(id:int) : TimedEffect
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
      
      public static function IsCastingTimedEffect(id:int) : Boolean
      {
         return id == ZAMAROTH_SWORD_DMG.id || id == IMRAILL_MACE.id || id == AZARATIUS_AXE.id || id == ZAMAROTH_SWORD_STATS.id;
      }
      
      private static function CreateTimedDeadEffect(id:int, type:int, duration:int, coolDown:int) : TimedDead
      {
         var t:TimedDead = new TimedDead(id,type,duration,coolDown);
         ALL.push(t);
         return t;
      }
      
      private static function CreateTimedDmgEffect(id:int, type:int, duration:int, coolDown:int, range:int, dmgList:MetaStatsList, effectID:int, dmgType:int, defDmg:int, creatureType:int, dontAffectCreature:int, casterEffect:int = -1) : TimedDmg
      {
         var t:TimedDmg = new TimedDmg(id,type,duration,coolDown,range,dmgList,effectID,dmgType,defDmg,creatureType,dontAffectCreature,casterEffect);
         ALL.push(t);
         return t;
      }
   }
}

