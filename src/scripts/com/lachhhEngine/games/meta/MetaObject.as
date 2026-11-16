package com.lachhhEngine.games.meta
{
   import com.lachhhEngine.games.factory.FactoryObject;
   
   public class MetaObject extends FactoryObject
   {
      
      private var _factoryObject:FactoryObject;
      
      private var _instanceType:int;
      
      public function MetaObject()
      {
         super();
      }
      
      public function set factoryObject(factoryObject:FactoryObject) : void
      {
         this._factoryObject = factoryObject;
      }
      
      public function set instanceType(instanceType:int) : void
      {
         this._instanceType = instanceType;
      }
      
      public function get factoryObject() : FactoryObject
      {
         return this._factoryObject;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._factoryObject = null;
      }
      
      public function cloneAttributes(metaObject:MetaObject) : void
      {
         this.instanceType = metaObject.instanceType;
      }
      
      public function clone() : MetaObject
      {
         var metaObject:MetaObject = MetaManager.instance.CreateMetaData(metaInfo.instanceType);
         metaObject.cloneAttributes(this);
         return metaObject;
      }
      
      public function get instanceType() : int
      {
         return this._instanceType;
      }
   }
}

