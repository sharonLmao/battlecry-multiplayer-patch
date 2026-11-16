package com.battlecry.specialEffect.aura
{
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.battle.BattleArmy;
   import com.battlecry.battle.BattleSquad;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelStatsEnum;
   import com.battlecry.specialEffect.SpecialEffect;
   
   public class Aura extends SpecialEffect
   {
      
      public static var RANGE_SQUAD:int = 0;
      
      public static var RANGE_ARMY:int = 1;
      
      public static var RANGE_ALL:int = 2;
      
      public static var RANGE_ENNEMYARMY:int = 3;
      
      public static var RANGE_SELF:int = 4;
      
      public static var RANGE_ALL_ELEMENTAL:int = 5;
      
      private var _castingTimeTaken:int;
      
      private var _statsModifier:MetaStatsList;
      
      private var _end:Boolean;
      
      private var _genreCreature:int;
      
      private var _ownerSquad:BattleSquad;
      
      private var _castingTimeModifier:int;
      
      private var _reloadTimeModifier:int;
      
      private var _init:Boolean;
      
      private var _ownerArmy:BattleArmy;
      
      private var _rangeModifier:int;
      
      private var _id:int;
      
      private var _owner:BC_Actor;
      
      private var _defModifier:int;
      
      private var _range:int;
      
      public function Aura(id:int, range:int, statsModifier1:MetaStatsList, defModifier1:int, rangeModifier1:int, castingTimeModifier1:int, reloadTimeModifier:int, genreCreature:int)
      {
         super();
         this._id = id;
         this._range = range;
         this._statsModifier = statsModifier1;
         this._defModifier = defModifier1;
         this._rangeModifier = rangeModifier1;
         this._castingTimeModifier = castingTimeModifier1;
         this._genreCreature = genreCreature;
         this._init = true;
         this._end = true;
         this._castingTimeTaken = 0;
         this._reloadTimeModifier = reloadTimeModifier;
      }
      
      public function set rangeModifier(rangeModifier:int) : void
      {
         this._rangeModifier = rangeModifier;
      }
      
      public function get defModifier() : int
      {
         return this._defModifier;
      }
      
      public function set statsModifier(statsModifier:MetaStatsList) : void
      {
         this._statsModifier = statsModifier;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function set defModifier(defModifier:int) : void
      {
         this._defModifier = defModifier;
      }
      
      public function get castingTimeModifier() : int
      {
         return this._castingTimeModifier;
      }
      
      public function set genreCreature(genreCreature:int) : void
      {
         this._genreCreature = genreCreature;
      }
      
      public function set castingTimeModifier(castingTimeModifier:int) : void
      {
         this._castingTimeModifier = castingTimeModifier;
      }
      
      public function SetOwner(actor:BC_Actor) : void
      {
         this._owner = actor;
         if(actor.teamId == MiscConstants.TEAM1)
         {
            this._ownerArmy = context.roundManager.team1;
         }
         else
         {
            this._ownerArmy = context.roundManager.team2;
         }
         this._ownerSquad = this._ownerArmy.getSquad(this._owner.squadId);
      }
      
      public function set range(range:int) : void
      {
         this._range = range;
      }
      
      public function get range() : int
      {
         return this._range;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get statsModifier() : MetaStatsList
      {
         return this._statsModifier;
      }
      
      public function Cast() : void
      {
         var i:int = 0;
         var j:int = 0;
         var k:int = 0;
         var team1:BattleArmy = null;
         var team2:BattleArmy = null;
         var team:BattleArmy = null;
         var ennemyTeam:BattleArmy = null;
         if(this._init)
         {
            this._init = false;
            if(this._range == RANGE_SELF)
            {
               if(this._genreCreature == 0 || this._owner.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == this._genreCreature || this._owner.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
               {
                  for(j = 0; j < ModelStatsEnum.ALL.length; j++)
                  {
                     this._owner.metaStatsListAura.AddValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[j]),ModelStatsEnum.ALL[j]);
                  }
                  this._owner.maxHp += this._defModifier;
                  this._owner.hp += this._defModifier;
                  this._owner.range += this._rangeModifier;
                  if(this._owner.range <= 0)
                  {
                     this._owner.range = 1;
                  }
                  if(this._owner.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                  {
                     this._owner.maxChargeUpTime += this._castingTimeModifier;
                     this._owner.chargeUpTime += this._castingTimeModifier;
                     this._owner.SetSpecialEffectCastTime(this._castingTimeModifier);
                  }
                  else if(this._owner.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || this._owner.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                  {
                     this._owner.maxChargeUpTime += this._reloadTimeModifier;
                     this._owner.chargeUpTime += this._reloadTimeModifier;
                  }
                  this._owner.CheckDie();
               }
            }
            else if(this._range == RANGE_SQUAD)
            {
               for(i = 0; i < this._ownerSquad.unitList.length; i++)
               {
                  if(this._genreCreature == 0 || this._ownerSquad.unitList[i].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == this._genreCreature || this._ownerSquad.unitList[i].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                  {
                     for(j = 0; j < ModelStatsEnum.ALL.length; j++)
                     {
                        this._ownerSquad.unitList[i].metaStatsListAura.AddValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[j]),ModelStatsEnum.ALL[j]);
                     }
                     this._ownerSquad.unitList[i].maxHp += this._defModifier;
                     this._ownerSquad.unitList[i].hp += this._defModifier;
                     this._ownerSquad.unitList[i].range += this._rangeModifier;
                     if(this._ownerSquad.unitList[i].range <= 0)
                     {
                        this._ownerSquad.unitList[i].range = 1;
                     }
                     if(this._ownerSquad.unitList[i].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                     {
                        this._ownerSquad.unitList[i].maxChargeUpTime += this._castingTimeModifier;
                        this._ownerSquad.unitList[i].chargeUpTime += this._castingTimeModifier;
                        this._ownerSquad.unitList[i].SetSpecialEffectCastTime(this._castingTimeModifier);
                     }
                     else if(this._ownerSquad.unitList[i].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || this._ownerSquad.unitList[i].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                     {
                        this._ownerSquad.unitList[i].maxChargeUpTime += this._reloadTimeModifier;
                        this._ownerSquad.unitList[i].chargeUpTime += this._reloadTimeModifier;
                     }
                     this._ownerSquad.unitList[i].CheckDie();
                  }
               }
            }
            else if(this._range == RANGE_ARMY)
            {
               if(this._owner.teamId == MiscConstants.TEAM1)
               {
                  team = context.roundManager.team1;
               }
               else
               {
                  team = context.roundManager.team2;
               }
               for(i = 0; i < team.squadQueue.length; i++)
               {
                  for(j = 0; j < team.squadQueue[i].unitList.length; j++)
                  {
                     if(team.squadQueue[i].unitList[j].metaActor != null)
                     {
                        if(this._genreCreature == 0 || this._genreCreature == team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre || team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                        {
                           for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                           {
                              team.squadQueue[i].unitList[j].metaStatsListAura.AddValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                           }
                           team.squadQueue[i].unitList[j].maxHp += this._defModifier;
                           team.squadQueue[i].unitList[j].hp += this._defModifier;
                           team.squadQueue[i].unitList[j].range += this._rangeModifier;
                           if(team.squadQueue[i].unitList[j].range <= 0)
                           {
                              team.squadQueue[i].unitList[j].range = 1;
                           }
                           if(team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                           {
                              team.squadQueue[i].unitList[j].maxChargeUpTime += this._castingTimeModifier;
                              team.squadQueue[i].unitList[j].chargeUpTime += this._castingTimeModifier;
                              team.squadQueue[i].unitList[j].SetSpecialEffectCastTime(this._castingTimeModifier);
                           }
                           else if(team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                           {
                              team.squadQueue[i].unitList[j].maxChargeUpTime += this._reloadTimeModifier;
                              team.squadQueue[i].unitList[j].chargeUpTime += this._reloadTimeModifier;
                           }
                           team.squadQueue[i].unitList[j].CheckDie();
                        }
                     }
                  }
               }
            }
            else if(this._range == Aura.RANGE_ENNEMYARMY)
            {
               if(this._owner.teamId == MiscConstants.TEAM1)
               {
                  ennemyTeam = context.roundManager.team2;
               }
               else
               {
                  ennemyTeam = context.roundManager.team1;
               }
               for(i = 0; i < ennemyTeam.squadQueue.length; i++)
               {
                  for(j = 0; j < ennemyTeam.squadQueue[i].unitList.length; j++)
                  {
                     if(ennemyTeam.squadQueue[i].unitList[j].metaActor != null)
                     {
                        if(this._genreCreature == 0 || this._genreCreature == ennemyTeam.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre || ennemyTeam.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                        {
                           for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                           {
                              ennemyTeam.squadQueue[i].unitList[j].metaStatsListAura.AddValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                           }
                           ennemyTeam.squadQueue[i].unitList[j].maxHp += this._defModifier;
                           ennemyTeam.squadQueue[i].unitList[j].hp += this._defModifier;
                           ennemyTeam.squadQueue[i].unitList[j].range += this._rangeModifier;
                           if(ennemyTeam.squadQueue[i].unitList[j].range <= 0)
                           {
                              ennemyTeam.squadQueue[i].unitList[j].range = 1;
                           }
                           if(ennemyTeam.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                           {
                              ennemyTeam.squadQueue[i].unitList[j].maxChargeUpTime += this._castingTimeModifier;
                              ennemyTeam.squadQueue[i].unitList[j].chargeUpTime += this._castingTimeModifier;
                              ennemyTeam.squadQueue[i].unitList[j].SetSpecialEffectCastTime(this._castingTimeModifier);
                           }
                           else if(ennemyTeam.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || ennemyTeam.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                           {
                              ennemyTeam.squadQueue[i].unitList[j].maxChargeUpTime += this._reloadTimeModifier;
                              ennemyTeam.squadQueue[i].unitList[j].chargeUpTime += this._reloadTimeModifier;
                           }
                           ennemyTeam.squadQueue[i].unitList[j].CheckDie();
                        }
                     }
                  }
               }
            }
            else if(this._range == RANGE_ALL)
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
                           for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                           {
                              team1.squadQueue[i].unitList[j].metaStatsListAura.AddValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                           }
                           team1.squadQueue[i].unitList[j].maxHp += this._defModifier;
                           team1.squadQueue[i].unitList[j].hp += this._defModifier;
                           team1.squadQueue[i].unitList[j].range += this._rangeModifier;
                           if(team1.squadQueue[i].unitList[j].range <= 0)
                           {
                              team1.squadQueue[i].unitList[j].range = 1;
                           }
                           if(team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                           {
                              team1.squadQueue[i].unitList[j].maxChargeUpTime += this._castingTimeModifier;
                              team1.squadQueue[i].unitList[j].chargeUpTime += this._castingTimeModifier;
                              team1.squadQueue[i].unitList[j].SetSpecialEffectCastTime(this._castingTimeModifier);
                           }
                           else if(team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                           {
                              team1.squadQueue[i].unitList[j].maxChargeUpTime += this._reloadTimeModifier;
                              team1.squadQueue[i].unitList[j].chargeUpTime += this._reloadTimeModifier;
                           }
                           team1.squadQueue[i].unitList[j].CheckDie();
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
                           for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                           {
                              team2.squadQueue[i].unitList[j].metaStatsListAura.AddValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                           }
                           team2.squadQueue[i].unitList[j].maxHp += this._defModifier;
                           team2.squadQueue[i].unitList[j].hp += this._defModifier;
                           team2.squadQueue[i].unitList[j].range += this._rangeModifier;
                           if(team2.squadQueue[i].unitList[j].range <= 0)
                           {
                              team2.squadQueue[i].unitList[j].range = 1;
                           }
                           if(team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                           {
                              team2.squadQueue[i].unitList[j].maxChargeUpTime += this._castingTimeModifier;
                              team2.squadQueue[i].unitList[j].chargeUpTime += this._castingTimeModifier;
                              team2.squadQueue[i].unitList[j].SetSpecialEffectCastTime(this._castingTimeModifier);
                           }
                           else if(team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                           {
                              team2.squadQueue[i].unitList[j].maxChargeUpTime += this._reloadTimeModifier;
                              team2.squadQueue[i].unitList[j].chargeUpTime += this._reloadTimeModifier;
                           }
                           team2.squadQueue[i].unitList[j].CheckDie();
                        }
                     }
                  }
               }
            }
            else if(this._range == RANGE_ALL_ELEMENTAL)
            {
               team1 = context.roundManager.team1;
               team2 = context.roundManager.team2;
               for(i = 0; i < team1.squadQueue.length; i++)
               {
                  for(j = 0; j < team1.squadQueue[i].unitList.length; j++)
                  {
                     if(team1.squadQueue[i].unitList[j].metaActor != null)
                     {
                        if(team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isElemental())
                        {
                           for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                           {
                              team1.squadQueue[i].unitList[j].metaStatsListAura.AddValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                           }
                           team1.squadQueue[i].unitList[j].maxHp += this._defModifier;
                           team1.squadQueue[i].unitList[j].hp += this._defModifier;
                           team1.squadQueue[i].unitList[j].range += this._rangeModifier;
                           if(team1.squadQueue[i].unitList[j].range <= 0)
                           {
                              team1.squadQueue[i].unitList[j].range = 1;
                           }
                           if(team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                           {
                              team1.squadQueue[i].unitList[j].maxChargeUpTime += this._castingTimeModifier;
                              team1.squadQueue[i].unitList[j].chargeUpTime += this._castingTimeModifier;
                              team1.squadQueue[i].unitList[j].SetSpecialEffectCastTime(this._castingTimeModifier);
                           }
                           else if(team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                           {
                              team1.squadQueue[i].unitList[j].maxChargeUpTime += this._reloadTimeModifier;
                              team1.squadQueue[i].unitList[j].chargeUpTime += this._reloadTimeModifier;
                           }
                           team1.squadQueue[i].unitList[j].CheckDie();
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
                        if(team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isElemental())
                        {
                           for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                           {
                              team2.squadQueue[i].unitList[j].metaStatsListAura.AddValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                           }
                           team2.squadQueue[i].unitList[j].maxHp += this._defModifier;
                           team2.squadQueue[i].unitList[j].hp += this._defModifier;
                           team2.squadQueue[i].unitList[j].range += this._rangeModifier;
                           if(team2.squadQueue[i].unitList[j].range <= 0)
                           {
                              team2.squadQueue[i].unitList[j].range = 1;
                           }
                           if(team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                           {
                              team2.squadQueue[i].unitList[j].maxChargeUpTime += this._castingTimeModifier;
                              team2.squadQueue[i].unitList[j].chargeUpTime += this._castingTimeModifier;
                              team2.squadQueue[i].unitList[j].SetSpecialEffectCastTime(this._castingTimeModifier);
                           }
                           else if(team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                           {
                              team2.squadQueue[i].unitList[j].maxChargeUpTime += this._reloadTimeModifier;
                              team2.squadQueue[i].unitList[j].chargeUpTime += this._reloadTimeModifier;
                           }
                           team2.squadQueue[i].unitList[j].CheckDie();
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function get reloadTimeModifier() : int
      {
         return this._reloadTimeModifier;
      }
      
      public function get rangeModifier() : int
      {
         return this._rangeModifier;
      }
      
      public function RemoveAura() : void
      {
         var i:int = 0;
         var j:int = 0;
         var k:int = 0;
         var team1:BattleArmy = null;
         var team2:BattleArmy = null;
         var team:BattleArmy = null;
         var ennemyTeam:BattleArmy = null;
         if(this._end)
         {
            this._end = false;
            if(Boolean(this._ownerSquad) && this._range == RANGE_SQUAD)
            {
               for(i = 0; i < this._ownerSquad.unitList.length; i++)
               {
                  if(!(Boolean(this._ownerSquad) && this._ownerSquad.unitList[i].metaActor == null))
                  {
                     if(this._genreCreature == 0 || this._ownerSquad.unitList[i].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == this._genreCreature || this._ownerSquad.unitList[i].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                     {
                        for(j = 0; j < ModelStatsEnum.ALL.length; j++)
                        {
                           this._ownerSquad.unitList[i].metaStatsListAura.RemoveValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[j]),ModelStatsEnum.ALL[j]);
                        }
                        this._ownerSquad.unitList[i].maxHp -= this._defModifier;
                        this._ownerSquad.unitList[i].hp -= this._defModifier;
                        this._ownerSquad.unitList[i].range -= this._rangeModifier;
                        if(this._ownerSquad.unitList[i].range <= 0)
                        {
                           this._ownerSquad.unitList[i].range = 1;
                        }
                        if(this._ownerSquad.unitList[i].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                        {
                           this._ownerSquad.unitList[i].maxChargeUpTime -= this._castingTimeModifier;
                           this._ownerSquad.unitList[i].SetSpecialEffectCastTime(-this._castingTimeModifier);
                        }
                        else if(this._ownerSquad.unitList[i].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || this._ownerSquad.unitList[i].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                        {
                           this._ownerSquad.unitList[i].maxChargeUpTime -= this._reloadTimeModifier;
                        }
                        this._ownerSquad.unitList[i].CheckDie();
                     }
                  }
               }
            }
            else if(this._range == RANGE_ARMY)
            {
               if(this._owner.teamId == MiscConstants.TEAM1)
               {
                  team = context.roundManager.team1;
               }
               else
               {
                  team = context.roundManager.team2;
               }
               for(i = 0; i < team.squadQueue.length; i++)
               {
                  for(j = 0; j < team.squadQueue[i].unitList.length; j++)
                  {
                     if(team.squadQueue[i].unitList[j].metaActor != null)
                     {
                        if(this._genreCreature == 0 || this._genreCreature == team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre || team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                        {
                           for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                           {
                              team.squadQueue[i].unitList[j].metaStatsListAura.RemoveValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                           }
                           team.squadQueue[i].unitList[j].maxHp -= this._defModifier;
                           team.squadQueue[i].unitList[j].hp -= this._defModifier;
                           team.squadQueue[i].unitList[j].range -= this._rangeModifier;
                           if(team.squadQueue[i].unitList[j].range <= 0)
                           {
                              team.squadQueue[i].unitList[j].range = 1;
                           }
                           if(team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                           {
                              team.squadQueue[i].unitList[j].maxChargeUpTime -= this._castingTimeModifier;
                              team.squadQueue[i].unitList[j].SetSpecialEffectCastTime(-this._castingTimeModifier);
                           }
                           else if(team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                           {
                              team.squadQueue[i].unitList[j].maxChargeUpTime -= this._reloadTimeModifier;
                           }
                           team.squadQueue[i].unitList[j].CheckDie();
                        }
                     }
                  }
               }
            }
            else if(this._range == Aura.RANGE_ENNEMYARMY)
            {
               if(this._owner.teamId == MiscConstants.TEAM1)
               {
                  ennemyTeam = context.roundManager.team2;
               }
               else
               {
                  ennemyTeam = context.roundManager.team1;
               }
               for(i = 0; i < ennemyTeam.squadQueue.length; i++)
               {
                  for(j = 0; j < ennemyTeam.squadQueue[i].unitList.length; j++)
                  {
                     if(ennemyTeam.squadQueue[i].unitList[j].metaActor != null)
                     {
                        if(this._genreCreature == 0 || this._genreCreature == ennemyTeam.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre || ennemyTeam.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                        {
                           for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                           {
                              ennemyTeam.squadQueue[i].unitList[j].metaStatsListAura.RemoveValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                           }
                           ennemyTeam.squadQueue[i].unitList[j].maxHp -= this._defModifier;
                           ennemyTeam.squadQueue[i].unitList[j].hp -= this._defModifier;
                           ennemyTeam.squadQueue[i].unitList[j].range -= this._rangeModifier;
                           if(ennemyTeam.squadQueue[i].unitList[j].range <= 0)
                           {
                              ennemyTeam.squadQueue[i].unitList[j].range = 1;
                           }
                           if(ennemyTeam.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                           {
                              ennemyTeam.squadQueue[i].unitList[j].maxChargeUpTime -= this._castingTimeModifier;
                              ennemyTeam.squadQueue[i].unitList[j].SetSpecialEffectCastTime(-this._castingTimeModifier);
                           }
                           else if(ennemyTeam.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || ennemyTeam.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                           {
                              ennemyTeam.squadQueue[i].unitList[j].maxChargeUpTime -= this._reloadTimeModifier;
                           }
                           ennemyTeam.squadQueue[i].unitList[j].CheckDie();
                        }
                     }
                  }
               }
            }
            else if(this._range == RANGE_ALL)
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
                           for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                           {
                              team1.squadQueue[i].unitList[j].metaStatsListAura.RemoveValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                           }
                           team1.squadQueue[i].unitList[j].maxHp -= this._defModifier;
                           team1.squadQueue[i].unitList[j].hp -= this._defModifier;
                           team1.squadQueue[i].unitList[j].range -= this._rangeModifier;
                           if(team1.squadQueue[i].unitList[j].range <= 0)
                           {
                              team1.squadQueue[i].unitList[j].range = 1;
                           }
                           if(team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                           {
                              team1.squadQueue[i].unitList[j].maxChargeUpTime -= this._castingTimeModifier;
                              team1.squadQueue[i].unitList[j].SetSpecialEffectCastTime(-this._castingTimeModifier);
                           }
                           else if(team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                           {
                              team1.squadQueue[i].unitList[j].maxChargeUpTime -= this._reloadTimeModifier;
                           }
                           team1.squadQueue[i].unitList[j].CheckDie();
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
                           for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                           {
                              team2.squadQueue[i].unitList[j].metaStatsListAura.RemoveValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                           }
                           team2.squadQueue[i].unitList[j].maxHp -= this._defModifier;
                           team2.squadQueue[i].unitList[j].hp -= this._defModifier;
                           team2.squadQueue[i].unitList[j].range -= this._rangeModifier;
                           if(team2.squadQueue[i].unitList[j].range <= 0)
                           {
                              team2.squadQueue[i].unitList[j].range = 1;
                           }
                           if(team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                           {
                              team2.squadQueue[i].unitList[j].maxChargeUpTime -= this._castingTimeModifier;
                              team2.squadQueue[i].unitList[j].SetSpecialEffectCastTime(-this._castingTimeModifier);
                           }
                           else if(team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                           {
                              team2.squadQueue[i].unitList[j].maxChargeUpTime -= this._reloadTimeModifier;
                           }
                           team2.squadQueue[i].unitList[j].CheckDie();
                        }
                     }
                  }
               }
            }
            else if(this._range == RANGE_ALL_ELEMENTAL)
            {
               team1 = context.roundManager.team1;
               team2 = context.roundManager.team2;
               for(i = 0; i < team1.squadQueue.length; i++)
               {
                  for(j = 0; j < team1.squadQueue[i].unitList.length; j++)
                  {
                     if(team1.squadQueue[i].unitList[j].metaActor != null)
                     {
                        if(team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isElemental())
                        {
                           for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                           {
                              team1.squadQueue[i].unitList[j].metaStatsListAura.RemoveValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                           }
                           team1.squadQueue[i].unitList[j].maxHp -= this._defModifier;
                           team1.squadQueue[i].unitList[j].hp -= this._defModifier;
                           team1.squadQueue[i].unitList[j].range -= this._rangeModifier;
                           if(team1.squadQueue[i].unitList[j].range <= 0)
                           {
                              team1.squadQueue[i].unitList[j].range = 1;
                           }
                           if(team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                           {
                              team1.squadQueue[i].unitList[j].maxChargeUpTime -= this._castingTimeModifier;
                              team1.squadQueue[i].unitList[j].SetSpecialEffectCastTime(-this._castingTimeModifier);
                           }
                           else if(team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                           {
                              team1.squadQueue[i].unitList[j].maxChargeUpTime -= this._reloadTimeModifier;
                           }
                           team1.squadQueue[i].unitList[j].CheckDie();
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
                        if(team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isElemental())
                        {
                           for(k = 0; k < ModelStatsEnum.ALL.length; k++)
                           {
                              team2.squadQueue[i].unitList[j].metaStatsListAura.RemoveValue(this._statsModifier.GetStatsValue(ModelStatsEnum.ALL[k]),ModelStatsEnum.ALL[k]);
                           }
                           team2.squadQueue[i].unitList[j].maxHp -= this._defModifier;
                           team2.squadQueue[i].unitList[j].hp -= this._defModifier;
                           team2.squadQueue[i].unitList[j].range -= this._rangeModifier;
                           if(team2.squadQueue[i].unitList[j].range <= 0)
                           {
                              team2.squadQueue[i].unitList[j].range = 1;
                           }
                           if(team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                           {
                              team2.squadQueue[i].unitList[j].maxChargeUpTime -= this._castingTimeModifier;
                              team2.squadQueue[i].unitList[j].SetSpecialEffectCastTime(-this._castingTimeModifier);
                           }
                           else if(team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.IsRange() || team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isArtillery())
                           {
                              team2.squadQueue[i].unitList[j].maxChargeUpTime -= this._reloadTimeModifier;
                           }
                           team2.squadQueue[i].unitList[j].CheckDie();
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function get genreCreature() : int
      {
         return this._genreCreature;
      }
      
      public function set reloadTimeModifier(reloadTimeModifier:int) : void
      {
         this._reloadTimeModifier = reloadTimeModifier;
      }
      
      public function Reset() : void
      {
      }
   }
}

