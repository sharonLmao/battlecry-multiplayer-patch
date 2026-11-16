package com.battlecry.effects
{
   import com.battlecry.actor.BC_Actor;
   import com.lachhhEngine.games.effects.GameEffect;
   
   public class BC_GameEffect extends GameEffect
   {
      
      private var _yOffSet:Number;
      
      private var _onHitAnimId:int;
      
      private var _ready:Boolean;
      
      private var _startingOffSetY:Number;
      
      private var _target:BC_Actor;
      
      private var _owner:BC_Actor;
      
      public function BC_GameEffect()
      {
         super();
         this._ready = false;
      }
      
      public function set onHitAnimId(onHitAnimId:int) : void
      {
         this._onHitAnimId = onHitAnimId;
      }
      
      public function Ready(target1:BC_Actor, onHitAnimId:int, yOffSetY:Number, startingOffSetY:Number, owner:BC_Actor) : void
      {
         this._target = target1;
         this._onHitAnimId = onHitAnimId;
         this._yOffSet = yOffSetY;
         this._startingOffSetY = startingOffSetY;
         this._owner = owner;
         this._ready = true;
      }
      
      public function set ready(ready:Boolean) : void
      {
         this._ready = ready;
      }
      
      public function get yOffSet() : Number
      {
         return this._yOffSet;
      }
      
      public function get target() : BC_Actor
      {
         return this._target;
      }
      
      public function set startingOffSetY(startingOffSetY:Number) : void
      {
         this._startingOffSetY = startingOffSetY;
      }
      
      public function set yOffSet(yOffSet:Number) : void
      {
         this._yOffSet = yOffSet;
      }
      
      public function set target(target:BC_Actor) : void
      {
         this._target = target;
      }
      
      public function get ready() : Boolean
      {
         return this._ready;
      }
      
      public function get startingOffSetY() : Number
      {
         return this._startingOffSetY;
      }
      
      public function set owner(owner:BC_Actor) : void
      {
         this._owner = owner;
      }
      
      public function get onHitAnimId() : int
      {
         return this._onHitAnimId;
      }
      
      public function get owner() : BC_Actor
      {
         return this._owner;
      }
   }
}

