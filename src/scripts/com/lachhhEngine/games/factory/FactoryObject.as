package com.lachhhEngine.games.factory
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class FactoryObject
   {
      
      private var _destroyMeta:Boolean = true;
      
      private var _factoryObjectManager:FactoryObjectManager;
      
      private var _isCached:Boolean = true;
      
      private var _metaInfo:MetaObject;
      
      private var _canBeCached:Boolean = true;
      
      public function FactoryObject()
      {
         super();
      }
      
      public function get metaInfo() : MetaObject
      {
         return this._metaInfo;
      }
      
      public function set factoryObjectManager(factoryObjectManager:FactoryObjectManager) : void
      {
         this._factoryObjectManager = factoryObjectManager;
      }
      
      public function set canBeCached(canBeCached:Boolean) : void
      {
         this._canBeCached = canBeCached;
      }
      
      public function Init(metaInfo:MetaObject, context:Game) : void
      {
         this._metaInfo = metaInfo;
         if(!this._isCached)
         {
            throw new Error("ERROR : FactoryObject already Init, Try calling Destroy() and don\'t forget your super.Destroy()");
         }
         this._metaInfo.factoryObject = this;
         this._isCached = false;
         this._destroyMeta = true;
      }
      
      public function get canBeCached() : Boolean
      {
         return this._canBeCached;
      }
      
      public function Destroy() : void
      {
         if(this._isCached)
         {
            throw new Error("ERROR : FactoryObject already Destroyed");
         }
         if(!(this is MetaObject) && this._destroyMeta)
         {
            MetaManager.instance.DestroyMetaData(this._metaInfo);
         }
         this._metaInfo = null;
         this._isCached = true;
      }
      
      public function get factoryObjectManager() : FactoryObjectManager
      {
         return this._factoryObjectManager;
      }
      
      public function set destroyMeta(destroyMeta:Boolean) : void
      {
         this._destroyMeta = destroyMeta;
      }
      
      public function get destroyMeta() : Boolean
      {
         return this._destroyMeta;
      }
   }
}

