package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class MetaActor extends MetaObject
   {
      
      private var _metaLayer:MetaLayer;
      
      private var _tag:String = "NONE";
      
      private var _rotation:Number = 0;
      
      private var _vx:Number = 0;
      
      private var _vy:Number = 0;
      
      private var _scaleX:Number = 1;
      
      private var _scaleY:Number = 1;
      
      private var _x:Number;
      
      private var _y:Number;
      
      public function MetaActor()
      {
         super();
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set rotation(rotation:Number) : void
      {
         this._rotation = rotation;
      }
      
      public function set vy(vy:Number) : void
      {
         this._vy = vy;
      }
      
      public function get vx() : Number
      {
         return this._vx;
      }
      
      public function set y(y:Number) : void
      {
         this._y = y;
      }
      
      public function set vx(vx:Number) : void
      {
         this._vx = vx;
      }
      
      public function get metaLayer() : MetaLayer
      {
         return this._metaLayer;
      }
      
      public function get scaleX() : Number
      {
         return this._scaleX;
      }
      
      public function get scaleY() : Number
      {
         return this._scaleY;
      }
      
      public function get vy() : Number
      {
         return this._vy;
      }
      
      override public function cloneAttributes(metaObject:MetaObject) : void
      {
         super.cloneAttributes(metaObject);
         var metaActor:MetaActor = MetaActor(metaObject);
         this.metaLayer = metaActor.metaLayer;
         this.tag = metaActor.tag;
         this.scaleX = metaActor.scaleX;
         this.scaleY = metaActor.scaleY;
         this.rotation = metaActor.rotation;
         this.vx = metaActor.vx;
         this.vy = metaActor.vy;
         this.x = metaActor.x;
         this.y = metaActor.y;
      }
      
      public function set metaLayer(metaLayer:MetaLayer) : void
      {
         this._metaLayer = metaLayer;
      }
      
      public function get tag() : String
      {
         return this._tag;
      }
      
      public function set scaleX(scaleX:Number) : void
      {
         this._scaleX = scaleX;
      }
      
      public function set scaleY(scaleY:Number) : void
      {
         this._scaleY = scaleY;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._rotation = 0;
         this._vx = 0;
         this._vy = 0;
         this._scaleX = 1;
         this._scaleY = 1;
      }
      
      public function set x(x:Number) : void
      {
         this._x = x;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set tag(tag:String) : void
      {
         this._tag = tag;
      }
      
      public function get rotation() : Number
      {
         return this._rotation;
      }
   }
}

