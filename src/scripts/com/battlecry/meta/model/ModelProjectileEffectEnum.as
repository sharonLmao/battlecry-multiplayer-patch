package com.battlecry.meta.model
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.MetaStatsList;
   
   public class ModelProjectileEffectEnum
   {
      
      private static var _id:int = 0;
      
      public static var EFFECT_NULL:ModelProjectileEffect = new ModelProjectileEffect(-1,-1,-1,-1,0,0,null,null);
      
      public static var ALL:Vector.<ModelProjectileEffect> = new Vector.<ModelProjectileEffect>();
      
      public static var ARROW:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_ARROW,-1,ModelProjectileEffect.TYPE_PROJECTILE,250,15,null,ModelAttackSoundEnum.BOW);
      
      public static var MUSKET:ModelProjectileEffect = CreateModelEffect(_id++,-1,-1,-1,0,0,null,ModelAttackSoundEnum.MUSKET);
      
      public static var PISTOL:ModelProjectileEffect = CreateModelEffect(_id++,-1,-1,-1,0,0,null,ModelAttackSoundEnum.PISTOL);
      
      public static var BALISTA:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_BALISTAARROW,BC_AnimationFactory.ID_FX_BALISTAARROW_EXPLODE,ModelProjectileEffect.TYPE_PROJECTILE,150,15,null,ModelAttackSoundEnum.BALISTA);
      
      public static var CATAPULT:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_CATAPULTBALL,BC_AnimationFactory.ID_FX_CANONBALL_EXPLODE,ModelProjectileEffect.TYPE_PROJECTILE,250,20,null,ModelAttackSoundEnum.CATAPULT);
      
      public static var CANNON:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_CANONBALL,BC_AnimationFactory.ID_FX_CANONBALL_EXPLODE,ModelProjectileEffect.TYPE_PROJECTILE,250,10,null,ModelAttackSoundEnum.CANNON);
      
      public static var GIANTFLAMER:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_GIANTFLAMER,-1,ModelProjectileEffect.TYPE_MELEESPLASHATTACK,0,0,null,ModelAttackSoundEnum.GIANTFLAMER);
      
      public static var STEAM_BEHEMOT:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_STEAM_BEHEMOT,25,ModelProjectileEffect.TYPE_MELEESPLASHATTACK,0,0,null,ModelAttackSoundEnum.BEHEMOT);
      
      public static var POISONSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_POISONBALL,BC_AnimationFactory.ID_FX_POISONBALL_EXPLODE,ModelProjectileEffect.TYPE_PROJECTILE,250,25,new MetaStatsList(0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.POISON_STAFF);
      
      public static var FIRESTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_FIREBALL,BC_AnimationFactory.ID_FX_FIREBALL_EXPLODE,ModelProjectileEffect.TYPE_PROJECTILE,250,25,new MetaStatsList(0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.FIRE_STAFF);
      
      public static var ICESTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_ICEBALL,BC_AnimationFactory.ID_FX_ICEBALL_EXPLODE,ModelProjectileEffect.TYPE_PROJECTILE,250,25,new MetaStatsList(0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.ICE_STAFF);
      
      public static var THUNDERSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_LIGHTNINGBALL,BC_AnimationFactory.ID_FX_LIGHTNINGBALL_EXPLODE,ModelProjectileEffect.TYPE_IDLESPELL,250,25,new MetaStatsList(0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.LIGHTNING_STAFF);
      
      public static var DARKSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_DARKBALL,BC_AnimationFactory.ID_FX_DARKBALL_EXPLODE,ModelProjectileEffect.TYPE_PROJECTILE,250,25,new MetaStatsList(0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.DARK_STAFF);
      
      public static var HOLYSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_HOLYBALL,BC_AnimationFactory.ID_FX_HOLYBALL_EXPLODE,ModelProjectileEffect.TYPE_PROJECTILE,250,25,new MetaStatsList(0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.HOLY_STAFF);
      
      public static var FIREBLASTSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_FIREBLASTSTAFF,-1,ModelProjectileEffect.TYPE_SQUADFRONTLINE,0,0,new MetaStatsList(0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.FIREBLAST_STAFF);
      
      public static var BLAZINGSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_BLAZING_MELEEAOE,-1,ModelProjectileEffect.TYPE_MELEEAOESPELL,0,0,new MetaStatsList(0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.BLAZING_STAFF);
      
      public static var ICESTORMSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_ICESTORMSTAFF,-1,ModelProjectileEffect.TYPE_SQUADFRONTLINE,0,0,new MetaStatsList(0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.ICESTORM_STAFF);
      
      public static var FROSTBITESTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_FROSTBITE_MELEEAOE,-1,ModelProjectileEffect.TYPE_MELEEAOESPELL,0,0,new MetaStatsList(0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.FROSTBITE_STAFF);
      
      public static var ACIDRAINSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_ACIDRAINSTAFF,-1,ModelProjectileEffect.TYPE_SQUADFRONTLINE,0,0,new MetaStatsList(0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.ACIDRAIN_STAFF);
      
      public static var PLAGUESTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_PLAGUE_MELEEAOE,-1,ModelProjectileEffect.TYPE_MELEEAOESPELL,0,0,new MetaStatsList(0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.PLAGUE_STAFF);
      
      public static var LIGHTNINGSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_LIGHTNINGSTAFF,-1,ModelProjectileEffect.TYPE_SQUADFRONTLINE,0,0,new MetaStatsList(0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.LIGHTNING_STAFF);
      
      public static var THUNDERSTORMSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_THUNDERSTORM_MELEEAOE,-1,ModelProjectileEffect.TYPE_MELEEAOESPELL,0,0,new MetaStatsList(0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.THUNDERSTORM_STAFF);
      
      public static var ANGELICSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_ANGELIC_BUFF,-1,ModelProjectileEffect.TYPE_BUFFSQUAD,0,0,null,ModelAttackSoundEnum.ANGELIC_STAFF);
      
      public static var DEMONICSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_DEMONIC_BUFF,-1,ModelProjectileEffect.TYPE_BUFFSQUAD,0,0,null,ModelAttackSoundEnum.DEMONIC_STAFF);
      
      public static var YASURSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_DARKBALL,BC_AnimationFactory.ID_FX_DARKBALL_EXPLODE,ModelProjectileEffect.TYPE_RAISEUNDEAD,250,25,new MetaStatsList(0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.YASUR_STAFF);
      
      public static var XONAXSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_XONAXSTAFF,-1,ModelProjectileEffect.TYPE_ALLUNITS,0,0,new MetaStatsList(0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.XONAX_STAFF);
      
      public static var SOLARSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_SOLARSTAFF,-1,ModelProjectileEffect.TYPE_ALLUNITS,0,0,new MetaStatsList(0,0,0,0,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.SOLAR_STAFF);
      
      public static var ARMAGEDONSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_ARMAGEDONSTAFF_01,BC_AnimationFactory.ID_FX_ARMAGEDONSTAFF_02,ModelProjectileEffect.TYPE_ALLENEMYUNITS,0,0,new MetaStatsList(0,0,0,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.ARMAGEDDON_STAFF);
      
      public static var OKKORAZSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_OKKORAZSTAFF,-1,ModelProjectileEffect.TYPE_FULLLINE,0,0,new MetaStatsList(0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.OKKORAZ_STAFF);
      
      public static var ORYTHSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_LARVA,-1,ModelProjectileEffect.TYPE_MORPH,0,0,null,ModelAttackSoundEnum.ORYTH_STAFF);
      
      public static var VASSPOTANAXSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_VASSPOTANAXSTAFF,-1,ModelProjectileEffect.TYPE_ALLUNITS,0,0,new MetaStatsList(0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.VASSPOTANAX_STAFF);
      
      public static var ICESPIKESTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_ICEBALL,BC_AnimationFactory.ID_FX_ICEBALL_EXPLODE,ModelProjectileEffect.TYPE_PROJECTILE,250,25,new MetaStatsList(0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.ICE_STAFF);
      
      public static var POISONARROWSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_POISONBALL,BC_AnimationFactory.ID_FX_POISONBALL_EXPLODE,ModelProjectileEffect.TYPE_PROJECTILE,250,25,new MetaStatsList(0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.POISON_STAFF);
      
      public static var FIREBALLSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_FIREBALL,BC_AnimationFactory.ID_FX_FIREBALL_EXPLODE,ModelProjectileEffect.TYPE_PROJECTILE,250,25,new MetaStatsList(0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.FIRE_STAFF);
      
      public static var THUNDERBOLTSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_LIGHTNINGBALL,BC_AnimationFactory.ID_FX_LIGHTNINGBALL_EXPLODE,ModelProjectileEffect.TYPE_IDLESPELL,250,25,new MetaStatsList(0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.THUNDER_STAFF);
      
      public static var PYROBATTLESTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_FIREBALL,BC_AnimationFactory.ID_FX_FIREBALL_EXPLODE,ModelProjectileEffect.TYPE_PROJECTILE,250,25,new MetaStatsList(0,0,0,0,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.FIRE_STAFF);
      
      public static var TESLASTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_LIGHTNINGBALL,BC_AnimationFactory.ID_FX_LIGHTNINGBALL_EXPLODE,ModelProjectileEffect.TYPE_PROJECTILE,250,25,new MetaStatsList(0,0,0,0,0,0,0,30,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.THUNDER_STAFF);
      
      public static var SEAKINGSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_ICESTORMSTAFF,-1,ModelProjectileEffect.TYPE_SQUADFRONTLINE,0,0,new MetaStatsList(0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.ICESTORM_STAFF);
      
      public static var SWAMPSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_ACIDRAINSTAFF,-1,ModelProjectileEffect.TYPE_FIRST3LANE,0,0,new MetaStatsList(0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.ACIDRAIN_STAFF);
      
      public static var METASTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_META_STAFF_EXPLOSION,-1,ModelProjectileEffect.TYPE_SQUADFRONTLINE,0,0,new MetaStatsList(0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.LIGHTNING_STAFF);
      
      public static var CORALSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_ANGELIC_BUFF,-1,ModelProjectileEffect.TYPE_BUFFSQUAD,0,0,null,ModelAttackSoundEnum.ANGELIC_STAFF);
      
      public static var PYROSTAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_PYROSTAFF,-1,ModelProjectileEffect.TYPE_FULLLINE,0,0,new MetaStatsList(0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.OKKORAZ_STAFF);
      
      public static var FLAME_THROWER:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_FLAMETHROWER,-1,ModelProjectileEffect.TYPE_MELEESPLASHATTACK,0,0,null,ModelAttackSoundEnum.GIANTFLAMER);
      
      public static var DEATH_STAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_DARKBALL_EXPLODE,-1,ModelProjectileEffect.TYPE_ALL_NON_UNDEAD,0,0,new MetaStatsList(0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.DARK_STAFF);
      
      public static var LIFE_STAFF:ModelProjectileEffect = CreateModelEffect(_id++,BC_AnimationFactory.ID_FX_LIGHTNINGBALL,BC_AnimationFactory.ID_FX_LIGHTNINGBALL_EXPLODE,ModelProjectileEffect.TYPE_IDLESPELL,250,25,new MetaStatsList(0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0),ModelAttackSoundEnum.LIGHTNING_STAFF);
      
      public function ModelProjectileEffectEnum()
      {
         super();
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
      
      public static function GetFromId(id:int) : ModelProjectileEffect
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
      
      private static function CreateModelEffect(id:int, effectAnimId:int, onHitAnimId:int, effectType:int, offSetY:Number, startOffSetY:Number, dmgList:MetaStatsList, modelAttackSound:ModelAttackSound) : ModelProjectileEffect
      {
         var m:ModelProjectileEffect = new ModelProjectileEffect(id,effectAnimId,onHitAnimId,effectType,offSetY,startOffSetY,dmgList,modelAttackSound);
         ALL.push(m);
         return m;
      }
   }
}

