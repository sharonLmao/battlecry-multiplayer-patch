package com.battlecry.meta.model
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class ModelBitmapData
   {
      
      private var _bmd:BitmapData;
      
      private var _rect:Rectangle;
      
      public function ModelBitmapData(bmd:BitmapData, rect:Rectangle)
      {
         super();
         this._bmd = bmd;
         this._rect = rect;
      }
      
      public function set rect(rect:Rectangle) : void
      {
         this._rect = rect;
      }
      
      public function get bmd() : BitmapData
      {
         return this._bmd;
      }
      
      public function Destroy() : void
      {
         this._bmd.dispose();
         this._rect = null;
      }
      
      public function get rect() : Rectangle
      {
         return this._rect;
      }
      
      public function set bmd(bmd:BitmapData) : void
      {
         this._bmd = bmd;
      }
   }
}

