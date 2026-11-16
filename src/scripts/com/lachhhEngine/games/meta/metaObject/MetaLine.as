package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class MetaLine extends MetaObject
   {
      
      private var _x1:Number;
      
      private var _canDrop:Boolean;
      
      private var _canWallKick:Boolean;
      
      private var _x2:Number;
      
      private var _y1:Number;
      
      private var _y2:Number;
      
      public function MetaLine()
      {
         super();
      }
      
      public function set y2(y2:Number) : void
      {
         this._y2 = y2;
      }
      
      public function set canWallKick(canWallKick:Boolean) : void
      {
         this._canWallKick = canWallKick;
      }
      
      public function get y1() : Number
      {
         return this._y1;
      }
      
      public function get y2() : Number
      {
         return this._y2;
      }
      
      public function get canDrop() : Boolean
      {
         return this._canDrop;
      }
      
      public function get canWallKick() : Boolean
      {
         return this._canWallKick;
      }
      
      public function set x1(x1:Number) : void
      {
         this._x1 = x1;
      }
      
      public function set x2(x2:Number) : void
      {
         this._x2 = x2;
      }
      
      public function get x1() : Number
      {
         return this._x1;
      }
      
      public function get x2() : Number
      {
         return this._x2;
      }
      
      public function set canDrop(canDrop:Boolean) : void
      {
         this._canDrop = canDrop;
      }
      
      public function set y1(y1:Number) : void
      {
         this._y1 = y1;
      }
   }
}

