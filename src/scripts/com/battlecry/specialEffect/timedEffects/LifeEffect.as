package com.battlecry.specialEffect.timedEffects
{
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.effects.BC_GameEffectManager;
   import com.battlecry.effects.FloatingText;
   import com.lachhhEngine.utils.Utils;
   
   public class LifeEffect extends TimedEffect
   {
      
      private var _value:Number;
      
      private var _maxLimit:int;
      
      public function LifeEffect(id:int, type:int, duration:int, coolDown:int, value:Number, maxLimit:int)
      {
         super(id,type,duration,coolDown);
         this._value = value;
         this._maxLimit = maxLimit;
      }
      
      public function set value(value:Number) : void
      {
         this._value = value;
      }
      
      public function set maxLimit(maxLimit:Number) : void
      {
         this._maxLimit = maxLimit;
      }
      
      override public function CastEffect() : void
      {
         var f:FloatingText = null;
         super.CastEffect();
         if(this._value < 0)
         {
            owner.hp += this._value;
            f = (context.gameEffectManager as BC_GameEffectManager).CreateFloatingText(owner.px,owner.py - owner.animationContainer.height);
            Utils.SetColor2(f.animation,16711680);
            f.SetText(this._value + "");
            owner.CheckDie();
         }
         else
         {
            owner.hp += this._value;
            if(this._maxLimit == TimedEffectEnum.LIMIT)
            {
               if(owner.hp > owner.maxHp)
               {
                  owner.hp = owner.maxHp;
               }
            }
            f = (context.gameEffectManager as BC_GameEffectManager).CreateFloatingText(owner.px,owner.py - owner.animationContainer.height);
            f.SetText("+" + this._value);
         }
      }
      
      override public function SetOwner(owner:BC_Actor) : void
      {
         super.SetOwner(owner);
      }
      
      public function get maxLimit() : Number
      {
         return this._maxLimit;
      }
      
      public function get value() : Number
      {
         return this._value;
      }
      
      override public function Cast() : void
      {
         super.Cast();
      }
   }
}

