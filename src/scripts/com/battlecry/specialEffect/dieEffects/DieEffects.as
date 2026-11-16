package com.battlecry.specialEffect.dieEffects
{
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.specialEffect.SpecialEffect;
   
   public class DieEffects extends SpecialEffect
   {
      
      private var _id:int;
      
      private var _owner:BC_Actor;
      
      public function DieEffects(id:int)
      {
         super();
         this._id = id;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set owner(owner:BC_Actor) : void
      {
         this._owner = owner;
      }
      
      public function Reset() : void
      {
      }
      
      public function SetOwner(actor:BC_Actor) : void
      {
         this._owner = actor;
      }
      
      public function get owner() : BC_Actor
      {
         return this._owner;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function Cast() : void
      {
      }
   }
}

