package com.lachhhEngine.games.levelEditor
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.levelEditor.MetaCamBoundsHelper;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.io.KeyManager;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class CamBoundsHelper extends Actor
   {
      
      private var _up:MovieClip;
      
      private var _down:MovieClip;
      
      private var _dragRight:Boolean;
      
      private var _dragUp:Boolean;
      
      private var _dragDown:Boolean;
      
      private var _right:MovieClip;
      
      private var _left:MovieClip;
      
      private var _dragLeft:Boolean;
      
      public function CamBoundsHelper()
      {
         super();
         this._left = new MovieClip();
         this._right = new MovieClip();
         this._up = new MovieClip();
         this._down = new MovieClip();
         this._right.rotation = 90;
         this._down.rotation = 180;
         this._left.rotation = 270;
         this._left.buttonMode = true;
         this._right.buttonMode = true;
         this._up.buttonMode = true;
         this._down.buttonMode = true;
         cameraCanControlMe = false;
      }
      
      public function set down(n:Number) : void
      {
         this.metaCamBounds.metaLevel.camBoundsDown = n;
      }
      
      public function get left() : Number
      {
         return this.metaCamBounds.metaLevel.camBoundsLeft;
      }
      
      private function onMouseUp(e:MouseEvent) : void
      {
         this._dragLeft = false;
         this._dragRight = false;
         this._dragUp = false;
         this._dragDown = false;
         context.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
      
      public function UpdateVisual() : void
      {
         var height:Number = this.down - this.up;
         var width:Number = this.right - this.left;
         this.DrawRect(this._left,height);
         this.DrawRect(this._right,height);
         this.DrawRect(this._up,width);
         this.DrawRect(this._down,width);
         this._left.x = this.left;
         this._left.y = this.down;
         this._up.x = this.left;
         this._up.y = this.up;
         this._right.x = this.right;
         this._right.y = this.up;
         this._down.x = this.right;
         this._down.y = this.down;
      }
      
      public function set left(n:Number) : void
      {
         this.metaCamBounds.metaLevel.camBoundsLeft = n;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._left.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickBox);
         this._right.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickBox);
         this._up.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickBox);
         this._down.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickBox);
      }
      
      public function get up() : Number
      {
         return this.metaCamBounds.metaLevel.camBoundsUp;
      }
      
      public function get metaCamBounds() : MetaCamBoundsHelper
      {
         return MetaCamBoundsHelper(metaInfo);
      }
      
      private function onClickBox(e:MouseEvent) : void
      {
         var mc:MovieClip = e.target as MovieClip;
         if(mc == this._left)
         {
            this._dragLeft = true;
            context.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         }
         else if(mc == this._right)
         {
            this._dragRight = true;
            context.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         }
         else if(mc == this._up)
         {
            this._dragUp = true;
            context.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         }
         else if(mc == this._down)
         {
            this._dragDown = true;
            context.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         }
      }
      
      public function get right() : Number
      {
         return this.metaCamBounds.metaLevel.camBoundsRight;
      }
      
      private function DrawRect(mc:MovieClip, width:Number) : void
      {
         mc.graphics.clear();
         mc.graphics.beginFill(16711680);
         mc.graphics.drawRect(0,-40,width,40);
         mc.graphics.endFill();
      }
      
      override public function Update(context:Game) : void
      {
         var pMouse:Point = null;
         super.Update(context);
         if(this._dragLeft || this._dragRight || this._dragUp || this._dragDown)
         {
            pMouse = KeyManager.GetMousePos();
            pMouse = context.camera.ConvertPointToMoteur(pMouse,layer);
            pMouse.x = Math.round(pMouse.x);
            pMouse.y = Math.round(pMouse.y);
            if(this._dragLeft)
            {
               this.left = pMouse.x;
            }
            if(this._dragRight)
            {
               this.right = pMouse.x;
            }
            if(this._dragUp)
            {
               this.up = pMouse.y;
            }
            if(this._dragDown)
            {
               this.down = pMouse.y;
            }
            this.UpdateVisual();
         }
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         animationContainer.addChild(this._left);
         animationContainer.addChild(this._right);
         animationContainer.addChild(this._up);
         animationContainer.addChild(this._down);
         this._left.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickBox);
         this._right.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickBox);
         this._up.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickBox);
         this._down.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickBox);
         px = 0;
         py = 0;
         this.UpdateVisual();
         cameraCanControlMe = false;
      }
      
      public function get down() : Number
      {
         return this.metaCamBounds.metaLevel.camBoundsDown;
      }
      
      public function set up(n:Number) : void
      {
         this.metaCamBounds.metaLevel.camBoundsUp = n;
      }
      
      public function set right(n:Number) : void
      {
         this.metaCamBounds.metaLevel.camBoundsRight = n;
      }
   }
}

