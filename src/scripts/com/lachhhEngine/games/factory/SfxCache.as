package com.lachhhEngine.games.factory
{
   import com.lachhhEngine.games.meta.metaObject.MetaMusic;
   import com.lachhhEngine.games.meta.metaObject.MetaSound2D;
   import com.lachhhEngine.games.sfx.MusicTrack;
   import com.lachhhEngine.games.sfx.Sfx;
   import com.lachhhEngine.games.sfx.Sound2D;
   import com.lachhhEngine.utils.Utils;
   
   public class SfxCache
   {
      
      private var _cache:Array;
      
      private var _factory:SfxFactory;
      
      private var _activeCacheId:Array;
      
      public function SfxCache(factory:SfxFactory)
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
      
      public function AddToCache(gameElement:Sfx) : void
      {
         var instanceType:int = gameElement.metaInfo.instanceType;
         if(this._cache[instanceType] == null)
         {
            this._cache[instanceType] = new Array();
         }
         this._cache[instanceType].push(gameElement);
         Utils.AddInArrayIfNotIn(this._activeCacheId,instanceType);
      }
      
      public function get factory() : SfxFactory
      {
         return this._factory;
      }
      
      public function GetSound2D(metaSound2D:MetaSound2D) : Sound2D
      {
         var sound2D:Sound2D = null;
         var instanceType:int = metaSound2D.instanceType;
         if(this._cache[instanceType] != null && this._cache[instanceType].length > 0)
         {
            sound2D = Sound2D(this._cache[instanceType].shift());
         }
         else
         {
            sound2D = this._factory.CreateSound2DInstance(metaSound2D);
         }
         return sound2D;
      }
      
      public function GetMusic(metaMusic:MetaMusic) : MusicTrack
      {
         var music:MusicTrack = null;
         var instanceType:int = metaMusic.instanceType;
         if(this._cache[instanceType] != null && this._cache[instanceType].length > 0)
         {
            music = MusicTrack(this._cache[instanceType].shift());
         }
         else
         {
            music = this._factory.CreateMusicInstance(metaMusic);
         }
         return music;
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

