package com.battlecry.battle
{
   import com.battlecry.BC_Game;
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.enemy.BC_EnemyFactory;
   import com.battlecry.enemy.BC_EnemyManager;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.BC_MetaSquad;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.meta.MetaSquadSpeedEnum;
   
   public class BattleArmy
   {
      
      private var _squadQueue:Vector.<BattleSquad> = new Vector.<BattleSquad>();
      
      private var _metaArmy:BC_MetaArmy;
      
      private var _isSurvival:Boolean;
      
      private var _team:int;
      
      private var _squad1:BattleSquad;
      
      private var _squad2:BattleSquad;
      
      private var _squad3:BattleSquad;
      
      private var _squad4:BattleSquad;
      
      private var _squad5:BattleSquad;
      
      private var _skeletonSquad:Vector.<BattleSquad>;
      
      private var _context:BC_Game;
      
      private var bonusID:int;
      
      public function BattleArmy(teamId:int)
      {
         super();
         this._team = teamId;
      }
      
      public function RemoveAllUnit() : void
      {
         var length:int = int(this._squadQueue.length);
         for(var i:int = length - 1; i >= 0; i--)
         {
            this.RemoveFromVector(this._squadQueue,this._squadQueue[i]);
         }
      }
      
      public function getSquad(num:int) : BattleSquad
      {
         switch(num)
         {
            case 1:
               return this._squad1;
            case 2:
               return this._squad2;
            case 3:
               return this._squad3;
            case 4:
               return this._squad4;
            case 5:
               return this._squad5;
            default:
               return null;
         }
      }
      
      public function UpdateVisual() : void
      {
         this._context.grid.Refresh();
         for(var i:int = 0; i < this._squadQueue.length; i++)
         {
            this._squadQueue[i].UpdateVisual();
         }
      }
      
      public function set metaArmy(metaArmy:BC_MetaArmy) : void
      {
         this._metaArmy = metaArmy;
      }
      
      public function UpdateUnit() : void
      {
         var j:int = 0;
         var length:int = int(this._squadQueue.length);
         for(var i:int = length - 1; i >= 0; i--)
         {
            this._squadQueue[i].UpdateUnit();
            if(this._squadQueue[i].isEmpty())
            {
               this.RemoveFromVector(this._squadQueue,this._squadQueue[i]);
            }
         }
         if(this._squadQueue.length > 0)
         {
            if(this._squadQueue[0].metaSquad.speed.speedValue <= 0)
            {
               this._squadQueue[0].metaSquad.speed = MetaSquadSpeedEnum.SPEED_SLOW;
               for(j = 0; j < this._squadQueue[0].unitList.length; j++)
               {
                  this._squadQueue[0].unitList[j].metaActor.metaUnit.speed = MetaSquadSpeedEnum.SPEED_SLOW;
               }
            }
         }
      }
      
      public function AllUnitIdle() : void
      {
         var length:int = int(this._squadQueue.length);
         for(var i:int = length - 1; i >= 0; i--)
         {
            this._squadQueue[i].AllUnitIdle();
         }
      }
      
      public function PushSkeletonWarrior() : void
      {
         var freePos:GridPos = null;
         var metaSkeleton:BC_MetaUnit = null;
         for(var i:int = 0; i < this._squadQueue.length; i++)
         {
            if(this._squadQueue[i].unitList.length <= 17)
            {
               freePos = this._context.roundManager.grid.ReturnFreePosition(this._squadQueue[i].position,this._squadQueue[i].team);
               if(freePos != null)
               {
                  metaSkeleton = (this._context.enemyManager as BC_EnemyManager).CreateMetaImmortalWarrior();
                  metaSkeleton.posInSquad = freePos;
                  this._squadQueue[i].buildSummon((this._context.enemyManager as BC_EnemyManager).CreateMetaActor(BC_EnemyFactory.ID_UNIT,0,0,0,0,this._squadQueue[i].id,this._squadQueue[i].team,metaSkeleton,this._squadQueue[i].metaSquad.speed));
                  return;
               }
            }
         }
      }
      
      private function CreateSummon(squad:BattleSquad, type:int, onRaiseUndead:Boolean, index:int = -1) : Boolean
      {
         var metaSummon:BC_MetaUnit = null;
         if(BC_VersionInfo.isBitMapMode)
         {
            switch(type)
            {
               case Summon.TYPE_UNDEAD:
                  metaSummon = BC_Game.instance.skeleton;
                  break;
               case Summon.TYPE_IMMORTAL_WARRIOR:
                  metaSummon = BC_Game.instance.immortalWarrior;
                  break;
               case Summon.TYPE_DEMON:
                  metaSummon = BC_Game.instance.demonWarrior;
            }
         }
         else
         {
            switch(type)
            {
               case Summon.TYPE_UNDEAD:
                  metaSummon = (this._context.enemyManager as BC_EnemyManager).CreateMetaSkeleton();
                  break;
               case Summon.TYPE_IMMORTAL_WARRIOR:
                  metaSummon = (this._context.enemyManager as BC_EnemyManager).CreateMetaImmortalWarrior();
                  break;
               case Summon.TYPE_DEMON:
                  metaSummon = (this._context.enemyManager as BC_EnemyManager).CreateMetaDemon();
            }
         }
         var freePos:GridPos = this._context.roundManager.grid.ReturnFreePosition(squad.position,squad.team);
         if(freePos == null)
         {
            return false;
         }
         if(this._team == MiscConstants.TEAM2)
         {
            freePos.x = 2 - freePos.x;
         }
         metaSummon.posInSquad = freePos;
         if(index != -1)
         {
            this._squadQueue[index].buildSummon((this._context.enemyManager as BC_EnemyManager).CreateMetaActor(BC_EnemyFactory.ID_UNIT,0,0,0,0,this._squadQueue[index].id,this._squadQueue[index].team,metaSummon,this._squadQueue[index].metaSquad.speed));
         }
         else
         {
            squad.buildSummon((this._context.enemyManager as BC_EnemyManager).CreateMetaActor(BC_EnemyFactory.ID_UNIT,0,0,0,0,squad.id,squad.team,metaSummon,squad.metaSquad.speed));
         }
         if(onRaiseUndead && type == Summon.TYPE_UNDEAD || type == Summon.TYPE_IMMORTAL_WARRIOR)
         {
            this._context.roundManager.summonManager.CastOnUndeadRaise(type,this._team);
         }
         return true;
      }
      
      public function DamageResolution() : void
      {
         for(var i:int = 0; i < this._squadQueue.length; i++)
         {
            this._squadQueue[i].DamageResolution();
         }
      }
      
      public function GetSquad(squadId:int) : BattleSquad
      {
         var squad:BattleSquad = null;
         for(var i:int = 0; i < this._squadQueue.length; i++)
         {
            if(this._squadQueue[i].id == squadId)
            {
               squad = this._squadQueue[i];
            }
         }
         return squad;
      }
      
      private function CanMove(i:int) : Boolean
      {
         var pos1:int = 0;
         var pos2:int = 0;
         pos1 = this._squadQueue[i].position;
         if(i == 0)
         {
            if(this._team == MiscConstants.TEAM1)
            {
               pos2 = this._context.team2.squadQueue[0].position;
            }
            else
            {
               pos2 = this._context.team1.squadQueue[0].position;
            }
         }
         else
         {
            pos2 = this._squadQueue[i - 1].position;
         }
         if(this._team == MiscConstants.TEAM1)
         {
            if(pos2 - pos1 > 3)
            {
               return true;
            }
            return false;
         }
         if(pos1 - pos2 > 3)
         {
            return true;
         }
         return false;
      }
      
      public function CreateNewSquad(squadPos:int) : BattleSquad
      {
         var id:int = this.bonusID++;
         var metaSquad:BC_MetaSquad = new BC_MetaSquad(id,this.metaArmy,squadPos);
         metaSquad.speed = MetaSquadSpeedEnum.SPEED_SLOW;
         var squad:BattleSquad = new BattleSquad(this._team,id,squadPos);
         squad.Init(this._context,metaSquad);
         this._squadQueue.push(squad);
         this._skeletonSquad.push(squad);
         this.reArrangeSquad();
         return squad;
      }
      
      public function Init(context:BC_Game, metaArmy:BC_MetaArmy, isSurvival:Boolean) : void
      {
         this._context = context;
         this._metaArmy = metaArmy;
         this._skeletonSquad = new Vector.<BattleSquad>();
         this._isSurvival = isSurvival;
         this.bonusID = 6;
         var iterator:int = 0;
         var modifier:int = 0;
         if(this._team == MiscConstants.TEAM1)
         {
            iterator = 18;
            modifier = -4;
         }
         else
         {
            iterator = 25;
            modifier = 4;
         }
         this._squad1 = new BattleSquad(this._team,1,iterator);
         this._squad1.Init(this._context,this._metaArmy.metaSquad1);
         iterator += modifier;
         this._squad2 = new BattleSquad(this._team,2,iterator);
         this._squad2.Init(this._context,this._metaArmy.metaSquad2);
         iterator += modifier;
         this._squad3 = new BattleSquad(this._team,3,iterator);
         this._squad3.Init(this._context,this._metaArmy.metaSquad3);
         iterator += modifier;
         this._squad4 = new BattleSquad(this._team,4,iterator);
         this._squad4.Init(this._context,this._metaArmy.metaSquad4);
         iterator += modifier;
         this._squad5 = new BattleSquad(this._team,5,iterator);
         this._squad5.Init(this._context,this._metaArmy.metaSquad5);
         iterator += modifier;
         this._squadQueue.push(this._squad1);
         this._squadQueue.push(this._squad2);
         this._squadQueue.push(this._squad3);
         this._squadQueue.push(this._squad4);
         this._squadQueue.push(this._squad5);
         this.InitArmy();
      }
      
      public function set team(team:int) : void
      {
         this._team = team;
      }
      
      public function PushSummon(type:int, onRaiseUndead:Boolean) : void
      {
         var i:int = 0;
         var squad:BattleSquad = null;
         var ennemySquad:BattleSquad = null;
         if(this._team == MiscConstants.TEAM1)
         {
            if(this._context.team2.squadQueue.length <= 0)
            {
               return;
            }
            ennemySquad = this._context.team2.squadQueue[0];
         }
         else
         {
            if(this._context.team1.squadQueue.length <= 0)
            {
               return;
            }
            ennemySquad = this._context.team1.squadQueue[0];
         }
         for(i = 0; i < this._squadQueue.length; i++)
         {
            if(this._team == MiscConstants.TEAM1)
            {
               if(i == 0)
               {
                  if(ennemySquad.position < 22)
                  {
                     if(ennemySquad.position - this._squadQueue[i].position >= 6)
                     {
                        squad = this.CreateNewSquad(ennemySquad.position - 3);
                        this.CreateSummon(squad,type,onRaiseUndead);
                        return;
                     }
                  }
                  else if(22 - this._squadQueue[i].position >= 6)
                  {
                     squad = this.CreateNewSquad(19);
                     this.CreateSummon(squad,type,onRaiseUndead);
                     return;
                  }
               }
               else if(this._squadQueue[i - 1].position - this._squadQueue[i].position >= 6)
               {
                  squad = this.CreateNewSquad(this._squadQueue[i - 1].position - 3);
                  this.CreateSummon(squad,type,onRaiseUndead);
                  return;
               }
               if(i == this._squadQueue.length - 1)
               {
                  if(this.CreateSummon(this._squadQueue[i],type,onRaiseUndead))
                  {
                     return;
                  }
                  if(this._squadQueue[i].position >= 3)
                  {
                     squad = this.CreateNewSquad(this._squadQueue[i].position - 3);
                     this.CreateSummon(squad,type,onRaiseUndead);
                     return;
                  }
               }
            }
            else
            {
               if(i == 0)
               {
                  if(ennemySquad.position >= 22)
                  {
                     if(ennemySquad.position - this._squadQueue[i].position <= -6)
                     {
                        squad = this.CreateNewSquad(ennemySquad.position + 3);
                        this.CreateSummon(squad,type,onRaiseUndead);
                        return;
                     }
                  }
                  else if(24 - this._squadQueue[i].position <= -6)
                  {
                     squad = this.CreateNewSquad(24);
                     this.CreateSummon(squad,type,onRaiseUndead);
                     return;
                  }
               }
               else if(this._squadQueue[i - 1].position - this._squadQueue[i].position <= -6)
               {
                  squad = this.CreateNewSquad(this._squadQueue[i - 1].position + 3);
                  this.CreateSummon(squad,type,onRaiseUndead);
                  return;
               }
               if(i == this._squadQueue.length - 1)
               {
                  if(this.CreateSummon(this._squadQueue[i],type,onRaiseUndead))
                  {
                     return;
                  }
                  if(this._squadQueue[i].position <= 40)
                  {
                     squad = this.CreateNewSquad(this._squadQueue[i].position + 3);
                     this.CreateSummon(squad,type,onRaiseUndead);
                     return;
                  }
               }
            }
            if(this.CreateSummon(this._squadQueue[i],type,onRaiseUndead,i))
            {
               return;
            }
         }
      }
      
      public function GetRandomUnit() : BC_Actor
      {
         if(!this._squad1.isEmpty())
         {
            return this._squad1.GetRandomUnit();
         }
         if(!this._squad2.isEmpty())
         {
            return this._squad2.GetRandomUnit();
         }
         if(!this._squad3.isEmpty())
         {
            return this._squad3.GetRandomUnit();
         }
         if(!this._squad4.isEmpty())
         {
            return this._squad4.GetRandomUnit();
         }
         if(!this._squad5.isEmpty())
         {
            return this._squad5.GetRandomUnit();
         }
         return null;
      }
      
      public function reArrangeSquad() : void
      {
         var i:int = 0;
         var j:int = 0;
         var tempo:BattleSquad = null;
         if(this._team == MiscConstants.TEAM1)
         {
            for(i = 0; i < this._squadQueue.length; i++)
            {
               for(j = 0; j < this._squadQueue.length - 1; j++)
               {
                  if(this._squadQueue[j + 1].position > this._squadQueue[j].position)
                  {
                     tempo = this._squadQueue[j + 1];
                     this._squadQueue[j + 1] = this._squadQueue[j];
                     this._squadQueue[j] = tempo;
                  }
               }
            }
         }
         else
         {
            for(i = 0; i < this._squadQueue.length; i++)
            {
               for(j = 0; j < this._squadQueue.length - 1; j++)
               {
                  if(this._squadQueue[j + 1].position < this._squadQueue[j].position)
                  {
                     tempo = this._squadQueue[j + 1];
                     this._squadQueue[j + 1] = this._squadQueue[j];
                     this._squadQueue[j] = tempo;
                  }
               }
            }
         }
      }
      
      public function get metaArmy() : BC_MetaArmy
      {
         return this._metaArmy;
      }
      
      public function SurvivalMove() : void
      {
         for(var i:int = 0; i < this._squadQueue.length; i++)
         {
            this._squadQueue[i].SurvivalMove();
         }
      }
      
      public function RemoveFromVector(v:Vector.<BattleSquad>, elem:Object) : void
      {
         for(var i:int = 0; i < v.length; i++)
         {
            if(v[i] == elem)
            {
               v.splice(i,1);
            }
         }
      }
      
      public function Destroy() : void
      {
         var length:int = 0;
         var i:int = 0;
         length = int(this._squadQueue.length);
         for(i = 0; i < length; i++)
         {
            this._squadQueue.shift();
         }
      }
      
      public function get team() : int
      {
         return this._team;
      }
      
      public function SortOnce() : void
      {
         this._squad1.SortOnce();
         this._squad2.SortOnce();
         this._squad3.SortOnce();
         this._squad4.SortOnce();
         this._squad5.SortOnce();
      }
      
      public function Move2() : void
      {
         for(var i:int = 0; i < this._squadQueue.length; i++)
         {
            if(this.CanMove(i))
            {
               if(this._isSurvival)
               {
                  return;
               }
               if(this._squadQueue[i].metaSquad.speed.speedValue >= 2)
               {
                  if(!this._squadQueue[i].inBattleField)
                  {
                     if(this._team == MiscConstants.TEAM1)
                     {
                        this._squadQueue[i].position += 1;
                     }
                     else
                     {
                        --this._squadQueue[i].position;
                     }
                     this._squadQueue[i].Move2();
                  }
               }
            }
            else if(this._squadQueue[i].inBattleField)
            {
               this._squadQueue[i].Move2();
            }
         }
      }
      
      public function CastAura() : void
      {
         for(var i:int = 0; i < this._squadQueue.length; i++)
         {
            this._squadQueue[i].CastAura();
         }
      }
      
      public function Attack() : void
      {
         for(var i:int = 0; i < this._squadQueue.length; i++)
         {
            this._squadQueue[i].Attack();
         }
      }
      
      public function InitArmy() : void
      {
         var squad:BattleSquad = null;
         var metaUnit:BC_MetaUnit = null;
         var i:int = 0;
         var j:int = 0;
         if(this._team == MiscConstants.TEAM1)
         {
            for(i = 0; i < this._squadQueue.length; i++)
            {
               squad = this._squadQueue[i] as BattleSquad;
               for(j = int(squad.metaSquad.unitVector.length - 1); j >= 0; j--)
               {
                  metaUnit = squad.metaSquad.unitVector[j];
                  if(!(metaUnit.id == -1 || metaUnit.id == -2))
                  {
                     squad.buildUnit((this._context.enemyManager as BC_EnemyManager).CreateMetaActor(BC_EnemyFactory.ID_UNIT,0,0,0,0,squad.id,this._team,metaUnit,this._squadQueue[i].metaSquad.speed));
                  }
               }
            }
         }
         else
         {
            for(i = 0; i < this._squadQueue.length; i++)
            {
               squad = this._squadQueue[i] as BattleSquad;
               for(j = int(squad.metaSquad.unitVector.length - 1); j >= 0; j--)
               {
                  metaUnit = squad.metaSquad.unitVector[j];
                  if(!(metaUnit.id == -1 || metaUnit.id == -2))
                  {
                     squad.buildUnit((this._context.enemyManager as BC_EnemyManager).CreateMetaActor(BC_EnemyFactory.ID_UNIT,0,0,0,0,squad.id,this._team,metaUnit,this._squadQueue[i].metaSquad.speed));
                  }
               }
            }
         }
         this.UpdateUnit();
      }
      
      public function Move() : void
      {
         for(var i:int = 0; i < this._squadQueue.length; i++)
         {
            if(this.CanMove(i))
            {
               if(this._isSurvival)
               {
                  return;
               }
               if(this._squadQueue[i].metaSquad.speed.speedValue >= 1)
               {
                  if(!this._squadQueue[i].inBattleField)
                  {
                     if(this._team == MiscConstants.TEAM1)
                     {
                        this._squadQueue[i].position += 1;
                     }
                     else
                     {
                        --this._squadQueue[i].position;
                     }
                  }
                  this._squadQueue[i].Move();
               }
            }
            else if(this._squadQueue[i].inBattleField)
            {
               this._squadQueue[i].Move();
            }
         }
      }
      
      public function CheckAllUnitsDead() : Boolean
      {
         for(var i:int = 0; i < this._squadQueue.length; i++)
         {
            if(this._squadQueue[i].unitList.length > 0)
            {
               return false;
            }
         }
         return true;
      }
      
      public function PushDemon() : void
      {
         var freePos:GridPos = null;
         var metaSkeleton:BC_MetaUnit = null;
         for(var i:int = 0; i < this._squadQueue.length; i++)
         {
            if(this._squadQueue[i].unitList.length <= 17)
            {
               freePos = this._context.roundManager.grid.ReturnFreePosition(this._squadQueue[i].position,this._squadQueue[i].team);
               if(freePos != null)
               {
                  metaSkeleton = (this._context.enemyManager as BC_EnemyManager).CreateMetaDemon();
                  metaSkeleton.posInSquad = freePos;
                  this._squadQueue[i].buildSummon((this._context.enemyManager as BC_EnemyManager).CreateMetaActor(BC_EnemyFactory.ID_UNIT,0,0,0,0,this._squadQueue[i].id,this._squadQueue[i].team,metaSkeleton,this._squadQueue[i].metaSquad.speed));
                  return;
               }
            }
         }
      }
      
      public function set squadQueue(squadQueue:Vector.<BattleSquad>) : void
      {
         this._squadQueue = squadQueue;
      }
      
      public function get squadQueue() : Vector.<BattleSquad>
      {
         return this._squadQueue;
      }
      
      public function ResetAll() : void
      {
         for(var i:int = 0; i < this._squadQueue.length; i++)
         {
            this._squadQueue[i].ResetAll();
         }
      }
   }
}

