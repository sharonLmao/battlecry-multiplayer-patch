package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class MetaCircle extends MetaObject
   {
      
      private var _angleDetectEnd:Number;
      
      private var _rayon:Number = 0;
      
      private var _angleDetectStart:Number;
      
      private var _x:Number = 0;
      
      private var _y:Number = 0;
      
      public function MetaCircle()
      {
         super();
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set y(y:Number) : void
      {
         this._y = y;
      }
      
      public function get angleDetectEnd() : Number
      {
         return this._angleDetectEnd;
      }
      
      public function set angleDetectStart(angleDetectStart:Number) : void
      {
         this._angleDetectStart = angleDetectStart;
      }
      
      public function get rayon() : Number
      {
         return this._rayon;
      }
      
      public function get angleDetectStart() : Number
      {
         return this._angleDetectStart;
      }
      
      override public function Init(m:MetaObject, context:Game) : void
      {
         super.Init(m,context);
         this._angleDetectStart = -180;
         this._angleDetectEnd = 180;
      }
      
      public function set angleDetectEnd(angleDetectEnd:Number) : void
      {
         this._angleDetectEnd = angleDetectEnd;
      }
      
      public function set x(x:Number) : void
      {
         this._x = x;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set rayon(rayon:Number) : void
      {
         this._rayon = rayon;
      }
   }
}

