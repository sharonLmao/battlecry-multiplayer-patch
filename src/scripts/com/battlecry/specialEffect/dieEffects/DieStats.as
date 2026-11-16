package com.battlecry.specialEffect.dieEffects
{
   import com.battlecry.battle.BattleArmy;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelStats;
   
   public class DieStats extends DieEffects
   {
      
      public static var RANGE_ALL:int = 2;
      
      private var _defenseBoost:int;
      
      private var _genreCreature:int;
      
      private var _value:int;
      
      private var _modelStats:ModelStats;
      
      private var _range:int;
      
      public function DieStats(id:int, genreCreature:int, range:int, modelStats:ModelStats, value:int, defenseBoost:int)
      {
         super(id);
         this._genreCreature = genreCreature;
         this._range = range;
         this._modelStats = modelStats;
         this._value = value;
         this._defenseBoost = defenseBoost;
      }
      
      public function get genreCreature() : int
      {
         return this._genreCreature;
      }
      
      public function set modelStats(modelStats:ModelStats) : void
      {
         this._modelStats = modelStats;
      }
      
      public function set defenseBoost(defenseBoost:int) : void
      {
         this._defenseBoost = defenseBoost;
      }
      
      public function set value(value:int) : void
      {
         this._value = value;
      }
      
      public function set genreCreature(genreCreature:int) : void
      {
         this._genreCreature = genreCreature;
      }
      
      public function get modelStats() : ModelStats
      {
         return this._modelStats;
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function set range(range:int) : void
      {
         this._range = range;
      }
      
      public function get defenseBoost() : int
      {
         return this._defenseBoost;
      }
      
      public function get range() : int
      {
         return this._range;
      }
      
      override public function Cast() : void
      {
         var i:int = 0;
         var j:int = 0;
         var team1:BattleArmy = null;
         var team2:BattleArmy = null;
         super.Cast();
         if(this._range == RANGE_ALL)
         {
            team1 = context.roundManager.team1;
            team2 = context.roundManager.team2;
            for(i = 0; i < team1.squadQueue.length; i++)
            {
               for(j = 0; j < team1.squadQueue[i].unitList.length; j++)
               {
                  if(team1.squadQueue[i].unitList[j].metaActor != null)
                  {
                     if(this._genreCreature == 0 || this._genreCreature == team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre || team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                     {
                        team1.squadQueue[i].unitList[j].metaStatsListAura.AddValue(this._value,this._modelStats);
                        team1.squadQueue[i].unitList[j].hp += this._defenseBoost;
                     }
                  }
               }
            }
            for(i = 0; i < team2.squadQueue.length; i++)
            {
               for(j = 0; j < team2.squadQueue[i].unitList.length; j++)
               {
                  if(team2.squadQueue[i].unitList[j].metaActor != null)
                  {
                     if(this._genreCreature == 0 || this._genreCreature == team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre || team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                     {
                        team2.squadQueue[i].unitList[j].metaStatsListAura.AddValue(this._value,this._modelStats);
                        team2.squadQueue[i].unitList[j].hp += this._defenseBoost;
                     }
                  }
               }
            }
         }
      }
   }
}

