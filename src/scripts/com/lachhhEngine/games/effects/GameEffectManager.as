package com.lachhhEngine.games.effects
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.meta.metaObject.MetaGameEffect;
   import com.lachhhEngine.games.meta.metaObject.MetaLayer;
   import com.lachhhEngine.games.physique.Actor;
   
   public class GameEffectManager extends FactoryObjectManager
   {
      
      public function GameEffectManager(context:Game, gameEffectFactory:GameEffectFactory)
      {
         super(gameEffectFactory,MetaActor,Actor,context,"Effect");
      }
      
      protected function InitGameFx(gameEffect:Actor) : void
      {
         context.AddUpdatable(gameEffect);
         context.camera.AddActeur(gameEffect);
         if(MetaGameEffect(gameEffect.metaInfo).idContainer == GameEffectContainerId.ABOVE)
         {
            gameEffect.layer.GetForeFxContainer().addChild(gameEffect.animationContainer);
         }
         else
         {
            gameEffect.layer.GetBackFxContainer().addChild(gameEffect.animationContainer);
         }
      }
      
      public function DrawFx(idAnim:int, px:int, py:int, scaleX:Number, scaleY:Number, rotation:int, metaLayer:MetaLayer) : void
      {
         var gameEffect:Actor = null;
         gameEffect = this.CreateStaticFx(idAnim,GameEffectContainerId.ABOVE,px,py,metaLayer);
         gameEffect.animationContainer.scaleX = scaleX;
         gameEffect.animationContainer.scaleY = scaleY;
         gameEffect.animationContainer.rotation = rotation;
         gameEffect.DrawOnBackground();
         this.DestroyGameEffect(gameEffect);
      }
      
      public function DestroyAll() : void
      {
         while(activeFactoryObjects.length > 0)
         {
            this.DestroyGameEffect(activeFactoryObjects[0] as Actor);
         }
      }
      
      public function CreateStaticFx(idAnim:int, idContainer:int, px:int, py:int, metaLayer:MetaLayer, repeat:int = 1, loop:Boolean = false) : GameEffect
      {
         var metaGameFx:MetaActor = MetaManager.instance.CreateMetaGameEffect(GameEffectFactory(factory).ID_GAME_FX_NORMAL,idAnim,idContainer,px,py,repeat,loop,metaLayer);
         var gameEffect:GameEffect = GameEffect(Create(metaGameFx));
         this.InitGameFx(gameEffect);
         return gameEffect;
      }
      
      public function DestroyGameEffect(gameEffect:Actor) : void
      {
         if(gameEffect.animationContainer.parent != null)
         {
            gameEffect.animationContainer.parent.removeChild(gameEffect.animationContainer);
         }
         Destroy(gameEffect);
         context.RemoveUpdatable(gameEffect);
         context.camera.RemoveActeur(gameEffect);
      }
      
      public function CreateGameEffect(metaGameEffect:MetaGameEffect) : Actor
      {
         var gameEffect:Actor = Actor(Create(metaGameEffect));
         this.InitGameFx(gameEffect);
         return gameEffect;
      }
   }
}

