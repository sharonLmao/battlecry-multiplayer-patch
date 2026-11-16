package com.lachhhEngine.games.factory
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class FactoryObjectManager
   {
      
      private var _activeById:Array;
      
      private var _activeFactoryObjects:Vector.<FactoryObject>;
      
      private var _context:Game;
      
      private var _name:String;
      
      private var _metaObjectClass:Class;
      
      private var _factoryCache:FactoryCache;
      
      private var _factoryObjectClass:Class;
      
      public function FactoryObjectManager(objFactory:ObjectFactory, metaObjectClass:Class, factoryObjectClass:Class, context:Game, name:String = "FactoryManager")
      {
         super();
         this._factoryCache = new FactoryCache(objFactory);
         this._metaObjectClass = metaObjectClass;
         this._factoryObjectClass = factoryObjectClass;
         this._context = context;
         this._activeFactoryObjects = new Vector.<FactoryObject>();
         this._activeById = new Array();
         this._name = name;
      }
      
      public function get factory() : ObjectFactory
      {
         return this._factoryCache.factory;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get activeFactoryObjects() : Vector.<FactoryObject>
      {
         return this._activeFactoryObjects;
      }
      
      public function get factoryCache() : FactoryCache
      {
         return this._factoryCache;
      }
      
      final public function DestroyAllOfId(id:int) : void
      {
         var f:FactoryObject = null;
         for(var i:int = 0; i < this._activeFactoryObjects.length; i++)
         {
            f = this._activeFactoryObjects[i];
            if(f.metaInfo != null && f.metaInfo.instanceType == id)
            {
               this.Destroy(f);
               i--;
            }
         }
      }
      
      final protected function Destroy(factoryObject:FactoryObject) : void
      {
         if(!(factoryObject is this._factoryObjectClass))
         {
            throw new Error("ERROR: Invalid object, must be " + this._factoryObjectClass);
         }
         this.AddNumberAtId(factoryObject.metaInfo.instanceType,-1);
         factoryObject.factoryObjectManager = null;
         for(var i:int = 0; i < this._activeFactoryObjects.length; i++)
         {
            if(this._activeFactoryObjects[i] == factoryObject)
            {
               this._activeFactoryObjects.splice(i,1);
               break;
            }
         }
         if(factoryObject.canBeCached)
         {
            this._factoryCache.AddToCache(factoryObject);
         }
         factoryObject.Destroy();
      }
      
      final protected function Create(metaObject:MetaObject) : FactoryObject
      {
         if(!(metaObject is this._metaObjectClass))
         {
            throw new Error("ERROR: Invalid Meta data, must be " + this._metaObjectClass);
         }
         this.AddNumberAtId(metaObject.instanceType,1);
         var factoryObject:FactoryObject = this._factoryCache.GetFactoryObject(metaObject);
         factoryObject.factoryObjectManager = this;
         factoryObject.Init(metaObject,this._context);
         this._activeFactoryObjects.push(factoryObject);
         return factoryObject;
      }
      
      public function GetNbActiveById(id:int) : int
      {
         return this._activeById[id];
      }
      
      public function get numActive() : int
      {
         return this._activeFactoryObjects.length;
      }
      
      public function get context() : Game
      {
         return this._context;
      }
      
      private function AddNumberAtId(id:int, mod:int) : void
      {
         if(this._activeById[id] == null)
         {
            this._activeById[id] = 0;
         }
         this._activeById[id] += mod;
      }
   }
}

