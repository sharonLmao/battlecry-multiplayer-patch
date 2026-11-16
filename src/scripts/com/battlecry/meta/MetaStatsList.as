package com.battlecry.meta
{
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelStats;
   import com.battlecry.meta.model.ModelStatsEnum;
   
   public class MetaStatsList
   {
      
      public static var EMPTY_STATS_LIST:MetaStatsList = new MetaStatsList();
      
      private var _stats:Vector.<int> = new Vector.<int>();
      
      public function MetaStatsList(aslash:int = 0, ablunt:int = 0, apiercing:int = 0, aexplosion:int = 0, afire:int = 0, aice:int = 0, apoison:int = 0, alightning:int = 0, adark:int = 0, aholy:int = 0, rslash:int = 0, rblunt:int = 0, rpiercing:int = 0, rexplosion:int = 0, rfire:int = 0, rice:int = 0, rpoison:int = 0, rlightning:int = 0, rdark:int = 0, rholy:int = 0)
      {
         super();
         this._stats[0] = aslash;
         this._stats[1] = ablunt;
         this._stats[2] = apiercing;
         this._stats[3] = aexplosion;
         this._stats[4] = afire;
         this._stats[5] = aice;
         this._stats[6] = apoison;
         this._stats[7] = alightning;
         this._stats[8] = adark;
         this._stats[9] = aholy;
         this._stats[10] = rslash;
         this._stats[11] = rblunt;
         this._stats[12] = rpiercing;
         this._stats[13] = rexplosion;
         this._stats[14] = rfire;
         this._stats[15] = rice;
         this._stats[16] = rpoison;
         this._stats[17] = rlightning;
         this._stats[18] = rdark;
         this._stats[19] = rholy;
      }
      
      public function FeedFromModel(modelEquipement:ModelEquipement) : void
      {
         var m:ModelStats = null;
         for(var i:int = 0; i < ModelStatsEnum.ALL.length; i++)
         {
            m = ModelStatsEnum.ALL[i];
            this._stats[m.id] = MiscConstants.GetStats(m,modelEquipement);
         }
      }
      
      public function FeedFromPlayerEquipement(metaPlayerEquipement:MetaPlayerEquipement) : void
      {
         var m:ModelStats = null;
         for(var i:int = 0; i < ModelStatsEnum.ALL.length; i++)
         {
            m = ModelStatsEnum.ALL[i];
            this._stats[m.id] = metaPlayerEquipement.creatureEquip.modelEquipement.metaStatsList.GetStatsValue(m) + metaPlayerEquipement.weaponEquip.modelEquipement.metaStatsList.GetStatsValue(m) + metaPlayerEquipement.shieldEquip.modelEquipement.metaStatsList.GetStatsValue(m) + metaPlayerEquipement.armorEquip.modelEquipement.metaStatsList.GetStatsValue(m) + metaPlayerEquipement.specialEquip.modelEquipement.metaStatsList.GetStatsValue(m);
         }
      }
      
      public function get slashResist() : int
      {
         return this.GetStatsValue(ModelStatsEnum.RESIST_SLASH);
      }
      
      public function get holyResist() : int
      {
         return this.GetStatsValue(ModelStatsEnum.RESIST_HOLY);
      }
      
      public function SetValue(value:int, modelStats:ModelStats) : void
      {
         this._stats[modelStats.id] = value;
      }
      
      public function get poisonResist() : int
      {
         return this.GetStatsValue(ModelStatsEnum.RESIST_POISON);
      }
      
      public function get lightningResist() : int
      {
         return this.GetStatsValue(ModelStatsEnum.RESIST_LIGHTNING);
      }
      
      public function get iceResist() : int
      {
         return this.GetStatsValue(ModelStatsEnum.RESIST_ICE);
      }
      
      public function get piercingResist() : int
      {
         return this.GetStatsValue(ModelStatsEnum.RESIST_PIERCING);
      }
      
      public function get fireResist() : int
      {
         return this.GetStatsValue(ModelStatsEnum.RESIST_FIRE);
      }
      
      public function get bluntAttack() : int
      {
         return this.GetStatsValue(ModelStatsEnum.ATTACK_BLUNT);
      }
      
      public function get darkAttack() : int
      {
         return this.GetStatsValue(ModelStatsEnum.ATTACK_DARK);
      }
      
      public function get explosionResist() : int
      {
         return this.GetStatsValue(ModelStatsEnum.RESIST_EXPLOSION);
      }
      
      public function get darkResist() : int
      {
         return this.GetStatsValue(ModelStatsEnum.RESIST_DARK);
      }
      
      public function get slashAttack() : int
      {
         return this.GetStatsValue(ModelStatsEnum.ATTACK_SLASH);
      }
      
      public function GetStatsValue(m:ModelStats) : int
      {
         if(this._stats.length == 0)
         {
            return 0;
         }
         return this._stats[m.id];
      }
      
      public function get piercingAttack() : int
      {
         return this.GetStatsValue(ModelStatsEnum.ATTACK_PIERCING);
      }
      
      public function AddValue(value:int, modelStats:ModelStats) : void
      {
         this._stats[modelStats.id] += value;
      }
      
      public function get lightningAttack() : int
      {
         return this.GetStatsValue(ModelStatsEnum.ATTACK_LIGHTNING);
      }
      
      public function RemoveValue(value:int, modelStats:ModelStats) : void
      {
         this._stats[modelStats.id] -= value;
      }
      
      public function get fireAttack() : int
      {
         return this.GetStatsValue(ModelStatsEnum.ATTACK_FIRE);
      }
      
      public function get poisonAttack() : int
      {
         return this.GetStatsValue(ModelStatsEnum.ATTACK_POISON);
      }
      
      public function get iceAttack() : int
      {
         return this.GetStatsValue(ModelStatsEnum.ATTACK_ICE);
      }
      
      public function get bluntResist() : int
      {
         return this.GetStatsValue(ModelStatsEnum.RESIST_BLUNT);
      }
      
      public function get holyAttack() : int
      {
         return this.GetStatsValue(ModelStatsEnum.ATTACK_HOLY);
      }
      
      public function get explosionAttack() : int
      {
         return this.GetStatsValue(ModelStatsEnum.ATTACK_EXPLOSION);
      }
   }
}

