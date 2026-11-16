package com.battlecry.meta.model
{
   public class ModelBitmapAnimationsGroup
   {
      
      private var _bitmapAnimationGroup:Vector.<ModelBitMapAnimation>;
      
      public function ModelBitmapAnimationsGroup()
      {
         super();
         this._bitmapAnimationGroup = new Vector.<ModelBitMapAnimation>();
      }
      
      public function AddModelBitMapAnimationGroup(m:ModelBitMapAnimation) : void
      {
         this._bitmapAnimationGroup.push(m);
      }
      
      public function set bitmapAnimationGroup(bitmapAnimationGroup:Vector.<ModelBitMapAnimation>) : void
      {
         this._bitmapAnimationGroup = bitmapAnimationGroup;
      }
      
      public function Copy(m:ModelBitmapAnimationsGroup) : void
      {
         for(var i:int = 0; i < m.bitmapAnimationGroup.length; i++)
         {
            this._bitmapAnimationGroup[i] = m.bitmapAnimationGroup[i];
         }
      }
      
      public function GetBitmapAnimationOnFactoryID(factoryID:int) : ModelBitMapAnimation
      {
         var m:ModelBitMapAnimation = null;
         for(var i:int = 0; i < this._bitmapAnimationGroup.length; i++)
         {
            m = this._bitmapAnimationGroup[i];
            if(m.factoryID == factoryID)
            {
               return m;
            }
         }
         return null;
      }
      
      public function Destroy() : void
      {
         var m:ModelBitMapAnimation = null;
         var j:int = 0;
         for(var i:int = 0; i < this._bitmapAnimationGroup.length; i++)
         {
            m = this._bitmapAnimationGroup[i];
            for(j = 0; j < m.bitMapDataArray.length; j++)
            {
               m.bitMapDataArray[j].Destroy();
            }
         }
      }
      
      public function get bitmapAnimationGroup() : Vector.<ModelBitMapAnimation>
      {
         return this._bitmapAnimationGroup;
      }
   }
}

