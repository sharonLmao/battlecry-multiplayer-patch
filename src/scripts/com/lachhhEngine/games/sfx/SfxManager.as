package com.lachhhEngine.games.sfx
{
   import com.lachhhEngine.games.factory.SfxCache;
   import com.lachhhEngine.games.factory.SfxFactory;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaMusic;
   import com.lachhhEngine.games.meta.metaObject.MetaSound2D;
   import com.lachhhEngine.utils.Utils;
   
   public class SfxManager
   {
      
      private static var _instance:SfxManager;
      
      private var _activeById:Array;
      
      private var _activeFactoryObjects:Array;
      
      private var _factoryCache:SfxCache;
      
      public function SfxManager(objFactory:SfxFactory)
      {
         super();
         this._factoryCache = new SfxCache(objFactory);
         this._activeFactoryObjects = new Array();
         if(_instance != null)
         {
            throw new Error("instance already created, use SfxMAnager.instance");
         }
         _instance = this;
         this._activeById = new Array();
      }
      
      public static function get instance() : SfxManager
      {
         return _instance;
      }
      
      public static function get factory() : SfxFactory
      {
         return _instance._factoryCache.factory;
      }
      
      public static function get factoryCache() : SfxCache
      {
         return _instance._factoryCache;
      }
      
      public function GetNbActiveById(id:int) : int
      {
         return this._activeById[id];
      }
      
      final protected function CreateSound2D(metaSound2D:MetaSound2D) : Sound2D
      {
         this.AddNumberAtId(metaSound2D.instanceType,1);
         var sound2D:Sound2D = this._factoryCache.GetSound2D(metaSound2D);
         this._activeFactoryObjects.push(sound2D);
         sound2D.Init(metaSound2D);
         return sound2D;
      }
      
      final protected function DestroySound2D(sound2D:Sound2D) : void
      {
         this.AddNumberAtId(sound2D.metaInfo.instanceType,-1);
         MetaManager.instance.DestroyMetaData(sound2D.metaInfo);
         Utils.RemoveFromArray(this._activeFactoryObjects,sound2D);
         if(sound2D.canBeCached)
         {
            this._factoryCache.AddToCache(sound2D);
         }
         sound2D.Destroy();
      }
      
      final protected function CreateMusic(metaMusic:MetaMusic) : MusicTrack
      {
         var music:MusicTrack = this._factoryCache.GetMusic(metaMusic);
         this.AddNumberAtId(metaMusic.instanceType,1);
         music.Init(metaMusic);
         this._activeFactoryObjects.push(music);
         return music;
      }
      
      final protected function DestroyMusic(music:MusicTrack) : void
      {
         this.AddNumberAtId(music.metaInfo.instanceType,-1);
         MetaManager.instance.DestroyMetaData(music.metaInfo);
         Utils.RemoveFromArray(this._activeFactoryObjects,music);
         this._factoryCache.AddToCache(music);
         music.Destroy();
      }
      
      public function get activeFactoryObjects() : Array
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
      
      public function get factoryCache() : SfxCache
      {
         return this._factoryCache;
      }
   }
}

