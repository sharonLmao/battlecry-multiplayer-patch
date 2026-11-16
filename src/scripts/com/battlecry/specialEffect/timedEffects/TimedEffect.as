package com.battlecry.specialEffect.timedEffects
{
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.specialEffect.SpecialEffect;
   
   public class TimedEffect extends SpecialEffect
   {
      
      private var _id:int;
      
      private var _maxCoolDown:int;
      
      private var _type:int;
      
      private var _coolDownModifier:int;
      
      private var _coolDown:int;
      
      private var _owner:BC_Actor;
      
      private var _duration:int;
      
      public function TimedEffect(id:int, type:int, duration:int, coolDown:int)
      {
         super();
         this._id = id;
         this._type = type;
         this._duration = duration;
         this._coolDown = this._maxCoolDown = coolDown;
         this._coolDownModifier = 0;
      }
      
      public function set type(type:int) : void
      {
         this._type = type;
      }
      
      public function set coolDownModifier(coolDownModifier:int) : void
      {
         this._coolDownModifier = coolDownModifier;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get coolDown() : int
      {
         return this._coolDown;
      }
      
      public function get maxCoolDown() : int
      {
         return this._maxCoolDown;
      }
      
      public function SetOwner(owner:BC_Actor) : void
      {
         this._owner = owner;
      }
      
      public function get duration() : int
      {
         return this._duration;
      }
      
      public function RemoveEffect() : void
      {
         this.RemoveFromVector(this,this._owner.specialEffectManager.timedEffect);
      }
      
      public function set coolDown(coolDown:int) : void
      {
         this._coolDown = coolDown;
      }
      
      public function CastEffect() : void
      {
      }
      
      private function RemoveFromVector(e:TimedEffect, v:Vector.<TimedEffect>) : void
      {
         for(var i:int = 0; i < v.length; i++)
         {
            if(e == v[i])
            {
               v.splice(i,1);
            }
         }
      }
      
      public function get coolDownModifier() : int
      {
         return this._coolDownModifier;
      }
      
      public function set maxCoolDown(maxCoolDown:int) : void
      {
         this._maxCoolDown = maxCoolDown;
      }
      
      public function Cast() : void
      {
         if(this._duration == 0)
         {
            if(this._coolDown <= 0)
            {
               this.CastEffect();
            }
            this.RemoveEffect();
            return;
         }
         if(this._coolDown <= 0)
         {
            this._coolDown = this._maxCoolDown;
            if(this._coolDown <= 2)
            {
               this._coolDown = 2;
            }
            this.CastEffect();
         }
         --this._coolDown;
         if(this._duration > 0)
         {
            --this._duration;
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get owner() : BC_Actor
      {
         return this._owner;
      }
      
      public function set owner(owner:BC_Actor) : void
      {
         this._owner = owner;
      }
      
      public function set duration(duration:int) : void
      {
         this._duration = duration;
      }
      
      public function Reset() : void
      {
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
   }
}

