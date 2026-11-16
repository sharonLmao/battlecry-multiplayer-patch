package com.battlecry.meta.model
{
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.specialEffect.SpecialEffect;
   import com.battlecry.specialEffect.aura.AuraEnum;
   import com.battlecry.specialEffect.dieEffects.DieEffectEnum;
   import com.battlecry.specialEffect.onAttack.onAttackEffectEnum;
   import com.battlecry.specialEffect.onKill.onKillEffectEnum;
   import com.battlecry.specialEffect.onRaiseUndead.onRaiseUndeadEnum;
   import com.battlecry.specialEffect.onStartEffect.onStartEffectEnum;
   import com.battlecry.specialEffect.statsModifier.StatsModifierEnum;
   import com.battlecry.specialEffect.timedEffects.TimedEffectEnum;
   
   public class ModelEquipementEnum
   {
      
      public static var ALL_SET:Array;
      
      public static var ALL_SET_NAME:Array;
      
      private static var _id:int = 0;
      
      public static var SET_PRIME:int = 1;
      
      public static var SET_EXPANSION1:int = 2;
      
      public static var SET_MYTHIC:int = 3;
      
      public static var EQUIPEMENT_NULL:ModelEquipement = new ModelEquipement(-1,ModelEquipement.RARITY_COMMUN,0,0,0,0,-1,-1,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,0,false);
      
      public static var ALL:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var ALL_COMMUN:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var ALL_UNCOMMUN:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var ALL_RARE:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var ALL_LEGENDARY:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var PRIME_SET:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var PRIME_COMMUN:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var PRIME_UNCOMMUN:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var PRIME_RARE:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var PRIME_LEGENDARY:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var EXPANSION1_SET:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var EXPANSION1_COMMUN:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var EXPANSION1_UNCOMMUN:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var EXPANSION1_RARE:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var EXPANSION1_LEGENDARY:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var MYTHIC_SET:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var MYTHIC_COMMUN:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var MYTHIC_UNCOMMUN:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var MYTHIC_RARE:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var MYTHIC_LEGENDARY:Vector.<ModelEquipement> = new Vector.<ModelEquipement>();
      
      public static var CREATURE_HUMAN:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_HUMAN,1,1,BC_TextFactory.ID_CREATURE_HUMAN_NAME,BC_TextFactory.ID_CREATURE_HUMAN_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var CREATURE_ORC:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_ORC,1,1,BC_TextFactory.ID_CREATURE_ORC_NAME,BC_TextFactory.ID_CREATURE_ORC_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var CREATURE_IMP:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_IMP,1,1,BC_TextFactory.ID_CREATURE_IMP_NAME,BC_TextFactory.ID_CREATURE_IMP_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var CREATURE_BALISTA:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_ARTILLERY_3CASE,3,1,BC_TextFactory.ID_CREATURE_BALISTA_NAME,BC_TextFactory.ID_CREATURE_BALISTA_DESC,ModelProjectileEffectEnum.BALISTA,ModelAttackEnum.SPLASH_BALISTA,null,SET_EXPANSION1,false);
      
      public static var CREATURE_CATAPULT:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_ARTILLERY_6CASE,3,2,BC_TextFactory.ID_CREATURE_CATAPULT_NAME,BC_TextFactory.ID_CREATURE_CATAPULT_DESC,ModelProjectileEffectEnum.CATAPULT,ModelAttackEnum.SPLASH_CANON,null,SET_PRIME,false);
      
      public static var CREATURE_CANNON:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_ARTILLERY_6CASE,3,2,BC_TextFactory.ID_CREATURE_CANNON_NAME,BC_TextFactory.ID_CREATURE_CANNON_DESC,ModelProjectileEffectEnum.CANNON,ModelAttackEnum.SPLASH_CANON,null,SET_PRIME,false);
      
      public static var CREATURE_UNDEAD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_UNDEAD,1,1,BC_TextFactory.ID_CREATURE_UNDEAD_NAME,BC_TextFactory.ID_CREATURE_UNDEAD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var CREATURE_INSECTOID:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_INSECTOID,1,1,BC_TextFactory.ID_CREATURE_INSECTOID_NAME,BC_TextFactory.ID_CREATURE_INSECTOID_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([TimedEffectEnum.TIMEMORPH_LARVA]),SET_EXPANSION1,false);
      
      public static var CREATURE_VERMINE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_VERMINE,1,1,BC_TextFactory.ID_CREATURE_VERMINE_NAME,BC_TextFactory.ID_CREATURE_VERMINE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var CREATURE_REPTILIAN:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_REPTILIAN,1,1,BC_TextFactory.ID_CREATURE_REPTILIAN_NAME,BC_TextFactory.ID_CREATURE_REPTILIAN_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var CREATURE_LYCANTROP:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_LYCANTROP,1,1,BC_TextFactory.ID_CREATURE_LYCANTROP_NAME,BC_TextFactory.ID_CREATURE_LYCANTROP_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var CREATURE_GOLEM:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_GOLEM,1,1,BC_TextFactory.ID_CREATURE_GOLEM_NAME,BC_TextFactory.ID_CREATURE_GOLEM_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([TimedEffectEnum.TIMEDEAD]),SET_PRIME,false);
      
      public static var CREATURE_FISHMAN:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_FISHMAN,1,1,BC_TextFactory.ID_CREATURE_FISHMAN_NAME,BC_TextFactory.ID_CREATURE_FISHMAN_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var CREATURE_UNDEAD_CATAPULT:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_ARTILLERY_6CASE,3,2,BC_TextFactory.ID_CREATURE_UNDEADCATAPULT_NAME,BC_TextFactory.ID_CREATURE_UNDEADCATAPULT_DESC,ModelProjectileEffectEnum.CATAPULT,ModelAttackEnum.SPLASH_CANON,null,SET_PRIME,false);
      
      public static var CREATURE_STEAM_CHARIOT:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_ARTILLERY_6CASE,3,2,BC_TextFactory.ID_CREATURE_STEAMCHARIOT_NAME,BC_TextFactory.ID_CREATURE_STEAMCHARIOT_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SPLASH_STEAMCHARIOT,null,SET_PRIME,false);
      
      public static var CREATURE_PLAGUE_CANON:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_ARTILLERY_6CASE,3,2,BC_TextFactory.ID_CREATURE_PLAGUECANON_NAME,BC_TextFactory.ID_CREATURE_PLAGUECANON_DESC,ModelProjectileEffectEnum.CANNON,ModelAttackEnum.SPLASH_CANON,null,SET_PRIME,false);
      
      public static var CREATURE_GIANT_FLAMER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_ARTILLERY_3CASE,3,1,BC_TextFactory.ID_CREATURE_GIANTFLAMER_NAME,BC_TextFactory.ID_CREATURE_GIANTFLAMER_DESC,ModelProjectileEffectEnum.GIANTFLAMER,ModelAttackEnum.SPLASH_GIANTFLAMER,null,SET_PRIME,false);
      
      public static var CREATURE_FIREELEMENTAL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_FIREELEMENTAL,1,1,BC_TextFactory.ID_CREATURE_FIREELEMENTAL_NAME,BC_TextFactory.ID_CREATURE_FIREELEMENTAL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var CREATURE_WATERELEMENTAL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_WATERELEMENTAL,1,1,BC_TextFactory.ID_CREATURE_WATERELEMENTAL_NAME,BC_TextFactory.ID_CREATURE_WATERELEMENTAL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var CREATURE_POISONELEMENTAL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_POISONELEMENTAL,1,1,BC_TextFactory.ID_CREATURE_POISONELEMENTAL_NAME,BC_TextFactory.ID_CREATURE_POISONELEMENTAL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var CREATURE_THUNDERELEMENTAL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_THUNDERELEMENTAL,1,1,BC_TextFactory.ID_CREATURE_THUNDERELEMENTAL_NAME,BC_TextFactory.ID_CREATURE_THUNDERELEMENTAL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var CREATURE_OCTOPOD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_OCTOPOD,1,1,BC_TextFactory.ID_CREATURE_OCTOPOD_NAME,BC_TextFactory.ID_CREATURE_OCTOPOD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([StatsModifierEnum.OCTOPOD_MODIFIER]),SET_PRIME,false);
      
      public static var CREATURE_DEMON:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_DEMON,1,1,BC_TextFactory.ID_CREATURE_DEMON_NAME,BC_TextFactory.ID_CREATURE_DEMON_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var CREATURE_ANGEL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_ANGEL,1,1,BC_TextFactory.ID_CREATURE_ANGEL_NAME,BC_TextFactory.ID_CREATURE_ANGEL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var CREATURE_STEAM_BEHEMOT:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_ARTILLERY_9CASE,3,3,BC_TextFactory.ID_CREATURE_STEAM_BEHEMOT_NAME,BC_TextFactory.ID_CREATURE_STEAM_BEHEMOT_DESC,ModelProjectileEffectEnum.STEAM_BEHEMOT,ModelAttackEnum.STEAM_BEHEMOT,null,SET_PRIME,false);
      
      public static var CREATURE_DEATH:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_DEATH,1,1,BC_TextFactory.ID_CREATURE_DEATH_NAME,BC_TextFactory.ID_CREATURE_DEATH_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([TimedEffectEnum.DEATH]),SET_EXPANSION1,false);
      
      public static var CREATURE_FAMINE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_FAMINE,1,1,BC_TextFactory.ID_CREATURE_FAMINE_NAME,BC_TextFactory.ID_CREATURE_FAMINE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.FAMINE]),SET_EXPANSION1,false);
      
      public static var CREATURE_CONQUEST:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_CONQUEST,1,1,BC_TextFactory.ID_CREATURE_CONQUEST_NAME,BC_TextFactory.ID_CREATURE_CONQUEST_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.CONQUEST]),SET_EXPANSION1,false);
      
      public static var CREATURE_WAR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_WAR,1,1,BC_TextFactory.ID_CREATURE_WAR_NAME,BC_TextFactory.ID_CREATURE_WAR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.WAR]),SET_EXPANSION1,false);
      
      public static var WEAPON_IRONSWORD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_IRONSWORD_NAME,BC_TextFactory.ID_WEAPON_IRONSWORD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_SPEAR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_SPEAR_NAME,BC_TextFactory.ID_WEAPON_SPEAR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_MACE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_MACE_NAME,BC_TextFactory.ID_WEAPON_MACE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_AXE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_AXE_NAME,BC_TextFactory.ID_WEAPON_AXE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_2HSWORD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_2HAND,0,0,BC_TextFactory.ID_WEAPON_2HSWORD_NAME,BC_TextFactory.ID_WEAPON_2HSWORD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_2HAXE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_2HAND,0,0,BC_TextFactory.ID_WEAPON_2HAXE_NAME,BC_TextFactory.ID_WEAPON_2HAXE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_EXPANSION1,false);
      
      public static var WEAPON_2HMACE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_2HAND,0,0,BC_TextFactory.ID_WEAPON_2HMACE_NAME,BC_TextFactory.ID_WEAPON_2HMACE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_EXPANSION1,false);
      
      public static var WEAPON_PISTOL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_PISTOL,0,0,BC_TextFactory.ID_WEAPON_PISTOL_NAME,BC_TextFactory.ID_WEAPON_PISTOL_DESC,ModelProjectileEffectEnum.PISTOL,ModelAttackEnum.SINGLE_ATTACK,null,SET_EXPANSION1,false);
      
      public static var WEAPON_MUSKET:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_MUSKET,0,0,BC_TextFactory.ID_WEAPON_MUSKET_NAME,BC_TextFactory.ID_WEAPON_MUSKET_DESC,ModelProjectileEffectEnum.MUSKET,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_HALBERD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_HALBERD_NAME,BC_TextFactory.ID_WEAPON_HALBERD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_TORCH:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_TORCH_NAME,BC_TextFactory.ID_WEAPON_TORCH_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_EXPANSION1,false);
      
      public static var WEAPON_DAGGER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_DAGGER_NAME,BC_TextFactory.ID_WEAPON_DAGGER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_PIKE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_PIKE_NAME,BC_TextFactory.ID_WEAPON_PIKE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_WARHAMMER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_WARHAMMER_NAME,BC_TextFactory.ID_WEAPON_WARHAMMER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_EXPANSION1,false);
      
      public static var WEAPON_2HWARHAMMER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_2HAND,0,0,BC_TextFactory.ID_WEAPON_2HWARHAMMER_NAME,BC_TextFactory.ID_WEAPON_2HWARHAMMER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_FIRESTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_FIRESTAFF_NAME,BC_TextFactory.ID_WEAPON_FIRESTAFF_DESC,ModelProjectileEffectEnum.FIRESTAFF,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,true);
      
      public static var WEAPON_ICESTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_ICESTAFF_NAME,BC_TextFactory.ID_WEAPON_ICESTAFF_DESC,ModelProjectileEffectEnum.ICESTAFF,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,true);
      
      public static var WEAPON_POISONSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_POISONSTAFF_NAME,BC_TextFactory.ID_WEAPON_POISONSTAFF_DESC,ModelProjectileEffectEnum.POISONSTAFF,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,true);
      
      public static var WEAPON_THUNDERSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_THUNDERSTAFF_NAME,BC_TextFactory.ID_WEAPON_THUNDERSTAFF_DESC,ModelProjectileEffectEnum.THUNDERSTAFF,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,true);
      
      public static var WEAPON_DARKSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_DARKSTAFF_NAME,BC_TextFactory.ID_WEAPON_DARKSTAFF_DESC,ModelProjectileEffectEnum.DARKSTAFF,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,true);
      
      public static var WEAPON_HOLYSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_HOLYSTAFF_NAME,BC_TextFactory.ID_WEAPON_HOLYSTAFF_DESC,ModelProjectileEffectEnum.HOLYSTAFF,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,true);
      
      public static var WEAPON_LONGBOW:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_BOW,0,0,BC_TextFactory.ID_WEAPON_LONGBOW_NAME,BC_TextFactory.ID_WEAPON_LONGBOW_DESC,ModelProjectileEffectEnum.ARROW,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_COMPOSITEBOW:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_BOW,0,0,BC_TextFactory.ID_WEAPON_COMPOSITEBOW_NAME,BC_TextFactory.ID_WEAPON_COMPOSITEBOW_DESC,ModelProjectileEffectEnum.ARROW,ModelAttackEnum.SINGLE_ATTACK,null,SET_EXPANSION1,false);
      
      public static var WEAPON_SHORTBOW:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_BOW,0,0,BC_TextFactory.ID_WEAPON_SHORTBOW_NAME,BC_TextFactory.ID_WEAPON_SHORTBOW_DESC,ModelProjectileEffectEnum.ARROW,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_SWORDSMAN_FLAG:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_SWORDSMANFLAG_NAME,BC_TextFactory.ID_WEAPON_SWORDSMANFLAG_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.SWORDSMAN_FLAG]),SET_PRIME,false);
      
      public static var WEAPON_BARBARIAN_FLAG:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_BARBARIANFLAG_NAME,BC_TextFactory.ID_WEAPON_BARBARIANFLAG_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.BARBARIAN_FLAG]),SET_PRIME,false);
      
      public static var WEAPON_PIKEMAN_FLAG:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_PIKEMANFLAG_NAME,BC_TextFactory.ID_WEAPON_PIKEMANFLAG_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.PIKEMAN_FLAG]),SET_PRIME,false);
      
      public static var WEAPON_SAPPER_FLAG:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_SAPPERFLAG_NAME,BC_TextFactory.ID_WEAPON_SAPPERFLAG_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.SAPPER_FLAG]),SET_PRIME,false);
      
      public static var WEAPON_FLAME_FLAG:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_FLAMEFLAG_NAME,BC_TextFactory.ID_WEAPON_FLAMEFLAG_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.FLAME_FLAG]),SET_PRIME,false);
      
      public static var WEAPON_FROST_FLAG:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_FROSTFLAG_NAME,BC_TextFactory.ID_WEAPON_FROSTFLAG_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.FROST_FLAG]),SET_PRIME,false);
      
      public static var WEAPON_VIPER_FLAG:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_VIPERFLAG_NAME,BC_TextFactory.ID_WEAPON_VIPERFLAG_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.VIPER_FLAG]),SET_PRIME,false);
      
      public static var WEAPON_BOLT_FLAG:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_BOLTFLAG_NAME,BC_TextFactory.ID_WEAPON_BOLTFLAG_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.BOLT_FLAG]),SET_PRIME,false);
      
      public static var WEAPON_CULT_FLAG:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_CULTFLAG_NAME,BC_TextFactory.ID_WEAPON_CULTFLAG_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.CULT_FLAG]),SET_PRIME,false);
      
      public static var WEAPON_CLERIC_FLAG:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_CLERICFLAG_NAME,BC_TextFactory.ID_WEAPON_CLERICFLAG_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.CLERIC_FLAG]),SET_PRIME,false);
      
      public static var WEAPON_TOWER_FLAG:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_TOWERFLAG_NAME,BC_TextFactory.ID_WEAPON_TOWERFLAG_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.TOWER_FLAG]),SET_PRIME,false);
      
      public static var WEAPON_FIRESWORD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_FIRESWORD_NAME,BC_TextFactory.ID_WEAPON_FIRESOWRD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_ICEPIKE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_ICEPIKE_NAME,BC_TextFactory.ID_WEAPON_ICEPIKE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_BOOMSTICK:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_MUSKET,0,0,BC_TextFactory.ID_WEAPON_BOOMSTICK_NAME,BC_TextFactory.ID_WEAPON_BOOMSTICK_DESC,ModelProjectileEffectEnum.MUSKET,ModelAttackEnum.SINGLE_ATTACK,null,SET_EXPANSION1,false);
      
      public static var WEAPON_SHRAPNELMUSKET:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_MUSKET,0,0,BC_TextFactory.ID_WEAPON_SHRAPNELMUSKET_NAME,BC_TextFactory.ID_WEAPON_SHRAPNELMUSKET_DESC,ModelProjectileEffectEnum.MUSKET,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_REPTILIANDAGGER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_REPTILIANDAGGER_NAME,BC_TextFactory.ID_WEAPON_REPTILIANDAGGER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_ORCISHHAMMER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_2HAND,0,0,BC_TextFactory.ID_WEAPON_ORCISHHAMMER_NAME,BC_TextFactory.ID_WEAPON_ORCISHHAMMER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_LIGHTNINGBOW:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_BOW,0,0,BC_TextFactory.ID_WEAPON_LIGHTNINGBOW_NAME,BC_TextFactory.ID_WEAPON_LIGHTNINGBOW_DESC,ModelProjectileEffectEnum.ARROW,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_FIREBOW:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_BOW,0,0,BC_TextFactory.ID_WEAPON_FIREBOW_NAME,BC_TextFactory.ID_WEAPON_FIREBOW_DESC,ModelProjectileEffectEnum.ARROW,ModelAttackEnum.SINGLE_ATTACK,null,SET_EXPANSION1,false);
      
      public static var WEAPON_POISONBOW:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_BOW,0,0,BC_TextFactory.ID_WEAPON_POISONBOW_NAME,BC_TextFactory.ID_WEAPON_POISONBOW_DESC,ModelProjectileEffectEnum.ARROW,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_POWERAXE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_POWERAXE_NAME,BC_TextFactory.ID_WEAPON_POWERAXE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_CRUSADERMACE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_CRUSADERMACE_NAME,BC_TextFactory.ID_WEAPON_CRUSADERMACE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_BLACKSWORD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_BLACKSWORD_NAME,BC_TextFactory.ID_WEAPON_BLACKSWORD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_COBRASPEAR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_COBRASPEAR_NAME,BC_TextFactory.ID_WEAPON_COBRASPEAR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_FIREBLASTSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_FIREBLASTSTAFF_NAME,BC_TextFactory.ID_WEAPON_FIREBLASTSTAFF_DESC,ModelProjectileEffectEnum.FIREBLASTSTAFF,ModelAttackEnum.CASTSQUADFRONTLINE,null,SET_PRIME,true);
      
      public static var WEAPON_BLAZINGSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_BLAZINGSTAFF_NAME,BC_TextFactory.ID_WEAPON_BLAZINGSTAFF_DESC,ModelProjectileEffectEnum.BLAZINGSTAFF,ModelAttackEnum.CASTAOEMELEE,null,SET_EXPANSION1,true);
      
      public static var WEAPON_ICESTORMSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_ICESTORMSTAFF_NAME,BC_TextFactory.ID_WEAPON_ICESTORMSTAFF_DESC,ModelProjectileEffectEnum.ICESTORMSTAFF,ModelAttackEnum.CASTSQUADFRONTLINE,null,SET_PRIME,true);
      
      public static var WEAPON_FROSTBITESTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_FROSTBITESTAFF_NAME,BC_TextFactory.ID_WEAPON_FROSTBITESTAFF_DESC,ModelProjectileEffectEnum.FROSTBITESTAFF,ModelAttackEnum.CASTAOEMELEE,null,SET_EXPANSION1,true);
      
      public static var WEAPON_ACIDRAINSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_ACIDRAINSTAFF_NAME,BC_TextFactory.ID_WEAPON_ACIDRAINSTAFF_DESC,ModelProjectileEffectEnum.ACIDRAINSTAFF,ModelAttackEnum.CASTSQUADFRONTLINE,null,SET_PRIME,true);
      
      public static var WEAPON_PLAGUESTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_PLAGUESTAFF_NAME,BC_TextFactory.ID_WEAPON_PLAGUESTAFF_DESC,ModelProjectileEffectEnum.PLAGUESTAFF,ModelAttackEnum.CASTAOEMELEE,null,SET_EXPANSION1,true);
      
      public static var WEAPON_LIGHTNINGSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_LIGHTNINGSTAFF_NAME,BC_TextFactory.ID_WEAPON_LIGHTNINGSTAFF_DESC,ModelProjectileEffectEnum.LIGHTNINGSTAFF,ModelAttackEnum.CASTSQUADFRONTLINE,null,SET_PRIME,true);
      
      public static var WEAPON_THUNDERSTORMSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_THUNDERSTORMSTAFF_NAME,BC_TextFactory.ID_WEAPON_THUNDERSTORMSTAFF_DESC,ModelProjectileEffectEnum.THUNDERSTORMSTAFF,ModelAttackEnum.CASTAOEMELEE,null,SET_EXPANSION1,true);
      
      public static var WEAPON_ANGELICSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_ANGELICSTAFF_NAME,BC_TextFactory.ID_WEAPON_ANGELICSTAFF_DESC,ModelProjectileEffectEnum.HOLYSTAFF,ModelAttackEnum.CASTBUFFSQUADSINGLEATTACK,null,SET_PRIME,true);
      
      public static var WEAPON_DEMONICSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_DEMONICSTAFF_NAME,BC_TextFactory.ID_WEAPON_DEMONICSTAFF_DESC,ModelProjectileEffectEnum.DARKSTAFF,ModelAttackEnum.CASTBUFFSQUADSINGLEATTACK,null,SET_PRIME,true);
      
      public static var WEAPON_PYROBLADE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_PYROBLADE_NAME,BC_TextFactory.ID_WEAPON_PYROBLADE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([onAttackEffectEnum.PYRO_BLADE]),SET_PRIME,true);
      
      public static var WEAPON_BOLTHAMMER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_BOLTHAMMER_NAME,BC_TextFactory.ID_WEAPON_BOLTHAMMER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([onAttackEffectEnum.BOLT_HAMMER]),SET_PRIME,true);
      
      public static var WEAPON_NECRONBLADE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_NECRONBLADE_NAME,BC_TextFactory.ID_WEAPON_NECRONBLADE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([onKillEffectEnum.NECRON_BLADE]),SET_PRIME,false);
      
      public static var WEAPON_PLAGUESPIKE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_PLAGUESPIKE_NAME,BC_TextFactory.ID_WEAPON_PLAGUESPIKE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([onAttackEffectEnum.PLAGUE_SPIKE]),SET_PRIME,false);
      
      public static var WEAPON_FROSTAXE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_FROSTAXE_NAME,BC_TextFactory.ID_WEAPON_FROSTAXE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([onAttackEffectEnum.FROST_AXE]),SET_PRIME,false);
      
      public static var WEAPON_SAINTBLADE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_SAINTBLADE_NAME,BC_TextFactory.ID_WEAPON_SAINTBLADE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([onKillEffectEnum.SAINT_BLADE]),SET_PRIME,false);
      
      public static var WEAPON_BLASTHAMMER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_2HAND,0,0,BC_TextFactory.ID_WEAPON_BLASTHAMMER_NAME,BC_TextFactory.ID_WEAPON_BLASTHAMMER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_WARBOW:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_BOW,0,0,BC_TextFactory.ID_WEAPON_WARBOW_NAME,BC_TextFactory.ID_WEAPON_WARBOW_DESC,ModelProjectileEffectEnum.ARROW,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_COMPOSITESWORD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_COMPOSITESWORD_NAME,BC_TextFactory.ID_WEAPON_COMPOSITESWORD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_POWERHAMMER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_POWERHAMMER_NAME,BC_TextFactory.ID_WEAPON_POWERHAMMER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_EXPANSION1,false);
      
      public static var WEAPON_SOLARSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_SOLARSTAFF_NAME,BC_TextFactory.ID_WEAPON_SOLARSTAFF_DESC,ModelProjectileEffectEnum.SOLARSTAFF,ModelAttackEnum.CASTALLUNITS,null,SET_PRIME,true);
      
      public static var WEAPON_ARMAGEDONSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_ARMAGEDONSTAFF_NAME,BC_TextFactory.ID_WEAPON_ARMAGEDONSTAFF_DESC,ModelProjectileEffectEnum.ARMAGEDONSTAFF,ModelAttackEnum.CASTENEMYUNITS,null,SET_PRIME,true);
      
      public static var WEAPON_OKKORAZSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_OKKORAZSTAFF_NAME,BC_TextFactory.ID_WEAPON_OKKORAZSTAFF_DESC,ModelProjectileEffectEnum.OKKORAZSTAFF,ModelAttackEnum.CASTFULLLINE,null,SET_PRIME,true);
      
      public static var WEAPON_ORYTHSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_ORYTHSTAFF_NAME,BC_TextFactory.ID_WEAPON_ORYTHSTAFF_DESC,ModelProjectileEffectEnum.ORYTHSTAFF,ModelAttackEnum.MORPHDEMON,null,SET_EXPANSION1,true);
      
      public static var WEAPON_VASSPOTANAXSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_VASSPOTANAXSTAFF_NAME,BC_TextFactory.ID_WEAPON_VASSPOTANAXSTAFF_DESC,ModelProjectileEffectEnum.VASSPOTANAXSTAFF,ModelAttackEnum.CASTALLUNITS,null,SET_PRIME,true);
      
      public static var WEAPON_MAGICSWORD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_MAGICSWORD_NAME,BC_TextFactory.ID_WEAPON_MAGICSWORD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_ULTIMASTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_ULTIMASTAFF_NAME,BC_TextFactory.ID_WEAPON_ULTIMASTAFF_DESC,ModelProjectileEffectEnum.THUNDERSTAFF,ModelAttackEnum.CASTBUFFSQUADSINGLEATTACK,Vector.<SpecialEffect>([AuraEnum.ULTIMA_STAFF]),SET_PRIME,true);
      
      public static var WEAPON_YASURSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_YASURSTAFF_NAME,BC_TextFactory.ID_WEAPON_YASURSTAFF_DESC,ModelProjectileEffectEnum.YASURSTAFF,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,true);
      
      public static var WEAPON_XONAXSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_XONAXSTAFF_NAME,BC_TextFactory.ID_WEAPON_XONAXSTAFF_DESC,ModelProjectileEffectEnum.XONAXSTAFF,ModelAttackEnum.CASTALLUNITS,Vector.<SpecialEffect>([AuraEnum.XONAXSTAFF]),SET_PRIME,true);
      
      public static var WEAPON_ZAMAROTHSWORD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_ZAMAROTHSWORD_NAME,BC_TextFactory.ID_WEAPON_ZAMAROTHSWORD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([TimedEffectEnum.ZAMAROTH_SWORD_DMG,TimedEffectEnum.ZAMAROTH_SWORD_STATS]),SET_EXPANSION1,true);
      
      public static var WEAPON_IMRAILHMACE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_IMRAILHMACE_NAME,BC_TextFactory.ID_WEAPON_IMRAILHMACE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([TimedEffectEnum.IMRAILL_MACE]),SET_PRIME,true);
      
      public static var WEAPON_QUATIAZSWORD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_QUATIAZSWORD_NAME,BC_TextFactory.ID_WEAPON_QUATIAZSWORD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.QUATIAZSWORD]),SET_PRIME,false);
      
      public static var WEAPON_RHIGARBOW:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_BOW,0,0,BC_TextFactory.ID_WEAPON_RHIGARBOW_NAME,BC_TextFactory.ID_WEAPON_RHIGARBOW_DESC,ModelProjectileEffectEnum.ARROW,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_AZARATIUSAXE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_AZARATIUSAXE_NAME,BC_TextFactory.ID_WEAPON_AZARATIUSAXE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([TimedEffectEnum.AZARATIUS_AXE]),SET_EXPANSION1,true);
      
      public static var WEAPON_METABLADE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_2HAND,0,0,BC_TextFactory.ID_WEAPON_METABLADE_NAME,BC_TextFactory.ID_WEAPON_METABLADE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var WEAPON_GORDAKARHAMMER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_2HAND,0,0,BC_TextFactory.ID_WEAPON_GORDAKARHAMMER_NAME,BC_TextFactory.ID_WEAPON_GORDAKARHAMMER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_PRIME,false);
      
      public static var SHIELD_WOODENSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_WOODENSHIELD_NAME,BC_TextFactory.ID_SHIELD_WOODENSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_ROUNDSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_ROUNDSHIELD_NAME,BC_TextFactory.ID_SHIELD_ROUNDSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_IRONSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_IRONSHIELD_NAME,BC_TextFactory.ID_SHIELD_IRONSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_BUCKLER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_BUKLER_NAME,BC_TextFactory.ID_SHIELD_BUKLER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_STEELSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_STEELSHIELD_NAME,BC_TextFactory.ID_SHIELD_STEELSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_TOWERSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_TOWERSHIELD_NAME,BC_TextFactory.ID_SHIELD_TOWERSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_SPIKEDBUCKLER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_SPIKEDBUKLER_NAME,BC_TextFactory.ID_SHIELD_SPIKEDBUKLER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_SPIKEDSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_SPIKEDSHIELD_NAME,BC_TextFactory.ID_SHIELD_SPIKEDSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SHIELD_ROTTENSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_ROTTENSHIELD_NAME,BC_TextFactory.ID_SHIELD_ROTTENSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SHIELD_PARRYINGDAGGER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_PARRYINGDAGGER_NAME,BC_TextFactory.ID_SHIELD_PARRYINGDAGGER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_CRYSTALORB:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_CRYSTALORB_NAME,BC_TextFactory.ID_SHIELD_CRYSTALORB_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SHIELD_SAPPERSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_SAPPERSHIELD_NAME,BC_TextFactory.ID_SHIELD_SAPPERSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_CURSEDSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_CURSEDSHIELD_NAME,BC_TextFactory.ID_SHIELD_CURSEDSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SHIELD_KITESHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_KITESHIELD_NAME,BC_TextFactory.ID_SHIELD_KITESHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_SMALLKITESHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_SMALLKITESHIELD_NAME,BC_TextFactory.ID_SHIELD_SMALLKITESHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_PRIESTHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_PRIESTSHIELD_NAME,BC_TextFactory.ID_SHIELD_PRIESTSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SHIELD_CULTISTSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_CULTISTSHIELD_NAME,BC_TextFactory.ID_SHIELD_CULTISTSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SHIELD_NECROPOLSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_NECROPOLSHIELD_NAME,BC_TextFactory.ID_SHIELD_NECROPOLSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_INQUISITORSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_INQUISITORSHIELD_NAME,BC_TextFactory.ID_SHIELD_INQUISITORSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_DUELISTBUCKLET:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_DUELISTBUCKLET_NAME,BC_TextFactory.ID_SHIELD_DUELISTBUCKLET_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_HEROSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_HEROSHIELD_NAME,BC_TextFactory.ID_SHIELD_HEROSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SHIELD_ASSASSINSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_ASSASSINSHIELD_NAME,BC_TextFactory.ID_SHIELD_ASSASSINSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_FIREPARRYINGBLADE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_FIREPARRYINGBLADE_NAME,BC_TextFactory.ID_SHIELD_FIREPARRYINGBLADE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_ICEBUCKLER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_ICEBUCKLER_NAME,BC_TextFactory.ID_SHIELD_ICEBUCKLER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_PLAGUESHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_PLAGUESHIELD_NAME,BC_TextFactory.ID_SHIELD_PLAGUESHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_EXPERIMENTALSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_EXPERIMENTALSHIELD_NAME,BC_TextFactory.ID_SHIELD_EXPERIMENTALSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_MAGNETICSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_MAGNETICSHIELD_NAME,BC_TextFactory.ID_SHIELD_MAGNETICSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SHIELD_BEASTSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_BEASTSHIELD_NAME,BC_TextFactory.ID_SHIELD_BEASTSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SHIELD_MIRRORSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_MIRRORSHIELD_NAME,BC_TextFactory.ID_SHIELD_MIRRORSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_CRAFTMENSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_CRAFTMENSHIELD_NAME,BC_TextFactory.ID_SHIELD_CRAFTMENSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SHIELD_PORCUPINESHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_PORCUPINESHIELD_NAME,BC_TextFactory.ID_SHIELD_PORCUPINESHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_GLADIATORSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_GLADIATORSHIELD_NAME,BC_TextFactory.ID_SHIELD_GLADIATORSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SHIELD_STORMSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_STORMSHIELD_NAME,BC_TextFactory.ID_SHIELD_STORMSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_CERIPHYRBUCKLER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_CERIPHYRBUCKLER_NAME,BC_TextFactory.ID_SHIELD_CERIPHYRBUCKLER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SHIELD_BAXSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_BAXSHIELD_NAME,BC_TextFactory.ID_SHIELD_BAXSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.BAX_SHIELD]),SET_EXPANSION1,false);
      
      public static var SHIELD_COMPOSITESHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_COMPOSITESHIELDSHIELD_NAME,BC_TextFactory.ID_SHIELD_COMPOSITESHIELDSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_QUATIAZSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_QUATIAZSHIELDSHIELD_NAME,BC_TextFactory.ID_SHIELD_QUATIAZSHIELDSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_NARMNSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_NARMNSHIELDSHIELD_NAME,BC_TextFactory.ID_SHIELD_NARMNSHIELDSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_XONAXBUCKLER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_XONAXBUCKLER_NAME,BC_TextFactory.ID_SHIELD_XONAXBUCKLER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.XONAX_BUCKLER]),SET_EXPANSION1,false);
      
      public static var SHIELD_MOKDARSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_MOKDARSHIELD_NAME,BC_TextFactory.ID_SHIELD_MOKDARSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.MOKDAR_SHIELD]),SET_PRIME,false);
      
      public static var SHIELD_TULORANPROTECTION:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_TULORANPROTECTION_NAME,BC_TextFactory.ID_SHIELD_TULORANPROTECTION_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_XONAXSKIN:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_XONAXSKIN_NAME,BC_TextFactory.ID_SHIELD_XONAXSKIN_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([TimedEffectEnum.XONAX_SKIN]),SET_EXPANSION1,false);
      
      public static var SHIELD_AODANSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_AODANSHIELD_NAME,BC_TextFactory.ID_SHIELD_AODANSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.AODAN_SHIELD]),SET_PRIME,false);
      
      public static var SHIELD_AZARATIUSSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_AZARATIUSSHIELD_NAME,BC_TextFactory.ID_SHIELD_AZARATIUSSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SHIELD_GORDAKARSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_GORDAKARSHIELD_NAME,BC_TextFactory.ID_SHIELD_GORDAKARSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.GORDAKAR_SHIELD]),SET_EXPANSION1,false);
      
      public static var SHIELD_ORYTHSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_ORYTHSHIELD_NAME,BC_TextFactory.ID_SHIELD_ORYTHSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.ORYTH_SHIELD]),SET_EXPANSION1,false);
      
      public static var SHIELD_ULTRASHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_ULTRASHIELD_NAME,BC_TextFactory.ID_SHIELD_ULTRASHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.ULTRA_SHIELD]),SET_PRIME,false);
      
      public static var SHIELD_CERIPHYRSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_CERIPHYRSHIELD_NAME,BC_TextFactory.ID_SHIELD_CERIPHYRSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_PLATEARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_PLATEARMOR_NAME,BC_TextFactory.ID_ARMOR_PLATEARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_CHAINMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_CHAINMAIL_NAME,BC_TextFactory.ID_ARMOR_CHAINMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_SCALEMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_SCALEMAIL_NAME,BC_TextFactory.ID_ARMOR_SCALEMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_HAUBERT:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_HAUBERT_NAME,BC_TextFactory.ID_ARMOR_HAUBERT_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_BLACKARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_BLACKARMOR_NAME,BC_TextFactory.ID_ARMOR_BLACKARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var ARMOR_HALFPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_HALFPLATE_NAME,BC_TextFactory.ID_ARMOR_HALFPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_STUDDEDLEATHER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_STUDDEDLEATHER_NAME,BC_TextFactory.ID_ARMOR_STUDDEDLEATHER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_LEATHER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_LEATHER_NAME,BC_TextFactory.ID_ARMOR_LEATHER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var ARMOR_GAMBESON:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_GAMBESON_NAME,BC_TextFactory.ID_ARMOR_GAMBESON_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_FURARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_FURARMOR_NAME,BC_TextFactory.ID_ARMOR_FURARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_BOILEDLEATHER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_BOILEDLEATHER_NAME,BC_TextFactory.ID_ARMOR_BOILEDLEATHER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_SPIKEDLEATHER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_SPIKEDLEATHER_NAME,BC_TextFactory.ID_ARMOR_SPIKEDLEATHER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_RAG:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_RAG_NAME,BC_TextFactory.ID_ARMOR_RAG_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_APPRENTICEROBE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_APPRENTICEROBE_NAME,BC_TextFactory.ID_ARMOR_APPRENTICEROBE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_MAGEROBE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_MAGEROBE_NAME,BC_TextFactory.ID_ARMOR_MAGEROBE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([StatsModifierEnum.MAGE_ROBE_MODIFIER]),SET_PRIME,false);
      
      public static var ARMOR_SPIKEARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_SPIKEDARMOR_NAME,BC_TextFactory.ID_ARMOR_SPIKEDARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var ARMOR_ROTTENPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_ROTTENPLATE_NAME,BC_TextFactory.ID_ARMOR_ROTTENPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var ARMOR_CLERICMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_CLERICMAIL_NAME,BC_TextFactory.ID_ARMOR_CLERICMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var ARMOR_TAINTEDPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_TAINTEDPLATE_NAME,BC_TextFactory.ID_ARMOR_TAINTEDPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var ARMOR_ADVENTURERCLOTH:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_ADVENTURERCLOTH_NAME,BC_TextFactory.ID_ARMOR_ADVENTURERCLOTH_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var ARMOR_SAPPERARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_SAPPERARMOR_NAME,BC_TextFactory.ID_ARMOR_SAPPERARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_ICYROBE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_ICYROBE_NAME,BC_TextFactory.ID_ARMOR_ICYROBE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([StatsModifierEnum.ICY_ROBE_MODIFIER]),SET_EXPANSION1,false);
      
      public static var ARMOR_ROGUEARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_ROGUEARMOR_NAME,BC_TextFactory.ID_ARMOR_ROGUEARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_HEAVYPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_HEAVYPLATE_NAME,BC_TextFactory.ID_ARMOR_HEAVYPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_ROTTENMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_ROTTENMAIL_NAME,BC_TextFactory.ID_ARMOR_ROTTENMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var ARMOR_CULTISTROBE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_CULTISTROBE_NAME,BC_TextFactory.ID_ARMOR_CULTISTROBE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([DieEffectEnum.CULTIST_ROBE]),SET_PRIME,false);
      
      public static var ARMOR_MERCENARYPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_MERCENARYPLATE_NAME,BC_TextFactory.ID_ARMOR_MERCENARYPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_CHAINMAILOFHATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_CHAINMAILOFHATE_NAME,BC_TextFactory.ID_ARMOR_CHAINMAILOFHATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var ARMOR_CORRUPTEDMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_CORRUPTEDMAIL_NAME,BC_TextFactory.ID_ARMOR_CORRUPTEDMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_LIGHTNINGROBE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_LIGHTNINGCULTROBE_NAME,BC_TextFactory.ID_ARMOR_LIGHTNINGCULTROBE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_ENGINEERAPRON:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_ENGINEERAPRON_NAME,BC_TextFactory.ID_ARMOR_ENGINEERAPRON_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_EVILMANPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_EVILMANPLATE_NAME,BC_TextFactory.ID_ARMOR_EVILMANPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var ARMOR_BROTHERCHAINMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_BROTHERHOODCHAINMAIL_NAME,BC_TextFactory.ID_ARMOR_BROTHERHOODCHAINMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_GUARDHAUBERT:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_GUARDHAUBERT_NAME,BC_TextFactory.ID_ARMOR_GUARDHAUBERT_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var ARMOR_LUMINARYMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_LUMINARYMAIL_NAME,BC_TextFactory.ID_ARMOR_LUMINARYMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([TimedEffectEnum.REGEN_LUMINARYMAIL]),SET_PRIME,false);
      
      public static var ARMOR_SWAMPMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_SWAMPMAIL_NAME,BC_TextFactory.ID_ARMOR_SWAMPMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_LIGHTEDPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_LIGHTEDPLATE_NAME,BC_TextFactory.ID_ARMOR_LIGHTEDPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_BARBARIANARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_BARBARIANARMOR_NAME,BC_TextFactory.ID_ARMOR_BARBARIANARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_NECROPOLMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_NECROPOLMAIL_NAME,BC_TextFactory.ID_ARMOR_NECROPOLMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.NECROPOL_MAIL]),SET_PRIME,false);
      
      public static var ARMOR_CURSEDARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_CURSEDARMOR_NAME,BC_TextFactory.ID_ARMOR_CURSEDARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_BLESSEDARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_BLESSEDARMOR_NAME,BC_TextFactory.ID_ARMOR_BLESSEDARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_DEFLAGRATIONSCALE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_DEFLAGRATIONSCALE_NAME,BC_TextFactory.ID_ARMOR_DEFLAGRATIONSCALE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([DieEffectEnum.DEFLAGRATION_SCALE]),SET_PRIME,false);
      
      public static var ARMOR_MAGMABREASTPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_MAGMABREASTPLATE_NAME,BC_TextFactory.ID_ARMOR_MAGMABREASTPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([DieEffectEnum.MAGMA_BREASTPLATE]),SET_EXPANSION1,false);
      
      public static var ARMOR_MITHRILMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_MITHRILMAIL_NAME,BC_TextFactory.ID_ARMOR_MITHRILMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_BATTLEMAGEPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_BATTLEMAGEPLATE_NAME,BC_TextFactory.ID_ARMOR_BATTLEMAGEPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_NARMNPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_NARMNPLATE_NAME,BC_TextFactory.ID_ARMOR_NARMNPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_ANGELPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_ANGELPLATE_NAME,BC_TextFactory.ID_ARMOR_ANGELPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.ANGEL_PLATE]),SET_EXPANSION1,false);
      
      public static var ARMOR_UNHOLYPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_UNHOLYPLATE_NAME,BC_TextFactory.ID_ARMOR_UNHOLYPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.UNHOLY_PLATE]),SET_EXPANSION1,false);
      
      public static var ARMOR_PYROMANCERMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_PYROMANCERMAIL_NAME,BC_TextFactory.ID_ARMOR_PYROMANCERMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_POWERARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_POWERARMOR_NAME,BC_TextFactory.ID_ARMOR_POWERARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_NATAOBETHPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_NATAOBETHPLATE_NAME,BC_TextFactory.ID_ARMOR_NATAOBETHPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([DieEffectEnum.NATAOBETH_PLATE_EXPLODE,DieEffectEnum.NATAOBETH_PLATE_RAISE]),SET_EXPANSION1,false);
      
      public static var ARMOR_BAXROBE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_BAXROBE_NAME,BC_TextFactory.ID_ARMOR_BAXROBE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([DieEffectEnum.BAX_ROBE]),SET_EXPANSION1,false);
      
      public static var ARMOR_QUAEKMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_QUAEKMAIL_NAME,BC_TextFactory.ID_ARMOR_QUAEKMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var ARMOR_EMPIREARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_EMPIREARMOR_NAME,BC_TextFactory.ID_ARMOR_EMPIREARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.EMPIRE_ARMOR]),SET_PRIME,false);
      
      public static var ARMOR_NECROGEAR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_NECROGEAR_NAME,BC_TextFactory.ID_ARMOR_NECROGEAR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([TimedEffectEnum.NECRO_GEAR]),SET_PRIME,false);
      
      public static var ARMOR_ARCHMAGEMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_ARCHMAGEMAIL_NAME,BC_TextFactory.ID_ARMOR_ARCHMAGEMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([StatsModifierEnum.ARCHMAGE_MAIL_MODIFIER]),SET_PRIME,false);
      
      public static var ARMOR_IMMORTALARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_IMMORTALARMOR_NAME,BC_TextFactory.ID_ARMOR_IMMORTALARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([DieEffectEnum.IMMORTAL_ARMOR]),SET_PRIME,false);
      
      public static var ARMOR_TULORANPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_TULORANPLATE_NAME,BC_TextFactory.ID_ARMOR_TULORANPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([onStartEffectEnum.TULORAN_PLATE,AuraEnum.TULORAN_PLATE]),SET_EXPANSION1,false);
      
      public static var ARMOR_YASURARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_YASURARMOR_NAME,BC_TextFactory.ID_ARMOR_YASURARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.YASUR_ARMOR]),SET_EXPANSION1,false);
      
      public static var ARMOR_XONAXMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_XONAXMAIL_NAME,BC_TextFactory.ID_ARMOR_XONAXMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.XONAX_MAIL,TimedEffectEnum.XONAX_MAIL]),SET_EXPANSION1,false);
      
      public static var ARMOR_VASSPOTANAXPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_VASSPOTANAXPLATE_NAME,BC_TextFactory.ID_ARMOR_VASSPOTANAXPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.VASSPOTANAX_PLATE]),SET_PRIME,false);
      
      public static var ARMOR_UNTMORIPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_UNTMORIPLATE_NAME,BC_TextFactory.ID_ARMOR_UNTMORIPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([DieEffectEnum.UNTMORI_PLATE]),SET_PRIME,false);
      
      public static var ARMOR_UMENTHARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_UMENTHARMOR_NAME,BC_TextFactory.ID_ARMOR_UMENTHARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([StatsModifierEnum.UMENTH_ARMOR_MODIFIER]),SET_PRIME,false);
      
      public static var ARMOR_GORDAKARPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_GORDAKARPLATE_NAME,BC_TextFactory.ID_ARMOR_GORDAKARPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.GORDAKAR_PLATE]),SET_PRIME,false);
      
      public static var ARMOR_AZARATIUSORB:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_AZARATIUSORB_NAME,BC_TextFactory.ID_ARMOR_AZARATIUSORB_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.AZARATIUS_ORB]),SET_PRIME,false);
      
      public static var ARMOR_OKKORAZVEST:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_OKKORAZVEST_NAME,BC_TextFactory.ID_ARMOR_OKKORAZVEST_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_HORSE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL_HORSE,1,0,BC_TextFactory.ID_SPECIAL_HORSE_NAME,BC_TextFactory.ID_SPECIAL_HORSE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_HEAVYHORSE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL_HORSE,1,0,BC_TextFactory.ID_SPECIAL_HEAVYHORSE_NAME,BC_TextFactory.ID_SPECIAL_HEAVYHORSE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SPECIAL_SHIELDRING:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_SHIELDRING_NAME,BC_TextFactory.ID_SPECIAL_SHIELDRING_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_WIZARDRING:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_WIZARDRING_NAME,BC_TextFactory.ID_SPECIAL_WIZARDRING_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([StatsModifierEnum.WIZARD_RING_MODIFIER]),SET_PRIME,false);
      
      public static var SPECIAL_POWERRING:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_POWERRING_NAME,BC_TextFactory.ID_SPECIAL_POWERRING_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SPECIAL_BOAR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL_BOAR,1,0,BC_TextFactory.ID_SPECIAL_BOAR_NAME,BC_TextFactory.ID_SPECIAL_BOAR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_REGENNECKLACE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_REGENNECKLACE_NAME,BC_TextFactory.ID_SPECIAL_REGENNECKLACE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([TimedEffectEnum.REGEN_NECKLACE]),SET_PRIME,false);
      
      public static var SPECIAL_SOLDIERORB:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_SOLDIERORB_NAME,BC_TextFactory.ID_SPECIAL_SOLDIERORB_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([TimedEffectEnum.REGEN_SOLDIERORB]),SET_EXPANSION1,false);
      
      public static var SPECIAL_TIMESLOWRING:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_TIMESLOWRING_NAME,BC_TextFactory.ID_SPECIAL_TIMESLOWRING_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([StatsModifierEnum.TIMESLOW_RING_MODIFIER]),SET_PRIME,false);
      
      public static var SPECIAL_CHARGEHORSE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL_HORSE,1,0,BC_TextFactory.ID_SPECIAL_CHARGEHORSE_NAME,BC_TextFactory.ID_SPECIAL_CHARGEHORSE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_PARADEHORSE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL_HORSE,1,0,BC_TextFactory.ID_SPECIAL_PARADEHORSE_NAME,BC_TextFactory.ID_SPECIAL_PARADEHORSE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SPECIAL_CURSEDRING:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_CURSEDRING_NAME,BC_TextFactory.ID_SPECIAL_CURSEDRING_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([StatsModifierEnum.CURSED_RING]),SET_PRIME,false);
      
      public static var SPECIAL_SAINTHANDRELIC:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_SAINTHANDRELIC_NAME,BC_TextFactory.ID_SPECIAL_SAINTHANDRELIC_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_CULTISTHANDRELIC:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_CULTISTHANDRELIC_NAME,BC_TextFactory.ID_SPECIAL_CULTISTHANDRELIC_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_BUTCHERBOOK:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_BUTCHERBOOK_NAME,BC_TextFactory.ID_SPECIAL_BUTCHERBOOK_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_POLARBEARHAND:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_POLARBEARHAND_NAME,BC_TextFactory.ID_SPECIAL_POLARBEARHAND_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_DRYEELBELT:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_DRYEELBELT_NAME,BC_TextFactory.ID_SPECIAL_DRYEELBELT_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_POISONBOTTLE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_POISONBOTTLE_NAME,BC_TextFactory.ID_SPECIAL_POISONBOTTLE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_RHINO:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL_BOAR,1,0,BC_TextFactory.ID_SPECIAL_RHINO_NAME,BC_TextFactory.ID_SPECIAL_RHINO_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_ARCHERBRACER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_ARCHERBRACER_NAME,BC_TextFactory.ID_SPECIAL_ARCHERBRACER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SPECIAL_OGREBRACER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_OGREBRACER_NAME,BC_TextFactory.ID_SPECIAL_OGREBRACER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_MAGMAEMBLEM:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_MAGMAEMBLEM_NAME,BC_TextFactory.ID_SPECIAL_MAGMAEMBLEM_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_SAPPERNECKLACE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_SAPPERNECKLACE_NAME,BC_TextFactory.ID_SPECIAL_SAPPERNECKLACE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_TIMEWARPRING:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_TIMEWARPRING_NAME,BC_TextFactory.ID_SPECIAL_TIMEWARPRING_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([StatsModifierEnum.TIMEWARP_RING_MODIFIER]),SET_PRIME,false);
      
      public static var SPECIAL_MAGNETICRING:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_MAGNETICRING_NAME,BC_TextFactory.ID_SPECIAL_MAGNETICRING_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_EXPANSION1,false);
      
      public static var SPECIAL_TRIBALCHIEFCROWN:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_TRIBALCHIEFCROWN_NAME,BC_TextFactory.ID_SPECIAL_TRIBALCHIEFCROWN_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_MERCENARYGAUNTLET:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_MERCENARYGAUNTLET_NAME,BC_TextFactory.ID_SPECIAL_MERCENARYGAUNTLET_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_UNDEADHORSE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL_HORSE,1,0,BC_TextFactory.ID_SPECIAL_UNDEADHORSE_NAME,BC_TextFactory.ID_SPECIAL_UNDEADHORSE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([DieEffectEnum.UNDEAD_HORSE]),SET_PRIME,false);
      
      public static var SPECIAL_LUMINARYRING:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_LUMINARYRING_NAME,BC_TextFactory.ID_SPECIAL_LUMINARYRING_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([StatsModifierEnum.LUMINARY_RING_MODIFIER]),SET_EXPANSION1,false);
      
      public static var SPECIAL_QUAEKTALISMAN:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_QUAEKTALISMAN_NAME,BC_TextFactory.ID_SPECIAL_QUAEKTALISMAN_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.QUAEK_TALISMAN]),SET_EXPANSION1,false);
      
      public static var SPECIAL_WARHORSE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL_HORSE,1,0,BC_TextFactory.ID_SPECIAL_WARHORSE_NAME,BC_TextFactory.ID_SPECIAL_WARHORSE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_PRIME,false);
      
      public static var SPECIAL_MECHANICALBEAST:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL_BOAR,1,0,BC_TextFactory.ID_SPECIAL_MECHANICALBEAST_NAME,BC_TextFactory.ID_SPECIAL_MECHANICALBEAST_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([onKillEffectEnum.MECH_BEAST]),SET_PRIME,false);
      
      public static var SPECIAL_STATICORB:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_STATICORB_NAME,BC_TextFactory.ID_SPECIAL_STATICORB_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.STATIC_ORB]),SET_EXPANSION1,false);
      
      public static var SPECIAL_NATAOBETHORB:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_NATAOBETHORB_NAME,BC_TextFactory.ID_SPECIAL_NATAOBETHORB_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([DieEffectEnum.NATAOBETH_ORB,DieEffectEnum.NATAOBETH_ORB]),SET_PRIME,false);
      
      public static var SPECIAL_ORCLEADERCROWN:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_ORCLEADERCROWN_NAME,BC_TextFactory.ID_SPECIAL_ORCLEADERCROWN_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.ORC_LEADER_CROWN]),SET_PRIME,false);
      
      public static var SPECIAL_EMPIRESEAL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_EMPIRESEAL_NAME,BC_TextFactory.ID_SPECIAL_EMPIRESEAL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.EMPIRE_SEAL]),SET_PRIME,false);
      
      public static var SPECIAL_UNICORN:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL_HORSE,1,0,BC_TextFactory.ID_SPECIAL_UNICORN_NAME,BC_TextFactory.ID_SPECIAL_UNICORN_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.UNICORN,onKillEffectEnum.UNICORN]),SET_PRIME,false);
      
      public static var SPECIAL_ARHALATHRING:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_ARHALATHRING_NAME,BC_TextFactory.ID_SPECIAL_ARHALATHRING_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.ARHALATH_RING]),SET_EXPANSION1,false);
      
      public static var SPECIAL_YASURRING:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_YASURRING_NAME,BC_TextFactory.ID_SPECIAL_YASURRING_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([onRaiseUndeadEnum.YASUR_RING]),SET_PRIME,false);
      
      public static var SPECIAL_APOCALYPSEHORSE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL_HORSE,1,0,BC_TextFactory.ID_SPECIAL_APOCALYPSEHORSE_NAME,BC_TextFactory.ID_SPECIAL_APOCALYPSEHORSE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.APOCALYPSE_HORSE]),SET_EXPANSION1,false);
      
      public static var SPECIAL_ANTIMAGICFIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_ANTIMAGICFIELD_NAME,BC_TextFactory.ID_SPECIAL_ANTIMAGICFIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.ANTIMAGIC_FIELD]),SET_PRIME,false);
      
      public static var SPECIAL_ULTRARING:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_ULTRARING_NAME,BC_TextFactory.ID_SPECIAL_ULTRARING_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.ULTRA_RING,AuraEnum.ULTRA_RING_DEF]),SET_PRIME,false);
      
      public static var SPECIAL_GAZATAHBOOK:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_GAZATAHBOOK_NAME,BC_TextFactory.ID_SPECIAL_GAZATAHBOOK_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.GAZATAH_HANDBOOK]),SET_EXPANSION1,false);
      
      public static var CREATURE_SHAPESHIFTER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_ALL,1,1,BC_TextFactory.ID_CREATURE_SHAPESHIFTER_NAME,BC_TextFactory.ID_CREATURE_SHAPESHIFTER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var CREATURE_IMP_GOON:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_IMP,1,1,BC_TextFactory.ID_CREATURE_IMPGOON_NAME,BC_TextFactory.ID_CREATURE_IMPGOON_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var CREATURE_MACHINE_CATAPULT:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_ARTILLERY_6CASE,3,2,BC_TextFactory.ID_CREATURE_MACHINECATAPULT_NAME,BC_TextFactory.ID_CREATURE_MACHINECATAPULT_DESC,ModelProjectileEffectEnum.CATAPULT,ModelAttackEnum.SPLASH_CANON,null,SET_MYTHIC,false);
      
      public static var CREATURE_RUSTY_CANON:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_ARTILLERY_6CASE,3,2,BC_TextFactory.ID_CREATURE_RUSTYCANON_NAME,BC_TextFactory.ID_CREATURE_RUSTYCANON_DESC,ModelProjectileEffectEnum.CATAPULT,ModelAttackEnum.SPLASH_CANON,null,SET_MYTHIC,false);
      
      public static var CREATURE_DESTROYER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_GOLEM,1,1,BC_TextFactory.ID_CREATURE_DESTROYER_NAME,BC_TextFactory.ID_CREATURE_DESTROYER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([TimedEffectEnum.TIMEDEAD]),SET_MYTHIC,false);
      
      public static var CREATURE_AODAN_MYTHIC:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_HUMAN,1,1,BC_TextFactory.ID_CREATURE_AODANMYTHIC_NAME,BC_TextFactory.ID_CREATURE_AODANMYTHIC_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([onStartEffectEnum.AODAN_MYTHIC,AuraEnum.AODAN_MYTHIC]),SET_MYTHIC,false);
      
      public static var CREATURE_AZARTIUS_MYTHIC:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_HUMAN,1,1,BC_TextFactory.ID_CREATURE_AZARTIUSMYTHIC_NAME,BC_TextFactory.ID_CREATURE_AZARTIUSMYTHIC_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.AZARTIUS_MYTHIC]),SET_MYTHIC,false);
      
      public static var CREATURE_UMENTH_MYTHIC:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_OCTOPOD,1,1,BC_TextFactory.ID_CREATURE_UMENTHMYTHIC_NAME,BC_TextFactory.ID_CREATURE_UMENTHMYTHIC_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.UMENTH_MYTHIC]),SET_MYTHIC,false);
      
      public static var CREATURE_YASUR_MYTHIC:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_UNDEAD,1,1,BC_TextFactory.ID_CREATURE_YASURMYTHIC_NAME,BC_TextFactory.ID_CREATURE_YASURMYTHIC_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([onStartEffectEnum.YASUR_MYTHIC]),SET_MYTHIC,false);
      
      public static var CREATURE_XONAX_MYTHIC:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_VERMINE,1,1,BC_TextFactory.ID_CREATURE_XONAXMYTHIC_NAME,BC_TextFactory.ID_CREATURE_XONAXMYTHIC_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.XONAX_MYTHIC]),SET_MYTHIC,false);
      
      public static var CREATURE_ZAMAROTH_MYTHIC:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_DEMON,1,1,BC_TextFactory.ID_CREATURE_ZAMAROTHMYTHIC_NAME,BC_TextFactory.ID_CREATURE_ZAMAROTHMYTHIC_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.ZAMAROTH_MYTHIC]),SET_MYTHIC,false);
      
      public static var CREATURE_VASSPOTANAX_MYTHIC:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_REPTILIAN,1,1,BC_TextFactory.ID_CREATURE_VASSPOTANAXMYTHIC_NAME,BC_TextFactory.ID_CREATURE_VASSPOTANAXMYTHIC_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.VASS_MYTHIC]),SET_MYTHIC,false);
      
      public static var CREATURE_RHIGAR_MYTHIC:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_HUMAN,1,1,BC_TextFactory.ID_CREATURE_RHIGARMYTHIC_NAME,BC_TextFactory.ID_CREATURE_RHIGARMYTHIC_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.RHIGAR_MYTHIC]),SET_MYTHIC,false);
      
      public static var CREATURE_IMRAILH_MYTHIC:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_ANGEL,1,1,BC_TextFactory.ID_CREATURE_IMRAILHMYTHIC_NAME,BC_TextFactory.ID_CREATURE_IMRAILHMYTHIC_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.IMRAHIL_MYTHIC]),SET_MYTHIC,false);
      
      public static var CREATURE_MISFORM_MYTHIC:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_CREATURE,ModelEquipement.GENRE_CREATURE_ALL,1,1,BC_TextFactory.ID_CREATURE_MISFORMMYTHIC_NAME,BC_TextFactory.ID_CREATURE_MISFORMMYTHIC_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var WEAPON_FLAMETHROWER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_MUSKET,0,0,BC_TextFactory.ID_WEAPON_FLAMETHROWER_NAME,BC_TextFactory.ID_WEAPON_FLAMETHROWER_DESC,ModelProjectileEffectEnum.FLAME_THROWER,ModelAttackEnum.FLAME_THROWER,null,SET_MYTHIC,false);
      
      public static var WEAPON_IMP_PIKE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_IMPPIKE_NAME,BC_TextFactory.ID_WEAPON_IMPPIKE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.IMP_PIKE]),SET_MYTHIC,false);
      
      public static var WEAPON_IMP_MUSKET:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_MUSKET,0,0,BC_TextFactory.ID_WEAPON_IMPMUSKET_NAME,BC_TextFactory.ID_WEAPON_IMPMUSKET_DESC,ModelProjectileEffectEnum.MUSKET,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.IMP_MUSKET]),SET_MYTHIC,false);
      
      public static var WEAPON_MACHINE_MUSKET:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_MUSKET,0,0,BC_TextFactory.ID_WEAPON_MACHINEMUSKET_NAME,BC_TextFactory.ID_WEAPON_MACHINEMUSKET_DESC,ModelProjectileEffectEnum.MUSKET,ModelAttackEnum.SINGLE_ATTACK,null,SET_MYTHIC,false);
      
      public static var WEAPON_ICESPIKE_STAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_ICESPIKESTAFF_NAME,BC_TextFactory.ID_WEAPON_ICESPIKESTAFF_DESC,ModelProjectileEffectEnum.ICESPIKESTAFF,ModelAttackEnum.SINGLE_ATTACK,null,SET_MYTHIC,true);
      
      public static var WEAPON_POISONARROW_STAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_POISONARROWSTAFF_NAME,BC_TextFactory.ID_WEAPON_POISONARROWSTAFF_DESC,ModelProjectileEffectEnum.POISONARROWSTAFF,ModelAttackEnum.SINGLE_ATTACK,null,SET_MYTHIC,true);
      
      public static var WEAPON_FIREBALL_STAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_FIREBALLSTAFF_NAME,BC_TextFactory.ID_WEAPON_FIREBALLSTAFF_DESC,ModelProjectileEffectEnum.FIREBALLSTAFF,ModelAttackEnum.SINGLE_ATTACK,null,SET_MYTHIC,true);
      
      public static var WEAPON_THUNDERBOLT_STAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_THUNDERBOLTSTAFF_NAME,BC_TextFactory.ID_WEAPON_THUNDERBOLTSTAFF_DESC,ModelProjectileEffectEnum.THUNDERBOLTSTAFF,ModelAttackEnum.SINGLE_ATTACK,null,SET_MYTHIC,true);
      
      public static var WEAPON_LIVING_SWORD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_LIVINGSWORD_NAME,BC_TextFactory.ID_WEAPON_LIVINGSWORD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([onKillEffectEnum.LIVINGSWORD]),SET_MYTHIC,false);
      
      public static var WEAPON_KNIFE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_KNIFE_NAME,BC_TextFactory.ID_WEAPON_KNIFE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,null,SET_MYTHIC,false);
      
      public static var WEAPON_FINECRAFT_BOW:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_BOW,0,0,BC_TextFactory.ID_WEAPON_FINECRAFTBOW_NAME,BC_TextFactory.ID_WEAPON_FINECRAFTBOW_DESC,ModelProjectileEffectEnum.ARROW,ModelAttackEnum.SINGLE_ATTACK,null,SET_MYTHIC,false);
      
      public static var WEAPON_LIVING_BOW:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_BOW,0,0,BC_TextFactory.ID_WEAPON_LIVINGBOW_NAME,BC_TextFactory.ID_WEAPON_LIVINGBOW_DESC,ModelProjectileEffectEnum.ARROW,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([onKillEffectEnum.LIVINGBOW]),SET_MYTHIC,false);
      
      public static var WEAPON_PYROBATTLE_STAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_PYROBATTLESTAFF_NAME,BC_TextFactory.ID_WEAPON_PYROBATTLESTAFF_DESC,ModelProjectileEffectEnum.PYROBATTLESTAFF,ModelAttackEnum.SINGLE_ATTACK,null,SET_MYTHIC,true);
      
      public static var WEAPON_UNDEAD_FLAG:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_UNDEADFLAG_NAME,BC_TextFactory.ID_WEAPON_UNDEADFLAG_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([AuraEnum.UNDEAD_FLAG]),SET_MYTHIC,false);
      
      public static var WEAPON_TESLA_STAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_TESLASTAFF_NAME,BC_TextFactory.ID_WEAPON_TESLASTAFF_DESC,ModelProjectileEffectEnum.TESLASTAFF,ModelAttackEnum.SINGLE_ATTACK,null,SET_MYTHIC,true);
      
      public static var WEAPON_BATTLE_HAMMER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_BATTLEHAMMER_NAME,BC_TextFactory.ID_WEAPON_BATTLEHAMMER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.BATTLE_HAMMER,null,SET_MYTHIC,false);
      
      public static var WEAPON_ANCIENT_BLADE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_ANCIENTBLADE_NAME,BC_TextFactory.ID_WEAPON_ANCIENTBLADE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([onStartEffectEnum.ANCIENT_BLADE]),SET_MYTHIC,false);
      
      public static var WEAPON_CHEAP_MUSKET:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_MUSKET,0,0,BC_TextFactory.ID_WEAPON_CHEAPMUSKET_NAME,BC_TextFactory.ID_WEAPON_CHEAPMUSKET_DESC,ModelProjectileEffectEnum.MUSKET,ModelAttackEnum.SINGLE_ATTACK,null,SET_MYTHIC,false);
      
      public static var WEAPON_SEAKINGSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_SEAKINGSTAFF_NAME,BC_TextFactory.ID_WEAPON_SEAKINGSTAFF_DESC,ModelProjectileEffectEnum.SEAKINGSTAFF,ModelAttackEnum.CASTSQUADFRONTLINE,Vector.<SpecialEffect>([AuraEnum.SEAKING_STAFF]),SET_MYTHIC,true);
      
      public static var WEAPON_SWAMPSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_SWAMPSTAFF_NAME,BC_TextFactory.ID_WEAPON_SWAMPSTAFF_DESC,ModelProjectileEffectEnum.SWAMPSTAFF,ModelAttackEnum.CASTFIRST3LINE,null,SET_MYTHIC,true);
      
      public static var WEAPON_BATTLE_MUSKET:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_MUSKET,0,0,BC_TextFactory.ID_WEAPON_BATTLEMUSKET_NAME,BC_TextFactory.ID_WEAPON_BATTLEMUSKET_DESC,ModelProjectileEffectEnum.MUSKET,ModelAttackEnum.SINGLE_ATTACK,null,SET_MYTHIC,false);
      
      public static var WEAPON_METASTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_METASTAFF_NAME,BC_TextFactory.ID_WEAPON_METASTAFF_DESC,ModelProjectileEffectEnum.METASTAFF,ModelAttackEnum.CASTSQUADFRONTLINE,null,SET_MYTHIC,true);
      
      public static var WEAPON_CORALSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_CORALSTAFF_NAME,BC_TextFactory.ID_WEAPON_CORALSTAFF_DESC,ModelProjectileEffectEnum.ICESTAFF,ModelAttackEnum.CASTBUFFSQUADSINGLEATTACK,Vector.<SpecialEffect>([AuraEnum.CORAL_STAFF]),SET_MYTHIC,true);
      
      public static var WEAPON_COMPOSITE_PIKE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_SPEAR,0,0,BC_TextFactory.ID_WEAPON_COMPOSITEPIKE_NAME,BC_TextFactory.ID_WEAPON_COMPOSITEPIKE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var WEAPON_EVILSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_EVILSTAFF_NAME,BC_TextFactory.ID_WEAPON_EVILSTAFF_DESC,ModelProjectileEffectEnum.ORYTHSTAFF,ModelAttackEnum.MORPHSQUADDEMON,null,SET_MYTHIC,true);
      
      public static var WEAPON_PYROSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_PYROSTAFF_NAME,BC_TextFactory.ID_WEAPON_PYROSTAFF_DESC,ModelProjectileEffectEnum.PYROSTAFF,ModelAttackEnum.CASTFULLLINE,null,SET_MYTHIC,true);
      
      public static var WEAPON_MOON_SWORD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_MOONSWORD_NAME,BC_TextFactory.ID_WEAPON_MOONSWORD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([DieEffectEnum.MOON_SWORD]),SET_MYTHIC,false);
      
      public static var WEAPON_LIFESTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_LIFESTAFF_NAME,BC_TextFactory.ID_WEAPON_LIFESTAFF_DESC,ModelProjectileEffectEnum.LIFE_STAFF,ModelAttackEnum.BUFFALLNONUNDEAD,null,SET_MYTHIC,true);
      
      public static var WEAPON_DEATHSTAFF:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_STAFF,0,0,BC_TextFactory.ID_WEAPON_DEATHSTAFF_NAME,BC_TextFactory.ID_WEAPON_DEATHSTAFF_DESC,ModelProjectileEffectEnum.DEATH_STAFF,ModelAttackEnum.CASTALLNONUNDEAD,null,SET_MYTHIC,true);
      
      public static var WEAPON_OKKORAZHAMMER:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_WEAPON,ModelEquipement.GENRE_1HAND,0,0,BC_TextFactory.ID_WEAPON_OKKORAZHAMMER_NAME,BC_TextFactory.ID_WEAPON_OKKORAZHAMMER_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.SINGLE_ATTACK,Vector.<SpecialEffect>([onKillEffectEnum.OKKORAZHAMMER,onAttackEffectEnum.OKKORAZHAMMER]),SET_MYTHIC,false);
      
      public static var SHIELD_OFFHANDSWORD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_OFFHANDSWORD_NAME,BC_TextFactory.ID_SHIELD_OFFHANDSWORD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var SHIELD_REINFORCEDSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_REINFORCEDSHIELD_NAME,BC_TextFactory.ID_SHIELD_REINFORCEDSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var SHIELD_MAGICSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_MAGICSHIELD_NAME,BC_TextFactory.ID_SHIELD_MAGICSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var SHIELD_OFFHANDMACE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_OFFHANDMACE_NAME,BC_TextFactory.ID_SHIELD_OFFHANDMACE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var SHIELD_LEATHERSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_LEATHERSHIELD_NAME,BC_TextFactory.ID_SHIELD_LEATHERSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var SHIELD_BATTLEARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_BATTLESHIELD_NAME,BC_TextFactory.ID_SHIELD_BATTLESHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var SHIELD_IMPSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_IMPSHIELD_NAME,BC_TextFactory.ID_SHIELD_IMPSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.IMP_SHIELD,AuraEnum.IMP_SHIELD2]),SET_MYTHIC,false);
      
      public static var SHIELD_VASSSHIELD:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SHIELD,ModelEquipement.GENRE_SHIELD,0,0,BC_TextFactory.ID_SHIELD_VASSSHIELD_NAME,BC_TextFactory.ID_SHIELD_VASSSHIELD_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.VASS_SHIELD]),SET_MYTHIC,false);
      
      public static var ARMOR_WARRIORBATTLEMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_WARRIORBATTLEMAIL_NAME,BC_TextFactory.ID_ARMOR_WARRIORBATTLEMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var ARMOR_RUSTYMAIL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_RUSTYMAIL_NAME,BC_TextFactory.ID_ARMOR_RUSTYMAIL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var ARMOR_USEDGAMBESON:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_COMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_USEDGAMBESON_NAME,BC_TextFactory.ID_ARMOR_USEDGAMBESON_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var ARMOR_ANCIENTARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_ANCIENTARMOR_NAME,BC_TextFactory.ID_ARMOR_ANCIENTARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([onStartEffectEnum.ANCIENT_ARMOR]),SET_MYTHIC,false);
      
      public static var ARMOR_IMPARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_IMPARMOR_NAME,BC_TextFactory.ID_ARMOR_IMPARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.IMP_ARMOR]),SET_MYTHIC,false);
      
      public static var ARMOR_MECHANICARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_MECHANICARMOR_NAME,BC_TextFactory.ID_ARMOR_MECHANICARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.MECHANIC_ARMOR]),SET_MYTHIC,false);
      
      public static var ARMOR_SEAKINGARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_SEAKINGARMOR_NAME,BC_TextFactory.ID_ARMOR_SEAKINGARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.SEAKING_ARMOR]),SET_MYTHIC,false);
      
      public static var ARMOR_ARCHERGEAR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_SPECIAL_ARCHERGEAR_NAME,BC_TextFactory.ID_SPECIAL_ARCHERGEAR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var ARMOR_RAMPAGERARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_RAMPAGERARMOR_NAME,BC_TextFactory.ID_ARMOR_RAMPAGERARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([onStartEffectEnum.RAMPAGER_ARMOR]),SET_MYTHIC,false);
      
      public static var ARMOR_COOLDOWNARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_COOLDOWNARMOR_NAME,BC_TextFactory.ID_ARMOR_COOLDOWNARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.COOLDOWN_ARMOR]),SET_MYTHIC,false);
      
      public static var ARMOR_SEAPLATE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_SEAPLATE_NAME,BC_TextFactory.ID_ARMOR_SEAPLATE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.SEA_PLATE]),SET_MYTHIC,false);
      
      public static var ARMOR_INSECTOID_QUEEN_ARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_INSECTOIDQUEENARMOR_NAME,BC_TextFactory.ID_ARMOR_INSECTOIDQUEENARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([onStartEffectEnum.INSECTOID_QUEEN_ARMOR]),SET_MYTHIC,false);
      
      public static var ARMOR_MOONARMOR:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_ARMOR,ModelEquipement.GENRE_ARMOR,0,0,BC_TextFactory.ID_ARMOR_MOONARMOR_NAME,BC_TextFactory.ID_ARMOR_MOONARMOR_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([DieEffectEnum.MOON_ARMOR]),SET_MYTHIC,false);
      
      public static var SPECIAL_IMPCROWN:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_IMPCROWN_NAME,BC_TextFactory.ID_SPECIAL_IMPCROWN_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.IMP_CROWN]),SET_MYTHIC,false);
      
      public static var SPECIAL_MOONORB:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_MOONORB_NAME,BC_TextFactory.ID_SPECIAL_MOONORB_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([DieEffectEnum.MOON_ORB]),SET_MYTHIC,false);
      
      public static var SPECIAL_BLAZINGORB:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_RARE,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_BLAZINGORB_NAME,BC_TextFactory.ID_SPECIAL_BLAZINGORB_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.BLAZING_ORB]),SET_MYTHIC,false);
      
      public static var SPECIAL_ANTITECHCRYSTAL:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_ANTITECHCRYSTAL_NAME,BC_TextFactory.ID_SPECIAL_ANTITECHCRYSTAL_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.ANTITECH_CRYSTAL]),SET_MYTHIC,false);
      
      public static var SPECIAL_RINGOFMADNESS:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_RINGOFMADNESS_NAME,BC_TextFactory.ID_SPECIAL_RINGOFMADNESS_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.RINGOFMADNESS]),SET_MYTHIC,false);
      
      public static var SPECIAL_DEATHNECKLACE:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_DEATHNECKLACE_NAME,BC_TextFactory.ID_SPECIAL_DEATHNECKLACE_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,null,SET_MYTHIC,false);
      
      public static var SPECIAL_ELEMENTALRING:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_ELEMENTALRING_NAME,BC_TextFactory.ID_SPECIAL_ELEMENTALRING_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.ELEMENTAL_RING]),SET_MYTHIC,false);
      
      public static var SPECIAL_WARLORDRING:ModelEquipement = CreateModelEquip(_id++,ModelEquipement.RARITY_LEGENDARY,ModelEquipement.TYPE_SPECIAL,ModelEquipement.GENRE_SPECIAL,0,0,BC_TextFactory.ID_SPECIAL_WARLORDRING_NAME,BC_TextFactory.ID_SPECIAL_WARLORDRING_DESC,ModelProjectileEffectEnum.EFFECT_NULL,ModelAttackEnum.ATTACK_NULL,Vector.<SpecialEffect>([AuraEnum.WARLORD_RING]),SET_MYTHIC,false);
      
      public function ModelEquipementEnum()
      {
         super();
      }
      
      public static function GetLegendary(SetType:int) : Vector.<ModelEquipement>
      {
         switch(SetType)
         {
            case SET_PRIME:
               return PRIME_LEGENDARY;
            case SET_EXPANSION1:
               return EXPANSION1_LEGENDARY;
            case SET_MYTHIC:
               return ModelEquipementEnum.MYTHIC_LEGENDARY;
            default:
               return ALL_LEGENDARY;
         }
      }
      
      private static function CreateModelEquip(id1:int, rarity1:int, type1:int, genre1:int, largeur1:int, hauteur1:int, equipementNameId1:int, equipementDescId1:int, modelEffect:ModelProjectileEffect, modelAttack:ModelAttack, specialVector:Vector.<SpecialEffect>, setType:int, isCastItem:Boolean) : ModelEquipement
      {
         var m:ModelEquipement = new ModelEquipement(id1,rarity1,type1,genre1,largeur1,hauteur1,equipementNameId1,equipementDescId1,modelEffect,modelAttack,specialVector,setType,isCastItem);
         if(m.id != -10)
         {
            ALL.push(m);
         }
         switch(setType)
         {
            case SET_PRIME:
               PRIME_SET.push(m);
               switch(m.rarity)
               {
                  case ModelEquipement.RARITY_COMMUN:
                     PRIME_COMMUN.push(m);
                     ALL_COMMUN.push(m);
                     break;
                  case ModelEquipement.RARITY_UNCOMMUN:
                     PRIME_UNCOMMUN.push(m);
                     ALL_UNCOMMUN.push(m);
                     break;
                  case ModelEquipement.RARITY_RARE:
                     PRIME_RARE.push(m);
                     ALL_RARE.push(m);
                     break;
                  case ModelEquipement.RARITY_LEGENDARY:
                     PRIME_LEGENDARY.push(m);
                     ALL_LEGENDARY.push(m);
               }
               break;
            case SET_EXPANSION1:
               EXPANSION1_SET.push(m);
               switch(m.rarity)
               {
                  case ModelEquipement.RARITY_COMMUN:
                     EXPANSION1_COMMUN.push(m);
                     ALL_COMMUN.push(m);
                     break;
                  case ModelEquipement.RARITY_UNCOMMUN:
                     EXPANSION1_UNCOMMUN.push(m);
                     ALL_UNCOMMUN.push(m);
                     break;
                  case ModelEquipement.RARITY_RARE:
                     EXPANSION1_RARE.push(m);
                     ALL_RARE.push(m);
                     break;
                  case ModelEquipement.RARITY_LEGENDARY:
                     EXPANSION1_LEGENDARY.push(m);
                     ALL_LEGENDARY.push(m);
               }
               break;
            case SET_MYTHIC:
               MYTHIC_SET.push(m);
               switch(m.rarity)
               {
                  case ModelEquipement.RARITY_COMMUN:
                     MYTHIC_COMMUN.push(m);
                     ALL_COMMUN.push(m);
                     break;
                  case ModelEquipement.RARITY_UNCOMMUN:
                     MYTHIC_UNCOMMUN.push(m);
                     ALL_UNCOMMUN.push(m);
                     break;
                  case ModelEquipement.RARITY_RARE:
                     MYTHIC_RARE.push(m);
                     ALL_RARE.push(m);
                     break;
                  case ModelEquipement.RARITY_LEGENDARY:
                     MYTHIC_LEGENDARY.push(m);
                     ALL_LEGENDARY.push(m);
               }
         }
         return m;
      }
      
      public static function IsItemLocked(m:ModelEquipement) : Boolean
      {
         return false;
      }
      
      public static function GetRare(SetType:int) : Vector.<ModelEquipement>
      {
         switch(SetType)
         {
            case SET_PRIME:
               return PRIME_RARE;
            case SET_EXPANSION1:
               return EXPANSION1_RARE;
            case SET_MYTHIC:
               return ModelEquipementEnum.MYTHIC_RARE;
            default:
               return ALL_RARE;
         }
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
         EQUIPEMENT_NULL.itemVisualFrame = 2;
      }
      
      public static function Init() : void
      {
         ALL_SET = new Array();
         ALL_SET.push(ALL,SET_PRIME,SET_EXPANSION1,SET_MYTHIC);
         ALL_SET_NAME = new Array();
         ALL_SET_NAME.push(BC_TextFactory.ID_ALL_RARITY_TEXT,BC_TextFactory.ID_SET_PRIME,BC_TextFactory.ID_SET_EXPANSION1,BC_TextFactory.ID_SET_MYTHIC);
      }
      
      public static function GetFromId(id:int) : ModelEquipement
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            if(id == ALL[i].id)
            {
               return ALL[i];
            }
         }
         return EQUIPEMENT_NULL;
      }
      
      public static function GetCommun(SetType:int) : Vector.<ModelEquipement>
      {
         switch(SetType)
         {
            case SET_PRIME:
               return PRIME_COMMUN;
            case SET_EXPANSION1:
               return EXPANSION1_COMMUN;
            case SET_MYTHIC:
               return ModelEquipementEnum.MYTHIC_COMMUN;
            default:
               return ALL_COMMUN;
         }
      }
      
      public static function GetAll(SetType:int) : Vector.<ModelEquipement>
      {
         switch(SetType)
         {
            case SET_PRIME:
               return PRIME_SET;
            case SET_EXPANSION1:
               return EXPANSION1_SET;
            case SET_MYTHIC:
               return MYTHIC_SET;
            default:
               return ALL;
         }
      }
      
      public static function GetUnCommun(SetType:int) : Vector.<ModelEquipement>
      {
         switch(SetType)
         {
            case SET_PRIME:
               return PRIME_UNCOMMUN;
            case SET_EXPANSION1:
               return EXPANSION1_UNCOMMUN;
            case SET_MYTHIC:
               return ModelEquipementEnum.MYTHIC_UNCOMMUN;
            default:
               return ALL_UNCOMMUN;
         }
      }
   }
}

