package com.lachhhEngine.games.behaviors
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObject;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaBehavior;
   import com.lachhhEngine.io.Callback;
   
   public class Behavior extends FactoryObject
   {
      
      private var _endCallback:Callback;
      
      public function Behavior()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
      }
      
      public function get endCallback() : Callback
      {
         return this._endCallback;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
      }
      
      public function End(context:Game) : void
      {
         if(this._endCallback != null)
         {
            this._endCallback.DoCallback();
         }
         context.behaviorManager.DestroyBehavior(this);
      }
      
      public function Control(context:Game, obj:IControllable) : void
      {
      }
      
      public function get metaBehavior() : MetaBehavior
      {
         return MetaBehavior(metaInfo);
      }
      
      public function set endCallback(endCallback:Callback) : void
      {
         this._endCallback = endCallback;
      }
   }
}

