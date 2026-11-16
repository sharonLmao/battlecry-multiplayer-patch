package com.battlecry.specialEffect.onStartEffect
{
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.battle.BattleArmy;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.meta.model.ModelStats;
   import com.battlecry.specialEffect.SpecialEffect;
   
   public class onStartEffectMythic extends SpecialEffect
   {
      
      private var _defenseBoost:int;
      
      private var _init:Boolean;
      
      private var _value:int;
      
      private var _modelStats:ModelStats;
      
      private var _id:int;
      
      private var _owner:BC_Actor;
      
      public function onStartEffectMythic(id1:int, modelStats:ModelStats, value:int, defenseBoost:int)
      {
         super();
         this._id = id1;
         this._modelStats = modelStats;
         this._value = value;
         this._init = true;
         this._defenseBoost = defenseBoost;
      }
      
      public function get defenseBoost() : int
      {
         return this._defenseBoost;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function set defenseBoost(defenseBoost:int) : void
      {
         this._defenseBoost = defenseBoost;
      }
      
      public function set value(value:int) : void
      {
         this._value = value;
      }
      
      public function set modelStats(modelStats:ModelStats) : void
      {
         this._modelStats = modelStats;
      }
      
      public function get modelStats() : ModelStats
      {
         return this._modelStats;
      }
      
      public function SetOwner(actor:BC_Actor) : void
      {
         this._owner = actor;
      }
      
      public function Reset() : void
      {
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function Cast() : void
      {
         var team:BattleArmy = null;
         var count:int = 0;
         var i:int = 0;
         var j:int = 0;
         if(this._init)
         {
            this._init = false;
            if(this._owner.teamId == MiscConstants.TEAM1)
            {
               team = context.roundManager.team1;
            }
            else
            {
               team = context.roundManager.team2;
            }
            count = 0;
            for(i = 0; i < team.squadQueue.length; i++)
            {
               for(j = 0; j < team.squadQueue[i].unitList.length; j++)
               {
                  if(team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.IsMythic())
                  {
                     count++;
                  }
               }
            }
            if(count > 0)
            {
               this._owner.metaStatsListAura.AddValue(count * this.value,this._modelStats);
               this._owner.hp += this._defenseBoost;
            }
         }
      }
   }
}

