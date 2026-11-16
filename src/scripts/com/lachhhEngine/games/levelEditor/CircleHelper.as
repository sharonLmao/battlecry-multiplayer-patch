package com.lachhhEngine.games.levelEditor
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.levelEditor.MetaCircleHelper;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.games.physique.Circle;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.KeyManager;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class CircleHelper extends Actor
   {
      
      private var _isScaling:Boolean;
      
      private var _clickCallBack:Callback;
      
      private var _circleVisual:MovieClip;
      
      private var _circleHandler:MovieClip;
      
      private var _circle:Circle;
      
      private var _context:Game;
      
      private var _isDragging:Boolean;
      
      private var _selected:Boolean;
      
      private var _rectSelected:MovieClip;
      
      public function CircleHelper()
      {
         super();
         this._circleVisual = new MovieClip();
         this._circleHandler = new MovieClip();
         this._rectSelected = new MovieClip();
      }
      
      override public function Update(context:Game) : void
      {
         var p:Point = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         super.Update(context);
         if(this._isScaling)
         {
            p = KeyManager.GetMousePos();
            p = context.camera.ConvertPointToMoteur(p,layer);
            dx = p.x - px;
            dy = p.y - py;
            this.circle.rayon = Math.round(Math.sqrt(dx * dx + dy * dy));
            this.UpdateVisual();
            context.GetPlayer1().UpdateMyCollision();
         }
         else if(this._isDragging)
         {
            p = KeyManager.GetMousePos();
            p = context.camera.ConvertPointToMoteur(p,layer);
            px = Math.round(p.x);
            py = Math.round(p.y);
            this.circle.x = px;
            this.circle.y = py;
            this.UpdateVisual();
            context.GetPlayer1().UpdateMyCollision();
         }
      }
      
      public function DragCircle() : void
      {
         this._isDragging = true;
         this._context.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUpDragging);
         this._clickCallBack.DoCallback();
      }
      
      private function onMouseUpScaling(e:MouseEvent) : void
      {
         this._isScaling = false;
         this._context.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUpScaling);
      }
      
      public function set clickCallBack(clickCallBack:Callback) : void
      {
         this._clickCallBack = clickCallBack;
      }
      
      private function onMouseUpDragging(e:MouseEvent) : void
      {
         this._isDragging = false;
         this._context.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUpDragging);
      }
      
      protected function UpdateVisual() : void
      {
         this._circleVisual.graphics.clear();
         this._circleVisual.graphics.beginFill(16711680,0.25);
         this._circleVisual.graphics.drawCircle(0,0,this.circle.rayon);
         this._circleVisual.graphics.endFill();
         this._circleHandler.graphics.clear();
         this._circleHandler.graphics.beginFill(16711680,0.25);
         this._circleHandler.graphics.drawCircle(0,0,this.circle.rayon + 10);
         this._circleHandler.graphics.endFill();
         this._rectSelected.graphics.clear();
         if(this._selected)
         {
            this._rectSelected.graphics.lineStyle(1,255);
            this._rectSelected.graphics.beginFill(0,0);
            this._rectSelected.graphics.drawRect(-this.circle.rayon,-this.circle.rayon,this.circle.rayon * 2,this.circle.rayon * 2);
            this._rectSelected.graphics.endFill();
         }
      }
      
      public function get metaCircleHelper() : MetaCircleHelper
      {
         return MetaCircleHelper(metaInfo);
      }
      
      private function onClick(e:MouseEvent) : void
      {
         var mc:MovieClip = MovieClip(e.target);
         if(mc == this._circleVisual)
         {
            this.DragCircle();
         }
         else if(mc == this._circleHandler)
         {
            this.ScaleCircle();
         }
      }
      
      public function get clickCallBack() : Callback
      {
         return this._clickCallBack;
      }
      
      public function get circle() : Circle
      {
         return this._circle;
      }
      
      public function get circleRayon() : Number
      {
         return this._circle.rayon;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         animationContainer.removeChild(this._rectSelected);
         animationContainer.removeChild(this._circleVisual);
         animationContainer.removeChild(this._circleHandler);
         this._circleVisual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
         this._circleHandler.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
         this._context = null;
      }
      
      public function Deselect() : void
      {
         this._selected = false;
         this.UpdateVisual();
      }
      
      public function ScaleCircle() : void
      {
         this._isScaling = true;
         this._context.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUpScaling);
         this._clickCallBack.DoCallback();
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function Select() : void
      {
         this._selected = true;
         this.UpdateVisual();
      }
      
      public function set circleRayon(n:Number) : void
      {
         this._circle.rayon = n;
      }
      
      public function set selected(selected:Boolean) : void
      {
         this._selected = selected;
      }
      
      override public function Init(metaObj:MetaObject, context:Game) : void
      {
         super.Init(metaObj,context);
         this._circle = Circle(this.metaCircleHelper.metaCircle.factoryObject);
         animationContainer.addChild(this._rectSelected);
         animationContainer.addChild(this._circleHandler);
         animationContainer.addChild(this._circleVisual);
         this._circleVisual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
         this._circleHandler.addEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
         this._circleVisual.buttonMode = true;
         this._circleHandler.buttonMode = true;
         this._isDragging = false;
         this._isScaling = false;
         this._context = context;
         this.UpdateVisual();
      }
   }
}

