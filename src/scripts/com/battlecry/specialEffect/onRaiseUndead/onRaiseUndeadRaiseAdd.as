package com.battlecry.specialEffect.onRaiseUndead
{
   import com.battlecry.battle.BattleArmy;
   import com.battlecry.battle.Summon;
   import com.battlecry.constants.MiscConstants;
   
   public class onRaiseUndeadRaiseAdd extends onRaiseUndead
   {
      
      public function onRaiseUndeadRaiseAdd(id:int)
      {
         super(id);
      }
      
      override public function Cast() : void
      {
         var army:BattleArmy = null;
         super.Cast();
         if(owner.teamId == MiscConstants.TEAM1)
         {
            army = context.roundManager.team1;
         }
         else
         {
            army = context.roundManager.team2;
         }
         context.roundManager.AddSummon(owner.teamId,2,Summon.TYPE_UNDEAD,false);
      }
   }
}

