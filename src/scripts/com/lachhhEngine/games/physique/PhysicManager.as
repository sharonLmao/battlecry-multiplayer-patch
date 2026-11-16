package com.lachhhEngine.games.physique
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObject;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import com.lachhhEngine.games.heurtable.CircleCollision;
   import com.lachhhEngine.games.heurtable.IHeurtableContainer;
   import com.lachhhEngine.games.heurtable.LineCollision;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.meta.metaObject.MetaCircle;
   import com.lachhhEngine.games.meta.metaObject.MetaCircleCollision;
   import com.lachhhEngine.games.meta.metaObject.MetaLayer;
   import com.lachhhEngine.games.meta.metaObject.MetaLine;
   import com.lachhhEngine.games.meta.metaObject.MetaLineCollision;
   
   public class PhysicManager extends FactoryObjectManager
   {
      
      private static var _instance:PhysicManager;
      
      public function PhysicManager(context:Game, physiqueFactory:PhysicFactory)
      {
         super(physiqueFactory,MetaObject,FactoryObject,context,"Physics");
         if(_instance != null)
         {
            throw new Error("Instance already made, call PhysicManager.instance");
         }
         _instance = this;
      }
      
      public static function get instance() : PhysicManager
      {
         return _instance;
      }
      
      public function CreateLine(x1:Number, x2:Number, y1:Number, y2:Number, canDrop:Boolean, canWallKick:Boolean) : Line
      {
         var metaLine:MetaLine = MetaManager.instance.CreateMetaLine(x1,x2,y1,y2,canDrop,canWallKick);
         metaLine.instanceType = PhysicFactory(factory).ID_LINE;
         return Line(Create(metaLine));
      }
      
      public function CreateLineCollision(x1:Number, x2:Number, y1:Number, y2:Number, canDrop:Boolean, canWallKick:Boolean, owner:IHeurtableContainer) : LineCollision
      {
         var metaLineCol:MetaLineCollision = MetaManager.instance.CreateMetaLineCollision(x1,x2,y1,y2,canDrop,canWallKick,owner);
         metaLineCol.instanceType = PhysicFactory(factory).ID_LINE_COLLISION;
         return LineCollision(Create(metaLineCol));
      }
      
      public function DestroyPhysicObject(physicObj:FactoryObject) : void
      {
         Destroy(physicObj);
      }
      
      public function CreateCircleCollision(x:Number, y:Number, rayon:Number, owner:IHeurtableContainer) : CircleCollision
      {
         var metaCircleCol:MetaCircleCollision = MetaManager.instance.CreateMetaCircleCollision(x,y,rayon);
         metaCircleCol.instanceType = PhysicFactory(factory).ID_CIRCLE_COLLISION;
         metaCircleCol.owner = owner;
         return CircleCollision(Create(metaCircleCol));
      }
      
      public function CreateActor(metaLayer:MetaLayer) : Actor
      {
         var metaActor:MetaActor = MetaManager.instance.CreateMetaActor(metaLayer);
         metaActor.instanceType = PhysicFactory(factory).ID_ACTOR;
         return Actor(Create(metaActor));
      }
      
      public function CreateCircleFromMeta(metaCircle:MetaCircle) : Circle
      {
         metaCircle.instanceType = PhysicFactory(factory).ID_CIRCLE;
         return Circle(Create(metaCircle));
      }
      
      public function CreateCircle(x:Number, y:Number, rayon:Number, angleStart:Number = -180, angleEnd:Number = 180) : Circle
      {
         var metaCircle:MetaCircle = MetaManager.instance.CreateMetaCircle(x,y,rayon);
         metaCircle.instanceType = PhysicFactory(factory).ID_CIRCLE;
         metaCircle.angleDetectStart = angleStart;
         metaCircle.angleDetectEnd = angleEnd;
         return Circle(Create(metaCircle));
      }
      
      public function CreateLineFromMeta(metaLine:MetaLine) : Line
      {
         metaLine.instanceType = PhysicFactory(factory).ID_LINE;
         return Line(Create(metaLine));
      }
   }
}

