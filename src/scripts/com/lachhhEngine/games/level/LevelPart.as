package com.lachhhEngine.games.level
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class LevelPart
   {
      
      private var _down:LevelPart;
      
      private var _bmpData:BitmapData;
      
      private var _right:LevelPart;
      
      private var _visual:Bitmap;
      
      private var _pPos:Point;
      
      private var _left:LevelPart;
      
      private var _isInit:Boolean;
      
      private var _up:LevelPart;
      
      public function LevelPart()
      {
         super();
         this._left = null;
         this._right = null;
         this._up = null;
         this._down = null;
         this._pPos = new Point();
         this._visual = new Bitmap();
         this._isInit = false;
      }
      
      public function get y() : Number
      {
         return this._visual.y;
      }
      
      public function set down(down:LevelPart) : void
      {
         this._down = down;
      }
      
      public function get left() : LevelPart
      {
         return this._left;
      }
      
      public function SetPos(x:Number, y:Number) : void
      {
         if(this._visual == null)
         {
            trace("ERROR :: LevelPart_c :: SetPos :: m_bmp = null");
            trace("this.x : " + this._pPos.x);
            trace("this.y : " + this._pPos.y);
            return;
         }
         this._visual.x = Math.floor(x);
         this._visual.y = Math.floor(y);
      }
      
      public function set left(left:LevelPart) : void
      {
         this._left = left;
      }
      
      public function get visual() : Bitmap
      {
         return this._visual;
      }
      
      public function ToString() : String
      {
         var strX:* = String(this._visual.x);
         for(var strY:* = String(this._visual.y); strX.length < 3; )
         {
            strX += " ";
         }
         while(strY.length < 3)
         {
            strY += " ";
         }
         return "(" + strX + "," + strY + ")";
      }
      
      public function set y(y:Number) : void
      {
         this._visual.y = y;
      }
      
      public function Destroy() : void
      {
         this._isInit = false;
         this.Hide();
      }
      
      public function get up() : LevelPart
      {
         return this._up;
      }
      
      public function get right() : LevelPart
      {
         return this._right;
      }
      
      public function get isInit() : Boolean
      {
         return this._isInit;
      }
      
      public function Hide() : void
      {
         if(this._left != null)
         {
            this._left.right = null;
            this._left = null;
         }
         if(this._right != null)
         {
            this._right.left = null;
            this._right = null;
         }
         if(this._up != null)
         {
            this._up.down = null;
            this._up = null;
         }
         if(this._down != null)
         {
            this._down.up = null;
            this._down = null;
         }
         if(this._visual.parent != null)
         {
            this._visual.parent.removeChild(this._visual);
         }
         this._bmpData = null;
         this._pPos.x = this._pPos.y = 0;
      }
      
      public function get down() : LevelPart
      {
         return this._down;
      }
      
      public function Init(bmpData:BitmapData, x:Number, y:Number, precision:Number, bShowGrid:Boolean = false) : void
      {
         this._pPos.x = x;
         this._pPos.y = y;
         this._visual.bitmapData = bmpData;
         this._bmpData = bmpData;
         this._visual.scaleX = 1 / precision;
         this._visual.scaleY = 1 / precision;
         this._isInit = true;
      }
      
      public function IsOnStage() : Boolean
      {
         return this._visual.parent != null;
      }
      
      public function set up(up:LevelPart) : void
      {
         this._up = up;
      }
      
      public function set x(x:Number) : void
      {
         this._visual.x = x;
      }
      
      public function set right(right:LevelPart) : void
      {
         this._right = right;
      }
      
      public function GetMatrixPosX() : int
      {
         return this._pPos.x;
      }
      
      public function GetMatrixPosY() : int
      {
         return this._pPos.y;
      }
      
      public function GetMatrixPos() : Point
      {
         return this._pPos;
      }
      
      public function get x() : Number
      {
         return this._visual.x;
      }
   }
}

