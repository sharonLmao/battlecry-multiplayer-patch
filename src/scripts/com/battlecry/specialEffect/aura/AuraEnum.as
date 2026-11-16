package com.battlecry.specialEffect.aura
{
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.meta.model.ModelEquipement;
   
   public class AuraEnum
   {
      
      private static var _id:int = 0;
      
      public static var EFFECT_NULL:Aura = new Aura(-1,-1,null,-1,-1,-1,-1,-1);
      
      public static var ALL:Vector.<Aura> = new Vector.<Aura>();
      
      public static var SWORDSMAN_FLAG:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var BARBARIAN_FLAG:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var PIKEMAN_FLAG:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var SAPPER_FLAG:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var FLAME_FLAG:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var FROST_FLAG:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var VIPER_FLAG:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var BOLT_FLAG:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var CULT_FLAG:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var CLERIC_FLAG:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var TOWER_FLAG:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),2,0,0,0,0);
      
      public static var NECROPOL_MAIL:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),1,0,0,0,ModelEquipement.GENRE_CREATURE_UNDEAD);
      
      public static var ULTIMA_STAFF:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,-10,0,0);
      
      public static var XONAX_BUCKLER:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),1,0,0,0,ModelEquipement.GENRE_CREATURE_VERMINE);
      
      public static var MOKDAR_SHIELD:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),1,0,0,0,ModelEquipement.GENRE_CREATURE_ORC);
      
      public static var EMPIRE_ARMOR:Aura = CreateAuraEffect(_id++,Aura.RANGE_ARMY,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),1,0,0,0,ModelEquipement.GENRE_CREATURE_HUMAN);
      
      public static var QUAEK_TALISMAN:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0),0,0,0,0,ModelEquipement.GENRE_CREATURE_VERMINE);
      
      public static var STATIC_ORB:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,5,0,0);
      
      public static var EMPIRE_SEAL:Aura = CreateAuraEffect(_id++,Aura.RANGE_ARMY,new MetaStatsList(2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),3,0,0,0,ModelEquipement.GENRE_CREATURE_HUMAN);
      
      public static var ORC_LEADER_CROWN:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,ModelEquipement.GENRE_CREATURE_ORC);
      
      public static var FAMINE:Aura = CreateAuraEffect(_id++,Aura.RANGE_ARMY,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),-10,0,0,0,0);
      
      public static var WAR:Aura = CreateAuraEffect(_id++,Aura.RANGE_ENNEMYARMY,new MetaStatsList(3,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var CONQUEST:Aura = CreateAuraEffect(_id++,Aura.RANGE_ENNEMYARMY,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),5,0,0,0,0);
      
      public static var XONAXSTAFF:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,ModelEquipement.GENRE_CREATURE_VERMINE);
      
      public static var QUATIAZSWORD:Aura = CreateAuraEffect(_id++,Aura.RANGE_ARMY,new MetaStatsList(0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0),0,0,0,0,ModelEquipement.GENRE_CREATURE_HUMAN);
      
      public static var AODAN_SHIELD:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,10,0,0);
      
      public static var GORDAKAR_SHIELD:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),6,0,0,0,ModelEquipement.GENRE_CREATURE_ORC);
      
      public static var ORYTH_SHIELD:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,-6),6,0,0,0,ModelEquipement.GENRE_CREATURE_DEMON);
      
      public static var ULTRA_SHIELD:Aura = CreateAuraEffect(_id++,Aura.RANGE_ARMY,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),-8,0,0,0,0);
      
      public static var TULORAN_PLATE:Aura = CreateAuraEffect(_id++,Aura.RANGE_ARMY,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),2,0,0,0,ModelEquipement.GENRE_CREATURE_HUMAN);
      
      public static var YASUR_ARMOR:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),5,0,0,0,ModelEquipement.GENRE_CREATURE_UNDEAD);
      
      public static var XONAX_MAIL:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),20,0,0,0,ModelEquipement.GENRE_CREATURE_VERMINE);
      
      public static var VASSPOTANAX_PLATE:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,2,0,0,0),0,0,0,0,ModelEquipement.GENRE_CREATURE_REPTILIAN);
      
      public static var GORDAKAR_PLATE:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,ModelEquipement.GENRE_CREATURE_ORC);
      
      public static var AZARATIUS_ORB:Aura = CreateAuraEffect(_id++,Aura.RANGE_ARMY,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0),0,0,0,0,0);
      
      public static var ARHALATH_RING:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),8,0,0,0,ModelEquipement.GENRE_CREATURE_GOLEM);
      
      public static var UNICORN:Aura = CreateAuraEffect(_id++,Aura.RANGE_ARMY,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),2,0,0,0,0);
      
      public static var APOCALYPSE_HORSE:Aura = CreateAuraEffect(_id++,Aura.RANGE_ARMY,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),-8,0,0,0,0);
      
      public static var ANTIMAGIC_FIELD:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,20,0,0);
      
      public static var ULTRA_RING:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,20,0,0);
      
      public static var ULTRA_RING_DEF:Aura = CreateAuraEffect(_id++,Aura.RANGE_ARMY,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),-2,0,0,0,0);
      
      public static var GAZATAH_HANDBOOK:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,5,0),0,0,0,0,0);
      
      public static var BAX_SHIELD:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0),0,0,0,0,0);
      
      public static var ANGEL_PLATE:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2),0,0,0,0,0);
      
      public static var UNHOLY_PLATE:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0),0,0,0,0,0);
      
      public static var IMP_PIKE:Aura = CreateAuraEffect(_id++,Aura.RANGE_SELF,new MetaStatsList(0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,ModelEquipement.GENRE_CREATURE_IMP);
      
      public static var IMP_MUSKET:Aura = CreateAuraEffect(_id++,Aura.RANGE_SELF,new MetaStatsList(0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,ModelEquipement.GENRE_CREATURE_IMP);
      
      public static var UNDEAD_FLAG:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),5,0,0,0,ModelEquipement.GENRE_CREATURE_UNDEAD);
      
      public static var SEAKING_STAFF:Aura = CreateAuraEffect(_id++,Aura.RANGE_SELF,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,-5,0,ModelEquipement.GENRE_CREATURE_FISHMAN);
      
      public static var CORAL_STAFF:Aura = CreateAuraEffect(_id++,Aura.RANGE_SELF,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,-10,0,ModelEquipement.GENRE_CREATURE_FISHMAN);
      
      public static var IMP_SHIELD:Aura = CreateAuraEffect(_id++,Aura.RANGE_SELF,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),2,0,0,0,ModelEquipement.GENRE_CREATURE_IMP);
      
      public static var IMP_SHIELD2:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),1,0,0,0,ModelEquipement.GENRE_CREATURE_IMP);
      
      public static var VASS_SHIELD:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,5,0,0,5,0,0,0,0,0),0,0,0,0,ModelEquipement.GENRE_CREATURE_REPTILIAN);
      
      public static var IMP_ARMOR:Aura = CreateAuraEffect(_id++,Aura.RANGE_SELF,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),6,0,0,0,ModelEquipement.GENRE_CREATURE_IMP);
      
      public static var MECHANIC_ARMOR:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),2,0,0,0,ModelEquipement.GENRE_CREATURE_GOLEM);
      
      public static var SEAKING_ARMOR:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),2,0,0,0,ModelEquipement.GENRE_CREATURE_FISHMAN);
      
      public static var COOLDOWN_ARMOR:Aura = CreateAuraEffect(_id++,Aura.RANGE_SELF,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,30,30,0);
      
      public static var SEA_PLATE:Aura = CreateAuraEffect(_id++,Aura.RANGE_ARMY,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,25,0,0,0,0),2,0,0,0,ModelEquipement.GENRE_CREATURE_FISHMAN);
      
      public static var IMP_CROWN:Aura = CreateAuraEffect(_id++,Aura.RANGE_SQUAD,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),1,0,0,0,ModelEquipement.GENRE_CREATURE_IMP);
      
      public static var BLAZING_ORB:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var ANTITECH_CRYSTAL:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,4,0);
      
      public static var RINGOFMADNESS:Aura = CreateAuraEffect(_id++,Aura.RANGE_SELF,new MetaStatsList(60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var ELEMENTAL_RING:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL_ELEMENTAL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),10,0,0,0,0);
      
      public static var WARLORD_RING:Aura = CreateAuraEffect(_id++,Aura.RANGE_ARMY,new MetaStatsList(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var AODAN_MYTHIC:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,ModelEquipement.GENRE_CREATURE_GOLEM);
      
      public static var AZARTIUS_MYTHIC:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,0);
      
      public static var UMENTH_MYTHIC:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,-10,0,ModelEquipement.GENRE_CREATURE_OCTOPOD);
      
      public static var XONAX_MYTHIC:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,0,ModelEquipement.GENRE_CREATURE_VERMINE);
      
      public static var ZAMAROTH_MYTHIC:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0),10,0,0,0,ModelEquipement.GENRE_CREATURE_DEMON);
      
      public static var VASS_MYTHIC:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0),3,0,0,0,ModelEquipement.GENRE_CREATURE_REPTILIAN);
      
      public static var RHIGAR_MYTHIC:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0,0,0,-2,0);
      
      public static var IMRAHIL_MYTHIC:Aura = CreateAuraEffect(_id++,Aura.RANGE_ALL,new MetaStatsList(0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0),10,0,0,0,ModelEquipement.GENRE_CREATURE_ANGEL);
      
      public function AuraEnum()
      {
         super();
      }
      
      private static function CreateAuraEffect(id1:int, range1:int, statsModifier1:MetaStatsList, defModifier1:int, rangeModifier1:int, castingTimeModifier1:int, reloadTimeModifier:int, genreCreature:int) : Aura
      {
         var a:Aura = new Aura(id1,range1,statsModifier1,defModifier1,rangeModifier1,castingTimeModifier1,reloadTimeModifier,genreCreature);
         ALL.push(a);
         return a;
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
      
      public static function GetFromId(id:int) : Aura
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

