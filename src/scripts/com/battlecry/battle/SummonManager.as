package com.battlecry.battle
{
   import com.battlecry.specialEffect.onRaiseUndead.onRaiseUndead;
   
   public class SummonManager
   {
      
      private var _onSummonList:Vector.<onRaiseUndead> = new Vector.<onRaiseUndead>();
      
      private var _summonList:Vector.<Summon> = new Vector.<Summon>();
      
      public function SummonManager()
      {
         super();
      }
      
      public function CastOnUndeadRaise(type:int, team:int) : void
      {
         for(var i:int = 0; i < this._onSummonList.length; i++)
         {
            if(type != Summon.TYPE_IMMORTAL_WARRIOR)
            {
               if(team == this.onSummonList[i].owner.teamId)
               {
                  this._onSummonList[i].Cast();
               }
            }
         }
      }
      
      public function CreateSummon(army:BattleArmy, timer:int, type:int, raiseUndead:Boolean) : void
      {
         this._summonList.push(new Summon(army,timer,type,raiseUndead));
      }
      
      public function get onSummonList() : Vector.<onRaiseUndead>
      {
         return this._onSummonList;
      }
      
      public function Update() : void
      {
         for(var i:int = 0; i < this._summonList.length; i++)
         {
            this._summonList[i].Update();
         }
         var lenght:int = int(this._summonList.length);
         for(var j:int = lenght - 1; j >= 0; j--)
         {
            if(this._summonList[j].timer <= 0)
            {
               this._summonList.splice(j,1);
            }
         }
      }
      
      public function set onSummonList(onSummonList:Vector.<onRaiseUndead>) : void
      {
         this._onSummonList = onSummonList;
      }
   }
}

