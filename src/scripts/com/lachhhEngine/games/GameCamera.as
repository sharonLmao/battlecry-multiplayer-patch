package com.lachhhEngine.games
{
   import com.lachhhEngine.games.behaviors.Behavior;
   import com.lachhhEngine.games.behaviors.IControllable;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.games.physique.Vector3D;
   import com.lachhhEngine.games.scenario.IMessageListener;
   import de.polygonal.math.RandomGenerator;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class GameCamera implements IUpdatable, IMessageListener, IControllable
   {
      
      public static const CAMERA_TAG:String = "GAME_CAMERA";
      
      private static const MSG_SHAKE:String = "SHAKE";
      
      private static const MSG_STOP_SHAKE:String = "STOP_SHAKE";
      
      private static const MSG_ZOOM_TO:String = "ZOOM_TO";
      
      private static const MSG_CHANGE_EASE:String = "CHANGE_EASE";
      
      public static var Z_POSITION_START:Number = 1000;
      
      public static const DEFAULT_EASE:Number = 0.2;
      
      public static var DEFAULT_EASE_X:Number = 0.2;
      
      public static var DEFAULT_EASE_Y:Number = 0.5;
      
      public static var DEFAULT_EASE_Z:Number = 0.2;
      
      private var _heightView:Number;
      
      private var _widthView:Number;
      
      private var _tabBehaviors:Array = null;
      
      private var _minShake:Number = 0;
      
      private var _randomShake:RandomGenerator;
      
      private var _nShake:Number = 0;
      
      private var _nZoom:Number = 1000;
      
      private var _tabActeur:Vector.<Actor> = new Vector.<Actor>();
      
      private var _context:Game;
      
      private var x:Number = 0;
      
      private var y:Number = 0;
      
      private var z:Number = Z_POSITION_START;
      
      private var _nEaseX:Number = DEFAULT_EASE_X;
      
      private var _nEaseY:Number = DEFAULT_EASE_Y;
      
      private var _nEaseZ:Number = DEFAULT_EASE_Z;
      
      private var _oldShakeX:int;
      
      private var _oldShakeY:int;
      
      private var _isEnable:Boolean;
      
      private var m_minBackView:Number = 0.25;
      
      private var m_minFrontView:Number = 2;
      
      private var _dynamicFollow:Actor = null;
      
      private var _bounds:Rectangle = new Rectangle();
      
      private var _tag:String = "NONE";
      
      private var m_maxBackView:Number = 0.1;
      
      private var _isManual:Boolean = false;
      
      private var m_maxFrontView:Number = 2.5;
      
      private var _bMustRespectBounds:Boolean = true;
      
      public function GameCamera(context:Game, w:Number, h:Number)
      {
         super();
         this._context = context;
         this._widthView = w;
         this._heightView = h;
         this.x = this._widthView * 0.5;
         this.y = this._heightView * 0.5;
         this._isEnable = true;
         this._tabBehaviors = new Array();
         this._bounds.x = 0;
         this._bounds.y = 0;
         this._bounds.width = 1024;
         this._bounds.height = 1024;
         this._randomShake = new RandomGenerator();
      }
      
      public function ReInit() : void
      {
      }
      
      public function set randomShake(randomShake:RandomGenerator) : void
      {
         this._randomShake = randomShake;
      }
      
      public function OnMessage(s:String) : void
      {
         var tabParams:Array = s.split(",");
         var strId:String = tabParams.shift();
         switch(strId)
         {
            case MSG_SHAKE:
               this.ShakeCamera(5,5);
               break;
            case MSG_STOP_SHAKE:
               this.StopShakeConstantCamera();
               break;
            case MSG_ZOOM_TO:
               if(!isNaN(tabParams[0]))
               {
                  this.SetZoom(Number(tabParams[0]));
               }
               else
               {
                  trace("ERROR :: Camera_c :: OnMessge :: ZOOM_TO :: Wrong Paramters " + s);
               }
               break;
            case MSG_CHANGE_EASE:
               if(!isNaN(tabParams[0]))
               {
                  this.SetEase(Number(tabParams[0]),Number(tabParams[0]),Number(tabParams[0]));
               }
               else
               {
                  trace("ERROR :: Camera_c :: OnMessge :: MSG_CHANGE_EASE :: Wrong Paramters " + s);
               }
               break;
            default:
               trace("ERROR :: Camera :: OnMessge :: Je comprend pas le msg : " + s);
         }
      }
      
      public function get randomShake() : RandomGenerator
      {
         return this._randomShake;
      }
      
      public function StopShakeConstantCamera() : void
      {
         this._minShake = 0;
         this._nShake = 0;
         this.MoveOf(this._context,-this._oldShakeX,-this._oldShakeY,0,1,1,1);
         this._oldShakeX = 0;
         this._oldShakeY = 0;
      }
      
      public function GetOffsetX(layer:LevelLayer) : Number
      {
         if(layer.GetPctOfView() == 1)
         {
            return -(this.x - this._widthView * 0.5);
         }
         return -(this.x / layer.GetPctOfView() - this._widthView * 0.5);
      }
      
      public function GetOffsetY(layer:LevelLayer) : Number
      {
         if(layer.GetPctOfView() == 1)
         {
            return -(this.y - this._heightView * 0.5);
         }
         return -(this.y / layer.GetPctOfView() - this._heightView * 0.5);
      }
      
      public function GotoSmooth(context:Game, newX:Number, newY:Number, newZ:Number, nEaseX:Number = -1, nEaseY:Number = -1, nEaseZ:Number = -1) : void
      {
         if(nEaseX == -1)
         {
            nEaseX = this._nEaseX;
         }
         if(nEaseY == -1)
         {
            nEaseY = this._nEaseY;
         }
         if(nEaseZ == -1)
         {
            nEaseZ = this._nEaseZ;
         }
         this.MoveOf(context,newX - this.x,newY - this.y,newZ - this.z,nEaseX,nEaseY,nEaseZ);
      }
      
      public function IsInCamBounds(obj:Actor, offset:Number = 0) : Boolean
      {
         return obj.px > this._bounds.left - offset && obj.px < this._bounds.right + offset && obj.py > this._bounds.top - offset && obj.py < this._bounds.bottom + offset;
      }
      
      public function RemoveBehavior(b:Behavior) : void
      {
         for(var i:int = 0; i < this._tabBehaviors.length; i++)
         {
            if(this._tabBehaviors[i] == b)
            {
               this._tabBehaviors.splice(i,1);
               return;
            }
         }
         trace("WARNING :: Camera_c :: RemoveBehavior :: Behavior not found");
      }
      
      public function set isManual(isManual:Boolean) : void
      {
         this._isManual = isManual;
      }
      
      public function set widthView(widthView:Number) : void
      {
         this._widthView = widthView;
      }
      
      public function GetXRightBorder(oLayer:LevelLayer) : Number
      {
         return this.x * ((Z_POSITION_START + oLayer.GetZ()) / Z_POSITION_START) + this.GetWidthView(oLayer) * 0.5;
      }
      
      public function IsInFieldOfView(obj:Actor, offset:Number = 0) : Boolean
      {
         return this.IsCoordInFieldOfView(obj.px,obj.py,obj.layer,offset + obj.animationContainer.width,offset + obj.animationContainer.height);
      }
      
      public function OnAdd(context:Game) : void
      {
      }
      
      public function GetPosition3D() : Vector3D
      {
         return new Vector3D(this.x,this.y,this.z);
      }
      
      public function ZoomOn(context:Game, mcZoomOn:Actor, n:Number) : void
      {
         var newX:Number = mcZoomOn.px + this.GetOffsetX(mcZoomOn.layer) - this._widthView * 0.5;
         var newY:Number = mcZoomOn.py + this.GetOffsetY(mcZoomOn.layer) - this._heightView * 0.5;
         this.MoveOf(context,newX,newY,n,1,1,1);
      }
      
      public function SetZoom(n:Number) : void
      {
         this._nZoom = n;
      }
      
      public function set tag(tag:String) : void
      {
         this._tag = tag;
      }
      
      public function SetPosition3D(p:Vector3D) : void
      {
         this.MoveOf(this._context,p.x - this.x,p.y - this.y,p.z - this.z,1,1,1,true);
      }
      
      public function IsCoordInFieldOfView(x:Number, y:Number, layer:LevelLayer, offsetWidth:Number = 0, offsetHeight:Number = 0) : Boolean
      {
         var halfWidthView:Number = this.GetWidthView(layer) * 0.5;
         var halfHeightView:Number = this.GetHeightView(layer) * 0.5;
         return x > this.x - halfWidthView - offsetWidth && x < this.x + halfWidthView + offsetWidth && y > this.y - halfHeightView - offsetHeight && y < this.y + halfHeightView + offsetHeight;
      }
      
      public function GetHeightView(olevelLayer:LevelLayer) : Number
      {
         if(olevelLayer.GetZoom() == 100)
         {
            return this._heightView;
         }
         return this._heightView * 100 / olevelLayer.GetZoom();
      }
      
      public function SetEase(nx:Number, ny:Number, nz:Number) : void
      {
         this._nEaseX = nx;
         this._nEaseY = ny;
         this._nEaseZ = nz;
      }
      
      public function SetIfMustRespectBounds(b:Boolean) : void
      {
         this._bMustRespectBounds = b;
      }
      
      private function UpdateActeurs() : void
      {
         for(var i:int = 0; i < this._tabActeur.length; i++)
         {
            this.SetOffset(this._tabActeur[i]);
         }
      }
      
      private function UpdateZoom(context:Game) : void
      {
         var oLevelLayer:LevelLayer = null;
         var nZoom:Number = 0;
         for(var i:int = 0; i < context.levelManager.GetAllLayers().length; i++)
         {
            oLevelLayer = context.levelManager.GetAllLayers()[i];
            nZoom = Z_POSITION_START / this.z;
            oLevelLayer.GetContainer().scaleX = nZoom;
            oLevelLayer.GetContainer().scaleY = nZoom;
            oLevelLayer.GetContainer().x = this._widthView * 0.5 - this._widthView * 0.5 * nZoom;
            oLevelLayer.GetContainer().y = this._heightView * 0.5 - this._heightView * 0.5 * nZoom;
            oLevelLayer.SetZoom(nZoom * 100);
         }
      }
      
      public function SetEnable(b:Boolean) : void
      {
         this._isEnable = b;
      }
      
      public function OnRemove(context:Game) : void
      {
      }
      
      public function get heightView() : Number
      {
         return this._heightView;
      }
      
      public function SetOffset(obj:Actor) : void
      {
         var visuel:MovieClip = obj.animationContainer;
         if(obj.cameraCanControlMe)
         {
            if(this.IsInFieldOfView(obj,obj.camAutoRemoveThreshold))
            {
               visuel.x = obj.px + obj.xVisualOffSet + this.GetOffsetX(obj.layer);
               visuel.y = obj.py + obj.yVisualOffSet + this.GetOffsetY(obj.layer);
            }
            else
            {
               visuel.x = -1000;
               visuel.y = -1000;
            }
         }
         else
         {
            visuel.x = (obj.px + obj.xVisualOffSet - this.GetX()) / obj.layer.GetPctOfView() + this._widthView * 0.5;
            visuel.y = (obj.py + obj.yVisualOffSet - this.GetY()) / obj.layer.GetPctOfView() + this._heightView * 0.5;
         }
         obj.Draw();
      }
      
      public function Goto(context:Game, newX:Number, newY:Number, newZ:Number) : void
      {
         this.MoveOf(context,newX - this.x,newY - this.y,newZ - this.z,1,1,1);
      }
      
      public function GetBounds() : Rectangle
      {
         return this._bounds;
      }
      
      public function get isManual() : Boolean
      {
         return this._isManual;
      }
      
      public function IsPointInFieldOfView(p:Point, layer:LevelLayer, offsetWidth:Number = 0, offsetHeight:Number = 0) : Boolean
      {
         var halfWidthView:Number = this.GetWidthView(layer) * 0.5;
         var halfHeightView:Number = this.GetHeightView(layer) * 0.5;
         return p.x > this.x - halfWidthView - offsetWidth && p.x < this.x + halfWidthView + offsetWidth && p.y > this.y - halfHeightView - offsetHeight && p.y < this.y + halfHeightView + offsetHeight;
      }
      
      public function GetXLeftBorder(oLayer:LevelLayer) : Number
      {
         return this.x * ((Z_POSITION_START + oLayer.GetZ()) / Z_POSITION_START) - this.GetWidthView(oLayer) * 0.5;
      }
      
      public function SetBounds(xLeft:Number, xRight:Number, yUp:Number, yDown:Number) : void
      {
         this._bounds.x = xLeft;
         this._bounds.y = yUp;
         this._bounds.width = xRight - this._bounds.x;
         this._bounds.height = yDown - this._bounds.y;
      }
      
      public function GetNbActeurs() : int
      {
         return this._tabActeur.length;
      }
      
      public function IsEnabled() : Boolean
      {
         return this._isEnable;
      }
      
      public function get tag() : String
      {
         return this._tag;
      }
      
      public function GetParallaxMovePct(layer:LevelLayer) : Number
      {
         return (GameCamera.Z_POSITION_START + layer.GetZ()) / GameCamera.Z_POSITION_START;
      }
      
      public function ConvertPointToScreen(p:Point, oLayer:LevelLayer) : Point
      {
         p.x += this.GetOffsetX(oLayer);
         p.y += this.GetOffsetY(oLayer);
         p.x = this._widthView * 0.5 + (p.x - this._widthView * 0.5) / (100 / oLayer.GetZoom());
         p.y = this._heightView * 0.5 + (p.y - this._heightView * 0.5) / (100 / oLayer.GetZoom());
         return p;
      }
      
      public function GetYUpBorder(oLayer:LevelLayer) : Number
      {
         return this.y * ((Z_POSITION_START + oLayer.GetZ()) / Z_POSITION_START) - this.GetHeightView(oLayer) * 0.5;
      }
      
      public function ShakeCamera(nForce:int = 50, nMinForce:Number = 0) : void
      {
         this._nShake = nForce;
         this._minShake = Math.max(nMinForce,this._minShake);
      }
      
      public function get widthView() : Number
      {
         return this._widthView;
      }
      
      public function ConvertPointToMoteur(p:Point, oLayer:LevelLayer) : Point
      {
         p.x = this._widthView * 0.5 + (p.x - this._widthView * 0.5) / (oLayer.GetZoom() / 100);
         p.y = this._heightView * 0.5 + (p.y - this._heightView * 0.5) / (oLayer.GetZoom() / 100);
         p.x -= this.GetOffsetX(oLayer);
         p.y -= this.GetOffsetY(oLayer);
         return p;
      }
      
      public function GetYDownBorder(oLayer:LevelLayer) : Number
      {
         return this.y * ((Z_POSITION_START + oLayer.GetZ()) / Z_POSITION_START) + this.GetHeightView(oLayer) * 0.5;
      }
      
      public function RemoveActeur(obj:Actor) : void
      {
         for(var i:int = 0; i < this._tabActeur.length; i++)
         {
            if(this._tabActeur[i] == obj)
            {
               this._tabActeur.splice(i,1);
               return;
            }
         }
      }
      
      public function SetDynamicFollow(obj:Actor) : void
      {
         this._dynamicFollow = obj;
         this._isManual = false;
      }
      
      public function MoveOf(context:Game, newX:Number, newY:Number, newZ:Number, nEaseX:Number, nEaseY:Number, nEaseZ:Number, bForce:Boolean = false) : void
      {
         var xMin:Number = NaN;
         var xMax:Number = NaN;
         var yMin:Number = NaN;
         var yMax:Number = NaN;
         if(nEaseX != 1)
         {
            newX *= nEaseX * context.speedManager.GetSpeed();
         }
         if(nEaseY != 1)
         {
            newY *= nEaseY * context.speedManager.GetSpeed();
         }
         if(nEaseZ != 1)
         {
            newZ *= nEaseZ * context.speedManager.GetSpeed();
         }
         this.x += newX;
         this.y += newY;
         this.z += newZ;
         if(this.z != 0)
         {
            this.UpdateZoom(context);
         }
         if(this._bMustRespectBounds && !bForce && this._bounds != null && context.actionLayer != null)
         {
            xMin = this._bounds.left + this._widthView * 100 / context.actionLayer.GetZoom() * 0.5;
            xMax = this._bounds.right - this._widthView * 100 / context.actionLayer.GetZoom() * 0.5;
            yMin = this._bounds.top + this._heightView * 100 / context.actionLayer.GetZoom() * 0.5;
            yMax = this._bounds.bottom - this._heightView * 100 / context.actionLayer.GetZoom() * 0.5;
            this.x = Math.max(xMin,this.x);
            this.x = Math.min(xMax,this.x);
            this.y = Math.max(yMin,this.y);
            this.y = Math.min(yMax,this.y);
         }
         if(context.levelManager != null)
         {
            context.levelManager.Move(this.x,this.y,this);
         }
      }
      
      public function get isShaking() : Boolean
      {
         return this._nShake > 0;
      }
      
      public function GetBehaviors() : Array
      {
         return this._tabBehaviors;
      }
      
      public function RemoveAllBehavior() : void
      {
         while(this._tabBehaviors.length > 0)
         {
            this._tabBehaviors.shift().Destroy();
         }
         this._tabBehaviors = new Array();
      }
      
      public function AddActeur(obj:Actor) : void
      {
         this._tabActeur.push(obj);
      }
      
      public function Destroy() : void
      {
         this.RemoveAllBehavior();
         this._tabActeur = new Vector.<Actor>();
         this._minShake = 0;
         this._dynamicFollow = null;
         this.isManual = false;
      }
      
      public function set heightView(heightView:Number) : void
      {
         this._heightView = heightView;
      }
      
      public function GetX() : Number
      {
         return this.x;
      }
      
      public function GetY() : Number
      {
         return this.y;
      }
      
      public function GetZ() : Number
      {
         return this.z;
      }
      
      public function Update(context:Game) : void
      {
         var shakeX:int = 0;
         var shakeY:int = 0;
         if(this._nShake <= 1 && this._nShake != 0)
         {
            this._nShake = 0;
            this.MoveOf(context,-this._oldShakeX,-this._oldShakeY,0,1,1,1);
            this._oldShakeX = 0;
            this._oldShakeY = 0;
         }
         else if(this._nShake != 0)
         {
            shakeX = this._randomShake.nextDouble() * this._nShake;
            shakeY = this._randomShake.nextDouble() * this._nShake;
            this.MoveOf(context,shakeX - this._oldShakeX,shakeY - this._oldShakeY,0,1,1,1);
            this._oldShakeX = shakeX;
            this._oldShakeY = shakeY;
            this._nShake -= 3;
            this._nShake = Math.max(this._minShake,this._nShake);
         }
         if(this.GetBehaviors().length > 0)
         {
            this.GetBehaviors()[0].Control(context,this);
            this.UpdateActeurs();
            return;
         }
         if(!this.isManual)
         {
            if(this._dynamicFollow != null)
            {
               this.GotoSmooth(context,this._dynamicFollow.px,this._dynamicFollow.py,this._dynamicFollow.layer.GetZ() + this._nZoom,this._nEaseX,this._nEaseY,this._nEaseZ);
            }
         }
         this.UpdateActeurs();
      }
      
      public function SetBoundsWithRectangle(rec:Rectangle) : void
      {
         this._bounds.x = rec.x;
         this._bounds.y = rec.y;
         this._bounds.width = rec.width;
         this._bounds.height = rec.height;
      }
      
      public function AddBehavior(b:Behavior) : void
      {
         this._tabBehaviors.push(b);
      }
      
      public function GetWidthView(olevelLayer:LevelLayer) : Number
      {
         if(olevelLayer.GetZoom() == 100)
         {
            return this._widthView;
         }
         return this._widthView * 100 / olevelLayer.GetZoom();
      }
   }
}

