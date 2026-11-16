package com.battlecry.specialEffect.onRaiseUndead
{
   import com.battlecry.battle.BattleArmy;
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.meta.model.ModelStatsEnum;
   
   public class onRaiseUndeadBuff extends onRaiseUndead
   {
      
      private var _defModifier:int;
      
      private var _range:int;
      
      private var _creatureType:int;
      
      private var _statsList:MetaStatsList;
      
      public function onRaiseUndeadBuff(id:int, statsList1:MetaStatsList, defModifier1:int, range1:int, creatureType1:int)
      {
         super(id);
         this._statsList = statsList1;
         this._defModifier = defModifier1;
         this._range = range1;
         this._creatureType = creatureType1;
      }
      
      public function set defModifier(defModifier:int) : void
      {
         this._defModifier = defModifier;
      }
      
      public function set range(range:int) : void
      {
         this._range = range;
      }
      
      public function get defModifier() : int
      {
         return this._defModifier;
      }
      
      public function get range() : int
      {
         return this._range;
      }
      
      public function set creatureType(creatureType:int) : void
      {
         this._creatureType = creatureType;
      }
      
      public function get creatureType() : int
      {
         return this._creatureType;
      }
      
      public function set statsList(statsList:MetaStatsList) : void
      {
         this._statsList = statsList;
      }
      
      public function get statsList() : MetaStatsList
      {
         return this._statsList;
      }
      
      override public function Cast() : void
      {
         var team1:BattleArmy = null;
         var team2:BattleArmy = null;
         var i:int = 0;
         var j:int = 0;
         var k:int = 0;
         super.Cast();
         if(this._range == onRaiseUndead.RANGE_ALL)
         {
            team1 = context.roundManager.team1;
            team2 = context.roundManager.team2;
            for(i = 0; i < team1.squadQueue.length; i++)
            {
               for(j = 0; j < team1.squadQueue[i].unitList.length; j++)
               {
                  if(this._creatureType == 0 || this._creatureType == team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre)
                  {
                     for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                     {
                        team1.squadQueue[i].unitList[j].metaStatsListAura.AddValue(this._statsList.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                     }
                     team1.squadQueue[i].unitList[j].hp += this._defModifier;
                     team1.squadQueue[i].unitList[j].maxHp += this._defModifier;
                  }
               }
            }
            for(i = 0; i < team2.squadQueue.length; i++)
            {
               for(j = 0; j < team2.squadQueue[i].unitList.length; j++)
               {
                  if(this._creatureType == 0 || this._creatureType == team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre)
                  {
                     for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                     {
                        team2.squadQueue[i].unitList[j].metaStatsListAura.AddValue(this._statsList.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                     }
                     team2.squadQueue[i].unitList[j].hp += this._defModifier;
                     team2.squadQueue[i].unitList[j].maxHp += this._defModifier;
                  }
               }
            }
         }
      }
   }
}

