package com.lachhhEngine.games.effects
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaGameEffect;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.io.Callback;
   
   public class GameEffect extends Actor
   {
      
      private var _animation:Animation;
      
      public function GameEffect()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         var metaGameFx:MetaGameEffect = metaObject as MetaGameEffect;
         this._animation = AnimationManager.instance.CreateAnimation(metaGameFx.idAnim);
         this._animation.looping = metaGameFx.loop;
         if(MetaGameEffect(metaInfo).repeat != -1)
         {
            this._animation.AddEndCallback(new Callback(this.EndAnim,this,[]));
         }
         animationContainer.addChild(this._animation);
      }
      
      public function get animation() : Animation
      {
         return this._animation;
      }
      
      override public function Update(context:Game) : void
      {
         this._animation.Update(context);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         AnimationManager.instance.Destroy(this._animation);
      }
      
      protected function EndAnim() : void
      {
         if(MetaGameEffect(metaInfo).repeat != -1)
         {
            --MetaGameEffect(metaInfo).repeat;
            if(MetaGameEffect(metaInfo).repeat <= 0)
            {
               GameEffectManager(factoryObjectManager).DestroyGameEffect(this);
            }
         }
      }
   }
}

