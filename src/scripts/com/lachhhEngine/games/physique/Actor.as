package com.lachhhEngine.games.physique
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.IUpdatable;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.behaviors.Behavior;
   import com.lachhhEngine.games.behaviors.BehaviorFactory;
   import com.lachhhEngine.games.behaviors.BehaviorManager;
   import com.lachhhEngine.games.behaviors.IControllable;
   import com.lachhhEngine.games.factory.FactoryObject;
   import com.lachhhEngine.games.level.LevelBmpBank;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.meta.metaObject.MetaBehavior;
   import com.lachhhEngine.games.scenario.IMessageListener;
   import com.lachhhEngine.io.Callback;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObjectContainer;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class Actor extends FactoryObject implements IUpdatable, IMessageListener, IControllable
   {
      
      public static var _bPause:Boolean = false;
      
      public static const NONE_TAG:String = "NONE";
      
      protected var _tabBehaviorsAsync:Array = null;
      
      private var _rayonVision:int = 700;
      
      public var vitesse:Number;
      
      private var _oldParent:DisplayObjectContainer;
      
      private var _cameraCanControlMe:Boolean = true;
      
      protected var _nGravite:Number;
      
      private var _layer:LevelLayer;
      
      protected var _nBounce:Number;
      
      private var _vx:Number;
      
      private var _vy:Number;
      
      protected var _tabBehaviorsSync:Array = null;
      
      private var _context:Game;
      
      private var _oldPY:Number;
      
      public var xVisualOffSet:Number;
      
      private var _isOnFloor:Boolean = false;
      
      private var _oldPX:Number;
      
      protected var _nMass:Number;
      
      private var _pausable:Boolean;
      
      protected var _rayon:Number;
      
      private var _pos:Point;
      
      private var _isOnLine:Boolean;
      
      private var _px:Number;
      
      private var _py:Number;
      
      public var vitesseAngulaire:Number;
      
      protected var _isEnable:Boolean;
      
      private var _cercleVision:Circle = null;
      
      public var bFirstFollow:Boolean;
      
      protected var _tabPointCol:Array = null;
      
      private var _v3d:Vector3D = new Vector3D(0,0,0);
      
      private var _lastCol:Collision;
      
      private var _tag:String = "NONE";
      
      public var yVisualOffSet:Number;
      
      protected var _tabLinesCol:Array = null;
      
      protected var _circonference:Number;
      
      private var _animationContainer:Animation;
      
      public function Actor()
      {
         super();
         this._pos = new Point();
         this.xVisualOffSet = 0;
         this.yVisualOffSet = 0;
         this.vx = 0;
         this.vy = 0;
         this.vitesse = 0;
         this.vitesseAngulaire = 0;
         this.lastCol = null;
         this._nMass = 2;
         this._nGravite = 0;
         this._nBounce = 1;
         this._rayon = 20;
         this._circonference = Math.PI * 2 * this._rayon * 2;
         this._isEnable = true;
         this.UpdateGravite(Moteur.GetGravite());
         this._tabBehaviorsSync = new Array();
         this._tabBehaviorsAsync = new Array();
         this._isOnFloor = false;
      }
      
      public static function Pause(bPause:Boolean) : void
      {
         _bPause = bPause;
      }
      
      public static function IsPaused() : Boolean
      {
         return _bPause;
      }
      
      public function GetPointInView() : Array
      {
         return this._tabPointCol;
      }
      
      public function OnMessage(s:String) : void
      {
         var tabParams:Array = s.split(",");
         var strId:String = tabParams.shift();
         if(strId == BehaviorManager.ID_CREATE_BEHAVIOR)
         {
            return;
         }
      }
      
      public function get py() : Number
      {
         return this._py;
      }
      
      public function get lastCol() : Collision
      {
         return this._lastCol;
      }
      
      public function GetBehaviorsSync() : Array
      {
         return this._tabBehaviorsSync;
      }
      
      public function RemoveBehavior(b:Behavior) : void
      {
         for(var i:int = 0; i < this._tabBehaviorsSync.length; i++)
         {
            if(this._tabBehaviorsSync[i] == b)
            {
               this._tabBehaviorsSync.splice(i,1);
               return;
            }
         }
         for(i = 0; i < this._tabBehaviorsAsync.length; i++)
         {
            if(this._tabBehaviorsAsync[i] == b)
            {
               this._tabBehaviorsAsync.splice(i,1);
               return;
            }
         }
         trace("WARNING :: Actor :: RemoveBehavior :: Behavior not found");
      }
      
      public function get px() : Number
      {
         return this._px;
      }
      
      public function UpdateGravite(nGravite:Number) : void
      {
         this._nGravite = this._nMass * nGravite * 0.5;
      }
      
      public function set py(py:Number) : void
      {
         this._py = py;
      }
      
      public function set lastCol(lastCol:Collision) : void
      {
         if(this._lastCol != null && this._lastCol.IsWithCircle() && lastCol != this._lastCol)
         {
            PhysicManager.instance.DestroyPhysicObject(this._lastCol.line);
         }
         this._lastCol = lastCol;
      }
      
      public function set px(px:Number) : void
      {
         this._px = px;
      }
      
      public function OnAdd(context:Game) : void
      {
         this.UpdateGravite(Moteur.GetGravite());
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._context = context;
         var metaActor:MetaActor = MetaActor(metaObject);
         this._layer = LevelLayer(metaActor.metaLayer.factoryObject);
         this.px = metaActor.x;
         this.py = metaActor.y;
         this.vx = metaActor.vx;
         this.vy = metaActor.vy;
         this._cercleVision = PhysicManager.instance.CreateCircle(this.px,this.py,this._rayonVision * 0.5);
         this._animationContainer = AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_EMPTY);
         this._animationContainer.scaleX = metaActor.scaleX;
         this._animationContainer.scaleY = metaActor.scaleY;
         this._animationContainer.rotation = metaActor.rotation;
         this._animationContainer.visible = true;
         this.cameraCanControlMe = true;
         this._pausable = true;
         this.oldParent = null;
         this.UpdateMyCollision();
         this.xVisualOffSet = 0;
         this.yVisualOffSet = 0;
      }
      
      public function GetPosition3D() : Vector3D
      {
         this._v3d.x = this.px;
         this._v3d.y = this.py;
         return this._v3d;
      }
      
      public function SetPosition3D(p:Vector3D) : void
      {
         this.px = p.x;
         this.py = p.y;
      }
      
      public function GetMatrixPos() : Point
      {
         var p:Point = new Point();
         p.x = Math.floor(this.px / this.layer.levelPartWidth);
         p.y = Math.floor(this.py / this.layer.levelPartHeight);
         return p;
      }
      
      public function OnCameraAutoRemove() : void
      {
      }
      
      public function get pausable() : Boolean
      {
         return this._pausable;
      }
      
      public function UpdateMyCollision() : void
      {
         this._tabLinesCol = this.layer.GetLinesInRange(this.px,this.py,this._rayonVision);
         this._tabPointCol = this.layer.GetPointsInRange(this.px,this.py,this._rayonVision);
      }
      
      public function get isOnLine() : Boolean
      {
         return this._isOnLine;
      }
      
      public function get layer() : LevelLayer
      {
         return this._layer;
      }
      
      public function GetLineInView() : Array
      {
         return this._tabLinesCol;
      }
      
      public function set pausable(pausable:Boolean) : void
      {
         this._pausable = pausable;
      }
      
      public function set cameraCanControlMe(cameraCanControlMe:Boolean) : void
      {
         this._cameraCanControlMe = cameraCanControlMe;
      }
      
      public function FadeTintFromTo(context:Game, r1:int, g1:int, b1:int, a1:Number, r2:int, g2:int, b2:int, a2:Number, vitesse:Number, sync:Boolean = false) : void
      {
         var params:Array = new Array();
         params.push(r1);
         params.push(g1);
         params.push(b1);
         params.push(a1);
         params.push(r2);
         params.push(g2);
         params.push(b2);
         params.push(a2);
         params.push(vitesse);
         this.AddBehavior(context,BehaviorFactory(context.behaviorManager.factory).ID_FADE_COLOR,params,sync);
      }
      
      public function SetTint(r:int, g:int, b:int) : void
      {
         var colorTransform:ColorTransform = this._animationContainer.transform.colorTransform;
         colorTransform.redOffset = r;
         colorTransform.greenOffset = g;
         colorTransform.blueOffset = b;
         this._animationContainer.transform.colorTransform = colorTransform;
      }
      
      public function get grav() : Number
      {
         return this._nGravite;
      }
      
      public function OnRemove(context:Game) : void
      {
      }
      
      public function Draw() : void
      {
      }
      
      public function SetEnable(b:Boolean) : void
      {
         this._isEnable = b;
      }
      
      public function SetRayon(n:Number) : void
      {
         this._rayon = n;
         this._circonference = Math.PI * 2 * this._rayon * 2;
      }
      
      public function DrawOnBackground2() : void
      {
         var y:int = 0;
         var bd:BitmapData = null;
         var m:Matrix = null;
         var pTranslate:Point = new Point();
         var xMatrixPos:int = Math.floor(this.px / this.layer.levelPartWidth);
         var yMatrixPos:int = Math.floor(this.py / this.layer.levelPartHeight);
         for(var x:int = 0; x <= 0; x++)
         {
            for(y = 0; y <= 0; y++)
            {
               bd = LevelBmpBank.instance.GetBitmapDataFromStr(this.layer.GetLevelPart(xMatrixPos + x,yMatrixPos + y),this.layer);
               if(bd != null)
               {
                  pTranslate.x = this.px - (xMatrixPos + x) * this.layer.levelPartWidth;
                  pTranslate.y = this.py - (yMatrixPos + y) * this.layer.levelPartHeight;
                  m = new Matrix();
                  m.scale(this._animationContainer.scaleX * this.layer.compression,this._animationContainer.scaleY * this.layer.compression);
                  m.rotate(this._animationContainer.rotation / 180 * Math.PI);
                  m.translate(pTranslate.x * this.layer.compression,pTranslate.y * this.layer.compression);
                  bd.draw(this._animationContainer,m,this._animationContainer.transform.colorTransform,BlendMode.LAYER);
               }
            }
         }
      }
      
      public function set oldParent(oldParent:DisplayObjectContainer) : void
      {
         this._oldParent = oldParent;
      }
      
      public function get oldPX() : Number
      {
         return this._oldPX;
      }
      
      public function get animationContainer() : Animation
      {
         return this._animationContainer;
      }
      
      public function GetFollowPoint() : Actor
      {
         return this;
      }
      
      public function GetBehaviorsAsync() : Array
      {
         return this._tabBehaviorsAsync;
      }
      
      public function set isOnLine(isOnLine:Boolean) : void
      {
         this._isOnLine = isOnLine;
      }
      
      public function GetDistanceCarre(obj:Actor) : Number
      {
         return (obj.px - this.px) * (obj.px - this.px) + (obj.py - this.py) * (obj.py - this.py);
      }
      
      public function get oldPY() : Number
      {
         return this._oldPY;
      }
      
      public function get pos() : Point
      {
         this._pos.x = this.px;
         this._pos.y = this.py;
         return this._pos;
      }
      
      public function get camAutoRemoveThreshold() : int
      {
         return 50;
      }
      
      public function set vx(vx:Number) : void
      {
         this._vx = vx;
      }
      
      public function set vy(vy:Number) : void
      {
         this._vy = vy;
      }
      
      public function get rayon() : Number
      {
         return this._rayon;
      }
      
      public function IsEnabled() : Boolean
      {
         return this._isEnable && (!_bPause || !this._pausable);
      }
      
      public function RemoveCercleVision() : void
      {
         if(this._cercleVision)
         {
            PhysicManager.instance.DestroyPhysicObject(this._cercleVision);
            this._cercleVision = null;
         }
      }
      
      public function FadeTintTo(context:Game, r:int, g:int, b:int, a:Number, vitesse:Number, sync:Boolean = false) : void
      {
         var params:Array = new Array();
         params.push(0);
         params.push(0);
         params.push(0);
         params.push(1);
         params.push(r);
         params.push(g);
         params.push(b);
         params.push(a);
         params.push(vitesse);
         this.AddBehavior(context,BehaviorFactory(context.behaviorManager.factory).ID_FADE_COLOR,params,sync);
      }
      
      public function get tag() : String
      {
         return MetaActor(metaInfo).tag;
      }
      
      public function set layer(layer:LevelLayer) : void
      {
         this._layer = layer;
      }
      
      public function get nBounce() : Number
      {
         return this._nBounce;
      }
      
      public function set rayonVision(rayonVision:int) : void
      {
         this._rayonVision = rayonVision;
         if(this._cercleVision != null && this._cercleVision.metaCircle != null)
         {
            this._cercleVision.rayon = this._rayonVision * 0.5;
         }
      }
      
      public function get cameraCanControlMe() : Boolean
      {
         return this._cameraCanControlMe;
      }
      
      public function get context() : Game
      {
         return this._context;
      }
      
      public function get oldParent() : DisplayObjectContainer
      {
         return this._oldParent;
      }
      
      public function get vy() : Number
      {
         return this._vy;
      }
      
      public function get vx() : Number
      {
         return this._vx;
      }
      
      public function set isOnFloor(isOnFloor:Boolean) : void
      {
         this._isOnFloor = isOnFloor;
      }
      
      public function OnCameraAutoAdd() : void
      {
      }
      
      public function get rayonVision() : int
      {
         return this._rayonVision;
      }
      
      public function get cercleVision() : Circle
      {
         return this._cercleVision;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.SetTint(0,0,0);
         this._animationContainer.RemoveAllChild();
         if(this._cercleVision)
         {
            PhysicManager.instance.DestroyPhysicObject(this._cercleVision);
            this._cercleVision = null;
         }
         AnimationManager.instance.Destroy(this._animationContainer);
         this.RemoveAllBehavior(this._context);
         this.lastCol = null;
         this._context = null;
      }
      
      public function RemoveAllBehavior(context:Game) : void
      {
         while(this._tabBehaviorsSync.length > 0)
         {
            context.behaviorManager.DestroyBehavior(this._tabBehaviorsSync.shift());
         }
         while(this._tabBehaviorsAsync.length > 0)
         {
            context.behaviorManager.DestroyBehavior(this._tabBehaviorsAsync.shift());
         }
      }
      
      public function AddBehaviorFromMeta(context:Game, metaBehavior:MetaBehavior, bSync:Boolean) : Behavior
      {
         var behavior:Behavior = context.behaviorManager.CreateBehavior(metaBehavior);
         behavior.endCallback = new Callback(this.RemoveBehavior,this,[behavior]);
         if(bSync)
         {
            this._tabBehaviorsSync.push(behavior);
         }
         else
         {
            this._tabBehaviorsAsync.push(behavior);
         }
         return behavior;
      }
      
      public function get isOnFloor() : Boolean
      {
         return this._isOnFloor;
      }
      
      public function get circonference() : Number
      {
         return this._circonference;
      }
      
      public function Update(context:Game) : void
      {
         this._oldPX = this.px;
         this._oldPY = this.py;
         if(this._cercleVision)
         {
            if(!this._cercleVision.IsInside(this.px + this.vx,this.py + this.vy))
            {
               this._cercleVision.SetPosition(this.px,this.py);
               this.UpdateMyCollision();
            }
         }
         for(var i:int = 0; i < this._tabBehaviorsAsync.length; i++)
         {
            this._tabBehaviorsAsync[i].Control(context,this);
         }
         if(this._tabBehaviorsSync.length > 0)
         {
            this._tabBehaviorsSync[0].Control(context,this);
         }
      }
      
      public function set mass(n:Number) : void
      {
         this._nMass = n;
         this.UpdateGravite(Moteur.GetGravite());
      }
      
      public function DrawOnBackground() : void
      {
         var y:int = 0;
         var bd:BitmapData = null;
         var m:Matrix = null;
         var pTranslate:Point = new Point();
         var xMatrixPos:int = Math.floor(this.px / this.layer.levelPartWidth);
         var yMatrixPos:int = Math.floor(this.py / this.layer.levelPartHeight);
         for(var x:int = -1; x < 2; x++)
         {
            for(y = -1; y < 2; y++)
            {
               bd = LevelBmpBank.instance.GetBitmapDataFromStr(this.layer.GetLevelPart(xMatrixPos + x,yMatrixPos + y),this.layer);
               if(bd != null)
               {
                  pTranslate.x = this.px - (xMatrixPos + x) * this.layer.levelPartWidth;
                  pTranslate.y = this.py - (yMatrixPos + y) * this.layer.levelPartHeight;
                  m = new Matrix();
                  m.scale(this._animationContainer.scaleX * this.layer.compression,this._animationContainer.scaleY * this.layer.compression);
                  m.rotate(this._animationContainer.rotation / 180 * Math.PI);
                  m.translate(pTranslate.x * this.layer.compression,pTranslate.y * this.layer.compression);
                  bd.draw(this._animationContainer,m,this._animationContainer.transform.colorTransform,BlendMode.LAYER);
               }
            }
         }
      }
      
      public function AddBehavior(context:Game, idBehav:int, params:Array, bSync:Boolean) : Behavior
      {
         var metaBehavior:MetaBehavior = MetaManager.instance.CreateMetaBehavior(idBehav,params);
         return this.AddBehaviorFromMeta(context,metaBehavior,bSync);
      }
      
      public function get mass() : Number
      {
         return this._nMass;
      }
   }
}

