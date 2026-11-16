package com.battlecry.specialEffect.timedEffects
{
   import com.battlecry.battle.BattleArmy;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelStatsEnum;
   import com.lachhhEngine.games.effects.GameEffectContainerId;
   
   public class TimedStatsBoost extends TimedEffect
   {
      
      public static const RANGE_SELF:int = 0;
      
      public static const RANGE_SQUAD:int = 1;
      
      public static const RANGE_ARMY:int = 2;
      
      public static const RANGE_EVERYONE:int = 3;
      
      private var _statsBoostList:MetaStatsList;
      
      private var _fxID:int;
      
      private var _creatureType:int;
      
      private var _range:int;
      
      public function TimedStatsBoost(id:int, type:int, duration:int, coolDown:int, statsBoostList1:MetaStatsList, creatureType1:int, range1:int, fxID:int)
      {
         super(id,type,duration,coolDown);
         this._statsBoostList = statsBoostList1;
         this._creatureType = creatureType1;
         this._range = range1;
         this._fxID = fxID;
      }
      
      public function set statsBoostList(statsBoostList:MetaStatsList) : void
      {
         this._statsBoostList = statsBoostList;
      }
      
      public function set fxID(fxID:int) : void
      {
         this._fxID = fxID;
      }
      
      public function get statsBoostList() : MetaStatsList
      {
         return this._statsBoostList;
      }
      
      public function get fxID() : int
      {
         return this._fxID;
      }
      
      public function set creatureType(creatureType:int) : void
      {
         this._creatureType = creatureType;
      }
      
      override public function CastEffect() : void
      {
         var team1:BattleArmy = null;
         var team2:BattleArmy = null;
         var i:int = 0;
         var j:int = 0;
         var k:int = 0;
         super.CastEffect();
         if(owner.teamId == MiscConstants.TEAM1)
         {
            team1 = context.roundManager.team1;
            team2 = context.roundManager.team2;
         }
         else
         {
            team1 = context.roundManager.team2;
            team2 = context.roundManager.team1;
         }
         if(this._range == RANGE_EVERYONE)
         {
            for(i = 0; i < team1.squadQueue.length; i++)
            {
               for(j = 0; j < team1.squadQueue[i].unitList.length; j++)
               {
                  if(this._creatureType == 0 || team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == this._creatureType || team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                  {
                     context.gameEffectManager.CreateStaticFx(this._fxID,GameEffectContainerId.ABOVE,team1.squadQueue[i].unitList[j].px,team1.squadQueue[i].unitList[j].py,context.actionLayer.metaLayer);
                     for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                     {
                        team1.squadQueue[i].unitList[j].metaStatsListAura.AddValue(this._statsBoostList.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                     }
                  }
               }
            }
            for(i = 0; i < team2.squadQueue.length; i++)
            {
               for(j = 0; j < team2.squadQueue[i].unitList.length; j++)
               {
                  if(this._creatureType == 0 || team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == this._creatureType || team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                  {
                     context.gameEffectManager.CreateStaticFx(this._fxID,GameEffectContainerId.ABOVE,team2.squadQueue[i].unitList[j].px,team2.squadQueue[i].unitList[j].py,context.actionLayer.metaLayer);
                     for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                     {
                        team2.squadQueue[i].unitList[j].metaStatsListAura.AddValue(this._statsBoostList.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                     }
                  }
               }
            }
         }
      }
      
      public function get creatureType() : int
      {
         return this._creatureType;
      }
      
      public function set range(range:int) : void
      {
         this._range = range;
      }
      
      public function get range() : int
      {
         return this._range;
      }
   }
}

