package com.lachhhEngine.games.draw
{
   public class CopypixelableBmpDataFactory
   {
      
      private static var _instance:CopypixelableBmpDataFactory;
      
      private var _cache:Array;
      
      private var _cacheById:Array;
      
      private var _dynamicCopyPixelableCache:Array;
      
      public function CopypixelableBmpDataFactory()
      {
         super();
         this._dynamicCopyPixelableCache = new Array();
         this._cache = new Array();
         this._cacheById = new Array();
      }
      
      public static function get instance() : CopypixelableBmpDataFactory
      {
         if(_instance == null)
         {
            _instance = new CopypixelableBmpDataFactory();
         }
         return _instance;
      }
      
      public function get nbBmpDataDynamic() : int
      {
         var i:int = 0;
         var d:IDynamicCopyPixelable = null;
         var cpt:int = 0;
         for(i = 0; i < this._dynamicCopyPixelableCache.length; i++)
         {
            d = this._dynamicCopyPixelableCache[i];
            cpt += d.cache.numBmpData;
         }
         return cpt;
      }
      
      public function get nbBmpDataTotal() : int
      {
         return this.nbBmpDataStatic + this.nbBmpDataDynamic;
      }
      
      public function RegisterDynamicCopypixelable(dynamicCopypixalable:IDynamicCopyPixelable) : void
      {
         this._dynamicCopyPixelableCache.push(dynamicCopypixalable);
      }
      
      public function get nbBmpDataStatic() : int
      {
         var i:int = 0;
         var a:CopypixelableBmpDataCache = null;
         var cpt:int = 0;
         for(i = 0; i < this._cache.length; i++)
         {
            a = this._cache[i];
            cpt += a.numBmpData;
         }
         return cpt;
      }
      
      public function GetBmpData(copyPixelable:IStaticCopyPixelable) : CopypixelableBmpData
      {
         var copyPixelableBmpData:CopypixelableBmpDataCache = null;
         var animData:CopypixelableBmpDataCache = null;
         var index:int = copyPixelable.GetClassId();
         if(this._cacheById[index] == null)
         {
            animData = new CopypixelableBmpDataCache();
            this._cacheById[index] = animData;
            this._cache.push(animData);
         }
         copyPixelableBmpData = this._cacheById[index];
         return copyPixelableBmpData.GetBmpData(copyPixelable);
      }
      
      public function Destroy() : void
      {
         var copypixelCache:CopypixelableBmpDataCache = null;
         var dynamicCopypixelable:IDynamicCopyPixelable = null;
         while(this._cache.length > 0)
         {
            copypixelCache = this._cache.shift();
            copypixelCache.Destroy();
         }
         while(this._dynamicCopyPixelableCache.length > 0)
         {
            dynamicCopypixelable = this._dynamicCopyPixelableCache.shift();
            dynamicCopypixelable.DestroyDynamicCache();
         }
         this._cacheById = new Array();
      }
   }
}

