package com.lachhhEngine.games.factory
{
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.utils.Utils;
   
   public class FactoryCache
   {
      
      private var _cache:Array;
      
      private var _factory:ObjectFactory;
      
      private var _activeCacheId:Array;
      
      public function FactoryCache(factory:ObjectFactory)
      {
         super();
         this._factory = factory;
         this._cache = new Array();
         this._activeCacheId = new Array();
      }
      
      public function GetNbInCacheById(id:int) : int
      {
         if(this._cache[id] == null)
         {
            return 0;
         }
         return this._cache[id].length;
      }
      
      public function AddToCache(gameElement:FactoryObject) : void
      {
         var instanceType:int = gameElement.metaInfo.instanceType;
         if(this._cache[instanceType] == null)
         {
            this._cache[instanceType] = new Array();
         }
         this._cache[instanceType].push(gameElement);
         Utils.AddInArrayIfNotIn(this._activeCacheId,instanceType);
      }
      
      public function get factory() : ObjectFactory
      {
         return this._factory;
      }
      
      public function GetFactoryObject(metaObject:MetaObject) : FactoryObject
      {
         var gameElement:FactoryObject = null;
         var instanceType:int = metaObject.instanceType;
         if(this._cache[instanceType] != null && this._cache[instanceType].length > 0)
         {
            gameElement = FactoryObject(this._cache[instanceType].shift());
         }
         else
         {
            gameElement = this._factory.CreateFactoryObjectInstance(metaObject);
         }
         return gameElement;
      }
      
      public function ClearCache() : void
      {
         for(var i:int = 0; i < this._activeCacheId.length; i++)
         {
            Utils.ClearArray(this._cache[i]);
         }
         Utils.ClearArray(this._cache);
         Utils.ClearArray(this._activeCacheId);
      }
      
      public function GetNbInCache() : int
      {
         var cpt:int = 0;
         for(var i:int = 0; i < this._activeCacheId.length; i++)
         {
            cpt += this.GetNbInCacheById(this._activeCacheId[i]);
         }
         return cpt;
      }
   }
}

