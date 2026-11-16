package com.lachhhEngine.games.draw
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class DrawUtils
   {
      
      private static var _pTemp:Point = new Point();
      
      private static var _p1:Point = new Point();
      
      private static var _p2:Point = new Point();
      
      private static var _p3:Point = new Point();
      
      private static var _p4:Point = new Point();
      
      private static var _rect:Rectangle = new Rectangle();
      
      private static var _matrix:Matrix = new Matrix();
      
      public function DrawUtils()
      {
         super();
      }
      
      private static function TransformPoint(p:Point, m:Matrix) : void
      {
         _pTemp.x = p.x;
         _pTemp.y = p.y;
         p.x = m.a * _pTemp.x + m.c * _pTemp.y;
         p.y = m.b * _pTemp.x + m.d * _pTemp.y;
      }
      
      public static function CreateCopypixelableBmpDataUsingMatrix(d:DisplayObject, matrix:Matrix) : CopypixelableBmpData
      {
         var bd:BitmapData = null;
         var animPartBmpData:CopypixelableBmpData = new CopypixelableBmpData();
         var rect:Rectangle = GetRectangleOfAnimPart(d,matrix);
         try
         {
            bd = new BitmapData(rect.width,rect.height,true,0);
         }
         catch(e:Error)
         {
            return null;
         }
         animPartBmpData.x = rect.x;
         animPartBmpData.y = rect.y;
         _matrix.tx = -rect.x;
         _matrix.ty = -rect.y;
         bd.draw(d,_matrix,d.transform.concatenatedColorTransform);
         animPartBmpData.bmpData = bd;
         return animPartBmpData;
      }
      
      public static function GetRectangleOfAnimPart(d:DisplayObject, matrix:Matrix) : Rectangle
      {
         var maxX:Number = NaN;
         var maxY:Number = NaN;
         var bounds:Rectangle = d.getBounds(d.parent);
         bounds.x -= d.x;
         bounds.y -= d.y;
         _p1.x = bounds.left;
         _p1.y = bounds.top;
         _p2.x = bounds.right;
         _p2.y = bounds.top;
         _p3.x = bounds.left;
         _p3.y = bounds.bottom;
         _p4.x = bounds.right;
         _p4.y = bounds.bottom;
         _matrix.a = matrix.a;
         _matrix.b = matrix.b;
         _matrix.c = matrix.c;
         _matrix.d = matrix.d;
         _matrix.tx = 0;
         _matrix.ty = 0;
         TransformPoint(_p1,_matrix);
         TransformPoint(_p2,_matrix);
         TransformPoint(_p3,_matrix);
         TransformPoint(_p4,_matrix);
         _rect.x = Math.min(Math.min(Math.min(Math.min(_p1.x,_p2.x),_p3.x),_p4.x),0);
         _rect.y = Math.min(Math.min(Math.min(Math.min(_p1.y,_p2.y),_p3.y),_p4.y),0);
         maxX = Math.max(Math.max(Math.max(Math.max(_p1.x,_p2.x),_p3.x),_p4.x),1);
         maxY = Math.max(Math.max(Math.max(Math.max(_p1.y,_p2.y),_p3.y),_p4.y),1);
         _rect.width = maxX - _rect.x;
         _rect.height = maxY - _rect.y;
         return _rect;
      }
      
      public static function CreateCopypixelableBmpData(d:DisplayObject, useConcatenedMatrix:Boolean = true) : CopypixelableBmpData
      {
         var rect:Rectangle = null;
         var bd:BitmapData = null;
         var animPartBmpData:CopypixelableBmpData = new CopypixelableBmpData();
         if(useConcatenedMatrix)
         {
            rect = GetRectangleOfAnimPart(d,d.transform.concatenatedMatrix);
         }
         else
         {
            rect = GetRectangleOfAnimPart(d,d.transform.matrix);
         }
         try
         {
            bd = new BitmapData(rect.width,rect.height,true,0);
         }
         catch(e:Error)
         {
            return null;
         }
         animPartBmpData.x = rect.x;
         animPartBmpData.y = rect.y;
         _matrix.tx = -rect.x;
         _matrix.ty = -rect.y;
         bd.draw(d,_matrix,d.transform.concatenatedColorTransform);
         animPartBmpData.bmpData = bd;
         return animPartBmpData;
      }
   }
}

