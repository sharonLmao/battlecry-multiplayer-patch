package com.battlecry.specialEffect.onKill
{
   import com.battlecry.battle.BattleArmy;
   import com.battlecry.battle.BattleSquad;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.effects.GameEffectContainerId;
   
   public class onKillHeal extends onKillEffect
   {
      
      public static const REGEN:int = 0;
      
      public static const DEF:int = 1;
      
      public static const TARGET_SELF:int = 0;
      
      public static const TARGET_SQUAD:int = 1;
      
      public static const TARGET_ARMY:int = 2;
      
      public static const TARGET_EVERYONE:int = 3;
      
      private var _type:int;
      
      private var _target:int;
      
      private var _value:int;
      
      public function onKillHeal(id:int, value:int, type:int, target:int)
      {
         super(id);
         this._value = value;
         this._type = type;
         this._target = target;
      }
      
      public function set value(value:int) : void
      {
         this._value = value;
      }
      
      public function set target(target:int) : void
      {
         this._target = target;
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function set type(type:int) : void
      {
         this._type = type;
      }
      
      public function get target() : int
      {
         return this._target;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      override public function Cast() : void
      {
         var i:int = 0;
         var j:int = 0;
         var team:BattleArmy = null;
         var team2:BattleArmy = null;
         var squad:BattleSquad = null;
         super.Cast();
         if(owner.teamId == MiscConstants.TEAM1)
         {
            team = context.roundManager.team1;
            team2 = context.roundManager.team2;
         }
         else
         {
            team = context.roundManager.team2;
            team2 = context.roundManager.team1;
         }
         if(this._target == TARGET_SELF)
         {
            context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_ANGELIC_BUFF,GameEffectContainerId.ABOVE,owner.px,owner.py,context.actionLayer.metaLayer);
            if(this._type == REGEN)
            {
               owner.hp += this.value;
               if(owner.hp >= owner.maxHp)
               {
                  owner.hp = owner.maxHp;
               }
            }
            else
            {
               owner.maxHp += this.value;
               owner.hp += this.value;
            }
         }
         else if(this._target == TARGET_SQUAD)
         {
            squad = team.getSquad(owner.squadId);
            for(i = 0; i < squad.unitList.length; i++)
            {
               context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_ANGELIC_BUFF,GameEffectContainerId.ABOVE,squad.unitList[i].px,squad.unitList[i].py,context.actionLayer.metaLayer);
               if(this._type == REGEN)
               {
                  squad.unitList[i].hp += this.value;
                  if(squad.unitList[i].hp >= squad.unitList[i].maxHp)
                  {
                     squad.unitList[i].hp = squad.unitList[i].hp;
                  }
               }
               else
               {
                  squad.unitList[i].maxHp += this.value;
                  squad.unitList[i].hp += this.value;
               }
            }
         }
         else if(this._target == TARGET_ARMY)
         {
            for(i = 0; i < team.squadQueue.length; i++)
            {
               for(j = 0; j < team.squadQueue[i].unitList.length; j++)
               {
                  context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_ANGELIC_BUFF,GameEffectContainerId.ABOVE,team.squadQueue[i].unitList[j].px,team.squadQueue[i].unitList[j].py,context.actionLayer.metaLayer);
                  if(this._type == REGEN)
                  {
                     team.squadQueue[i].unitList[j].hp += this.value;
                     if(team.squadQueue[i].unitList[j].hp >= team.squadQueue[i].unitList[j].maxHp)
                     {
                        team.squadQueue[i].unitList[j].hp = team.squadQueue[i].unitList[j].maxHp;
                     }
                  }
                  else
                  {
                     team.squadQueue[i].unitList[j].maxHp += this.value;
                     team.squadQueue[i].unitList[j].hp += this.value;
                  }
               }
            }
         }
         else if(this._target == TARGET_EVERYONE)
         {
            for(i = 0; i < team.squadQueue.length; i++)
            {
               for(j = 0; j < team.squadQueue[i].unitList.length; j++)
               {
                  context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_ANGELIC_BUFF,GameEffectContainerId.ABOVE,team.squadQueue[i].unitList[j].px,team.squadQueue[i].unitList[j].py,context.actionLayer.metaLayer);
                  if(this._type == REGEN)
                  {
                     team.squadQueue[i].unitList[j].hp += this.value;
                     if(team.squadQueue[i].unitList[j].hp >= team.squadQueue[i].unitList[j].maxHp)
                     {
                        team.squadQueue[i].unitList[j].hp = team.squadQueue[i].unitList[j].maxHp;
                     }
                  }
                  else
                  {
                     team.squadQueue[i].unitList[j].maxHp += this.value;
                     team.squadQueue[i].unitList[j].hp += this.value;
                  }
               }
            }
            for(i = 0; i < team2.squadQueue.length; i++)
            {
               for(j = 0; j < team2.squadQueue[i].unitList.length; j++)
               {
                  context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_ANGELIC_BUFF,GameEffectContainerId.ABOVE,team2.squadQueue[i].unitList[j].px,team2.squadQueue[i].unitList[j].py,context.actionLayer.metaLayer);
                  if(this._type == REGEN)
                  {
                     team2.squadQueue[i].unitList[j].hp += this.value;
                     if(team2.squadQueue[i].unitList[j].hp >= team2.squadQueue[i].unitList[j].maxHp)
                     {
                        team2.squadQueue[i].unitList[j].hp = team2.squadQueue[i].unitList[j].maxHp;
                     }
                  }
                  else
                  {
                     team2.squadQueue[i].unitList[j].maxHp += this.value;
                     team2.squadQueue[i].unitList[j].hp += this.value;
                  }
               }
            }
         }
      }
   }
}

