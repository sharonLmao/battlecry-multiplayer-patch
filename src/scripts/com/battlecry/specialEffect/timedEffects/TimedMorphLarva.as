package com.battlecry.specialEffect.timedEffects
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.effects.GameEffectContainerId;
   
   public class TimedMorphLarva extends TimedEffect
   {
      
      public function TimedMorphLarva(id:int, type:int, duration:int, coolDown:int)
      {
         super(id,type,duration,coolDown);
      }
      
      override public function CastEffect() : void
      {
         super.CastEffect();
         owner.larva = false;
         context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_LARVA,GameEffectContainerId.ABOVE,owner.px,owner.py,context.actionLayer.metaLayer);
      }
   }
}

