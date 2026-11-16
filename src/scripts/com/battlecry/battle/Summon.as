package com.battlecry.battle
{
   public class Summon
   {
      
      public static const TYPE_UNDEAD:int = 0;
      
      public static const TYPE_IMMORTAL_WARRIOR:int = 1;
      
      public static const TYPE_DEMON:int = 2;
      
      private var _timer:int;
      
      private var _onRaiseUndead:Boolean;
      
      private var _battleArmy:BattleArmy;
      
      private var _type:int;
      
      public function Summon(battleArmy:BattleArmy, timer:int, type:int, onRaiseUndead:Boolean)
      {
         super();
         this._timer = timer;
         this._battleArmy = battleArmy;
         this._type = type;
         this._onRaiseUndead = onRaiseUndead;
      }
      
      public function get timer() : int
      {
         return this._timer;
      }
      
      public function Update() : void
      {
         --this._timer;
         if(this._timer <= 0)
         {
            this._battleArmy.PushSummon(this._type,this._onRaiseUndead);
         }
      }
      
      public function set timer(timer:int) : void
      {
         this._timer = timer;
      }
   }
}

