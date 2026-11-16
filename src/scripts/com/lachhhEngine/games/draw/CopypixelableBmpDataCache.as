package com.lachhhEngine.games.draw
{
   public class CopypixelableBmpDataCache
   {
      
      private var _cache:Array;
      
      private var _cacheById:Array;
      
      public function CopypixelableBmpDataCache()
      {
         super();
         this._cache = new Array();
         this._cacheById = new Array();
      }
      
      public function get numBmpData() : int
      {
         return this._cache.length;
      }
      
      private function GetInCache(copyPixelable:ICopyPixelable) : CopypixelableBmpData
      {
         return this._cacheById[copyPixelable.GetTransformId()];
      }
      
      public function GetBmpData(copyPixelable:ICopyPixelable) : CopypixelableBmpData
      {
         var animPartBmpData:CopypixelableBmpData = this.GetInCache(copyPixelable);
         if(animPartBmpData == null)
         {
            animPartBmpData = copyPixelable.CreateCopypixelableBmpData();
            if(animPartBmpData != null)
            {
               this._cacheById[copyPixelable.GetTransformId()] = animPartBmpData;
               this._cache.push(animPartBmpData);
            }
         }
         return animPartBmpData;
      }
      
      public function Destroy() : void
      {
         var animPartBmpData:CopypixelableBmpData = null;
         while(this._cache.length > 0)
         {
            animPartBmpData = this._cache.shift();
            animPartBmpData.Destroy();
         }
         this._cache = null;
         this._cacheById = null;
      }
   }
}

