package com.battlecry.specialEffect.onStartEffect
{
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.battle.BattleArmy;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelStatsEnum;
   import com.battlecry.specialEffect.SpecialEffect;
   
   public class onStartEffect extends SpecialEffect
   {
      
      public static var COUNT_ALL:int = 0;
      
      public static var COUNT_ALLIES:int = 1;
      
      public static var COUNT_ENEMIES:int = 2;
      
      private var _init:Boolean;
      
      private var _value:int;
      
      private var _count:int;
      
      private var _creatureType:int;
      
      private var _id:int;
      
      private var _owner:BC_Actor;
      
      public function onStartEffect(id1:int, creatureType1:int, value:int, count:int)
      {
         super();
         this._id = id1;
         this._creatureType = creatureType1;
         this._value = value;
         this._count = count;
         this._init = true;
      }
      
      public function set creatureType(creatureType:int) : void
      {
         this._creatureType = creatureType;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set value(value:int) : void
      {
         this._value = value;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function set count(count:int) : void
      {
         this._count = count;
      }
      
      public function SetOwner(actor:BC_Actor) : void
      {
         this._owner = actor;
      }
      
      public function Reset() : void
      {
      }
      
      public function get creatureType() : int
      {
         return this._creatureType;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function Cast() : void
      {
         var team:BattleArmy = null;
         var team2:BattleArmy = null;
         var i:int = 0;
         var j:int = 0;
         if(this._init)
         {
            this._init = false;
            if(this._id == onStartEffectEnum.YASUR_MYTHIC.id)
            {
               team = context.roundManager.team1;
               team2 = context.roundManager.team2;
               for(i = 0; i < team.squadQueue.length; i++)
               {
                  for(j = 0; j < team.squadQueue[i].unitList.length; j++)
                  {
                     if(team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL || team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_UNDEAD)
                     {
                        team.squadQueue[i].unitList[j].metaStatsListAura.AddValue(1,ModelStatsEnum.ATTACK_DARK);
                        team.squadQueue[i].unitList[j].hp += 1;
                     }
                  }
               }
               for(i = 0; i < team2.squadQueue.length; i++)
               {
                  for(j = 0; j < team2.squadQueue[i].unitList.length; j++)
                  {
                     if(team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL || team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_UNDEAD)
                     {
                        team2.squadQueue[i].unitList[j].metaStatsListAura.AddValue(1,ModelStatsEnum.ATTACK_DARK);
                        team2.squadQueue[i].unitList[j].hp += 1;
                     }
                  }
               }
            }
            else if(this._id == onStartEffectEnum.AODAN_MYTHIC.id)
            {
               team = context.roundManager.team1;
               team2 = context.roundManager.team2;
               for(i = 0; i < team.squadQueue.length; i++)
               {
                  for(j = 0; j < team.squadQueue[i].unitList.length; j++)
                  {
                     team.squadQueue[i].unitList[j].AddSelfDestructTime(30);
                  }
               }
               for(i = 0; i < team2.squadQueue.length; i++)
               {
                  for(j = 0; j < team2.squadQueue[i].unitList.length; j++)
                  {
                     team2.squadQueue[i].unitList[j].AddSelfDestructTime(30);
                  }
               }
            }
            else if(this._id == onStartEffectEnum.INSECTOID_QUEEN_ARMOR.id)
            {
               team = context.roundManager.team1;
               team2 = context.roundManager.team2;
               for(i = 0; i < team.squadQueue.length; i++)
               {
                  for(j = 0; j < team.squadQueue[i].unitList.length; j++)
                  {
                     team.squadQueue[i].unitList[j].ReduceLarvaTime(5);
                  }
               }
               for(i = 0; i < team2.squadQueue.length; i++)
               {
                  for(j = 0; j < team2.squadQueue[i].unitList.length; j++)
                  {
                     team2.squadQueue[i].unitList[j].ReduceLarvaTime(5);
                  }
               }
            }
            else if(this._count == onStartEffect.COUNT_ALLIES)
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
                     if(this._creatureType == 0 || team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == this._creatureType || team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                     {
                        this._owner.hp += this._value;
                        this._owner.maxHp += this._value;
                     }
                  }
               }
            }
            else if(this._count == onStartEffect.COUNT_ENEMIES)
            {
               if(this._owner.teamId == MiscConstants.TEAM1)
               {
                  team = context.roundManager.team2;
               }
               else
               {
                  team = context.roundManager.team1;
               }
               for(i = 0; i < team.squadQueue.length; i++)
               {
                  for(j = 0; j < team.squadQueue[i].unitList.length; j++)
                  {
                     if(this._creatureType == 0 || team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == this._creatureType || team.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                     {
                        this._owner.hp += this._value;
                        this._owner.maxHp += this._value;
                     }
                  }
               }
            }
         }
      }
   }
}

