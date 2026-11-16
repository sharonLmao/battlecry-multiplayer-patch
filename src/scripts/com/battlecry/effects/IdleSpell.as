package com.battlecry.effects
{
   import com.battlecry.constants.MiscConstants;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.effects.GameEffect;
   import com.lachhhEngine.games.effects.GameEffectContainerId;
   
   public class IdleSpell extends BC_GameEffect
   {
      
      public function IdleSpell()
      {
         super();
      }
      
      override public function Update(context:Game) : void
      {
         var g:GameEffect = null;
         super.Update(context);
         if(animation.currentFrame >= animation.totalFrames)
         {
            if(onHitAnimId >= 0 && target != null)
            {
               g = (context.gameEffectManager as BC_GameEffectManager).CreateStaticFx(onHitAnimId,GameEffectContainerId.ABOVE,target.px,target.py,context.actionLayer.metaLayer);
               if(owner.teamId == MiscConstants.TEAM2)
               {
                  g.animation.scaleX *= -1;
               }
            }
            context.gameEffectManager.DestroyGameEffect(this);
         }
      }
   }
}

