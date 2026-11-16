package com.battlecry.specialEffect.timedEffects
{
   public class TimedDead extends TimedEffect
   {
      
      public function TimedDead(id:int, type:int, duration:int, coolDown:int)
      {
         super(id,type,duration,coolDown);
      }
      
      override public function CastEffect() : void
      {
         super.CastEffect();
         owner.Die();
      }
   }
}

