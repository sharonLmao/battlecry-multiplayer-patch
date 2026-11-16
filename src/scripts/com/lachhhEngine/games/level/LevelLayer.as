package com.lachhhEngine.games.level
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.GameCamera;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.factory.FactoryObject;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaGameEventSwitch;
   import com.lachhhEngine.games.meta.metaObject.MetaLayer;
   import com.lachhhEngine.games.physique.Circle;
   import com.lachhhEngine.games.physique.Line;
   import com.lachhhEngine.games.physique.PhysicManager;
   import com.lachhhEngine.games.scenario.GameEventSwitch;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.KeyManager;
   import com.lachhhEngine.utils.Utils;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class LevelLayer extends FactoryObject
   {
      
      public static const FORE_FX_ID:int = 0;
      
      public static const ENEMY_ID:int = 1;
      
      public static const AMMO_ID:int = 2;
      
      public static const PLAYER_ID:int = 3;
      
      public static const BACK_FX_ID:int = 4;
      
      public static const ITEM_PART_ID:int = 5;
      
      public static const LEVEL_PART_ID:int = 6;
      
      public static const DEBUG_ID:int = 7;
      
      private var _lines:Array = null;
      
      private var _mousePosOnLayer:Point;
      
      private var _bIsActionLayer:Boolean = false;
      
      private var _bDrawable:Boolean = false;
      
      private var _mapBounds:Rectangle = new Rectangle();
      
      private var _dynamicMap:Array = [[]];
      
      private var _teamCollision:Array = null;
      
      private var _pctOfView:Number = 100;
      
      private var _visual:Animation;
      
      private var _nZoom:Number = 0;
      
      private var _gameEventSwitch:Array;
      
      private var _levelPartMgr:LevelPartManager;
      
      private var _name:String = "";
      
      private var _circles:Array = null;
      
      private var _context:Game = null;
      
      private var _parallaxSpeed:Number;
      
      private var _z:Number = 0;
      
      private var _teamCollisionNull:Array = null;
      
      public function LevelLayer(context:Game)
      {
         super();
         this._context = context;
         this._mousePosOnLayer = new Point();
         this._lines = new Array();
         this._circles = new Array();
         this._teamCollision = new Array();
         this._teamCollisionNull = new Array();
         this._gameEventSwitch = new Array();
         this.levelPartMgr = new LevelPartManager(this._context,this,false);
         destroyMeta = false;
      }
      
      public static function ReturnArrayOfExposantBase2(n:int) : Array
      {
         var exp:int = 10;
         var maxValue:int = Math.pow(2,exp);
         var crnt:int = maxValue;
         var temp:int = maxValue;
         var tabValue:Array = new Array();
         while(crnt != 0)
         {
            temp = n;
            temp -= crnt;
            if(temp >= 0)
            {
               n -= crnt;
               tabValue.push(exp);
            }
            crnt /= 2;
            exp--;
         }
         return tabValue;
      }
      
      public function GetRefCollisionOfTeam(nTeam:Number) : Array
      {
         if(nTeam == 0 || this._teamCollision == null)
         {
            return null;
         }
         var tabTeam:Array = ReturnArrayOfExposantBase2(nTeam);
         if(tabTeam.length > 1)
         {
            throw new Error("ERROR LevelLayer_c :: RemoveTeamCollision :: More than one team detected (Must be log2)" + nTeam);
         }
         return this._teamCollision[tabTeam[0]];
      }
      
      public function set levelPartMgr(levelPartMgr:LevelPartManager) : void
      {
         this._levelPartMgr = levelPartMgr;
      }
      
      private function GetXmlEventChild() : XML
      {
         var oSwitch:MetaGameEventSwitch = null;
         var xmlEventSwitch:XML = <EventSwitch></EventSwitch>;
         var xmlSwitch:XML = null;
         for(var i:int = 0; i < this._gameEventSwitch.length; i++)
         {
            oSwitch = MetaGameEventSwitch(this._gameEventSwitch[i].metaInfo);
            if(oSwitch != null)
            {
               xmlSwitch = <Switch></Switch>;
               xmlSwitch.@name = oSwitch.name;
               xmlSwitch.@x = oSwitch.x;
               xmlSwitch.@y = oSwitch.y;
               xmlSwitch.@nRayon = oSwitch.rayon;
               xmlSwitch.@nTeam = oSwitch.team;
               xmlSwitch.@message = oSwitch.message;
               xmlSwitch.@destroyable = oSwitch.destroyable;
               xmlEventSwitch.appendChild(xmlSwitch);
            }
         }
         return xmlEventSwitch;
      }
      
      public function set yOffset(n:Number) : void
      {
         MetaLayer(metaInfo).yOffset = n;
      }
      
      public function GetXFromCam() : Number
      {
         var xCam:Number = this._context.camera.GetX();
         var prctView:Number = GameCamera.Z_POSITION_START / (GameCamera.Z_POSITION_START + this.GetZ());
         xCam /= prctView;
         xCam -= this.xOffset;
         return -(xCam - this._context.camera.widthView / 2);
      }
      
      public function GetHeight() : Number
      {
         return this._mapBounds.height;
      }
      
      public function GetContainer() : MovieClip
      {
         return this._visual;
      }
      
      public function GetLevelPartContainer() : MovieClip
      {
         return MovieClip(this.CheckAndReturnContainer(LEVEL_PART_ID));
      }
      
      public function GetLevelPart(i:Number, j:Number) : String
      {
         var w:int = 0;
         var h:int = 0;
         if(this._dynamicMap[i] != null && this._dynamicMap[i][j] != null)
         {
            return this._dynamicMap[i][j];
         }
         if(this.metaLayer.tileHor)
         {
            w = this.metaLayer.mapBounds.width + 1;
            i -= Math.floor(i / w) * w;
         }
         if(this.metaLayer.tileVer)
         {
            h = this.metaLayer.mapBounds.height + 1;
            j -= Math.floor(j / h) * h;
         }
         if(MetaLayer(metaInfo).tabLevelVisual[i] == null || MetaLayer(metaInfo).tabLevelVisual[i][j] == null)
         {
            return null;
         }
         return MetaLayer(metaInfo).tabLevelVisual[i][j];
      }
      
      public function IsActionLayer() : Boolean
      {
         return MetaLayer(metaInfo).isActionLayer;
      }
      
      public function GetWidth() : Number
      {
         return this._mapBounds.width;
      }
      
      public function RemoveCircle(circle:Circle) : Boolean
      {
         return Utils.RemoveFromArray(this._circles,circle);
      }
      
      public function AddLine(oLine:Line) : void
      {
         if(oLine == null)
         {
            return;
         }
         this._lines.push(oLine);
      }
      
      public function IsDrawable() : Boolean
      {
         return MetaLayer(metaInfo).isDrawable;
      }
      
      public function GetItemContainer() : MovieClip
      {
         return MovieClip(this.CheckAndReturnContainer(ITEM_PART_ID));
      }
      
      public function get levelPartMgr() : LevelPartManager
      {
         return this._levelPartMgr;
      }
      
      private function CheckAndReturnContainer(i:int) : DisplayObject
      {
         switch(i)
         {
            case DEBUG_ID:
               return this._visual.getChildByName("ligneContainer_mc");
            case FORE_FX_ID:
               return this._visual.getChildByName("foreFxContainer_mc");
            case ENEMY_ID:
               return this._visual.getChildByName("enemyContainer_mc");
            case AMMO_ID:
               return this._visual.getChildByName("ammoContainer_mc");
            case PLAYER_ID:
               return this._visual.getChildByName("playerContainer_mc");
            case BACK_FX_ID:
               return this._visual.getChildByName("backFxContainer_mc");
            case ITEM_PART_ID:
               return this._visual.getChildByName("itemContainer_mc");
            case LEVEL_PART_ID:
               return this._visual.getChildByName("levelPartContainer_mc");
            default:
               throw new Error("ERROR : LevelLayer_c :: CheckAndReturnStuff :: Wrong Id : " + i);
         }
      }
      
      public function get levelPartHeight() : int
      {
         return MetaLayer(metaInfo).levelPartHeight;
      }
      
      private function AddMovieClip(strName:String) : void
      {
         var mc:MovieClip = new MovieClip();
         mc.name = strName;
         this._visual.addChildAt(mc,0);
      }
      
      public function GetHeroContainer() : MovieClip
      {
         return MovieClip(this.CheckAndReturnContainer(PLAYER_ID));
      }
      
      private function onFinishLoading() : void
      {
         this.levelPartMgr.Refresh();
      }
      
      public function AddSwitch(gameEventSwitch:GameEventSwitch) : void
      {
         if(gameEventSwitch == null)
         {
            return;
         }
         this._gameEventSwitch.push(gameEventSwitch);
      }
      
      public function get yOffset() : Number
      {
         return MetaLayer(metaInfo).yOffset;
      }
      
      public function GetPointsInRange(x:Number, y:Number, nRayon:Number) : Array
      {
         var tabPointInRange:Array = new Array();
         var crntPoint:Circle = null;
         if(this._circles == null)
         {
            return null;
         }
         for(var i:int = 0; i < this._circles.length; i++)
         {
            crntPoint = this._circles[i];
            if(crntPoint != null)
            {
               if(nRayon == -1 || crntPoint.GetDistanceCarre(x,y) <= (nRayon + crntPoint.rayon) * (nRayon + crntPoint.rayon))
               {
                  tabPointInRange.push(this._circles[i]);
               }
            }
         }
         return tabPointInRange;
      }
      
      public function GetYFromCam() : Number
      {
         var yCam:Number = this._context.camera.GetY();
         var prctView:Number = GameCamera.Z_POSITION_START / (GameCamera.Z_POSITION_START + this.GetZ());
         yCam /= prctView;
         yCam -= this.yOffset;
         return -(yCam - this._context.camera.heightView / 2);
      }
      
      public function RemoveTeamCollision(oPoint:Circle, nTeam:Number) : void
      {
         if(oPoint == null)
         {
            return;
         }
         var tabTeam:Array = ReturnArrayOfExposantBase2(nTeam);
         if(tabTeam.length > 1)
         {
            throw new Error("ERROR LevelLayer_c :: RemoveTeamCollision :: More than one team detected (Must be log2)" + nTeam);
         }
         var tabRef:Array = this._teamCollision[tabTeam[0]];
         this._context.ammoManager.RemoveTargetFromAllAmmo(oPoint,nTeam);
         for(var i:int = 0; i < tabRef.length; i++)
         {
            if(tabRef[i] == oPoint)
            {
               delete tabRef[i];
               tabRef.splice(i,1);
               return;
            }
         }
         trace("WARNING :: LevelLayer_c::RemoveTeamCollision :: Collision not found");
      }
      
      public function get xOffset() : Number
      {
         return MetaLayer(metaInfo).xOffset;
      }
      
      public function SetVisualBack(animStr:String, startLoading:Boolean) : void
      {
         this.metaLayer.SetLevelPartFromAnimId(animStr);
         LevelBmpBank.instance.ClearAllPngOfLayer(this);
         for(var i:int = 0; i < this.metaLayer.allBmpPath.length; i++)
         {
            LevelBmpBank.instance.AddPNGToLoad(this.metaLayer.allBmpPath[i],this,this.metaLayer.isDynamicVisual,true);
         }
         if(startLoading)
         {
            LevelBmpBank.instance.StartLoading(new Callback(this.onFinishLoading,this,null),null);
         }
      }
      
      public function GetEnemyContainer() : MovieClip
      {
         return MovieClip(this.CheckAndReturnContainer(ENEMY_ID));
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         var line:Line = null;
         var circle:Circle = null;
         var eventSwitch:GameEventSwitch = null;
         super.Init(metaObject,context);
         var metaLayer:MetaLayer = MetaLayer(metaObject);
         this._bDrawable = metaLayer.isDrawable;
         this._bIsActionLayer = metaLayer.isActionLayer;
         this._z = metaLayer.z;
         this._name = metaLayer.name;
         this._visual = AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_EMPTY);
         this._parallaxSpeed = (GameCamera.Z_POSITION_START + this._z) / GameCamera.Z_POSITION_START;
         for(var i:int = 0; i < context.teamFactory.NB_TEAM; i++)
         {
            this._teamCollision.push(new Array());
            this._teamCollisionNull.push(new Array());
         }
         this.AddMovieClip("ligneContainer_mc");
         this.AddMovieClip("foreFxContainer_mc");
         this.AddMovieClip("ammoContainer_mc");
         this.AddMovieClip("playerContainer_mc");
         this.AddMovieClip("enemyContainer_mc");
         this.AddMovieClip("itemContainer_mc");
         this.AddMovieClip("backFxContainer_mc");
         this.AddMovieClip("levelPartContainer_mc");
         for(i = 0; i < metaLayer.metaLines.length; i++)
         {
            line = PhysicManager.instance.CreateLineFromMeta(metaLayer.metaLines[i]);
            line.destroyMeta = false;
            this.AddLine(line);
         }
         for(i = 0; i < metaLayer.metaCircles.length; i++)
         {
            circle = PhysicManager.instance.CreateCircleFromMeta(metaLayer.metaCircles[i]);
            circle.destroyMeta = false;
            this.AddCircle(circle);
         }
         for(i = 0; i < metaLayer.metaSwitch.length; i++)
         {
            eventSwitch = context.gameEventManager.CreateGameEventSwitch(metaLayer.metaSwitch[i]);
            eventSwitch.destroyMeta = false;
            this.AddSwitch(eventSwitch);
         }
         this.ConnectLine(this._lines);
      }
      
      public function AddCircle(p:Circle) : void
      {
         if(p == null)
         {
            return;
         }
         this._circles.push(p);
      }
      
      public function SetZoom(n:Number) : void
      {
         this._nZoom = n;
      }
      
      public function SetDynamicPart(i:int, j:int, str:String) : void
      {
         if(this._dynamicMap[i] == null)
         {
            this._dynamicMap[i] = new Array();
         }
         this._dynamicMap[i][j] = str;
      }
      
      public function RemoveLine(oLine:Line) : Boolean
      {
         return Utils.RemoveFromArray(this._lines,oLine);
      }
      
      public function GetAmmoContainer() : MovieClip
      {
         return MovieClip(this.CheckAndReturnContainer(AMMO_ID));
      }
      
      public function GetTeamCollision(nTeam:Number) : Array
      {
         if(nTeam == 0 || this._teamCollision == null)
         {
            return null;
         }
         var tabTeam:Array = ReturnArrayOfExposantBase2(nTeam);
         var tabResult:Array = new Array();
         for(var i:int = 0; i < tabTeam.length; i++)
         {
            tabResult = tabResult.concat(this._teamCollision[tabTeam[i]]);
         }
         return tabResult;
      }
      
      public function GetZoom() : Number
      {
         return this._nZoom;
      }
      
      public function GetPctOfView() : Number
      {
         return GameCamera.Z_POSITION_START / (GameCamera.Z_POSITION_START + this.GetZ());
      }
      
      public function get mousePosOnLayer() : Point
      {
         if(this._context != null && this._context.isInit)
         {
            this._mousePosOnLayer.x = KeyManager.GetMousePos().x - this._context.x;
            this._mousePosOnLayer.y = KeyManager.GetMousePos().y - this._context.y;
            this._context.camera.ConvertPointToMoteur(this._mousePosOnLayer,this);
         }
         else
         {
            this._mousePosOnLayer.x = 0;
            this._mousePosOnLayer.y = 0;
         }
         return this._mousePosOnLayer;
      }
      
      public function GetDebugContainer() : MovieClip
      {
         return MovieClip(this.CheckAndReturnContainer(DEBUG_ID));
      }
      
      public function get metaLayer() : MetaLayer
      {
         return MetaLayer(metaInfo);
      }
      
      public function get visual() : Animation
      {
         return this._visual;
      }
      
      public function GetXmlLayer() : XML
      {
         var visualChild:XML = null;
         var xmlLayer:XML = <Layer></Layer>;
         xmlLayer.@Name = this.GetName();
         xmlLayer.@z = this.GetZ();
         xmlLayer.@bDrawable = this.IsDrawable();
         xmlLayer.@bActionLayer = this.IsActionLayer();
         xmlLayer.@compression = this.metaLayer.compression;
         xmlLayer.@levelPartWidth = this.metaLayer.levelPartWidth;
         xmlLayer.@levelPartHeight = this.metaLayer.levelPartHeight;
         xmlLayer.@xOffset = this.metaLayer.xOffset;
         xmlLayer.@yOffset = this.metaLayer.yOffset;
         xmlLayer.@fxVisual = this.metaLayer.fxVisual;
         xmlLayer.@enemyVisual = this.metaLayer.enemyVisual;
         xmlLayer.@bTransparent = this.metaLayer.isTransparent;
         xmlLayer.@tileHor = this.metaLayer.tileHor;
         xmlLayer.@tileVer = this.metaLayer.tileVer;
         if(this.metaLayer.isDynamicVisual)
         {
            visualChild = <Visual/>;
            visualChild.@dynamicVisual = this.metaLayer.dynamicVisual;
            if(this.metaLayer.repeatRight > 0)
            {
               visualChild.@repeatRight = this.metaLayer.repeatRight;
            }
            if(this.metaLayer.repeatLeft > 0)
            {
               visualChild.@repeatLeft = this.metaLayer.repeatLeft;
            }
            if(this.metaLayer.repeatUp > 0)
            {
               visualChild.@repeatUp = this.metaLayer.repeatUp;
            }
            if(this.metaLayer.repeatDown > 0)
            {
               visualChild.@repeatDown = this.metaLayer.repeatDown;
            }
            xmlLayer.appendChild(visualChild);
         }
         else
         {
            xmlLayer.appendChild(this.GetXmlVisualChildFromMap());
         }
         xmlLayer.appendChild(this.GetXmlCollisionChild());
         xmlLayer.appendChild(this.GetXmlEventChild());
         return xmlLayer;
      }
      
      public function GetBackFxContainer() : MovieClip
      {
         return MovieClip(this.CheckAndReturnContainer(BACK_FX_ID));
      }
      
      public function GetBmpUseCount(bmp:Bitmap) : int
      {
         var y:int = 0;
         var str:String = null;
         var xDebut:Number = this._mapBounds.x;
         var xFin:Number = xDebut + this._mapBounds.width;
         var yDebut:Number = this._mapBounds.y;
         var yFin:Number = yDebut + this._mapBounds.height;
         var cpt:int = 0;
         for(var x:int = xDebut; x <= xFin; x++)
         {
            if(MetaLayer(metaInfo).tabLevelVisual[x] != null)
            {
               for(y = yDebut; y <= yFin; y++)
               {
                  if(MetaLayer(metaInfo).tabLevelVisual[x][y] != null)
                  {
                     str = LevelBmpBank.instance.GetStrFromBmpData(bmp.bitmapData);
                     if(str == MetaLayer(metaInfo).tabLevelVisual[x][y])
                     {
                        cpt++;
                     }
                  }
               }
            }
         }
         return cpt;
      }
      
      public function SetZ(z:Number) : void
      {
         MetaLayer(metaInfo).z = Math.max(-GameCamera.Z_POSITION_START + 1,z);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         for(var i:int = 0; i < this._context.teamFactory.NB_TEAM; i++)
         {
            Utils.ClearArray(this._teamCollision[i]);
            Utils.ClearArray(this._teamCollisionNull[i]);
         }
         Utils.ClearArray(this._teamCollision);
         Utils.ClearArray(this._teamCollisionNull);
         while(this._lines.length > 0)
         {
            PhysicManager.instance.DestroyPhysicObject(this._lines.shift());
         }
         while(this._circles.length > 0)
         {
            PhysicManager.instance.DestroyPhysicObject(this._circles.shift());
         }
         AnimationManager.instance.Destroy(this._visual);
      }
      
      public function AddTeamCollision(oPoint:Circle, nTeam:Number) : void
      {
         if(oPoint == null)
         {
            return;
         }
         var tabTeam:Array = ReturnArrayOfExposantBase2(nTeam);
         if(tabTeam.length > 1)
         {
            throw new Error("ERROR LevelLayer_c :: AddTeamCollision :: More than one team detected (Must be log2)" + nTeam);
         }
         var tabRef:Array = this._teamCollision[tabTeam[0]];
         tabRef.push(oPoint);
         this._context.ammoManager.AddTargetToAllAmmo(oPoint,nTeam);
      }
      
      public function GetForeFxContainer() : MovieClip
      {
         return MovieClip(this.CheckAndReturnContainer(FORE_FX_ID));
      }
      
      public function GetName() : String
      {
         return this._name;
      }
      
      public function ConnectLine(tabLines:Array) : void
      {
         var j:int = 0;
         var line1:Line = null;
         var line2:Line = null;
         var nAngleStart:Number = NaN;
         var nAngleEnd:Number = NaN;
         var oCircle:Circle = null;
         var crntJoint:Circle = null;
         for(var i:int = 0; i < tabLines.length; i++)
         {
            for(j = 0; j < tabLines.length; j++)
            {
               if(!(i == j || tabLines[i] == null || tabLines[j] == null))
               {
                  line1 = tabLines[i];
                  line2 = tabLines[j];
                  if(line1.x2 == line2.x1 && line1.y2 == line2.y1)
                  {
                     nAngleStart = line1.Angle() >= 0 ? line1.Angle() - 180 : line1.Angle() + 180;
                     nAngleEnd = line2.Angle();
                     oCircle = PhysicManager.instance.CreateCircle(line1.x2,line1.y2,0,nAngleStart,nAngleEnd);
                     crntJoint = line1.GetJoint2();
                     oCircle.SetIsDynamic(true);
                     if(oCircle.AngleRange() > 180)
                     {
                        if(crntJoint == null)
                        {
                           line1.SetJoint2(oCircle,line2);
                           line2.SetJoint1(oCircle,line1);
                           this.AddCircle(oCircle);
                        }
                        else if(oCircle.AngleRange() > crntJoint.AngleRange())
                        {
                           this.RemoveCircle(crntJoint);
                           line1.GetLinkedLine2().DestroyJoint1();
                           line1.DestroyJoint2();
                           line1.SetJoint2(oCircle,line2);
                           line2.SetJoint1(oCircle,line1);
                           this.AddCircle(oCircle);
                        }
                        else
                        {
                           PhysicManager.instance.DestroyPhysicObject(oCircle);
                        }
                     }
                     else
                     {
                        PhysicManager.instance.DestroyPhysicObject(oCircle);
                     }
                  }
               }
            }
         }
      }
      
      public function RemoveCircles(tab:Array) : void
      {
         if(tab == null)
         {
            return;
         }
         for(var i:int = 0; i < tab.length; i++)
         {
            this.RemoveCircle(tab[i]);
         }
      }
      
      public function GetContainerById(id:int) : MovieClip
      {
         return MovieClip(this.CheckAndReturnContainer(id));
      }
      
      public function get compression() : Number
      {
         return MetaLayer(metaInfo).compression;
      }
      
      public function set xOffset(n:Number) : void
      {
         MetaLayer(metaInfo).xOffset = n;
      }
      
      public function GetLinesInRange(x:Number, y:Number, nRayon:Number, bWithDroppedLine:Boolean = true, bWithWallKickLine:Boolean = true) : Array
      {
         var tabLinesInRange:Array = new Array();
         var crntLine:Line = null;
         var pCenter:Point = null;
         var nDist:Number = 0;
         if(this._lines == null)
         {
            return null;
         }
         for(var i:int = 0; i < this._lines.length; i++)
         {
            crntLine = this._lines[i];
            if(crntLine != null)
            {
               if(!(!bWithDroppedLine && crntLine.canDrop))
               {
                  if(!(!bWithWallKickLine && crntLine.canWallKick))
                  {
                     pCenter = crntLine.GetCenterPoint();
                     nDist = (x - pCenter.x) * (x - pCenter.x) + (y - pCenter.y) * (y - pCenter.y);
                     if(nRayon == -1 || nDist < crntLine.GetRayonCarre() + nRayon * nRayon)
                     {
                        tabLinesInRange.push(this._lines[i]);
                     }
                  }
               }
            }
         }
         return tabLinesInRange;
      }
      
      private function GetXmlCollisionChild() : XML
      {
         var oLine:Line = null;
         var oCircle:Circle = null;
         var xmlCollision:XML = <Collision></Collision>;
         var xmlLine:XML = null;
         var xmlCircle:XML = null;
         for(var i:int = 0; i < this._lines.length; i++)
         {
            oLine = this._lines[i];
            if(!(oLine == null || oLine.IsDynamic()))
            {
               xmlLine = <Line></Line>;
               xmlLine.@x1 = oLine.x1;
               xmlLine.@y1 = oLine.y1;
               xmlLine.@x2 = oLine.x2;
               xmlLine.@y2 = oLine.y2;
               xmlLine.@canDrop = oLine.canDrop;
               xmlLine.@canWallKick = oLine.canWallKick;
               xmlCollision.appendChild(xmlLine);
            }
         }
         for(i = 0; i < this._circles.length; i++)
         {
            oCircle = this._circles[i];
            if(!(oCircle == null || oCircle.IsDynamic()))
            {
               xmlCircle = <Point></Point>;
               xmlCircle.@x = oCircle.x;
               xmlCircle.@y = oCircle.y;
               xmlCircle.@rayon = oCircle.rayon;
               xmlCollision.appendChild(xmlCircle);
            }
         }
         return xmlCollision;
      }
      
      public function get boundsVisibleInCam() : Rectangle
      {
         return this.levelPartMgr.boundsVisibleInCam;
      }
      
      public function get parallaxSpeed() : Number
      {
         return this._parallaxSpeed;
      }
      
      private function GetXmlVisualChildFromMap() : XML
      {
         var y:int = 0;
         var xDebut:Number = this._mapBounds.x;
         var xFin:Number = xDebut + this._mapBounds.width;
         var yDebut:Number = this._mapBounds.y;
         var yFin:Number = yDebut + this._mapBounds.height;
         var xmlVisual:XML = <Visual></Visual>;
         var xmlHor:XML = null;
         var xmlVer:XML = null;
         for(var x:int = xDebut; x <= xFin; x++)
         {
            if(MetaLayer(metaInfo).tabLevelVisual[x] != null)
            {
               xmlHor = <hor></hor>;
               xmlHor.@x = x;
               for(y = yDebut; y <= yFin; y++)
               {
                  if(MetaLayer(metaInfo).tabLevelVisual[x][y] != null)
                  {
                     xmlVer = <ver></ver>;
                     xmlVer.@y = y;
                     xmlVer.setChildren(MetaLayer(metaInfo).tabLevelVisual[x][y]);
                     xmlHor.appendChild(xmlVer);
                  }
               }
               if(xmlHor.children().length() > 0)
               {
                  xmlVisual.appendChild(xmlHor);
               }
            }
         }
         return xmlVisual;
      }
      
      public function GetZ() : Number
      {
         return MetaLayer(metaInfo).z;
      }
      
      public function get levelPartWidth() : int
      {
         return MetaLayer(metaInfo).levelPartWidth;
      }
      
      public function RemoveSwitch(gameEventSwitch:GameEventSwitch) : void
      {
         Utils.RemoveFromArray(this._gameEventSwitch,gameEventSwitch);
      }
   }
}

