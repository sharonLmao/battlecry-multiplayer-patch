package com.battlecry.specialEffect.onKill
{
   public class onKillRaiseUndead extends onKillEffect
   {
      
      private var _raiseTimer:int;
      
      private var _type:int;
      
      public function onKillRaiseUndead(id:int, raiseTimer:int, type:int)
      {
         super(id);
         this._raiseTimer = raiseTimer;
         this._type = type;
      }
      
      public function get raiseTimer() : int
      {
         return this._raiseTimer;
      }
      
      public function set type(type:int) : void
      {
         this._type = type;
      }
      
      public function set raiseTimer(raiseTimer:int) : void
      {
         this._raiseTimer = raiseTimer;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      override public function Cast() : void
      {
         super.Cast();
         context.roundManager.AddSummon(owner.teamId,this._raiseTimer,this._type,true);
      }
   }
}

