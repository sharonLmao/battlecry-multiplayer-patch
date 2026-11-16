package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.physique.*;
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   import flash.geom.*;
   
   public class MetaLayer extends MetaObject
   {
      
      private var _allBmpPath:Array;
      
      private var _fxVisual:String;
      
      private var _isDynamicVisual:Boolean;
      
      private var _metaCircles:Array;
      
      private var _enemyVisual:String;
      
      private var _yOffset:Number = 0;
      
      private var _tabLevelVisual:Array;
      
      private var _isActionLayer:Boolean;
      
      private var _metaSwitch:Array;
      
      private var _xml:XML;
      
      private var _levelPartHeight:int = 256;
      
      private var _dynamicVisual:String;
      
      private var _name:String;
      
      private var _metaLines:Array;
      
      private var _repeatDown:String;
      
      private var _tileHor:Boolean;
      
      private var _repeatRight:String;
      
      private var _isDrawable:Boolean;
      
      private var _levelPartWidth:int = 256;
      
      private var _dynamicVisualId:int;
      
      private var _compression:Number = 1;
      
      private var _mapBounds:Rectangle;
      
      private var _isTransparent:Boolean;
      
      private var _tileVer:Boolean;
      
      private var _repeatLeft:String;
      
      private var _xOffset:Number = 0;
      
      private var _repeatUp:String;
      
      private var _z:int;
      
      public function MetaLayer()
      {
         super();
         this._mapBounds = new Rectangle();
         this._allBmpPath = new Array();
         this._metaLines = new Array();
         this._metaCircles = new Array();
         this._metaSwitch = new Array();
         this._tabLevelVisual = new Array();
      }
      
      private function ConstructVisualMap() : void
      {
         var childY:int = 0;
         var strX:String = null;
         var strY:String = null;
         var x:int = 0;
         var xMin:int = 0;
         var xMax:int = 0;
         var y:int = 0;
         var yMin:int = 0;
         var yMax:int = 0;
         var strVisual:String = null;
         var xmlVisualList:XMLList = this._xml.Visual.hor;
         var xmlVisualListNode:XML = null;
         for(var childX:int = 0; childX < xmlVisualList.length(); childX++)
         {
            xmlVisualListNode = xmlVisualList[childX];
            for(childY = 0; childY < xmlVisualListNode.ver.length(); childY++)
            {
               strX = xmlVisualListNode.@x;
               strY = xmlVisualListNode.ver[childY].@y;
               x = -1;
               xMin = -1;
               xMax = -1;
               y = -1;
               yMin = -1;
               yMax = -1;
               if(isNaN(Number(strX)))
               {
                  if(isNaN(Number(strX.split("~")[0])) || isNaN(Number(strX.split("~")[1])))
                  {
                     throw new Error("ERROR :: LevelLayer_c :: BuildCollisionFromXml : Problem with attribute X Of XML" + childX + "/" + strX);
                  }
                  x = Number(strX.split("~")[0]);
                  xMin = x;
                  xMax = Number(strX.split("~")[1]);
               }
               else
               {
                  x = int(strX);
                  xMin = x;
                  xMax = x;
               }
               if(isNaN(Number(strY)))
               {
                  if(isNaN(Number(strY.split("~")[0])) || isNaN(Number(strY.split("~")[1])))
                  {
                     throw new Error("ERROR :: LevelLayer_c :: BuildCollisionFromXml : Problem with attribute Y Of XML" + childY + "/" + strY);
                  }
                  y = Number(strY.split("~")[0]);
                  yMin = y;
                  yMax = Number(strY.split("~")[1]);
               }
               else
               {
                  y = int(strY);
                  yMin = y;
                  yMax = y;
               }
               for(x = xMin; x <= xMax; x++)
               {
                  for(y = yMin; y <= yMax; y++)
                  {
                     strVisual = xmlVisualListNode.ver[childY];
                     this.SetLevelPart(strVisual,x,y);
                  }
               }
            }
         }
      }
      
      public function get tabLevelVisual() : Array
      {
         return this._tabLevelVisual;
      }
      
      public function get tileVer() : Boolean
      {
         return this._tileVer;
      }
      
      private function CreateLineFromNode(xml:XML) : void
      {
         var x1:Number = Number(xml.@x1);
         var y1:Number = Number(xml.@y1);
         var x2:Number = Number(xml.@x2);
         var y2:Number = Number(xml.@y2);
         var canDrop:Boolean = xml.@canDrop == "true" ? true : false;
         var canWallKick:Boolean = xml.@canWallKick == "true" ? true : false;
         var metaLine:MetaLine = MetaManager.instance.CreateMetaLine(x1,x2,y1,y2,canDrop,canWallKick);
         this._metaLines.push(metaLine);
      }
      
      public function LoadFromXml(xml:XML, context:Game) : void
      {
         this._xml = xml;
         this.BuildCollisionFromXml(context);
      }
      
      public function get xOffset() : Number
      {
         return this._xOffset;
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         super.Init(metaInfo,context);
         this._isTransparent = true;
      }
      
      public function get isActionLayer() : Boolean
      {
         return this._isActionLayer;
      }
      
      public function set levelPartHeight(levelPartHeight:int) : void
      {
         this._levelPartHeight = levelPartHeight;
      }
      
      public function get mapBounds() : Rectangle
      {
         return this._mapBounds;
      }
      
      public function get repeatRight() : int
      {
         return this._repeatRight != "" ? int(this._repeatRight) : 0;
      }
      
      public function get repeatLeft() : int
      {
         return this._repeatLeft != "" ? int(this._repeatLeft) : 0;
      }
      
      public function get isDynamicVisual() : Boolean
      {
         return this._isDynamicVisual;
      }
      
      public function set xOffset(xOffset:Number) : void
      {
         this._xOffset = xOffset;
      }
      
      public function set isActionLayer(isActionLayer:Boolean) : void
      {
         this._isActionLayer = isActionLayer;
      }
      
      private function CreateSwitchFromNode(xml:XML, context:Game) : void
      {
         var x:Number = Number(xml.@x);
         var y:Number = Number(xml.@y);
         var nRayon:Number = Number(xml.@nRayon);
         var strName:String = xml.@name;
         var strTeam:String = xml.@nTeam;
         var message:String = xml.@message;
         var metaSwitch:MetaGameEventSwitch = MetaManager.instance.CreateMetaGameEventSwitch(this,x,y,nRayon,strTeam);
         metaSwitch.name = strName;
         metaSwitch.message = message;
         metaSwitch.destroyable = String(xml.@destroyable).toLowerCase() == "false" ? false : true;
         this._metaSwitch.push(metaSwitch);
      }
      
      public function set fxVisual(fxVisual:String) : void
      {
         this._fxVisual = fxVisual;
      }
      
      public function get compression() : Number
      {
         return this._compression;
      }
      
      public function get allBmpPath() : Array
      {
         return this._allBmpPath;
      }
      
      public function get yOffset() : Number
      {
         return this._yOffset;
      }
      
      public function get dynamicVisual() : String
      {
         return this._dynamicVisual;
      }
      
      public function get levelPartWidth() : int
      {
         return this._levelPartWidth;
      }
      
      public function SetLevelPart(strLink:String, i:int, j:int) : void
      {
         if(this._tabLevelVisual[i] == null)
         {
            this._tabLevelVisual[i] = new Array();
         }
         if(i < this._mapBounds.x)
         {
            this._mapBounds.width += this._mapBounds.x - i;
            this._mapBounds.x = i;
         }
         else if(i > this._mapBounds.x + this._mapBounds.width)
         {
            this._mapBounds.width = i - this._mapBounds.x;
         }
         if(j < this._mapBounds.y)
         {
            this._mapBounds.height += this._mapBounds.y - j;
            this._mapBounds.y = j;
         }
         else if(j > this._mapBounds.y + this._mapBounds.height)
         {
            this._mapBounds.height = j - this._mapBounds.y;
         }
         this._tabLevelVisual[i][j] = strLink;
         this._allBmpPath.push(strLink);
      }
      
      public function get z() : int
      {
         return this._z;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set isTransparent(isTransparent:Boolean) : void
      {
         this._isTransparent = isTransparent;
      }
      
      public function get repeatUp() : int
      {
         return this._repeatUp != "" ? int(this._repeatUp) : 0;
      }
      
      public function get metaSwitch() : Array
      {
         return this._metaSwitch;
      }
      
      public function get levelPartHeight() : int
      {
         return this._levelPartHeight;
      }
      
      public function SetLevelPartFromAnimId(animStr:String) : void
      {
         var j:int = 0;
         var x:int = 0;
         var y:int = 0;
         var posX:int = 0;
         var posY:int = 0;
         var strVisual:String = null;
         while(this._allBmpPath.length > 0)
         {
            this._allBmpPath.pop();
         }
         this._dynamicVisual = animStr;
         if(isNaN(Number(this._dynamicVisual)))
         {
            this._dynamicVisualId = AnimationManager.factory.FindIdByString(this._dynamicVisual);
            if(this._dynamicVisualId == -1)
            {
               throw new Error("Can\'t find the class : " + this._dynamicVisual + " Be sure to put it in AnimationFactory");
            }
         }
         else
         {
            this._dynamicVisualId = int(this._dynamicVisual);
         }
         var anim:Animation = AnimationManager.instance.CreateAnimation(this._dynamicVisualId);
         var dynamicVisual:MovieClip = anim;
         var origin:Point = Utils.GetOriginOfMc(dynamicVisual);
         var offSet:Point = new Point();
         anim.canBeCached = false;
         if(origin.x < 0)
         {
            offSet.x = -origin.x;
         }
         if(origin.x > dynamicVisual.width)
         {
            offSet.x = origin.x - dynamicVisual.width;
         }
         if(origin.y < 0)
         {
            offSet.y = -origin.y;
         }
         if(origin.x > dynamicVisual.width)
         {
            offSet.y = origin.y - dynamicVisual.height;
         }
         var xDraw:int = Math.ceil((dynamicVisual.width + offSet.x) / this._levelPartWidth);
         var yDraw:int = Math.ceil((dynamicVisual.height + offSet.y) / this._levelPartHeight);
         for(var i:int = -this.repeatLeft; i <= this.repeatRight; i++)
         {
            for(j = -this.repeatUp; j <= this.repeatDown; j++)
            {
               for(x = 0; x < xDraw; x++)
               {
                  for(y = 0; y < yDraw; y++)
                  {
                     posX = x + i * xDraw;
                     posY = y + j * yDraw;
                     strVisual = this._dynamicVisual + "~" + x + "~" + y;
                     this.SetLevelPart(strVisual,posX,posY);
                  }
               }
            }
         }
         AnimationManager.instance.Destroy(anim);
      }
      
      public function get fxVisual() : String
      {
         return this._fxVisual;
      }
      
      public function get tileHor() : Boolean
      {
         return this._tileHor;
      }
      
      public function set dynamicVisual(dynamicVisual:String) : void
      {
         this._dynamicVisual = dynamicVisual;
      }
      
      private function CreatePointFromNode(xml:XML) : void
      {
         var x:Number = Number(xml.@x);
         var y:Number = Number(xml.@y);
         var rayon:Number = Number(xml.@rayon);
         var metaCircle:MetaCircle = MetaManager.instance.CreateMetaCircle(x,y,rayon);
         this._metaCircles.push(metaCircle);
      }
      
      public function get isTransparent() : Boolean
      {
         return this._isTransparent;
      }
      
      public function set compression(compression:Number) : void
      {
         this._compression = compression;
      }
      
      public function set isDrawable(isDrawable:Boolean) : void
      {
         this._isDrawable = isDrawable;
      }
      
      public function set enemyVisual(enemyVisual:String) : void
      {
         this._enemyVisual = enemyVisual;
      }
      
      public function set yOffset(yOffset:Number) : void
      {
         this._yOffset = yOffset;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         for(var x:int = this._mapBounds.x; x < this._mapBounds.x + this._mapBounds.width; x++)
         {
            Utils.ClearArray(this._tabLevelVisual[x]);
         }
         Utils.ClearArray(this._tabLevelVisual);
         this._mapBounds.x = 0;
         this._mapBounds.y = 0;
         this._mapBounds.width = 0;
         this._mapBounds.height = 0;
         this._xOffset = 0;
         this._yOffset = 0;
         Utils.ClearArray(this._metaSwitch);
         Utils.ClearArray(this._allBmpPath);
         Utils.ClearArray(this._metaLines);
         Utils.ClearArray(this._metaCircles);
         this._tileHor = false;
         this._tileVer = false;
      }
      
      public function get repeatDown() : int
      {
         return this._repeatDown != "" ? int(this._repeatDown) : 0;
      }
      
      public function set levelPartWidth(levelPartWidth:int) : void
      {
         this._levelPartWidth = levelPartWidth;
      }
      
      public function get metaCircles() : Array
      {
         return this._metaCircles;
      }
      
      public function get isDrawable() : Boolean
      {
         return this._isDrawable;
      }
      
      private function BuildCollisionFromXml(context:Game) : void
      {
         var xmlCollisionLineList:XMLList = this._xml.Collision.Line;
         var xmlPointList:XMLList = this._xml.Collision.Point;
         var xmlSwitchList:XMLList = this._xml.EventSwitch.Switch;
         this._z = Number(this._xml.@z);
         this._isDrawable = this._xml.@bDrawable == "true" ? true : false;
         this._isActionLayer = this._xml.@bActionLayer == "true" ? true : false;
         this._name = this._xml.@Name;
         this._compression = Number(this._xml.@compression);
         this._levelPartWidth = int(this._xml.@levelPartWidth);
         this._levelPartHeight = int(this._xml.@levelPartHeight);
         this._isTransparent = this._xml.@bTransparent == "false" ? false : true;
         this._tileHor = this._xml.@tileHor == "true" ? true : false;
         this._tileVer = this._xml.@tileVer == "true" ? true : false;
         this._xOffset = this._xml.@xOffset == "" || this._xml.@xOffset == null ? 0 : int(this._xml.@xOffset);
         this._yOffset = this._xml.@yOffset == "" || this._xml.@yOffset == null ? 0 : int(this._xml.@yOffset);
         for(var i:int = 0; i < xmlCollisionLineList.length(); i++)
         {
            this.CreateLineFromNode(xmlCollisionLineList[i]);
         }
         for(i = 0; i < xmlPointList.length(); i++)
         {
            this.CreatePointFromNode(xmlPointList[i]);
         }
         this._dynamicVisual = this._xml.Visual.@dynamicVisual;
         this._repeatLeft = this._xml.Visual.@repeatLeft;
         this._repeatRight = this._xml.Visual.@repeatRight;
         this._repeatUp = this._xml.Visual.@repeatUp;
         this._repeatDown = this._xml.Visual.@repeatDown;
         this._fxVisual = this._xml.@fxVisual;
         this._enemyVisual = this._xml.@enemyVisual;
         this._isDynamicVisual = this._dynamicVisual != null && this._dynamicVisual != "";
         if(this._isDynamicVisual)
         {
            this.SetLevelPartFromAnimId(this._dynamicVisual);
         }
         else
         {
            this.ConstructVisualMap();
         }
         for(i = 0; i < xmlSwitchList.length(); i++)
         {
            this.CreateSwitchFromNode(xmlSwitchList[i],context);
         }
      }
      
      public function get enemyVisual() : String
      {
         return this._enemyVisual;
      }
      
      public function get dynamicVisualId() : int
      {
         return this._dynamicVisualId;
      }
      
      public function set z(z:int) : void
      {
         this._z = z;
      }
      
      public function get metaLines() : Array
      {
         return this._metaLines;
      }
   }
}

