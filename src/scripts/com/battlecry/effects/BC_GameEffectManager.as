package com.battlecry.effects
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.effects.GameEffectContainerId;
   import com.lachhhEngine.games.effects.GameEffectFactory;
   import com.lachhhEngine.games.effects.GameEffectManager;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaGameEffect;
   
   public class BC_GameEffectManager extends GameEffectManager
   {
      
      private var _context:BC_Game;
      
      public function BC_GameEffectManager(context:Game, gameEffectFactory:GameEffectFactory)
      {
         super(context,gameEffectFactory);
         this._context = context as BC_Game;
      }
      
      public function CreateIdleSpell(x:Number, y:Number, animId:int) : IdleSpell
      {
         var metaGameEffect:MetaGameEffect = MetaManager.instance.CreateMetaGameEffect(BC_GameEffectFactory.ID_IDLESPELL,animId,GameEffectContainerId.ABOVE,x,y,-1,false,this._context.actionLayer.metaLayer);
         return IdleSpell(CreateGameEffect(metaGameEffect));
      }
      
      public function CreateProjectile(x:Number, y:Number, animId:int) : Projectile
      {
         var metaGameEffect:MetaGameEffect = MetaManager.instance.CreateMetaGameEffect(BC_GameEffectFactory.ID_PROJECTILE,animId,GameEffectContainerId.ABOVE,x,y,-1,false,this._context.actionLayer.metaLayer);
         return Projectile(CreateGameEffect(metaGameEffect));
      }
      
      public function CreateFloatingText(x:Number, y:Number) : FloatingText
      {
         var metaGameEffect:MetaGameEffect = MetaManager.instance.CreateMetaGameEffect(BC_GameEffectFactory.ID_FLOATINGTEXT,BC_AnimationFactory.ID_FX_FLOATINGTEXT,GameEffectContainerId.ABOVE,x,y,-1,false,this._context.actionLayer.metaLayer);
         return FloatingText(CreateGameEffect(metaGameEffect));
      }
   }
}

