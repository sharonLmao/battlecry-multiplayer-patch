package com.lachhhEngine.games.factory.customs
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import com.lachhhEngine.games.factory.ObjectFactory;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.utils.Utils;
   
   public class ActorManager extends FactoryObjectManager
   {
      
      private var _idLayerContainer:int;
      
      public function ActorManager(idLayerContainer:int, objFactory:ObjectFactory, metaObjectClass:Class, factoryObjectClass:Class, context:Game, name:String = "FactoryManager")
      {
         super(objFactory,metaObjectClass,factoryObjectClass,context,name);
         this._idLayerContainer = idLayerContainer;
      }
      
      public function get idLayerContainer() : int
      {
         return this._idLayerContainer;
      }
      
      public function DestroyAll() : void
      {
         while(activeFactoryObjects.length > 0)
         {
            this.DestroyActor(activeFactoryObjects[0] as Actor);
         }
      }
      
      public function CreateActor(metaActor:MetaActor) : Actor
      {
         var actor:Actor = Actor(Create(metaActor));
         LevelLayer(metaActor.metaLayer.factoryObject).GetContainerById(this._idLayerContainer).addChild(actor.animationContainer);
         context.AddUpdatable(actor);
         context.camera.AddActeur(actor);
         return actor;
      }
      
      public function DestroyActor(actor:Actor) : void
      {
         Utils.LazyRemoveFromParent(actor.animationContainer);
         context.camera.RemoveActeur(actor);
         context.RemoveUpdatable(actor);
         Destroy(actor);
      }
   }
}

