package com.battlecry.battle
{
   public class GridPos
   {
      
      private const SEPARATOR:String = "[GP]";
      
      private var _x:int;
      
      private var _y:int;
      
      public function GridPos(x:int, y:int)
      {
         super();
         this._x = x;
         this._y = y;
      }
      
      public function get y() : int
      {
         return this._y;
      }
      
      public function set y(y:int) : void
      {
         this._y = y;
      }
      
      public function Decode(s:String) : void
      {
         var params:Array = s.split(this.SEPARATOR);
         this._x = params.shift() as int;
         this._y = params.shift() as int;
      }
      
      public function set x(x:int) : void
      {
         this._x = x;
      }
      
      public function Encode() : String
      {
         return this._x + this.SEPARATOR + this._y;
      }
      
      public function get x() : int
      {
         return this._x;
      }
   }
}

