package com.lachhhEngine.games.levelEditor
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.LevelEditor;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.levelEditor.MetaLineHelper;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.games.physique.Circle;
   import com.lachhhEngine.games.physique.EquationVecto;
   import com.lachhhEngine.games.physique.Line;
   import com.lachhhEngine.games.physique.PhysicManager;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.KeyManager;
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class LineHelper extends Actor
   {
      
      private var _fleche:MovieClip;
      
      private var _draggingPoint:MovieClip;
      
      private var _clickCallBack:Callback;
      
      private var _region:MovieClip;
      
      private var _circle1:Circle;
      
      private var _circle2:Circle;
      
      private var _mcCanWallKick:MovieClip;
      
      private var _txtCanWallKick:TextField;
      
      private var _point1:MovieClip;
      
      private var _point2:MovieClip;
      
      private var _rect:MovieClip;
      
      private var _line:Line;
      
      private var _mgr:LevelEditorHelperManager;
      
      private var _mcCanDrop:MovieClip;
      
      private var _txtCanDrop:TextField;
      
      private var _context:Game;
      
      private var _selected:Boolean = false;
      
      public function LineHelper()
      {
         super();
         this._point1 = new MovieClip();
         this._point2 = new MovieClip();
         this._rect = new MovieClip();
         this._fleche = new MovieClip();
         this._region = new MovieClip();
         this._txtCanDrop = new TextField();
         this._txtCanWallKick = new TextField();
         this._mcCanDrop = new MovieClip();
         this._mcCanWallKick = new MovieClip();
         this._point1.graphics.beginFill(65280);
         this._point1.graphics.drawCircle(0,0,10);
         this._point1.graphics.endFill();
         this._point2.graphics.beginFill(65280);
         this._point2.graphics.drawCircle(0,0,10);
         this._point2.graphics.endFill();
         this._point1.buttonMode = true;
         this._point2.buttonMode = true;
         this._rect.buttonMode = true;
         this._region.mouseEnabled = false;
         this._region.mouseChildren = false;
         this._txtCanDrop.selectable = false;
         this._txtCanWallKick.selectable = false;
         this._txtCanDrop.height = 20;
         this._txtCanWallKick.height = 20;
         this._mcCanDrop.addChild(this._txtCanDrop);
         this._mcCanWallKick.addChild(this._txtCanWallKick);
         this._mcCanDrop.mouseChildren = false;
         this._mcCanWallKick.mouseChildren = false;
         this._mcCanDrop.buttonMode = true;
         this._mcCanWallKick.buttonMode = true;
         pausable = false;
      }
      
      public function get region() : MovieClip
      {
         return this._region;
      }
      
      private function UpdateVisual() : void
      {
         var colorLine:Number = NaN;
         px = this._line.x1;
         py = this._line.y1;
         this._point2.x = this._line.x2 - this._line.x1;
         this._point2.y = this._line.y2 - this._line.y1;
         if(this._line.canDrop && this._line.canWallKick)
         {
            colorLine = 16777215;
         }
         if(this._line.canDrop && !this._line.canWallKick)
         {
            colorLine = 65280;
         }
         if(!this._line.canDrop && this._line.canWallKick)
         {
            colorLine = 16711680;
         }
         if(!this._line.canDrop && !this._line.canWallKick)
         {
            colorLine = 0;
         }
         animationContainer.graphics.clear();
         animationContainer.graphics.lineStyle(5,colorLine,this._point2.x - this._point1.x == 0 || this._point2.y - this._point1.y == 0 ? 1 : 0.5);
         animationContainer.graphics.moveTo(0,0);
         animationContainer.graphics.lineTo(this._point2.x,this._point2.y);
         var dx:Number = this._point2.x - this._point1.x;
         var dy:Number = this._point2.y - this._point1.y;
         var width:Number = Math.sqrt(dx * dx + dy * dy);
         this._rect.alpha = this._selected ? 1 : 0;
         this._rect.graphics.clear();
         this._rect.graphics.lineStyle(1,255);
         this._rect.graphics.beginFill(0,0);
         this._rect.graphics.drawRect(0,-10,width,20);
         this._rect.graphics.endFill();
         this._rect.rotation = EquationVecto.GetRotation(this._point2.x,this._point1.x,this._point2.y,this._point1.y);
         this._fleche.graphics.clear();
         this._fleche.graphics.lineStyle(2,0);
         this._fleche.graphics.moveTo(width / 2,0);
         this._fleche.graphics.lineTo(width / 2,-30);
         this._fleche.graphics.lineTo(width / 2 - 10,-20);
         this._fleche.graphics.lineTo(width / 2,-30);
         this._fleche.graphics.lineTo(width / 2 + 10,-20);
         this._fleche.rotation = EquationVecto.GetRotation(this._point2.x,this._point1.x,this._point2.y,this._point1.y);
         if(this._line.canDrop)
         {
            this._txtCanDrop.text = "Can Drop";
            this._txtCanDrop.textColor = 65280;
         }
         else
         {
            this._txtCanDrop.text = "Cannot Drop";
            this._txtCanDrop.textColor = 16711680;
         }
         if(this._line.canWallKick)
         {
            this._txtCanWallKick.text = "Can WallKick";
            this._txtCanWallKick.textColor = 65280;
         }
         else
         {
            this._txtCanWallKick.text = "Cannot WallKick";
            this._txtCanWallKick.textColor = 16711680;
         }
         this._mcCanDrop.x = this._line.GetCenterPoint().x - px - this._txtCanDrop.width / 2;
         this._mcCanWallKick.x = this._line.GetCenterPoint().x - px - this._txtCanWallKick.width / 2;
         this._mcCanDrop.y = this._line.GetCenterPoint().y - py - 40;
         this._mcCanWallKick.y = this._line.GetCenterPoint().y - py - 20;
      }
      
      public function CheckForRegion() : void
      {
         var allInNegative:Boolean = false;
         var centreX:Number = NaN;
         var centreY:Number = NaN;
         var i:int = 0;
         var l:Line = null;
         var result:Boolean = false;
         var regionLine:Array = new Array(this);
         var connected:LineHelper = this.FindLinkedLine(this);
         while(connected != null && connected != this)
         {
            regionLine.push(connected);
            connected = this.FindLinkedLine(connected);
         }
         if(connected == this)
         {
            allInNegative = true;
            centreX = this.line.GetCenterPoint().x;
            centreY = this.line.GetCenterPoint().y;
            centreX += this.line.normVx * -20;
            centreY += this.line.normVy * -20;
            for(i = 0; i < regionLine.length; i++)
            {
               l = regionLine[i].line;
               result = l.IsPointInNegativeSide(centreX,centreY);
               allInNegative &&= result;
            }
            if(allInNegative)
            {
               this.DrawRegion(regionLine);
            }
         }
      }
      
      public function set clickCallBack(clickCallBack:Callback) : void
      {
         this._clickCallBack = clickCallBack;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function DragPoint(p:MovieClip) : void
      {
         this._draggingPoint = p;
         this._context.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.DestroyRegion();
         this._clickCallBack.DoCallback();
      }
      
      public function get point1() : MovieClip
      {
         return this._point1;
      }
      
      public function get point2() : MovieClip
      {
         return this._point2;
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         super.Init(metaInfo,context);
         var metaLineHelper:MetaLineHelper = MetaLineHelper(metaInfo);
         this._line = Line(metaLineHelper.metaLine.factoryObject);
         animationContainer.addChild(this._rect);
         animationContainer.addChild(this._point1);
         animationContainer.addChild(this._point2);
         animationContainer.addChild(this._fleche);
         animationContainer.addChild(this._region);
         animationContainer.addChild(this._mcCanDrop);
         animationContainer.addChild(this._mcCanWallKick);
         this._point1.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickHandlers);
         this._point2.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickHandlers);
         this._rect.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickLine);
         this._mcCanDrop.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickText);
         this._mcCanWallKick.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickText);
         this.UpdateVisual();
         this._context = context;
         this._selected = false;
         this._circle1 = PhysicManager.instance.CreateCircle(this._line.x1,this._line.y1,0);
         this._circle2 = PhysicManager.instance.CreateCircle(this._line.x2,this._line.y2,0);
         this._circle1.SetIsDynamic(true);
         this._circle2.SetIsDynamic(true);
         layer.AddCircle(this._circle1);
         layer.AddCircle(this._circle2);
      }
      
      private function onClickText(e:MouseEvent) : void
      {
         var d:MovieClip = e.target as MovieClip;
         if(d == this._mcCanDrop)
         {
            this._line.canDrop = !this._line.canDrop;
            this.UpdateVisual();
         }
         else if(d == this._mcCanWallKick)
         {
            this._line.canWallKick = !this._line.canWallKick;
            this.UpdateVisual();
         }
         this._clickCallBack.DoCallback();
      }
      
      public function set mgr(mgr:LevelEditorHelperManager) : void
      {
         this._mgr = mgr;
      }
      
      public function IsConnectedTo(lineHelper:LineHelper) : Boolean
      {
         return this.line.x2 == lineHelper.line.x1 && this.line.y2 == lineHelper.line.y1 && lineHelper != this;
      }
      
      public function Select() : void
      {
         this._selected = true;
         this.UpdateVisual();
      }
      
      private function onMouseUp(e:MouseEvent) : void
      {
         this._context.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this._draggingPoint = null;
         this.CheckForRegion();
      }
      
      override public function Destroy() : void
      {
         PhysicManager.instance.DestroyPhysicObject(this._circle1);
         PhysicManager.instance.DestroyPhysicObject(this._circle2);
         layer.RemoveCircle(this._circle1);
         layer.RemoveCircle(this._circle2);
         context.GetPlayer1().UpdateMyCollision();
         super.Destroy();
         this._point1.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickHandlers);
         this._point2.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickHandlers);
         this._rect.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickLine);
         this._mcCanDrop.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickText);
         this._mcCanWallKick.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickText);
         this.DestroyRegion();
         this._mgr = null;
         this._clickCallBack = null;
      }
      
      public function Deselect() : void
      {
         this._selected = false;
         this.UpdateVisual();
      }
      
      private function FindLinkedLine(lineHelper:LineHelper) : LineHelper
      {
         var l:LineHelper = null;
         var a:Array = this._mgr.lines;
         for(var i:int = 0; i < a.length; i++)
         {
            l = a[i];
            if(l.IsConnectedTo(lineHelper))
            {
               return l;
            }
         }
         return null;
      }
      
      override public function Update(context:Game) : void
      {
         super.Update(context);
         var mousePos:Point = KeyManager.GetMousePos();
         if(this._draggingPoint == this._point1)
         {
            mousePos = context.camera.ConvertPointToMoteur(mousePos,layer);
            this._line.x1 = Utils.RoundOn(mousePos.x,LevelEditor.LINE_COL_GAP);
            this._line.y1 = Utils.RoundOn(mousePos.y,LevelEditor.LINE_COL_GAP);
            this.UpdateVisual();
            context.GetPlayer1().UpdateMyCollision();
         }
         else if(this._draggingPoint == this._point2)
         {
            mousePos = context.camera.ConvertPointToMoteur(mousePos,layer);
            this._line.x2 = Utils.RoundOn(mousePos.x,LevelEditor.LINE_COL_GAP);
            this._line.y2 = Utils.RoundOn(mousePos.y,LevelEditor.LINE_COL_GAP);
            this.UpdateVisual();
            context.GetPlayer1().UpdateMyCollision();
         }
         this._circle1.x = this._line.x1;
         this._circle1.y = this._line.y1;
         this._circle2.x = this._line.x2;
         this._circle2.y = this._line.y2;
      }
      
      private function onClickHandlers(e:MouseEvent) : void
      {
         var p:MovieClip = MovieClip(e.target);
         if(!this._mgr.levelEditor.toolBar.addLine)
         {
            this.DragPoint(p);
         }
         if(this._context != null && this._context.stage != null)
         {
            this._context.stage.focus = null;
         }
      }
      
      private function DestroyRegion() : void
      {
         var line:LineHelper = null;
         var regionLine:Array = new Array(this);
         var connected:LineHelper = this.FindLinkedLine(this);
         while(connected != null && connected != this)
         {
            regionLine.push(connected);
            connected = this.FindLinkedLine(connected);
         }
         for(var i:int = 0; i < regionLine.length; i++)
         {
            line = regionLine[i];
            line.region.graphics.clear();
         }
      }
      
      public function get line() : Line
      {
         return this._line;
      }
      
      private function onClickLine(e:MouseEvent) : void
      {
         this._clickCallBack.DoCallback();
      }
      
      private function DrawRegion(a:Array) : void
      {
         var l:LineHelper = null;
         this._region.graphics.clear();
         this._region.graphics.beginFill(16711680,0.25);
         l = a[0];
         while(a.length > 0)
         {
            l = a.shift();
            this._region.graphics.lineTo(l.line.x2 - px,l.line.y2 - py);
         }
         this._region.graphics.lineTo(l.line.x1 - px,l.line.y1 - py);
         this._region.graphics.lineTo(0,0);
         this._region.graphics.endFill();
         this.UpdateVisual();
      }
   }
}

