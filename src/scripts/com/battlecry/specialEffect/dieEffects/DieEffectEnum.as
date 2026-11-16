package com.battlecry.specialEffect.dieEffects
{
   import com.battlecry.battle.Summon;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelStats;
   import com.battlecry.meta.model.ModelStatsEnum;
   
   public class DieEffectEnum
   {
      
      private static var _id:int = 0;
      
      public static var EFFECT_NULL:DieEffects = new DieEffects(-1);
      
      public static var ALL:Vector.<DieEffects> = new Vector.<DieEffects>();
      
      public static var CULTIST_ROBE:RaiseDead = CreateRaiseDead(_id++,4,Summon.TYPE_UNDEAD);
      
      public static var NATAOBETH_PLATE_RAISE:RaiseDead = CreateRaiseDead(_id++,4,Summon.TYPE_UNDEAD);
      
      public static var BAX_ROBE:RaiseDead = CreateRaiseDead(_id++,10,Summon.TYPE_DEMON);
      
      public static var IMMORTAL_ARMOR:RaiseDead = CreateRaiseDead(_id++,12,Summon.TYPE_IMMORTAL_WARRIOR);
      
      public static var UNDEAD_HORSE:RaiseDead = CreateRaiseDead(_id++,8,Summon.TYPE_UNDEAD);
      
      public static var NATAOBETH_ORB:RaiseDead = CreateRaiseDead(_id++,4,Summon.TYPE_UNDEAD);
      
      public static var NATAOBETH_PLATE_EXPLODE:ExplodeDie = CreateExplodeDie(_id++,BC_AnimationFactory.ID_FX_NATAOBETH_EXPLOSION,2,2,new MetaStatsList(0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0),-1);
      
      public static var DEFLAGRATION_SCALE:ExplodeDie = CreateExplodeDie(_id++,BC_AnimationFactory.ID_FX_25CASESEXPLOSION,2,2,new MetaStatsList(0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),BC_SfxFactory.ID_SFX_UNTMORI);
      
      public static var MAGMA_BREASTPLATE:ExplodeDie = CreateExplodeDie(_id++,BC_AnimationFactory.ID_FX_9CASESEXPLOSION,1,1,new MetaStatsList(0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),BC_SfxFactory.ID_SFX_UNTMORI);
      
      public static var UNTMORI_PLATE:ExplodeDie = CreateExplodeDie(_id++,BC_AnimationFactory.ID_FX_UNTMORI_EXPLODE,6,6,new MetaStatsList(0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),BC_SfxFactory.ID_SFX_KAMIKAZE_EXPLOSION);
      
      public static var MOON_SWORD:DieStats = CreateDieStats(_id++,ModelEquipement.GENRE_CREATURE_LYCANTROP,DieStats.RANGE_ALL,ModelStatsEnum.ATTACK_DARK,2,0);
      
      public static var MOON_ARMOR:DieStats = CreateDieStats(_id++,ModelEquipement.GENRE_CREATURE_LYCANTROP,DieStats.RANGE_ALL,ModelStatsEnum.ATTACK_DARK,0,6);
      
      public static var MOON_ORB:DieStats = CreateDieStats(_id++,ModelEquipement.GENRE_CREATURE_LYCANTROP,DieStats.RANGE_ALL,ModelStatsEnum.ATTACK_DARK,0,2);
      
      public static var SMALL_MINE:ExplodeDie = CreateExplodeDie(_id++,BC_AnimationFactory.ID_FX_FIREBALL_EXPLODE,1,1,new MetaStatsList(0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),BC_SfxFactory.ID_SFX_KAMIKAZE_EXPLOSION);
      
      public static var POWER_MINE:ExplodeDie = CreateExplodeDie(_id++,BC_AnimationFactory.ID_FX_FIREBALL_EXPLODE,1,1,new MetaStatsList(0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),BC_SfxFactory.ID_SFX_KAMIKAZE_EXPLOSION);
      
      public function DieEffectEnum()
      {
         super();
      }
      
      private static function CreateRaiseDead(id:int, raiseTimer:int, type:int) : RaiseDead
      {
         var c:RaiseDead = new RaiseDead(id,raiseTimer,type);
         ALL.push(c);
         return c;
      }
      
      public static function GetFromId(id:int) : DieEffects
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
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
      
      private static function CreateDieStats(id:int, genreCreature:int, range:int, modelStats:ModelStats, value:int, defenseBoost:int) : DieStats
      {
         var d:DieStats = new DieStats(id,genreCreature,range,modelStats,value,defenseBoost);
         ALL.push(d);
         return d;
      }
      
      private static function CreateExplodeDie(id:int, explodeId:int, largeur:int, hauteur:int, dmgList:MetaStatsList, sfxID:int) : ExplodeDie
      {
         var e:ExplodeDie = new ExplodeDie(id,explodeId,largeur,hauteur,dmgList,sfxID);
         ALL.push(e);
         return e;
      }
   }
}

