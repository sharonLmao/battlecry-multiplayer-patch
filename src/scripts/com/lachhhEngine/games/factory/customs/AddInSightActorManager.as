package com.lachhhEngine.games.factory.customs
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.ObjectFactory;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import flash.geom.Point;
   
   public class AddInSightActorManager extends ActorManager
   {
      
      private var _point:Point;
      
      private var _metaActorsNotInSight:Array;
      
      public function AddInSightActorManager(idLayerContainer:int, objFactory:ObjectFactory, metaObjectClass:Class, factoryObjectClass:Class, context:Game, name:String = "FactoryManager")
      {
         super(idLayerContainer,objFactory,metaObjectClass,factoryObjectClass,context,name);
         this._metaActorsNotInSight = new Array();
         this._point = new Point();
      }
      
      override public function DestroyAll() : void
      {
         var metaEnemy:MetaActor = null;
         super.DestroyAll();
         while(this._metaActorsNotInSight.length > 0)
         {
            metaEnemy = this._metaActorsNotInSight.shift();
            MetaManager.instance.DestroyMetaData(metaEnemy);
         }
      }
      
      public function get metaActorsNotInSight() : Array
      {
         return this._metaActorsNotInSight;
      }
      
      public function Update() : void
      {
         var m:MetaActor = null;
         for(var i:int = 0; i < this._metaActorsNotInSight.length; i++)
         {
            m = this._metaActorsNotInSight[i];
            this._point.x = m.x;
            this._point.y = m.y;
            if(context.camera.IsPointInFieldOfView(this._point,LevelLayer(m.metaLayer.factoryObject),this.creationOffsetCamX,this.creationOffsetCamY))
            {
               CreateActor(m);
               this._metaActorsNotInSight.splice(i,1);
               i--;
            }
         }
      }
      
      protected function get creationOffsetCamX() : int
      {
         return 50;
      }
      
      protected function get creationOffsetCamY() : int
      {
         return 50;
      }
      
      public function AddMetaActor(metaActor:MetaActor) : void
      {
         this._metaActorsNotInSight.push(metaActor);
      }
   }
}

