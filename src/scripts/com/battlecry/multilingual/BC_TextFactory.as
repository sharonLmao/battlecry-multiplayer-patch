package com.battlecry.multilingual
{
   import com.battlecry.meta.model.ModelEquipement;
   import com.lachhhEngine.multilingual.TextFactory;
   
   public class BC_TextFactory extends TextFactory
   {
      
      public static var ID_RARITY_TEXT_ARRAY:Array;
      
      public static var TIPS_ARRAY:Array;
      
      public static var ID_AUTO_END_ACT_3_TXT:int = GetNextTextId();
      
      public static var ID_AUTO_CHAPTER_3_COMPLETED:int = GetNextTextId();
      
      public static var ID_ALL_RARITY_TEXT:int = GetNextTextId();
      
      public static var ID_SQUAD_SPEED_HOLD:int = GetNextTextId();
      
      public static var ID_SQUAD_SPEED_SLOW:int = GetNextTextId();
      
      public static var ID_SQUAD_SPEED_FAST:int = GetNextTextId();
      
      public static var ID_COMMUN_TEXT:int = GetNextTextId();
      
      public static var ID_UNCOMMUN_TEXT:int = GetNextTextId();
      
      public static var ID_RARE_TEXT:int = GetNextTextId();
      
      public static var ID_LEGENDARY_TEXT:int = GetNextTextId();
      
      public static var ID_NOT_CONNECTED_GAMERSAFE:int = GetNextTextId();
      
      public static var ID_ALREADY_YOUR_FRIEND:int = GetNextTextId();
      
      public static var ID_IS_NOW_YOUR_FRIEND:int = GetNextTextId();
      
      public static var ID_FRIEND_WASNT_FOUND:int = GetNextTextId();
      
      public static var ID_CANT_ADD_YOURSELF:int = GetNextTextId();
      
      public static var ID_GAIN_A_RANK:int = GetNextTextId();
      
      public static var ID_NO_RANK_CHANGE:int = GetNextTextId();
      
      public static var ID_LOSE_A_RANK:int = GetNextTextId();
      
      public static var ID_ALONE_IN_RANKING:int = GetNextTextId();
      
      public static var ID_RANKING_SERF:int = GetNextTextId();
      
      public static var ID_RANKING_PEASANT:int = GetNextTextId();
      
      public static var ID_RANKING_CONSCRIPT:int = GetNextTextId();
      
      public static var ID_RANKING_SQUIRE:int = GetNextTextId();
      
      public static var ID_RANKING_MEN_AT_ARMS:int = GetNextTextId();
      
      public static var ID_RANKING_SOLDIER:int = GetNextTextId();
      
      public static var ID_RANKING_MERCENARY:int = GetNextTextId();
      
      public static var ID_RANKING_ELITE_SOLDIER:int = GetNextTextId();
      
      public static var ID_RANKING_CAPTAIN:int = GetNextTextId();
      
      public static var ID_RANKING_KNIGHT:int = GetNextTextId();
      
      public static var ID_RANKING_BARON:int = GetNextTextId();
      
      public static var ID_RANKING_DUKE:int = GetNextTextId();
      
      public static var ID_RANKING_LORD:int = GetNextTextId();
      
      public static var ID_RANKING_CHAMPION:int = GetNextTextId();
      
      public static var ID_RANKING_COMMANDER:int = GetNextTextId();
      
      public static var ID_RANKING_GENERAL:int = GetNextTextId();
      
      public static var ID_RANKING_BATTLE_MASTER:int = GetNextTextId();
      
      public static var ID_RANKING_HERO:int = GetNextTextId();
      
      public static var ID_RANKING_ARCH_DUKE:int = GetNextTextId();
      
      public static var ID_RANKING_CHANCELLOR:int = GetNextTextId();
      
      public static var ID_RANKING_WARLORD:int = GetNextTextId();
      
      public static var ID_RANKING_KING:int = GetNextTextId();
      
      public static var ID_RANKING_OVERLORD:int = GetNextTextId();
      
      public static var ID_RANKING_EMPEROR:int = GetNextTextId();
      
      public static var ID_CREATURE_HUMAN_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_IMMORTAL_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_HUMAN_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_IMMORTAL_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_ORC_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_ORC_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_IMP_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_IMP_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_BALISTA_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_BALISTA_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_CATAPULT_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_CATAPULT_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_CANNON_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_CANNON_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_UNDEAD_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_UNDEAD_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_INSECTOID_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_INSECTOID_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_VERMINE_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_VERMINE_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_REPTILIAN_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_REPTILIAN_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_LYCANTROP_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_LYCANTROP_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_GOLEM_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_GOLEM_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_FISHMAN_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_FISHMAN_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_UNDEADCATAPULT_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_UNDEADCATAPULT_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_STEAMCHARIOT_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_STEAMCHARIOT_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_PLAGUECANON_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_PLAGUECANON_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_GIANTFLAMER_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_GIANTFLAMER_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_FIREELEMENTAL_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_FIREELEMENTAL_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_WATERELEMENTAL_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_WATERELEMENTAL_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_POISONELEMENTAL_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_POISONELEMENTAL_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_THUNDERELEMENTAL_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_THUNDERELEMENTAL_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_OCTOPOD_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_OCTOPOD_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_DEMON_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_DEMON_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_ANGEL_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_ANGEL_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_STEAM_BEHEMOT_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_STEAM_BEHEMOT_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_FAMINE_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_FAMINE_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_WAR_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_WAR_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_CONQUEST_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_CONQUEST_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_DEATH_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_DEATH_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_IRONSWORD_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_IRONSWORD_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_SPEAR_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_SPEAR_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_MACE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_MACE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_AXE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_AXE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_2HSWORD_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_2HSWORD_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_2HAXE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_2HAXE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_2HMACE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_2HMACE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_PISTOL_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_PISTOL_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_MUSKET_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_MUSKET_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_HALBERD_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_HALBERD_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_TORCH_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_TORCH_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_DAGGER_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_DAGGER_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_PIKE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_PIKE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_WARHAMMER_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_WARHAMMER_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_2HWARHAMMER_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_2HWARHAMMER_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_FIRESTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_FIRESTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_ICESTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_ICESTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_POISONSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_POISONSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_THUNDERSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_THUNDERSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_DARKSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_DARKSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_HOLYSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_HOLYSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_LONGBOW_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_LONGBOW_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_COMPOSITEBOW_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_COMPOSITEBOW_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_SHORTBOW_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_SHORTBOW_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_SWORDSMANFLAG_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_SWORDSMANFLAG_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_BARBARIANFLAG_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_BARBARIANFLAG_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_PIKEMANFLAG_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_PIKEMANFLAG_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_SAPPERFLAG_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_SAPPERFLAG_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_FLAMEFLAG_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_FLAMEFLAG_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_FROSTFLAG_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_FROSTFLAG_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_VIPERFLAG_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_VIPERFLAG_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_BOLTFLAG_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_BOLTFLAG_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_CULTFLAG_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_CULTFLAG_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_CLERICFLAG_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_CLERICFLAG_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_TOWERFLAG_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_TOWERFLAG_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_FIRESWORD_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_FIRESOWRD_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_ICEPIKE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_ICEPIKE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_BOOMSTICK_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_BOOMSTICK_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_SHRAPNELMUSKET_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_SHRAPNELMUSKET_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_REPTILIANDAGGER_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_REPTILIANDAGGER_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_ORCISHHAMMER_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_ORCISHHAMMER_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_LIGHTNINGBOW_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_LIGHTNINGBOW_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_FIREBOW_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_FIREBOW_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_POISONBOW_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_POISONBOW_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_POWERAXE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_POWERAXE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_CRUSADERMACE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_CRUSADERMACE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_BLACKSWORD_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_BLACKSWORD_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_COBRASPEAR_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_COBRASPEAR_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_FIREBLASTSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_FIREBLASTSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_BLAZINGSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_BLAZINGSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_ICESTORMSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_ICESTORMSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_FROSTBITESTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_FROSTBITESTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_ACIDRAINSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_ACIDRAINSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_PLAGUESTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_PLAGUESTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_LIGHTNINGSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_LIGHTNINGSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_THUNDERSTORMSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_THUNDERSTORMSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_ANGELICSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_ANGELICSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_DEMONICSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_DEMONICSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_PYROBLADE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_PYROBLADE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_BOLTHAMMER_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_BOLTHAMMER_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_NECRONBLADE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_NECRONBLADE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_PLAGUESPIKE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_PLAGUESPIKE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_FROSTAXE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_FROSTAXE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_SAINTBLADE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_SAINTBLADE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_BLASTHAMMER_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_BLASTHAMMER_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_WARBOW_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_WARBOW_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_COMPOSITESWORD_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_COMPOSITESWORD_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_POWERHAMMER_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_POWERHAMMER_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_SOLARSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_SOLARSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_ARMAGEDONSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_ARMAGEDONSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_OKKORAZSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_OKKORAZSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_ORYTHSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_ORYTHSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_ANGELSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_ANGELSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_VASSPOTANAXSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_VASSPOTANAXSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_ULTIMASTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_ULTIMASTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_MAGICSWORD_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_MAGICSWORD_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_QUAEKDAGGER_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_QUAEKDAGGER_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_YASURSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_YASURSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_XONAXSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_XONAXSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_ZAMAROTHSWORD_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_ZAMAROTHSWORD_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_IMRAILHMACE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_IMRAILHMACE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_QUATIAZSWORD_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_QUATIAZSWORD_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_RHIGARBOW_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_RHIGARBOW_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_AZARATIUSAXE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_AZARATIUSAXE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_METABLADE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_METABLADE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_GORDAKARHAMMER_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_GORDAKARHAMMER_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_WOODENSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_WOODENSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_ROUNDSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_ROUNDSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_IRONSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_IRONSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_BUKLER_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_BUKLER_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_STEELSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_STEELSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_TOWERSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_TOWERSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_SPIKEDBUKLER_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_SPIKEDBUKLER_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_SPIKEDSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_SPIKEDSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_ROTTENSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_ROTTENSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_PARRYINGDAGGER_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_PARRYINGDAGGER_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_CRYSTALORB_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_CRYSTALORB_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_SAPPERSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_SAPPERSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_CURSEDSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_CURSEDSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_KITESHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_KITESHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_SMALLKITESHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_SMALLKITESHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_PRIESTSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_PRIESTSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_CULTISTSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_CULTISTSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_NECROPOLSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_NECROPOLSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_INQUISITORSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_INQUISITORSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_DUELISTBUCKLET_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_DUELISTBUCKLET_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_HEROSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_HEROSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_ASSASSINSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_ASSASSINSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_FIREPARRYINGBLADE_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_FIREPARRYINGBLADE_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_ICEBUCKLER_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_ICEBUCKLER_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_PLAGUESHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_PLAGUESHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_EXPERIMENTALSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_EXPERIMENTALSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_MAGNETICSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_MAGNETICSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_BEASTSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_BEASTSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_MIRRORSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_MIRRORSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_CRAFTMENSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_CRAFTMENSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_PORCUPINESHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_PORCUPINESHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_GLADIATORSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_GLADIATORSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_STORMSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_STORMSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_CERIPHYRBUCKLER_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_CERIPHYRBUCKLER_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_BAXSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_BAXSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_COMPOSITESHIELDSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_COMPOSITESHIELDSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_LIFESHIELDSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_LIFESHIELDSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_QUATIAZSHIELDSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_QUATIAZSHIELDSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_NARMNSHIELDSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_NARMNSHIELDSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_XONAXBUCKLER_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_XONAXBUCKLER_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_MOKDARSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_MOKDARSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_TULORANPROTECTION_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_TULORANPROTECTION_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_XONAXSKIN_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_XONAXSKIN_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_AODANSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_AODANSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_AZARATIUSSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_AZARATIUSSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_GORDAKARSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_GORDAKARSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_ORYTHSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_ORYTHSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_ULTRASHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_ULTRASHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_CERIPHYRSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_CERIPHYRSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_PLATEARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_PLATEARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_CHAINMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_CHAINMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_SCALEMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_SCALEMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_HAUBERT_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_HAUBERT_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_BLACKARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_BLACKARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_HALFPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_HALFPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_STUDDEDLEATHER_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_STUDDEDLEATHER_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_LEATHER_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_LEATHER_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_GAMBESON_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_GAMBESON_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_FURARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_FURARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_BOILEDLEATHER_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_BOILEDLEATHER_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_SPIKEDLEATHER_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_SPIKEDLEATHER_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_RAG_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_RAG_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_APPRENTICEROBE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_APPRENTICEROBE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_MAGEROBE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_MAGEROBE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_SPIKEDARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_SPIKEDARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_ROTTENPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_ROTTENPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_CLERICMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_CLERICMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_TAINTEDPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_TAINTEDPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_ADVENTURERCLOTH_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_ADVENTURERCLOTH_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_SAPPERARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_SAPPERARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_ICYROBE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_ICYROBE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_ROGUEARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_ROGUEARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_HEAVYPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_HEAVYPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_ROTTENMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_ROTTENMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_CULTISTROBE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_CULTISTROBE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_MERCENARYPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_MERCENARYPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_CHAINMAILOFHATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_CHAINMAILOFHATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_CORRUPTEDMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_CORRUPTEDMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_LIGHTNINGCULTROBE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_LIGHTNINGCULTROBE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_ENGINEERAPRON_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_ENGINEERAPRON_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_EVILMANPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_EVILMANPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_BROTHERHOODCHAINMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_BROTHERHOODCHAINMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_GUARDHAUBERT_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_GUARDHAUBERT_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_LUMINARYMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_LUMINARYMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_SWAMPMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_SWAMPMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_LIGHTEDPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_LIGHTEDPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_BARBARIANARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_BARBARIANARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_NECROPOLMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_NECROPOLMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_CURSEDARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_CURSEDARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_BLESSEDARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_BLESSEDARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_DEFLAGRATIONSCALE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_DEFLAGRATIONSCALE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_MAGMABREASTPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_MAGMABREASTPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_MITHRILMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_MITHRILMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_BATTLEMAGEPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_BATTLEMAGEPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_NARMNPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_NARMNPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_ANGELPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_ANGELPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_UNHOLYPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_UNHOLYPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_PYROMANCERMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_PYROMANCERMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_POWERARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_POWERARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_NATAOBETHPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_NATAOBETHPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_BAXROBE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_BAXROBE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_QUAEKMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_QUAEKMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_EMPIREARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_EMPIREARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_NECROGEAR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_NECROGEAR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_ARCHMAGEMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_ARCHMAGEMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_IMMORTALARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_IMMORTALARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_TULORANPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_TULORANPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_YASURARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_YASURARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_XONAXMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_XONAXMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_VASSPOTANAXPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_VASSPOTANAXPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_UNTMORIPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_UNTMORIPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_UMENTHARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_UMENTHARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_GORDAKARPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_GORDAKARPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_AZARATIUSORB_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_AZARATIUSORB_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_OKKORAZVEST_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_OKKORAZVEST_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_HORSE_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_HORSE_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_HEAVYHORSE_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_HEAVYHORSE_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_SHIELDRING_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_SHIELDRING_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_WIZARDRING_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_WIZARDRING_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_POWERRING_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_POWERRING_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_BOAR_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_BOAR_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_REGENNECKLACE_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_REGENNECKLACE_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_SOLDIERORB_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_SOLDIERORB_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_TIMESLOWRING_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_TIMESLOWRING_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_CHARGEHORSE_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_CHARGEHORSE_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_PARADEHORSE_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_PARADEHORSE_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_CURSEDRING_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_CURSEDRING_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_SAINTHANDRELIC_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_SAINTHANDRELIC_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_CULTISTHANDRELIC_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_CULTISTHANDRELIC_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_BUTCHERBOOK_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_BUTCHERBOOK_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_POLARBEARHAND_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_POLARBEARHAND_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_DRYEELBELT_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_DRYEELBELT_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_POISONBOTTLE_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_POISONBOTTLE_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_RHINO_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_RHINO_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_ARCHERBRACER_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_ARCHERBRACER_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_OGREBRACER_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_OGREBRACER_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_MAGMAEMBLEM_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_MAGMAEMBLEM_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_SAPPERNECKLACE_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_SAPPERNECKLACE_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_TIMEWARPRING_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_TIMEWARPRING_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_MAGNETICRING_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_MAGNETICRING_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_TRIBALCHIEFCROWN_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_TRIBALCHIEFCROWN_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_MERCENARYGAUNTLET_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_MERCENARYGAUNTLET_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_UNDEADHORSE_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_UNDEADHORSE_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_LUMINARYRING_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_LUMINARYRING_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_QUAEKTALISMAN_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_QUAEKTALISMAN_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_WARHORSE_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_WARHORSE_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_MECHANICALBEAST_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_MECHANICALBEAST_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_STATICORB_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_STATICORB_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_NATAOBETHORB_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_NATAOBETHORB_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_EMPIRESEAL_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_EMPIRESEAL_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_ORCLEADERCROWN_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_ORCLEADERCROWN_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_UNICORN_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_UNICORN_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_ARHALATHRING_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_ARHALATHRING_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_YASURRING_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_YASURRING_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_APOCALYPSEHORSE_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_APOCALYPSEHORSE_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_ANTIMAGICFIELD_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_ANTIMAGICFIELD_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_ULTRARING_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_ULTRARING_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_GAZATAHBOOK_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_GAZATAHBOOK_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_SMALLMINE_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_SMALLMINE_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_SHAPESHIFTER_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_SHAPESHIFTER_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_POWERMINE_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_POWERMINE_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_IMPGOON_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_IMPGOON_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_MACHINECATAPULT_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_MACHINECATAPULT_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_RUSTYCANON_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_RUSTYCANON_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_DESTROYER_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_DESTROYER_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_AODANMYTHIC_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_AODANMYTHIC_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_AZARTIUSMYTHIC_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_AZARTIUSMYTHIC_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_UMENTHMYTHIC_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_UMENTHMYTHIC_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_YASURMYTHIC_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_YASURMYTHIC_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_XONAXMYTHIC_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_XONAXMYTHIC_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_ZAMAROTHMYTHIC_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_ZAMAROTHMYTHIC_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_VASSPOTANAXMYTHIC_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_VASSPOTANAXMYTHIC_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_RHIGARMYTHIC_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_RHIGARMYTHIC_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_IMRAILHMYTHIC_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_IMRAILHMYTHIC_DESC:int = GetNextTextId();
      
      public static var ID_CREATURE_MISFORMMYTHIC_NAME:int = GetNextTextId();
      
      public static var ID_CREATURE_MISFORMMYTHIC_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_FLAMETHROWER_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_FLAMETHROWER_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_IMPPIKE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_IMPPIKE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_IMPMUSKET_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_IMPMUSKET_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_MACHINEMUSKET_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_MACHINEMUSKET_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_ICESPIKESTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_ICESPIKESTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_POISONARROWSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_POISONARROWSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_FIREBALLSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_FIREBALLSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_THUNDERBOLTSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_THUNDERBOLTSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_LIVINGSWORD_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_LIVINGSWORD_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_KNIFE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_KNIFE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_FINECRAFTBOW_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_FINECRAFTBOW_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_LIVINGBOW_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_LIVINGBOW_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_PYROBATTLESTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_PYROBATTLESTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_UNDEADFLAG_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_UNDEADFLAG_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_TESLASTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_TESLASTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_BATTLEHAMMER_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_BATTLEHAMMER_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_ANCIENTBLADE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_ANCIENTBLADE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_CHEAPMUSKET_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_CHEAPMUSKET_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_SEAKINGSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_SEAKINGSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_SWAMPSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_SWAMPSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_BATTLEMUSKET_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_BATTLEMUSKET_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_METASTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_METASTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_CORALSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_CORALSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_COMPOSITEPIKE_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_COMPOSITEPIKE_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_EVILSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_EVILSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_PYROSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_PYROSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_MOONSWORD_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_MOONSWORD_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_LIFESTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_LIFESTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_DEATHSTAFF_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_DEATHSTAFF_DESC:int = GetNextTextId();
      
      public static var ID_WEAPON_OKKORAZHAMMER_NAME:int = GetNextTextId();
      
      public static var ID_WEAPON_OKKORAZHAMMER_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_OFFHANDSWORD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_OFFHANDSWORD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_REINFORCEDSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_REINFORCEDSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_MAGICSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_MAGICSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_OFFHANDMACE_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_OFFHANDMACE_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_LEATHERSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_LEATHERSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_BATTLESHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_BATTLESHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_IMPSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_IMPSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_SHIELD_VASSSHIELD_NAME:int = GetNextTextId();
      
      public static var ID_SHIELD_VASSSHIELD_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_WARRIORBATTLEMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_WARRIORBATTLEMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_RUSTYMAIL_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_RUSTYMAIL_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_USEDGAMBESON_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_USEDGAMBESON_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_ANCIENTARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_ANCIENTARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_IMPARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_IMPARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_MECHANICARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_MECHANICARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_SEAKINGARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_SEAKINGARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_BATTLEARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_BATTLEARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_RAMPAGERARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_RAMPAGERARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_COOLDOWNARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_COOLDOWNARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_SEAPLATE_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_SEAPLATE_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_INSECTOIDQUEENARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_INSECTOIDQUEENARMOR_DESC:int = GetNextTextId();
      
      public static var ID_ARMOR_MOONARMOR_NAME:int = GetNextTextId();
      
      public static var ID_ARMOR_MOONARMOR_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_IMPCROWN_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_IMPCROWN_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_MOONORB_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_MOONORB_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_BLAZINGORB_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_BLAZINGORB_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_ARCHERGEAR_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_ARCHERGEAR_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_ANTITECHCRYSTAL_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_ANTITECHCRYSTAL_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_RINGOFMADNESS_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_RINGOFMADNESS_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_DEATHNECKLACE_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_DEATHNECKLACE_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_ELEMENTALRING_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_ELEMENTALRING_DESC:int = GetNextTextId();
      
      public static var ID_SPECIAL_WARLORDRING_NAME:int = GetNextTextId();
      
      public static var ID_SPECIAL_WARLORDRING_DESC:int = GetNextTextId();
      
      public static var ID_MSG:int = GetNextTextId();
      
      public static var ID_CASH:int = GetNextTextId();
      
      public static var ID_NOT_ENOUGH_CASH:int = GetNextTextId();
      
      public static var ID_AREYOUSURE_NO_SAVE:int = GetNextTextId();
      
      public static var ID_NEED_CREATURE:int = GetNextTextId();
      
      public static var ID_NOT_BELLOW_0:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_1_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_2_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_3_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_4_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_5_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_6_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_7_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_8_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_9_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_1_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_2_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_3_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_4_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_5_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_6_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_7_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_8_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_9_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_10_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_1_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_2_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_3_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_4_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_5_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_6_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_7_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_8_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_9_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_10_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_1_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_2_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_3_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_4_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_5_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_6_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_7_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_8_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_9_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_1_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_2_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_3_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_4_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_5_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_6_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_7_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_8_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_9_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_10_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_1_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_2_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_3_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_4_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_5_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_6_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_7_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_8_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_9_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_1_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_2_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_3_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_4_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_5_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_6_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_7_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_8_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_9_NAME:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_1_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_1_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_2_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_3_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_4_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_4_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_5_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_6_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_7_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_8_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_9_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_9_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_9_STORY3:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_1_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_1_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_2_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_3_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_4_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_5_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_6_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_7_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_8_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_9_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_10_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_1_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_1_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_2_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_2_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_3_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_3_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_4_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_4_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_5_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_5_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_5_STORY3:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_6_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_6_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_7_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_7_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_8_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_8_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_9_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_9_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_10_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_10_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_10_STORY3:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_1_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_1_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_2_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_3_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_3_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_4_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_4_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_5_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_5_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_6_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_7_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_8_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_9_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_1_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_1_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_2_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_2_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_3_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_3_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_4_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_4_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_5_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_5_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_6_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_6_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_7_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_7_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_8_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_8_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_9_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_9_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_10_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_10_STORY2:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_1_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_2_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_3_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_4_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_5_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_6_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_7_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_8_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_9_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_1_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_2_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_3_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_4_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_5_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_6_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_7_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_8_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_9_STORY1:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_1_TIPS:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_2_TIPS:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_3_TIPS:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_4_TIPS:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_5_TIPS:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_6_TIPS:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_7_TIPS:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_8_TIPS:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_9_TIPS:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_1:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_2:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_3:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_4:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_5:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_6:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_7:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_8:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_9:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_10:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_11:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_12:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_13:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_14:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_15:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_16:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_17:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_18:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_19:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_20:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_21:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_22:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_23:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_24:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_25:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_26:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_27:int = GetNextTextId();
      
      public static var ID_RANDOM_TIPS_28:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_1_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_2_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_3_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_4_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_5_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_6_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_7_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_8_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_1_9_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_1_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_2_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_3_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_4_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_5_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_6_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_7_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_8_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_9_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_2_10_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_1_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_2_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_3_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_4_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_5_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_6_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_7_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_8_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_9_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN1_3_10_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_1_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_2_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_3_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_4_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_5_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_6_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_7_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_8_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN2_1_9_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_1_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_2_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_3_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_4_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_5_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_6_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_7_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_8_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_9_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_1_10_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_1_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_2_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_3_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_4_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_5_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_6_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_7_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_8_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_2_9_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_1_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_2_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_3_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_4_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_5_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_6_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_7_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_8_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CAMPAIGN3_3_9_ENDSTORY:int = GetNextTextId();
      
      public static var ID_CHAPTER1_NAME:int = GetNextTextId();
      
      public static var ID_CHAPTER2_NAME:int = GetNextTextId();
      
      public static var ID_CHAPTER3_NAME:int = GetNextTextId();
      
      public static var ID_CHAPTER2_1_NAME:int = GetNextTextId();
      
      public static var ID_CHAPTER2_2_NAME:int = GetNextTextId();
      
      public static var ID_CHAPTER2_3_NAME:int = GetNextTextId();
      
      public static var ID_CHAPTER3_1_NAME:int = GetNextTextId();
      
      public static var ID_CHAPTER3_2_NAME:int = GetNextTextId();
      
      public static var ID_CHAPTER3_3_NAME:int = GetNextTextId();
      
      public static var ID_ALL_ARMY_EMPTY:int = GetNextTextId();
      
      public static var ID_CANT_ACTIVATE:int = GetNextTextId();
      
      public static var ID_ALREADY_ACTIVATED:int = GetNextTextId();
      
      public static var ID_SET_PRIME:int = GetNextTextId();
      
      public static var ID_SET_EXPANSION1:int = GetNextTextId();
      
      public static var ID_SET_MYTHIC:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_1:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_2:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_3:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_4:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_5:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_6:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_7:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_8:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_9:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_10:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_11:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_12:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_13:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_14:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_15:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_16:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_17:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_18:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_19:int = GetNextTextId();
      
      public static var ID_MULTIPLAYER_RANK_NAME_20:int = GetNextTextId();
      
      public static var ID_RELOAD_TIME_TXT:int = GetNextTextId();
      
      public static var ID_CASTING_TIME_TXT:int = GetNextTextId();
      
      public static var ID_PRIME_STONE_BOOSTER:int = GetNextTextId();
      
      public static var ID_PRIME_STONE_STARTER:int = GetNextTextId();
      
      public static var ID_PRIME_IRON_BOOSTER:int = GetNextTextId();
      
      public static var ID_PRIME_IRON_STARTER:int = GetNextTextId();
      
      public static var ID_PRIME_STEEL_BOOSTER:int = GetNextTextId();
      
      public static var ID_PRIME_STEEL_STARTER:int = GetNextTextId();
      
      public static var ID_PRIME_GOLD_BOOSTER:int = GetNextTextId();
      
      public static var ID_RARE_DAILY_REWARD_1:int = GetNextTextId();
      
      public static var ID_RARE_DAILY_REWARD_2:int = GetNextTextId();
      
      public static var ID_ALL_SET:int = GetNextTextId();
      
      public static var ID_PRIME_SET_1:int = GetNextTextId();
      
      public static var ID_EXPANSION_SET_1:int = GetNextTextId();
      
      public static var ID_DAILY_PACK:int = GetNextTextId();
      
      public static var ID_WEEKLY_PACK:int = GetNextTextId();
      
      public static const ID_AUTO_RANK_0:int = GetNextTextId();
      
      public static const ID_AUTO____0:int = GetNextTextId();
      
      public static const ID_AUTO____1:int = GetNextTextId();
      
      public static const ID_AUTO____2:int = GetNextTextId();
      
      public static const ID_AUTO____3:int = GetNextTextId();
      
      public static const ID_AUTO_____0:int = GetNextTextId();
      
      public static const ID_AUTO_REFRESH_0:int = GetNextTextId();
      
      public static const ID_AUTO_LOSSES_0:int = GetNextTextId();
      
      public static const ID_AUTO_WINS_0:int = GetNextTextId();
      
      public static const ID_AUTO_DRAWS_0:int = GetNextTextId();
      
      public static const ID_AUTO_ACTIVATE_0:int = GetNextTextId();
      
      public static const ID_AUTO_DEACTIVATE_0:int = GetNextTextId();
      
      public static const ID_AUTO_BATTLE_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOUR_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOUR_1:int = GetNextTextId();
      
      public static const ID_AUTO_SELECT_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOUR_2:int = GetNextTextId();
      
      public static const ID_AUTO_SELECT_1:int = GetNextTextId();
      
      public static const ID_AUTO_GOOD_0:int = GetNextTextId();
      
      public static const ID_AUTO_THIS_0:int = GetNextTextId();
      
      public static const ID_AUTO_ONCE_0:int = GetNextTextId();
      
      public static const ID_AUTO_HERE_0:int = GetNextTextId();
      
      public static const ID_AUTO_PICK_0:int = GetNextTextId();
      
      public static const ID_AUTO_AS_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_0:int = GetNextTextId();
      
      public static const ID_AUTO_ASSIGN_0:int = GetNextTextId();
      
      public static const ID_AUTO_WHEN_0:int = GetNextTextId();
      
      public static const ID_AUTO_TO_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_1:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_2:int = GetNextTextId();
      
      public static const ID_AUTO_GOOD_1:int = GetNextTextId();
      
      public static const ID_AUTO_HERE_1:int = GetNextTextId();
      
      public static const ID_AUTO_G_DAY_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_3:int = GetNextTextId();
      
      public static const ID_AUTO_IN_0:int = GetNextTextId();
      
      public static const ID_AUTO_ONCE_1:int = GetNextTextId();
      
      public static const ID_AUTO_SIR__0:int = GetNextTextId();
      
      public static const ID_AUTO_THIS_1:int = GetNextTextId();
      
      public static const ID_AUTO_PICK_1:int = GetNextTextId();
      
      public static const ID_AUTO_NOW_0:int = GetNextTextId();
      
      public static const ID_AUTO_BOWS_0:int = GetNextTextId();
      
      public static const ID_AUTO_GIVE_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_4:int = GetNextTextId();
      
      public static const ID_AUTO_SELECT_2:int = GetNextTextId();
      
      public static const ID_AUTO_THAT_0:int = GetNextTextId();
      
      public static const ID_AUTO_ONE_0:int = GetNextTextId();
      
      public static const ID_AUTO_LIKE_0:int = GetNextTextId();
      
      public static const ID_AUTO_SELECT_3:int = GetNextTextId();
      
      public static const ID_AUTO_NOW_1:int = GetNextTextId();
      
      public static const ID_AUTO_LIKE_1:int = GetNextTextId();
      
      public static const ID_AUTO_NAME_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOUR_3:int = GetNextTextId();
      
      public static const ID_AUTO_SELECT_4:int = GetNextTextId();
      
      public static const ID_AUTO_THAT_1:int = GetNextTextId();
      
      public static const ID_AUTO_WELCOME_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_5:int = GetNextTextId();
      
      public static const ID_AUTO_ONCE_2:int = GetNextTextId();
      
      public static const ID_AUTO_AS_1:int = GetNextTextId();
      
      public static const ID_AUTO_CHALLENGING_0:int = GetNextTextId();
      
      public static const ID_AUTO_EVERY_0:int = GetNextTextId();
      
      public static const ID_AUTO_EVERY_1:int = GetNextTextId();
      
      public static const ID_AUTO___0:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_6:int = GetNextTextId();
      
      public static const ID_AUTO_EVERY_2:int = GetNextTextId();
      
      public static const ID_AUTO_REMEMBER_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_7:int = GetNextTextId();
      
      public static const ID_AUTO_NOW_2:int = GetNextTextId();
      
      public static const ID_AUTO_SIR__1:int = GetNextTextId();
      
      public static const ID_AUTO_ONCE_3:int = GetNextTextId();
      
      public static const ID_AUTO_ONCE_4:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_8:int = GetNextTextId();
      
      public static const ID_AUTO____4:int = GetNextTextId();
      
      public static const ID_AUTO_SIR__2:int = GetNextTextId();
      
      public static const ID_AUTO_AS_2:int = GetNextTextId();
      
      public static const ID_AUTO_THESE_0:int = GetNextTextId();
      
      public static const ID_AUTO_DON_T_0:int = GetNextTextId();
      
      public static const ID_AUTO_HOLD_0:int = GetNextTextId();
      
      public static const ID_AUTO_UPON_0:int = GetNextTextId();
      
      public static const ID_AUTO_THE_0:int = GetNextTextId();
      
      public static const ID_AUTO_UPON_1:int = GetNextTextId();
      
      public static const ID_AUTO___1:int = GetNextTextId();
      
      public static const ID_AUTO_CONGRATULATIONS_0:int = GetNextTextId();
      
      public static const ID_AUTO_ARE_0:int = GetNextTextId();
      
      public static const ID_AUTO___2:int = GetNextTextId();
      
      public static const ID_AUTO_IS_0:int = GetNextTextId();
      
      public static const ID_AUTO_CHAPTER_0:int = GetNextTextId();
      
      public static const ID_AUTO___3:int = GetNextTextId();
      
      public static const ID_AUTO_TOMORROW_0:int = GetNextTextId();
      
      public static const ID_AUTO_TODAY_0:int = GetNextTextId();
      
      public static const ID_AUTO_DAILY_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_9:int = GetNextTextId();
      
      public static const ID_AUTO_ON_0:int = GetNextTextId();
      
      public static const ID_AUTO_COLLECT_0:int = GetNextTextId();
      
      public static const ID_AUTO_OFFLINE_0:int = GetNextTextId();
      
      public static const ID_AUTO_COMPETE_0:int = GetNextTextId();
      
      public static const ID_AUTO_COMPETE_1:int = GetNextTextId();
      
      public static const ID_AUTO_SAVE_0:int = GetNextTextId();
      
      public static const ID_AUTO_COMPLETE_0:int = GetNextTextId();
      
      public static const ID_AUTO_ACCESS_0:int = GetNextTextId();
      
      public static const ID_AUTO_OFFLINE_1:int = GetNextTextId();
      
      public static const ID_AUTO_ONLINE_0:int = GetNextTextId();
      
      public static const ID_AUTO_GAME_0:int = GetNextTextId();
      
      public static const ID_AUTO_GAME_1:int = GetNextTextId();
      
      public static const ID_AUTO_TO_1:int = GetNextTextId();
      
      public static const ID_AUTO_BEFORE_0:int = GetNextTextId();
      
      public static const ID_AUTO_ENLISTMENT_0:int = GetNextTextId();
      
      public static const ID_AUTO_CAMPAIGN_0:int = GetNextTextId();
      
      public static const ID_AUTO_CHAPTER_1:int = GetNextTextId();
      
      public static const ID_AUTO_CREATURES_0:int = GetNextTextId();
      
      public static const ID_AUTO_ITEMS_0:int = GetNextTextId();
      
      public static const ID_AUTO_PRIME_0:int = GetNextTextId();
      
      public static const ID_AUTO_EXPANSION_0:int = GetNextTextId();
      
      public static const ID_AUTO_EXPANSION_1:int = GetNextTextId();
      
      public static const ID_AUTO_STONE_0:int = GetNextTextId();
      
      public static const ID_AUTO_BOOSTER_0:int = GetNextTextId();
      
      public static const ID_AUTO_STARTER_0:int = GetNextTextId();
      
      public static const ID_AUTO_IRON_0:int = GetNextTextId();
      
      public static const ID_AUTO_STEEL_0:int = GetNextTextId();
      
      public static const ID_AUTO_GOLD_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_10:int = GetNextTextId();
      
      public static const ID_AUTO_CHANGING_0:int = GetNextTextId();
      
      public static const ID_AUTO_CURRENT_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOUR_4:int = GetNextTextId();
      
      public static const ID_AUTO_CHALLENGES_0:int = GetNextTextId();
      
      public static const ID_AUTO_COMMON_0:int = GetNextTextId();
      
      public static const ID_AUTO_UNCOMMON_0:int = GetNextTextId();
      
      public static const ID_AUTO_RARE_0:int = GetNextTextId();
      
      public static const ID_AUTO_LEGENDARY_0:int = GetNextTextId();
      
      public static const ID_AUTO_VS_0:int = GetNextTextId();
      
      public static const ID_AUTO_MATCH_0:int = GetNextTextId();
      
      public static const ID_AUTO_BATTLEFIELD_0:int = GetNextTextId();
      
      public static const ID_AUTO_FRIENDS_0:int = GetNextTextId();
      
      public static const ID_AUTO_INVITE_0:int = GetNextTextId();
      
      public static const ID_AUTO_FRIEND_0:int = GetNextTextId();
      
      public static const ID_AUTO_ON_1:int = GetNextTextId();
      
      public static const ID_AUTO_CASH_0:int = GetNextTextId();
      
      public static const ID_AUTO_ON_2:int = GetNextTextId();
      
      public static const ID_AUTO_THE_1:int = GetNextTextId();
      
      public static const ID_AUTO_PACKS_0:int = GetNextTextId();
      
      public static const ID_AUTO_NEW_0:int = GetNextTextId();
      
      public static const ID_AUTO_COLLECTION_0:int = GetNextTextId();
      
      public static const ID_AUTO_OPTIONS_0:int = GetNextTextId();
      
      public static const ID_AUTO_SOUND_0:int = GetNextTextId();
      
      public static const ID_AUTO_MUSIC_0:int = GetNextTextId();
      
      public static const ID_AUTO_QUALITY_0:int = GetNextTextId();
      
      public static const ID_AUTO_CODEX_0:int = GetNextTextId();
      
      public static const ID_AUTO_LANGUAGE_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_11:int = GetNextTextId();
      
      public static const ID_AUTO_FLAG_0:int = GetNextTextId();
      
      public static const ID_AUTO_SYMBOLS_0:int = GetNextTextId();
      
      public static const ID_AUTO_SHAPES_0:int = GetNextTextId();
      
      public static const ID_AUTO_BACKGROUNDS_0:int = GetNextTextId();
      
      public static const ID_AUTO_UNITS_0:int = GetNextTextId();
      
      public static const ID_AUTO_ARMIES_0:int = GetNextTextId();
      
      public static const ID_AUTO_REMAINING_0:int = GetNextTextId();
      
      public static const ID_AUTO_SPEED_0:int = GetNextTextId();
      
      public static const ID_AUTO_HOST_0:int = GetNextTextId();
      
      public static const ID_AUTO_MORE_0:int = GetNextTextId();
      
      public static const ID_AUTO_CREDITS_0:int = GetNextTextId();
      
      public static const ID_AUTO__TIENNE_0:int = GetNextTextId();
      
      public static const ID_AUTO_VINCENT_0:int = GetNextTextId();
      
      public static const ID_AUTO___4:int = GetNextTextId();
      
      public static const ID_AUTO___5:int = GetNextTextId();
      
      public static const ID_AUTO___6:int = GetNextTextId();
      
      public static const ID_AUTO__TIENNE_1:int = GetNextTextId();
      
      public static const ID_AUTO___7:int = GetNextTextId();
      
      public static const ID_AUTO__MILIE_0:int = GetNextTextId();
      
      public static const ID_AUTO___8:int = GetNextTextId();
      
      public static const ID_AUTO_GINETTE_0:int = GetNextTextId();
      
      public static const ID_AUTO_A_0:int = GetNextTextId();
      
      public static const ID_AUTO___9:int = GetNextTextId();
      
      public static const ID_AUTO_X_0:int = GetNextTextId();
      
      public static const ID_AUTO___10:int = GetNextTextId();
      
      public static const ID_AUTO_SKIP_0:int = GetNextTextId();
      
      public static const ID_AUTO_WIN_0:int = GetNextTextId();
      
      public static const ID_AUTO_POINTS_0:int = GetNextTextId();
      
      public static const ID_AUTO_CREATE_0:int = GetNextTextId();
      
      public static const ID_AUTO_EDIT_0:int = GetNextTextId();
      
      public static const ID_AUTO_AMOUNT_0:int = GetNextTextId();
      
      public static const ID_AUTO_SHIELD_0:int = GetNextTextId();
      
      public static const ID_AUTO_ARMOR_0:int = GetNextTextId();
      
      public static const ID_AUTO_CREATURE_0:int = GetNextTextId();
      
      public static const ID_AUTO_SPECIAL_0:int = GetNextTextId();
      
      public static const ID_AUTO_WEAPON_0:int = GetNextTextId();
      
      public static const ID_AUTO_UNIT_0:int = GetNextTextId();
      
      public static const ID_AUTO_HOW_0:int = GetNextTextId();
      
      public static const ID_AUTO_RANGE_0:int = GetNextTextId();
      
      public static const ID_AUTO_ATTACK_0:int = GetNextTextId();
      
      public static const ID_AUTO_DEFENSE_0:int = GetNextTextId();
      
      public static const ID_AUTO_RESIST_0:int = GetNextTextId();
      
      public static const ID_AUTO_UNIT_1:int = GetNextTextId();
      
      public static const ID_AUTO_POINTS_1:int = GetNextTextId();
      
      public static const ID_AUTO_NAME_1:int = GetNextTextId();
      
      public static const ID_AUTO_SPECIALS_0:int = GetNextTextId();
      
      public static const ID_AUTO_ARMORS_0:int = GetNextTextId();
      
      public static const ID_AUTO_SHIELDS_0:int = GetNextTextId();
      
      public static const ID_AUTO_WEAPONS_0:int = GetNextTextId();
      
      public static const ID_AUTO_ALL_0:int = GetNextTextId();
      
      public static const ID_AUTO_BACK_0:int = GetNextTextId();
      
      public static const ID_AUTO_SHOW_0:int = GetNextTextId();
      
      public static const ID_AUTO_RANKED_0:int = GetNextTextId();
      
      public static const ID_AUTO_TUTORIAL_0:int = GetNextTextId();
      
      public static const ID_AUTO_UNEQUIP_0:int = GetNextTextId();
      
      public static const ID_AUTO_LOW_0:int = GetNextTextId();
      
      public static const ID_AUTO_MEDIUM_0:int = GetNextTextId();
      
      public static const ID_AUTO_HIGH_0:int = GetNextTextId();
      
      public static const ID_AUTO_RESET_0:int = GetNextTextId();
      
      public static const ID_AUTO_FIGHT_0:int = GetNextTextId();
      
      public static const ID_AUTO_DELETE_0:int = GetNextTextId();
      
      public static const ID_AUTO_DONE_0:int = GetNextTextId();
      
      public static const ID_AUTO_LINK_0:int = GetNextTextId();
      
      public static const ID_AUTO_FLAG_1:int = GetNextTextId();
      
      public static const ID_AUTO_COMPLETE_1:int = GetNextTextId();
      
      public static const ID_AUTO_APPARAIT_0:int = GetNextTextId();
      
      public static const ID_AUTO_BUY_0:int = GetNextTextId();
      
      public static const ID_AUTO_SAVING_0:int = GetNextTextId();
      
      public static const ID_AUTO___11:int = GetNextTextId();
      
      public static const ID_AUTO____5:int = GetNextTextId();
      
      public static const ID_AUTO_____1:int = GetNextTextId();
      
      public static const ID_AUTO_SEARCHING_ENEMY_0:int = GetNextTextId();
      
      public static const ID_AUTO_SHARING_0:int = GetNextTextId();
      
      public static const ID_AUTO_LOADING_0:int = GetNextTextId();
      
      public static const ID_AUTO_REGISTERING_0:int = GetNextTextId();
      
      public static const ID_AUTO_CONNECTING_0:int = GetNextTextId();
      
      public static const ID_AUTO_SHARE_0:int = GetNextTextId();
      
      public static const ID_AUTO_INVITE_1:int = GetNextTextId();
      
      public static const ID_AUTO_YES_0:int = GetNextTextId();
      
      public static const ID_AUTO_NO_0:int = GetNextTextId();
      
      public static const ID_AUTO___12:int = GetNextTextId();
      
      public static const ID_AUTO___13:int = GetNextTextId();
      
      public static const ID_AUTO___14:int = GetNextTextId();
      
      public static const ID_AUTO___15:int = GetNextTextId();
      
      public static const ID_AUTO___16:int = GetNextTextId();
      
      public static const ID_AUTO___17:int = GetNextTextId();
      
      public static const ID_AUTO___18:int = GetNextTextId();
      
      public static const ID_AUTO____6:int = GetNextTextId();
      
      public static const ID_AUTO___19:int = GetNextTextId();
      
      public static const ID_AUTO____7:int = GetNextTextId();
      
      public static const ID_AUTO_____2:int = GetNextTextId();
      
      public static const ID_AUTO____8:int = GetNextTextId();
      
      public static const ID_AUTO____9:int = GetNextTextId();
      
      public static const ID_AUTO____10:int = GetNextTextId();
      
      public static const ID_AUTO____11:int = GetNextTextId();
      
      public static const ID_AUTO____12:int = GetNextTextId();
      
      public static const ID_AUTO____13:int = GetNextTextId();
      
      public static const ID_AUTO____14:int = GetNextTextId();
      
      public static const ID_AUTO____15:int = GetNextTextId();
      
      public static const ID_AUTO_ENTER_0:int = GetNextTextId();
      
      public static const ID_AUTO_ADD_0:int = GetNextTextId();
      
      public static const ID_AUTO_STONE_1:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_12:int = GetNextTextId();
      
      public static const ID_AUTO___20:int = GetNextTextId();
      
      public static const ID_AUTO_CHANGE_0:int = GetNextTextId();
      
      public static const ID_AUTO_GIVE_1:int = GetNextTextId();
      
      public static const ID_AUTO_ACT_0:int = GetNextTextId();
      
      public static const ID_AUTO_ACT_1:int = GetNextTextId();
      
      public static const ID_AUTO_ACT_2:int = GetNextTextId();
      
      public static const ID_AUTO_REWARD_0:int = GetNextTextId();
      
      public static const ID_AUTO_REWARD_1:int = GetNextTextId();
      
      public static const ID_AUTO_LOGIN_0:int = GetNextTextId();
      
      public static const ID_AUTO_USERNAME_0:int = GetNextTextId();
      
      public static const ID_AUTO_PASSWORD_0:int = GetNextTextId();
      
      public static const ID_AUTO_PLAY_0:int = GetNextTextId();
      
      public static const ID_AUTO_PLAY_1:int = GetNextTextId();
      
      public static const ID_AUTO_SIGN_0:int = GetNextTextId();
      
      public static const ID_AUTO_CLOSE_0:int = GetNextTextId();
      
      public static const ID_AUTO_SAVE_1:int = GetNextTextId();
      
      public static const ID_AUTO___21:int = GetNextTextId();
      
      public static const ID_AUTO_RARE_1:int = GetNextTextId();
      
      public static const ID_AUTO______0:int = GetNextTextId();
      
      public static const ID_AUTO______1:int = GetNextTextId();
      
      public static const ID_AUTO_____3:int = GetNextTextId();
      
      public static const ID_AUTO_____4:int = GetNextTextId();
      
      public static const ID_AUTO_REWARD_2:int = GetNextTextId();
      
      public static const ID_AUTO_HERE_2:int = GetNextTextId();
      
      public static const ID_AUTO_RECRUITMENT_0:int = GetNextTextId();
      
      public static const ID_AUTO_HERE_3:int = GetNextTextId();
      
      public static const ID_AUTO_RECRUITED_0:int = GetNextTextId();
      
      public static const ID_AUTO_OK_0:int = GetNextTextId();
      
      public static const ID_AUTO_CANCEL_0:int = GetNextTextId();
      
      public static const ID_AUTO_ARMY_0:int = GetNextTextId();
      
      public static const ID_AUTO_BEFORE_1:int = GetNextTextId();
      
      public static const ID_AUTO_RENAME_0:int = GetNextTextId();
      
      public static const ID_AUTO_GOLD_1:int = GetNextTextId();
      
      public static const ID_AUTO_THANKS_0:int = GetNextTextId();
      
      public static const ID_AUTO_______0:int = GetNextTextId();
      
      public static const ID_AUTO________0:int = GetNextTextId();
      
      public static const ID_AUTO________1:int = GetNextTextId();
      
      public static const ID_AUTO________2:int = GetNextTextId();
      
      public static const ID_AUTO_BEST_0:int = GetNextTextId();
      
      public static const ID_AUTO_LOADING_1:int = GetNextTextId();
      
      public static const ID_AUTO_NEXT_0:int = GetNextTextId();
      
      public static const ID_AUTO_PREVIOUS_0:int = GetNextTextId();
      
      public static const ID_AUTO_ACTIVATE_1:int = GetNextTextId();
      
      public static const ID_AUTO_DEACTIVATE_1:int = GetNextTextId();
      
      public static const ID_AUTO_VICTORY_0:int = GetNextTextId();
      
      public static const ID_AUTO_CONTINUE_0:int = GetNextTextId();
      
      public static const ID_AUTO_YOU_VE_0:int = GetNextTextId();
      
      public static const ID_AUTO_DRAW_0:int = GetNextTextId();
      
      public static const ID_AUTO_TIPS_0:int = GetNextTextId();
      
      public static const ID_AUTO_RANKED_1:int = GetNextTextId();
      
      public static const ID_TUTO_INIT_PAGE_1:int = GetNextTextId();
      
      public static const ID_TUTO_INIT_PAGE_2:int = GetNextTextId();
      
      public static const ID_TUTO_INIT_PAGE_3:int = GetNextTextId();
      
      public static const ID_TUTO_INIT_PAGE_4:int = GetNextTextId();
      
      public static const ID_TUTO_FLAG_PAGE_2:int = GetNextTextId();
      
      public static const ID_TUTO_FLAG_PAGE_3:int = GetNextTextId();
      
      public static const ID_TUTORIAL_CREATE_PAGE_1:int = GetNextTextId();
      
      public static const ID_TUTORIAL_CREATE_PAGE_2:int = GetNextTextId();
      
      public static const ID_TUTORIAL_CREATE_PAGE_3:int = GetNextTextId();
      
      public static const ID_TUTORIAL_CREATE_PAGE_4:int = GetNextTextId();
      
      public static const ID_TUTORIAL_CREATE_PAGE_5:int = GetNextTextId();
      
      public static const ID_AUTO_12X:int = GetNextTextId();
      
      public static const ID_AUTO_6X:int = GetNextTextId();
      
      public static const ID_AUTO_1X:int = GetNextTextId();
      
      public static const ID_DAILY_UNDEAD:int = GetNextTextId();
      
      public static const ID_DAILY_HUMAN:int = GetNextTextId();
      
      public static const ID_DAILY_ORC:int = GetNextTextId();
      
      public static const ID_DAILY_VERMINE:int = GetNextTextId();
      
      public static const ID_DAILY_BEHEMOT:int = GetNextTextId();
      
      public static const ID_DAILY_REPTILIAN:int = GetNextTextId();
      
      public static const ID_DAILY_OCTOPOD:int = GetNextTextId();
      
      public static const ID_DAILY_FIRE:int = GetNextTextId();
      
      public static const ID_DAILY_WATER:int = GetNextTextId();
      
      public static const ID_DAILY_POISON:int = GetNextTextId();
      
      public static const ID_DAILY_LIGHTNING:int = GetNextTextId();
      
      public static const ID_DAILY_IMP:int = GetNextTextId();
      
      public static const ID_DAILY_GOLEM:int = GetNextTextId();
      
      public static const ID_AWARDED_AT_FLAG:int = GetNextTextId();
      
      public static const ID_PACK_OF_THE_DAY:int = GetNextTextId();
      
      public static const ID_PACK_OF_THE_WEEK:int = GetNextTextId();
      
      public static const ID_NOT_CONNECTED_ON_ARMORGAMES:int = GetNextTextId();
      
      public static const ID_ARE_YOU_SURE_YOU_WANT_TO_CONCEDE:int = GetNextTextId();
      
      public static const ID_ARMORGAME_MTX:int = GetNextTextId();
      
      public static const ID_DELETE_DATA:int = GetNextTextId();
      
      public static const ID_DO_YOU_WANT_DELETE:int = GetNextTextId();
      
      public static const ID_ARE_YOU_SURE_YOU_WANT_TO_DELETE:int = GetNextTextId();
      
      public static const ID_RESET_MULTIPLAYER_ARMY:int = GetNextTextId();
      
      public static const ID_DO_YOU_WANT_TO_RESET_ARMY:int = GetNextTextId();
      
      public static const ID_AUTO_CAPTCHA:int = GetNextTextId();
      
      public static const ID_SURVIVAL_COOP:int = GetNextTextId();
      
      public static const ID_CLASSIC_1000_PTS:int = GetNextTextId();
      
      public static const ID_CLASSIC_500_PTS:int = GetNextTextId();
      
      public static const ID_TOURNAMENT_MODE:int = GetNextTextId();
      
      public static const ID_AUTO_ME_1:int = GetNextTextId();
      
      public static const ID_AUTO_FRIEND_1:int = GetNextTextId();
      
      public static const ID_ARMY_5_NUMBER:int = GetNextTextId();
      
      public static const ID_CLEAR_CRAFT:int = GetNextTextId();
      
      public static const ID_SURVIVAL_MODE:int = GetNextTextId();
      
      public static const ID_TEXT_BACK_ROW:int = GetNextTextId();
      
      public static const ID_TEXT_FRONT_ROW:int = GetNextTextId();
      
      public static const ID_CHOOSE_YOUR_ALLY:int = GetNextTextId();
      
      public static const ID_TOURNAMENT:int = GetNextTextId();
      
      public static const ID_CHANGE_FIGHTS:int = GetNextTextId();
      
      public static const ID_CRAFTING:int = GetNextTextId();
      
      public static const ID_CONSUME:int = GetNextTextId();
      
      public static const ID_CRAFT_ITEM:int = GetNextTextId();
      
      public static const ID_CANT_CONSUME_MORE:int = GetNextTextId();
      
      public static const ID_CRAFT_BOOSTER_REWARD:int = GetNextTextId();
      
      public static const ID_MYTHIC_BOOSTER_REWARD:int = GetNextTextId();
      
      public static const ID_ARE_YOU_SURE_YOU_WANT_TO_CRAFT:int = GetNextTextId();
      
      public function BC_TextFactory()
      {
         super();
      }
      
      public static function GetRarityMsg(id:int) : String
      {
         switch(id)
         {
            case ModelEquipement.RARITY_COMMUN:
               return TextFactory.instance.GetMsg(BC_TextFactory.ID_COMMUN_TEXT);
            case ModelEquipement.RARITY_UNCOMMUN:
               return TextFactory.instance.GetMsg(BC_TextFactory.ID_UNCOMMUN_TEXT);
            case ModelEquipement.RARITY_RARE:
               return TextFactory.instance.GetMsg(BC_TextFactory.ID_RARE_TEXT);
            case ModelEquipement.RARITY_LEGENDARY:
               return TextFactory.instance.GetMsg(BC_TextFactory.ID_LEGENDARY_TEXT);
            default:
               return TextFactory.instance.GetMsg(BC_TextFactory.ID_COMMUN_TEXT);
         }
      }
      
      public static function GetRandomTips() : int
      {
         return TIPS_ARRAY[Math.floor(Math.random() * TIPS_ARRAY.length)];
      }
      
      override public function Init() : void
      {
         super.Init();
         ID_RARITY_TEXT_ARRAY = new Array(ID_ALL_RARITY_TEXT,ID_COMMUN_TEXT,ID_UNCOMMUN_TEXT,ID_RARE_TEXT,ID_LEGENDARY_TEXT);
         TIPS_ARRAY = new Array(ID_RANDOM_TIPS_1,ID_RANDOM_TIPS_2,ID_RANDOM_TIPS_3,ID_RANDOM_TIPS_4,ID_RANDOM_TIPS_5,ID_RANDOM_TIPS_6,ID_RANDOM_TIPS_7,ID_RANDOM_TIPS_8,ID_RANDOM_TIPS_9,ID_RANDOM_TIPS_10,ID_RANDOM_TIPS_11,ID_RANDOM_TIPS_12,ID_RANDOM_TIPS_13,ID_RANDOM_TIPS_14,ID_RANDOM_TIPS_15,ID_RANDOM_TIPS_16,ID_RANDOM_TIPS_17,ID_RANDOM_TIPS_18,ID_RANDOM_TIPS_19,ID_RANDOM_TIPS_20,ID_RANDOM_TIPS_21,ID_RANDOM_TIPS_22,ID_RANDOM_TIPS_23,ID_RANDOM_TIPS_24,ID_RANDOM_TIPS_25,ID_RANDOM_TIPS_26,ID_RANDOM_TIPS_27,ID_RANDOM_TIPS_28);
      }
      
      override public function GetId(s:String) : int
      {
         if(BC_TextFactory[s] == null)
         {
            return -1;
         }
         return BC_TextFactory[s];
      }
      
      override protected function AddText() : void
      {
         super.AddText();
         LANGUAGE_EN.AddText(ID_AUTO_END_ACT_3_TXT,"Complete silence engulf the scene, not even a gasp comes out of your troops, you all stare down at the demonic bodies as they shrivel into a pile of refuse.\n\nThe Nightmare is finally over.\n\nYou quickly turn around screaming for your men, suddenly remembering the incoming undead swarm, but not a single one is to be seen as if they had vanished from existence, along with your words as not a single sound seemed to escape your mouth.\n\nAs the last speckle of Demonic remains disintegrates into nothingness, the sun rises again over the hills and, finally, sounds of waking birds break the silence.\n\nThe Kingdom is safe once again, thanks to you!");
         LANGUAGE_EN.AddText(ID_AUTO_CHAPTER_3_COMPLETED,"CHAPTER 1 COMPLETED!");
         LANGUAGE_EN.AddText(ID_SQUAD_SPEED_HOLD,"HOLD");
         LANGUAGE_EN.AddText(ID_SQUAD_SPEED_SLOW,"SLOW");
         LANGUAGE_EN.AddText(ID_SQUAD_SPEED_FAST,"FAST");
         LANGUAGE_EN.AddText(ID_ALL_RARITY_TEXT,"ALL");
         LANGUAGE_EN.AddText(ID_COMMUN_TEXT,"COMMON");
         LANGUAGE_EN.AddText(ID_UNCOMMUN_TEXT,"UNCOMMON");
         LANGUAGE_EN.AddText(ID_RARE_TEXT,"RARE");
         LANGUAGE_EN.AddText(ID_LEGENDARY_TEXT,"LEGENDARY");
         LANGUAGE_EN.AddText(ID_NOT_CONNECTED_GAMERSAFE,"You are not connected to GamerSafe\nYou need to be if you want to add friends to your list !");
         LANGUAGE_EN.AddText(ID_ALREADY_YOUR_FRIEND,"This person is already on your friend list !\nDon\'t worry, you\'ll probably get an invite to his birthday party !");
         LANGUAGE_EN.AddText(ID_IS_NOW_YOUR_FRIEND," is now your friend !");
         LANGUAGE_EN.AddText(ID_FRIEND_WASNT_FOUND,"This person was not found in the Battle Cry world.");
         LANGUAGE_EN.AddText(ID_CANT_ADD_YOURSELF,"There\'s a time and place to play with yourself, this isn\'t one.");
         LANGUAGE_EN.AddText(ID_GAIN_A_RANK,"You gain a Rank !");
         LANGUAGE_EN.AddText(ID_NO_RANK_CHANGE,"No Rank change.");
         LANGUAGE_EN.AddText(ID_LOSE_A_RANK,"Lost your Rank.");
         LANGUAGE_EN.AddText(ID_ALONE_IN_RANKING,"It\'s lonely at the top ! Unable to find you an opponent at this moment.");
         LANGUAGE_EN.AddText(ID_MSG,"English");
         LANGUAGE_EN.AddText(ID_CASH,"Cash : ");
         LANGUAGE_EN.AddText(ID_RANKING_SERF,"Serf");
         LANGUAGE_EN.AddText(ID_RANKING_PEASANT,"Peasant");
         LANGUAGE_EN.AddText(ID_RANKING_CONSCRIPT,"Conscript");
         LANGUAGE_EN.AddText(ID_RANKING_SQUIRE,"Squire");
         LANGUAGE_EN.AddText(ID_RANKING_MEN_AT_ARMS,"Men At Arms");
         LANGUAGE_EN.AddText(ID_RANKING_SOLDIER,"Soldier");
         LANGUAGE_EN.AddText(ID_RANKING_MERCENARY,"Mercenary");
         LANGUAGE_EN.AddText(ID_RANKING_ELITE_SOLDIER,"Elite Soldier");
         LANGUAGE_EN.AddText(ID_RANKING_CAPTAIN,"Captain");
         LANGUAGE_EN.AddText(ID_RANKING_KNIGHT,"Knight");
         LANGUAGE_EN.AddText(ID_RANKING_BARON,"Baron");
         LANGUAGE_EN.AddText(ID_RANKING_DUKE,"Duke");
         LANGUAGE_EN.AddText(ID_RANKING_LORD,"Lord");
         LANGUAGE_EN.AddText(ID_RANKING_CHAMPION,"Champion");
         LANGUAGE_EN.AddText(ID_RANKING_COMMANDER,"Commander");
         LANGUAGE_EN.AddText(ID_RANKING_GENERAL,"General");
         LANGUAGE_EN.AddText(ID_RANKING_BATTLE_MASTER,"Battle Master");
         LANGUAGE_EN.AddText(ID_RANKING_HERO,"Hero");
         LANGUAGE_EN.AddText(ID_RANKING_ARCH_DUKE,"Arch Duke");
         LANGUAGE_EN.AddText(ID_RANKING_CHANCELLOR,"Chancellor");
         LANGUAGE_EN.AddText(ID_RANKING_WARLORD,"Warlord");
         LANGUAGE_EN.AddText(ID_RANKING_KING,"King");
         LANGUAGE_EN.AddText(ID_RANKING_OVERLORD,"Overlord");
         LANGUAGE_EN.AddText(ID_RANKING_EMPEROR,"Emperor");
         LANGUAGE_EN.AddText(ID_CREATURE_HUMAN_NAME,"Human");
         LANGUAGE_EN.AddText(ID_CREATURE_HUMAN_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_IMMORTAL_NAME,"Immortal");
         LANGUAGE_EN.AddText(ID_CREATURE_IMMORTAL_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_ORC_NAME,"Orc");
         LANGUAGE_EN.AddText(ID_CREATURE_ORC_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_IMP_NAME,"Imp");
         LANGUAGE_EN.AddText(ID_CREATURE_IMP_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_BALISTA_NAME,"Ballista");
         LANGUAGE_EN.AddText(ID_CREATURE_BALISTA_DESC,"*Locks all other slots.\n*Reload Time : 13s.\n*Uses 3 Cases.\n*Deals SPLASH DMG on 3 Cases.");
         LANGUAGE_EN.AddText(ID_CREATURE_CATAPULT_NAME,"Catapult");
         LANGUAGE_EN.AddText(ID_CREATURE_CATAPULT_DESC,"*Locks all other slots.\n*Reload Time : 12s.\n*Uses 6 Cases.\n*Deals SPLASH DMG on 6 Cases.");
         LANGUAGE_EN.AddText(ID_CREATURE_CANNON_NAME,"Cannon");
         LANGUAGE_EN.AddText(ID_CREATURE_CANNON_DESC,"*Locks all other slots.\n*Reload Time : 18s.\n*Uses 6 Cases.\n*Deals SPLASH DMG on 6 Cases.");
         LANGUAGE_EN.AddText(ID_CREATURE_UNDEAD_NAME,"Undead");
         LANGUAGE_EN.AddText(ID_CREATURE_UNDEAD_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_INSECTOID_NAME,"Insectoid");
         LANGUAGE_EN.AddText(ID_CREATURE_INSECTOID_DESC,"*Starts in larva form for 20s.");
         LANGUAGE_EN.AddText(ID_CREATURE_VERMINE_NAME,"Vermin");
         LANGUAGE_EN.AddText(ID_CREATURE_VERMINE_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_REPTILIAN_NAME,"Reptilian");
         LANGUAGE_EN.AddText(ID_CREATURE_REPTILIAN_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_LYCANTROP_NAME,"Lycanthrope");
         LANGUAGE_EN.AddText(ID_CREATURE_LYCANTROP_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_GOLEM_NAME,"Golem");
         LANGUAGE_EN.AddText(ID_CREATURE_GOLEM_DESC,"*Dies after 20s.");
         LANGUAGE_EN.AddText(ID_CREATURE_FISHMAN_NAME,"Fishman");
         LANGUAGE_EN.AddText(ID_CREATURE_FISHMAN_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_UNDEADCATAPULT_NAME,"Undead Catapult");
         LANGUAGE_EN.AddText(ID_CREATURE_UNDEADCATAPULT_DESC,"*Locks all other slots.\n*Reload Time : 12s.\n*Uses 6 Cases.\nDeals SPLASH DMG on 6 Cases.");
         LANGUAGE_EN.AddText(ID_CREATURE_STEAMCHARIOT_NAME,"Steam Chariot");
         LANGUAGE_EN.AddText(ID_CREATURE_STEAMCHARIOT_DESC,"*Locks all other slots.\n*Uses 6 Cases.\nDeals SPLASH DMG on 2 cases in front of it.");
         LANGUAGE_EN.AddText(ID_CREATURE_PLAGUECANON_NAME,"Plague Cannon");
         LANGUAGE_EN.AddText(ID_CREATURE_PLAGUECANON_DESC,"*Locks all other slots.\n*Reload Time : 15s.\n*Uses 6 Cases.\nDeals SPLASH DMG on 6 Cases.");
         LANGUAGE_EN.AddText(ID_CREATURE_GIANTFLAMER_NAME,"Giant Flamethrower");
         LANGUAGE_EN.AddText(ID_CREATURE_GIANTFLAMER_DESC,"*Locks all other slots.\n*Reload Time : 5s.\n*Uses 3 Cases.\nDeals SPLASH DMG 6 case in front of it.");
         LANGUAGE_EN.AddText(ID_CREATURE_FIREELEMENTAL_NAME,"Fire Elemental");
         LANGUAGE_EN.AddText(ID_CREATURE_FIREELEMENTAL_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_WATERELEMENTAL_NAME,"Water Elemental");
         LANGUAGE_EN.AddText(ID_CREATURE_WATERELEMENTAL_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_POISONELEMENTAL_NAME,"Poison Elemental");
         LANGUAGE_EN.AddText(ID_CREATURE_POISONELEMENTAL_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_THUNDERELEMENTAL_NAME,"Thunder Elemental");
         LANGUAGE_EN.AddText(ID_CREATURE_THUNDERELEMENTAL_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_OCTOPOD_NAME,"Octopod");
         LANGUAGE_EN.AddText(ID_CREATURE_OCTOPOD_DESC,"*Speeds up casting time by 5s. (can\'t go under 2s)");
         LANGUAGE_EN.AddText(ID_CREATURE_DEMON_NAME,"Demon");
         LANGUAGE_EN.AddText(ID_CREATURE_DEMON_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_ANGEL_NAME,"Angel");
         LANGUAGE_EN.AddText(ID_CREATURE_ANGEL_DESC,"");
         LANGUAGE_EN.AddText(ID_CREATURE_STEAM_BEHEMOT_NAME,"Steam Behemoth");
         LANGUAGE_EN.AddText(ID_CREATURE_STEAM_BEHEMOT_DESC,"*Locks all other slot.\n*Uses 9 Cases.\n*Deals SPLASH DMG on 3 Cases in front of it.");
         LANGUAGE_EN.AddText(ID_CREATURE_FAMINE_NAME,"Famine");
         LANGUAGE_EN.AddText(ID_CREATURE_FAMINE_DESC,"*Aura : Every unit in your army gets -10 DEF.");
         LANGUAGE_EN.AddText(ID_CREATURE_WAR_NAME,"War");
         LANGUAGE_EN.AddText(ID_CREATURE_WAR_DESC,"*Aura : Every enemy unit gains +3 Slash ATK and +3 Piercing ATK.");
         LANGUAGE_EN.AddText(ID_CREATURE_CONQUEST_NAME,"Conquest");
         LANGUAGE_EN.AddText(ID_CREATURE_CONQUEST_DESC,"*Aura : Every enemy unit gains +5 DEF.");
         LANGUAGE_EN.AddText(ID_CREATURE_DEATH_NAME,"Death");
         LANGUAGE_EN.AddText(ID_CREATURE_DEATH_DESC,"*Aura : Every unit in your army loses 3 DEF every 10s.");
         LANGUAGE_EN.AddText(ID_WEAPON_IRONSWORD_NAME,"Iron Sword");
         LANGUAGE_EN.AddText(ID_WEAPON_IRONSWORD_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_SPEAR_NAME,"Spear");
         LANGUAGE_EN.AddText(ID_WEAPON_SPEAR_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_WEAPON_MACE_NAME,"Mace");
         LANGUAGE_EN.AddText(ID_WEAPON_MACE_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_AXE_NAME,"Axe");
         LANGUAGE_EN.AddText(ID_WEAPON_AXE_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_2HSWORD_NAME,"Two-Handed Sword");
         LANGUAGE_EN.AddText(ID_WEAPON_2HSWORD_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_WEAPON_2HAXE_NAME,"Two-Handed Axe");
         LANGUAGE_EN.AddText(ID_WEAPON_2HAXE_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_WEAPON_2HMACE_NAME,"Two-Handed Mace");
         LANGUAGE_EN.AddText(ID_WEAPON_2HMACE_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_WEAPON_PISTOL_NAME,"Pistol");
         LANGUAGE_EN.AddText(ID_WEAPON_PISTOL_DESC,"*Reload Time : 8s.");
         LANGUAGE_EN.AddText(ID_WEAPON_MUSKET_NAME,"Musket");
         LANGUAGE_EN.AddText(ID_WEAPON_MUSKET_DESC,"*Locks Shield Slot.\n*Reload Time : 8s.");
         LANGUAGE_EN.AddText(ID_WEAPON_HALBERD_NAME,"Halberd");
         LANGUAGE_EN.AddText(ID_WEAPON_HALBERD_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_WEAPON_TORCH_NAME,"Torch");
         LANGUAGE_EN.AddText(ID_WEAPON_TORCH_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_DAGGER_NAME,"Dagger");
         LANGUAGE_EN.AddText(ID_WEAPON_DAGGER_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_PIKE_NAME,"Pike");
         LANGUAGE_EN.AddText(ID_WEAPON_PIKE_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_WEAPON_WARHAMMER_NAME,"War Hammer");
         LANGUAGE_EN.AddText(ID_WEAPON_WARHAMMER_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_2HWARHAMMER_NAME,"Two-Handed War Hammer");
         LANGUAGE_EN.AddText(ID_WEAPON_2HWARHAMMER_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_WEAPON_FIRESTAFF_NAME,"Fire Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_FIRESTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 10s.\n *Cast : Deals 10 Fire DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_ICESTAFF_NAME,"Ice Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_ICESTAFF_DESC,"*Locks Shield Slot.\nCasting Time : 10s.\n*Cast : Deals 10 Ice DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_POISONSTAFF_NAME,"Poison Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_POISONSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 10s. \n*Cast : Deals 10 Poison DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_THUNDERSTAFF_NAME,"Thunder Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_THUNDERSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 10s. \n*Cast : Deals 10 Thunder DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_DARKSTAFF_NAME,"Dark Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_DARKSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 10s. \n*Cast : Deals 10 Dark DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_HOLYSTAFF_NAME,"Holy Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_HOLYSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 10s. \n*Cast : Deals 10 Holy DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_LONGBOW_NAME,"Long Bow");
         LANGUAGE_EN.AddText(ID_WEAPON_LONGBOW_DESC,"*Locks Shield Slot.\n*Reload Time : 6s.");
         LANGUAGE_EN.AddText(ID_WEAPON_COMPOSITEBOW_NAME,"Composite Bow");
         LANGUAGE_EN.AddText(ID_WEAPON_COMPOSITEBOW_DESC,"*Locks Shield Slot.\n*Reload Time : 6s.");
         LANGUAGE_EN.AddText(ID_WEAPON_SHORTBOW_NAME,"Short Bow");
         LANGUAGE_EN.AddText(ID_WEAPON_SHORTBOW_DESC,"*Locks Shield Slot.\n*Reload Time : 4s.");
         LANGUAGE_EN.AddText(ID_WEAPON_SWORDSMANFLAG_NAME,"Swordsman Flag");
         LANGUAGE_EN.AddText(ID_WEAPON_SWORDSMANFLAG_DESC,"*Locks Shield Slot.\n*Aura : Every unit in this squad gains +1 Slash ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_BARBARIANFLAG_NAME,"Barbarian Flag");
         LANGUAGE_EN.AddText(ID_WEAPON_BARBARIANFLAG_DESC,"*Locks Shield Slot.\n*Aura : Every unit in this squad gains +1 Blunt ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_PIKEMANFLAG_NAME,"Pikeman Flag");
         LANGUAGE_EN.AddText(ID_WEAPON_PIKEMANFLAG_DESC,"*Locks Shield Slot.\n*Aura : Every unit in this squad gains +1 Piercing ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_SAPPERFLAG_NAME,"Sapper Flag");
         LANGUAGE_EN.AddText(ID_WEAPON_SAPPERFLAG_DESC,"*Locks Shield Slot.\n*Aura : Every unit in this squad gains +1 Explosion ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_FLAMEFLAG_NAME,"Flame Flag");
         LANGUAGE_EN.AddText(ID_WEAPON_FLAMEFLAG_DESC,"*Locks Shield Slot.\n*Aura : Every unit in this squad gains +1 Fire ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_FROSTFLAG_NAME,"Frost Flag");
         LANGUAGE_EN.AddText(ID_WEAPON_FROSTFLAG_DESC,"*Locks Shield Slot.\n*Aura : Every unit in this squad gains +1 Ice ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_VIPERFLAG_NAME,"Viper Flag");
         LANGUAGE_EN.AddText(ID_WEAPON_VIPERFLAG_DESC,"*Locks Shield Slot.\n*Aura : Every unit in this squad gains +1 Poison ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_BOLTFLAG_NAME,"Bolt Flag");
         LANGUAGE_EN.AddText(ID_WEAPON_BOLTFLAG_DESC,"*Locks Shield Slot.\n*Aura : Every unit in this squad gains +1 Thunder ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_CULTFLAG_NAME,"Cult Flag");
         LANGUAGE_EN.AddText(ID_WEAPON_CULTFLAG_DESC,"*Locks Shield Slot.\n*Aura : Every unit in this squad gains +1 Dark ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_CLERICFLAG_NAME,"Blessed Flag");
         LANGUAGE_EN.AddText(ID_WEAPON_CLERICFLAG_DESC,"*Locks Shield Slot.\n*Aura : Every unit in this squad gains +1 Holy ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_TOWERFLAG_NAME,"Tower Flag");
         LANGUAGE_EN.AddText(ID_WEAPON_TOWERFLAG_DESC,"*Locks Shield Slot.\n*Aura : Every unit in this squad gains +2 DEF.");
         LANGUAGE_EN.AddText(ID_WEAPON_FIRESWORD_NAME,"Fire Sword");
         LANGUAGE_EN.AddText(ID_WEAPON_FIRESOWRD_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_ICEPIKE_NAME,"Ice Pike");
         LANGUAGE_EN.AddText(ID_WEAPON_ICEPIKE_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_WEAPON_BOOMSTICK_NAME,"Boom Stick");
         LANGUAGE_EN.AddText(ID_WEAPON_BOOMSTICK_DESC,"*Locks Shield Slot.\n*Reload Time : 8s.");
         LANGUAGE_EN.AddText(ID_WEAPON_SHRAPNELMUSKET_NAME,"Shrapnel Musket");
         LANGUAGE_EN.AddText(ID_WEAPON_SHRAPNELMUSKET_DESC,"*Locks Shield Slot.\n*Reload Time : 8s.");
         LANGUAGE_EN.AddText(ID_WEAPON_REPTILIANDAGGER_NAME,"Reptilian Dagger");
         LANGUAGE_EN.AddText(ID_WEAPON_REPTILIANDAGGER_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_ORCISHHAMMER_NAME,"Orcish Hammer");
         LANGUAGE_EN.AddText(ID_WEAPON_ORCISHHAMMER_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_WEAPON_LIGHTNINGBOW_NAME,"Lightning Bow");
         LANGUAGE_EN.AddText(ID_WEAPON_LIGHTNINGBOW_DESC,"*Locks Shield Slot.\n*Reload Time : 8s.");
         LANGUAGE_EN.AddText(ID_WEAPON_FIREBOW_NAME,"Fire Bow");
         LANGUAGE_EN.AddText(ID_WEAPON_FIREBOW_DESC,"*Locks Shield Slot.\n*Reload Time : 6s.");
         LANGUAGE_EN.AddText(ID_WEAPON_POISONBOW_NAME,"Poison Bow");
         LANGUAGE_EN.AddText(ID_WEAPON_POISONBOW_DESC,"*Locks Shield Slot.\n*Reload Time : 6s.");
         LANGUAGE_EN.AddText(ID_WEAPON_POWERAXE_NAME,"Power Axe");
         LANGUAGE_EN.AddText(ID_WEAPON_POWERAXE_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_CRUSADERMACE_NAME,"Crusader Mace");
         LANGUAGE_EN.AddText(ID_WEAPON_CRUSADERMACE_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_BLACKSWORD_NAME,"Black Sword");
         LANGUAGE_EN.AddText(ID_WEAPON_BLACKSWORD_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_COBRASPEAR_NAME,"Cobra Spear");
         LANGUAGE_EN.AddText(ID_WEAPON_COBRASPEAR_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_WEAPON_FIREBLASTSTAFF_NAME,"Fireblast Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_FIREBLASTSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 25s. \n*Cast : Deals 8 Fire DMG on the enemy\'s front line.");
         LANGUAGE_EN.AddText(ID_WEAPON_BLAZINGSTAFF_NAME,"Blazing Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_BLAZINGSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 30s. \n*Cast : Deals 10 Fire DMG to all units in the melee.");
         LANGUAGE_EN.AddText(ID_WEAPON_ICESTORMSTAFF_NAME,"Ice Storm Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_ICESTORMSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 25s. \n*Cast : Deals 8 Ice DMG to the enemy\'s front line.");
         LANGUAGE_EN.AddText(ID_WEAPON_FROSTBITESTAFF_NAME,"Frostbite Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_FROSTBITESTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 30s.\n*Cast : Deals 10 Ice DMG to all units in the melee.");
         LANGUAGE_EN.AddText(ID_WEAPON_ACIDRAINSTAFF_NAME,"Acid Rain Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_ACIDRAINSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 25s. \n*Cast : Deals 8 Poison DMG to the enemy\'s front line.");
         LANGUAGE_EN.AddText(ID_WEAPON_PLAGUESTAFF_NAME,"Plague Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_PLAGUESTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 30s. \n*Cast : Deals 10 Poison DMG to all units in the melee.");
         LANGUAGE_EN.AddText(ID_WEAPON_LIGHTNINGSTAFF_NAME,"Lighting Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_LIGHTNINGSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 25s. \n*Cast : Deals 8 Thunder DMG to the enemy\'s front line.");
         LANGUAGE_EN.AddText(ID_WEAPON_THUNDERSTORMSTAFF_NAME,"Thunderstorm Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_THUNDERSTORMSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 30s. \n*Cast : Deals 10 Thunder DMG to all units in the melee.");
         LANGUAGE_EN.AddText(ID_WEAPON_ANGELICSTAFF_NAME,"Angelic Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_ANGELICSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 30s. \n*Cast : Every unit in the caster’s squad recovers +10 DEF.\n*Cast : Deals 5 Holy DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_DEMONICSTAFF_NAME,"Demonic Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_DEMONICSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 30s. \n*Cast : Every unit in the caster’s squad gains +10 Dark ATK.\n*Cast : Deals 5 Dark DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_PYROBLADE_NAME,"Pyro Blade");
         LANGUAGE_EN.AddText(ID_WEAPON_PYROBLADE_DESC,"*Triggered Effect (2 ATK): Deals 3 Fire DMG on its target and the 2 cases behind it.");
         LANGUAGE_EN.AddText(ID_WEAPON_BOLTHAMMER_NAME,"Bolt Hammer");
         LANGUAGE_EN.AddText(ID_WEAPON_BOLTHAMMER_DESC,"*Triggered Effect (2 ATK) : Deals 2 Thunder DMG on its target and the 2 cases behind it.");
         LANGUAGE_EN.AddText(ID_WEAPON_NECRONBLADE_NAME,"Necron Blade");
         LANGUAGE_EN.AddText(ID_WEAPON_NECRONBLADE_DESC,"*Triggered Effect (on-kill) : Raises an Undead warrior in your army.");
         LANGUAGE_EN.AddText(ID_WEAPON_PLAGUESPIKE_NAME,"Plague Spike");
         LANGUAGE_EN.AddText(ID_WEAPON_PLAGUESPIKE_DESC,"*Triggered Effect (2 ATK) : Deals 2 Poison DMG on its target and the 2 cases behind it.");
         LANGUAGE_EN.AddText(ID_WEAPON_FROSTAXE_NAME,"Frost Axe");
         LANGUAGE_EN.AddText(ID_WEAPON_FROSTAXE_DESC,"*Triggered Effect (2 ATK) : Deals 2 Ice DMG on its target and the 2 cases behind it.");
         LANGUAGE_EN.AddText(ID_WEAPON_SAINTBLADE_NAME,"Saint Blade");
         LANGUAGE_EN.AddText(ID_WEAPON_SAINTBLADE_DESC,"*Triggered Effect (on-kill) : Every unit in this squad gains +1 DEF.");
         LANGUAGE_EN.AddText(ID_WEAPON_BLASTHAMMER_NAME,"Blast Hammer");
         LANGUAGE_EN.AddText(ID_WEAPON_BLASTHAMMER_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_WEAPON_WARBOW_NAME,"War Bow");
         LANGUAGE_EN.AddText(ID_WEAPON_WARBOW_DESC,"*Locks Shield Slot.\n*Reload Time : 6s.");
         LANGUAGE_EN.AddText(ID_WEAPON_COMPOSITESWORD_NAME,"Composite Sword");
         LANGUAGE_EN.AddText(ID_WEAPON_COMPOSITESWORD_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_POWERHAMMER_NAME,"Power Hammer");
         LANGUAGE_EN.AddText(ID_WEAPON_POWERHAMMER_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_SOLARSTAFF_NAME,"Solar Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_SOLARSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 50s.\n*Cast : Deals 18 Fire DMG to ALL units.");
         LANGUAGE_EN.AddText(ID_WEAPON_ARMAGEDONSTAFF_NAME,"Armageddon Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_ARMAGEDONSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 70s.\n*Cast :Deals 15 Explosion DMG to every enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_OKKORAZSTAFF_NAME,"Ok Koraz\'s Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_OKKORAZSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 20s.\n*Cast : Deals 10 Thunder DMG on each case in front of him.");
         LANGUAGE_EN.AddText(ID_WEAPON_ORYTHSTAFF_NAME,"Splinter of Oryth");
         LANGUAGE_EN.AddText(ID_WEAPON_ORYTHSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 35s.\n*Cast : Turns the caster into a Demon warrior.");
         LANGUAGE_EN.AddText(ID_WEAPON_ANGELSTAFF_NAME,"Angel Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_ANGELSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 40s.\n*Cast : Fully recovers the DEF of ALL units.");
         LANGUAGE_EN.AddText(ID_WEAPON_VASSPOTANAXSTAFF_NAME,"Vass Potanax\'s Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_VASSPOTANAXSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 40s.\n*Cast : Deals 10 Poison DMG to ALL units.");
         LANGUAGE_EN.AddText(ID_WEAPON_ULTIMASTAFF_NAME,"Ultima Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_ULTIMASTAFF_DESC,"*Locks Shield Slot.\n*Aura : Speeds up casting time of ALL units by 10s. (can\'t go under 2s)\n*Casting Time : 35s.\n*Cast : Deals 10 Thunder DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_MAGICSWORD_NAME,"Magic Sword");
         LANGUAGE_EN.AddText(ID_WEAPON_MAGICSWORD_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_QUAEKDAGGER_NAME,"Quaekan Dagger");
         LANGUAGE_EN.AddText(ID_WEAPON_QUAEKDAGGER_DESC,"Triggered Effect ATK : Enemy is poisoned and takes 2 Poison DMG every 4s.");
         LANGUAGE_EN.AddText(ID_WEAPON_YASURSTAFF_NAME,"Yasur\'s Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_YASURSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 30s.\n*Cast : Raises an Undead warrior in your army.\n*Cast : Deals 5 Dark DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_XONAXSTAFF_NAME,"Xonax\'s Gnarled Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_XONAXSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 25s.\n*Cast : Deals 1 Poison DMG to ALL units.\n*Aura : ALL Vermin units gain +2 Poison ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_ZAMAROTHSWORD_NAME,"Zamaroth\'s Sword");
         LANGUAGE_EN.AddText(ID_WEAPON_ZAMAROTHSWORD_DESC,"*Casting Time : 20s.\n*Cast : ALL Demon units gain +2 Dark ATK.\nCast : Deals 2 Dark DMG to ALL non-Demon units.");
         LANGUAGE_EN.AddText(ID_WEAPON_IMRAILHMACE_NAME,"Imra\'ilh\'s Mace");
         LANGUAGE_EN.AddText(ID_WEAPON_IMRAILHMACE_DESC,"*Casting Time : 25s.\n*Cast : Every unit in your army gains +1 DEF.");
         LANGUAGE_EN.AddText(ID_WEAPON_QUATIAZSWORD_NAME,"Quatiaz\'s Sword");
         LANGUAGE_EN.AddText(ID_WEAPON_QUATIAZSWORD_DESC,"*Aura : Every Human unit in your army gains +2 Holy ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_RHIGARBOW_NAME,"Rhigar\'s Bow");
         LANGUAGE_EN.AddText(ID_WEAPON_RHIGARBOW_DESC,"*Locks Shield Slot.\n*Reload Time : 2s.");
         LANGUAGE_EN.AddText(ID_WEAPON_AZARATIUSAXE_NAME,"Azaratius\' Axe");
         LANGUAGE_EN.AddText(ID_WEAPON_AZARATIUSAXE_DESC,"*Casting Time : 20s.\n*Cast : Deals 1 Fire DMG to ALL units.");
         LANGUAGE_EN.AddText(ID_WEAPON_METABLADE_NAME,"Meta Blade");
         LANGUAGE_EN.AddText(ID_WEAPON_METABLADE_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_WEAPON_GORDAKARHAMMER_NAME,"Gordakar\'s Hammer");
         LANGUAGE_EN.AddText(ID_WEAPON_GORDAKARHAMMER_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_SHIELD_WOODENSHIELD_NAME,"Wooden Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_WOODENSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_ROUNDSHIELD_NAME,"Round Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_ROUNDSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_IRONSHIELD_NAME,"Iron Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_IRONSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_BUKLER_NAME,"Buckler");
         LANGUAGE_EN.AddText(ID_SHIELD_BUKLER_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_STEELSHIELD_NAME,"Steel Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_STEELSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_TOWERSHIELD_NAME,"Tower Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_TOWERSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_SPIKEDBUKLER_NAME,"Spiked Buckler");
         LANGUAGE_EN.AddText(ID_SHIELD_SPIKEDBUKLER_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_SPIKEDSHIELD_NAME,"Spiked Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_SPIKEDSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_ROTTENSHIELD_NAME,"Rotten Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_ROTTENSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_PARRYINGDAGGER_NAME,"Parrying Dagger");
         LANGUAGE_EN.AddText(ID_SHIELD_PARRYINGDAGGER_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_CRYSTALORB_NAME,"Crystal Orb");
         LANGUAGE_EN.AddText(ID_SHIELD_CRYSTALORB_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_SAPPERSHIELD_NAME,"Sapper Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_SAPPERSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_CURSEDSHIELD_NAME,"Cursed Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_CURSEDSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_KITESHIELD_NAME,"Kite Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_KITESHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_SMALLKITESHIELD_NAME,"Small Kite Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_SMALLKITESHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_PRIESTSHIELD_NAME,"Priest Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_PRIESTSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_CULTISTSHIELD_NAME,"Cultist Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_CULTISTSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_NECROPOLSHIELD_NAME,"Shield of the Necropolis");
         LANGUAGE_EN.AddText(ID_SHIELD_NECROPOLSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_INQUISITORSHIELD_NAME,"Inquisitor Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_INQUISITORSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_DUELISTBUCKLET_NAME,"Duelist Buckler");
         LANGUAGE_EN.AddText(ID_SHIELD_DUELISTBUCKLET_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_HEROSHIELD_NAME,"Hero Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_HEROSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_ASSASSINSHIELD_NAME,"Assassin Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_ASSASSINSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_FIREPARRYINGBLADE_NAME,"Fiery Main-Gauche");
         LANGUAGE_EN.AddText(ID_SHIELD_FIREPARRYINGBLADE_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_ICEBUCKLER_NAME,"Ice Buckler");
         LANGUAGE_EN.AddText(ID_SHIELD_ICEBUCKLER_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_PLAGUESHIELD_NAME,"Plague Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_PLAGUESHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_EXPERIMENTALSHIELD_NAME,"Experimental Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_EXPERIMENTALSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_MAGNETICSHIELD_NAME,"Magnetic Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_MAGNETICSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_BEASTSHIELD_NAME,"Beast Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_BEASTSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_MIRRORSHIELD_NAME,"Mirror Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_MIRRORSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_CRAFTMENSHIELD_NAME,"Craftsman Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_CRAFTMENSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_PORCUPINESHIELD_NAME,"Porcupine Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_PORCUPINESHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_GLADIATORSHIELD_NAME,"Gladiator Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_GLADIATORSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_STORMSHIELD_NAME,"Storm Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_STORMSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_CERIPHYRBUCKLER_NAME,"Ceriphyrian Buckler");
         LANGUAGE_EN.AddText(ID_SHIELD_CERIPHYRBUCKLER_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_BAXSHIELD_NAME,"Baxian Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_BAXSHIELD_DESC,"*Aura : Every unit in this squad gains +1 Dark Resist.");
         LANGUAGE_EN.AddText(ID_SHIELD_COMPOSITESHIELDSHIELD_NAME,"Composite Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_COMPOSITESHIELDSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_LIFESHIELDSHIELD_NAME,"Life Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_LIFESHIELDSHIELD_DESC,"*Wearer recovers 1 DEF every 3s.");
         LANGUAGE_EN.AddText(ID_SHIELD_QUATIAZSHIELDSHIELD_NAME,"Quatiaz\'s Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_QUATIAZSHIELDSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_NARMNSHIELDSHIELD_NAME,"Narmn\'s Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_NARMNSHIELDSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_XONAXBUCKLER_NAME,"Xonax\'s Buckler");
         LANGUAGE_EN.AddText(ID_SHIELD_XONAXBUCKLER_DESC,"*Aura : ALL Vermin units gain +1 DEF.");
         LANGUAGE_EN.AddText(ID_SHIELD_MOKDARSHIELD_NAME,"Mok Dar\'s Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_MOKDARSHIELD_DESC,"*Aura : Every Orc unit in this squad gains +1 DEF.");
         LANGUAGE_EN.AddText(ID_SHIELD_TULORANPROTECTION_NAME,"Tuloran\'s Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_TULORANPROTECTION_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_XONAXSKIN_NAME,"Xonax\'s Skin");
         LANGUAGE_EN.AddText(ID_SHIELD_XONAXSKIN_DESC,"*Aura : Deals 1 Poison DMG to every unit in your army every 10s.");
         LANGUAGE_EN.AddText(ID_SHIELD_AODANSHIELD_NAME,"Aodan\'s Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_AODANSHIELD_DESC,"*Aura : Slows down the Casting Time of ALL unit by 10s.");
         LANGUAGE_EN.AddText(ID_SHIELD_AZARATIUSSHIELD_NAME,"Azaratius\' Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_AZARATIUSSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_GORDAKARSHIELD_NAME,"Gordakar\'s Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_GORDAKARSHIELD_DESC,"*Aura : Every Orc unit in this squad gains +6 DEF.");
         LANGUAGE_EN.AddText(ID_SHIELD_ORYTHSHIELD_NAME,"Shard of Oryth");
         LANGUAGE_EN.AddText(ID_SHIELD_ORYTHSHIELD_DESC,"*Aura : ALL Demon units gain +2 Dark DMG.\n*Aura : ALL Demon units get -6 Holy Resist.\n*Aura : ALL Demon units get +6 DEF.");
         LANGUAGE_EN.AddText(ID_SHIELD_ULTRASHIELD_NAME,"Ultra Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_ULTRASHIELD_DESC,"*Aura : Every unit in your army gets -8 DEF.");
         LANGUAGE_EN.AddText(ID_SHIELD_CERIPHYRSHIELD_NAME,"Ceriphyrian Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_CERIPHYRSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_PLATEARMOR_NAME,"Plate Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_PLATEARMOR_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_CHAINMAIL_NAME,"Chain Mail");
         LANGUAGE_EN.AddText(ID_ARMOR_CHAINMAIL_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_SCALEMAIL_NAME,"Scale Mail");
         LANGUAGE_EN.AddText(ID_ARMOR_SCALEMAIL_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_HAUBERT_NAME,"Hauberk");
         LANGUAGE_EN.AddText(ID_ARMOR_HAUBERT_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_BLACKARMOR_NAME,"Black Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_BLACKARMOR_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_HALFPLATE_NAME,"Half Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_HALFPLATE_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_STUDDEDLEATHER_NAME,"Studded Leather");
         LANGUAGE_EN.AddText(ID_ARMOR_STUDDEDLEATHER_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_LEATHER_NAME,"Leather");
         LANGUAGE_EN.AddText(ID_ARMOR_LEATHER_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_GAMBESON_NAME,"Gambeson");
         LANGUAGE_EN.AddText(ID_ARMOR_GAMBESON_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_FURARMOR_NAME,"Fur Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_FURARMOR_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_BOILEDLEATHER_NAME,"Boiled Leather");
         LANGUAGE_EN.AddText(ID_ARMOR_BOILEDLEATHER_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_SPIKEDLEATHER_NAME,"Spiked Leather");
         LANGUAGE_EN.AddText(ID_ARMOR_SPIKEDLEATHER_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_RAG_NAME,"Rag");
         LANGUAGE_EN.AddText(ID_ARMOR_RAG_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_APPRENTICEROBE_NAME,"Apprentice Robe");
         LANGUAGE_EN.AddText(ID_ARMOR_APPRENTICEROBE_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_MAGEROBE_NAME,"Mage Robe");
         LANGUAGE_EN.AddText(ID_ARMOR_MAGEROBE_DESC,"*Speeds up casting time by 2s. (can\'t go under 2s)");
         LANGUAGE_EN.AddText(ID_ARMOR_SPIKEDARMOR_NAME,"Spiked Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_SPIKEDARMOR_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_ROTTENPLATE_NAME,"Rotten Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_ROTTENPLATE_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_CLERICMAIL_NAME,"Cleric Mail");
         LANGUAGE_EN.AddText(ID_ARMOR_CLERICMAIL_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_TAINTEDPLATE_NAME,"Tainted Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_TAINTEDPLATE_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_ADVENTURERCLOTH_NAME,"Adventurer Cloth");
         LANGUAGE_EN.AddText(ID_ARMOR_ADVENTURERCLOTH_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_SAPPERARMOR_NAME,"Sapper Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_SAPPERARMOR_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_ICYROBE_NAME,"Icy Robe");
         LANGUAGE_EN.AddText(ID_ARMOR_ICYROBE_DESC,"*Speeds up casting time by 1s. (can\'t go under 2s)");
         LANGUAGE_EN.AddText(ID_ARMOR_ROGUEARMOR_NAME,"Rogue Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_ROGUEARMOR_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_HEAVYPLATE_NAME,"Heavy Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_HEAVYPLATE_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_ROTTENMAIL_NAME,"Rotten Mail");
         LANGUAGE_EN.AddText(ID_ARMOR_ROTTENMAIL_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_CULTISTROBE_NAME,"Cultist Robe");
         LANGUAGE_EN.AddText(ID_ARMOR_CULTISTROBE_DESC,"*Triggered Effect (on-Death) : Raises an Undead warrior in your army 4s later.");
         LANGUAGE_EN.AddText(ID_ARMOR_MERCENARYPLATE_NAME,"Mercenary Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_MERCENARYPLATE_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_CHAINMAILOFHATE_NAME,"Chainmail of Hate");
         LANGUAGE_EN.AddText(ID_ARMOR_CHAINMAILOFHATE_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_CORRUPTEDMAIL_NAME,"Corrupted Mail");
         LANGUAGE_EN.AddText(ID_ARMOR_CORRUPTEDMAIL_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_LIGHTNINGCULTROBE_NAME,"Lightning Robe");
         LANGUAGE_EN.AddText(ID_ARMOR_LIGHTNINGCULTROBE_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_ENGINEERAPRON_NAME,"Engineer Apron");
         LANGUAGE_EN.AddText(ID_ARMOR_ENGINEERAPRON_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_EVILMANPLATE_NAME,"Evilman Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_EVILMANPLATE_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_BROTHERHOODCHAINMAIL_NAME,"Brotherhood Mail");
         LANGUAGE_EN.AddText(ID_ARMOR_BROTHERHOODCHAINMAIL_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_GUARDHAUBERT_NAME,"Guard Hauberk");
         LANGUAGE_EN.AddText(ID_ARMOR_GUARDHAUBERT_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_LUMINARYMAIL_NAME,"Mail of the Luminary");
         LANGUAGE_EN.AddText(ID_ARMOR_LUMINARYMAIL_DESC,"*Wearer gains +1 DEF every 10s.");
         LANGUAGE_EN.AddText(ID_ARMOR_SWAMPMAIL_NAME,"Swamp Mail");
         LANGUAGE_EN.AddText(ID_ARMOR_SWAMPMAIL_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_LIGHTEDPLATE_NAME,"Lighted Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_LIGHTEDPLATE_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_BARBARIANARMOR_NAME,"Barbarian Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_BARBARIANARMOR_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_NECROPOLMAIL_NAME,"Mail of the Necropolis");
         LANGUAGE_EN.AddText(ID_ARMOR_NECROPOLMAIL_DESC,"*Aura : Every Undead unit in this squad gains +1 DEF.");
         LANGUAGE_EN.AddText(ID_ARMOR_CURSEDARMOR_NAME,"Cursed Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_CURSEDARMOR_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_BLESSEDARMOR_NAME,"Blessed Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_BLESSEDARMOR_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_DEFLAGRATIONSCALE_NAME,"Deflagration Scale");
         LANGUAGE_EN.AddText(ID_ARMOR_DEFLAGRATIONSCALE_DESC,"*Triggered Effect (on-Death) : Deals 6 Explosion DMG on a 2 case radius around the unit.");
         LANGUAGE_EN.AddText(ID_ARMOR_MAGMABREASTPLATE_NAME,"Magma Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_MAGMABREASTPLATE_DESC,"*Triggered Effect (on-Death) : Deals 10 Fire DMG on a 1 case radius around the unit.");
         LANGUAGE_EN.AddText(ID_ARMOR_MITHRILMAIL_NAME,"Mithril Mail");
         LANGUAGE_EN.AddText(ID_ARMOR_MITHRILMAIL_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_BATTLEMAGEPLATE_NAME,"Battlemage Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_BATTLEMAGEPLATE_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_NARMNPLATE_NAME,"Narmn\'s Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_NARMNPLATE_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_ANGELPLATE_NAME,"Angel Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_ANGELPLATE_DESC,"*Aura : Every unit in this squad gain +2 Holy resist.");
         LANGUAGE_EN.AddText(ID_ARMOR_UNHOLYPLATE_NAME,"Unholy Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_UNHOLYPLATE_DESC,"*Aura : Every unit in this squad gain +2 Dark resist.");
         LANGUAGE_EN.AddText(ID_ARMOR_PYROMANCERMAIL_NAME,"Pyromancer Mail");
         LANGUAGE_EN.AddText(ID_ARMOR_PYROMANCERMAIL_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_POWERARMOR_NAME,"Power Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_POWERARMOR_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_NATAOBETHPLATE_NAME,"Nataobethian Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_NATAOBETHPLATE_DESC,"*Triggered Effect (on-Death) : Deals 5 Dark DMG on a 2 case radius around the unit.\n*Triggered Effect (on-Death) : Raises an Undead warrior in your army 4s later.");
         LANGUAGE_EN.AddText(ID_ARMOR_BAXROBE_NAME,"Baxian Robe");
         LANGUAGE_EN.AddText(ID_ARMOR_BAXROBE_DESC,"*Triggered Effect (on-Death) : Raises a Demon warrior in your army 10s later.");
         LANGUAGE_EN.AddText(ID_ARMOR_QUAEKMAIL_NAME,"Quaekan Mail");
         LANGUAGE_EN.AddText(ID_ARMOR_QUAEKMAIL_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_EMPIREARMOR_NAME,"Empire Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_EMPIREARMOR_DESC,"*Aura : Every Human unit in your army gains +1 DEF.");
         LANGUAGE_EN.AddText(ID_ARMOR_NECROGEAR_NAME,"Necro Gear");
         LANGUAGE_EN.AddText(ID_ARMOR_NECROGEAR_DESC,"*Kills its wearer after 20s.");
         LANGUAGE_EN.AddText(ID_ARMOR_ARCHMAGEMAIL_NAME,"Archmage Mail");
         LANGUAGE_EN.AddText(ID_ARMOR_ARCHMAGEMAIL_DESC,"*Speeds up casting time by 5s. (can\'t go under 2s)");
         LANGUAGE_EN.AddText(ID_ARMOR_IMMORTALARMOR_NAME,"Immortal Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_IMMORTALARMOR_DESC,"*Triggered Effect (on-Death) : Raises an Immortal warrior wearing this armor 12s later.\nImmortal units are not considered Undead.");
         LANGUAGE_EN.AddText(ID_ARMOR_TULORANPLATE_NAME,"Tuloran\'s Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_TULORANPLATE_DESC,"*Wearer gains +1 DEF for every Human unit in your army at the beginning of the battle.\n*Aura : Every Human unit in your army gains +2 DEF.");
         LANGUAGE_EN.AddText(ID_ARMOR_YASURARMOR_NAME,"Yasur\'s Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_YASURARMOR_DESC,"*Aura : ALL Undead units gain +5 DEF.");
         LANGUAGE_EN.AddText(ID_ARMOR_XONAXMAIL_NAME,"Xonax\'s Rag");
         LANGUAGE_EN.AddText(ID_ARMOR_XONAXMAIL_DESC,"*Aura : ALL Vermin units gain +20 DEF.\n*Aura : ALL Vermin units lose 1 DEF every 2s.");
         LANGUAGE_EN.AddText(ID_ARMOR_VASSPOTANAXPLATE_NAME,"Vass Potanax\'s Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_VASSPOTANAXPLATE_DESC,"*Aura : ALL Reptilian units gain +1 Poison ATK.\n*Aura : ALL Reptilian units gain +2 Poison resist.");
         LANGUAGE_EN.AddText(ID_ARMOR_UNTMORIPLATE_NAME,"Untmori\'s Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_UNTMORIPLATE_DESC,"*Triggered Effect (on-Death) : Deals 10 Explosion DMG on a 6 case radius around the unit.");
         LANGUAGE_EN.AddText(ID_ARMOR_UMENTHARMOR_NAME,"Umenth\'s Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_UMENTHARMOR_DESC,"*Speeds up casting time by 10s. (can\'t go under 2s)");
         LANGUAGE_EN.AddText(ID_ARMOR_GORDAKARPLATE_NAME,"Gordakar\'s Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_GORDAKARPLATE_DESC,"*Aura : Every Orc unit in this squad gains +2 Blunt ATK.");
         LANGUAGE_EN.AddText(ID_ARMOR_AZARATIUSORB_NAME,"Azaratius\' Orbs");
         LANGUAGE_EN.AddText(ID_ARMOR_AZARATIUSORB_DESC,"*Aura : Every unit in your army gains +3 Fire resist.");
         LANGUAGE_EN.AddText(ID_ARMOR_OKKORAZVEST_NAME,"Arhalath\'s Vest");
         LANGUAGE_EN.AddText(ID_ARMOR_OKKORAZVEST_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_HORSE_NAME,"Horse");
         LANGUAGE_EN.AddText(ID_SPECIAL_HORSE_DESC,"*Uses 2 cases.");
         LANGUAGE_EN.AddText(ID_SPECIAL_HEAVYHORSE_NAME,"Heavy Horse");
         LANGUAGE_EN.AddText(ID_SPECIAL_HEAVYHORSE_DESC,"*Uses 2 cases.");
         LANGUAGE_EN.AddText(ID_SPECIAL_SHIELDRING_NAME,"Shield Ring");
         LANGUAGE_EN.AddText(ID_SPECIAL_SHIELDRING_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_WIZARDRING_NAME,"Wizard Ring");
         LANGUAGE_EN.AddText(ID_SPECIAL_WIZARDRING_DESC,"*Speeds up casting time by 2s. (can\'t go under 2s)");
         LANGUAGE_EN.AddText(ID_SPECIAL_POWERRING_NAME,"Power Ring");
         LANGUAGE_EN.AddText(ID_SPECIAL_POWERRING_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_BOAR_NAME,"Boar");
         LANGUAGE_EN.AddText(ID_SPECIAL_BOAR_DESC,"*Uses 2 cases.");
         LANGUAGE_EN.AddText(ID_SPECIAL_REGENNECKLACE_NAME,"Recovery Necklace");
         LANGUAGE_EN.AddText(ID_SPECIAL_REGENNECKLACE_DESC,"*Wearer recovers 1 DEF every 10s.");
         LANGUAGE_EN.AddText(ID_SPECIAL_SOLDIERORB_NAME,"Soldier Orb");
         LANGUAGE_EN.AddText(ID_SPECIAL_SOLDIERORB_DESC,"*Wearer recovers 1 DEF every 10s.");
         LANGUAGE_EN.AddText(ID_SPECIAL_TIMESLOWRING_NAME,"Time Slow Ring");
         LANGUAGE_EN.AddText(ID_SPECIAL_TIMESLOWRING_DESC,"*Slows down casting time by 3s.");
         LANGUAGE_EN.AddText(ID_SPECIAL_CHARGEHORSE_NAME,"Charge Horse");
         LANGUAGE_EN.AddText(ID_SPECIAL_CHARGEHORSE_DESC,"*Uses 2 cases.");
         LANGUAGE_EN.AddText(ID_SPECIAL_PARADEHORSE_NAME,"Parade Horse");
         LANGUAGE_EN.AddText(ID_SPECIAL_PARADEHORSE_DESC,"*Uses 2 cases.");
         LANGUAGE_EN.AddText(ID_SPECIAL_CURSEDRING_NAME,"Cursed Ring");
         LANGUAGE_EN.AddText(ID_SPECIAL_CURSEDRING_DESC,"*Wearer gets -5 DEF. (can\'t go under 1 DEF)");
         LANGUAGE_EN.AddText(ID_SPECIAL_SAINTHANDRELIC_NAME,"Saint Relic");
         LANGUAGE_EN.AddText(ID_SPECIAL_SAINTHANDRELIC_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_CULTISTHANDRELIC_NAME,"Cultist Relic");
         LANGUAGE_EN.AddText(ID_SPECIAL_CULTISTHANDRELIC_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_BUTCHERBOOK_NAME,"Butcher Book");
         LANGUAGE_EN.AddText(ID_SPECIAL_BUTCHERBOOK_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_POLARBEARHAND_NAME,"Polar Bear Paw");
         LANGUAGE_EN.AddText(ID_SPECIAL_POLARBEARHAND_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_DRYEELBELT_NAME,"Dry Eel Belt");
         LANGUAGE_EN.AddText(ID_SPECIAL_DRYEELBELT_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_POISONBOTTLE_NAME,"Poison Bottle");
         LANGUAGE_EN.AddText(ID_SPECIAL_POISONBOTTLE_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_RHINO_NAME,"Rhino");
         LANGUAGE_EN.AddText(ID_SPECIAL_RHINO_DESC,"*Uses 2 cases.");
         LANGUAGE_EN.AddText(ID_SPECIAL_ARCHERBRACER_NAME,"Archer Bracer");
         LANGUAGE_EN.AddText(ID_SPECIAL_ARCHERBRACER_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_OGREBRACER_NAME,"Ogre Bracer");
         LANGUAGE_EN.AddText(ID_SPECIAL_OGREBRACER_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_MAGMAEMBLEM_NAME,"Magma Emblem");
         LANGUAGE_EN.AddText(ID_SPECIAL_MAGMAEMBLEM_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_SAPPERNECKLACE_NAME,"Sapper Necklace");
         LANGUAGE_EN.AddText(ID_SPECIAL_SAPPERNECKLACE_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_TIMEWARPRING_NAME,"Time Warp Ring");
         LANGUAGE_EN.AddText(ID_SPECIAL_TIMEWARPRING_DESC,"*Speeds up casting time by 4s. (can\'t go under 2s)");
         LANGUAGE_EN.AddText(ID_SPECIAL_MAGNETICRING_NAME,"Magnetic Ring");
         LANGUAGE_EN.AddText(ID_SPECIAL_MAGNETICRING_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_TRIBALCHIEFCROWN_NAME,"Tribal Chief Crown");
         LANGUAGE_EN.AddText(ID_SPECIAL_TRIBALCHIEFCROWN_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_MERCENARYGAUNTLET_NAME,"Combat Gauntlet");
         LANGUAGE_EN.AddText(ID_SPECIAL_MERCENARYGAUNTLET_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_UNDEADHORSE_NAME,"Undead Horse");
         LANGUAGE_EN.AddText(ID_SPECIAL_UNDEADHORSE_DESC,"*Uses 2 cases.\n*Triggered Effect (on-Death) : Raises an Undead warrior in your army 8s later.");
         LANGUAGE_EN.AddText(ID_SPECIAL_LUMINARYRING_NAME,"Ring of the Luminary");
         LANGUAGE_EN.AddText(ID_SPECIAL_LUMINARYRING_DESC,"*Speeds up casting time by 10s. (can\'t go under 2s)");
         LANGUAGE_EN.AddText(ID_SPECIAL_QUAEKTALISMAN_NAME,"Quaekan Talisman");
         LANGUAGE_EN.AddText(ID_SPECIAL_QUAEKTALISMAN_DESC,"*Aura : ALL Vermin units gain +1 Poison Resist and +1 Poison ATK.");
         LANGUAGE_EN.AddText(ID_SPECIAL_WARHORSE_NAME,"War Horse");
         LANGUAGE_EN.AddText(ID_SPECIAL_WARHORSE_DESC,"*Uses 2 cases.");
         LANGUAGE_EN.AddText(ID_SPECIAL_MECHANICALBEAST_NAME,"Mechanical Beast");
         LANGUAGE_EN.AddText(ID_SPECIAL_MECHANICALBEAST_DESC,"*Uses 2 cases.\n*Triggered Effect (on-Kill) : Unit recovers 3 DEF.");
         LANGUAGE_EN.AddText(ID_SPECIAL_STATICORB_NAME,"Static Orb");
         LANGUAGE_EN.AddText(ID_SPECIAL_STATICORB_DESC,"*Aura : Slows down the casting time ALL units by 5s.");
         LANGUAGE_EN.AddText(ID_SPECIAL_NATAOBETHORB_NAME,"Nataobethian Orb");
         LANGUAGE_EN.AddText(ID_SPECIAL_NATAOBETHORB_DESC,"*Triggered Effect (on-Death) : Raises 2 Undead warriors in your army 4s later.");
         LANGUAGE_EN.AddText(ID_SPECIAL_EMPIRESEAL_NAME,"The Empire\'s Seal");
         LANGUAGE_EN.AddText(ID_SPECIAL_EMPIRESEAL_DESC,"*Aura : Every Human unit in your army gains +3 DEF and +2 Slash ATK.");
         LANGUAGE_EN.AddText(ID_SPECIAL_ORCLEADERCROWN_NAME,"Orc Leader\'s Crown");
         LANGUAGE_EN.AddText(ID_SPECIAL_ORCLEADERCROWN_DESC,"*Aura : Every Orc unit in this squad gains +2 Blunt ATK.");
         LANGUAGE_EN.AddText(ID_SPECIAL_UNICORN_NAME,"Unicorn");
         LANGUAGE_EN.AddText(ID_SPECIAL_UNICORN_DESC,"*Aura : Every unit in your army gains +2 DEF.\n*Triggered Effect (on-Kill) : All units in squad recovers 1 DEF.");
         LANGUAGE_EN.AddText(ID_SPECIAL_ARHALATHRING_NAME,"Arhalath\'s Ring");
         LANGUAGE_EN.AddText(ID_SPECIAL_ARHALATHRING_DESC,"*Aura : ALL Golem units gain +8 DEF.");
         LANGUAGE_EN.AddText(ID_SPECIAL_YASURRING_NAME,"Yasur\'s Ring");
         LANGUAGE_EN.AddText(ID_SPECIAL_YASURRING_DESC,"*Aura : Raises an additional Undead warrior for every undead raising in your army.");
         LANGUAGE_EN.AddText(ID_SPECIAL_APOCALYPSEHORSE_NAME,"Apocalypse Horse");
         LANGUAGE_EN.AddText(ID_SPECIAL_APOCALYPSEHORSE_DESC,"*Aura : Every unit in your army gets -8 DEF.");
         LANGUAGE_EN.AddText(ID_SPECIAL_ANTIMAGICFIELD_NAME,"Anti-Magic Field");
         LANGUAGE_EN.AddText(ID_SPECIAL_ANTIMAGICFIELD_DESC,"*Aura : Slows down the casting time of ALL units by 20s.");
         LANGUAGE_EN.AddText(ID_SPECIAL_ULTRARING_NAME,"Ultra Ring");
         LANGUAGE_EN.AddText(ID_SPECIAL_ULTRARING_DESC,"*Aura : Slows down the casting time of ALL units by 20s.\n*Aura : Every unit in your army gets -2 DEF.");
         LANGUAGE_EN.AddText(ID_SPECIAL_GAZATAHBOOK_NAME,"Gazatah\'s Book");
         LANGUAGE_EN.AddText(ID_SPECIAL_GAZATAHBOOK_DESC,"*Aura : Every unit in this squad gains +5 Dark resist and +10 Blunt resist.");
         LANGUAGE_EN.AddText(ID_CREATURE_SMALLMINE_NAME,"Small Mine");
         LANGUAGE_EN.AddText(ID_CREATURE_SMALLMINE_DESC,"*Triggered Effect (on-Death) : Explode dealing 1 explosion damage to any unit in front of it.");
         LANGUAGE_EN.AddText(ID_CREATURE_SHAPESHIFTER_NAME,"ShapeShifter");
         LANGUAGE_EN.AddText(ID_CREATURE_SHAPESHIFTER_DESC,"*ShapeShifter count as any creature type.");
         LANGUAGE_EN.AddText(ID_CREATURE_POWERMINE_NAME,"Power Mine");
         LANGUAGE_EN.AddText(ID_CREATURE_POWERMINE_DESC,"*Triggered Effect (on-Death) : Explode dealing 5 explosion damage to any unit in front of it.");
         LANGUAGE_EN.AddText(ID_CREATURE_IMPGOON_NAME,"Imp Goon");
         LANGUAGE_EN.AddText(ID_CREATURE_IMPGOON_DESC,"*Count as a Imp.");
         LANGUAGE_EN.AddText(ID_CREATURE_MACHINECATAPULT_NAME,"Machine Catapult");
         LANGUAGE_EN.AddText(ID_CREATURE_MACHINECATAPULT_DESC,"*Locks all other slots.\n*Reload Time : 6s.\n*Uses 6 Cases.\n*Deals SPLASH DMG on 6 Cases.");
         LANGUAGE_EN.AddText(ID_CREATURE_RUSTYCANON_NAME,"Rusty Catapult");
         LANGUAGE_EN.AddText(ID_CREATURE_RUSTYCANON_DESC,"*Locks all other slots.\n*Reload Time : 6s.\n*Uses 6 Cases.\n*Deals SPLASH DMG on 6 Cases.\n*Destroy itself on firing.");
         LANGUAGE_EN.AddText(ID_CREATURE_DESTROYER_NAME,"Destroyer");
         LANGUAGE_EN.AddText(ID_CREATURE_DESTROYER_DESC,"*Count as a Golem.(Dies after 20s.)");
         LANGUAGE_EN.AddText(ID_CREATURE_AODANMYTHIC_NAME,"Aodan Mythic");
         LANGUAGE_EN.AddText(ID_CREATURE_AODANMYTHIC_DESC,"*Mythic.\n*Count as a human.\n*Every Golem in play gain +30 sec before dies.\n*Every Golem in play gain +2 Explosion ATK");
         LANGUAGE_EN.AddText(ID_CREATURE_AZARTIUSMYTHIC_NAME,"Azartius Mythic");
         LANGUAGE_EN.AddText(ID_CREATURE_AZARTIUSMYTHIC_DESC,"*Mythic.\n*Count as a human.\n*Every units in play get +4 Fire ATK");
         LANGUAGE_EN.AddText(ID_CREATURE_UMENTHMYTHIC_NAME,"Umenth Mythic");
         LANGUAGE_EN.AddText(ID_CREATURE_UMENTHMYTHIC_DESC,"*Mythic.\n*Count as a Octopod.\n*Speeds up Casting time of all Octopod by 5 sec(can\'t go under 2s.)");
         LANGUAGE_EN.AddText(ID_CREATURE_YASURMYTHIC_NAME,"Yasur Mythic");
         LANGUAGE_EN.AddText(ID_CREATURE_YASURMYTHIC_DESC,"*Mythic.\n*Count as a Undead.\n*Get +1DEF and+1 Dark DMG for every Undead in your army at the beginning of the battle.\n*Get +1DEF and+1 Dark DMG each time a undead is raise.");
         LANGUAGE_EN.AddText(ID_CREATURE_XONAXMYTHIC_NAME,"Xonax Mythic");
         LANGUAGE_EN.AddText(ID_CREATURE_XONAXMYTHIC_DESC,"*Mythic.\n*Count as a Vermin.\n*Count as a human.\n*Every vermin gain +2 Poison ATK.");
         LANGUAGE_EN.AddText(ID_CREATURE_ZAMAROTHMYTHIC_NAME,"Zamaroth Mythic");
         LANGUAGE_EN.AddText(ID_CREATURE_ZAMAROTHMYTHIC_DESC,"*Mythic.\n*Count as a Demon.\n*Every Demon in play gain +10 Dark ATK and +10 DEF.");
         LANGUAGE_EN.AddText(ID_CREATURE_VASSPOTANAXMYTHIC_NAME,"Vass Potanax Mythic");
         LANGUAGE_EN.AddText(ID_CREATURE_VASSPOTANAXMYTHIC_DESC,"*Mythic.\n*Count as a Reptilian.\n*Every Reptilian in play gain +3 Poison ATK and +3 DEF.");
         LANGUAGE_EN.AddText(ID_CREATURE_RHIGARMYTHIC_NAME,"Rhigar Mythic");
         LANGUAGE_EN.AddText(ID_CREATURE_RHIGARMYTHIC_DESC,"*Mythic.\n*Count as a Human.\n*Speeds up reload time of Every unit in your army By 2sec(can\'t go under 2s.).");
         LANGUAGE_EN.AddText(ID_CREATURE_IMRAILHMYTHIC_NAME,"Imra\'ilh Mythic");
         LANGUAGE_EN.AddText(ID_CREATURE_IMRAILHMYTHIC_DESC,"*Mythic.\n*Count as a Angel.\n*Every Angel in play gain +10 Holy ATK and +10 DEF.");
         LANGUAGE_EN.AddText(ID_CREATURE_MISFORMMYTHIC_NAME,"Misform Mythic");
         LANGUAGE_EN.AddText(ID_CREATURE_MISFORMMYTHIC_DESC,"*Mythic.\n*Misform Mythic count as any creature type.");
         LANGUAGE_EN.AddText(ID_WEAPON_FLAMETHROWER_NAME,"Flame Thrower");
         LANGUAGE_EN.AddText(ID_WEAPON_FLAMETHROWER_DESC,"*Locks shield slot.\n*Reload Time : 4s.\nDeals Fire DMG 4 case in front of it.");
         LANGUAGE_EN.AddText(ID_WEAPON_IMPPIKE_NAME,"Imp Pike");
         LANGUAGE_EN.AddText(ID_WEAPON_IMPPIKE_DESC,"*Locks shield slot.\n*Get +2 Dark ATK if equipped on a imp.");
         LANGUAGE_EN.AddText(ID_WEAPON_IMPMUSKET_NAME,"Imp Musket");
         LANGUAGE_EN.AddText(ID_WEAPON_IMPMUSKET_DESC,"*Locks shield slot.\n*Reload Time : 8s.\n*Get +4 Dark ATK if equipped on a imp.");
         LANGUAGE_EN.AddText(ID_WEAPON_MACHINEMUSKET_NAME,"Machine Musket");
         LANGUAGE_EN.AddText(ID_WEAPON_MACHINEMUSKET_DESC,"*Locks shield slot.\n*Reload Time : 2s.");
         LANGUAGE_EN.AddText(ID_WEAPON_ICESPIKESTAFF_NAME,"Ice Spike Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_ICESPIKESTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 20s.\n *Cast : Deals 20 Ice DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_POISONARROWSTAFF_NAME,"Poison Arrow Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_POISONARROWSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 20s.\n *Cast : Deals 20 Poison DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_FIREBALLSTAFF_NAME,"Fire Ball Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_FIREBALLSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 20s.\n *Cast : Deals 20 Fire DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_THUNDERBOLTSTAFF_NAME,"Thunder Bolt Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_THUNDERBOLTSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 20s.\n *Cast : Deals 20 Thunder DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_LIVINGSWORD_NAME,"Living Sword");
         LANGUAGE_EN.AddText(ID_WEAPON_LIVINGSWORD_DESC,"*Triggered Effect (on-Kill) : Unit gain +1 Slash ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_KNIFE_NAME,"Knife");
         LANGUAGE_EN.AddText(ID_WEAPON_KNIFE_DESC,"");
         LANGUAGE_EN.AddText(ID_WEAPON_FINECRAFTBOW_NAME,"Fine Craft Bow");
         LANGUAGE_EN.AddText(ID_WEAPON_FINECRAFTBOW_DESC,"*Locks Shield Slot.\n*Reload Time : 4s.");
         LANGUAGE_EN.AddText(ID_WEAPON_LIVINGBOW_NAME,"Living Bow");
         LANGUAGE_EN.AddText(ID_WEAPON_LIVINGBOW_DESC,"*Locks Shield Slot.\n*Reload Time : 6s.\n*Triggered Effect (on-Kill) : Unit gain +1 Piercing ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_PYROBATTLESTAFF_NAME,"Pyro Battle Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_PYROBATTLESTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 2s.\n *Cast : Deals 30 Fire DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_UNDEADFLAG_NAME,"Undead Flag");
         LANGUAGE_EN.AddText(ID_WEAPON_UNDEADFLAG_DESC,"*Locks Shield Slot.\n*Aura : Every undead in this squad gains +5 DEF.");
         LANGUAGE_EN.AddText(ID_WEAPON_TESLASTAFF_NAME,"Tesla Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_TESLASTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 2s.\n *Cast : Deals 30 Thunder DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_BATTLEHAMMER_NAME,"Battle Hammer");
         LANGUAGE_EN.AddText(ID_WEAPON_BATTLEHAMMER_DESC,"*Deal DMG 2 case in front of the Unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_ANCIENTBLADE_NAME,"Ancient Blade");
         LANGUAGE_EN.AddText(ID_WEAPON_ANCIENTBLADE_DESC,"*Get +2 Slash ATK for every mythic in your army at the beginning of the battle.");
         LANGUAGE_EN.AddText(ID_WEAPON_CHEAPMUSKET_NAME,"Cheap Musket");
         LANGUAGE_EN.AddText(ID_WEAPON_CHEAPMUSKET_DESC,"*Locks Shield Slot.\n*Reload Time : 6s.\n*Also deal DMG to the unit using it.");
         LANGUAGE_EN.AddText(ID_WEAPON_SEAKINGSTAFF_NAME,"Seaking Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_SEAKINGSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 25s.\n *Cast : Deals 20 Ice DMG to the enemy front line.\n*Aura : Reduce casting time by 5sec. if equipped on a Fishman.(can\'t go under 2s.)");
         LANGUAGE_EN.AddText(ID_WEAPON_SWAMPSTAFF_NAME,"Swamp Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_SWAMPSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 30s.\n *Cast : Deals 2 Poison DMG on enemy first 3 lines.");
         LANGUAGE_EN.AddText(ID_WEAPON_BATTLEMUSKET_NAME,"Battle Musket");
         LANGUAGE_EN.AddText(ID_WEAPON_BATTLEMUSKET_DESC,"*Locks Shield Slot.\n*Reload Time : 6s.\n");
         LANGUAGE_EN.AddText(ID_WEAPON_METASTAFF_NAME,"Meta Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_METASTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 30s.\n *Cast : Deals 1 Explosion 1 Ice 1 Fire 1 Thunder 1 Poison 1 Holy 1 Dark DMG to enemy front line.");
         LANGUAGE_EN.AddText(ID_WEAPON_CORALSTAFF_NAME,"Coral Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_CORALSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 30s.\n *Cast : Every unit in caster squad get +10 DEF.\n*Aura : Reduce casting time by 10sec. if equipped on a Fishman.(can\'t go under 2s.)");
         LANGUAGE_EN.AddText(ID_WEAPON_COMPOSITEPIKE_NAME,"Composite Pike");
         LANGUAGE_EN.AddText(ID_WEAPON_COMPOSITEPIKE_DESC,"*Locks Shield Slot.");
         LANGUAGE_EN.AddText(ID_WEAPON_EVILSTAFF_NAME,"Evil Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_EVILSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 50s.\n *Cast : turn every unit in caster squad into demons warriors.");
         LANGUAGE_EN.AddText(ID_WEAPON_PYROSTAFF_NAME,"Pyro Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_PYROSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 20s.\n*Cast : Deals 10 Fire DMG on each case in front of him.");
         LANGUAGE_EN.AddText(ID_WEAPON_MOONSWORD_NAME,"Moon Blade");
         LANGUAGE_EN.AddText(ID_WEAPON_MOONSWORD_DESC,"*Triggered Effect (on-Death) : All Lycanthrope gain +2 Dark ATK.");
         LANGUAGE_EN.AddText(ID_WEAPON_LIFESTAFF_NAME,"Life Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_LIFESTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 40s.\n *Cast : Every non-undead and non-demon creature in play recover +20 DEF.\n *Cast : Deals 10 holy DMG to a single enemy unit.");
         LANGUAGE_EN.AddText(ID_WEAPON_DEATHSTAFF_NAME,"Death Staff");
         LANGUAGE_EN.AddText(ID_WEAPON_DEATHSTAFF_DESC,"*Locks Shield Slot.\n*Casting Time : 40s.\n *Cast : Deal 15 Dark DMG to every non-undead and non-demon creature in play.");
         LANGUAGE_EN.AddText(ID_WEAPON_OKKORAZHAMMER_NAME,"Ok\'Koraz Hammer");
         LANGUAGE_EN.AddText(ID_WEAPON_OKKORAZHAMMER_DESC,"*Locks Shield Slot.\n*Triggered Effect (on-Kill) : Gain +10 DEF.\n*Triggered Effect (2nd Attack) : Deals 10 Lightning DMG to all units in the melee.");
         LANGUAGE_EN.AddText(ID_SHIELD_OFFHANDSWORD_NAME,"OffHand Sword");
         LANGUAGE_EN.AddText(ID_SHIELD_OFFHANDSWORD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_REINFORCEDSHIELD_NAME,"Reinforced Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_REINFORCEDSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_MAGICSHIELD_NAME,"Magic Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_MAGICSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_OFFHANDMACE_NAME,"OffHand Mace");
         LANGUAGE_EN.AddText(ID_SHIELD_OFFHANDMACE_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_LEATHERSHIELD_NAME,"Leather Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_LEATHERSHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_BATTLESHIELD_NAME,"Battle Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_BATTLESHIELD_DESC,"");
         LANGUAGE_EN.AddText(ID_SHIELD_IMPSHIELD_NAME,"Imp Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_IMPSHIELD_DESC,"*Get +2 DEF if equipped on a Imp.\n*Aura: All Imp gain+1def.");
         LANGUAGE_EN.AddText(ID_SHIELD_VASSSHIELD_NAME,"Vass Shield");
         LANGUAGE_EN.AddText(ID_SHIELD_VASSSHIELD_DESC,"*Aura : Every reptilian in play get +5 Fire Resist and +5 Blunt Resist.");
         LANGUAGE_EN.AddText(ID_ARMOR_WARRIORBATTLEMAIL_NAME,"Warrior Battle Mail");
         LANGUAGE_EN.AddText(ID_ARMOR_WARRIORBATTLEMAIL_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_RUSTYMAIL_NAME,"Rusty Mail");
         LANGUAGE_EN.AddText(ID_ARMOR_RUSTYMAIL_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_USEDGAMBESON_NAME,"Used Gambeson");
         LANGUAGE_EN.AddText(ID_ARMOR_USEDGAMBESON_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_ANCIENTARMOR_NAME,"Ancient Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_ANCIENTARMOR_DESC,"*Get +2 DEF for every mythic in your army at the beginning of the battle.");
         LANGUAGE_EN.AddText(ID_ARMOR_IMPARMOR_NAME,"Imp Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_IMPARMOR_DESC,"*Get +6 DEF if equipped on a imp.");
         LANGUAGE_EN.AddText(ID_ARMOR_MECHANICARMOR_NAME,"Mechanic Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_MECHANICARMOR_DESC,"*Aura : Every Golem in play get +2 DEF.");
         LANGUAGE_EN.AddText(ID_ARMOR_SEAKINGARMOR_NAME,"SeaKing Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_SEAKINGARMOR_DESC,"*Aura : Every Fishman in play get +2 DEF.");
         LANGUAGE_EN.AddText(ID_ARMOR_BATTLEARMOR_NAME,"Battle Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_BATTLEARMOR_DESC,"");
         LANGUAGE_EN.AddText(ID_ARMOR_RAMPAGERARMOR_NAME,"Rampager Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_RAMPAGERARMOR_DESC,"*Get +1 DEF for every enemy units in play at the beginning of the battle.");
         LANGUAGE_EN.AddText(ID_ARMOR_COOLDOWNARMOR_NAME,"Battle Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_COOLDOWNARMOR_DESC,"*Slow down casting and reload time of the wearer by 30sec.");
         LANGUAGE_EN.AddText(ID_ARMOR_SEAPLATE_NAME,"Sea Plate");
         LANGUAGE_EN.AddText(ID_ARMOR_SEAPLATE_DESC,"*Aura : Every fishman in your army gain +25 Ice Resist and +2 DEF.");
         LANGUAGE_EN.AddText(ID_ARMOR_INSECTOIDQUEENARMOR_NAME,"Insectoid Queen Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_INSECTOIDQUEENARMOR_DESC,"*Reduce insectoid Larva form time by 5sec.\n*Aura : Every insectoid in play gain +2 Slash ATK and +2 DEF.");
         LANGUAGE_EN.AddText(ID_ARMOR_MOONARMOR_NAME,"Moon Armor");
         LANGUAGE_EN.AddText(ID_ARMOR_MOONARMOR_DESC,"*Triggered Effect (on-Death) : All Lycanthrope gain +6 DEF.");
         LANGUAGE_EN.AddText(ID_SPECIAL_IMPCROWN_NAME,"Imp Crown");
         LANGUAGE_EN.AddText(ID_SPECIAL_IMPCROWN_DESC,"*Aura : Every imp in this squad gain +1 DEF.");
         LANGUAGE_EN.AddText(ID_SPECIAL_MOONORB_NAME,"Moon Orb");
         LANGUAGE_EN.AddText(ID_SPECIAL_MOONORB_DESC,"*Triggered Effect (on-Death) : All Lycanthrope gain +2 DEF.");
         LANGUAGE_EN.AddText(ID_SPECIAL_BLAZINGORB_NAME,"Blazing Orb");
         LANGUAGE_EN.AddText(ID_SPECIAL_BLAZINGORB_DESC,"*Aura : Every unit in play gain +2 Fire ATK.");
         LANGUAGE_EN.AddText(ID_SPECIAL_ARCHERGEAR_NAME,"Archer Gear");
         LANGUAGE_EN.AddText(ID_SPECIAL_ARCHERGEAR_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_ANTITECHCRYSTAL_NAME,"Anti Tech Crystal");
         LANGUAGE_EN.AddText(ID_SPECIAL_ANTITECHCRYSTAL_DESC,"*Aura : Slows down the reload time of ALL units by 4s.");
         LANGUAGE_EN.AddText(ID_SPECIAL_RINGOFMADNESS_NAME,"Ring of Madness");
         LANGUAGE_EN.AddText(ID_SPECIAL_RINGOFMADNESS_DESC,"");
         LANGUAGE_EN.AddText(ID_SPECIAL_DEATHNECKLACE_NAME,"King\'s necklace of death");
         LANGUAGE_EN.AddText(ID_SPECIAL_DEATHNECKLACE_DESC,"*Triggered Effect (on-Death)lose the Battle.");
         LANGUAGE_EN.AddText(ID_SPECIAL_ELEMENTALRING_NAME,"Elemental Ring");
         LANGUAGE_EN.AddText(ID_SPECIAL_ELEMENTALRING_DESC,"*Aura : Every elemental in play gain +10 DEF.");
         LANGUAGE_EN.AddText(ID_SPECIAL_WARLORDRING_NAME,"Warlord Ring");
         LANGUAGE_EN.AddText(ID_SPECIAL_WARLORDRING_DESC,"*Aura : Every unit in your army get +1 Slash ATK.");
         LANGUAGE_EN.AddText(ID_NOT_ENOUGH_CASH,"You don\'t have enough gold, do you want more ?");
         LANGUAGE_EN.AddText(ID_AREYOUSURE_NO_SAVE,"Are you sure you want to exit Unit Creation without saving your changes ?");
         LANGUAGE_EN.AddText(ID_NEED_CREATURE,"A creature is required to create a unit.");
         LANGUAGE_EN.AddText(ID_NOT_BELLOW_0,"You may not go below 0 Point !");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_1_NAME,"The age of peace");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_2_NAME,"Nighttime defense");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_3_NAME,"The broken peace");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_4_NAME,"Charred lands");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_5_NAME,"Sorcerous rescue");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_6_NAME,"Magical teamwork");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_7_NAME,"The Emperor\'s support");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_8_NAME,"The Generals");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_9_NAME,"The root of the corruption");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_1_NAME,"Turning over a new leaf");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_2_NAME,"Of Orcs and Men");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_3_NAME,"Human engineering");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_4_NAME,"Steam powered madness");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_5_NAME,"Facing the Highlands");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_6_NAME,"Knightly challenge");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_7_NAME,"Glory for a price");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_8_NAME,"Orcish pride");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_9_NAME,"Royal contention");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_10_NAME,"The Empire");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_1_NAME,"The invasion begins");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_2_NAME,"A new threat");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_3_NAME,"Treachery");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_4_NAME,"Inside job");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_5_NAME,"Isolation");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_6_NAME,"The undeath squad");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_7_NAME,"Sudden death");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_8_NAME,"Cult sorcery");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_9_NAME,"Unknightly challenge");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_10_NAME,"The End");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_1_NAME,"A brave new world");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_2_NAME,"Darkest nights");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_3_NAME,"A new mission");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_4_NAME,"Dead man speaks no tale");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_5_NAME,"Purification");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_6_NAME,"The plot thickens");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_7_NAME,"More than meets the eye");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_8_NAME,"Demonic outburst");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_9_NAME,"The ritual");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_1_NAME,"Rhigar\'s clan");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_2_NAME,"The first Invasion");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_3_NAME,"The Liberation");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_4_NAME,"Aodan\'s Folly");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_5_NAME,"Assassination fallouts");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_6_NAME,"Rise of an Immortal");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_7_NAME,"Assault on Dyn\'Tur");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_8_NAME,"The Sea King\'s Answer");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_9_NAME,"Oryth\'s Stand");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_10_NAME,"Battle of Berythe");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_1_NAME,"Rhigar\'s clan");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_2_NAME,"The first Invasion");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_3_NAME,"The Liberation");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_4_NAME,"Aodan\'s Folly");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_5_NAME,"Assassination fallouts");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_6_NAME,"Rise of an Immortal");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_7_NAME,"Assault on Dyn\'Tur");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_8_NAME,"The Sea King\'s Answer");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_9_NAME,"Oryth\'s Stand");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_1_NAME,"Rhigar\'s clan");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_2_NAME,"The first Invasion");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_3_NAME,"The Liberation");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_4_NAME,"Aodan\'s Folly");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_5_NAME,"Assassination fallouts");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_6_NAME,"Rise of an Immortal");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_7_NAME,"Assault on Dyn\'Tur");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_8_NAME,"The Sea King\'s Answer");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_9_NAME,"Oryth\'s Stand");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_1_STORY1,"Hello Sir! I’m Val’Bert, your battle advisor, and this is the Tul kingdom, the land of men. Things have been rather calm around these parts for the past few centuries, ever since the ancient war that brought peace between the people of the unified western countries and the surrounding realms.\n\nEmperor Tuloran would be proud of his legacy, the world now follows order and justice, and it\'s your duty to ensure that it\'s honored.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_1_STORY2,"You are one of the many commanders in training under the new emperor\'s rules. You brought your young army to a valley near the mountains for their introduction to the way of the battle.\n\nYour story begins here.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_2_STORY1,"The night is dark and silent, a perfect ending to a great day of training. You slowly succumb to the temptation of slumber when suddenly someone barges in your quarters yelling. \'ORC ATTACK!\'");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_3_STORY1,"As you suspected more Orcs are coming, the first wave must have only been scouts, these appear to be much more suited for battle, hold off the attackers until reinforcement gets here!");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_4_STORY1,"After some rest, the rescued man started being more coherent. He tells a tale of infectious creatures of the past, a civilization once thought lost, these creatures fear fire and fight in numbers. Shivers pierce the core of your spine at the mere thought of such beasts. Time is of the essence; you put on a brave face and brief your army on the enemy they are about to square up against.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_4_STORY2,"In order to defend yourself from these vile creatures, you decide to try and recruit some wizards from the lost order that took refuge in the valley. You walk into a charred gravel pit, there used to be a forest here you are certain of it. In the distance you see a cavern with a faint glowing light. As you approach it, you are ambushed by a swarm of shadowy beings.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_5_STORY1,"You carry the wounded sorcerers toward your settlement, you hear more vermin croakings and chitterings coming from the woods, let’s hope at least one of them is fit for battle.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_6_STORY1,"You find yourself surrounded by Vermins, the swarm seems unending. If you can survive through this one, the camp is just a dash away.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_7_STORY1,"In light of the Orc\'s actions, the Emperor decreed that any more acts of hostility coming from them would be considered a declaration of war. Before you even get to finish reading the missive you are interrupted by the watchman\'s bell.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_8_STORY1,"You and your troops march through the valley, finally reaching the Orc\'s camp by sunset. Sounds of war drums start coming down the mountain’s path, they must have somehow been warned of your arrival. You are quickly met by the Orc Generals and their Vermin allies.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_9_STORY1,"You interrogate the captured Orcs, their elder explains the story of their betrayal by the shaman Ok\'Than, selling their clan\'s servitude to a demon in exchange for unimaginable powers. This is troubling news indeed and must be brought to the Emperor\'s attention at once, but first, Ok’Than must be dealt with.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_9_STORY2,"As you and your forces follow the canyon\'s path into the glowing mountain, the flaming botanical life forms an unsettling, out of this world, decor. The dancing lights uncover mysterious magical runes engraved all over the rocky walls. Suddenly the fire\'s light start wavering like a flame in the wind, but not even a breeze grazes your cheek.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_9_STORY3,"You redirect your sight forward and in the once cleared path now stands a silent army of Vermins, led by a shadowy Orc on horse\'s back. After seconds that felt like hours, the shaman beams a smile at you, then lets out a deafening guttural sound.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_1_STORY1,"Many seasons have passed since the uncovering of the demon\'s nefarious plans, our Kingdom and the surrounding countries have been on edge, preparing for the next demonic attack. Since you and your army were at the ones who thwarted their previous attempt, the Emperor has put a lot of trust in your capacity to overcome the coming threat.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_1_STORY2,"After the word got out of your heroic deed, armies from across the land started coming in to witness firsthand what kind of power it takes to beat the demons, you are now the benchmark for all armies to compare to.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_2_STORY1,"Cooperation between Orcs and Humans is now more common, they have proved themselves to be valiant warriors and valuable allies.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_3_STORY1,"The human engineers have been hard at work, perfecting new war machines to help turn the tide against the forces of evil. Today you square off against the latest in human ingenuity, try to keep them from breaking everything.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_4_STORY1,"The engineers have not said their last word, there is still some experimental constructs to try out against you.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_5_STORY1,"Today\'s challengers are from the Northern Kingdoms, while noble fighters, they are not known for finesse or subtlety.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_6_STORY1,"You are gaining more and more attention, one of the neighboring counties sent in their royal forces to challenge you.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_7_STORY1,"Attracted by a chance at glory, a bunch of renegade mercenaries decided to challenge your forces.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_8_STORY1,"Many of the Orc clans have been rebuilding their forces in their homeland, still hungry for revenge against the demonic hordes.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_9_STORY1,"In light of your progress, you decide to challenge the Emperor\'s forces. You will have to defeat the current contenders before being granted the chance to face the royal army.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_10_STORY1,"The Emperor is greatly impressed with the strength displayed in your last bout, you are given the opportunity to face the Royal Army.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_1_STORY1,"The sound of the tower bells thunders across the night, villagers taken from their sleep scatter in the alleys, looking for safety for them and their loved ones. A small boy trips and falls, confused and separated from his family. You gently help him up on his feet and point him the way to the castle.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_1_STORY2,"In the panic, you and your men stand calmly, you\'ve all been preparing hard for this, time to put it all to test. You look proudly at your army one last time then head for the observation tower while they walk toward the village\'s gate.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_2_STORY1,"As your men take some respite from the battle, they are quickly interrupted by vile, unnatural sounds coming from the vermin\'s lifeless bodies. Skeletal figures start emerging from the fallen enemies, the sound of ripping flesh and crackling bones is even more nauseating than the putrid smell.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_2_STORY2,"By the time your men are back in formation, there already is an army of unholy risen creatures before them, joined by those who caused their return.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_3_STORY1,"The villagers are bustling around town, trying to keep their minds off the previous night\'s events. Most remain calm nevertheless, knowing they are in security with your army protecting the town.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_3_STORY2,"On the other hand, some have been agitated since the attack, as if it had awoken some kind of madness. In the midst of the busy afternoon, a loud explosion shakes the entire village. Better do some damage control.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_4_STORY1,"As if the Demonic uprising wasn\'t enough, now we have to worry about inside dissidence, great.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_4_STORY2,"Down in jail, in the middle of questioning, all the silent captives burst out laughing maniacally. Not even seconds after, panicked screams inundate the town; the Vermins breached in.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_5_STORY1,"The streets are littered in wounded villagers, without your swift actions the town would have been razed within the hour. With the moat isolating the town, priority is to tend to the injured. Each and every one of them are carefully carried to the healer\'s compound.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_5_STORY2,"You oversee the operation from atop the observation tower, keeping a watchful eye on both the horizon, in case of coming assaults, and the streets, hoping no more cultists are out there.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_5_STORY3,"You jerk your head to the side as an arrow grazes your cheek, you peer down to see an army of swamp creatures emerging from the moat\'s water.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_6_STORY1,"After a week of isolation, most of the town\'s supplies that had not been destroyed by the Vermins have been used to tend to the injured; this all needs to end soon.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_6_STORY2,"While the last few of your wounded men heal, the rest build up basic defense mechanism in case of another attack, time to  set the offensive plan in motion. Your scouts report a small squadron of Undeads coming from the mountains heading this way. You lead your troops to intercept them.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_7_STORY1,"The closer you get to the source of the evil, the more twisted the nature gets all around you, as if the unholy magic used by the demons corrupted the very core of the land. The once great forest that populated the valley now seem wicked, the trees almost look like they are in pain. Even the woodland creatures have fled their homes.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_7_STORY2,"You feel uneasy, as if the trees are watching you. Who knows, with this foul magic maybe they are, and if they aren\'t, who\'s eyes are these?");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_8_STORY1,"You rush out, barely escaping the colossal furnace, only to run straight into an undead gathering, as if they were waiting for you.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_8_STORY2,"It was a trap!");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_9_STORY1,"The Undead forces seem to be guarding something at the center of a crevasse. You hack your way through hordes of mindless revenants, they don\'t offer much resistance initially, but they appear to gain in strength and voracity over time.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_9_STORY2,"After thinning most of the undead army, you finally get to set your sight on the source of the problem. In the center of all of this stands a demon channeling some kind of portal. Your army attempts to rush it but they are cut off by Undead horsemen.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_10_STORY1,"As the final blow is dealt to the unholy knights you notice a change in the demon\'s incantations, within seconds you feel the ground trembling and hear roars in the distance. The demon is calling for his soldiers, you have one chance to end it all or you will be soon overwhelmed.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_10_STORY2,"Quickly your men assume the offensive formation and charge to interrupt the channeling.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_10_STORY3,"The portal indeed closes but it\'s too late, you now stand before much worse than a demon.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_1_STORY1,"Welcome to new Tulora! Years have gone by since the Demonic Invasion, the kingdom has since taken a grip back onto its destiny.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_1_STORY2,"The world feels much more polarized than ever before, several new factions started making themselves known and ancient orders found new blood, for better or for worse.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_2_STORY1,"The demons may be banished, but the portal left a deep scar of its passage, creatures of the night remained and ancient curses found their way back to our world. The nights have not been safe for anyone in a long time.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_3_STORY1,"Rumours of a new order of the Baxian Cult have been floating about the kingdom for a while now, at first as more of an old wives\' tale, but the sources have been more and more credible. Unwilling to take the risk of another disaster, the Emperor sends you and your best men to investigate the claims.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_3_STORY2,"You head toward Nataobeth\'s ruin, crossing the swamp you encounter its less than hospitable denizen.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_4_STORY1,"The city-tomb of Nataobeth is devoid of any sound and light, you and your army quickly scout the entire town: not a sign of life.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_4_STORY2,"After a few hours of surveillance, you are ready to head back to town, glad that it was only a false alarm. As you turn around to head for the exit, you are quickly cut off my shadowy hooded figures.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_5_STORY1,"A bright light blinds you, the only thing you can make up is a winged figure slowly coming down toward you.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_5_STORY2,"A piercing sound brings you to your knees, the figure speaks in tongues you cannot comprehend, but you manage to discern a few words \'all... humans... fault...\'");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_6_STORY1,"You stand before a mighty Angelic General, he informs you of Oryth\'s secret rebuilding, just as the Emperor most feared. It\'s corrupting his angel\'s thoughts, making them act erratic. There is nothing you can do for them, they have given into the corruption.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_7_STORY1,"The general lifts the mystic veil that covers the city, revealing much more life than initially believed. Rustled by their uncovering, a gang of cultists lunge for your throat.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_8_STORY1,"The rumblings come to an end in a spectacular explosion, demons and cultists rush out of the dust cloud and attack you.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_9_STORY1,"Finally reaching the ritual room, you find demons and fallen angels working on a demonic ritual, once they notice your presence, they only smile. \'You are too late\'");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_1_STORY1,"You stand in the center of a deserted forest settlement, weeks have passed since you first took your first step in these mysterious nameless woods and this is the first form of civilisation you encounter.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_1_STORY2,"As you rummage through the hovels looking for a sign of recent activity, you quickly realize you tread on dangerous grounds.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_2_STORY1,"You hear the growling of thousands of creatures in the distance, Zamaroth\'s army is slowly entering our realm.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_2_STORY2,"You carefully approach the source of the commotion; the invasion has begun.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_3_STORY1,"For months now you have been sieging the Reptialian capital, waiting for the right time to strike. As dusk settles over the mountains a loud explosion shakes the foundation of your camp.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_3_STORY2,"You and your men spring into your combat position, something is happening, something is coming.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_4_STORY1,"You walk around piles of lifeless bodies, victims of Aodan\'s challenge. A warm breeze graze your face, the mixture of blood and grease turns your stomach over.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_4_STORY2,"Soon it will be your turn, soon you will get to prove your worth over the tireless mechanical army, soon the bounty may be yours.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_5_STORY1,"Cries and gasps echo through the entire city. The King is dead, shot in the middle of a speech. The crowd quickly disperses erratically into the alleys not wishing to be the next victim of the invisible archer.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_5_STORY2,"Your scouts notice wandering gypsies on the outskirts of the forest far down the valley, they could not have anything to do with this, could they?");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_6_STORY1,"A festival of eerie lights bathe the night sky above the Ruins of Nataobeth, the source of the magic kneels before a shadowy figure.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_6_STORY2,"The fallen Sovereign of the once great city of Nataobeth, King Yasur, holds himself on his sword as dark magic is infused in his body. Once the ritual is over, no sign of humanity is left in his eye, only darkness.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_7_STORY1,"A massive heat wave is hitting the coast of Dyn\'tur, the horizon shimmers under the midday sun; even rocky formations look like they are dancing flames, slowly creeping toward the city.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_7_STORY2,"You gaze at the hypnotizing moving shapes as they slowly come into focus, something feels wrong. The sound of the alarm bells snaps you out of your daydream, Azarathius\' pyromancer army is at the city\'s gate.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_8_STORY1,"Azarathius\' magical heatwave tricked the sea savages, he managed to sneak your army and his pyromancers right to their doorstep. The ancestral city is in shambles, but not destroyed yet.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_8_STORY2,"The gates open up and let out a horde of warriors, you must keep them from reaching Azarathius, the spell must be completed, the city must be destroyed.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_9_STORY1,"For weeks now Oryth has been active, you\'ve been trying to keep the invaders under control and for the most part have succeeded, but your forces tire.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_9_STORY2,"Reinforcement should be coming soon, any day now. Hope fills your heart as you hear horses in the distance, until you realize it\'s coming from the portal.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_10_STORY1,"Zamaroth stands by the great monolith as imps and demons flood our realm. The night is pitch black, as if the portal absorbs the light coming from the moon and stars.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_10_STORY2,"The angelic forces led by Supreme Commander Imra\'Ilh are already charging, clearing you a path to Zamaroth. This is it, you must end this here. The future of humanity rests on your shoulders.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_1_STORY1,"Welcome to new Tulora! Years have gone by since the Demonic Invasion, the kingdom has since taken a grip back onto its destiny.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_2_STORY1,"The demons may be banished, but the portal left a deep scar of its passage, creatures of the night remained and ancient curses found their way back to our world. The nights have not been safe for anyone in a long time.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_3_STORY1,"Rumours of a new order of the Baxian Cult have been floating about the kingdom for a while now, at first as more of an old wives\' tale, but the sources have been more and more credible. Unwilling to take the risk of another disaster, the Emperor sends you and your best men to investigate the claims.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_4_STORY1,"The city-tomb of Nataobeth is devoid of any sound and light, you and your army quickly scout the entire town: not a sign of life.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_5_STORY1,"A bright light blinds you, the only thing you can make up is a winged figure slowly coming down toward you.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_6_STORY1,"You stand before a mighty Angelic General, he informs you of Oryth\'s secret rebuilding, just as the Emperor most feared. It\'s corrupting his angel\'s thoughts, making them act erratic. There is nothing you can do for them, they have given into the corruption.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_7_STORY1,"The general lifts the mystic veil that covers the city, revealing much more life than initially believed. Rustled by their uncovering, a gang of cultists lunge for your throat.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_8_STORY1,"The rumblings come to an end in a spectacular explosion, demons and cultists rush out of the dust cloud and attack you.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_9_STORY1,"Finally reaching the ritual room, you find demons and fallen angels working on a demonic ritual, once they notice your presence, they only smile. \'You are too late\'");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_1_STORY1,"Welcome to new Tulora! Years have gone by since the Demonic Invasion, the kingdom has since taken a grip back onto its destiny.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_2_STORY1,"The demons may be banished, but the portal left a deep scar of its passage, creatures of the night remained and ancient curses found their way back to our world. The nights have not been safe for anyone in a long time.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_3_STORY1,"Rumours of a new order of the Baxian Cult have been floating about the kingdom for a while now, at first as more of an old wives\' tale, but the sources have been more and more credible. Unwilling to take the risk of another disaster, the Emperor sends you and your best men to investigate the claims.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_4_STORY1,"The city-tomb of Nataobeth is devoid of any sound and light, you and your army quickly scout the entire town: not a sign of life.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_5_STORY1,"A bright light blinds you, the only thing you can make up is a winged figure slowly coming down toward you.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_6_STORY1,"You stand before a mighty Angelic General, he informs you of Oryth\'s secret rebuilding, just as the Emperor most feared. It\'s corrupting his angel\'s thoughts, making them act erratic. There is nothing you can do for them, they have given into the corruption.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_7_STORY1,"The general lifts the mystic veil that covers the city, revealing much more life than initially believed. Rustled by their uncovering, a gang of cultists lunge for your throat.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_8_STORY1,"The rumblings come to an end in a spectacular explosion, demons and cultists rush out of the dust cloud and attack you.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_9_STORY1,"Finally reaching the ritual room, you find demons and fallen angels working on a demonic ritual, once they notice your presence, they only smile. \'You are too late\'");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_1_TIPS,"Pikes, spears and the such attack up to two rows in front of them.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_2_TIPS,"Different races have different powers and weaknesses.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_3_TIPS,"Ranged attacks have different Reload rates.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_4_TIPS,"Spell Casting takes longer than your usual weapon attack.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_5_TIPS,"Time is the key to everything, optimize your strategy by spacing out different attacks in order to minimize wasted rounds.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_6_TIPS,"Horsemen take up two slots but are much stronger than your usual unit; Just keep them away from pikes!");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_7_TIPS,"Sometimes, less is more, a well-equipped unit may be more suited for the job than many lesser ones.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_8_TIPS,"Diversify your weapons and armor in order to make a well-rounded team.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_9_TIPS,"Finishing the Tutorial Campaign unlocks the next Single Player Act, as well as the Ranked Battles and the Booster Shop.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_1,"Change your formations often, try to make your armies as good as they can be!");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_2,"Your collection shows all the items you\'ve acquired so far in a classified manner.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_3,"Your armies remain activated while playing in the campaign.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_4,"A different Flag can make all the difference in the world.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_5,"Negative Resists only increases damage taken by attacks of that Resist.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_6,"Keeping an even formation makes your army more predictable.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_7,"Learn to differentiate items on the Battlefield. Knowledge is power.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_8,"Some races are more suited for certain roles.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_9,"The timer works both ways. Anticipate opposing attacks!");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_10,"The more people you successfully recruit the higher your reward will be.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_11,"Only Ladder Battles affect your ranking.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_12,"Direct challenges are great ways to try out new strategies and earn some Gold.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_13,"A unit is defeated once their defense points reach 0.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_14,"Your Banner is the only thing that the enemy sees before the battle starts.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_15,"You can customize your Banner in the Banner Creation window.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_16,"The two small swords under your army number means the army is activated for Ladder play.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_17,"Gain gold by completing the Campaign or fighting in the Ladder.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_18,"Support Berzerk Studio by purchasing gold in the Gold Shop, it\'s how we get to make games for you!");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_19,"Resists will prevent up to X damage of that element on every attack.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_20,"Log on every day for a free Gold reward.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_21,"Some magic weapons have no maximum range, put them on the back row!");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_22,"Row Speed can change the course of a battle tremendously.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_23,"You can change an army at any time, it won\'t affect its rank!");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_24,"Share the game on social media sites for a Gold Reward.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_25,"You gain gold for every Ladder Battle your army fights, even when defending.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_26,"You can assign an item by dragging it onto the unit or by double clicking it.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_27,"Got questions or suggestions? Visit our forums on Berzerk-Land.com.");
         LANGUAGE_EN.AddText(ID_RANDOM_TIPS_28,"The Codex is filled with useful information and discussions!");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_1_ENDSTORY,"The battle was a breeze, you easily defeated the opposing forces by using a simple pikemen formation. The night is coming, you and your men go to your bed rolls while the defeated party stands guard.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_2_ENDSTORY,"The Orcs broke the peace treaty that had been signed since the unification, you send messengers to warn the Emperor while you prepare for another attack.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_3_ENDSTORY,"That went well, all things considered but do not lay down your guard yet, you can still feel unrest in the air. In the debris your men find a barely coherent Human captive, he can only mutter the same words over and over \'Vermin\'.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_4_ENDSTORY,"Once the dust settles, you venture into the cavern. Two survivors of the Lost order of Wizards are there, wounded and visibly tired but still with a flame in their eyes.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_5_ENDSTORY,"The camp is ahead, just a few more hills, you head there hoping your messengers reached the Emperor in time.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_6_ENDSTORY,"You cross the gate of the settlement just in time to see the sun rise over the mountains, in the distance you see it reflect on the shields of half a dozen horsemen. Reinforcement, finally!");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_7_ENDSTORY,"War being officially declared, the Emperor sends you one of his royal guards to help your army with the offensive. You take as many men as you can muster and head into Orc territory.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_8_ENDSTORY,"Victory is yours! After the battle, the Orcs seemed to be waking up from a spell, perhaps some investigation needs to be done to understand the motivation behind their attacks. Something feels definitely wrong.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_1_9_ENDSTORY,"EndStory EndAct1.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_1_ENDSTORY,"You congratulate the challengers on a great battle, a courageous attempt but it just wasn\'t enough to outclass your forces.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_2_ENDSTORY,"Orcs and Humans fighting alongside each other are a force to be reckoned with, you managed to win this round but there is a bright future for this alliance.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_3_ENDSTORY,"You feel safer knowing that the next time you see these, they will not be aiming at you or the town you are protecting.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_4_ENDSTORY,"These machines will be of great use on the battlefield, they show terrifying potential for mass destruction and will be a perfect addition to many armies.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_5_ENDSTORY,"Simple, yet effective. There is definitely a place for brute force strategies, let\'s keep this in mind.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_6_ENDSTORY,"This impressive victory over such an elite force will certainly reach the attention of the Emperor.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_7_ENDSTORY,"The best armor money can buy is not enough if you don\'t have a great strategy to back it up.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_8_ENDSTORY,"This display of strength against the organized Orcish forces solidifies your standing in the Kingdom, perhaps it\'s time to move on to bigger things.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_9_ENDSTORY,"That was quite a fight, both forces showed great tactical prowess. The former contenders bow to you and your men in respect, you are now ready to face the Emperor\'s Army.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_2_10_ENDSTORY,"EndStory EndAct2.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_1_ENDSTORY,"It had been quite a while since your last encounter with the Vermins, you must admit, you didn\'t miss the stench one bit.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_2_ENDSTORY,"You send your army to scout the surroundings to make sure no more surprises happen tonight. Once satisfied, you head back to town to reassure the townsfolk.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_3_ENDSTORY,"You manage to minimize the damage on the town and lock up the instigators of the riot, looks like some sort of demonic cult.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_4_ENDSTORY,"You secure the area and pull up the bridge, nobody enters or leaves until you figure this out.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_5_ENDSTORY,"The town\'s population can\'t take much more of this, time to go on the offensive.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_6_ENDSTORY,"The Undead forces are gaining in strength, if you don\'t stop all of this soon, it may be too late.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_7_ENDSTORY,"The explosion set the withered trees on fire, creating an horrible wildfire all across the valley.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_8_ENDSTORY,"You peer into the horizon over the hill, stumbling fresh undeads as far as the eye can see.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_9_ENDSTORY,"You must make haste and stop the demon, you may not survive another round of summoning.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN1_3_10_ENDSTORY,"EndStory EndAct3.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_1_ENDSTORY,"You discouraged the attackers from further aggression, perhaps they will think twice about testing you next time.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_2_ENDSTORY,"The cursed creatures flee in the night, they will return one day, but for now your citizens are safe.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_3_ENDSTORY,"You quickly dispatch the swamp beasts and hastily head for Nataobeth before more come your way.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_4_ENDSTORY,"Before you could investigate on how the cultists escaped your initial search of the area, you feel a supernatural presence.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_5_ENDSTORY,"In the distance, you see another flight of Angels coming your way. As you brace for impact you feel incredible power on your shoulder.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_6_ENDSTORY,"The General nods in mourning as the last of the corrupted Angels fall. It had to be done.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_7_ENDSTORY,"The mob seemed to be protecting the church\'s ruins, as you get closer to it you can hear rumbling coming from its depths.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_8_ENDSTORY,"Demons! The Baxian ritual seems far more along than you ever thought.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN2_1_9_ENDSTORY,"Upon striking the demon, the Monolith explodes, letting out immense energy. The entire catacombs are filled in a thick dark light. \n\nYou fall on your knees, the light seems to drain your life force away. As you collapse on the floor, you no longer feel alone in the room, a strong presence fills the air around you. \n\nThe Monolith\'s shattering let out four unspeakable evil upon our world.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_1_ENDSTORY,"The ambush party vanishes in a thick smoke cloud as quickly as they appeared.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_2_ENDSTORY,"You dispatch the invaders, but before you can even catch your breath you realise that these were only the first wave; you stand before a sea of hellish creatures.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_3_ENDSTORY,"You manage to defend yourself from the massive Reptilian mob but are unsuccessful at stopping them all, most simply run past you and disappear into the swamp.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_4_ENDSTORY,"You stand tall before the human mechanic, holding the severed head of his largest creation. He throws you a bag of gold with the largest of grins; you gave him a reason to up the ante.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_5_ENDSTORY,"These were no common vagrants! You and your troops chase them down but eventually lose them in the forest.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_6_ENDSTORY,"The small army of risen creatures fall to your feet, but the necromancer was only warming up, now may be a good time to retreat before joining his ranks... in death.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_7_ENDSTORY,"The city is shaken up from the blow of Azarathius\' terrifying magic, the council sends out a distraction to buy enough time to finish the protection spell.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_8_ENDSTORY,"You successfully thwarted the assault and allowed Azarathius to finish his incantation. He hurls a massive fireball toward the city, upons contact everything is bathed in blinding light, it seems as if Dyn\'Tur has been disintegrated.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_9_ENDSTORY,"The monolith has started summoning more powerful creatures, it\'s only a matter of time until you are overran; perhaps this is as good time as any to start praying.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_1_10_ENDSTORY,"Zamaroth staggers from your hit, giving you the opportunity to strike the monolith. As you dash toward the stone, crisply gripping your weapon, you are filled with memories of what this war cost your people, and of imagery of what awaits them if you fail.\nAs expected Zamaroth did not remain stunned for long, he beheads a few of your soldiers, enraged by the mere thought of getting caught off guard by a human, until he finally notices how long he had been incapacitated and what it allowed you to do..\nWith incredible force, he hurls his massive sword at you; you cannot be allowed to reach the monument.\nCarried by the hopes of your people you artfully dodge the flying blade and thrust your own into the core of the sinister monolith. Small cracks start forming around the perforation, then races all across the entire monument almost at the speed of light.\nOryth’s shell explodes, uncovering a rift through our reality which starts absorbing every creature it summoned, as if their anchor into this world could no longer hold them.\nYou raise your eyes to the sky to see the departure of your angelic allies; your destiny has been fulfilled, Tuloran, a new day is upon you.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_1_ENDSTORY,"You discouraged the attackers from further aggression, perhaps they will think twice about testing you next time.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_2_ENDSTORY,"The cursed creatures flee in the night, they will return one day, but for now your citizens are safe.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_3_ENDSTORY,"You quickly dispatch the swamp beasts and hastily head for Nataobeth before more come your way.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_4_ENDSTORY,"Before you could investigate on how the cultists escaped your initial search of the area, you feel a supernatural presence.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_5_ENDSTORY,"In the distance, you see another flight of Angels coming your way. As you brace for impact you feel incredible power on your shoulder.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_6_ENDSTORY,"The General nods in mourning as the last of the corrupted Angels fall. It had to be done.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_7_ENDSTORY,"The mob seemed to be protecting the church\'s ruins, as you get closer to it you can hear rumbling coming from its depths.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_8_ENDSTORY,"Demons! The Baxian ritual seems far more along than you ever thought.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_2_9_ENDSTORY,"Upon striking the demon, the Monolith explodes, letting out immense energy. The entire catacombs are filled in a thick dark light. \n\nYou fall on your knees, the light seems to drain your life force away. As you collapse on the floor, you no longer feel alone in the room, a strong presence fills the air around you. \n\nThe Monolith\'s shattering let out four unspeakable evil upon our world.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_1_ENDSTORY,"You discouraged the attackers from further aggression, perhaps they will think twice about testing you next time.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_2_ENDSTORY,"The cursed creatures flee in the night, they will return one day, but for now your citizens are safe.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_3_ENDSTORY,"You quickly dispatch the swamp beasts and hastily head for Nataobeth before more come your way.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_4_ENDSTORY,"Before you could investigate on how the cultists escaped your initial search of the area, you feel a supernatural presence.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_5_ENDSTORY,"In the distance, you see another flight of Angels coming your way. As you brace for impact you feel incredible power on your shoulder.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_6_ENDSTORY,"The General nods in mourning as the last of the corrupted Angels fall. It had to be done.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_7_ENDSTORY,"The mob seemed to be protecting the church\'s ruins, as you get closer to it you can hear rumbling coming from its depths.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_8_ENDSTORY,"Demons! The Baxian ritual seems far more along than you ever thought.");
         LANGUAGE_EN.AddText(ID_CAMPAIGN3_3_9_ENDSTORY,"Upon striking the demon, the Monolith explodes, letting out immense energy. The entire catacombs are filled in a thick dark light. \n\nYou fall on your knees, the light seems to drain your life force away. As you collapse on the floor, you no longer feel alone in the room, a strong presence fills the air around you. \n\nThe Monolith\'s shattering let out four unspeakable evil upon our world.");
         LANGUAGE_EN.AddText(ID_CHAPTER1_NAME,"Heroes");
         LANGUAGE_EN.AddText(ID_CHAPTER2_NAME,"Ashes of Berhyte");
         LANGUAGE_EN.AddText(ID_CHAPTER3_NAME,"Age of Myths");
         LANGUAGE_EN.AddText(ID_CHAPTER2_1_NAME,"2 - Chapter 1");
         LANGUAGE_EN.AddText(ID_CHAPTER2_2_NAME,"2 - Chapter 2");
         LANGUAGE_EN.AddText(ID_CHAPTER2_3_NAME,"2 - Chapter 3");
         LANGUAGE_EN.AddText(ID_CHAPTER3_1_NAME,"3 - Chapter 1");
         LANGUAGE_EN.AddText(ID_CHAPTER3_2_NAME,"3 - Chapter 2");
         LANGUAGE_EN.AddText(ID_CHAPTER3_3_NAME,"3 - Chapter 3");
         LANGUAGE_EN.AddText(ID_ALL_ARMY_EMPTY,"All your armies are empty, An empty army cannot enter battle.");
         LANGUAGE_EN.AddText(ID_CANT_ACTIVATE,"Unable to connect. Can\'t activate your army.");
         LANGUAGE_EN.AddText(ID_ALREADY_ACTIVATED,"This army is already activated.");
         LANGUAGE_EN.AddText(ID_SET_PRIME,"HEROES");
         LANGUAGE_EN.AddText(ID_SET_EXPANSION1,"ASHES OF BERHYTE");
         LANGUAGE_EN.AddText(ID_SET_MYTHIC,"MYTHIC");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_1,"WOOD CHALLENGER");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_2,"WOOD CONTENDER");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_3,"WOOD VETERAN");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_4,"STEEL CHALLENGER");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_5,"STEEL CONTENDER");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_6,"STEEL VETERAN");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_7,"COPPER CHALLENGER");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_8,"COPPER CONTENDER");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_9,"COPPER VETERAN");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_10,"SILVER CHALLENGER");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_11,"SILVER CONTENDER");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_12,"SILVER VETERAN");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_13,"GOLD CHALLENGER");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_14,"GOLD CONTENDER");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_15,"GOLD VETERAN");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_16,"PLATINUM CHALLENGER");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_17,"PLATINUM CONTENDER");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_18,"PLATINUM VETERAN");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_19,"CHAMPION");
         LANGUAGE_EN.AddText(ID_MULTIPLAYER_RANK_NAME_20,"LEGEND");
         LANGUAGE_EN.AddText(ID_RELOAD_TIME_TXT,"RELOAD TIME :");
         LANGUAGE_EN.AddText(ID_CASTING_TIME_TXT,"CASTING TIME :");
         LANGUAGE_EN.AddText(ID_PRIME_STONE_BOOSTER,"Stone Booster");
         LANGUAGE_EN.AddText(ID_PRIME_STONE_STARTER,"Stone Starter");
         LANGUAGE_EN.AddText(ID_PRIME_IRON_BOOSTER,"Iron Booster");
         LANGUAGE_EN.AddText(ID_PRIME_IRON_STARTER,"Iron Starter");
         LANGUAGE_EN.AddText(ID_PRIME_STEEL_BOOSTER,"Steel Booster");
         LANGUAGE_EN.AddText(ID_PRIME_STEEL_STARTER,"Steel Starter");
         LANGUAGE_EN.AddText(ID_PRIME_GOLD_BOOSTER,"Gold Booster");
         LANGUAGE_EN.AddText(ID_RARE_DAILY_REWARD_1,"Daily Reward");
         LANGUAGE_EN.AddText(ID_RARE_DAILY_REWARD_2,"Rare");
         LANGUAGE_EN.AddText(ID_ALL_SET,"- ALL -");
         LANGUAGE_EN.AddText(ID_PRIME_SET_1,"- HEROES -");
         LANGUAGE_EN.AddText(ID_EXPANSION_SET_1,"- ASHES -");
         LANGUAGE_EN.AddText(ID_DAILY_PACK,"Daily Pack");
         LANGUAGE_EN.AddText(ID_WEEKLY_PACK,"Weekly Pack");
         LANGUAGE_EN.AddText(ID_AUTO_RANK_0,"RANK");
         LANGUAGE_EN.AddText(ID_AUTO____0,"20");
         LANGUAGE_EN.AddText(ID_AUTO____1,"21");
         LANGUAGE_EN.AddText(ID_AUTO____2,"22");
         LANGUAGE_EN.AddText(ID_AUTO____3,"23");
         LANGUAGE_EN.AddText(ID_AUTO_____0,"00:");
         LANGUAGE_EN.AddText(ID_AUTO_REFRESH_0,"REFRESH RESULTS");
         LANGUAGE_EN.AddText(ID_AUTO_LOSSES_0,"DEFEATS");
         LANGUAGE_EN.AddText(ID_AUTO_WINS_0,"VICTORIES");
         LANGUAGE_EN.AddText(ID_AUTO_DRAWS_0,"DRAWS");
         LANGUAGE_EN.AddText(ID_AUTO_ACTIVATE_0,"Activate this army to let it fight for you.");
         LANGUAGE_EN.AddText(ID_AUTO_DEACTIVATE_0,"Deactivate this army to take it out of the ladder.");
         LANGUAGE_EN.AddText(ID_AUTO_BATTLE_0,"BATTLE ADVISOR VAL\'BERT");
         LANGUAGE_EN.AddText(ID_AUTO_YOUR_0,"Your Gaming Life, Simplified.");
         LANGUAGE_EN.AddText(ID_AUTO_YOUR_1,"YOUR FRIEND\'S ARMY ");
         LANGUAGE_EN.AddText(ID_AUTO_SELECT_0,"SELECT YOUR FRIEND\'S ARMY ");
         LANGUAGE_EN.AddText(ID_AUTO_YOUR_2,"YOUR ARMY ");
         LANGUAGE_EN.AddText(ID_AUTO_SELECT_1,"SELECT YOUR ARMY ");
         LANGUAGE_EN.AddText(ID_AUTO_GOOD_0,"Good sir! Perhaps we should use the stashed RAGS on our men, they should give them a small enough edge to defeat the opposing forces.\n\nLet\'s go review your formation plans.");
         LANGUAGE_EN.AddText(ID_AUTO_THIS_0,"This is your STRATEGY BOOK.\n\nFirst, select one of your unit. ");
         LANGUAGE_EN.AddText(ID_AUTO_ONCE_0,"Once selected, you can go change their equipment.");
         LANGUAGE_EN.AddText(ID_AUTO_HERE_0,"Here you have your current unit along with their statistics.");
         LANGUAGE_EN.AddText(ID_AUTO_PICK_0,"Pick a RAG from the  war resources and assign it to their  ARMOR slot.");
         LANGUAGE_EN.AddText(ID_AUTO_AS_0,"As you can see, units wearing RAGS are more resilient against piercing attacks.\n\nBut they cost more to deploy than without, a small price to pay.");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_0,"You can now press SAVE. ");
         LANGUAGE_EN.AddText(ID_AUTO_ASSIGN_0,"Assign as many as you can for now, then press OK, we will get into this in detail at a later time.");
         LANGUAGE_EN.AddText(ID_AUTO_WHEN_0,"When editing a unit, they are removed from the formation.");
         LANGUAGE_EN.AddText(ID_AUTO_TO_0,"To deploy units, you can drag them into place or hold CTRL and CLICK the space you want them to occupy.");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_1,"You may want to change the speed of your Squads. While you want your caster and range units on HOLD, you could want your melee units on FAST/SLOW. It all depends on your Battle plan.");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_2,"You can now go put some RAGS on your other units, but hurry, the others are waiting for you!");
         LANGUAGE_EN.AddText(ID_AUTO_GOOD_1,"Good Job!\nCompleting Act 1 unlocked new features ! Battle online against other players in The Battlefield, create your War Banner and buy new supplies in the Booster Shop.");
         LANGUAGE_EN.AddText(ID_AUTO_HERE_1,"Here is your Booster Shop! Spend your collected gold here to gather more war supplies.");
         LANGUAGE_EN.AddText(ID_AUTO_G_DAY_0,"G’day my my Lord, from here you can oversee the Battle!\n\nLet’s get acquainted with the basic commands shall we?");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_3,"You can make the fight go faster by pressing the 2x BUTTON.");
         LANGUAGE_EN.AddText(ID_AUTO_IN_0,"In the center is the TIMER.\n\nPlan unit attacks and defenses using this.");
         LANGUAGE_EN.AddText(ID_AUTO_ONCE_1,"Once you press the PLAY BUTTON, the battle will start.");
         LANGUAGE_EN.AddText(ID_AUTO_SIR__0,"Sir! We\'re going to need more men to counter this assault. \n\nLet\'s go back to your formation book and see what we can muster.");
         LANGUAGE_EN.AddText(ID_AUTO_THIS_1,"This time we need to add a different unit to the formation.");
         LANGUAGE_EN.AddText(ID_AUTO_PICK_1,"Pick up one of your free men and put him on deck.");
         LANGUAGE_EN.AddText(ID_AUTO_NOW_0,"Now give them one of the bows that we had left.");
         LANGUAGE_EN.AddText(ID_AUTO_BOWS_0,"Bows have a longer range than daggers and pikes, they can reach over entire rows of men.");
         LANGUAGE_EN.AddText(ID_AUTO_GIVE_0,"Give your unit a NAME. \n\nOnce you’re done, SAVE your unit.");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_4,"You can only affect as many as the lowest selected resource. Right now let\'s make 6 knights, press the arrow key!");
         LANGUAGE_EN.AddText(ID_AUTO_SELECT_2,"Select your ARCHERS and deploy them on the BATTLE PLAN.\n\nBeing ranged fighters, you will want them BEHIND your FRONT-LINERS.");
         LANGUAGE_EN.AddText(ID_AUTO_THAT_0,"That should do the trick.\n\nQuick, the Orcs are coming!");
         LANGUAGE_EN.AddText(ID_AUTO_ONE_0,"One of the Wizards is apt for battle Sir. Let\'s go set him up.");
         LANGUAGE_EN.AddText(ID_AUTO_LIKE_0,"Like when we added our Archers, let\'s go in Creation Mode.");
         LANGUAGE_EN.AddText(ID_AUTO_SELECT_3,"Select the man and put him on deck.");
         LANGUAGE_EN.AddText(ID_AUTO_NOW_1,"Now give him a Wizard staff.");
         LANGUAGE_EN.AddText(ID_AUTO_LIKE_1,"Like Archers, Wizards attack from afar. They take a while longer between attacks, but do impressive destruction.");
         LANGUAGE_EN.AddText(ID_AUTO_NAME_0,"Name your new Wizard unit and press SAVE.");
         LANGUAGE_EN.AddText(ID_AUTO_YOUR_3,"The other man is still wounded, only add 1 for now.");
         LANGUAGE_EN.AddText(ID_AUTO_SELECT_4,"Select your Wizard and put him as far away as you can.\n\nYou need them to live long enough to cast their magic.");
         LANGUAGE_EN.AddText(ID_AUTO_THAT_1,"That should work for now, let\'s keep going!");
         LANGUAGE_EN.AddText(ID_AUTO_WELCOME_0,"Welcome to the BATTLEFIELD, Sir!");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_5,"You can now create up to 4 armies, each using the same collection, just in a different formation.");
         LANGUAGE_EN.AddText(ID_AUTO_ONCE_2,"Once an army is finalized, you can allow it to fight in the Ladder.");
         LANGUAGE_EN.AddText(ID_AUTO_AS_1,"As long as it\'s activated, an army can defend its standing on the LADDER on its own, no need to be around.");
         LANGUAGE_EN.AddText(ID_AUTO_CHALLENGING_0,"Manually challenging the LADDER is done by pressing the RANKED MATCH button.");
         LANGUAGE_EN.AddText(ID_AUTO_EVERY_0,"Every battle your armies enter will affect their LADDER RANK displayed above. ");
         LANGUAGE_EN.AddText(ID_AUTO_EVERY_1,"Every army has their own set of RANKED BATTLE STATS.");
         LANGUAGE_EN.AddText(ID_AUTO___0,"-");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_6,"You can also see where your army stands in it’s current rank by pressing the SHOW LADDER button.");
         LANGUAGE_EN.AddText(ID_AUTO_EVERY_2,"Every battle WON grant you 1pt.\n\nwhile a LOSS takes 1pt away.");
         LANGUAGE_EN.AddText(ID_AUTO_REMEMBER_0,"Remember that your RANK is also affected by battles won and lost while defending.\n\n-> Don\'t leave an unfinished army activated!");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_7,"You can also fight in non-Ladder Battles against friends and gain gold for every victory. ");
         LANGUAGE_EN.AddText(ID_AUTO_NOW_2,"Now it\'s up to you to build your armies, learn new strategies and earn better Supplies.\n\nGood luck Sir!");
         LANGUAGE_EN.AddText(ID_AUTO_SIR__1,"Sir! This man may not be a soldier but he seems fit enough to help us in some way.\n\nLet\'s see what we have available for him.");
         LANGUAGE_EN.AddText(ID_AUTO_ONCE_3,"Once again, we need to create a new unit.");
         LANGUAGE_EN.AddText(ID_AUTO_ONCE_4,"Once again, we need to create a new unit.");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_8,"You have two choices here my lord : either give this man a BOW or a FLAG.\n\nThis flag gives the units near him +2 Fire ATK.");
         LANGUAGE_EN.AddText(ID_AUTO____4," +2");
         LANGUAGE_EN.AddText(ID_AUTO_SIR__2,"Sir! The second Wizard has regained some of his strength. Perhaps it would be wise to add him to our ranks, the Vermin swarms are getting overwhelming.");
         LANGUAGE_EN.AddText(ID_AUTO_AS_2,"As usual, go in the CREATE menu to make a new unit.");
         LANGUAGE_EN.AddText(ID_AUTO_THESE_0,"This Wizard is equipped with a ring that will make him cast faster, maybe unleashing his magical fury on different enemies.");
         LANGUAGE_EN.AddText(ID_AUTO_DON_T_0,"Don\'t forget to give the SECOND RING to your other wizard!");
         LANGUAGE_EN.AddText(ID_AUTO_HOLD_0,"HOLD CTRL");
         LANGUAGE_EN.AddText(ID_AUTO_UPON_0,"Upon the defeat of the Orc-demon, the mountain starts shaking and crumbling, you and your men rush out of the canyon and down the mountain path. Once in the valley, your troops gaze in awe at the sky, an entire mountain exploding in the night, like magical fireworks. You try your best to join the celebrations but the dying words of the smiling demon haunts your thoughts.\n\n\"I was only the beginning\"\n\nYou and your troops travel back toward the Emperor\'s kingdom, head filled with stories of your battles and eventual victory over the forces of evil. Justice and good prevailed over the Demon, bards will sing tales of your deed for centuries to come.");
         LANGUAGE_EN.AddText(ID_AUTO_THE_0,"The Emperor is astonished of your victory, he knew of your potential to be a great war commander, but never would he have expected you to outsmart him and overpower his forces, at least not so soon.\nIt\'s a pleasant surprise, though. He is glad to have such powerful allies and feels the battle against the Demonic hordes may not be lost after all.\n\nYour victory proved him right in the end, you and the other war commanders have trained hard, he will not be alone in the upcoming battle.\n\nYou are awarded the leadership of the defense against further Demonic attacks, the people\'s fate now lies in your hands!");
         LANGUAGE_EN.AddText(ID_AUTO_UPON_1,"Complete silence engulf the scene, not even a gasp comes out of your troops, you all stare down at the demonic bodies as they shrivel into a pile of refuse.\n\nThe Nightmare is finally over.\n\nYou quickly turn around screaming for your men, suddenly remembering the incoming undead swarm, but not a single one is to be seen as if they had vanished from existence, along with your words as not a single sound seemed to escape your mouth.\n\nAs the last speckle of Demonic remains disintegrates into nothingness, the sun rises again over the hills and, finally, sounds of waking birds break the silence.\n\nThe Kingdom is safe once again, thanks to you!");
         LANGUAGE_EN.AddText(ID_AUTO___1,"- ACT 2 -\n- RANKED BATTLES -\n- THE BOOSTER SHOP -");
         LANGUAGE_EN.AddText(ID_AUTO_CONGRATULATIONS_0,"CONGRATULATIONS");
         LANGUAGE_EN.AddText(ID_AUTO_ARE_0,"ARE NOW AVAILABLE!!");
         LANGUAGE_EN.AddText(ID_AUTO___2,"- ACT 3 -");
         LANGUAGE_EN.AddText(ID_AUTO_IS_0,"IS NOW AVAILABLE!!");
         LANGUAGE_EN.AddText(ID_AUTO_CHAPTER_0,"CHAPTER 1 COMPLETED!");
         LANGUAGE_EN.AddText(ID_AUTO___3,"/");
         LANGUAGE_EN.AddText(ID_AUTO_TOMORROW_0,"TOMORROW");
         LANGUAGE_EN.AddText(ID_AUTO_TODAY_0,"TODAY");
         LANGUAGE_EN.AddText(ID_AUTO_DAILY_0,"DAILY REWARD");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_9,"YOU SHALL BE REWARDED FOR COMING BACK EVERY DAY");
         LANGUAGE_EN.AddText(ID_AUTO_ON_0,"On top of all the features from the offline play, playing on the servers will allow you to:");
         LANGUAGE_EN.AddText(ID_AUTO_COLLECT_0,"Collect Daily Rewards.");
         LANGUAGE_EN.AddText(ID_AUTO_OFFLINE_0,"Offline play allows you to :");
         LANGUAGE_EN.AddText(ID_AUTO_COMPETE_0,"Compete in the ladder.");
         LANGUAGE_EN.AddText(ID_AUTO_COMPETE_1,"Battle against your friends.");
         LANGUAGE_EN.AddText(ID_AUTO_SAVE_0,"Save your game online and play with your progress anywhere.");
         LANGUAGE_EN.AddText(ID_AUTO_COMPLETE_0,"Complete the single player campaign.");
         LANGUAGE_EN.AddText(ID_AUTO_ACCESS_0,"Access basic game features.");
         LANGUAGE_EN.AddText(ID_AUTO_OFFLINE_1,"OFFLINE");
         LANGUAGE_EN.AddText(ID_AUTO_ONLINE_0,"ONLINE");
         LANGUAGE_EN.AddText(ID_AUTO_GAME_0,"GAME SETUP");
         LANGUAGE_EN.AddText(ID_AUTO_GAME_1,"Game Progress are saved on your computer directly.");
         LANGUAGE_EN.AddText(ID_AUTO_TO_1,"To create your army, you have to log in first! This allows you to:");
         LANGUAGE_EN.AddText(ID_AUTO_BEFORE_0,"BEFORE YOU START");
         LANGUAGE_EN.AddText(ID_AUTO_ENLISTMENT_0,"ENLISTMENT");
         LANGUAGE_EN.AddText(ID_AUTO_CAMPAIGN_0,"CAMPAIGN");
         LANGUAGE_EN.AddText(ID_AUTO_CHAPTER_1,"CHAPTER");
         LANGUAGE_EN.AddText(ID_AUTO_CREATURES_0,"CREATURES");
         LANGUAGE_EN.AddText(ID_AUTO_ITEMS_0,"ITEMS");
         LANGUAGE_EN.AddText(ID_AUTO_PRIME_0,"HEROES");
         LANGUAGE_EN.AddText(ID_AUTO_EXPANSION_0,"ASHES");
         LANGUAGE_EN.AddText(ID_AUTO_EXPANSION_1,"MYTHS");
         LANGUAGE_EN.AddText(ID_AUTO_STONE_0,"STONE");
         LANGUAGE_EN.AddText(ID_AUTO_BOOSTER_0,"BOOSTER");
         LANGUAGE_EN.AddText(ID_AUTO_STARTER_0,"STARTER");
         LANGUAGE_EN.AddText(ID_AUTO_IRON_0,"IRON");
         LANGUAGE_EN.AddText(ID_AUTO_STEEL_0,"STEEL");
         LANGUAGE_EN.AddText(ID_AUTO_GOLD_0,"GOLD");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_10,"YOU  ARE  NOW ");
         LANGUAGE_EN.AddText(ID_AUTO_CHANGING_0,"CHANGING  RANK");
         LANGUAGE_EN.AddText(ID_AUTO_CURRENT_0,"Current Ranking : ");
         LANGUAGE_EN.AddText(ID_AUTO_YOUR_4,"YOUR ARMY");
         LANGUAGE_EN.AddText(ID_AUTO_CHALLENGES_0,"CHALLENGES YOU!");
         LANGUAGE_EN.AddText(ID_AUTO_COMMON_0,"COMMON");
         LANGUAGE_EN.AddText(ID_AUTO_UNCOMMON_0,"UNCOMMON");
         LANGUAGE_EN.AddText(ID_AUTO_RARE_0,"RARE");
         LANGUAGE_EN.AddText(ID_AUTO_LEGENDARY_0,"LEGENDARY");
         LANGUAGE_EN.AddText(ID_AUTO_VS_0,"VS");
         LANGUAGE_EN.AddText(ID_AUTO_MATCH_0,"BATTLE INFO");
         LANGUAGE_EN.AddText(ID_AUTO_BATTLEFIELD_0,"BATTLEFIELD");
         LANGUAGE_EN.AddText(ID_AUTO_FRIENDS_0,"FRIENDS");
         LANGUAGE_EN.AddText(ID_AUTO_INVITE_0,"Invite your friends to Battle Cry!");
         LANGUAGE_EN.AddText(ID_AUTO_FRIEND_0,"FRIEND LIST");
         LANGUAGE_EN.AddText(ID_AUTO_ON_1,"on grey btn");
         LANGUAGE_EN.AddText(ID_AUTO_CASH_0,"cash");
         LANGUAGE_EN.AddText(ID_AUTO_ON_2,"on beige and green btn");
         LANGUAGE_EN.AddText(ID_AUTO_THE_1,"The next recruit will earn you:");
         LANGUAGE_EN.AddText(ID_AUTO_PACKS_0,"PACKS ");
         LANGUAGE_EN.AddText(ID_AUTO_NEW_0,"NEW SET: ASHES OF BERHYTE COMING SOON!");
         LANGUAGE_EN.AddText(ID_AUTO_COLLECTION_0,"COLLECTION");
         LANGUAGE_EN.AddText(ID_AUTO_OPTIONS_0,"OPTIONS");
         LANGUAGE_EN.AddText(ID_AUTO_SOUND_0,"SOUND");
         LANGUAGE_EN.AddText(ID_AUTO_MUSIC_0,"MUSIC");
         LANGUAGE_EN.AddText(ID_AUTO_QUALITY_0,"QUALITY");
         LANGUAGE_EN.AddText(ID_AUTO_CODEX_0,"CODEX");
         LANGUAGE_EN.AddText(ID_AUTO_LANGUAGE_0,"LANGUAGE");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_11,"You can learn about the history of the world and races of Battle Cry by reading the Codex.");
         LANGUAGE_EN.AddText(ID_AUTO_FLAG_0,"BANNER CREATION");
         LANGUAGE_EN.AddText(ID_AUTO_SYMBOLS_0,"SYMBOLS");
         LANGUAGE_EN.AddText(ID_AUTO_SHAPES_0,"SHAPES");
         LANGUAGE_EN.AddText(ID_AUTO_BACKGROUNDS_0,"BACKGROUNDS");
         LANGUAGE_EN.AddText(ID_AUTO_UNITS_0,"UNITS");
         LANGUAGE_EN.AddText(ID_AUTO_ARMIES_0,"ARMIES");
         LANGUAGE_EN.AddText(ID_AUTO_REMAINING_0,"remaining points");
         LANGUAGE_EN.AddText(ID_AUTO_SPEED_0,"SPEED");
         LANGUAGE_EN.AddText(ID_AUTO_HOST_0,"HOST");
         LANGUAGE_EN.AddText(ID_AUTO_MORE_0,"MORE GAMES");
         LANGUAGE_EN.AddText(ID_AUTO_CREDITS_0,"CREDITS");
         LANGUAGE_EN.AddText(ID_AUTO__TIENNE_0,"ÉTIENNE JEAN");
         LANGUAGE_EN.AddText(ID_AUTO_VINCENT_0,"VINCENT LONGPRÉ");
         LANGUAGE_EN.AddText(ID_AUTO___4,"- Game Design -");
         LANGUAGE_EN.AddText(ID_AUTO___5,"- Art & Director -");
         LANGUAGE_EN.AddText(ID_AUTO___6,"- Programming -");
         LANGUAGE_EN.AddText(ID_AUTO__TIENNE_1,"ÉTIENNE BÉDARD");
         LANGUAGE_EN.AddText(ID_AUTO___7,"- Interface Designer -");
         LANGUAGE_EN.AddText(ID_AUTO__MILIE_0,"ÉMILIE BOURGET");
         LANGUAGE_EN.AddText(ID_AUTO___8,"- Music -");
         LANGUAGE_EN.AddText(ID_AUTO_GINETTE_0,"WISEGUY ENTERTAINEMENT\nBYORN LYNNE\nPIERRE GERWIG LANGER");
         LANGUAGE_EN.AddText(ID_AUTO_A_0,"a Berzerk Studio production");
         LANGUAGE_EN.AddText(ID_AUTO___9,"1");
         LANGUAGE_EN.AddText(ID_AUTO_X_0,"x");
         LANGUAGE_EN.AddText(ID_AUTO___10,"2");
         LANGUAGE_EN.AddText(ID_AUTO_SKIP_0,"SKIP");
         LANGUAGE_EN.AddText(ID_AUTO_WIN_0,"WIN");
         LANGUAGE_EN.AddText(ID_AUTO_POINTS_0,"points");
         LANGUAGE_EN.AddText(ID_AUTO_CREATE_0,"CREATE");
         LANGUAGE_EN.AddText(ID_AUTO_EDIT_0,"EDIT");
         LANGUAGE_EN.AddText(ID_AUTO_AMOUNT_0,"AMOUNT OF UNIT");
         LANGUAGE_EN.AddText(ID_AUTO_SHIELD_0,"SHIELD");
         LANGUAGE_EN.AddText(ID_AUTO_ARMOR_0,"ARMOR");
         LANGUAGE_EN.AddText(ID_AUTO_CREATURE_0,"CREATURE");
         LANGUAGE_EN.AddText(ID_AUTO_SPECIAL_0,"SPECIAL");
         LANGUAGE_EN.AddText(ID_AUTO_WEAPON_0,"WEAPON");
         LANGUAGE_EN.AddText(ID_AUTO_UNIT_0,"unit\'s name");
         LANGUAGE_EN.AddText(ID_AUTO_HOW_0,"How many of this unit do you wish to create?");
         LANGUAGE_EN.AddText(ID_AUTO_RANGE_0,"Range");
         LANGUAGE_EN.AddText(ID_AUTO_ATTACK_0,"Attack");
         LANGUAGE_EN.AddText(ID_AUTO_DEFENSE_0,"Defense");
         LANGUAGE_EN.AddText(ID_AUTO_RESIST_0,"Resist");
         LANGUAGE_EN.AddText(ID_AUTO_UNIT_1,"UNIT");
         LANGUAGE_EN.AddText(ID_AUTO_POINTS_1,"points used");
         LANGUAGE_EN.AddText(ID_AUTO_NAME_1,"NAME THIS UNIT");
         LANGUAGE_EN.AddText(ID_AUTO_SPECIALS_0,"SPECIALS");
         LANGUAGE_EN.AddText(ID_AUTO_ARMORS_0,"ARMORS");
         LANGUAGE_EN.AddText(ID_AUTO_SHIELDS_0,"SHIELDS");
         LANGUAGE_EN.AddText(ID_AUTO_WEAPONS_0,"WEAPONS");
         LANGUAGE_EN.AddText(ID_AUTO_ALL_0,"ALL");
         LANGUAGE_EN.AddText(ID_AUTO_BACK_0,"BACK TO TITLE SCREEN");
         LANGUAGE_EN.AddText(ID_AUTO_SHOW_0,"SHOW LADDER");
         LANGUAGE_EN.AddText(ID_AUTO_RANKED_0,"RANKED MATCH");
         LANGUAGE_EN.AddText(ID_AUTO_TUTORIAL_0,"TUTORIAL");
         LANGUAGE_EN.AddText(ID_AUTO_UNEQUIP_0,"UNEQUIP ALL");
         LANGUAGE_EN.AddText(ID_AUTO_LOW_0,"LOW");
         LANGUAGE_EN.AddText(ID_AUTO_MEDIUM_0,"MEDIUM");
         LANGUAGE_EN.AddText(ID_AUTO_HIGH_0,"HIGH");
         LANGUAGE_EN.AddText(ID_AUTO_RESET_0,"RESET");
         LANGUAGE_EN.AddText(ID_AUTO_FIGHT_0,"FIGHT");
         LANGUAGE_EN.AddText(ID_AUTO_DELETE_0,"DELETE");
         LANGUAGE_EN.AddText(ID_AUTO_DONE_0,"DONE");
         LANGUAGE_EN.AddText(ID_AUTO_LINK_0,"LINK");
         LANGUAGE_EN.AddText(ID_AUTO_FLAG_1,"BANNER");
         LANGUAGE_EN.AddText(ID_AUTO_COMPLETE_1,"COMPLETE ACT 1 OF THE CAMPAIGN TO UNLOCK ");
         LANGUAGE_EN.AddText(ID_AUTO_APPARAIT_0,"apparait en over");
         LANGUAGE_EN.AddText(ID_AUTO_BUY_0,"BUY PACK");
         LANGUAGE_EN.AddText(ID_AUTO_SAVING_0,"SAVING");
         LANGUAGE_EN.AddText(ID_AUTO___11,".");
         LANGUAGE_EN.AddText(ID_AUTO____5,"..");
         LANGUAGE_EN.AddText(ID_AUTO_____1,"...");
         LANGUAGE_EN.AddText(ID_AUTO_SEARCHING_ENEMY_0,"FINDING\nBATTLE");
         LANGUAGE_EN.AddText(ID_AUTO_SHARING_0,"Sharing On\nFacebook");
         LANGUAGE_EN.AddText(ID_AUTO_LOADING_0,"LOADING");
         LANGUAGE_EN.AddText(ID_AUTO_REGISTERING_0,"PROCESSING");
         LANGUAGE_EN.AddText(ID_AUTO_CONNECTING_0,"ENABLING MULTIPLAYER");
         LANGUAGE_EN.AddText(ID_AUTO_SHARE_0,"SHARE THIS LINK: ");
         LANGUAGE_EN.AddText(ID_AUTO_INVITE_1,"INVITE");
         LANGUAGE_EN.AddText(ID_AUTO_YES_0,"YES");
         LANGUAGE_EN.AddText(ID_AUTO_NO_0,"NO");
         LANGUAGE_EN.AddText(ID_AUTO___12,"0");
         LANGUAGE_EN.AddText(ID_AUTO___13,"4");
         LANGUAGE_EN.AddText(ID_AUTO___14,"3");
         LANGUAGE_EN.AddText(ID_AUTO___15,"6");
         LANGUAGE_EN.AddText(ID_AUTO___16,"5");
         LANGUAGE_EN.AddText(ID_AUTO___17,"8");
         LANGUAGE_EN.AddText(ID_AUTO___18,"7");
         LANGUAGE_EN.AddText(ID_AUTO____6,"10");
         LANGUAGE_EN.AddText(ID_AUTO___19,"9");
         LANGUAGE_EN.AddText(ID_AUTO____7,"-9");
         LANGUAGE_EN.AddText(ID_AUTO_____2,"-10");
         LANGUAGE_EN.AddText(ID_AUTO____8,"-7");
         LANGUAGE_EN.AddText(ID_AUTO____9,"-8");
         LANGUAGE_EN.AddText(ID_AUTO____10,"-5");
         LANGUAGE_EN.AddText(ID_AUTO____11,"-6");
         LANGUAGE_EN.AddText(ID_AUTO____12,"-3");
         LANGUAGE_EN.AddText(ID_AUTO____13,"-4");
         LANGUAGE_EN.AddText(ID_AUTO____14,"-1");
         LANGUAGE_EN.AddText(ID_AUTO____15,"-2");
         LANGUAGE_EN.AddText(ID_AUTO_ENTER_0,"ENTER YOUR FRIEND\'S GAMERSAFE ACCOUNT NAME BELOW");
         LANGUAGE_EN.AddText(ID_AUTO_ADD_0,"ADD");
         LANGUAGE_EN.AddText(ID_AUTO_STONE_1,"STONE STARTER");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_12,"PACK CONTENT");
         LANGUAGE_EN.AddText(ID_AUTO___20,"- PRIME SET - ");
         LANGUAGE_EN.AddText(ID_AUTO_CHANGE_0,"CHANGE ARMY");
         LANGUAGE_EN.AddText(ID_AUTO_GIVE_1,"NAME YOUR ARMY");
         LANGUAGE_EN.AddText(ID_AUTO_ACT_0,"ACT 3");
         LANGUAGE_EN.AddText(ID_AUTO_ACT_1,"ACT 2");
         LANGUAGE_EN.AddText(ID_AUTO_ACT_2,"ACT 1");
         LANGUAGE_EN.AddText(ID_AUTO_REWARD_0,"ACQUIRED");
         LANGUAGE_EN.AddText(ID_AUTO_REWARD_1,"REWARD ");
         LANGUAGE_EN.AddText(ID_AUTO_LOGIN_0,"LOGIN");
         LANGUAGE_EN.AddText(ID_AUTO_USERNAME_0,"USERNAME");
         LANGUAGE_EN.AddText(ID_AUTO_PASSWORD_0,"PASSWORD");
         LANGUAGE_EN.AddText(ID_AUTO_PLAY_0,"PLAY OFFLINE");
         LANGUAGE_EN.AddText(ID_AUTO_PLAY_1,"PLAY ONLINE");
         LANGUAGE_EN.AddText(ID_AUTO_SIGN_0,"SIGN IN");
         LANGUAGE_EN.AddText(ID_AUTO_CLOSE_0,"CLOSE");
         LANGUAGE_EN.AddText(ID_AUTO_SAVE_1,"SAVE");
         LANGUAGE_EN.AddText(ID_AUTO___21,"?");
         LANGUAGE_EN.AddText(ID_AUTO_RARE_1,"rare item");
         LANGUAGE_EN.AddText(ID_AUTO______0,"2000");
         LANGUAGE_EN.AddText(ID_AUTO______1,"1000");
         LANGUAGE_EN.AddText(ID_AUTO_____3,"500");
         LANGUAGE_EN.AddText(ID_AUTO_____4,"250");
         LANGUAGE_EN.AddText(ID_AUTO_REWARD_2,"REWARD");
         LANGUAGE_EN.AddText(ID_AUTO_HERE_2,"Here is your prize");
         LANGUAGE_EN.AddText(ID_AUTO_RECRUITMENT_0,"RECRUITMENT");
         LANGUAGE_EN.AddText(ID_AUTO_HERE_3,"Here is your reward for recruiting");
         LANGUAGE_EN.AddText(ID_AUTO_RECRUITED_0,"recruited");
         LANGUAGE_EN.AddText(ID_AUTO_OK_0,"OK");
         LANGUAGE_EN.AddText(ID_AUTO_CANCEL_0,"CANCEL");
         LANGUAGE_EN.AddText(ID_AUTO_ARMY_0,"ARMY");
         LANGUAGE_EN.AddText(ID_AUTO_BEFORE_1,"SELECT WHICH ARMY SHOULD ENTER THE BATTLE: ");
         LANGUAGE_EN.AddText(ID_AUTO_RENAME_0,"RENAME");
         LANGUAGE_EN.AddText(ID_AUTO_GOLD_1,"GOLD SHOP");
         LANGUAGE_EN.AddText(ID_AUTO_THANKS_0,"THANKS FOR SUPPORTING US!!");
         LANGUAGE_EN.AddText(ID_AUTO_______0,"5,000");
         LANGUAGE_EN.AddText(ID_AUTO________0,"10,000");
         LANGUAGE_EN.AddText(ID_AUTO________1,"20,000");
         LANGUAGE_EN.AddText(ID_AUTO________2,"35,000");
         LANGUAGE_EN.AddText(ID_AUTO_BEST_0,"BEST DEAL EVER");
         LANGUAGE_EN.AddText(ID_AUTO_LOADING_1,"loading ");
         LANGUAGE_EN.AddText(ID_AUTO_NEXT_0,"NEXT");
         LANGUAGE_EN.AddText(ID_AUTO_PREVIOUS_0,"PREVIOUS");
         LANGUAGE_EN.AddText(ID_AUTO_ACTIVATE_1,"ACTIVATE");
         LANGUAGE_EN.AddText(ID_AUTO_DEACTIVATE_1,"DEACTIVATE");
         LANGUAGE_EN.AddText(ID_AUTO_VICTORY_0,"VICTORY");
         LANGUAGE_EN.AddText(ID_AUTO_CONTINUE_0,"CONTINUE");
         LANGUAGE_EN.AddText(ID_AUTO_YOU_VE_0,"YOU\'VE BEEN\nDEFEATED");
         LANGUAGE_EN.AddText(ID_AUTO_DRAW_0,"DRAW");
         LANGUAGE_EN.AddText(ID_AUTO_TIPS_0,"TIPS");
         LANGUAGE_EN.AddText(ID_AUTO_RANKED_1,"RANKED UP!");
         LANGUAGE_EN.AddText(ID_TUTO_INIT_PAGE_1,"Let\'s take a look at your actual army!");
         LANGUAGE_EN.AddText(ID_TUTO_INIT_PAGE_2,"Here are your FRONT-LINERS and PIKEMEN. They are already in your ARMY but you can drag them around to change your ARMY\'s composition !");
         LANGUAGE_EN.AddText(ID_TUTO_INIT_PAGE_3,"You can change the SPEED of each SQUADS to HOLD, SLOW or FAST. Changing it will affect the course of the battle drastically!");
         LANGUAGE_EN.AddText(ID_TUTO_INIT_PAGE_4,"Enough talk for now, go back to the BATTLEFIELD!");
         LANGUAGE_EN.AddText(ID_TUTO_FLAG_PAGE_2,"FLAG-BEARERS grant +1 FIRE DMG to every other unit present in their SQUAD.");
         LANGUAGE_EN.AddText(ID_TUTO_FLAG_PAGE_3,"STATS TALK: Each unit have an amount of each type of both ATTACKS and RESISTS. To counter a certain ATTACK type, EQUIP your units with the same RESIST type and the DMG from that type will be reduced.");
         LANGUAGE_EN.AddText(ID_TUTORIAL_CREATE_PAGE_1,"We could use some KNIGHTS in our ARMY.\n\nLet\'s get back to our ARMY MANAGEMENT and get those horses moving !");
         LANGUAGE_EN.AddText(ID_TUTORIAL_CREATE_PAGE_2,"From now on, when you receive new UNITS and EQUIPMENTS, you will have to CREATE your UNITS manually!");
         LANGUAGE_EN.AddText(ID_TUTORIAL_CREATE_PAGE_3,"First of all, drag a HUMAN in the CREATURE SLOT.");
         LANGUAGE_EN.AddText(ID_TUTORIAL_CREATE_PAGE_4,"Now equip your HUMAN with an IRON SWORD, a BUCKLER, a GAMBESON and a HORSE !");
         LANGUAGE_EN.AddText(ID_TUTORIAL_CREATE_PAGE_5,"Here are your UNIT\'S final STATS, including it\'s COST to put in your ARMY.");
         LANGUAGE_EN.AddText(ID_AUTO_12X,"12x");
         LANGUAGE_EN.AddText(ID_AUTO_6X,"6x");
         LANGUAGE_EN.AddText(ID_AUTO_1X,"1x");
         LANGUAGE_EN.AddText(ID_DAILY_UNDEAD,"UNDEAD");
         LANGUAGE_EN.AddText(ID_DAILY_HUMAN,"HUMAN");
         LANGUAGE_EN.AddText(ID_DAILY_ORC,"ORC");
         LANGUAGE_EN.AddText(ID_DAILY_VERMINE,"VERMIN");
         LANGUAGE_EN.AddText(ID_DAILY_BEHEMOT,"BEHEMOTH");
         LANGUAGE_EN.AddText(ID_DAILY_REPTILIAN,"REPTILIAN");
         LANGUAGE_EN.AddText(ID_DAILY_OCTOPOD,"OCTOPOD");
         LANGUAGE_EN.AddText(ID_DAILY_FIRE,"FIRE");
         LANGUAGE_EN.AddText(ID_DAILY_WATER,"WATER");
         LANGUAGE_EN.AddText(ID_DAILY_POISON,"POISON");
         LANGUAGE_EN.AddText(ID_DAILY_LIGHTNING,"LIGHTNING");
         LANGUAGE_EN.AddText(ID_DAILY_IMP,"IMP");
         LANGUAGE_EN.AddText(ID_DAILY_GOLEM,"GOLEM");
         LANGUAGE_EN.AddText(ID_AWARDED_AT_FLAG,"AWARDED AT");
         LANGUAGE_EN.AddText(ID_PACK_OF_THE_DAY,"PACK OF THE DAY");
         LANGUAGE_EN.AddText(ID_PACK_OF_THE_WEEK,"THIS WEEK");
         LANGUAGE_EN.AddText(ID_NOT_CONNECTED_ON_ARMORGAMES,"PLEASE CONNECT TO ARMORGAMES TO PLAY.");
         LANGUAGE_EN.AddText(ID_ARE_YOU_SURE_YOU_WANT_TO_CONCEDE,"Are you sure you want to concede victory to your enemy ?");
         LANGUAGE_EN.AddText(ID_ARMORGAME_MTX,"Press OK when the transaction is done, you might have to reload game to get your reward!");
         LANGUAGE_EN.AddText(ID_DELETE_DATA,"RESET MY GAME");
         LANGUAGE_EN.AddText(ID_DO_YOU_WANT_DELETE,"Do you really want to reset your game? EVERYTHING will be gone, forever, and ever, and ever.");
         LANGUAGE_EN.AddText(ID_ARE_YOU_SURE_YOU_WANT_TO_DELETE,"Are you REALLY sure?  No recovery can EVER be done, once you press yes, it\'s GONE like the dinosaurs.");
         LANGUAGE_EN.AddText(ID_RESET_MULTIPLAYER_ARMY,"RESET ARMY RANK");
         LANGUAGE_EN.AddText(ID_DO_YOU_WANT_TO_RESET_ARMY,"Are you sure you want to reset your army\'s multiplayer ranking ?");
         LANGUAGE_EN.AddText(ID_AUTO_CAPTCHA,"Captcha");
         LANGUAGE_EN.AddText(ID_SURVIVAL_COOP,"SURVIVAL COOP");
         LANGUAGE_EN.AddText(ID_CLASSIC_1000_PTS,"CLASSIC 1000 PTS.");
         LANGUAGE_EN.AddText(ID_CLASSIC_500_PTS,"CLASSIC 500 PTS.");
         LANGUAGE_EN.AddText(ID_TOURNAMENT_MODE,"TOURNAMENT");
         LANGUAGE_EN.AddText(ID_AUTO_ME_1,"ME");
         LANGUAGE_EN.AddText(ID_AUTO_FRIEND_1,"FRIEND");
         LANGUAGE_EN.AddText(ID_ARMY_5_NUMBER,"5");
         LANGUAGE_EN.AddText(ID_CLEAR_CRAFT,"CLEAR");
         LANGUAGE_EN.AddText(ID_SURVIVAL_MODE,"SURVIVAL MODE");
         LANGUAGE_EN.AddText(ID_TEXT_BACK_ROW,"BACK\nROW");
         LANGUAGE_EN.AddText(ID_TEXT_FRONT_ROW,"FRONT\nROW");
         LANGUAGE_EN.AddText(ID_CHOOSE_YOUR_ALLY,"CHOOSE YOUR ALLY");
         LANGUAGE_EN.AddText(ID_TOURNAMENT,"TOURNAMENT");
         LANGUAGE_EN.AddText(ID_CHANGE_FIGHTS,"NEW BATTLES");
         LANGUAGE_EN.AddText(ID_CRAFTING,"CRAFTING");
         LANGUAGE_EN.AddText(ID_CONSUME,"CONSUME");
         LANGUAGE_EN.AddText(ID_CRAFT_ITEM,"CRAFT\nITEM");
         LANGUAGE_EN.AddText(ID_CANT_CONSUME_MORE,"Could not consume this item, It\'s being used in an army.");
         LANGUAGE_EN.AddText(ID_CRAFT_BOOSTER_REWARD,"Crafting");
         LANGUAGE_EN.AddText(ID_MYTHIC_BOOSTER_REWARD,"- MYTHS -");
         LANGUAGE_EN.AddText(ID_ARE_YOU_SURE_YOU_WANT_TO_CRAFT,"Crafting uses up all of your consumed items, are you sure you wish to do this?");
         LANGUAGE_FR.AddText(ID_AUTO_END_ACT_3_TXT,"Un silence complet engouffre les lieux, pas même un soupir se fait entendre, vous fixez tous les corps impies flétrir en une masse putride.\n\nLe cauchemar se termine enfin.\n\nVous vous retournez brusquement en criant pour alerter vos hommes, vous rappelant soudainement l\'appel du démon pour ses guérriers, mais pas un seul d\'eux à l\'horizon, comme s\'ils avaient simplement cessés d\'exister dans ce monde.\n\nAlors que les dernier figments des restants Démoniaque se désintègrent, le soleil se lève à nouveau et vous pouvez discerner des chants d\'oiseaux au loins briser le silence.\n\nLe Royaume et ses habitants sont de nouveau en paix, grâce à vous.");
         LANGUAGE_FR.AddText(ID_AUTO_CHAPTER_3_COMPLETED,"CHAPITRE 1 TERMINÉ!");
         LANGUAGE_FR.AddText(ID_ALL_RARITY_TEXT,"TOUT");
         LANGUAGE_FR.AddText(ID_SQUAD_SPEED_HOLD,"GARDE");
         LANGUAGE_FR.AddText(ID_SQUAD_SPEED_SLOW,"LENT");
         LANGUAGE_FR.AddText(ID_SQUAD_SPEED_FAST,"RAPIDE");
         LANGUAGE_FR.AddText(ID_COMMUN_TEXT,"COMMUN");
         LANGUAGE_FR.AddText(ID_UNCOMMUN_TEXT,"SUPÉRIEUR");
         LANGUAGE_FR.AddText(ID_RARE_TEXT,"RARE");
         LANGUAGE_FR.AddText(ID_LEGENDARY_TEXT,"LÉGENDAIRE");
         LANGUAGE_FR.AddText(ID_NOT_CONNECTED_GAMERSAFE,"Tu n’es pas connecté à GamerSafe.\nTu dois l\'être pour ajouter un ami à ta liste !");
         LANGUAGE_FR.AddText(ID_ALREADY_YOUR_FRIEND,"Cette personne est déjà ton ami !");
         LANGUAGE_FR.AddText(ID_IS_NOW_YOUR_FRIEND," a été ajouté à ta liste d’amis !");
         LANGUAGE_FR.AddText(ID_FRIEND_WASNT_FOUND,"Impossible de trouver cette personne.\nEs-tu certain de bien avoir entré son nom?");
         LANGUAGE_FR.AddText(ID_CANT_ADD_YOURSELF,"Tu ne peux t\'ajouter toi-même comme ami.");
         LANGUAGE_FR.AddText(ID_GAIN_A_RANK,"Tu gagnes un rang !");
         LANGUAGE_FR.AddText(ID_NO_RANK_CHANGE,"Pas de changement.");
         LANGUAGE_FR.AddText(ID_LOSE_A_RANK,"Tu perds un rang.");
         LANGUAGE_FR.AddText(ID_ALONE_IN_RANKING,"Impossible de te trouver un match en ce moment. Essais plus tard!.");
         LANGUAGE_FR.AddText(ID_MSG,"Français");
         LANGUAGE_FR.AddText(ID_CASH,"Argent : ");
         LANGUAGE_FR.AddText(ID_RANKING_SERF,"Serf");
         LANGUAGE_FR.AddText(ID_RANKING_PEASANT,"Peasant");
         LANGUAGE_FR.AddText(ID_RANKING_CONSCRIPT,"Conscript");
         LANGUAGE_FR.AddText(ID_RANKING_SQUIRE,"Squire");
         LANGUAGE_FR.AddText(ID_RANKING_MEN_AT_ARMS,"Men At Arms");
         LANGUAGE_FR.AddText(ID_RANKING_SOLDIER,"Soldier");
         LANGUAGE_FR.AddText(ID_RANKING_MERCENARY,"Mercenary");
         LANGUAGE_FR.AddText(ID_RANKING_ELITE_SOLDIER,"Elite Soldier");
         LANGUAGE_FR.AddText(ID_RANKING_CAPTAIN,"Captain");
         LANGUAGE_FR.AddText(ID_RANKING_KNIGHT,"Knight");
         LANGUAGE_FR.AddText(ID_RANKING_BARON,"Baron");
         LANGUAGE_FR.AddText(ID_RANKING_DUKE,"Duke");
         LANGUAGE_FR.AddText(ID_RANKING_LORD,"Lord");
         LANGUAGE_FR.AddText(ID_RANKING_CHAMPION,"Champion");
         LANGUAGE_FR.AddText(ID_RANKING_COMMANDER,"Commander");
         LANGUAGE_FR.AddText(ID_RANKING_GENERAL,"General");
         LANGUAGE_FR.AddText(ID_RANKING_BATTLE_MASTER,"Battle Master");
         LANGUAGE_FR.AddText(ID_RANKING_HERO,"Hero");
         LANGUAGE_FR.AddText(ID_RANKING_ARCH_DUKE,"Arch Duke");
         LANGUAGE_FR.AddText(ID_RANKING_CHANCELLOR,"Chancellor");
         LANGUAGE_FR.AddText(ID_RANKING_WARLORD,"Walord");
         LANGUAGE_FR.AddText(ID_RANKING_KING,"King");
         LANGUAGE_FR.AddText(ID_RANKING_OVERLORD,"Overlord");
         LANGUAGE_FR.AddText(ID_RANKING_EMPEROR,"Emperor");
         LANGUAGE_FR.AddText(ID_CREATURE_HUMAN_NAME,"Humain");
         LANGUAGE_FR.AddText(ID_CREATURE_HUMAN_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_IMMORTAL_NAME,"Immortel");
         LANGUAGE_FR.AddText(ID_CREATURE_IMMORTAL_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_ORC_NAME,"Orc");
         LANGUAGE_FR.AddText(ID_CREATURE_ORC_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_IMP_NAME,"Diablotin");
         LANGUAGE_FR.AddText(ID_CREATURE_IMP_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_BALISTA_NAME,"Baliste");
         LANGUAGE_FR.AddText(ID_CREATURE_BALISTA_DESC,"*Verrouille tout.\n*Recharge : 13s.\n*Utilise 3 Cases.\n*DMG ÉTENDU sur 3 Cases.");
         LANGUAGE_FR.AddText(ID_CREATURE_CATAPULT_NAME,"Catapulte");
         LANGUAGE_FR.AddText(ID_CREATURE_CATAPULT_DESC,"*Verrouille tout.\n*Recharge : 12s.\n*Utilise 6 Cases.\n*DMG ÉTENDU sur 6 Cases.");
         LANGUAGE_FR.AddText(ID_CREATURE_CANNON_NAME,"Canon");
         LANGUAGE_FR.AddText(ID_CREATURE_CANNON_DESC,"*Verrouille tout.\n*Recharge : 18s.\n*Utilise 6 Cases.\n*DMG ÉTENDU sur 6 Cases.");
         LANGUAGE_FR.AddText(ID_CREATURE_UNDEAD_NAME,"Mort-Vivant");
         LANGUAGE_FR.AddText(ID_CREATURE_UNDEAD_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_INSECTOID_NAME,"Insectoide");
         LANGUAGE_FR.AddText(ID_CREATURE_INSECTOID_DESC,"*Débute en larve pour 20s.");
         LANGUAGE_FR.AddText(ID_CREATURE_VERMINE_NAME,"Vermine");
         LANGUAGE_FR.AddText(ID_CREATURE_VERMINE_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_REPTILIAN_NAME,"Reptilien");
         LANGUAGE_FR.AddText(ID_CREATURE_REPTILIAN_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_LYCANTROP_NAME,"Lycanthrope");
         LANGUAGE_FR.AddText(ID_CREATURE_LYCANTROP_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_GOLEM_NAME,"Golem");
         LANGUAGE_FR.AddText(ID_CREATURE_GOLEM_DESC,"*Meurt après 20s.");
         LANGUAGE_FR.AddText(ID_CREATURE_FISHMAN_NAME,"Homme Poisson");
         LANGUAGE_FR.AddText(ID_CREATURE_FISHMAN_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_UNDEADCATAPULT_NAME,"Vile Catapulte");
         LANGUAGE_FR.AddText(ID_CREATURE_UNDEADCATAPULT_DESC,"*Verrouille tout.\n*Recharge : 12s.\n*Utilise 6 Cases.\nDMG ÉTENDU sur 6 Cases.");
         LANGUAGE_FR.AddText(ID_CREATURE_STEAMCHARIOT_NAME,"Chariot à Vapeur");
         LANGUAGE_FR.AddText(ID_CREATURE_STEAMCHARIOT_DESC,"*Verrouille tout.\n*Utilise 6 Cases.\nDMG ÉTENDU sur les 2 Cases devant.");
         LANGUAGE_FR.AddText(ID_CREATURE_PLAGUECANON_NAME,"Horrible Canon");
         LANGUAGE_FR.AddText(ID_CREATURE_PLAGUECANON_DESC,"*Verrouille tout.\n*Recharge : 15s.\n*Utilise 6 Cases.\nDMG ÉTENDU sur 6 Cases.");
         LANGUAGE_FR.AddText(ID_CREATURE_GIANTFLAMER_NAME,"Grand lance-flamme");
         LANGUAGE_FR.AddText(ID_CREATURE_GIANTFLAMER_DESC,"*Verrouille tout.\n*Recharge : 5s.\n*Utilise 3 Cases.\nDMG ÉTENDU sur les 6 Cases devant.");
         LANGUAGE_FR.AddText(ID_CREATURE_FIREELEMENTAL_NAME,"Élémental de feu");
         LANGUAGE_FR.AddText(ID_CREATURE_FIREELEMENTAL_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_WATERELEMENTAL_NAME,"Élémental d’eau");
         LANGUAGE_FR.AddText(ID_CREATURE_WATERELEMENTAL_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_POISONELEMENTAL_NAME,"Élémental de Poison");
         LANGUAGE_FR.AddText(ID_CREATURE_POISONELEMENTAL_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_THUNDERELEMENTAL_NAME,"Élémental de Tonnerre");
         LANGUAGE_FR.AddText(ID_CREATURE_THUNDERELEMENTAL_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_OCTOPOD_NAME,"Octopode");
         LANGUAGE_FR.AddText(ID_CREATURE_OCTOPOD_DESC,"*Accélère la vitesse d\'incantation des sorts de 5s. (max vitesse: 2s) ");
         LANGUAGE_FR.AddText(ID_CREATURE_DEMON_NAME,"Démon");
         LANGUAGE_FR.AddText(ID_CREATURE_DEMON_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_ANGEL_NAME,"Ange");
         LANGUAGE_FR.AddText(ID_CREATURE_ANGEL_DESC,"");
         LANGUAGE_FR.AddText(ID_CREATURE_STEAM_BEHEMOT_NAME,"Monstruosité à Vapeur");
         LANGUAGE_FR.AddText(ID_CREATURE_STEAM_BEHEMOT_DESC,"*Verrouille tout.\n*Utilise 9 Cases.\n*DMG ÉTENDU sur les 3 Cases devant.");
         LANGUAGE_FR.AddText(ID_CREATURE_FAMINE_NAME,"La Famine");
         LANGUAGE_FR.AddText(ID_CREATURE_FAMINE_DESC,"*Aura : Toute les unités dans votre armée ont -10 DEF.");
         LANGUAGE_FR.AddText(ID_CREATURE_WAR_NAME,"La Guerre");
         LANGUAGE_FR.AddText(ID_CREATURE_WAR_DESC,"*Aura : Toute les unités ennemies gagnent +3 ATK Tranchante et + 3 ATK Perçante");
         LANGUAGE_FR.AddText(ID_CREATURE_CONQUEST_NAME,"La Conquête");
         LANGUAGE_FR.AddText(ID_CREATURE_CONQUEST_DESC,"*Aura : Toute les unités ennemies gagnent +5 DEF");
         LANGUAGE_FR.AddText(ID_CREATURE_DEATH_NAME,"La Mort");
         LANGUAGE_FR.AddText(ID_CREATURE_DEATH_DESC,"*Aura : Toute les unités dans votre armée perdent 3 DEF chaque 10s.");
         LANGUAGE_FR.AddText(ID_WEAPON_IRONSWORD_NAME,"Épée de Fer");
         LANGUAGE_FR.AddText(ID_WEAPON_IRONSWORD_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_SPEAR_NAME,"Lance");
         LANGUAGE_FR.AddText(ID_WEAPON_SPEAR_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_WEAPON_MACE_NAME,"Massue");
         LANGUAGE_FR.AddText(ID_WEAPON_MACE_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_AXE_NAME,"Hache");
         LANGUAGE_FR.AddText(ID_WEAPON_AXE_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_2HSWORD_NAME,"Épée à deux Mains");
         LANGUAGE_FR.AddText(ID_WEAPON_2HSWORD_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_WEAPON_2HAXE_NAME,"Hache à deux Mains");
         LANGUAGE_FR.AddText(ID_WEAPON_2HAXE_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_WEAPON_2HMACE_NAME,"Massue à deux Mains");
         LANGUAGE_FR.AddText(ID_WEAPON_2HMACE_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_WEAPON_PISTOL_NAME,"Pistolet");
         LANGUAGE_FR.AddText(ID_WEAPON_PISTOL_DESC,"*Recharge : 8s.");
         LANGUAGE_FR.AddText(ID_WEAPON_MUSKET_NAME,"Mousquet");
         LANGUAGE_FR.AddText(ID_WEAPON_MUSKET_DESC,"*Utilise les deux mains.\n*Recharge : 8s.");
         LANGUAGE_FR.AddText(ID_WEAPON_HALBERD_NAME,"Hallebarde");
         LANGUAGE_FR.AddText(ID_WEAPON_HALBERD_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_WEAPON_TORCH_NAME,"Torche");
         LANGUAGE_FR.AddText(ID_WEAPON_TORCH_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_DAGGER_NAME,"Dague");
         LANGUAGE_FR.AddText(ID_WEAPON_DAGGER_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_PIKE_NAME,"Pic");
         LANGUAGE_FR.AddText(ID_WEAPON_PIKE_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_WEAPON_WARHAMMER_NAME,"Marteau de Guerre");
         LANGUAGE_FR.AddText(ID_WEAPON_WARHAMMER_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_2HWARHAMMER_NAME,"Marteau de Guerre à Deux Mains");
         LANGUAGE_FR.AddText(ID_WEAPON_2HWARHAMMER_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_WEAPON_FIRESTAFF_NAME,"Bâton de Feu");
         LANGUAGE_FR.AddText(ID_WEAPON_FIRESTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 10s.\n *Sort : Inflige 10 DMG de Feu à une unité ennemie.");
         LANGUAGE_FR.AddText(ID_WEAPON_ICESTAFF_NAME,"Bâton de Glace");
         LANGUAGE_FR.AddText(ID_WEAPON_ICESTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 10s.\n*Sort : Inflige 10 DMG de Glace à une unité ennemie.");
         LANGUAGE_FR.AddText(ID_WEAPON_POISONSTAFF_NAME,"Bâton de Poison");
         LANGUAGE_FR.AddText(ID_WEAPON_POISONSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 10s.\n*Sort : Inflige 10 DMG de Poison à une unité ennemie.");
         LANGUAGE_FR.AddText(ID_WEAPON_THUNDERSTAFF_NAME,"Bâton de Tonnerre");
         LANGUAGE_FR.AddText(ID_WEAPON_THUNDERSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 10s.\n*Sort : Inflige 10 DMG Électrique à une unité ennemie.");
         LANGUAGE_FR.AddText(ID_WEAPON_DARKSTAFF_NAME,"Bâton des Ténèbres");
         LANGUAGE_FR.AddText(ID_WEAPON_DARKSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 10s.\n*Sort : Inflige 10 DMG de Ténèbre à une unité ennemie.");
         LANGUAGE_FR.AddText(ID_WEAPON_HOLYSTAFF_NAME,"Bâton Sacré");
         LANGUAGE_FR.AddText(ID_WEAPON_HOLYSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 10s.\n*Sort : Inflige 10 DMG Saint à une unité ennemie.");
         LANGUAGE_FR.AddText(ID_WEAPON_LONGBOW_NAME,"Arc Long");
         LANGUAGE_FR.AddText(ID_WEAPON_LONGBOW_DESC,"*Utilise les deux mains.\n*Recharge : 6s.");
         LANGUAGE_FR.AddText(ID_WEAPON_COMPOSITEBOW_NAME,"Arc Composite");
         LANGUAGE_FR.AddText(ID_WEAPON_COMPOSITEBOW_DESC,"*Utilise les deux mains.\n*Recharge : 6s.");
         LANGUAGE_FR.AddText(ID_WEAPON_SHORTBOW_NAME,"Arc Court");
         LANGUAGE_FR.AddText(ID_WEAPON_SHORTBOW_DESC,"*Utilise les deux mains.\n*Recharge : 4s.");
         LANGUAGE_FR.AddText(ID_WEAPON_SWORDSMANFLAG_NAME,"Drapeau de l’Épéiste");
         LANGUAGE_FR.AddText(ID_WEAPON_SWORDSMANFLAG_DESC,"*Utilise les deux mains.\n*Aura : Toute les unités dans cette troupe gagnent +1 ATK Tranchante.");
         LANGUAGE_FR.AddText(ID_WEAPON_BARBARIANFLAG_NAME,"Drapeau de Barbarie");
         LANGUAGE_FR.AddText(ID_WEAPON_BARBARIANFLAG_DESC,"*Utilise les deux mains.\n*Aura : Toute les unités dans cette troupe gagnent +1 ATK Contondante.");
         LANGUAGE_FR.AddText(ID_WEAPON_PIKEMANFLAG_NAME,"Drapeau du Piquier");
         LANGUAGE_FR.AddText(ID_WEAPON_PIKEMANFLAG_DESC,"*Utilise les deux mains.\n*Aura : Toute les unités dans cette troupe gagnent +1 ATK Perçante.");
         LANGUAGE_FR.AddText(ID_WEAPON_SAPPERFLAG_NAME,"Drapeau Explosif");
         LANGUAGE_FR.AddText(ID_WEAPON_SAPPERFLAG_DESC,"*Utilise les deux mains.\n*Aura : Toute les unités dans cette troupe gagnent +1 ATK d\'Explosion.");
         LANGUAGE_FR.AddText(ID_WEAPON_FLAMEFLAG_NAME,"Drapeau de Feu");
         LANGUAGE_FR.AddText(ID_WEAPON_FLAMEFLAG_DESC,"*Utilise les deux mains.\n*Aura : Toute les unités dans cette troupe gagnent +1 ATK de Feu.");
         LANGUAGE_FR.AddText(ID_WEAPON_FROSTFLAG_NAME,"Drapeau du Froid");
         LANGUAGE_FR.AddText(ID_WEAPON_FROSTFLAG_DESC,"*Utilise les deux mains.\n*Aura : Toute les unités dans cette troupe gagnent +1 ATK de Glace.");
         LANGUAGE_FR.AddText(ID_WEAPON_VIPERFLAG_NAME,"Drapeau de la Vipère");
         LANGUAGE_FR.AddText(ID_WEAPON_VIPERFLAG_DESC,"*Utilise les deux mains.\n*Aura : Toute les unités dans cette troupe gagnent +1 ATK de Poison.");
         LANGUAGE_FR.AddText(ID_WEAPON_BOLTFLAG_NAME,"Drapeau D’Éclair");
         LANGUAGE_FR.AddText(ID_WEAPON_BOLTFLAG_DESC,"*Utilise les deux mains.\n*Aura : Toute les unités dans cette troupe gagnent +1 ATK Électrique.");
         LANGUAGE_FR.AddText(ID_WEAPON_CULTFLAG_NAME,"Drapeau Cultiste");
         LANGUAGE_FR.AddText(ID_WEAPON_CULTFLAG_DESC,"*Utilise les deux mains.\n*Aura : Toute les unités dans cette troupe gagnent +1 ATK de Ténèbre.");
         LANGUAGE_FR.AddText(ID_WEAPON_CLERICFLAG_NAME,"Drapeau Saint");
         LANGUAGE_FR.AddText(ID_WEAPON_CLERICFLAG_DESC,"*Utilise les deux mains.\n*Aura : Toute les unités dans cette troupe gagnent +1 ATK Sainte.");
         LANGUAGE_FR.AddText(ID_WEAPON_TOWERFLAG_NAME,"Drapeau de Fortification");
         LANGUAGE_FR.AddText(ID_WEAPON_TOWERFLAG_DESC,"*Utilise les deux mains.\n*Aura : Toute les unités dans cette troupe gagnent +2 DEF.");
         LANGUAGE_FR.AddText(ID_WEAPON_FIRESWORD_NAME,"Épée de Feu");
         LANGUAGE_FR.AddText(ID_WEAPON_FIRESOWRD_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_ICEPIKE_NAME,"Pic de Glace");
         LANGUAGE_FR.AddText(ID_WEAPON_ICEPIKE_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_WEAPON_BOOMSTICK_NAME,"Carabine");
         LANGUAGE_FR.AddText(ID_WEAPON_BOOMSTICK_DESC,"*Utilise les deux mains.\n*Recharge : 8s.");
         LANGUAGE_FR.AddText(ID_WEAPON_SHRAPNELMUSKET_NAME,"Vil Mousquet");
         LANGUAGE_FR.AddText(ID_WEAPON_SHRAPNELMUSKET_DESC,"*Utilise les deux mains.\n*Recharge : 8s.");
         LANGUAGE_FR.AddText(ID_WEAPON_REPTILIANDAGGER_NAME,"Dague Reptilienne");
         LANGUAGE_FR.AddText(ID_WEAPON_REPTILIANDAGGER_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_ORCISHHAMMER_NAME,"Marteau Orc");
         LANGUAGE_FR.AddText(ID_WEAPON_ORCISHHAMMER_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_WEAPON_LIGHTNINGBOW_NAME,"Arc Éclair");
         LANGUAGE_FR.AddText(ID_WEAPON_LIGHTNINGBOW_DESC,"*Utilise les deux mains.\n*Recharge : 8s.");
         LANGUAGE_FR.AddText(ID_WEAPON_FIREBOW_NAME,"Arc de Feu");
         LANGUAGE_FR.AddText(ID_WEAPON_FIREBOW_DESC,"*Utilise les deux mains.\n*Recharge : 6s.");
         LANGUAGE_FR.AddText(ID_WEAPON_POISONBOW_NAME,"Arc de Poison");
         LANGUAGE_FR.AddText(ID_WEAPON_POISONBOW_DESC,"*Utilise les deux mains.\n*Recharge : 6s.");
         LANGUAGE_FR.AddText(ID_WEAPON_POWERAXE_NAME,"Hache Puissante");
         LANGUAGE_FR.AddText(ID_WEAPON_POWERAXE_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_CRUSADERMACE_NAME,"Massue de Croisades");
         LANGUAGE_FR.AddText(ID_WEAPON_CRUSADERMACE_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_BLACKSWORD_NAME,"Épée Sombre");
         LANGUAGE_FR.AddText(ID_WEAPON_BLACKSWORD_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_COBRASPEAR_NAME,"Lance du Cobra");
         LANGUAGE_FR.AddText(ID_WEAPON_COBRASPEAR_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_WEAPON_FIREBLASTSTAFF_NAME,"Bâton de Brasier");
         LANGUAGE_FR.AddText(ID_WEAPON_FIREBLASTSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 25s.\n*Sort : Inflige 8 DMG de Feu à la première rangée d’unités ennemies.");
         LANGUAGE_FR.AddText(ID_WEAPON_BLAZINGSTAFF_NAME,"Bâton Incandescent");
         LANGUAGE_FR.AddText(ID_WEAPON_BLAZINGSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 30s.\n*Sort : Inflige 10 DMG de Feu à toute les unités dans la mêlée.");
         LANGUAGE_FR.AddText(ID_WEAPON_ICESTORMSTAFF_NAME,"Bâton Hivernal");
         LANGUAGE_FR.AddText(ID_WEAPON_ICESTORMSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 25s.\n*Sort : Inflige 8 DMG de Glace à la première rangée d’unités ennemies.");
         LANGUAGE_FR.AddText(ID_WEAPON_FROSTBITESTAFF_NAME,"Bâton Arctique");
         LANGUAGE_FR.AddText(ID_WEAPON_FROSTBITESTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 30s.\n*Sort : Inflige 10 DMG de Glace à toute les unités dans la mêlée.");
         LANGUAGE_FR.AddText(ID_WEAPON_ACIDRAINSTAFF_NAME,"Bâton de Pluies Acides");
         LANGUAGE_FR.AddText(ID_WEAPON_ACIDRAINSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 25s.\n*Sort : Inflige 8 DMG de Poison à la première rangée d’unités ennemies.");
         LANGUAGE_FR.AddText(ID_WEAPON_PLAGUESTAFF_NAME,"Bâton de Pestilence");
         LANGUAGE_FR.AddText(ID_WEAPON_PLAGUESTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 30s.\n*Sort : Inflige 10 DMG de Poison à toute les unités dans la mêlée.");
         LANGUAGE_FR.AddText(ID_WEAPON_LIGHTNINGSTAFF_NAME,"Bâton Éclair");
         LANGUAGE_FR.AddText(ID_WEAPON_LIGHTNINGSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 25s.\n*Sort : Inflige 8 DMG Électrique à la première rangée d’unités ennemies.");
         LANGUAGE_FR.AddText(ID_WEAPON_THUNDERSTORMSTAFF_NAME,"Bâton de Tonnerre");
         LANGUAGE_FR.AddText(ID_WEAPON_THUNDERSTORMSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 30s.\n*Sort : Inflige 10 DMG Électrique à toute les unités dans la mêlée.");
         LANGUAGE_FR.AddText(ID_WEAPON_ANGELICSTAFF_NAME,"Bâton Angélique");
         LANGUAGE_FR.AddText(ID_WEAPON_ANGELICSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 30s.\n*Sort : Toute les unités dans cette troupe récupère +10 DEF.\n*Sort : Inflige 10 DMG Saint à une unité ennemie.");
         LANGUAGE_FR.AddText(ID_WEAPON_DEMONICSTAFF_NAME,"Bâton Démoniaque");
         LANGUAGE_FR.AddText(ID_WEAPON_DEMONICSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 30s.\n*Sort : Toute les unités dans cette troupe gagnent +10 ATK de Ténèbre.\n*Sort : Inflige 10 DMG de Ténèbre à une unité ennemie.");
         LANGUAGE_FR.AddText(ID_WEAPON_PYROBLADE_NAME,"Lame Pyromancienne");
         LANGUAGE_FR.AddText(ID_WEAPON_PYROBLADE_DESC,"*Effet Déclenché au 2 ATK : Inflige 3 DMG de Feu sur sa cible et les 2 cases derrière elle.");
         LANGUAGE_FR.AddText(ID_WEAPON_BOLTHAMMER_NAME,"Marteau Éclair");
         LANGUAGE_FR.AddText(ID_WEAPON_BOLTHAMMER_DESC,"*Effet Déclenché au 2 ATK : Inflige 2 DMG Électrique sur sa cible et les 2 cases derrière elle.");
         LANGUAGE_FR.AddText(ID_WEAPON_NECRONBLADE_NAME,"Lame Nécromancienne");
         LANGUAGE_FR.AddText(ID_WEAPON_NECRONBLADE_DESC,"*Effet Déclenché sur un Coup Mortel : Réanime un guérrier Mort-Vivant à vos côtés.");
         LANGUAGE_FR.AddText(ID_WEAPON_PLAGUESPIKE_NAME,"Pic Putride");
         LANGUAGE_FR.AddText(ID_WEAPON_PLAGUESPIKE_DESC,"*Effet Déclenché au 2 ATK : Inflige 2 DMG de Poison sur sa cible et les 2 cases derrière elle.");
         LANGUAGE_FR.AddText(ID_WEAPON_FROSTAXE_NAME,"Hache Givrée");
         LANGUAGE_FR.AddText(ID_WEAPON_FROSTAXE_DESC,"*Effet Déclenché au 2 ATK : Inflige 2 DMG de Glace sur sa cible et les 2 cases derrière elle.");
         LANGUAGE_FR.AddText(ID_WEAPON_SAINTBLADE_NAME,"Lame des Saints");
         LANGUAGE_FR.AddText(ID_WEAPON_SAINTBLADE_DESC,"*Effet Déclenché sur un Coup Mortel : Toute les unités dans cette troupe gagnent +1 DEF.");
         LANGUAGE_FR.AddText(ID_WEAPON_BLASTHAMMER_NAME,"Marteau Explosif");
         LANGUAGE_FR.AddText(ID_WEAPON_BLASTHAMMER_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_WEAPON_WARBOW_NAME,"Arc de Guerre");
         LANGUAGE_FR.AddText(ID_WEAPON_WARBOW_DESC,"*Utilise les deux mains.\n*Recharge : 6s.");
         LANGUAGE_FR.AddText(ID_WEAPON_COMPOSITESWORD_NAME,"Épée de Composite");
         LANGUAGE_FR.AddText(ID_WEAPON_COMPOSITESWORD_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_POWERHAMMER_NAME,"Marteau de Force");
         LANGUAGE_FR.AddText(ID_WEAPON_POWERHAMMER_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_SOLARSTAFF_NAME,"Bâton Solaire");
         LANGUAGE_FR.AddText(ID_WEAPON_SOLARSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 50s.\n*Sort : Inflige 18 DMG de Feu à TOUTE les unités sur le champ de bataille.");
         LANGUAGE_FR.AddText(ID_WEAPON_ARMAGEDONSTAFF_NAME,"Bâton de l\'Harmaguédon");
         LANGUAGE_FR.AddText(ID_WEAPON_ARMAGEDONSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 70s.\n*Sort : Inflige 15 DMG d\'Explosion à toute les unités ennemies.");
         LANGUAGE_FR.AddText(ID_WEAPON_OKKORAZSTAFF_NAME,"Le Bâton d\'Ok Koraz");
         LANGUAGE_FR.AddText(ID_WEAPON_OKKORAZSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 20s.\n*Sort : Inflige 15 DMG Électrique à TOUTE les unités devant.");
         LANGUAGE_FR.AddText(ID_WEAPON_ORYTHSTAFF_NAME,"Écharde d\'Oryth");
         LANGUAGE_FR.AddText(ID_WEAPON_ORYTHSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 35s.\n*Sort : Transforme cette unité en Guérrier Démon.");
         LANGUAGE_FR.AddText(ID_WEAPON_ANGELSTAFF_NAME,"Bâton des Anges");
         LANGUAGE_FR.AddText(ID_WEAPON_ANGELSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 40s.\n*Sort : Fully recover DEF of every units in play.");
         LANGUAGE_FR.AddText(ID_WEAPON_VASSPOTANAXSTAFF_NAME,"Le Bâton de Vass Potanax");
         LANGUAGE_FR.AddText(ID_WEAPON_VASSPOTANAXSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 40s.\n*Sort : Inflige 10 DMG de Poison à TOUTE les unités sur le champ de bataille.");
         LANGUAGE_FR.AddText(ID_WEAPON_ULTIMASTAFF_NAME,"Bâton Ultime");
         LANGUAGE_FR.AddText(ID_WEAPON_ULTIMASTAFF_DESC,"*Utilise les deux mains.\n*Aura : Accélère la vitesse d\'incantation des sorts de TOUTE les unités sur le champ de bataille de 10s. (max vitesse: 2s)\n*Temps D’Incantation : 35s.\n*Sort : Inflige 10 DMG Électrique à une unité ennemie.");
         LANGUAGE_FR.AddText(ID_WEAPON_MAGICSWORD_NAME,"Épée Magique");
         LANGUAGE_FR.AddText(ID_WEAPON_MAGICSWORD_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_QUAEKDAGGER_NAME,"Dague de Quaek");
         LANGUAGE_FR.AddText(ID_WEAPON_QUAEKDAGGER_DESC," Effet Déclenché chq ATK: 2 DMG de Poison toute les 4s sur l\'ennemi.");
         LANGUAGE_FR.AddText(ID_WEAPON_YASURSTAFF_NAME,"Le Bâton de Yasur");
         LANGUAGE_FR.AddText(ID_WEAPON_YASURSTAFF_DESC,"*Utilise les deux mains.\n*Temps D’Incantation : 30s.\n*Sort : Réanime un guérrier Mort-Vivant à vos côtés.\n*Sort : Inflige 5 DMG Ténèbre à une unité ennemie.");
         LANGUAGE_FR.AddText(ID_WEAPON_XONAXSTAFF_NAME,"La Branche de Xonax");
         LANGUAGE_FR.AddText(ID_WEAPON_XONAXSTAFF_DESC,"*Utilise les deux mains\n*Temps D’Incantation : 25s.\n*Sort : Inflige 1 DMG de Poison à toute les unités sur le champ de bataille.\n*Aura : Toute les unités Vermine sur le champ de bataille gagnent +2 ATK de Poison.");
         LANGUAGE_FR.AddText(ID_WEAPON_ZAMAROTHSWORD_NAME,"L\'Épée de Zamaroth ");
         LANGUAGE_FR.AddText(ID_WEAPON_ZAMAROTHSWORD_DESC,"*Temps D’Incantation : 20s.\n*Sort : Tout les unités Démon sur le champ de bataille gagnent +2 ATK de Ténèbre.\n*Sort : Inflige 2 DMG de Ténèbre à toute les unités non-Démon.");
         LANGUAGE_FR.AddText(ID_WEAPON_IMRAILHMACE_NAME,"La Massue d\'Imra\'ilh");
         LANGUAGE_FR.AddText(ID_WEAPON_IMRAILHMACE_DESC,"*Temps D’Incantation : 25s.\n*Sort : Toute les unités dans votre armée gagnent +1 DEF.");
         LANGUAGE_FR.AddText(ID_WEAPON_QUATIAZSWORD_NAME,"L\'Épée de Quatiaz");
         LANGUAGE_FR.AddText(ID_WEAPON_QUATIAZSWORD_DESC,"*Aura : Tout les Humains dans votre armée gagnent +2 ATK Sainte");
         LANGUAGE_FR.AddText(ID_WEAPON_RHIGARBOW_NAME,"L\'Arc de Rhigar ");
         LANGUAGE_FR.AddText(ID_WEAPON_RHIGARBOW_DESC,"*Utilise les deux mains.\n*Recharge : 2s.");
         LANGUAGE_FR.AddText(ID_WEAPON_AZARATIUSAXE_NAME,"La Hache d\'Azaratius");
         LANGUAGE_FR.AddText(ID_WEAPON_AZARATIUSAXE_DESC,"*Temps D’Incantation : 20s.\n*Sort : Inflige 1 DMG de Feu à toute les unités sur le champ de bataille.");
         LANGUAGE_FR.AddText(ID_WEAPON_METABLADE_NAME,"Lame Meta");
         LANGUAGE_FR.AddText(ID_WEAPON_METABLADE_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_WEAPON_GORDAKARHAMMER_NAME,"Le Marteau de Gordakar");
         LANGUAGE_FR.AddText(ID_WEAPON_GORDAKARHAMMER_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_SHIELD_WOODENSHIELD_NAME,"Bouclier de Bois");
         LANGUAGE_FR.AddText(ID_SHIELD_WOODENSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_ROUNDSHIELD_NAME,"Bouclier Rond");
         LANGUAGE_FR.AddText(ID_SHIELD_ROUNDSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_IRONSHIELD_NAME,"Bouclier de Fer");
         LANGUAGE_FR.AddText(ID_SHIELD_IRONSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_BUKLER_NAME,"Petit Bouclier");
         LANGUAGE_FR.AddText(ID_SHIELD_BUKLER_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_STEELSHIELD_NAME,"Bouclier d\'Acier");
         LANGUAGE_FR.AddText(ID_SHIELD_STEELSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_TOWERSHIELD_NAME," Pavois");
         LANGUAGE_FR.AddText(ID_SHIELD_TOWERSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_SPIKEDBUKLER_NAME,"Petit Bouclier à Pic");
         LANGUAGE_FR.AddText(ID_SHIELD_SPIKEDBUKLER_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_SPIKEDSHIELD_NAME," Bouclier à Pic ");
         LANGUAGE_FR.AddText(ID_SHIELD_SPIKEDSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_ROTTENSHIELD_NAME,"Bouclier Putride");
         LANGUAGE_FR.AddText(ID_SHIELD_ROTTENSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_PARRYINGDAGGER_NAME,"Main-Gauche");
         LANGUAGE_FR.AddText(ID_SHIELD_PARRYINGDAGGER_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_CRYSTALORB_NAME,"Orbe de Cristal");
         LANGUAGE_FR.AddText(ID_SHIELD_CRYSTALORB_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_SAPPERSHIELD_NAME,"Bouclier de Sapeur");
         LANGUAGE_FR.AddText(ID_SHIELD_SAPPERSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_CURSEDSHIELD_NAME,"Bouclier Maudit");
         LANGUAGE_FR.AddText(ID_SHIELD_CURSEDSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_KITESHIELD_NAME,"Bouclier Triangulaire");
         LANGUAGE_FR.AddText(ID_SHIELD_KITESHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_SMALLKITESHIELD_NAME,"Petit Bouclier Triangulaire ");
         LANGUAGE_FR.AddText(ID_SHIELD_SMALLKITESHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_PRIESTSHIELD_NAME,"Bouclier de Clerc");
         LANGUAGE_FR.AddText(ID_SHIELD_PRIESTSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_CULTISTSHIELD_NAME,"Bouclier du Culte");
         LANGUAGE_FR.AddText(ID_SHIELD_CULTISTSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_NECROPOLSHIELD_NAME,"Bouclier de la Nécropole");
         LANGUAGE_FR.AddText(ID_SHIELD_NECROPOLSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_INQUISITORSHIELD_NAME,"Bouclier de L\'Inquisiteur");
         LANGUAGE_FR.AddText(ID_SHIELD_INQUISITORSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_DUELISTBUCKLET_NAME,"Petit Bouclier de Duel");
         LANGUAGE_FR.AddText(ID_SHIELD_DUELISTBUCKLET_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_HEROSHIELD_NAME,"Bouclier Héroique");
         LANGUAGE_FR.AddText(ID_SHIELD_HEROSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_ASSASSINSHIELD_NAME,"Bouclier d\'Assassin");
         LANGUAGE_FR.AddText(ID_SHIELD_ASSASSINSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_FIREPARRYINGBLADE_NAME,"Main-Gauche de Feu");
         LANGUAGE_FR.AddText(ID_SHIELD_FIREPARRYINGBLADE_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_ICEBUCKLER_NAME,"Petit Bouclier de Glace");
         LANGUAGE_FR.AddText(ID_SHIELD_ICEBUCKLER_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_PLAGUESHIELD_NAME,"Bouclier Pestilentiel");
         LANGUAGE_FR.AddText(ID_SHIELD_PLAGUESHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_EXPERIMENTALSHIELD_NAME,"Bouclier Expérimental");
         LANGUAGE_FR.AddText(ID_SHIELD_EXPERIMENTALSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_MAGNETICSHIELD_NAME,"Bouclier Magnétique");
         LANGUAGE_FR.AddText(ID_SHIELD_MAGNETICSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_BEASTSHIELD_NAME,"Bouclier Bestial");
         LANGUAGE_FR.AddText(ID_SHIELD_BEASTSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_MIRRORSHIELD_NAME,"Bouclier Réflechissant");
         LANGUAGE_FR.AddText(ID_SHIELD_MIRRORSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_CRAFTMENSHIELD_NAME,"Bouclier de l\'Artisant");
         LANGUAGE_FR.AddText(ID_SHIELD_CRAFTMENSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_PORCUPINESHIELD_NAME,"Bouclier Épineux");
         LANGUAGE_FR.AddText(ID_SHIELD_PORCUPINESHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_GLADIATORSHIELD_NAME,"Bouclier du Gladiateur");
         LANGUAGE_FR.AddText(ID_SHIELD_GLADIATORSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_STORMSHIELD_NAME,"Bouclier des Tempêtes");
         LANGUAGE_FR.AddText(ID_SHIELD_STORMSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_CERIPHYRBUCKLER_NAME,"Le Bouclier Ceriphyrien");
         LANGUAGE_FR.AddText(ID_SHIELD_CERIPHYRBUCKLER_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_BAXSHIELD_NAME,"Bouclier Baxien");
         LANGUAGE_FR.AddText(ID_SHIELD_BAXSHIELD_DESC,"*Aura : Toute les unités dans cette troupe gagnent +1 Résistance au Ténèbre.");
         LANGUAGE_FR.AddText(ID_SHIELD_COMPOSITESHIELDSHIELD_NAME,"Bouclier Composite");
         LANGUAGE_FR.AddText(ID_SHIELD_COMPOSITESHIELDSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_LIFESHIELDSHIELD_NAME,"Bouclier de Vitalité");
         LANGUAGE_FR.AddText(ID_SHIELD_LIFESHIELDSHIELD_DESC,"*Porteur récupère 1 DEF chaque 3s.");
         LANGUAGE_FR.AddText(ID_SHIELD_QUATIAZSHIELDSHIELD_NAME,"Le Bouclier de Quatiaz");
         LANGUAGE_FR.AddText(ID_SHIELD_QUATIAZSHIELDSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_NARMNSHIELDSHIELD_NAME,"Le Bouclier de Narmn");
         LANGUAGE_FR.AddText(ID_SHIELD_NARMNSHIELDSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_XONAXBUCKLER_NAME,"Le Bouclier de Xonax");
         LANGUAGE_FR.AddText(ID_SHIELD_XONAXBUCKLER_DESC,"*Aura : Toute les Vermines sur le champ de bataille gagnent +1 DEF.");
         LANGUAGE_FR.AddText(ID_SHIELD_MOKDARSHIELD_NAME,"Le Bouclier de Mok Dar");
         LANGUAGE_FR.AddText(ID_SHIELD_MOKDARSHIELD_DESC,"*Aura : Tout les Orcs dans cette troupe gagnent +1 DEF.");
         LANGUAGE_FR.AddText(ID_SHIELD_TULORANPROTECTION_NAME,"Le Bouclier de Tuloran");
         LANGUAGE_FR.AddText(ID_SHIELD_TULORANPROTECTION_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_XONAXSKIN_NAME,"Le Cuir de Xonax");
         LANGUAGE_FR.AddText(ID_SHIELD_XONAXSKIN_DESC,"*Aura : Inflige 1 DMG de Poison à toute les unités dans votre armée chaque 10s.");
         LANGUAGE_FR.AddText(ID_SHIELD_AODANSHIELD_NAME,"Le Bouclier d\'Aodan");
         LANGUAGE_FR.AddText(ID_SHIELD_AODANSHIELD_DESC,"*Aura : Ralentit la vitesse d\'incantation des sorts de TOUTE les unités sur le champ de bataille de 10s.");
         LANGUAGE_FR.AddText(ID_SHIELD_AZARATIUSSHIELD_NAME,"Le Bouclier d\'Azaratius");
         LANGUAGE_FR.AddText(ID_SHIELD_AZARATIUSSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_GORDAKARSHIELD_NAME,"Le Bouclier de Gordakar");
         LANGUAGE_FR.AddText(ID_SHIELD_GORDAKARSHIELD_DESC,"*Aura : Tout les unités Orcs dans cette troupe gagnent +6 DEF.");
         LANGUAGE_FR.AddText(ID_SHIELD_ORYTHSHIELD_NAME,"Éclats  d\'Oryth");
         LANGUAGE_FR.AddText(ID_SHIELD_ORYTHSHIELD_DESC,"*Aura : Toute les unités Démons sur le champ de bataille gagnent +2 DMG de Ténèbre.\n*Aura : Toute les unités Démons sur le champ de bataille ont -6 Résistance Sainte.\n*Aura : Toute les unités Démons sur le champ de bataille gagnent +6 DEF.");
         LANGUAGE_FR.AddText(ID_SHIELD_ULTRASHIELD_NAME,"Ultra-Bouclier");
         LANGUAGE_FR.AddText(ID_SHIELD_ULTRASHIELD_DESC,"*Aura : Toute les unités dans votre armée ont -8 DEF.");
         LANGUAGE_FR.AddText(ID_SHIELD_CERIPHYRSHIELD_NAME,"La Pavois Ceriphyrienne");
         LANGUAGE_FR.AddText(ID_SHIELD_CERIPHYRSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_PLATEARMOR_NAME,"Armure à Plaques");
         LANGUAGE_FR.AddText(ID_ARMOR_PLATEARMOR_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_CHAINMAIL_NAME,"Cotte de Mailles");
         LANGUAGE_FR.AddText(ID_ARMOR_CHAINMAIL_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_SCALEMAIL_NAME,"Armure d\'Écailles");
         LANGUAGE_FR.AddText(ID_ARMOR_SCALEMAIL_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_HAUBERT_NAME,"Haubert");
         LANGUAGE_FR.AddText(ID_ARMOR_HAUBERT_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_BLACKARMOR_NAME,"Armure Sombre");
         LANGUAGE_FR.AddText(ID_ARMOR_BLACKARMOR_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_HALFPLATE_NAME,"Demi-Armure");
         LANGUAGE_FR.AddText(ID_ARMOR_HALFPLATE_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_STUDDEDLEATHER_NAME,"Cuir Clouté");
         LANGUAGE_FR.AddText(ID_ARMOR_STUDDEDLEATHER_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_LEATHER_NAME,"Armure de Cuir");
         LANGUAGE_FR.AddText(ID_ARMOR_LEATHER_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_GAMBESON_NAME,"Gambison");
         LANGUAGE_FR.AddText(ID_ARMOR_GAMBESON_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_FURARMOR_NAME,"Armure de Fourrure");
         LANGUAGE_FR.AddText(ID_ARMOR_FURARMOR_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_BOILEDLEATHER_NAME,"Cuir Bouilli");
         LANGUAGE_FR.AddText(ID_ARMOR_BOILEDLEATHER_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_SPIKEDLEATHER_NAME,"Armure de Cuir à Pics");
         LANGUAGE_FR.AddText(ID_ARMOR_SPIKEDLEATHER_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_RAG_NAME,"Guenille");
         LANGUAGE_FR.AddText(ID_ARMOR_RAG_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_APPRENTICEROBE_NAME,"Robe d\'Apprenti");
         LANGUAGE_FR.AddText(ID_ARMOR_APPRENTICEROBE_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_MAGEROBE_NAME,"Robe de Mage");
         LANGUAGE_FR.AddText(ID_ARMOR_MAGEROBE_DESC,"*Accélère la vitesse d\'incantation des sorts de 2s. (max vitesse: 2s)");
         LANGUAGE_FR.AddText(ID_ARMOR_SPIKEDARMOR_NAME,"Armure à Pic");
         LANGUAGE_FR.AddText(ID_ARMOR_SPIKEDARMOR_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_ROTTENPLATE_NAME,"Plaque Putride");
         LANGUAGE_FR.AddText(ID_ARMOR_ROTTENPLATE_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_CLERICMAIL_NAME,"Cotte de Mailles du Clerc");
         LANGUAGE_FR.AddText(ID_ARMOR_CLERICMAIL_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_TAINTEDPLATE_NAME,"Armure à Plaque Souillée");
         LANGUAGE_FR.AddText(ID_ARMOR_TAINTEDPLATE_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_ADVENTURERCLOTH_NAME,"Survêtement d\'Adventurier");
         LANGUAGE_FR.AddText(ID_ARMOR_ADVENTURERCLOTH_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_SAPPERARMOR_NAME,"Armure de Sapeur");
         LANGUAGE_FR.AddText(ID_ARMOR_SAPPERARMOR_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_ICYROBE_NAME,"Robe Glaciale");
         LANGUAGE_FR.AddText(ID_ARMOR_ICYROBE_DESC,"*Accélère la vitesse d\'incantation des sorts de 1s. (max vitesse: 2s)");
         LANGUAGE_FR.AddText(ID_ARMOR_ROGUEARMOR_NAME,"Armure de Gredin");
         LANGUAGE_FR.AddText(ID_ARMOR_ROGUEARMOR_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_HEAVYPLATE_NAME,"Armure Lourde");
         LANGUAGE_FR.AddText(ID_ARMOR_HEAVYPLATE_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_ROTTENMAIL_NAME,"Cotte de Mailles Putride");
         LANGUAGE_FR.AddText(ID_ARMOR_ROTTENMAIL_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_CULTISTROBE_NAME,"Robe de Cultiste");
         LANGUAGE_FR.AddText(ID_ARMOR_CULTISTROBE_DESC,"* Effet Déclenché au Trépas: Réanime un guérrier Mort-Vivant à vos côtés 4s plus tard.");
         LANGUAGE_FR.AddText(ID_ARMOR_MERCENARYPLATE_NAME,"Plaque de Mercenaire");
         LANGUAGE_FR.AddText(ID_ARMOR_MERCENARYPLATE_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_CHAINMAILOFHATE_NAME,"Cotte de Mailles de la Haine");
         LANGUAGE_FR.AddText(ID_ARMOR_CHAINMAILOFHATE_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_CORRUPTEDMAIL_NAME,"Cotte Corrompue");
         LANGUAGE_FR.AddText(ID_ARMOR_CORRUPTEDMAIL_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_LIGHTNINGCULTROBE_NAME,"Robe d\'Éclair");
         LANGUAGE_FR.AddText(ID_ARMOR_LIGHTNINGCULTROBE_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_ENGINEERAPRON_NAME,"Tablier d\'Ingénieur");
         LANGUAGE_FR.AddText(ID_ARMOR_ENGINEERAPRON_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_EVILMANPLATE_NAME,"Plaque du Malin");
         LANGUAGE_FR.AddText(ID_ARMOR_EVILMANPLATE_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_BROTHERHOODCHAINMAIL_NAME,"Cotte de la Confrérie");
         LANGUAGE_FR.AddText(ID_ARMOR_BROTHERHOODCHAINMAIL_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_GUARDHAUBERT_NAME,"Haubert des Gardes");
         LANGUAGE_FR.AddText(ID_ARMOR_GUARDHAUBERT_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_LUMINARYMAIL_NAME,"Cotte des Illuminés");
         LANGUAGE_FR.AddText(ID_ARMOR_LUMINARYMAIL_DESC,"*Porteur gagne +1 DEF chaque 10s.");
         LANGUAGE_FR.AddText(ID_ARMOR_SWAMPMAIL_NAME,"Cotte de Mailles de Marais");
         LANGUAGE_FR.AddText(ID_ARMOR_SWAMPMAIL_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_LIGHTEDPLATE_NAME,"Plaque Sainte");
         LANGUAGE_FR.AddText(ID_ARMOR_LIGHTEDPLATE_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_BARBARIANARMOR_NAME,"Armure de Barbarie");
         LANGUAGE_FR.AddText(ID_ARMOR_BARBARIANARMOR_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_NECROPOLMAIL_NAME,"Cotte de la Nécropople");
         LANGUAGE_FR.AddText(ID_ARMOR_NECROPOLMAIL_DESC,"*Aura : Toute les unités Mort-Vivant dans cette troupe gagnent +1 DEF.");
         LANGUAGE_FR.AddText(ID_ARMOR_CURSEDARMOR_NAME,"Armure Maudite");
         LANGUAGE_FR.AddText(ID_ARMOR_CURSEDARMOR_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_BLESSEDARMOR_NAME,"Armure Bénie");
         LANGUAGE_FR.AddText(ID_ARMOR_BLESSEDARMOR_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_DEFLAGRATIONSCALE_NAME,"Armure Déflagrante");
         LANGUAGE_FR.AddText(ID_ARMOR_DEFLAGRATIONSCALE_DESC,"*Effet Déclenché au Trépas : Inflige 6 DMG d\'Explosion dans un rayon de 2 cases.");
         LANGUAGE_FR.AddText(ID_ARMOR_MAGMABREASTPLATE_NAME,"Plaque Ignée ");
         LANGUAGE_FR.AddText(ID_ARMOR_MAGMABREASTPLATE_DESC,"*Effet Déclenché au Trépas : Inflige 10 DMG de Feu dans un rayon de 1 case.");
         LANGUAGE_FR.AddText(ID_ARMOR_MITHRILMAIL_NAME,"Cotte de Mailles de Mithril");
         LANGUAGE_FR.AddText(ID_ARMOR_MITHRILMAIL_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_BATTLEMAGEPLATE_NAME,"Plaque de Mage de Guerre");
         LANGUAGE_FR.AddText(ID_ARMOR_BATTLEMAGEPLATE_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_NARMNPLATE_NAME,"L\'Armure de Narmn ");
         LANGUAGE_FR.AddText(ID_ARMOR_NARMNPLATE_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_ANGELPLATE_NAME,"Armure Angélique");
         LANGUAGE_FR.AddText(ID_ARMOR_ANGELPLATE_DESC,"*Aura : Toute les unités dans cette troupe gagnent +2 Resistance Sainte.");
         LANGUAGE_FR.AddText(ID_ARMOR_UNHOLYPLATE_NAME,"Armure Ténèbreuse");
         LANGUAGE_FR.AddText(ID_ARMOR_UNHOLYPLATE_DESC,"*Aura : Toute les unités dans cette troupe gagnent +2 Resistance Ténébreuse.");
         LANGUAGE_FR.AddText(ID_ARMOR_PYROMANCERMAIL_NAME,"Cotte du Pyromancien");
         LANGUAGE_FR.AddText(ID_ARMOR_PYROMANCERMAIL_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_POWERARMOR_NAME,"Armure Puissante");
         LANGUAGE_FR.AddText(ID_ARMOR_POWERARMOR_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_NATAOBETHPLATE_NAME,"L\'Armure de Nataobeth");
         LANGUAGE_FR.AddText(ID_ARMOR_NATAOBETHPLATE_DESC,"*Effet Déclenché au Trépas: Inflige 5 DMG de Ténèbre dans un rayon de 2 cases.\n*Effet Déclenché au Trépas: Réanime un guérrier Mort-Vivant à vos côtés 4s plus tard.");
         LANGUAGE_FR.AddText(ID_ARMOR_BAXROBE_NAME,"Robe du Culte de Bax");
         LANGUAGE_FR.AddText(ID_ARMOR_BAXROBE_DESC,"* Effet Déclenché au Trépas : Réanime un guérrier Démon à vos côtés 10s plus tard.");
         LANGUAGE_FR.AddText(ID_ARMOR_QUAEKMAIL_NAME,"Cotte de Quaek");
         LANGUAGE_FR.AddText(ID_ARMOR_QUAEKMAIL_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_EMPIREARMOR_NAME,"Armure de L\'Empire");
         LANGUAGE_FR.AddText(ID_ARMOR_EMPIREARMOR_DESC,"*Aura : Tout les unités Humains dans votre Armée gagnent +1 DEF.");
         LANGUAGE_FR.AddText(ID_ARMOR_NECROGEAR_NAME,"Attirail du Nécromancien");
         LANGUAGE_FR.AddText(ID_ARMOR_NECROGEAR_DESC,"*Tue son porteur après 10s.");
         LANGUAGE_FR.AddText(ID_ARMOR_ARCHMAGEMAIL_NAME,"Cotte de L\'Archimage");
         LANGUAGE_FR.AddText(ID_ARMOR_ARCHMAGEMAIL_DESC,"*Accélère la vitesse d\'incantation des sorts de 5s. (max vitesse: 2s)");
         LANGUAGE_FR.AddText(ID_ARMOR_IMMORTALARMOR_NAME,"Armure de L\'Immortel");
         LANGUAGE_FR.AddText(ID_ARMOR_IMMORTALARMOR_DESC,"*Effet Déclenché au Trépas: Réanime un guérrier Immortel portant cette Armure à vos côtés 12s plus tard.\n(Les Immortels ne sont pas des Mort-Vivants)");
         LANGUAGE_FR.AddText(ID_ARMOR_TULORANPLATE_NAME,"L\'Armure de Tuloran");
         LANGUAGE_FR.AddText(ID_ARMOR_TULORANPLATE_DESC,"*Porteur gagne +1 DEF pour chaque unités Humains dans votre Armée au début de la Bataille.\n*Aura : Tout les unités Humains dans votre armée gagnent +4 DEF.");
         LANGUAGE_FR.AddText(ID_ARMOR_YASURARMOR_NAME,"L\'Armure de Yasur");
         LANGUAGE_FR.AddText(ID_ARMOR_YASURARMOR_DESC,"*Effet Déclenché sur Réanimation : Tout les unités Mort-Vivant en jeu gagnent +1 DEF.");
         LANGUAGE_FR.AddText(ID_ARMOR_XONAXMAIL_NAME,"La loque de Xonax");
         LANGUAGE_FR.AddText(ID_ARMOR_XONAXMAIL_DESC,"*Aura : Toute les unités Vermine sur le champ de Bataille gagnent +20 DEF.\n*Aura : Toute les unités Vermine sur le champ de Bataille perdent 1 DEF chaque 2s.");
         LANGUAGE_FR.AddText(ID_ARMOR_VASSPOTANAXPLATE_NAME,"L\'Armure de Vass Potanax");
         LANGUAGE_FR.AddText(ID_ARMOR_VASSPOTANAXPLATE_DESC,"*Aura : Tout les unités Reptilien sur le champ de Bataille gagnent +1 ATK de Poison. \n*Aura : Tout les unitées Reptilien sur le champ de battaille gagnent +2 Résistance au Poison.");
         LANGUAGE_FR.AddText(ID_ARMOR_UNTMORIPLATE_NAME,"L\'Armure d\'Untmori");
         LANGUAGE_FR.AddText(ID_ARMOR_UNTMORIPLATE_DESC,"*Effet Déclenché au Trépas : Inflige 10 DMG d\'Explosion dans un rayon de 6 cases.");
         LANGUAGE_FR.AddText(ID_ARMOR_UMENTHARMOR_NAME,"L\'Armure d\'Umenth");
         LANGUAGE_FR.AddText(ID_ARMOR_UMENTHARMOR_DESC,"*Accélère la vitesse d\'incantation des sorts de 10s. (max vitesse: 2s)");
         LANGUAGE_FR.AddText(ID_ARMOR_GORDAKARPLATE_NAME,"L\'Armure de Gordakar");
         LANGUAGE_FR.AddText(ID_ARMOR_GORDAKARPLATE_DESC,"*Aura : Tout les unités Orcs dans cette troupe gagnent +2 ATK Contondante.");
         LANGUAGE_FR.AddText(ID_ARMOR_AZARATIUSORB_NAME,"Les Orbes d\'Azaratius");
         LANGUAGE_FR.AddText(ID_ARMOR_AZARATIUSORB_DESC,"*Aura : Toute les unités dans votre armée gagnent +3 Résistance au Feu.");
         LANGUAGE_FR.AddText(ID_ARMOR_OKKORAZVEST_NAME,"Veste d\'Arhalath");
         LANGUAGE_FR.AddText(ID_ARMOR_OKKORAZVEST_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_HORSE_NAME,"Cheval");
         LANGUAGE_FR.AddText(ID_SPECIAL_HORSE_DESC,"*Utilise 2 cases.");
         LANGUAGE_FR.AddText(ID_SPECIAL_HEAVYHORSE_NAME,"Cheval Armuré");
         LANGUAGE_FR.AddText(ID_SPECIAL_HEAVYHORSE_DESC,"*Utilise 2 cases.");
         LANGUAGE_FR.AddText(ID_SPECIAL_SHIELDRING_NAME,"Anneau d\'Armurier");
         LANGUAGE_FR.AddText(ID_SPECIAL_SHIELDRING_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_WIZARDRING_NAME,"Anneau de Sorcier");
         LANGUAGE_FR.AddText(ID_SPECIAL_WIZARDRING_DESC,"* Accélère la vitesse d\'incantation des sorts de 2s. (max vitesse: 2s)");
         LANGUAGE_FR.AddText(ID_SPECIAL_POWERRING_NAME,"Anneau de Puissance");
         LANGUAGE_FR.AddText(ID_SPECIAL_POWERRING_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_BOAR_NAME,"Phacochère");
         LANGUAGE_FR.AddText(ID_SPECIAL_BOAR_DESC,"*Utilise 2 cases.");
         LANGUAGE_FR.AddText(ID_SPECIAL_REGENNECKLACE_NAME,"Collier de Guérison");
         LANGUAGE_FR.AddText(ID_SPECIAL_REGENNECKLACE_DESC,"*Le porteur récupère 1 DEF chaque 10s.");
         LANGUAGE_FR.AddText(ID_SPECIAL_SOLDIERORB_NAME,"Orbe de Combatant");
         LANGUAGE_FR.AddText(ID_SPECIAL_SOLDIERORB_DESC,"* Le porteur récupère 1 DEF chaque 10s.");
         LANGUAGE_FR.AddText(ID_SPECIAL_TIMESLOWRING_NAME,"Anneau de Suspend");
         LANGUAGE_FR.AddText(ID_SPECIAL_TIMESLOWRING_DESC,"*Ralentit la vitesse d\'incantation des sorts de 3s.");
         LANGUAGE_FR.AddText(ID_SPECIAL_CHARGEHORSE_NAME,"Cheval de Charge");
         LANGUAGE_FR.AddText(ID_SPECIAL_CHARGEHORSE_DESC,"*Utilise 2 cases.");
         LANGUAGE_FR.AddText(ID_SPECIAL_PARADEHORSE_NAME,"Cheval de Parade");
         LANGUAGE_FR.AddText(ID_SPECIAL_PARADEHORSE_DESC,"*Utilise 2 cases.");
         LANGUAGE_FR.AddText(ID_SPECIAL_CURSEDRING_NAME,"Anneau Maudit");
         LANGUAGE_FR.AddText(ID_SPECIAL_CURSEDRING_DESC,"*Le porteur perd 5 DEF (Minimum : 1 DEF).");
         LANGUAGE_FR.AddText(ID_SPECIAL_SAINTHANDRELIC_NAME," Relique Sainte");
         LANGUAGE_FR.AddText(ID_SPECIAL_SAINTHANDRELIC_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_CULTISTHANDRELIC_NAME,"Relique de Cultiste");
         LANGUAGE_FR.AddText(ID_SPECIAL_CULTISTHANDRELIC_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_BUTCHERBOOK_NAME,"Manuel de Boucher");
         LANGUAGE_FR.AddText(ID_SPECIAL_BUTCHERBOOK_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_POLARBEARHAND_NAME,"Patte D\'Ours");
         LANGUAGE_FR.AddText(ID_SPECIAL_POLARBEARHAND_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_DRYEELBELT_NAME,"Ceinture d\'Anguille");
         LANGUAGE_FR.AddText(ID_SPECIAL_DRYEELBELT_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_POISONBOTTLE_NAME,"Bouteille de Poison");
         LANGUAGE_FR.AddText(ID_SPECIAL_POISONBOTTLE_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_RHINO_NAME,"Rhino");
         LANGUAGE_FR.AddText(ID_SPECIAL_RHINO_DESC,"*Utilise 2 cases.");
         LANGUAGE_FR.AddText(ID_SPECIAL_ARCHERBRACER_NAME,"Bracelet D\'Archer");
         LANGUAGE_FR.AddText(ID_SPECIAL_ARCHERBRACER_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_OGREBRACER_NAME,"Bracelet d\'Ogre");
         LANGUAGE_FR.AddText(ID_SPECIAL_OGREBRACER_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_MAGMAEMBLEM_NAME,"Emblème Ignée");
         LANGUAGE_FR.AddText(ID_SPECIAL_MAGMAEMBLEM_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_SAPPERNECKLACE_NAME,"Collier de Sapeur");
         LANGUAGE_FR.AddText(ID_SPECIAL_SAPPERNECKLACE_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_TIMEWARPRING_NAME,"Anneau Temporel");
         LANGUAGE_FR.AddText(ID_SPECIAL_TIMEWARPRING_DESC,"*Accélère la vitesse d\'incantation des sorts de 4s. (max vitesse: 2s)");
         LANGUAGE_FR.AddText(ID_SPECIAL_MAGNETICRING_NAME,"Anneau Magnétique");
         LANGUAGE_FR.AddText(ID_SPECIAL_MAGNETICRING_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_TRIBALCHIEFCROWN_NAME,"Couronne de Chef de Tribut");
         LANGUAGE_FR.AddText(ID_SPECIAL_TRIBALCHIEFCROWN_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_MERCENARYGAUNTLET_NAME,"Gantlet de Combat");
         LANGUAGE_FR.AddText(ID_SPECIAL_MERCENARYGAUNTLET_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_UNDEADHORSE_NAME,"Cheval Mort-Vivant");
         LANGUAGE_FR.AddText(ID_SPECIAL_UNDEADHORSE_DESC,"*Utilise 2 cases.\n*Effet Déclenché au Trépas: Réanime 1 guérrier Mort-Vivant à vos côtés 8s plus tard.");
         LANGUAGE_FR.AddText(ID_SPECIAL_LUMINARYRING_NAME,"Anneau des Illuminés");
         LANGUAGE_FR.AddText(ID_SPECIAL_LUMINARYRING_DESC,"*Accélère la vitesse d\'incantation des sorts de 10s. (max vitesse: 2s)");
         LANGUAGE_FR.AddText(ID_SPECIAL_QUAEKTALISMAN_NAME,"Talisman de Quaek");
         LANGUAGE_FR.AddText(ID_SPECIAL_QUAEKTALISMAN_DESC,"*Aura : Toute les unités Vermine sur le champ de Bataille gagnent +1 Résistance au Poison et +1 ATK de Poison.");
         LANGUAGE_FR.AddText(ID_SPECIAL_WARHORSE_NAME,"Cheval de Guerre");
         LANGUAGE_FR.AddText(ID_SPECIAL_WARHORSE_DESC,"*Utilise 2 cases.");
         LANGUAGE_FR.AddText(ID_SPECIAL_MECHANICALBEAST_NAME,"Bête Mécanique");
         LANGUAGE_FR.AddText(ID_SPECIAL_MECHANICALBEAST_DESC,"*Utilise 2 cases.\n*Effet Déclenché sur Frappe Mortelle : Porteur récupère +3 DEF.");
         LANGUAGE_FR.AddText(ID_SPECIAL_STATICORB_NAME,"Orbe Statique");
         LANGUAGE_FR.AddText(ID_SPECIAL_STATICORB_DESC,"*Aura : Ralentit la vitesse d\'incantation des sorts de 5s.");
         LANGUAGE_FR.AddText(ID_SPECIAL_NATAOBETHORB_NAME,"Orbe de Nataobeth");
         LANGUAGE_FR.AddText(ID_SPECIAL_NATAOBETHORB_DESC,"* Effet Déclenché au Trépas: Réanime 2 guérriers Mort-Vivant à vos côtés 4s plus tard.");
         LANGUAGE_FR.AddText(ID_SPECIAL_EMPIRESEAL_NAME,"Sceau de l\'Empire");
         LANGUAGE_FR.AddText(ID_SPECIAL_EMPIRESEAL_DESC,"*Aura : Toute les unités Humains dans votre Armée gagnent +4 DEF et +4 ATK Tranchante.");
         LANGUAGE_FR.AddText(ID_SPECIAL_ORCLEADERCROWN_NAME,"Couronne du Chef des Orcs");
         LANGUAGE_FR.AddText(ID_SPECIAL_ORCLEADERCROWN_DESC,"*Aura : Toute les unités Orcs dans cette troupe gagnent +2 ATK Contondante.");
         LANGUAGE_FR.AddText(ID_SPECIAL_UNICORN_NAME,"Licorne");
         LANGUAGE_FR.AddText(ID_SPECIAL_UNICORN_DESC,"*Aura : Toute les unités dans votre Armée gagnent +2 DEF.\n*Effet Déclenché sur Frappe Mortelle : Toute les unités de cette troupe récupère +1 DEF.");
         LANGUAGE_FR.AddText(ID_SPECIAL_ARHALATHRING_NAME,"L\'Anneau d\'Arhalath");
         LANGUAGE_FR.AddText(ID_SPECIAL_ARHALATHRING_DESC,"*Aura : Toute les unités Golem sur le champ de Bataille gagnent +8 DEF.");
         LANGUAGE_FR.AddText(ID_SPECIAL_YASURRING_NAME,"L\'Anneau de Yasur");
         LANGUAGE_FR.AddText(ID_SPECIAL_YASURRING_DESC,"*Aura : Réanine un Mort-Vivant supplémentaire à chaque Réanimation.");
         LANGUAGE_FR.AddText(ID_SPECIAL_APOCALYPSEHORSE_NAME,"Cheval de L\'Apocalypse");
         LANGUAGE_FR.AddText(ID_SPECIAL_APOCALYPSEHORSE_DESC,"*Aura : Toute les unités dans votre armée ont -8 DEF.");
         LANGUAGE_FR.AddText(ID_SPECIAL_ANTIMAGICFIELD_NAME,"Sphère d\'Anti-Magie");
         LANGUAGE_FR.AddText(ID_SPECIAL_ANTIMAGICFIELD_DESC,"*Aura : Ralentit la vitesse d\'incantation des sorts de toute les unités sur le champ de bataille de 20s.");
         LANGUAGE_FR.AddText(ID_SPECIAL_ULTRARING_NAME,"Ultra-Anneau");
         LANGUAGE_FR.AddText(ID_SPECIAL_ULTRARING_DESC,"*Aura : Ralentit la vitesse d\'incantation des sorts de toute les unités sur le champ de bataille de 20s.\n*Aura : Toute les unités dans votre armée ont -10 DEF.");
         LANGUAGE_FR.AddText(ID_SPECIAL_GAZATAHBOOK_NAME,"Le Tome de Gazatah");
         LANGUAGE_FR.AddText(ID_SPECIAL_GAZATAHBOOK_DESC,"*Aura : Toute les unités dans cette troupe gagnent +5 Résistance au Ténèbre et +10 Résistance Contondante.");
         LANGUAGE_FR.AddText(ID_CREATURE_SMALLMINE_NAME,"Small Mine");
         LANGUAGE_FR.AddText(ID_CREATURE_SMALLMINE_DESC,"*Triggered Effect (on-Death) : Explode dealing 1 explosion damage to any unit in front of it.");
         LANGUAGE_FR.AddText(ID_CREATURE_SHAPESHIFTER_NAME,"Metamorphe");
         LANGUAGE_FR.AddText(ID_CREATURE_SHAPESHIFTER_DESC,"*Metamorphe Compte comme tout les types de creatures .");
         LANGUAGE_FR.AddText(ID_CREATURE_POWERMINE_NAME,"Power Mine");
         LANGUAGE_FR.AddText(ID_CREATURE_POWERMINE_DESC,"*Triggered Effect (on-Death) : Explode dealing 5 explosion damage to any unit in front of it.");
         LANGUAGE_FR.AddText(ID_CREATURE_IMPGOON_NAME,"Gros Diablotin");
         LANGUAGE_FR.AddText(ID_CREATURE_IMPGOON_DESC,"*Compte comme un Diablotin.");
         LANGUAGE_FR.AddText(ID_CREATURE_MACHINECATAPULT_NAME,"Catapulte Automatique");
         LANGUAGE_FR.AddText(ID_CREATURE_MACHINECATAPULT_DESC,"*Verouille Tout.\n*Recharge: 6s.\n*Utilise 6 Cases.\n*DMG ETENDU sur 6 Cases.");
         LANGUAGE_FR.AddText(ID_CREATURE_RUSTYCANON_NAME,"Rusty Catapult");
         LANGUAGE_FR.AddText(ID_CREATURE_RUSTYCANON_DESC,"*Verouille Tout.\n*Recharge: 6s.\n*Utilise 6 Cases.\n*DMG ETENDU sur 6 Cases.\n*auto detruit apres un tire.");
         LANGUAGE_FR.AddText(ID_CREATURE_DESTROYER_NAME,"Destructeur");
         LANGUAGE_FR.AddText(ID_CREATURE_DESTROYER_DESC,"*Compte comme un Golem.(Meurt après 20s.)");
         LANGUAGE_FR.AddText(ID_CREATURE_AODANMYTHIC_NAME,"Aodan Mythic");
         LANGUAGE_FR.AddText(ID_CREATURE_AODANMYTHIC_DESC,"*Mythic.\n*Compte comme un humain.\n*Tout les golems en jeux gagne 30s de plus avant de mourrir.\n*tout les Golems en jeux gagne +2 ATK Explosion ");
         LANGUAGE_FR.AddText(ID_CREATURE_AZARTIUSMYTHIC_NAME,"Azartius Mythic");
         LANGUAGE_FR.AddText(ID_CREATURE_AZARTIUSMYTHIC_DESC,"*Mythic.\n*Compte comme un humain.\n*Toute les unités en jeux gagne +4 ATK de Feu");
         LANGUAGE_FR.AddText(ID_CREATURE_UMENTHMYTHIC_NAME,"Umenth Mythic");
         LANGUAGE_FR.AddText(ID_CREATURE_UMENTHMYTHIC_DESC,"*Mythic.\n*Compte comme un Octopode.\n*accélère la vitesse d\'incantation de tous les Octopodes par 5 sec(Max vitesse 2s.)");
         LANGUAGE_FR.AddText(ID_CREATURE_YASURMYTHIC_NAME,"Yasur Mythic");
         LANGUAGE_FR.AddText(ID_CREATURE_YASURMYTHIC_DESC,"*Mythic.\n*Compte comme un Mort-Vivant.\n*Gagne +1DEF et +1 DMG pour chaque Mort-Vivant en jeux au début de la battaille.\n*Gagne +1 DEF and+1 Dark DMG chaque fois qu\'un Mort-Vivant est réanimé.");
         LANGUAGE_FR.AddText(ID_CREATURE_XONAXMYTHIC_NAME,"Xonax Mythic");
         LANGUAGE_FR.AddText(ID_CREATURE_XONAXMYTHIC_DESC,"*Mythic.\n*Compte comme une Vermine.\n*Compte comme un humain.\n*Toute les vermines gagne +2 ATK de Poison.");
         LANGUAGE_FR.AddText(ID_CREATURE_ZAMAROTHMYTHIC_NAME,"Zamaroth Mythic");
         LANGUAGE_FR.AddText(ID_CREATURE_ZAMAROTHMYTHIC_DESC,"*Mythic.\n*Compte comme un Démon.\n*tout les Démons en jeux gagne +10 ATK tenèbre et +10 DEF.");
         LANGUAGE_FR.AddText(ID_CREATURE_VASSPOTANAXMYTHIC_NAME,"Vass Potanax Mythic");
         LANGUAGE_FR.AddText(ID_CREATURE_VASSPOTANAXMYTHIC_DESC,"*Mythic.\n*Compte comme un Reptilien.\n*tout les reptilien en jeux gagne +3 ATK Poison and +3 DEF.");
         LANGUAGE_FR.AddText(ID_CREATURE_RHIGARMYTHIC_NAME,"Rhigar Mythic");
         LANGUAGE_FR.AddText(ID_CREATURE_RHIGARMYTHIC_DESC,"*Mythic.\n*Compte comme un Humain.\n*accelere le temps de recharge de tout les unités dans ton armer de  2sec(Max vitesse 2s.).");
         LANGUAGE_FR.AddText(ID_CREATURE_IMRAILHMYTHIC_NAME,"Imra\'ilh Mythic");
         LANGUAGE_FR.AddText(ID_CREATURE_IMRAILHMYTHIC_DESC,"*Mythic.\n*Compte comme un Ange.\n*tout les Anges en jeux gagne +10 ATK Sainte et +10 DEF.");
         LANGUAGE_FR.AddText(ID_CREATURE_MISFORMMYTHIC_NAME,"Misform Mythic");
         LANGUAGE_FR.AddText(ID_CREATURE_MISFORMMYTHIC_DESC,"*Mythic.\n*Misform Mythic Compte comme tout les types de creatures.");
         LANGUAGE_FR.AddText(ID_WEAPON_FLAMETHROWER_NAME,"Lance Flame");
         LANGUAGE_FR.AddText(ID_WEAPON_FLAMETHROWER_DESC,"*Utilise les deux mains.\n*Temps de recharge: 4s.Inflige du damage de feux sur 4 cases en avant.");
         LANGUAGE_FR.AddText(ID_WEAPON_IMPPIKE_NAME,"Pic Diablotin");
         LANGUAGE_FR.AddText(ID_WEAPON_IMPPIKE_DESC,"*Utilise les deux mains.\n* gagne +2 ATK tenèbre si equiper sur un Diablotin.");
         LANGUAGE_FR.AddText(ID_WEAPON_IMPMUSKET_NAME,"Mousquet Diablotin");
         LANGUAGE_FR.AddText(ID_WEAPON_IMPMUSKET_DESC,"*Utilise les deux mains.\n*Reload Time : 8s.\n*gagne +4 ATK tenèbre si equiper sur un Diablotin.");
         LANGUAGE_FR.AddText(ID_WEAPON_MACHINEMUSKET_NAME,"Mousquet automatique");
         LANGUAGE_FR.AddText(ID_WEAPON_MACHINEMUSKET_DESC,"*Utilise les deux mains.\n*Temps de recharge : 2s.");
         LANGUAGE_FR.AddText(ID_WEAPON_ICESPIKESTAFF_NAME,"Baton pic de Glace");
         LANGUAGE_FR.AddText(ID_WEAPON_ICESPIKESTAFF_DESC,"*Utilise les deux mains.\n*Temps d\'incantation : 20s.\n *Sort : inflige 20 dégat de glace a un unité enemmie.");
         LANGUAGE_FR.AddText(ID_WEAPON_POISONARROWSTAFF_NAME,"Baton fleche de Poison");
         LANGUAGE_FR.AddText(ID_WEAPON_POISONARROWSTAFF_DESC,"*Utilise les deux mains.\n*Temps d\'incantation : 20s.\n *Sort : inflige 20 dégat de poison a un unité enemmie.");
         LANGUAGE_FR.AddText(ID_WEAPON_FIREBALLSTAFF_NAME,"Baton de boule de feux");
         LANGUAGE_FR.AddText(ID_WEAPON_FIREBALLSTAFF_DESC,"*Utilise les deux mains.\n*Temps d\'incantation : 20s.\n *Sort : inflige 20 dégat de feux a un unité enemmie.");
         LANGUAGE_FR.AddText(ID_WEAPON_THUNDERBOLTSTAFF_NAME,"Baton d\'éclair magic");
         LANGUAGE_FR.AddText(ID_WEAPON_THUNDERBOLTSTAFF_DESC,"*Utilise les deux mains.\n*Temps d\'incantation : 20s.\n *Sort : inflige 20 dégat électique a un unité enemmie.");
         LANGUAGE_FR.AddText(ID_WEAPON_LIVINGSWORD_NAME,"Épée vivante");
         LANGUAGE_FR.AddText(ID_WEAPON_LIVINGSWORD_DESC,"*effet déclenché (sur un coup mortel) : l\'unité gagne +1 ATK Tranchante.");
         LANGUAGE_FR.AddText(ID_WEAPON_KNIFE_NAME,"Couteau");
         LANGUAGE_FR.AddText(ID_WEAPON_KNIFE_DESC,"");
         LANGUAGE_FR.AddText(ID_WEAPON_FINECRAFTBOW_NAME,"Arc bien fait");
         LANGUAGE_FR.AddText(ID_WEAPON_FINECRAFTBOW_DESC,"*Utilise les deux mains.\n*Temps de recharge : 4s.");
         LANGUAGE_FR.AddText(ID_WEAPON_LIVINGBOW_NAME,"Arc vivante");
         LANGUAGE_FR.AddText(ID_WEAPON_LIVINGBOW_DESC,"*Utilise les deux mains.\n*Temps de recharge : 6s.\n*effet déclenché (sur un coup mortel) : l\'unité gagne +1 ATK percante.");
         LANGUAGE_FR.AddText(ID_WEAPON_PYROBATTLESTAFF_NAME,"baton de combat Pyro");
         LANGUAGE_FR.AddText(ID_WEAPON_PYROBATTLESTAFF_DESC,"*Utilise les deux mains.\n*Temps de recharge : 2s.\n *Sort : inflige 30 dégat de feux a un unité enemmie.");
         LANGUAGE_FR.AddText(ID_WEAPON_UNDEADFLAG_NAME,"Drapeau des morts");
         LANGUAGE_FR.AddText(ID_WEAPON_UNDEADFLAG_DESC,"*Utilise les deux mains.\n*Aura : Tout les mort vivant dans le squad gagne +5 DEF.");
         LANGUAGE_FR.AddText(ID_WEAPON_TESLASTAFF_NAME,"Baton Tesla");
         LANGUAGE_FR.AddText(ID_WEAPON_TESLASTAFF_DESC,"*Utilise les deux mains.\n*Temps de recharge : 25s.\n *Sort : inflige 20 dégat électique a un unité enemmie.");
         LANGUAGE_FR.AddText(ID_WEAPON_BATTLEHAMMER_NAME,"Marteau de bataille");
         LANGUAGE_FR.AddText(ID_WEAPON_BATTLEHAMMER_DESC,"*Inflige du dégat 2 cases en avant.");
         LANGUAGE_FR.AddText(ID_WEAPON_ANCIENTBLADE_NAME,"Ancienne lame");
         LANGUAGE_FR.AddText(ID_WEAPON_ANCIENTBLADE_DESC,"*gagne +2 atk tranchante pour chaque mythic en jeux au début de la battaille.");
         LANGUAGE_FR.AddText(ID_WEAPON_CHEAPMUSKET_NAME,"Mauvais mousquet");
         LANGUAGE_FR.AddText(ID_WEAPON_CHEAPMUSKET_DESC,"*Utilise les deux mains.\n*Temps de recharge : 6s.\n*fais aussie du dmg a sont utilisateur.");
         LANGUAGE_FR.AddText(ID_WEAPON_SEAKINGSTAFF_NAME,"Baton du roi des mer");
         LANGUAGE_FR.AddText(ID_WEAPON_SEAKINGSTAFF_DESC,"*Utilise les deux mains.\n*Temps de recharge : 25s.\n *sort : inflige 20 dmg de glace sur la premiere ligne enemies\n*Aura : reduit le temps de recharge de 5 second si equiper sur un homme poisson.(Max vitesse 2s.)");
         LANGUAGE_FR.AddText(ID_WEAPON_SWAMPSTAFF_NAME,"Baton des marais");
         LANGUAGE_FR.AddText(ID_WEAPON_SWAMPSTAFF_DESC,"*Utilise les deux mains.\n*Temps de recharge : 30s.\n *sort : inflige 2 dmg de Poison DMG sur les 3 premieres ligne d\'enemies.");
         LANGUAGE_FR.AddText(ID_WEAPON_BATTLEMUSKET_NAME,"Mousquet d\'assault");
         LANGUAGE_FR.AddText(ID_WEAPON_BATTLEMUSKET_DESC,"*Utilise les deux mains.\n*Temps de recharge : 6s.\n");
         LANGUAGE_FR.AddText(ID_WEAPON_METASTAFF_NAME,"Baton Meta");
         LANGUAGE_FR.AddText(ID_WEAPON_METASTAFF_DESC,"**Utilise les deux mains.\n*Temps d\'incantation : 30s.\n *Sort : inflige  1 Explosion 1 glace 1 Feux 1 Thonnere 1 Poison 1 saint 1 tennebre DMG a la premiere ligne des enemies.");
         LANGUAGE_FR.AddText(ID_WEAPON_CORALSTAFF_NAME,"Baton de corail");
         LANGUAGE_FR.AddText(ID_WEAPON_CORALSTAFF_DESC,"*Utilise les deux mains.\n*Temps d\'incantation : 30s.\n *Sort : tout les uniter dans le squad du magicien gagne +10 DEF.\n*Aura : reduit le temps de recharge de 5 second si equiper sur un homme poisson.(Max vitesse 2s.)");
         LANGUAGE_FR.AddText(ID_WEAPON_COMPOSITEPIKE_NAME,"Pic Composite");
         LANGUAGE_FR.AddText(ID_WEAPON_COMPOSITEPIKE_DESC,"*Utilise les deux mains.");
         LANGUAGE_FR.AddText(ID_WEAPON_EVILSTAFF_NAME,"Baton Impie");
         LANGUAGE_FR.AddText(ID_WEAPON_EVILSTAFF_DESC,"*Utilise les deux mains.\n*Temps d\'incantation : 50s.\n *Sort : transforme toute les uniter dans le squad a guerrier demon.");
         LANGUAGE_FR.AddText(ID_WEAPON_PYROSTAFF_NAME,"Baton Pyro ");
         LANGUAGE_FR.AddText(ID_WEAPON_PYROSTAFF_DESC,"*Utilise les deux mains.\n*Temps d\'incantation : 20s.\n *Sort : inflinge 10 dmg de feux a sur toute les unité devant.");
         LANGUAGE_FR.AddText(ID_WEAPON_MOONSWORD_NAME,"Lame de la lune");
         LANGUAGE_FR.AddText(ID_WEAPON_MOONSWORD_DESC,"*effet déclenché (aux trepas) :  tout les lychanthrop gagne +2 ATK Tenebreuse .");
         LANGUAGE_FR.AddText(ID_WEAPON_LIFESTAFF_NAME,"Baton de vie");
         LANGUAGE_FR.AddText(ID_WEAPON_LIFESTAFF_DESC,"*Utilise les deux mains.\n*Temps d\'incantation : 40s.\n *Sort : Tout les non mort vivant non demon en jeux regagne +20 DEF.\n *sort : inflige 10 dmg saint a une unité enemie.");
         LANGUAGE_FR.AddText(ID_WEAPON_DEATHSTAFF_NAME,"Death Staff");
         LANGUAGE_FR.AddText(ID_WEAPON_DEATHSTAFF_DESC,"*Utilise les deux mains.\n*Temps d\'incantation : 40s.\n *Sort : inflinge 15 dmg tenebreux a toute les non demon non mort vivant en jeux.");
         LANGUAGE_FR.AddText(ID_WEAPON_OKKORAZHAMMER_NAME,"Ok\'Koraz Hammer");
         LANGUAGE_FR.AddText(ID_WEAPON_OKKORAZHAMMER_DESC,"*Utilise les deux mains.\n*effet déclenché (sur un coup mortel) : gagne 10 def.\n*effet déclenché (2e Attack) : inflige 10 dmg elecrique sur toutes les unités dans la mêlée.");
         LANGUAGE_FR.AddText(ID_SHIELD_OFFHANDSWORD_NAME,"épee main gauche");
         LANGUAGE_FR.AddText(ID_SHIELD_OFFHANDSWORD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_REINFORCEDSHIELD_NAME,"Bouclier renforcer");
         LANGUAGE_FR.AddText(ID_SHIELD_REINFORCEDSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_MAGICSHIELD_NAME,"Bouclier Magic");
         LANGUAGE_FR.AddText(ID_SHIELD_MAGICSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_OFFHANDMACE_NAME,"Mace main gauche");
         LANGUAGE_FR.AddText(ID_SHIELD_OFFHANDMACE_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_LEATHERSHIELD_NAME,"Bouclier de cuire");
         LANGUAGE_FR.AddText(ID_SHIELD_LEATHERSHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_BATTLESHIELD_NAME,"Bouclier de bataille");
         LANGUAGE_FR.AddText(ID_SHIELD_BATTLESHIELD_DESC,"");
         LANGUAGE_FR.AddText(ID_SHIELD_IMPSHIELD_NAME,"bouclier diablotin");
         LANGUAGE_FR.AddText(ID_SHIELD_IMPSHIELD_DESC,"*gagne +2 DEF si equiper sur un diablotin.Aura: tout les diablotin gagne +1def.");
         LANGUAGE_FR.AddText(ID_SHIELD_VASSSHIELD_NAME,"bouclier de Vass");
         LANGUAGE_FR.AddText(ID_SHIELD_VASSSHIELD_DESC,"*Aura : tout les reptilien en jeux gagne +5 resistance au feux et au contondant.");
         LANGUAGE_FR.AddText(ID_ARMOR_WARRIORBATTLEMAIL_NAME,"maille du guerrier");
         LANGUAGE_FR.AddText(ID_ARMOR_WARRIORBATTLEMAIL_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_RUSTYMAIL_NAME,"Maille rouiller");
         LANGUAGE_FR.AddText(ID_ARMOR_RUSTYMAIL_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_USEDGAMBESON_NAME,"Gambison usé");
         LANGUAGE_FR.AddText(ID_ARMOR_USEDGAMBESON_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_ANCIENTARMOR_NAME,"Ancienne armure");
         LANGUAGE_FR.AddText(ID_ARMOR_ANCIENTARMOR_DESC,"*gagne +2 DEF pour chaque mythic dans ton armée au début de la battaille..");
         LANGUAGE_FR.AddText(ID_ARMOR_IMPARMOR_NAME,"Armure de diablotin");
         LANGUAGE_FR.AddText(ID_ARMOR_IMPARMOR_DESC,"*gagne +6 DEF si equiper sur un diablotin.");
         LANGUAGE_FR.AddText(ID_ARMOR_MECHANICARMOR_NAME,"Armure Mechanique");
         LANGUAGE_FR.AddText(ID_ARMOR_MECHANICARMOR_DESC,"*Aura : tout les golem en jeux gagne +2 DEF.");
         LANGUAGE_FR.AddText(ID_ARMOR_SEAKINGARMOR_NAME,"Armure du roi des mer");
         LANGUAGE_FR.AddText(ID_ARMOR_SEAKINGARMOR_DESC,"*Aura : tout les hommes poisson en jeux gagne +2 DEF.");
         LANGUAGE_FR.AddText(ID_ARMOR_BATTLEARMOR_NAME,"Armure de battaile");
         LANGUAGE_FR.AddText(ID_ARMOR_BATTLEARMOR_DESC,"");
         LANGUAGE_FR.AddText(ID_ARMOR_RAMPAGERARMOR_NAME,"armure de rageure");
         LANGUAGE_FR.AddText(ID_ARMOR_RAMPAGERARMOR_DESC,"*gagne +1 DEF pour chaque uniter enemie au début de la bataille.");
         LANGUAGE_FR.AddText(ID_ARMOR_COOLDOWNARMOR_NAME,"armure de mélee");
         LANGUAGE_FR.AddText(ID_ARMOR_COOLDOWNARMOR_DESC,"*reduit le temps de recharge et d\'incantation du porteur de 30sec.");
         LANGUAGE_FR.AddText(ID_ARMOR_SEAPLATE_NAME,"plaque de la mer");
         LANGUAGE_FR.AddText(ID_ARMOR_SEAPLATE_DESC,"*Aura : tout les homme poisson gagne +25 de resistance a la glace et +2 DEF.");
         LANGUAGE_FR.AddText(ID_ARMOR_INSECTOIDQUEENARMOR_NAME,"armure de la reine insectoid");
         LANGUAGE_FR.AddText(ID_ARMOR_INSECTOIDQUEENARMOR_DESC,"*reduit le temps en larve des insectoid de 5sec.\n*Aura : tout les insectoide gagne +2 ATK tranchante et +2 DEF.");
         LANGUAGE_FR.AddText(ID_ARMOR_MOONARMOR_NAME,"armure de la lune");
         LANGUAGE_FR.AddText(ID_ARMOR_MOONARMOR_DESC,"*effet déclenché (au trepas) : tout les Lycanthrope gagne +6 DEF.");
         LANGUAGE_FR.AddText(ID_SPECIAL_IMPCROWN_NAME,"couronne des diablotins");
         LANGUAGE_FR.AddText(ID_SPECIAL_IMPCROWN_DESC,"*Aura : tout les diablotins dans le squad gagne +1 DEF.");
         LANGUAGE_FR.AddText(ID_SPECIAL_MOONORB_NAME,"orb de la lune");
         LANGUAGE_FR.AddText(ID_SPECIAL_MOONORB_DESC,"*effet déclenché (au trepas) : tout les Lycanthropes gagne +2 DEF.");
         LANGUAGE_FR.AddText(ID_SPECIAL_BLAZINGORB_NAME,"Orb brulante");
         LANGUAGE_FR.AddText(ID_SPECIAL_BLAZINGORB_DESC,"*Aura : tout les unité en jeux gagne +2 ATK de feux.");
         LANGUAGE_FR.AddText(ID_SPECIAL_ARCHERGEAR_NAME,"equipement d\'archer");
         LANGUAGE_FR.AddText(ID_SPECIAL_ARCHERGEAR_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_ANTITECHCRYSTAL_NAME,"Crystal Anti Tech ");
         LANGUAGE_FR.AddText(ID_SPECIAL_ANTITECHCRYSTAL_DESC,"*Aura : ralentie le temps de recharge de tout les uniter en jeux de 4s.");
         LANGUAGE_FR.AddText(ID_SPECIAL_RINGOFMADNESS_NAME,"Ring of Madness");
         LANGUAGE_FR.AddText(ID_SPECIAL_RINGOFMADNESS_DESC,"");
         LANGUAGE_FR.AddText(ID_SPECIAL_DEATHNECKLACE_NAME,"colier de la mort royal");
         LANGUAGE_FR.AddText(ID_SPECIAL_DEATHNECKLACE_DESC,"*effet déclenché (au trepas)perd la battaile.");
         LANGUAGE_FR.AddText(ID_SPECIAL_ELEMENTALRING_NAME,"anneaux Elemental");
         LANGUAGE_FR.AddText(ID_SPECIAL_ELEMENTALRING_DESC,"*Aura : tout les elementals gange +10 DEF.");
         LANGUAGE_FR.AddText(ID_SPECIAL_WARLORDRING_NAME,"anneaux du seigneur de guerre");
         LANGUAGE_FR.AddText(ID_SPECIAL_WARLORDRING_DESC,"*Aura : tout les uniter dans ton armée gagne +1 ATK tranchante.");
         LANGUAGE_FR.AddText(ID_NOT_ENOUGH_CASH,"Vous n\'avez pas assez d\'or, en voulez-vous plus ?");
         LANGUAGE_FR.AddText(ID_AREYOUSURE_NO_SAVE,"Es-tu certain de vouloir quitter la fenêtre de création d\'unités sans sauvegarder ?");
         LANGUAGE_FR.AddText(ID_NEED_CREATURE,"Une Créature est nécessaire pour créer une unité.");
         LANGUAGE_FR.AddText(ID_NOT_BELLOW_0,"Tu ne peux utiliser plus de 1000 point par armée !");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_1_NAME,"L\'âge de la paix");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_2_NAME,"Défense nocturne");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_3_NAME,"Paix en péril");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_4_NAME,"Terre carbonisée");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_5_NAME,"Sauvetage de sorciers");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_6_NAME,"Équipe magique");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_7_NAME,"Le support de l\'Empereur");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_8_NAME,"Les Généraux");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_9_NAME,"La source de la corruption");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_1_NAME,"Tourner la page");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_2_NAME,"Des Orcs et des Hommes");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_3_NAME,"Machinations humaine");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_4_NAME,"Folie à vapeur");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_5_NAME,"Face à face avec le Nord");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_6_NAME,"Défi chevaleresque");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_7_NAME,"La gloire a un prix");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_8_NAME,"L\'orgueil des Orcs");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_9_NAME,"Concurrrence Royale");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_10_NAME,"L\'Empire");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_1_NAME,"Le début de la fin");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_2_NAME,"Une nouvelle menace");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_3_NAME,"Trahison");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_4_NAME,"Complot interne");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_5_NAME,"Isolés");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_6_NAME,"Mort vagabonde");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_7_NAME,"Mort Subite");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_8_NAME,"Magie Cultiste");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_9_NAME,"Mort-à-Cheval");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_10_NAME,"La Fin");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_1_NAME,"Un nouveau monde");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_2_NAME,"Les nuits sombre");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_3_NAME,"Expédition nocturne");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_4_NAME,"Nuit mortelle");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_5_NAME,"Purification");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_6_NAME,"Un plan sinistre");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_7_NAME,"Sous le voile");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_8_NAME,"Éruption démoniaque");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_9_NAME,"Le rituel");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_1_NAME,"Le clan de Rhigar");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_2_NAME,"La première Invasion");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_3_NAME,"Liberté");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_4_NAME,"La folie d’Aodan");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_5_NAME,"L’assassinat Royal");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_6_NAME,"Un Immortel est né");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_7_NAME,"Les feux de Dyn\'Tur");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_8_NAME,"La réponse du Roi des mers");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_9_NAME,"La protection d’Oryth");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_10_NAME,"Bataille de Berythe");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_1_STORY1,"Bonjour Sir! Je suis Val\'Bert votre conseillère et ceci est le Royaume de Tul, la terre des Hommes. Les choses ont été bien paisibles ici ces derniers siècles, depuis la grande bataille qui unifia les pays de l\'ouest afin de vaincre les forces du mal.\nEmpereur Tuloran nous a laissé un bien bel héritage, maintenant l\'humanité vie sous un code d\'ordre et de justice, et il en tient à vous de s\'assurer qu\'il soit honoré.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_1_STORY2,"Vous êtes un des nombreux commandants recrutés par le nouvel Empereur, ayant comme tâche d\'assurer la quiétude des habitants du Royaume. Pour ce, vous avez mené votre jeune armée dans une vallée près des montagnes pour leur introduction au champ de bataille.\n\nVotre histoire débute ici.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_2_STORY1,"Le silence de la nuit vous enveloppe; tranquillement, vous succombez à l\'appel du sommeil. Tout à coup, un de vos hommes fait irruption dans vos quartier en criant \'LES ORCS\'");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_3_STORY1,"Comme vous le soupçonniez, cette assaut n\'était que le commencement. Une autre troupe d\'Orcs charge vers votre camp, cette fois ci, ils semblent mieux préparés, les premiers ne devaient être que les éclaireurs.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_4_STORY1,"Après une bonne nuit de repos, le pauvre homme devînt plus cohérent. Il vous raconte une histoire presque incroyable à propos d\'une civilisation crue éteinte, de créatures infectueuses voyageant en nombre sous la protection du voile de la nuit. Un frisson vous transit jusqu\'à l\'os à la simple pensée de leur retour dans ce monde. Le temps presse, vous effacez tout signe de doute de votre visage et allez à la rencontre de vos hommes pour les informer de ces développements.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_4_STORY2,"Après mainte réflexion, vous décidez de voyager vers l\'est dans l\'espoir de recruter quelque sorciers de l\'ordre magique qui ont pris refuge dans la vallée. Vous y trouvez une carrière en brasier, il y avais une clairière dans le passé ici vous en êtes certain. Au loin, vous apercevez une caverne d\'où émane une faible lumière, probablement un simple feu de camp. Alors que vous vous en approchez, une marée de créatures puantes vous assaille.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_5_STORY1,"Vous amenez les sorciers blessés vers votre campement, dans les bois qui vous entourent, des Vermines ruminent et grondent, espérons qu\'un d\'eux est apte au combat.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_6_STORY1,"Vous vous retrouvez entourés de Vermines, pris au piège! Le campement se trouve quelque lieues derrière les Vermines, vous devriez vous y rendre sans problème, si vous survivez à cet assaut.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_7_STORY1,"L\'Empereur a parlé, les actes de guerre des Orcs sont inacceptables, le Royaume ripostera contre les clans Orcs qui ont brisé le pacte de paix. Comme de fait, les cloches des sentinelles retentissent à travers le campement, annonçant une autre attaque.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_8_STORY1,"Vous guidez vos troupes à travers la vallée, atteignant les terres des Orcs à temps pour voir le soleil se coucher derrière les montagnes. Au loins, vous entendez la cadence chaotique des tambours de guerre; vous étiez attendus. Vous êtes rapidement accuillis par les Généraux Orc et leurs alliés Vermines.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_9_STORY1,"Vous interrogez les Orcs qui ont survécu la bataille, l\'aîné du clan vous raconte leur histoire, trahïs par le shaman Ok\'Than, il échangea la servitude du clan à un puissant Démon contre d\'inimaginables pouvoirs. L\'Empereur doit être mis au courant sans tarder, mais tout d\'abord, assurons-nous que Ok\'Than ne fasse plus de ravages.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_9_STORY2,"Vous et vos forces suivez le chemin tortueux de la montagne et vous vous enfoncez dans un sinistre canyon d\'où émane une étrange lumière. À l\'intérieur, la flore recouvrant les parois s\'est embrasé d\'une flamme sans chaleur, formant un décor irréel. L\'étrange lumière révèle de mystérieuses runes tapissant les façades. Soudainement, la lumière vacille comme une flamme dans le vent.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_9_STORY3,"Vous retournez votre regard distrait vers l\'avant et dans le chemin jadis libre se tient maintenant une armée silencieuse de Vermines, menée par un Orc à dos de cheval. Après les plus longues secondes de votre vie, le shaman vous sourit à pleines dents et laisse échapper un cri à vous glacer le sang.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_1_STORY1,"Plusieurs saisons se sont écoulées depuis la découverte des machinations démoniaques, le Royaume et les pays environnant sont sur le qui-vive, essayant tant bien que mal de se préparer à une invasion.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_1_STORY2,"Votre réputation en tant que Commandant Élite vous précède et les contrées voisines envoient leurs meilleures armées pour se frotter à ceux qui ont vaincu la première vague de Démons.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_2_STORY1,"Coopération entre Orcs et Humains est maintenant chose commune, ils ont prouvé être des combattants hors pairs et des alliés sans reproches.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_3_STORY1,"Les ingénieurs du Royaume ont travaillé sans relâche depuis l\'annonce du retour des démons, perfectionnant leurs machines de guerre afin de repousser les forces du mal. Aujourd\'hui vous affronterez les tout derniers exemples de l\'ingéniosité humaine.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_4_STORY1,"Les ingénieurs n\'ont pas dit leur dernier mot, place aux machines expérimentales.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_5_STORY1,"Aujourd\'hui les pays Nordiques vous défient, des combattants nobles qui ne laissent peu de place à la finesse ou la subtilité.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_6_STORY1,"Vous êtes sur une lancée, gagnant de plus en plus d\'attention des Royaumes plus riches, au point d\'avoir à affronter la cavalerie Royale de certains.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_7_STORY1,"Certain mercenaires sans scrupules voient ici une chance d\'y gagner gloire et célébrité.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_8_STORY1,"Plusieurs clans d\'Orcs ont commencé à reconstruire leur forces en retrait dans les terres, cherchant à assouvir vengeance contre les Démons qui les ont utilisé.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_9_STORY1,"Ne trouvant plus d\'aspirants dignes de ce nom, vous décidez de mettre votre armée a l\'épreuve et d\'affronter l\'armée de l\'Empereur; pour cela, vous devez tout d\'abord vaincre une dernière armée Royale.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_10_STORY1,"L\'Empereur est grandement impressionné par votre progrès sur le champ de bataille. Il vous donne donc l\'opportunité de vous battre contre ses forces.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_1_STORY1,"Les cloches retentissent dans la nuit, pris par suprise en plein sommeil, les villageois s\'éparpillent dans les allées sombres de la ville, cherchant à mettre leurs familles en sécurité. Un jeune garçon tombe dans la foule, séparé des siens, visiblement dépassé par les événements. Vous vous agenouillez et l\'aidez à se redresser, puis lui pointez la voie vers le chateau.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_1_STORY2,"Dans le centre de la ruée se tiennent vous et vos hommes, dirigeant calmement les villageois apeurés vers les zones fortifiées. Une fois la foule dispersée, il ne reste qu\'à afronter les envahisseurs, vous escaladez la tour d\'observation alors que vos hommes se dirigent vers les portes du village.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_2_STORY1,"Vos hommes reprennent leur souffle après la bataille effrenée, mais leur instant de répit ne durera pas. Les corps sans vie des vermines convulsent et se tordent de manière surnaturelle, vous regardez la scène, horrifiés, alors que les charpentes squelettiques des vermines se défont du reste de leur corps, morceaux de chairs par morceaux de chairs.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_2_STORY2,"Avant même que vos troupes n\'aient réassumé une formation défensive, ils font déjà face à une armée complète d\'animations squelettiques, accompagnés de leur nouveaux maîtres.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_3_STORY1,"Les villageois s\'affairent dans les marchés, tentant tant bien que mal de se changer les idées. La plupart restent tout de même calme, se sentant en sécurité avec votre armée protégeant les lieux.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_3_STORY2,"Toutefois, certains semblent agités depuis l\'attaque, comme si une sorte de folie s\'éveilla en eux. Lors d\'un après-midi particulièrement animé, une explosion massive fait trembler les murs de la cité.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_4_STORY1,"Comme si vous n\'aviez pas assez de problèmes avec les forces du mal, maintenant il faut contenir des fauteurs de troubles.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_4_STORY2,"Les captifs restent complètement silencieux lors de leur interrogation, assis dans leurs cellules et dépourvus de toute émotions. Soudainement, sortant de leur stupeur, ils se mettent à rire à l\'unisson comme des lunatiques. Pas même une seconde après, des cris d\'effrois innondent le village; les Vermines ont pénétré les portes.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_5_STORY1,"La place du marché est recouverte de villageois blessés, sans vos hommes les vermines auraient mis à feu et à sang le village entier. Grâce aux douves, le village est hors de danger, pour l\'instant, les victimes sont transportés avec précaution chez les guérisseurs.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_5_STORY2,"Vous supervisez les opérations du haut de la tour d\'observation, en gardant un oeil vigilant vers l\'horizon et les rues, inquiet qu\'une autre attaque frappe.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_5_STORY3,"Vous esquivez de justesse une flèche venant des douves, en vous mettant à couvert vous voyez du coin de l\'oeil une légion de créatures des marécages en sortir unes à unes.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_6_STORY1,"Après une semaine d\'isolation, les ressources du village commencent à se faire rare, ce qui n\'a pas été détruit par l\'attaque des Vermines a dû être utilisé pour remettre les habitants sur pieds. Cela ne peut plus durer.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_6_STORY2,"Cependant, vous et vos troupes n\'avez pas chômé durant la convalescence de vos confrères, des défenses ont été érigées pour protéger la cité sans vous, il sera bientôt temps de mettre le plan d\'attaque en route. Une fois le dernier de vos hommes sur pieds, vous quittez le village en direction de la source des hostilitées.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_7_STORY1,"Plus vous vous approchez de votre destination, plus la nature environnante devient horriblement tordue, comme si la magie utilisée par les démons avait maudit la terre sur laquelle cette jadis majestueuse forêt repose. Les arbres semblent tourmentés, presque souffrant d\'une douleur inqualifiable.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_7_STORY2,"Un inconfort s\'installe, vous avez l\'impression que les arbres vous observent. Qui sait, avec la magie noire des démons, peut-être qu\'ils le font, sinon, à qui appartiennent tout ces yeux?");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_8_STORY1,"Vous réussissez à échapper à la fournaise forestière de justesse mais un attroupement de Mort-Vivants vous coupe le chemin.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_8_STORY2,"Pris au piège!");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_9_STORY1,"L\'armée mort-vivante semble protéger quelque chose, une sorte de crevasse. Vous chargez dans cette direction, tranchant tout ce qui s\'oppose à vous, les créatures offrent peu de résistance initialement mais deviennent de plus en plus coriaces plus vous vous approchez de votre cible.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_9_STORY2,"Après avoir décimé la majorité des forces vous opposant, vous pouvez enfin voir la source de tout ceci. Dans le centre de la crevasse se tient un démon en pleine incantation, une sorte de portail dimensionnel d\'où émergent vermines et morts-vivants. Vous tentez de l\'interrompre mais des chevaliers squelettiques vous bloquent le chemin.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_10_STORY1,"Au moment où le dernier chevalier s\'écroule au sol, l\'air autour de vous semble plus lourd, le démon a changé d\'incantation. Pas même une seconde plus tard vous sentez le sol trembler et entendez des cris distants. Le démon appelle ses morts-vivants à lui, vous n\'avez qu\'une chance pour en finir ou vous serez envahis.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_10_STORY2,"Vos hommes assument la formation offensive et foncent vers le démon espérant interrompre son sort.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_10_STORY3,"Le portail se ferme, mais il est malheureusement trop tard, vous êtes maintenant en présence de bien pire qu\'un simple démon.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_1_STORY1,"Des années se sont écoulés depuis l\'invasion démoniaque raté, le nouveau royaume de Tulora reprend lentement le contrôle sur sa destiné.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_1_STORY2,"Le monde semble plus fractionné que jamais auparavant, de nombreuses confréries émergeantes prennent de l\'ampleur et d\'autres plus anciennes ont un deuxième souffle.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_2_STORY1,"Les démons ont peut-être été bannis de notre monde, mais le portail a laissé derrière lui une marque indélébile, les créatures de la nuit restent et d\'ancienne malédictions refont surface. Les nuits ne sont plus les même.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_3_STORY1,"Des rumeurs de résurrection du Culte de Bax subsistent depuis quelque temps, initialement sous forme de commérage, mais les sources deviennent de plus en plus crédible. L\'empereur craint le pire et vous commissionne d\'enquêter la source des rumeurs.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_3_STORY2,"Vous vous dirigez vers les ruines de Nataobeth, en traversant les marécages vous faite la rencontre de ses habitants.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_4_STORY1,"Les ruines de la ville sont démunies de toute vie, vous et vos hommes venez rapidement à la même conclusion: cette ville est déserte.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_4_STORY2,"Une fois satisfait de vos recherches, vous regroupez vos hommes et préparez votre sortie. Soudainement une troupe de fanatiques vous entoure.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_5_STORY1,"Une lumière incandescente vous aveugle, vous plissez des yeux et croyez entrevoir une silhouette ailée descendre des cieux.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_5_STORY2,"Un son strident vous fait vaciller, la silhouette se fait entendre dans un dialecte qui vous est inconnu, mais vous semblez reconnaître certain mots \'purifier ... humains ...\'");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_6_STORY1,"Devant vous se tient un archange majestueux, il vous informe de la reconstruction en secret d\'Oryth. Le rituel semble corrompre les pensées de ses anges, ils ne voient que le mal en l\'humanité. Ils sont perdus à jamais");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_7_STORY1,"L\'archange révèle un monde caché, une ville vivante... ou presque. Surpris par leur découverte, une bande de fanatiques vous assaille.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_8_STORY1,"Les tremblements culminent dans une explosion spectaculaire, Démons et cultistes émergent des ruines.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_9_STORY1,"Vous atteignez la chambre de rituel, vous y trouvez démons et ange déchus terminant une incantation. Une fois votre présence détectée, ils ne font que grimacer. \'Trop...tard...\'");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_1_STORY1,"Vous vous tenez au centre d’un camp désert, des semaines ce sont écoulées depuis votre premier pas dans ces mystérieux boisés et ce misérable campement est la première forme de civilisation que vous rencontrez.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_1_STORY2,"Alors que vous pillez l’endroit, tentant de trouver un signe d’activité récente, vous réalisez soudainement votre erreur.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_2_STORY1,"Au loin vous entendez les grondements de milliers de créatures, l’armée de Zamaroth prend pied dans notre monde.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_2_STORY2,"Vous approchez à petit-pas la source de la perturbation, l’invasion à bel et bien débuté.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_3_STORY1,"Vous assiégez la capitale des Reptiliens depuis quelques mois maintenant, en attente d’une opportunité en or pour attaquer. Un soir, au couché de soleil, une saillante explosion se fait entendre.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_3_STORY2,"Vous et vos hommes adoptez votre formation de combat, quelque chose se trame chez les Orcs, quelque chose s’en vient.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_4_STORY1,"Des piles de cadavres sont dressées devant vous, des victimes de l’ultime défi d’Aodan. Une brise chaude et humide vous caresse le visage, la mixture de sang et d’huile vous lève le coeur.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_4_STORY2,"Bientôt viendra votre tour, bientôt vous prouverez votre supériorité devant les machines sans âmes, bientôt, la prime sera vôtre.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_5_STORY1,"Des pleurs et cris résonnent à travers la cité. Le Roi est mort, abatu en plein discours. La foule se disperse rapidement dans les allées ne voulant pas devenir la prochaine victime de l’archer invisible.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_5_STORY2,"Vos éclaireurs découvrent une bande de bohémiens aux bords de la forêt, dans la vallée lointaine, pourraient-ils être mêlés à tout ceci? Impossible.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_6_STORY1,"Un spectacle de lumières lugubre recouvre le ciel nocturne au dessus des ruines de Nataobeth, la source de cette magie s’agenouille devant une sombre silhouette.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_6_STORY2,"Le souverain déchu de l’ancienne cité de Nataobeth, Le Roi Yasur, se tient contre son épée alors que de la magie noire est infusée en lui. Une fois le rituel achevé, aucun signe d’humanité ne peut être trouvé dans ses yeux, que des ténèbres.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_7_STORY1,"Une vague de chaleur sans précédent frappe les côtes de Dyn’tur, l’horizon crépite sous le soleil de midi; même les rochers semblent dancer comme des flammes tout en s’approchant de la ville.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_7_STORY2,"Vous fixez les silhouettes abstraite que les mirages forment, presque hypnotisé par leurs mouvements. Le son des cloches vous ramène rapidement à la réalité, l’armée pyromancienne d’Azarathius est aux portes de la cité.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_8_STORY1,"La vague de chaleur magique d’Azarathius a bien dupé les sauvages marin, il a réussi à camoufler vos armées jusqu’aux portes de Dyn’tur. La ville est sous le choc, mais il reste encore un dernier assaut à accomplir.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_8_STORY2,"Soudainement, une meute de soldats émerge des remparts, protégez Azarathius à tout prix, le sort doit être terminé, la cité doit être détruite.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_9_STORY1,"Des semaines se sont écoulés depuis l’élévation d’Oryth, vous avez réussi à contenir les envahisseurs tant bien que mal, mais vos forces fatiguent.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_9_STORY2,"Du renfort arrivera sous peu, demain peut-être, ou le jours suivant, bientôt vous espérez. Au loin vous entendez le galop de chevaux, enfin! Le sentiment de soulagement vous quitte rapidement lorsque vous réalisez que les chevaliers émergent en fait du portail.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_10_STORY1,"Zamaroth garde le gigantesque monolithe alors que diablotins et démons innondent notre monde. La nuit est d’un noir opaque, comme si le portail absorbait la lueur de la lune et des étoiles.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_10_STORY2,"Les forces angélique menées par le commandant suprème Imra’Ilh foncent déjà dans la marée de créatures, vous frayant un chemin vers Zamaroth. L’heure est venue, vous devez accomplir votre tâche. Le futur de l’humanité repose sur vos épaules.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_1_TIPS,"Les pics, lances et autres armes de la sorte attaquent jusqu\'à deux cases devant eux.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_2_TIPS,"Chaque races de créatures ont des pouvoirs et des faiblesses.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_3_TIPS,"Les attaques à distance ont un temps de recharge différent.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_4_TIPS,"Les Sorts prennent un temps d\'incantation considérable.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_5_TIPS,"Comprendre la minuterie est la clé derrière une stratégie gagnante. Espacez vos attaques pour en gaspiller le moins possible.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_6_TIPS,"Les cavaliers utilisent deux cases de jeu, mais sont plus forts qu\'une unité régulière.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_7_TIPS,"Parfois, une seule unité bien équipée peut être plus efficace qu\'une troupe d\'unités standard.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_8_TIPS,"Diversifiez les armures et armes de vos unités pour vous préparer à toute éventualité.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_9_TIPS,"Une fois le tutoriel terminé, vous aurez accès au prochain Acte solo, aux Batailles de classement et à la Boutique de Paquets.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_1,"Changez votre formations fréquemment, essayez de rendre votre armée à toute épreuve!");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_2,"Votre collection affiche tout les items que vous possèdez.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_3,"Vos armées restent activées lorsque vous jouez dans la campagne solo.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_4,"Parfois un Drapeau peut faire toute la différence.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_5,"Une unité prendra X DMG supplémentaire lorsque frappé par un élément dont il est vulnérable.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_6,"Une formation rangée, quoi qu\'efficace, peut être prévisible.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_7,"Apprennez à différencier les items; le savoir c\'est le pouvoir!");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_8,"Certaine créatures sont plus douées pour certaine tâches.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_9,"Votre opposant utilise la même minuterie, anticipez ses attaques!");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_10,"La récompense de recrutement augmente à chaque nouvelle recrue.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_11,"Seules les batailles de classement affectent votre rang.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_12,"Les batailles amicales sont parfaites pour essayer de nouvelles stratégies.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_13,"Une unité est vaincue lorsque ses points de défense atteignent 0.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_14,"Votre Bannière est la seule chose que votre opposant verra avant la bataille.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_15,"Vous pouvez personnaliser votre Bannière dans la fenêtre de ce nom.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_16,"Dans la fenêtre d\'armées, celles activées sont marquées par deux épées sous leur numéro.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_17,"Vous pouvez gagner de l\'Or en terminant la campagne solo.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_18,"Encouragez Berzerk Studio en achetant de l\'Or dans la Boutique d\'Or, c\'est ce qui nous permet de faire des jeux pour vous!");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_19,"Les résistances préviennent X DMG de cet élément à chaque attaques.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_20,"Vous aurez une récompense à chaque jour que vous jouez.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_21,"Certaines armes magiques n\'ont pas de portée maximale!");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_22,"La vitesse de troupe peut changer le court d\'une bataille drastiquement.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_23,"Vous pouvez changer vos formations comme bon vous le semble, ça n\'affectera pas leur classement!");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_24,"Partagez le jeu sur les médias sociaux pour une récompense.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_25,"Vous gagnez de l\'or même lors des défenses de classement.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_26,"N\'oubliez pas de nommer vos unités.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_27,"Si vous avez des questions ou des suggestions, visitez nos forums sur Berzerk-Land.com.");
         LANGUAGE_FR.AddText(ID_RANDOM_TIPS_28,"Le Codex est une excellente source d\'informations sur le monde de Battle Cry!");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_1_ENDSTORY,"Un jeu d\'enfants! Vous avez battu votre opposant en utilisant une simple formation à deux rangs. Le soleil se couchera bientôt, vous et vos hommes vous dirigez vers vos lits alors que l\'équipe vaincue fera la garde nocturne.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_2_ENDSTORY,"Les Orcs ont brisé le traité de paix signé lors de l\'unification, il faut vite en avertir l\'Empereur. Vous envoyez des messagers vers le chateau pendant que vous planifiez la défense du camp.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_3_ENDSTORY,"Bonne défense! Mais ne vous vous réjouissez pas trop vite, c\'est loins d\'être terminé. Vos hommes trouvent un esclave enchainé dans les débris de la bataille, complètement déboussolé, il ne fait que répéter \'Vermines\' sans arrêt.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_4_ENDSTORY,"Vous vous couvrez les narines en contournant les corps des Vermines et pénétrez dans la caverne. Vous y trouvez deux survivants de l\'ordre des Sorciers, ils semblent épuisés mais toujours avec une flamme dans leurs yeux.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_5_ENDSTORY,"Le campement est presque en vue, quelques collines, une clairière et vous y serez, espérons que vos messagers sont arrivés à bon port.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_6_ENDSTORY,"Vous arrivez enfin à votre camp, complètement épuisés. Au loin vous apercevez une demi-douzaine de cavaliers, enfin, du renfort!");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_7_ENDSTORY,"L\'Empereur vous fournit un de ses gardes élite pour engager l\'offensive. Vous réunissez tout les hommes disponibles et commencez à vous enfoncer dans le territoire Orc.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_8_ENDSTORY,"Victoire! Les Orcs vaincus semblent sortir d\'une sorte d\'hypnose, peut-être qu\'il serait sage de les interroger sur la motivation derrière leurs attaques. Quelque chose cloche ici.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_1_9_ENDSTORY,"EndStory EndAct1.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_1_ENDSTORY,"\'Belle bataille!\' vous vous exclamez. Un bel essai de leur part mais ce n\'était pas suffisant pour vaincre vos forces.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_2_ENDSTORY,"Humains et Orcs, côtes à côtes, une force terrifiante. Vous avez réussi à échapper à la défaite cette fois ci mais vous pouvez voir un superbe potentiel pour cette alliance.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_3_ENDSTORY,"Le simple fait de savoir que la prochaine fois que vous rencontrerez ces machines, ils ne seront pas pointées vers vous ou le village que vous protégez, vous réjouis.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_4_ENDSTORY,"Il n\'y a pas de génie sans un grain de folie, ces machines seront une addition parfaite à maintes armées, tant que vous pouvez garder les ingénieurs sous contrôle.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_5_ENDSTORY,"Simple mais efficace. Bien appliquée, une telle stratégie peut avoir du potentiel.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_6_ENDSTORY,"Une victoire impressionnante contre toute attentes, l\'Empereur en entendra parler pour sûr.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_7_ENDSTORY,"Même la meilleure armure du monde peut ne pas être suffisante si vous n\'avez pas une bonne stratégie.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_8_ENDSTORY,"Vaincre les forces des Orcs n\'est pas une simple tâche, vous êtes définitivement la crème de la crème. Peut-être est-il temps de viser plus haut.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_9_ENDSTORY,"Quelle magnifique bataille, les deux camps ont prouvé leur mérite. Les ancients prétendants vous saluent avec respect, vous êtes maintenant prêts à affronter les forces de l\'Empereur.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_2_10_ENDSTORY,"EndStory EndAct2.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_1_ENDSTORY,"Bien du temps s\'est écoulé depuis votre dernière rencontre avec les Vermines, vous devez admettre que vous ne vous étiez pas ennuyés de leur fumet putride.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_2_ENDSTORY,"Vous envoyez des éclaireurs pour vous assurer que d\'autres suprises ne surgissent. Une fois satisfait, vous sonnez la cloche afin de réassurer les villageois.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_3_ENDSTORY,"Beau travail! Vous avez réussi à minimiser les dommages sur le village et avez appréhendé les instigateurs de l\'émeute, il semble s\'agir d\'un culte démoniaque.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_4_ENDSTORY,"Vous remontez le pont-levis et sécurisez la cité, personne n\'y entre ou en quitte sans votre accord.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_5_ENDSTORY,"La ville ne pourra pas tenir bien longtemps comme ça, il vous faut mettre au point un plan offensif.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_6_ENDSTORY,"Les forces du mal grandissent, si vous ne trouvez pas une méthode pour y mettre fin sous peu, il sera peut-être trop tard.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_7_ENDSTORY,"L\'explosion mit à feu la forêt dessèchée, créant un horrible brasier qui s\'étant sur des lieues.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_8_ENDSTORY,"Vous regardez à l\'horizon, vous y voyez des Mort-Vivants à perte de vue.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_9_ENDSTORY,"Vous devez vous dépêcher à interrompre le démon, une autre ronde de créatures vous serait surement fatale.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN1_3_10_ENDSTORY,"EndStory EndAct3.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_1_ENDSTORY,"Les assaillants rebroussent chemin, ils y penseront deux fois avant de vous tester la prochaine fois.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_2_ENDSTORY,"Les maudits fuient dans la nuit, ils ressurgiront un jour, mais pour l\'instant vos sujets sont en sécurité.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_3_ENDSTORY,"Vous forcez les créatures du marécage à fuir et faites votre chemin vers les ruines.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_4_ENDSTORY,"Avant de pouvoir questionner les cultistes restant, vous ressentez une présence surnaturelle.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_5_ENDSTORY,"Une autre escouade d\'anges charge vers vos troupes. Alors que vous vous préparez pour l\'impact vous ressentez un pouvoir incroyable sur vos épaules.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_6_ENDSTORY,"En guise de deuil, l\'archange baisse les yeux devant le massacre. C\'était pour leur bien.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_7_ENDSTORY,"L\'attroupement semblait vouloir protéger les ruines de l\'église, des tremblements se font sentir plus vous vous en approchez.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_8_ENDSTORY,"Des démons! Le rituel Baxien semble arriver à sa fin.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN2_1_9_ENDSTORY,"Alors que vous affligez le coup de grâce au dernier démon, le Monolithe explose laissant s\'échapper une énergie immense. Une dense lumière sombre envahit les corridors des catacombes. \n\nVous vous affaissez, la lumière semble aspirer votre force vitale. Une fois au sol, vous percevez une présence dans la chambre, l\'air devient lourd. \n\nL\'incantation fût un succès, quatre esprits du mal incarné furent relâché dans notre monde.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_1_ENDSTORY,"Un épais nuage de fumé englobe la scène, puis, rien. Aucune trace de vos assaillants.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_2_ENDSTORY,"Vous faites rebrousser chemin aux envahisseurs, mais avant même de pouvoir reprendre votre souffle, vous vous tenez devant une meute infinie de créatures infernale.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_3_ENDSTORY,"Votre défense a réussi à dévier la horde de Reptiliens, ils disparaissent dans les marécages aussi soudainement qu’ils sont apparus.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_4_ENDSTORY,"Vous vous érigez devant l’ingénieur, portant à bout de bras la tête de sa plus grande création. Il vous lance un sac d’or accompagné du plus grand des sourires, vous venez de lui donner une raison de se surpasser.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_5_ENDSTORY,"Vous avez été dupés! Ces sinistre personnages n’étaient pas de vulgaire vagabonds, vous les suivez du mieux que vous le pouvez mais les perdez dans la forêt.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_6_ENDSTORY,"La petite armée de créatures mort-vivante s’affaisse à vos pieds, mais le nécromancien ne faisait que commencer, il serait sage de vous enfuir avant de rejoindre ses rangs...");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_7_ENDSTORY,"La magie d’Azarathius est terrifiante, la ville succombera à une autre attaque pour sûr, le conseil envoie une troupe de guérriers en guise de distraction afin de terminer l’incantation du sort de protection.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_8_ENDSTORY,"Vous avez défendu le magicien avec brio, lui gagnant assez de temps pour terminer l’incantation. Une immense boule de feu est lancée en direction de la cité et explose au contact, il semble que Dyn’tur n’est plus, désintégré sans même y laisser de cendre.");
         LANGUAGE_FR.AddText(ID_CAMPAIGN3_1_9_ENDSTORY,"Le monolithe est assez puissant pour invoquer des créatures bien plus menaceante qu\'auparavant. Vous ne pourrez plus tenir bien longtemps, la prière semble commencer à être une option.");
         LANGUAGE_FR.AddText(ID_CHAPTER1_NAME,"Ascension d\'un Héro");
         LANGUAGE_FR.AddText(ID_CHAPTER2_NAME,"Cendres de Berhyte");
         LANGUAGE_FR.AddText(ID_CHAPTER3_NAME,"L’âge des Mythes");
         LANGUAGE_FR.AddText(ID_CHAPTER2_1_NAME,"2 - Chapter 1");
         LANGUAGE_FR.AddText(ID_CHAPTER2_2_NAME,"2 - Chapter 2");
         LANGUAGE_FR.AddText(ID_CHAPTER2_3_NAME,"2 - Chapter 3");
         LANGUAGE_FR.AddText(ID_CHAPTER3_1_NAME,"3 - Chapter 1");
         LANGUAGE_FR.AddText(ID_CHAPTER3_2_NAME,"3 - Chapter 2");
         LANGUAGE_FR.AddText(ID_CHAPTER3_3_NAME,"3 - Chapter 3");
         LANGUAGE_FR.AddText(ID_ALL_ARMY_EMPTY,"Toutes vos armées sont vides, vous devez en avoir au moins 1 avec des unités pour pouvoir combattre!");
         LANGUAGE_FR.AddText(ID_CANT_ACTIVATE,"Problème de connection multi-joueur, Impossible d\'activer votre armée.");
         LANGUAGE_FR.AddText(ID_ALREADY_ACTIVATED,"Votre armée est déjà activée.");
         LANGUAGE_FR.AddText(ID_SET_PRIME,"Ascension");
         LANGUAGE_FR.AddText(ID_SET_EXPANSION1,"Cendres");
         LANGUAGE_FR.AddText(ID_SET_MYTHIC,"Mythique");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_1,"CONCURRENT BOISÉ");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_2,"RIVAL BOISÉ");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_3,"VÉTÉRAN BOISÉ");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_4,"CONCURRENT D\'ACIER");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_5,"RIVAL D\'ACIER");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_6,"VETERAN D\'ACIER");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_7,"CONCURRENT CUIVRÉ");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_8,"RIVAL CUIVRÉ");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_9,"VÉTÉRAN CUIVRÉ");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_10,"CONCURRENT ARGENTÉ");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_11,"RIVAL ARGENTÉ");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_12,"VÉTÉRAN ARGENTÉ");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_13,"CONCURRENT DORÉ");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_14,"RIVAL DORÉ");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_15,"VÉTÉRAN DORÉ");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_16,"CONCURRENT DE PLATINE");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_17,"RIVAL DE PLATINE");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_18,"VÉTÉRAN DE PLATINE");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_19,"CHAMPION");
         LANGUAGE_FR.AddText(ID_MULTIPLAYER_RANK_NAME_20,"LÉGENDE");
         LANGUAGE_FR.AddText(ID_RELOAD_TIME_TXT,"RECHARGE :");
         LANGUAGE_FR.AddText(ID_CASTING_TIME_TXT,"TEMPS D\'INCANTATION :");
         LANGUAGE_FR.AddText(ID_PRIME_STONE_BOOSTER,"Premium de Pierre");
         LANGUAGE_FR.AddText(ID_PRIME_STONE_STARTER,"Recharge de Pierre");
         LANGUAGE_FR.AddText(ID_PRIME_IRON_BOOSTER,"Premium de Fer");
         LANGUAGE_FR.AddText(ID_PRIME_IRON_STARTER,"Recharge de Fer");
         LANGUAGE_FR.AddText(ID_PRIME_STEEL_BOOSTER,"Premium d\'Acier");
         LANGUAGE_FR.AddText(ID_PRIME_STEEL_STARTER,"Recharge d\'Acier");
         LANGUAGE_FR.AddText(ID_PRIME_GOLD_BOOSTER,"Premium en Or");
         LANGUAGE_FR.AddText(ID_RARE_DAILY_REWARD_1,"Daily Reward");
         LANGUAGE_FR.AddText(ID_RARE_DAILY_REWARD_2,"Rare");
         LANGUAGE_FR.AddText(ID_ALL_SET,"- TOUT -");
         LANGUAGE_FR.AddText(ID_PRIME_SET_1,"- HÉROS -");
         LANGUAGE_FR.AddText(ID_EXPANSION_SET_1,"- CENDRES -");
         LANGUAGE_FR.AddText(ID_DAILY_PACK,"Groupe Journalié");
         LANGUAGE_FR.AddText(ID_WEEKLY_PACK,"Groupe Hebdomadaire");
         LANGUAGE_FR.AddText(ID_AUTO_RANK_0,"RANG");
         LANGUAGE_FR.AddText(ID_AUTO____0,"20");
         LANGUAGE_FR.AddText(ID_AUTO____1,"21");
         LANGUAGE_FR.AddText(ID_AUTO____2,"22");
         LANGUAGE_FR.AddText(ID_AUTO____3,"23");
         LANGUAGE_FR.AddText(ID_AUTO_____0,"00:");
         LANGUAGE_FR.AddText(ID_AUTO_REFRESH_0,"ACTUALISER LES RÉSULTATS");
         LANGUAGE_FR.AddText(ID_AUTO_LOSSES_0,"DÉFAITES");
         LANGUAGE_FR.AddText(ID_AUTO_WINS_0,"VICTOIRES");
         LANGUAGE_FR.AddText(ID_AUTO_DRAWS_0,"NULLES");
         LANGUAGE_FR.AddText(ID_AUTO_ACTIVATE_0,"Active ton armée pour faire des batailles de classement.");
         LANGUAGE_FR.AddText(ID_AUTO_DEACTIVATE_0,"Désactiver pour cesser les batailles de classement.");
         LANGUAGE_FR.AddText(ID_AUTO_BATTLE_0,"CONSEILLÈRE VAL\'BERT");
         LANGUAGE_FR.AddText(ID_AUTO_YOUR_0,"Your Gaming Life, Simplified.");
         LANGUAGE_FR.AddText(ID_AUTO_YOUR_1,"L\'ARMÉE DE VOTRE AMI");
         LANGUAGE_FR.AddText(ID_AUTO_SELECT_0,"SÉLECTIONNE L\'ARMÉE DE VOTRE AMI");
         LANGUAGE_FR.AddText(ID_AUTO_YOUR_2,"TON ARMÉE");
         LANGUAGE_FR.AddText(ID_AUTO_SELECT_1,"SÉLECTIONNE TON ARMÉE");
         LANGUAGE_FR.AddText(ID_AUTO_GOOD_0,"Sir! Nous devrions utiliser les GUENILLES qui trainent dans nos coffres, elles devraient nous donner un coup de pouce.\n\nAllons revoir notre plan de formation.");
         LANGUAGE_FR.AddText(ID_AUTO_THIS_0,"Voici votre LIVRE DE STRATEGIES.\n\nPour commencer, selectionnez une unité. ");
         LANGUAGE_FR.AddText(ID_AUTO_ONCE_0,"Une fois sélectionné, vous pouvez changer son équipement.");
         LANGUAGE_FR.AddText(ID_AUTO_HERE_0,"Ici vous avez l\'unité en question et ses statistiques.");
         LANGUAGE_FR.AddText(ID_AUTO_PICK_0,"Prennez une GUENILLE de votre inventaire et assignez la comme ARMURE.");
         LANGUAGE_FR.AddText(ID_AUTO_AS_0,"Comme vous pouvez le voir, les unités portant des GUENILLES sont plus resistantes contre les attaques Perçante.\nMais elles coutent plus cher à déployer.");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_0,"Vous pouvez maintenant SAUVEGARDER. ");
         LANGUAGE_FR.AddText(ID_AUTO_ASSIGN_0,"Créez en autant que vous le pouvez et appuyez sur OK.");
         LANGUAGE_FR.AddText(ID_AUTO_WHEN_0,"Lorsqu\'une modification est apportée à une unité, elle est retirée du plan de bataille.");
         LANGUAGE_FR.AddText(ID_AUTO_TO_0,"Pour déployer une unité vous pouvez simplement la glisser sur le dit plan\n\nou en cliquant à l\'endroit où vous la voulez en tenant la touche CTRL enfoncée.");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_1,"La vitesse d\'une troupe peut changer le cours d\'une bataille drastiquement. Les unités qui attaquent à distance préfèrent rester en place, alors que les épéistes voudront aller plus vite.");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_2,"Allez maintenant mettre des GUENILLES sur vos autres unités, mais dépêchez vous!");
         LANGUAGE_FR.AddText(ID_AUTO_GOOD_1,"Bien joué!\nEn terminant le premier Acte vous avez déverrouillé de nouveaux menus! Vous pouvez accèder au Champ de Bataille en ligne, changer votre Bannière et utiliser l\'Or amassé dans la Boutique de Paquets. ");
         LANGUAGE_FR.AddText(ID_AUTO_HERE_1,"Voici la Boutique de Paquets, ici vous pouvez vous procurer de nouveaux items en achetant différents paquets, selon vos besoins et moyens.");
         LANGUAGE_FR.AddText(ID_AUTO_G_DAY_0,"Bonjour Sir, bienvenue sur le Champ de Batailles!\n\nFamiliarisons-nous avec les commandes de bases.");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_3,"Vous pouvez controler la vitesse de déroulement à l\'aide des boutons de vitesse.");
         LANGUAGE_FR.AddText(ID_AUTO_IN_0,"Au centre se trouve la minuterie.\n\nElle vous aidera à planifier vos attaques.");
         LANGUAGE_FR.AddText(ID_AUTO_ONCE_1,"Une fois que vous aurez terminé d\'étudier la situation, déclanchez la bataille.");
         LANGUAGE_FR.AddText(ID_AUTO_SIR__0,"Nous aurons besoin d\'une plus grande armée pour contrer la prochaine attaque, Sir.\n\nRetournons au livre de stratégie.");
         LANGUAGE_FR.AddText(ID_AUTO_THIS_1,"Cette fois ci, nous allons créer une unité.");
         LANGUAGE_FR.AddText(ID_AUTO_PICK_1,"Prenez un de nos Hommes libres et mettez le dans la fenêtre d\'unités.");
         LANGUAGE_FR.AddText(ID_AUTO_NOW_0,"Ensuite donnez lui un des Arcs de nos coffres.");
         LANGUAGE_FR.AddText(ID_AUTO_BOWS_0,"Les Arcs ont une plus grande portée que les dagues et les pics.");
         LANGUAGE_FR.AddText(ID_AUTO_GIVE_0,"Nommez votre unité \n\nSauvegardez votre unité.");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_4,"Le nombre d\'unités que vous pouvez créer est limité par le nombre de ressources dont vous avez le moins. Pour l\'instant, créons 6 Chevaliers.");
         LANGUAGE_FR.AddText(ID_AUTO_SELECT_2,"Selectionnez vos Archers et déployez les sur le plan de bataille.\n\nIls attaquent à distance alors mettez les à l\'arrière.");
         LANGUAGE_FR.AddText(ID_AUTO_THAT_0,"Ça devrait être suffisant pour l\'instant.\n\nDépêchez vous, les Orcs arrivent!");
         LANGUAGE_FR.AddText(ID_AUTO_ONE_0,"Un des Sorciers semble apte au combat, allons le préparer.");
         LANGUAGE_FR.AddText(ID_AUTO_LIKE_0,"Comme dans le cas des archers, allons en mode création.");
         LANGUAGE_FR.AddText(ID_AUTO_SELECT_3,"Selectionnez le.");
         LANGUAGE_FR.AddText(ID_AUTO_NOW_1,"Ensuite donnez lui un Bâton de Sorcier.");
         LANGUAGE_FR.AddText(ID_AUTO_LIKE_1,"Les sorts des Sorciers ont une grande portée et cause beaucoup de DMG Élémentaire, mais prennent plus de temps à lancer.");
         LANGUAGE_FR.AddText(ID_AUTO_NAME_0,"Nommez votre nouveau Sorcier et sauvegardez.");
         LANGUAGE_FR.AddText(ID_AUTO_YOUR_3,"Vous n\'avez qu\'un seul Sorcier apte au combat pour l\'instant.");
         LANGUAGE_FR.AddText(ID_AUTO_SELECT_4,"Selectionnez votre Sorcier et placez le le plus loin possible.\n\nVous avez besoin qu\'il survive assez longtemps pour finir de lancer sa magie.");
         LANGUAGE_FR.AddText(ID_AUTO_THAT_1,"Bon travail, retournons au combat!");
         LANGUAGE_FR.AddText(ID_AUTO_WELCOME_0,"Bienvenue au CHAMP DE BATAILLES, Sir!");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_5,"À partir de maintenant, vous pouvez créer jusqu\'à quatre armées différentes utilisant la même collection.");
         LANGUAGE_FR.AddText(ID_AUTO_ONCE_2,"Une fois au point, vous pouvez activer votre armée pour des batailles de classement.");
         LANGUAGE_FR.AddText(ID_AUTO_AS_1,"Tant qu\'elle sera activée, votre armée défendra son classement par elle même, pas besoin d\'y être.");
         LANGUAGE_FR.AddText(ID_AUTO_CHALLENGING_0,"Vous pouvez tenter des batailles de classement en appuyant sur le bouton BATAILLE CLASSÉE");
         LANGUAGE_FR.AddText(ID_AUTO_EVERY_0,"Toute les batailles classées affecterons le rang de votre armée. ");
         LANGUAGE_FR.AddText(ID_AUTO_EVERY_1,"Chacunes de vos armées ont un rang et des statistiques individuelles.");
         LANGUAGE_FR.AddText(ID_AUTO___0,"-");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_6,"Vous pouvez aussi vérifier votre placement dans le CLASSEMENT en appuyant sur le bouton de ce nom.");
         LANGUAGE_FR.AddText(ID_AUTO_EVERY_2,"Chaque VICTOIRE vous donne 1pt.\n\nAlors qu\'une DÉFAITE vous coutera 1pt.");
         LANGUAGE_FR.AddText(ID_AUTO_REMEMBER_0,"N\'oubliez pas que votre RANG sera aussi affecté lorsque vos armées se défendent.\n\n-> Ne laissez pas une armée inachevée activée!");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_7,"Vous pouvez aussi engager dans des batailles amicales,  une bonne méthode de gagner de l\'Or!");
         LANGUAGE_FR.AddText(ID_AUTO_NOW_2,"Il ne reste qu\'à vous d\'ériger vos armées, apprendre de nouvelles stratégies et d\'accumuler de nouvelles ressources.\n\nBonne Chance!");
         LANGUAGE_FR.AddText(ID_AUTO_SIR__1,"Sir! Cet homme n\'est peut-être pas formé pour le combat, mais il pourrait tout de même nous aider.\n\nVoyons voir ce que nous avons à notre disposition.");
         LANGUAGE_FR.AddText(ID_AUTO_ONCE_3,"Encore une fois, allons créer une nouvelle unité.");
         LANGUAGE_FR.AddText(ID_AUTO_ONCE_4,"Encore une fois, allons créer une nouvelle unité.");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_8,"Deux choix s\'offre à vous : donnez lui un ARC ou un DRAPEAU.\n\nCe drapeau donne +2 d\'attaque de FEU aux unités dans la troupe.");
         LANGUAGE_FR.AddText(ID_AUTO____4," +2");
         LANGUAGE_FR.AddText(ID_AUTO_SIR__2,"Sir! Le deuxième Sorcier a repris des forces, il serait sage de l\'ajouter à nos forces, les vermines sont de plus en plus nombreuses.");
         LANGUAGE_FR.AddText(ID_AUTO_AS_2,"Comme les dernières fois, entrez le mode CRÉATION.");
         LANGUAGE_FR.AddText(ID_AUTO_THESE_0,"Ce Sorcier est équippé d\'un anneau. Cet objet change la vitesse d\'Incantation des sorts.");
         LANGUAGE_FR.AddText(ID_AUTO_DON_T_0,"Noubliez pas de donner le deuxième Anneau à votre premier Sorcier!");
         LANGUAGE_FR.AddText(ID_AUTO_HOLD_0,"TENIR CTRL");
         LANGUAGE_FR.AddText(ID_AUTO_UPON_0,"À l\'instant où vos hommes infligent le coup de grâce au Démon-Orc, la montagne au grand complet se met a trembler et s\'éffriter, comme si son existence dépendait de la créature. Vous fuyez tous le canyon et déferlez le chemin descendant la montagne. Une fois dans la vallée, tous retournent leurs regards vers les cieux, observant la montagne magique exploser dans la nuit en un spectacle de lumières. Vous tentez tant bien que mal de vous joindre aux célébrations mais les dernières paroles du démon hantent vos pensées.\n\n\"Je n\'étais que le commencement\"\n\nVous et vos troupes débutez le long voyage de retour vers le Royaume de l\'Empereur, les bardes chanteront votre victoire pour des siècles à venir.");
         LANGUAGE_FR.AddText(ID_AUTO_THE_0,"L\'Empereur est stupéfait devant sa défaite, il voyait un grand commandant de guerre en vous, mais jamais il n\'aurait prédit que vous pourriez le vaincre, du moins, pas si tôt dans votre carrière.\nC\'est une bonne surprise cependant. Il est heureux d\'avoir un allié de ce calibre, les forces du mal n\'ont qu\'à bien se tenir.\n\nVotre victoire lui donne confiance; vous et les autres commandants avez prouvé qu\'il ne sera pas seul dans la bataille à venir.\n\nIl vous donne donc les rênes de la défense du Royaume dans la bataille contre les Démons, notre destiné repose dans vos mains. ");
         LANGUAGE_FR.AddText(ID_AUTO_UPON_1,"Un silence complet engouffre les lieux, pas même un soupir se fait entendre, vous fixez tous les corps impies flétrir en une masse putride.\n\nLe cauchemar se termine enfin.\n\nVous vous retournez brusquement en criant pour alerter vos hommes, vous rappelant soudainement l\'appel du démon pour ses guérriers, mais pas un seul d\'eux à l\'horizon, comme s\'ils avaient simplement cessés d\'exister dans ce monde.\n\nAlors que les dernier figments des restants Démoniaque se désintègrent, le soleil se lève à nouveau et vous pouvez discerner des chants d\'oiseaux au loins briser le silence.\n\nLe Royaume et ses habitants sont de nouveau en paix, grâce à vous.");
         LANGUAGE_FR.AddText(ID_AUTO___1,"- ACTE 2 -\n- CLASSEMENT -\n- BOUTIQUE DE PAQUETS -");
         LANGUAGE_FR.AddText(ID_AUTO_CONGRATULATIONS_0,"FÉLICITATIONS");
         LANGUAGE_FR.AddText(ID_AUTO_ARE_0,"SONT DISPONIBLES!");
         LANGUAGE_FR.AddText(ID_AUTO___2,"- ACTE 3 -");
         LANGUAGE_FR.AddText(ID_AUTO_IS_0,"EST DISPONIBLE!");
         LANGUAGE_FR.AddText(ID_AUTO_CHAPTER_0,"1er CHAPITRE TERMINÉ!");
         LANGUAGE_FR.AddText(ID_AUTO___3,"/");
         LANGUAGE_FR.AddText(ID_AUTO_TOMORROW_0,"DEMAIN");
         LANGUAGE_FR.AddText(ID_AUTO_TODAY_0,"AUJOURD\'HUI");
         LANGUAGE_FR.AddText(ID_AUTO_DAILY_0,"RÉCOMPENSE DU JOUR");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_9,"UNE NOUVELLE RÉCOMPENSE À CHAQUE JOURS");
         LANGUAGE_FR.AddText(ID_AUTO_ON_0,"En plus des fonctionnalités du jeu hors-ligne, jouer sur nos serveurs inclu:");
         LANGUAGE_FR.AddText(ID_AUTO_COLLECT_0,"Les Récompenses Quotidiennes.");
         LANGUAGE_FR.AddText(ID_AUTO_OFFLINE_0,"Jouer hors-ligne inclu :");
         LANGUAGE_FR.AddText(ID_AUTO_COMPETE_0,"Les Batailles de Classement.");
         LANGUAGE_FR.AddText(ID_AUTO_COMPETE_1,"Batailles Amicale.");
         LANGUAGE_FR.AddText(ID_AUTO_SAVE_0,"Sauvegarde ta partie sur nos serveurs pour jouer partout dans le monde.");
         LANGUAGE_FR.AddText(ID_AUTO_COMPLETE_0,"La campagne solo.");
         LANGUAGE_FR.AddText(ID_AUTO_ACCESS_0,"Fonctionalités de Base.");
         LANGUAGE_FR.AddText(ID_AUTO_OFFLINE_1,"HORS-LIGNE");
         LANGUAGE_FR.AddText(ID_AUTO_ONLINE_0,"EN LIGNE");
         LANGUAGE_FR.AddText(ID_AUTO_GAME_0,"CONFIGURATION");
         LANGUAGE_FR.AddText(ID_AUTO_GAME_1,"Progrès de jeu sauvegardé localement.");
         LANGUAGE_FR.AddText(ID_AUTO_TO_1,"Tu dois te connecter à nos serveurs pour créer une armée! Cela te permettra de:");
         LANGUAGE_FR.AddText(ID_AUTO_BEFORE_0,"AVANT DE DÉBUTER");
         LANGUAGE_FR.AddText(ID_AUTO_ENLISTMENT_0,"ENRÔLEMENT");
         LANGUAGE_FR.AddText(ID_AUTO_CAMPAIGN_0,"CAMPAGNE");
         LANGUAGE_FR.AddText(ID_AUTO_CHAPTER_1,"CHAPITRE");
         LANGUAGE_FR.AddText(ID_AUTO_CREATURES_0,"CRÉATURES");
         LANGUAGE_FR.AddText(ID_AUTO_ITEMS_0,"ITEMS");
         LANGUAGE_FR.AddText(ID_AUTO_PRIME_0,"HEROES");
         LANGUAGE_FR.AddText(ID_AUTO_EXPANSION_0,"CENDRES");
         LANGUAGE_FR.AddText(ID_AUTO_EXPANSION_1,"MYTHES");
         LANGUAGE_FR.AddText(ID_AUTO_STONE_0,"PIERRE");
         LANGUAGE_FR.AddText(ID_AUTO_BOOSTER_0,"PREMIUM");
         LANGUAGE_FR.AddText(ID_AUTO_STARTER_0,"RECHARGE");
         LANGUAGE_FR.AddText(ID_AUTO_IRON_0,"FER");
         LANGUAGE_FR.AddText(ID_AUTO_STEEL_0,"ACIER");
         LANGUAGE_FR.AddText(ID_AUTO_GOLD_0,"OR");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_10,"VOUS ÊTES MAINTENANT ");
         LANGUAGE_FR.AddText(ID_AUTO_CHANGING_0,"CHANGEMENT DE RANG");
         LANGUAGE_FR.AddText(ID_AUTO_CURRENT_0,"Rang Présent : ");
         LANGUAGE_FR.AddText(ID_AUTO_YOUR_4,"TON ARMÉE");
         LANGUAGE_FR.AddText(ID_AUTO_CHALLENGES_0,"TE DÉFIE!");
         LANGUAGE_FR.AddText(ID_AUTO_COMMON_0,"COMMUN");
         LANGUAGE_FR.AddText(ID_AUTO_UNCOMMON_0,"SUPÉRIEUR");
         LANGUAGE_FR.AddText(ID_AUTO_RARE_0,"RARE");
         LANGUAGE_FR.AddText(ID_AUTO_LEGENDARY_0,"LÉGENDAIRE");
         LANGUAGE_FR.AddText(ID_AUTO_VS_0,"VS");
         LANGUAGE_FR.AddText(ID_AUTO_MATCH_0,"INFO DE BATAILLE");
         LANGUAGE_FR.AddText(ID_AUTO_BATTLEFIELD_0,"BATAILLE");
         LANGUAGE_FR.AddText(ID_AUTO_FRIENDS_0,"AMIS");
         LANGUAGE_FR.AddText(ID_AUTO_INVITE_0,"Invite tes amis à Battle Cry!");
         LANGUAGE_FR.AddText(ID_AUTO_FRIEND_0,"LISTE D\'AMIS");
         LANGUAGE_FR.AddText(ID_AUTO_ON_1,"on grey btn");
         LANGUAGE_FR.AddText(ID_AUTO_CASH_0,"cash");
         LANGUAGE_FR.AddText(ID_AUTO_ON_2,"on beige and green btn");
         LANGUAGE_FR.AddText(ID_AUTO_THE_1,"La prochaine recrue te rapportera:");
         LANGUAGE_FR.AddText(ID_AUTO_PACKS_0,"PAQUETS ");
         LANGUAGE_FR.AddText(ID_AUTO_NEW_0,"CENDRES DE BERHYTE BIENTÔT DISPONIBLE...");
         LANGUAGE_FR.AddText(ID_AUTO_COLLECTION_0,"COLLECTION");
         LANGUAGE_FR.AddText(ID_AUTO_OPTIONS_0,"OPTIONS");
         LANGUAGE_FR.AddText(ID_AUTO_SOUND_0,"SONS");
         LANGUAGE_FR.AddText(ID_AUTO_MUSIC_0,"MUSIQUE");
         LANGUAGE_FR.AddText(ID_AUTO_QUALITY_0,"QUALITÉ");
         LANGUAGE_FR.AddText(ID_AUTO_CODEX_0,"CODEX");
         LANGUAGE_FR.AddText(ID_AUTO_LANGUAGE_0,"LANGUE");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_11,"Le Codex est rempli d\'histoires sur les races et évènements du monde de Battle Cry.");
         LANGUAGE_FR.AddText(ID_AUTO_FLAG_0,"BANNIÈRE");
         LANGUAGE_FR.AddText(ID_AUTO_SYMBOLS_0,"SYMBOLES");
         LANGUAGE_FR.AddText(ID_AUTO_SHAPES_0,"FORMES");
         LANGUAGE_FR.AddText(ID_AUTO_BACKGROUNDS_0,"FONDS");
         LANGUAGE_FR.AddText(ID_AUTO_UNITS_0,"UNITÉS");
         LANGUAGE_FR.AddText(ID_AUTO_ARMIES_0,"ARMÉES");
         LANGUAGE_FR.AddText(ID_AUTO_REMAINING_0,"points restants");
         LANGUAGE_FR.AddText(ID_AUTO_SPEED_0,"VITESSE");
         LANGUAGE_FR.AddText(ID_AUTO_HOST_0,"HÉBERGE");
         LANGUAGE_FR.AddText(ID_AUTO_MORE_0,"AUTRES JEUX");
         LANGUAGE_FR.AddText(ID_AUTO_CREDITS_0,"CRÉDITS");
         LANGUAGE_FR.AddText(ID_AUTO__TIENNE_0,"ÉTIENNE JEAN");
         LANGUAGE_FR.AddText(ID_AUTO_VINCENT_0,"VINCENT LONGPRÉ");
         LANGUAGE_FR.AddText(ID_AUTO___4,"- Game Design -");
         LANGUAGE_FR.AddText(ID_AUTO___5,"- Art & Director -");
         LANGUAGE_FR.AddText(ID_AUTO___6,"- Programming -");
         LANGUAGE_FR.AddText(ID_AUTO__TIENNE_1,"ÉTIENNE BÉDARD");
         LANGUAGE_FR.AddText(ID_AUTO___7,"- Interface Designer -");
         LANGUAGE_FR.AddText(ID_AUTO__MILIE_0,"ÉMILIE BOURGET");
         LANGUAGE_FR.AddText(ID_AUTO___8,"- Music -");
         LANGUAGE_FR.AddText(ID_AUTO_GINETTE_0,"WISEGUY ENTERTAINEMENT\nBYORN LYNNE\nPIERRE GERWIG LANGER");
         LANGUAGE_FR.AddText(ID_AUTO_A_0,"Une production de Berzerk Studio");
         LANGUAGE_FR.AddText(ID_AUTO___9,"1");
         LANGUAGE_FR.AddText(ID_AUTO_X_0,"x");
         LANGUAGE_FR.AddText(ID_AUTO___10,"2");
         LANGUAGE_FR.AddText(ID_AUTO_SKIP_0,"SAUTE");
         LANGUAGE_FR.AddText(ID_AUTO_WIN_0,"TRICHE");
         LANGUAGE_FR.AddText(ID_AUTO_POINTS_0,"points");
         LANGUAGE_FR.AddText(ID_AUTO_CREATE_0,"CRÉER");
         LANGUAGE_FR.AddText(ID_AUTO_EDIT_0,"MODIFIER");
         LANGUAGE_FR.AddText(ID_AUTO_AMOUNT_0,"QUANTITÉ D\'UNITÉS");
         LANGUAGE_FR.AddText(ID_AUTO_SHIELD_0,"BOUCLIER");
         LANGUAGE_FR.AddText(ID_AUTO_ARMOR_0,"ARMURE");
         LANGUAGE_FR.AddText(ID_AUTO_CREATURE_0,"CRÉATURE");
         LANGUAGE_FR.AddText(ID_AUTO_SPECIAL_0,"SPÉCIAL");
         LANGUAGE_FR.AddText(ID_AUTO_WEAPON_0,"ARME");
         LANGUAGE_FR.AddText(ID_AUTO_UNIT_0,"nom d\'unité");
         LANGUAGE_FR.AddText(ID_AUTO_HOW_0,"Combien de cette unité veux-tu créer?");
         LANGUAGE_FR.AddText(ID_AUTO_RANGE_0,"Portée");
         LANGUAGE_FR.AddText(ID_AUTO_ATTACK_0,"Attaque");
         LANGUAGE_FR.AddText(ID_AUTO_DEFENSE_0,"Défense");
         LANGUAGE_FR.AddText(ID_AUTO_RESIST_0,"Résistance");
         LANGUAGE_FR.AddText(ID_AUTO_UNIT_1,"UNITÉ");
         LANGUAGE_FR.AddText(ID_AUTO_POINTS_1,"points utilisés");
         LANGUAGE_FR.AddText(ID_AUTO_NAME_1,"NOM D\'UNITÉ");
         LANGUAGE_FR.AddText(ID_AUTO_SPECIALS_0,"SPÉCIAL");
         LANGUAGE_FR.AddText(ID_AUTO_ARMORS_0,"ARMURE");
         LANGUAGE_FR.AddText(ID_AUTO_SHIELDS_0,"BOUCLIER");
         LANGUAGE_FR.AddText(ID_AUTO_WEAPONS_0,"ARME");
         LANGUAGE_FR.AddText(ID_AUTO_ALL_0,"TOUT");
         LANGUAGE_FR.AddText(ID_AUTO_BACK_0,"RETOUR AU MENU PRINCIPAL");
         LANGUAGE_FR.AddText(ID_AUTO_SHOW_0,"CLASSEMENT");
         LANGUAGE_FR.AddText(ID_AUTO_RANKED_0,"BATAILLE CLASSÉE");
         LANGUAGE_FR.AddText(ID_AUTO_TUTORIAL_0,"TUTORIEL");
         LANGUAGE_FR.AddText(ID_AUTO_UNEQUIP_0,"RETIRE TOUT");
         LANGUAGE_FR.AddText(ID_AUTO_LOW_0,"BAS");
         LANGUAGE_FR.AddText(ID_AUTO_MEDIUM_0,"MOYEN");
         LANGUAGE_FR.AddText(ID_AUTO_HIGH_0,"HAUT");
         LANGUAGE_FR.AddText(ID_AUTO_RESET_0,"RESET");
         LANGUAGE_FR.AddText(ID_AUTO_FIGHT_0,"COMBAT");
         LANGUAGE_FR.AddText(ID_AUTO_DELETE_0,"EFFACER");
         LANGUAGE_FR.AddText(ID_AUTO_DONE_0,"TERMINÉ");
         LANGUAGE_FR.AddText(ID_AUTO_LINK_0,"PARTAGE");
         LANGUAGE_FR.AddText(ID_AUTO_FLAG_1,"BANNIÈRE");
         LANGUAGE_FR.AddText(ID_AUTO_COMPLETE_1,"TERMINE L\'ACTE 1 POUR DÉVERROUILLER ");
         LANGUAGE_FR.AddText(ID_AUTO_APPARAIT_0,"apparait en over");
         LANGUAGE_FR.AddText(ID_AUTO_BUY_0,"ACHAT");
         LANGUAGE_FR.AddText(ID_AUTO_SAVING_0,"SAVING");
         LANGUAGE_FR.AddText(ID_AUTO___11,".");
         LANGUAGE_FR.AddText(ID_AUTO____5,"..");
         LANGUAGE_FR.AddText(ID_AUTO_____1,"...");
         LANGUAGE_FR.AddText(ID_AUTO_SEARCHING_ENEMY_0,"RECHERCHE\nBATAILLE");
         LANGUAGE_FR.AddText(ID_AUTO_SHARING_0,"Partage sur\nFacebook");
         LANGUAGE_FR.AddText(ID_AUTO_LOADING_0,"LOADING");
         LANGUAGE_FR.AddText(ID_AUTO_REGISTERING_0,"REGISTERING DATA");
         LANGUAGE_FR.AddText(ID_AUTO_CONNECTING_0,"CONNEXION MULTI-JOUEUR");
         LANGUAGE_FR.AddText(ID_AUTO_SHARE_0,"PARTAGE CE LIEN: ");
         LANGUAGE_FR.AddText(ID_AUTO_INVITE_1,"INVITE");
         LANGUAGE_FR.AddText(ID_AUTO_YES_0,"OUI");
         LANGUAGE_FR.AddText(ID_AUTO_NO_0,"NON");
         LANGUAGE_FR.AddText(ID_AUTO___12,"0");
         LANGUAGE_FR.AddText(ID_AUTO___13,"4");
         LANGUAGE_FR.AddText(ID_AUTO___14,"3");
         LANGUAGE_FR.AddText(ID_AUTO___15,"6");
         LANGUAGE_FR.AddText(ID_AUTO___16,"5");
         LANGUAGE_FR.AddText(ID_AUTO___17,"8");
         LANGUAGE_FR.AddText(ID_AUTO___18,"7");
         LANGUAGE_FR.AddText(ID_AUTO____6,"10");
         LANGUAGE_FR.AddText(ID_AUTO___19,"9");
         LANGUAGE_FR.AddText(ID_AUTO____7,"-9");
         LANGUAGE_FR.AddText(ID_AUTO_____2,"-10");
         LANGUAGE_FR.AddText(ID_AUTO____8,"-7");
         LANGUAGE_FR.AddText(ID_AUTO____9,"-8");
         LANGUAGE_FR.AddText(ID_AUTO____10,"-5");
         LANGUAGE_FR.AddText(ID_AUTO____11,"-6");
         LANGUAGE_FR.AddText(ID_AUTO____12,"-3");
         LANGUAGE_FR.AddText(ID_AUTO____13,"-4");
         LANGUAGE_FR.AddText(ID_AUTO____14,"-1");
         LANGUAGE_FR.AddText(ID_AUTO____15,"-2");
         LANGUAGE_FR.AddText(ID_AUTO_ENTER_0,"ENTRE LE NOM D\'UTILISATEUR GAMERSAFE DE TON AMI ICI");
         LANGUAGE_FR.AddText(ID_AUTO_ADD_0,"AJOUT");
         LANGUAGE_FR.AddText(ID_AUTO_STONE_1,"STONE STARTER");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_12,"CONTENU ");
         LANGUAGE_FR.AddText(ID_AUTO___20,"- PRIME SET - ");
         LANGUAGE_FR.AddText(ID_AUTO_CHANGE_0,"CHANGE D\'ARMÉE");
         LANGUAGE_FR.AddText(ID_AUTO_GIVE_1,"NOMME TON ARMÉE");
         LANGUAGE_FR.AddText(ID_AUTO_ACT_0,"ACTE 3");
         LANGUAGE_FR.AddText(ID_AUTO_ACT_1,"ACTE 2");
         LANGUAGE_FR.AddText(ID_AUTO_ACT_2,"ACTE 1");
         LANGUAGE_FR.AddText(ID_AUTO_REWARD_0,"ACQUIS");
         LANGUAGE_FR.AddText(ID_AUTO_REWARD_1,"RÉCOMPENSE ");
         LANGUAGE_FR.AddText(ID_AUTO_LOGIN_0,"LOGIN");
         LANGUAGE_FR.AddText(ID_AUTO_USERNAME_0,"NOM D\'UTILISATEUR");
         LANGUAGE_FR.AddText(ID_AUTO_PASSWORD_0,"MOT DE PASSE");
         LANGUAGE_FR.AddText(ID_AUTO_PLAY_0,"JEU HORS-LIGNE");
         LANGUAGE_FR.AddText(ID_AUTO_PLAY_1,"JEU EN LIGNE");
         LANGUAGE_FR.AddText(ID_AUTO_SIGN_0,"CONNEXION");
         LANGUAGE_FR.AddText(ID_AUTO_CLOSE_0,"FERMER");
         LANGUAGE_FR.AddText(ID_AUTO_SAVE_1,"SAVE");
         LANGUAGE_FR.AddText(ID_AUTO___21,"?");
         LANGUAGE_FR.AddText(ID_AUTO_RARE_1,"item rare");
         LANGUAGE_FR.AddText(ID_AUTO______0,"2000");
         LANGUAGE_FR.AddText(ID_AUTO______1,"1000");
         LANGUAGE_FR.AddText(ID_AUTO_____3,"500");
         LANGUAGE_FR.AddText(ID_AUTO_____4,"250");
         LANGUAGE_FR.AddText(ID_AUTO_REWARD_2,"RÉCOMPENSE");
         LANGUAGE_FR.AddText(ID_AUTO_HERE_2,"Voici ta récompense");
         LANGUAGE_FR.AddText(ID_AUTO_RECRUITMENT_0,"RECRUTEMENT");
         LANGUAGE_FR.AddText(ID_AUTO_HERE_3,"Voici ta récompense pour avoir recruté");
         LANGUAGE_FR.AddText(ID_AUTO_RECRUITED_0,"recruté");
         LANGUAGE_FR.AddText(ID_AUTO_OK_0,"OK");
         LANGUAGE_FR.AddText(ID_AUTO_CANCEL_0,"ANNULER");
         LANGUAGE_FR.AddText(ID_AUTO_ARMY_0,"ARMÉE");
         LANGUAGE_FR.AddText(ID_AUTO_BEFORE_1,"CHOISISSEZ L\'ARMÉE QUI SE BATTERA : ");
         LANGUAGE_FR.AddText(ID_AUTO_RENAME_0,"RENOMMER");
         LANGUAGE_FR.AddText(ID_AUTO_GOLD_1,"BOUTIQUE D\'OR");
         LANGUAGE_FR.AddText(ID_AUTO_THANKS_0,"MERCI DE NOUS ENCOURAGER!!");
         LANGUAGE_FR.AddText(ID_AUTO_______0,"5,000");
         LANGUAGE_FR.AddText(ID_AUTO________0,"10,000");
         LANGUAGE_FR.AddText(ID_AUTO________1,"20,000");
         LANGUAGE_FR.AddText(ID_AUTO________2,"35,000");
         LANGUAGE_FR.AddText(ID_AUTO_BEST_0,"BON MARCHÉ");
         LANGUAGE_FR.AddText(ID_AUTO_LOADING_1,"chargement ");
         LANGUAGE_FR.AddText(ID_AUTO_NEXT_0,"PROCH.");
         LANGUAGE_FR.AddText(ID_AUTO_PREVIOUS_0,"PRÉCED.");
         LANGUAGE_FR.AddText(ID_AUTO_ACTIVATE_1,"ACTIVE");
         LANGUAGE_FR.AddText(ID_AUTO_DEACTIVATE_1,"DÉSACTIVE");
         LANGUAGE_FR.AddText(ID_AUTO_VICTORY_0,"VICTOIRE");
         LANGUAGE_FR.AddText(ID_AUTO_CONTINUE_0,"CONTINUE");
         LANGUAGE_FR.AddText(ID_AUTO_YOU_VE_0,"TU AS ÉTÉ\nVAINCU");
         LANGUAGE_FR.AddText(ID_AUTO_DRAW_0,"MATCH NUL");
         LANGUAGE_FR.AddText(ID_AUTO_TIPS_0,"ASTUCE");
         LANGUAGE_FR.AddText(ID_AUTO_RANKED_1,"NOUVEAU RANG!");
         LANGUAGE_FR.AddText(ID_TUTO_INIT_PAGE_1,"Regardons à quoi ressemble ton armée présentement!");
         LANGUAGE_FR.AddText(ID_TUTO_INIT_PAGE_2,"Ce sont tes FRONT-LINERS and PIKEMEN. Ils sont déja placés dans ton armée, mais tu peux les bouger afin de changer leur composition !");
         LANGUAGE_FR.AddText(ID_TUTO_INIT_PAGE_3,"Tu peux modifier la vitesse de chacun de tes groupes à GARDE, LENT ou RAPIDE. Changer leur vitesse peux affecter grandement le resultat d\'une bataille!");
         LANGUAGE_FR.AddText(ID_TUTO_INIT_PAGE_4,"Assez parlé ! Retournez à la bataille !");
         LANGUAGE_FR.AddText(ID_TUTO_FLAG_PAGE_2,"Le Porte Étendart donne +1 DMG de feu à toute les unités présentes dans son groupe!");
         LANGUAGE_FR.AddText(ID_TUTO_FLAG_PAGE_3,"PARLONS STATS: Chaque unité a une valeur d\'ATTAQUE et de RÉSISTANCE de certain types. Pour contrer une attaque, équipez vos unité de RÉSISTANCE du type utilisé par l\'unité attaquante!");
         LANGUAGE_FR.AddText(ID_TUTORIAL_CREATE_PAGE_1,"Nous pourrions utiliser ces chevaliers dans notre assaut!\n\nAllons les implanter dans notre armée!");
         LANGUAGE_FR.AddText(ID_TUTORIAL_CREATE_PAGE_2,"À partir de maintenant, quand vous recevrez de nouveaux équipements, vous aurez à créer vos unités manuellement !");
         LANGUAGE_FR.AddText(ID_TUTORIAL_CREATE_PAGE_3,"Premièrement, pour créer une unité il vous faut absolument une créature ! Glissez en une ou double cliquez sur leur icone.");
         LANGUAGE_FR.AddText(ID_TUTORIAL_CREATE_PAGE_4,"Maintenant, vous pouvez l\'améliorer en lui donnant des pièces d\'équipements libre de votre inventaire!");
         LANGUAGE_FR.AddText(ID_TUTORIAL_CREATE_PAGE_5,"Ses points de STATS dépendent de l\'équipement donné. Vous pouvez aussi voir ce que coûte cette unité pour être mise dans votre Armée!");
         LANGUAGE_FR.AddText(ID_AUTO_12X,"12x");
         LANGUAGE_FR.AddText(ID_AUTO_6X,"6x");
         LANGUAGE_FR.AddText(ID_AUTO_1X,"1x");
         LANGUAGE_FR.AddText(ID_DAILY_UNDEAD,"MORT-VIVANT");
         LANGUAGE_FR.AddText(ID_DAILY_HUMAN,"HUMAIN");
         LANGUAGE_FR.AddText(ID_DAILY_ORC,"ORC");
         LANGUAGE_FR.AddText(ID_DAILY_VERMINE,"VERMINE");
         LANGUAGE_FR.AddText(ID_DAILY_BEHEMOT,"BEHEMOTH");
         LANGUAGE_FR.AddText(ID_DAILY_REPTILIAN,"REPTILIEN");
         LANGUAGE_FR.AddText(ID_DAILY_OCTOPOD,"OCTOPOD");
         LANGUAGE_FR.AddText(ID_DAILY_FIRE,"FEU");
         LANGUAGE_FR.AddText(ID_DAILY_WATER,"EAU");
         LANGUAGE_FR.AddText(ID_DAILY_POISON,"POISON");
         LANGUAGE_FR.AddText(ID_DAILY_LIGHTNING,"ÉCLAIR");
         LANGUAGE_FR.AddText(ID_DAILY_IMP,"DIABLOTIN");
         LANGUAGE_FR.AddText(ID_DAILY_GOLEM,"GOLEM");
         LANGUAGE_FR.AddText(ID_AWARDED_AT_FLAG,"DÉCERNÉ AUX");
         LANGUAGE_FR.AddText(ID_PACK_OF_THE_DAY,"PAQUET DU JOUR");
         LANGUAGE_FR.AddText(ID_PACK_OF_THE_WEEK,"CETTE SEMAINE");
         LANGUAGE_FR.AddText(ID_NOT_CONNECTED_ON_ARMORGAMES,"CONNECTEZ VOUS A ARMORGAMES POUR JOUER.");
         LANGUAGE_FR.AddText(ID_ARE_YOU_SURE_YOU_WANT_TO_CONCEDE,"Voulez-vous vraiment concéder victoire à votre opposant ?");
         LANGUAGE_FR.AddText(ID_ARMORGAME_MTX,"Appuyez sur OK lorsque la transaction sera terminée, vous aurez peut-être à rafraichir la page.");
         LANGUAGE_FR.AddText(ID_DELETE_DATA,"EFFACER DONNÉES");
         LANGUAGE_FR.AddText(ID_DO_YOU_WANT_DELETE,"Voulez-vous effacer toute vos données de partie ? Vous perdrez TOUT! Objets, armées et même vos rangs de multi-joueur!");
         LANGUAGE_FR.AddText(ID_ARE_YOU_SURE_YOU_WANT_TO_DELETE,"En êtes-vous VRAIMENT certain? Aucun support pour les parties effacées ne peut être donné, quand c\'est fait, c\'est fait!");
         LANGUAGE_FR.AddText(ID_RESET_MULTIPLAYER_ARMY,"RESET RANG D\'ARMÉE");
         LANGUAGE_FR.AddText(ID_DO_YOU_WANT_TO_RESET_ARMY,"Êtes-vous sur de vouloir réinitialiser les rangs de votre armée en multi-joueur ?");
         LANGUAGE_FR.AddText(ID_AUTO_CAPTCHA,"Captcha");
         LANGUAGE_FR.AddText(ID_SURVIVAL_COOP,"COOP SURVIE");
         LANGUAGE_FR.AddText(ID_CLASSIC_1000_PTS,"CLASSIQUE 1000 PTS.");
         LANGUAGE_FR.AddText(ID_CLASSIC_500_PTS,"CLASSIQUE 500 PTS.");
         LANGUAGE_FR.AddText(ID_TOURNAMENT_MODE,"TOURNOI");
         LANGUAGE_FR.AddText(ID_AUTO_ME_1,"MOI");
         LANGUAGE_FR.AddText(ID_AUTO_FRIEND_1,"AMI");
         LANGUAGE_FR.AddText(ID_ARMY_5_NUMBER,"5");
         LANGUAGE_FR.AddText(ID_CLEAR_CRAFT,"CLEAR");
         LANGUAGE_FR.AddText(ID_SURVIVAL_MODE,"MODE SURVIE");
         LANGUAGE_FR.AddText(ID_TEXT_BACK_ROW,"RANG\nARRIERE");
         LANGUAGE_FR.AddText(ID_TEXT_FRONT_ROW,"RANG\nAVANT");
         LANGUAGE_FR.AddText(ID_CHOOSE_YOUR_ALLY,"CHOISI TON ALLIÉ");
         LANGUAGE_FR.AddText(ID_TOURNAMENT,"TOURNOI");
         LANGUAGE_FR.AddText(ID_CHANGE_FIGHTS,"NOUVELLE BATAILLES");
         LANGUAGE_FR.AddText(ID_CRAFTING,"ARTISANAT");
         LANGUAGE_FR.AddText(ID_CONSUME,"CONSOMME");
         LANGUAGE_FR.AddText(ID_CRAFT_ITEM,"CRÉER\nITEM");
         LANGUAGE_FR.AddText(ID_CANT_CONSUME_MORE,"Impossible de consommer cet item, il est utilisé dans une armée.");
         LANGUAGE_FR.AddText(ID_CRAFT_BOOSTER_REWARD,"Artisanat");
         LANGUAGE_FR.AddText(ID_MYTHIC_BOOSTER_REWARD,"- MYTHS -");
         LANGUAGE_FR.AddText(ID_ARE_YOU_SURE_YOU_WANT_TO_CRAFT,"Créer un item consomme tout les points d\'artisanat, voullez vous procéder?");
      }
   }
}

