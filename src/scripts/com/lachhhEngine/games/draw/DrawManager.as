package com.lachhhEngine.games.draw
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.level.LevelLayer;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class DrawManager
   {
      
      private static const IDENTITY:Matrix = new Matrix();
      
      private static const ZERO:Point = new Point();
      
      private var _height:int = -1;
      
      private var _width:int = -1;
      
      private var _bmp:Bitmap;
      
      private var _destPoint:Point;
      
      private var _bmpData:BitmapData;
      
      private var _emptyBmpData:BitmapData;
      
      private var _context:Game;
      
      private var _layerMatrix:Matrix;
      
      private var _sourceRect:Rectangle;
      
      public function DrawManager(context:Game)
      {
         super();
         this._context = context;
         this._bmp = new Bitmap(this._bmpData);
         this._destPoint = new Point();
         this._sourceRect = new Rectangle();
      }
      
      public function get bmp() : Bitmap
      {
         return this._bmp;
      }
      
      public function StartBatch(layer:LevelLayer) : void
      {
         if(this.bmp.parent == null)
         {
            this._context.GetVisualContainer().addChild(this.bmp);
         }
         layer.visual.transform.matrix = IDENTITY;
      }
      
      public function Destroy() : void
      {
         if(this._context.GetVisualContainer().contains(this.bmp))
         {
            this._context.GetVisualContainer().removeChild(this.bmp);
         }
         CopypixelableBmpDataFactory.instance.Destroy();
      }
      
      public function Clear(w:Number, h:Number) : void
      {
         var newSize:Boolean = false;
         var newW:Number = w;
         var newH:Number = h;
         if(newW != this._width || newH != this._height)
         {
            newSize = true;
            this._width = newW;
            this._height = newH;
            if(this._emptyBmpData != null)
            {
               this._emptyBmpData.dispose();
            }
            if(this._bmpData != null)
            {
               this._bmpData.dispose();
            }
            this._emptyBmpData = new BitmapData(this._width,this._height,true,0);
            this._bmpData = new BitmapData(this._width,this._height,true,0);
            this._bmp.bitmapData = this._bmpData;
            this._bmp.x = (this._context.metaGame.width - this._width) / 2;
            this._bmp.y = (this._context.metaGame.height - this._height) / 2;
            this._layerMatrix = this._context.actionLayer.visual.transform.matrix.clone();
         }
         this._bmpData.lock();
         this._sourceRect.width = this._width;
         this._sourceRect.height = this._height;
         if(!newSize)
         {
            this._bmpData.copyPixels(this._emptyBmpData,this._sourceRect,ZERO,this._emptyBmpData,ZERO,false);
         }
      }
      
      public function DrawBatch(copyPixelable:ICopyPixelable) : void
      {
         var abd:CopypixelableBmpData = null;
         if(copyPixelable is IStaticCopyPixelable)
         {
            abd = CopypixelableBmpDataFactory.instance.GetBmpData(IStaticCopyPixelable(copyPixelable));
         }
         else if(copyPixelable is IDynamicCopyPixelable)
         {
            abd = IDynamicCopyPixelable(copyPixelable).GetBmpData();
         }
         if(abd == null || abd.bmpData == null)
         {
            return;
         }
         this._destPoint.x = copyPixelable.displayObject.transform.concatenatedMatrix.tx + abd.x - (this._context.metaGame.width - this._width) / 2;
         this._destPoint.y = copyPixelable.displayObject.transform.concatenatedMatrix.ty + abd.y - (this._context.metaGame.height - this._height) / 2;
         this._sourceRect.width = abd.bmpData.width;
         this._sourceRect.height = abd.bmpData.height;
         this._sourceRect.x = 0;
         this._sourceRect.y = 0;
         this._bmpData.copyPixels(abd.bmpData,this._sourceRect,this._destPoint,abd.bmpData,ZERO,true);
      }
      
      public function EndBatch(layer:LevelLayer) : void
      {
         layer.visual.transform.matrix = this._layerMatrix;
         this._bmpData.unlock();
      }
   }
}

