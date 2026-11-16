package com.battlecry.meta.model
{
   public class ModelBitMapAnimation
   {
      
      private var _bitMapDataArray:Vector.<ModelBitmapData>;
      
      private var _factoryID:int;
      
      public function ModelBitMapAnimation(factoryID:int)
      {
         super();
         this._bitMapDataArray = new Vector.<ModelBitmapData>();
         this._factoryID = factoryID;
      }
      
      public function get bitMapDataArray() : Vector.<ModelBitmapData>
      {
         return this._bitMapDataArray;
      }
      
      public function get factoryID() : int
      {
         return this._factoryID;
      }
      
      public function set bitMapDataArray(bitMapDataArray:Vector.<ModelBitmapData>) : void
      {
         this._bitMapDataArray = bitMapDataArray;
      }
      
      public function set factoryID(factoryID:int) : void
      {
         this._factoryID = factoryID;
      }
      
      public function AddBitMapData(m:ModelBitmapData) : void
      {
         this._bitMapDataArray.push(m);
      }
   }
}

