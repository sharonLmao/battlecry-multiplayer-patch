package com.lachhhEngine.games.draw
{
   import flash.display.BitmapData;
   
   public class CopypixelableBmpData
   {
      
      private var _y:int;
      
      private var _bmpData:BitmapData;
      
      private var _x:int;
      
      public function CopypixelableBmpData()
      {
         super();
      }
      
      public function get y() : int
      {
         return this._y;
      }
      
      public function set y(y:int) : void
      {
         this._y = y;
      }
      
      public function get bmpData() : BitmapData
      {
         return this._bmpData;
      }
      
      public function set x(x:int) : void
      {
         this._x = x;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function Destroy() : void
      {
         if(this._bmpData != null)
         {
            this._bmpData.dispose();
            this._bmpData = null;
         }
         this.x = 0;
         this.y = 0;
      }
      
      public function set bmpData(bmpData:BitmapData) : void
      {
         this._bmpData = bmpData;
      }
   }
}

