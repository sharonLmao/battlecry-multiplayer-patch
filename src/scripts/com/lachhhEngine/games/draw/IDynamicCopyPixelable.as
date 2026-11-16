package com.lachhhEngine.games.draw
{
   public interface IDynamicCopyPixelable extends ICopyPixelable
   {
      
      function GetBmpData() : CopypixelableBmpData;
      
      function get cache() : CopypixelableBmpDataCache;
      
      function DestroyDynamicCache() : void;
   }
}

