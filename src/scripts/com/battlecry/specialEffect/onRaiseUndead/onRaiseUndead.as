package com.battlecry.specialEffect.onRaiseUndead
{
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.specialEffect.SpecialEffect;
   
   public class onRaiseUndead extends SpecialEffect
   {
      
      public static var RANGE_SQUAD:int = 0;
      
      public static var RANGE_ARMY:int = 1;
      
      public static var RANGE_ALL:int = 2;
      
      public static var RANGE_ENNEMYARMY:int = 3;
      
      private var _id:int;
      
      private var _owner:BC_Actor;
      
      public function onRaiseUndead(id:int)
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
      
      public function SetOwner(owner:BC_Actor) : void
      {
         this._owner = owner;
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

