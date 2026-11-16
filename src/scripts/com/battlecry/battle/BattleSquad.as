package com.battlecry.battle
{
   import com.battlecry.BC_Game;
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.enemy.BC_EnemyManager;
   import com.battlecry.meta.BC_MetaActor;
   import com.battlecry.meta.BC_MetaSquad;
   import com.battlecry.meta.MetaSquadSpeedEnum;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelStatsEnum;
   import com.battlecry.specialEffect.aura.Aura;
   import com.lachhhEngine.games.Game;
   import flash.geom.Point;
   
   public class BattleSquad
   {
      
      private var _position:int;
      
      private var _unitList:Vector.<BC_Actor> = new Vector.<BC_Actor>();
      
      private var _context:BC_Game;
      
      private var _metaSquad:BC_MetaSquad;
      
      private var _id:int;
      
      private var _team:int;
      
      private var _inBattleField:Boolean;
      
      public function BattleSquad(teamId:int, Id:int, position:int)
      {
         super();
         this._team = teamId;
         this._id = Id;
         this._position = position;
         this._inBattleField = false;
      }
      
      public function Attack() : void
      {
         for(var i:int = 0; i < this._unitList.length; i++)
         {
            this._unitList[i].Attack();
         }
      }
      
      public function set team(team:int) : void
      {
         this._team = team;
      }
      
      public function isEmpty() : Boolean
      {
         if(this._unitList.length == 0)
         {
            return true;
         }
         return false;
      }
      
      public function ReArrangeUnit() : void
      {
         var i:int = 0;
         var j:int = 0;
         var tempo:BC_Actor = null;
         if(this._team == MiscConstants.TEAM1)
         {
            for(i = 0; i < 18; i++)
            {
               for(j = int(this._unitList.length - 1); j > 0; j--)
               {
                  if(this._unitList[j].positionInSquad.x > this._unitList[j - 1].positionInSquad.x)
                  {
                     tempo = this._unitList[j];
                     this._unitList[j] = this._unitList[j - 1];
                     this._unitList[j - 1] = tempo;
                  }
                  else if(this._unitList[j].positionInSquad.x == this._unitList[j - 1].positionInSquad.x)
                  {
                     if(this._unitList[j].positionInSquad.y < this._unitList[j - 1].positionInSquad.y)
                     {
                        tempo = this._unitList[j];
                        this._unitList[j] = this._unitList[j - 1];
                        this._unitList[j - 1] = tempo;
                     }
                  }
               }
            }
         }
         else
         {
            for(i = 0; i < 18; i++)
            {
               for(j = int(this._unitList.length - 1); j > 0; j--)
               {
                  if(this._unitList[j].positionInSquad.x < this._unitList[j - 1].positionInSquad.x)
                  {
                     tempo = this._unitList[j];
                     this._unitList[j] = this._unitList[j - 1];
                     this._unitList[j - 1] = tempo;
                  }
                  else if(this._unitList[j].positionInSquad.x == this._unitList[j - 1].positionInSquad.x)
                  {
                     if(this._unitList[j].positionInSquad.y < this._unitList[j - 1].positionInSquad.y)
                     {
                        tempo = this._unitList[j];
                        this._unitList[j] = this._unitList[j - 1];
                        this._unitList[j - 1] = tempo;
                     }
                  }
               }
            }
         }
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function UpdateVisual() : void
      {
         for(var i:int = 0; i < this._unitList.length; i++)
         {
            this._unitList[i].UpdateVisual(this._inBattleField);
            this._unitList[i].CastTimed();
         }
      }
      
      public function get inBattleField() : Boolean
      {
         return this._inBattleField;
      }
      
      public function UpdateUnit() : void
      {
         var team:BattleArmy = null;
         var l:int = int(this._unitList.length);
         for(var i:int = 0; i < l; i++)
         {
            if(this._unitList[i].IsDead || this._unitList[i].teamId != this._team)
            {
               if(this.RemoveFromVector(this._unitList,this._unitList[i]))
               {
                  i--;
                  l--;
               }
            }
         }
         if(this.isEmpty())
         {
            this._metaSquad.speed = MetaSquadSpeedEnum.SPEED_HOLD;
            if(this._inBattleField)
            {
               this._context.roundManager.StopBattleField();
               if(this._team == MiscConstants.TEAM1)
               {
                  team = this._context.roundManager.team1;
               }
               else
               {
                  team = this._context.roundManager.team2;
               }
            }
         }
      }
      
      public function SurvivalMove() : void
      {
         for(var i:int = 0; i < this._unitList.length; i++)
         {
            this._unitList[i].SurvivalMove();
         }
      }
      
      private function RemoveFromVector(v:Vector.<BC_Actor>, elem:Object) : Boolean
      {
         for(var i:int = 0; i < v.length; i++)
         {
            if(v[i] == elem)
            {
               v.splice(i,1);
               return true;
            }
         }
         return false;
      }
      
      public function buildUnit(metaActor:BC_MetaActor) : void
      {
         this._unitList.push((this._context.enemyManager as BC_EnemyManager).CreateUnit(metaActor));
      }
      
      public function set unitList(unitList:Vector.<BC_Actor>) : void
      {
         this._unitList = unitList;
      }
      
      public function set metaSquad(metaSquad:BC_MetaSquad) : void
      {
         this._metaSquad = metaSquad;
      }
      
      public function AllUnitIdle() : void
      {
         for(var i:int = 0; i < this._unitList.length; i++)
         {
            this._unitList[i].AllUnitIdle();
         }
      }
      
      public function Destroy() : void
      {
         for(var i:int = 0; i < this._unitList.length; i++)
         {
            this._unitList[i].Destroy();
         }
      }
      
      public function DamageResolution() : void
      {
         for(var i:int = 0; i < this._unitList.length; i++)
         {
            this._unitList[i].DamageResolution();
         }
      }
      
      public function set inBattleField(inBattleField:Boolean) : void
      {
         this._inBattleField = inBattleField;
      }
      
      public function get team() : int
      {
         return this._team;
      }
      
      public function SortOnce() : void
      {
         for(var i:int = 0; i < this._unitList.length; i++)
         {
            this._unitList[i].SortOnYDepth();
         }
      }
      
      public function CastAura() : void
      {
         for(var i:int = 0; i < this._unitList.length; i++)
         {
            this._unitList[i].CastAura();
         }
      }
      
      private function addAura(actor:BC_Actor) : void
      {
         var team1:BattleArmy = null;
         var team2:BattleArmy = null;
         var i:int = 0;
         var j:int = 0;
         var k:int = 0;
         var m:int = 0;
         var aura:Aura = null;
         var squad:BattleSquad = null;
         if(actor.teamId == MiscConstants.TEAM1)
         {
            team1 = this._context.roundManager.team1;
            team2 = this._context.roundManager.team2;
         }
         else
         {
            team1 = this._context.roundManager.team2;
            team2 = this._context.roundManager.team1;
         }
         squad = team1.getSquad(actor.squadId);
         if(squad != null)
         {
            for(i = 0; i < squad.unitList.length; i++)
            {
               for(j = 0; j < squad.unitList[i].specialEffectManager.auraModifier.length; j++)
               {
                  aura = squad.unitList[i].specialEffectManager.auraModifier[j];
                  if(aura.genreCreature == 0 || aura.genreCreature == actor.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre || aura.genreCreature == ModelEquipement.GENRE_CREATURE_ALL)
                  {
                     if(aura.range == Aura.RANGE_SQUAD)
                     {
                        for(m = 0; m < ModelStatsEnum.ALL.length; m++)
                        {
                           actor.metaStatsListAura.AddValue(aura.statsModifier.GetStatsValue(ModelStatsEnum.ALL[m]),ModelStatsEnum.ALL[m]);
                        }
                        actor.maxHp += aura.defModifier;
                        actor.hp += aura.defModifier;
                        actor.range += aura.rangeModifier;
                        if(actor.range <= 0)
                        {
                           actor.range = 1;
                        }
                        if(actor.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                        {
                           actor.maxChargeUpTime += aura.castingTimeModifier;
                           actor.chargeUpTime += aura.castingTimeModifier;
                        }
                        actor.CheckDie();
                     }
                  }
               }
            }
         }
         for(i = 0; i < team1.squadQueue.length; i++)
         {
            for(j = 0; j < team1.squadQueue[i].unitList.length; j++)
            {
               for(k = 0; k < team1.squadQueue[i].unitList[j].specialEffectManager.auraModifier.length; k++)
               {
                  aura = team1.squadQueue[i].unitList[j].specialEffectManager.auraModifier[k];
                  if(aura.genreCreature == 0 || aura.genreCreature == actor.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre || actor.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                  {
                     if(aura.range == Aura.RANGE_ARMY || aura.range == Aura.RANGE_ALL || aura.range == Aura.RANGE_ALL_ELEMENTAL && actor.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isElemental())
                     {
                        for(m = 0; m < ModelStatsEnum.ALL.length; m++)
                        {
                           actor.metaStatsListAura.AddValue(aura.statsModifier.GetStatsValue(ModelStatsEnum.ALL[m]),ModelStatsEnum.ALL[m]);
                        }
                        actor.maxHp += aura.defModifier;
                        actor.hp += aura.defModifier;
                        actor.range += aura.rangeModifier;
                        if(actor.range <= 0)
                        {
                           actor.range = 1;
                        }
                        if(actor.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                        {
                           actor.maxChargeUpTime += aura.castingTimeModifier;
                           actor.chargeUpTime += aura.castingTimeModifier;
                        }
                        actor.CheckDie();
                     }
                  }
               }
            }
         }
         for(i = 0; i < team2.squadQueue.length; i++)
         {
            for(j = 0; j < team2.squadQueue[i].unitList.length; j++)
            {
               for(k = 0; k < team2.squadQueue[i].unitList[j].specialEffectManager.auraModifier.length; k++)
               {
                  aura = team2.squadQueue[i].unitList[j].specialEffectManager.auraModifier[k];
                  if(aura.genreCreature == 0 || aura.genreCreature == actor.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre || actor.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                  {
                     if(aura.range == Aura.RANGE_ALL || aura.range == Aura.RANGE_ALL_ELEMENTAL && actor.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.isElemental())
                     {
                        for(m = 0; m < ModelStatsEnum.ALL.length; m++)
                        {
                           actor.metaStatsListAura.AddValue(aura.statsModifier.GetStatsValue(ModelStatsEnum.ALL[m]),ModelStatsEnum.ALL[m]);
                        }
                        actor.maxHp += aura.defModifier;
                        actor.hp += aura.defModifier;
                        actor.range += aura.rangeModifier;
                        if(actor.range <= 0)
                        {
                           actor.range = 1;
                        }
                        if(actor.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
                        {
                           actor.maxChargeUpTime += aura.castingTimeModifier;
                           actor.chargeUpTime += aura.castingTimeModifier;
                        }
                        actor.CheckDie();
                     }
                  }
               }
            }
         }
      }
      
      public function Move2() : void
      {
         var i:int = 0;
         var j:int = 0;
         if(this._metaSquad.speed.speedValue > 1)
         {
            if(this._inBattleField)
            {
               for(i = 0; i < this._unitList.length; i++)
               {
                  if(this._team == MiscConstants.TEAM1)
                  {
                     if(this._unitList[i].gridCase.gridPos.x <= this._position + 2)
                     {
                        this._unitList[i].MoveInBattleField();
                     }
                  }
                  else if(this._unitList[i].gridCase.gridPos.x >= this._position + 1)
                  {
                     this._unitList[i].MoveInBattleField();
                  }
               }
            }
            else
            {
               for(j = 0; j < this._unitList.length; j++)
               {
                  if(this._team == MiscConstants.TEAM1)
                  {
                     if(this._unitList[j].gridCase.gridPos.x <= this._position + 2)
                     {
                        this._unitList[j].Move2();
                     }
                  }
                  else if(this._unitList[j].gridCase.gridPos.x >= this._position + 1)
                  {
                     this._unitList[j].Move2();
                  }
               }
            }
         }
      }
      
      public function get position() : int
      {
         return this._position;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function buildSummon(metaActor:BC_MetaActor) : void
      {
         var actor:BC_Actor = (this._context.enemyManager as BC_EnemyManager).CreateUnit(metaActor);
         actor.skeletonRaise = true;
         this.addAura(actor);
         this._unitList.push(actor);
         this.ReArrangeUnit();
      }
      
      public function Move() : void
      {
         var i:int = 0;
         if(this._inBattleField)
         {
            for(i = 0; i < this._unitList.length; i++)
            {
               if(this._team == MiscConstants.TEAM1)
               {
                  if(this._unitList[i].gridCase.gridPos.x <= this._position + 2)
                  {
                     this._unitList[i].MoveInBattleField();
                  }
               }
               else if(this._unitList[i].gridCase.gridPos.x >= this._position - 2)
               {
                  this._unitList[i].MoveInBattleField();
               }
            }
         }
         else if(this._metaSquad.speed.speedValue > 0)
         {
            for(i = 0; i < this._unitList.length; i++)
            {
               if(this._team == MiscConstants.TEAM1)
               {
                  if(this._unitList[i].gridCase.gridPos.x <= this._position + 2)
                  {
                     this._unitList[i].Move();
                  }
               }
               else if(this._unitList[i].gridCase.gridPos.x >= this._position - 2)
               {
                  this._unitList[i].Move();
               }
            }
         }
      }
      
      public function GetPos0() : Point
      {
         var p:Point = null;
         if(this._team == MiscConstants.TEAM1)
         {
            p = this._context.grid.gridCasePosition(new GridCase(new GridPos(this._position + 2,0)));
         }
         else
         {
            p = this._context.grid.gridCasePosition(new GridCase(new GridPos(this._position,0)));
         }
         return p;
      }
      
      public function get metaSquad() : BC_MetaSquad
      {
         return this._metaSquad;
      }
      
      public function Init(context:Game, metaSquad:BC_MetaSquad) : void
      {
         this._context = context as BC_Game;
         this._metaSquad = metaSquad;
      }
      
      public function ResetAll() : void
      {
         for(var i:int = 0; i < this._unitList.length; i++)
         {
            this._unitList[i].ResetAll();
         }
      }
      
      public function get unitList() : Vector.<BC_Actor>
      {
         return this._unitList;
      }
      
      public function GetRandomUnit() : BC_Actor
      {
         var randomIndex:int = Math.floor(Math.random() * this._unitList.length);
         return this._unitList[randomIndex];
      }
      
      public function set position(position:int) : void
      {
         this._position = position;
      }
   }
}

