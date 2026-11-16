package com.lachhhEngine.games.animation
{
   import com.lachhhEngine.games.factory.AnimationCache;
   import com.lachhhEngine.games.factory.AnimationFactory;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaAnimation;
   
   public class AnimationManager
   {
      
      private static var _instance:AnimationManager;
      
      private var _activeById:Array;
      
      private var _activeFactoryObjects:Vector.<Animation>;
      
      private var _factoryCache:AnimationCache;
      
      public function AnimationManager(objFactory:AnimationFactory)
      {
         super();
         this._factoryCache = new AnimationCache(objFactory);
         this._activeFactoryObjects = new Vector.<Animation>();
         if(_instance != null)
         {
            throw new Error("AnimationManager already instanciated : use AnimationManager.instance");
         }
         _instance = this;
         this._activeById = new Array();
      }
      
      public static function get instance() : AnimationManager
      {
         return _instance;
      }
      
      public static function get factory() : AnimationFactory
      {
         return _instance._factoryCache.factory;
      }
      
      public static function get factoryCache() : AnimationCache
      {
         return _instance._factoryCache;
      }
      
      public function GetNbActiveById(id:int) : int
      {
         return this._activeById[id];
      }
      
      public function CreateAnimation(idAnim:int) : Animation
      {
         var metaAnimation:MetaAnimation = MetaManager.instance.CreateMetaAnimation(idAnim);
         return this.Create(metaAnimation);
      }
      
      public function get activeFactoryObjects() : Vector.<Animation>
      {
         return this._activeFactoryObjects;
      }
      
      private function AddNumberAtId(id:int, mod:int) : void
      {
         if(this._activeById[id] == null)
         {
            this._activeById[id] = 0;
         }
         this._activeById[id] += mod;
      }
      
      final public function Destroy(animation:Animation) : void
      {
         this.AddNumberAtId(animation.metaAnimation.instanceType,-1);
         MetaManager.instance.DestroyMetaData(animation.metaAnimation);
         for(var i:int = 0; i < this._activeFactoryObjects.length; i++)
         {
            if(this._activeFactoryObjects[i] == animation)
            {
               this._activeFactoryObjects.splice(i,1);
               break;
            }
         }
         if(animation.canBeCached)
         {
            this._factoryCache.AddToCache(animation);
         }
         animation.Destroy();
      }
      
      final public function Create(metaObject:MetaAnimation) : Animation
      {
         this.AddNumberAtId(metaObject.instanceType,1);
         var factoryObject:Animation = this._factoryCache.GetFactoryObject(metaObject);
         this._activeFactoryObjects.push(factoryObject);
         factoryObject.Init(metaObject);
         return factoryObject;
      }
   }
}

