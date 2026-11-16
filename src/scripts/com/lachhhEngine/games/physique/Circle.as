package com.lachhhEngine.games.physique
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObject;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaCircle;
   import flash.geom.Point;
   
   public class Circle extends FactoryObject
   {
      
      private var _dynamic:Boolean = false;
      
      private var _angleDetectEnd:Number = 0;
      
      private var _angleDetectStart:Number = 0;
      
      private var _point:Point;
      
      private var _index:int = -1;
      
      public function Circle()
      {
         super();
         this._point = new Point();
      }
      
      public function get rayon() : Number
      {
         return this.metaCircle.rayon;
      }
      
      public function AngleRange() : Number
      {
         if(this._angleDetectStart >= this._angleDetectEnd)
         {
            return 360 - (this._angleDetectStart - this._angleDetectEnd);
         }
         return this._angleDetectEnd - this._angleDetectStart;
      }
      
      public function get point() : Point
      {
         this._point.x = this.x;
         this._point.y = this.y;
         return this._point;
      }
      
      public function SetPosition(newX:Number, newY:Number) : void
      {
         this.x = newX;
         this.y = newY;
      }
      
      public function IsDynamic() : Boolean
      {
         return this._dynamic;
      }
      
      public function set rayon(n:Number) : void
      {
         this.metaCircle.rayon = n;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._point.x = 0;
         this._point.y = 0;
      }
      
      public function AngleIsInRange(nAngle:Number) : Boolean
      {
         if(this._angleDetectStart >= this._angleDetectEnd)
         {
            return nAngle >= this._angleDetectStart && nAngle <= 180 || nAngle > -180 && nAngle <= this._angleDetectEnd;
         }
         return this._angleDetectStart <= nAngle && this._angleDetectEnd >= nAngle;
      }
      
      public function SetIsDynamic(b:Boolean) : void
      {
         this._dynamic = b;
      }
      
      public function IsInside(px:Number, py:Number) : Boolean
      {
         return this.metaCircle.rayon * this.metaCircle.rayon > (px - this.x) * (px - this.x) + (py - this.y) * (py - this.y);
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         var metaCircle:MetaCircle = MetaCircle(metaObject);
         this._angleDetectStart = metaCircle.angleDetectStart;
         this._angleDetectEnd = metaCircle.angleDetectEnd;
      }
      
      public function set y(y:Number) : void
      {
         this.metaCircle.y = y;
         this._point.y = y;
      }
      
      public function get metaCircle() : MetaCircle
      {
         return MetaCircle(metaInfo);
      }
      
      public function set x(x:Number) : void
      {
         this.metaCircle.x = x;
         this._point.x = x;
      }
      
      public function get x() : Number
      {
         return this.metaCircle.x;
      }
      
      public function get y() : Number
      {
         return this.metaCircle.y;
      }
      
      public function GetDistanceCarre(px:Number, py:Number) : Number
      {
         return (px - this.x) * (px - this.x) + (py - this.y) * (py - this.y);
      }
   }
}

