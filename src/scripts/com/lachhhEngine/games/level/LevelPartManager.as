package com.lachhhEngine.games.level
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.GameCamera;
   import com.lachhhEngine.games.IUpdatable;
   import com.lachhhEngine.utils.Utils;
   import flash.geom.Rectangle;
   
   public class LevelPartManager implements IUpdatable
   {
      
      private var _crntTopLeft:LevelPart = null;
      
      private var _boundsVisibleInCam:Rectangle = new Rectangle();
      
      private var _destroyedLevelPart:Array = new Array();
      
      private var _isEnable:Boolean;
      
      private var _tabMatrix:Array;
      
      private var _crntBottomRight:LevelPart = null;
      
      private var _levelLayer:LevelLayer;
      
      private var _allLevelPart:Array;
      
      private var _bShowGrid:Boolean = false;
      
      private var _context:Game;
      
      public function LevelPartManager(context:Game, levelLayer:LevelLayer, bShowGrid:Boolean = false)
      {
         super();
         this._context = context;
         this._tabMatrix = new Array();
         this._allLevelPart = new Array();
         this._isEnable = true;
         this._levelLayer = levelLayer;
         this._bShowGrid = bShowGrid;
      }
      
      private function ShowLevelPart(oLevel:LevelPart) : void
      {
         this._levelLayer.GetLevelPartContainer().addChild(oLevel.visual);
      }
      
      private function DeleteDownRow() : void
      {
         var crntLvl:LevelPart = this._crntBottomRight;
         this._crntBottomRight = this._crntBottomRight.up;
         while(crntLvl.left != null)
         {
            crntLvl = crntLvl.left;
            this.HideLevel(crntLvl.right);
         }
         this.HideLevel(crntLvl);
      }
      
      public function set crntTopLeft(crntTopLeft:LevelPart) : void
      {
         this._crntTopLeft = crntTopLeft;
      }
      
      public function IsEnabled() : Boolean
      {
         return this._isEnable;
      }
      
      public function GetLevelPart(x:int, y:int) : LevelPart
      {
         if(this._tabMatrix == null)
         {
            return null;
         }
         if(this._tabMatrix[x] == null)
         {
            return null;
         }
         return this._tabMatrix[x][y];
      }
      
      public function GetBottomRight() : LevelPart
      {
         return this._crntBottomRight;
      }
      
      public function OnAdd(context:Game) : void
      {
      }
      
      public function UpdateColumn(lvl:LevelPart) : void
      {
         if(lvl == null)
         {
            return;
         }
         if(lvl.up != null)
         {
            lvl.SetPos(lvl.up.x,lvl.up.y + this._levelLayer.levelPartHeight + this._context.levelManager.padding);
         }
         this.UpdateColumn(lvl.down);
      }
      
      public function CreateLevelAt(i:int, j:int) : void
      {
         var lvl:LevelPart = null;
         if(this._tabMatrix[i] == undefined)
         {
            this._tabMatrix[i] = new Array();
         }
         if(this._tabMatrix[i][j] == null || this._tabMatrix[i][j] == undefined)
         {
            lvl = this.GetNewLevelPart();
            lvl.Init(LevelBmpBank.instance.GetBitmapDataFromStr(this._levelLayer.GetLevelPart(i,j),this._levelLayer,this._levelLayer.IsDrawable()),i,j,this._context.AlterCompression(this._levelLayer.compression),this._bShowGrid);
            this._tabMatrix[i][j] = lvl;
            this._allLevelPart.push(lvl);
         }
         this.ShowLevelPart(this._tabMatrix[i][j]);
      }
      
      private function GetNewLevelPart() : LevelPart
      {
         if(this._destroyedLevelPart.length > 0)
         {
            return this._destroyedLevelPart.shift();
         }
         return new LevelPart();
      }
      
      private function DeleteUpRow() : void
      {
         var crntLvl:LevelPart = this._crntTopLeft;
         this._crntTopLeft = this._crntTopLeft.down;
         while(crntLvl.right != null)
         {
            crntLvl = crntLvl.right;
            this.HideLevel(crntLvl.left);
         }
         this.HideLevel(crntLvl);
      }
      
      public function LoadLevelPart(oCam:GameCamera, bForce:Boolean = false) : void
      {
         var j:int = 0;
         var xCam:Number = oCam.GetX() * ((GameCamera.Z_POSITION_START + this._levelLayer.GetZ()) / GameCamera.Z_POSITION_START) - this._levelLayer.xOffset;
         var yCam:Number = oCam.GetY() * ((GameCamera.Z_POSITION_START + this._levelLayer.GetZ()) / GameCamera.Z_POSITION_START) - this._levelLayer.yOffset;
         var xMin:Number = (xCam - oCam.GetWidthView(this._levelLayer) / 2) / this._levelLayer.levelPartWidth;
         var yMin:Number = (yCam - oCam.GetHeightView(this._levelLayer) / 2) / this._levelLayer.levelPartHeight;
         var xMax:Number = xMin + oCam.GetWidthView(this._levelLayer) / this._levelLayer.levelPartWidth;
         var yMax:Number = yMin + oCam.GetHeightView(this._levelLayer) / this._levelLayer.levelPartHeight;
         xMin = Math.floor(xMin);
         yMin = Math.floor(yMin);
         xMax = Math.floor(xMax);
         yMax = Math.floor(yMax);
         xMax = Math.min(xMin + 10,xMax);
         yMax = Math.min(yMin + 10,yMax);
         if(this._crntTopLeft != null && !bForce)
         {
            if(this._crntTopLeft.GetMatrixPosX() == xMin && this._crntTopLeft.GetMatrixPosY() == yMin && this._crntBottomRight.GetMatrixPosX() == xMax && this._crntBottomRight.GetMatrixPosY() == yMax)
            {
               this.Move(oCam.GetX(),oCam.GetY());
               return;
            }
         }
         while(this._crntBottomRight != null && xMax < this._crntBottomRight.GetMatrixPosX())
         {
            this.DeleteRightColumn();
         }
         while(this._crntBottomRight != null && yMax < this._crntBottomRight.GetMatrixPosY())
         {
            this.DeleteDownRow();
         }
         while(this._crntTopLeft != null && xMin > this._crntTopLeft.GetMatrixPosX())
         {
            this.DeleteLeftColumn();
         }
         while(this._crntTopLeft != null && yMin > this._crntTopLeft.GetMatrixPosY())
         {
            this.DeleteUpRow();
         }
         for(var i:int = xMin; i <= xMax; i++)
         {
            for(j = yMin; j <= yMax; j++)
            {
               this.CreateLevelAt(i,j);
            }
         }
         if(this._tabMatrix[xMin] == undefined || this._tabMatrix[xMax] == undefined)
         {
            trace("WARNING : LevelPartManager_c :: LoadLevelPart :: Problème d\'affection de la matrix");
            return;
         }
         this._crntTopLeft = this._tabMatrix[xMin][yMin];
         this._crntBottomRight = this._tabMatrix[xMax][yMax];
         this.LinkMatrix();
         this.Move(oCam.GetX(),oCam.GetY());
      }
      
      public function GetLayer() : LevelLayer
      {
         return this._levelLayer;
      }
      
      private function HideLevel(lvl:LevelPart) : void
      {
         if(lvl == null)
         {
            throw new Error("Lvl must be non-null");
         }
         this.DestroyLevel(lvl);
      }
      
      public function SetShowGrid(b:Boolean) : void
      {
         this._bShowGrid = b;
      }
      
      private function DeleteRightColumn() : void
      {
         var crntLvl:LevelPart = this._crntBottomRight;
         this._crntBottomRight = this._crntBottomRight.left;
         while(crntLvl.up != null)
         {
            crntLvl = crntLvl.up;
            this.HideLevel(crntLvl.down);
         }
         this.HideLevel(crntLvl);
      }
      
      public function DestroyLevel(lvl:LevelPart) : void
      {
         if(lvl == null || !lvl.isInit)
         {
            return;
         }
         delete this._tabMatrix[lvl.GetMatrixPosX()][lvl.GetMatrixPosY()];
         this._tabMatrix[lvl.GetMatrixPosX()][lvl.GetMatrixPosY()] = null;
         lvl.Destroy();
         Utils.RemoveFromArray(this._allLevelPart,lvl);
         this._destroyedLevelPart.push(lvl);
         lvl = null;
      }
      
      public function get crntTopLeft() : LevelPart
      {
         return this._crntTopLeft;
      }
      
      public function Refresh() : void
      {
         var lvl:LevelPart = null;
         for(var i:int = 0; i < this._allLevelPart.length; i++)
         {
            lvl = this._allLevelPart[i];
            lvl.Init(LevelBmpBank.instance.GetBitmapDataFromStr(this._levelLayer.GetLevelPart(lvl.GetMatrixPosX(),lvl.GetMatrixPosY()),this._levelLayer,this._levelLayer.IsDrawable()),lvl.GetMatrixPosX(),lvl.GetMatrixPosY(),this._context.AlterCompression(this._levelLayer.compression),this._bShowGrid);
         }
      }
      
      public function OnRemove(context:Game) : void
      {
      }
      
      public function SetEnable(b:Boolean) : void
      {
         this._isEnable = b;
      }
      
      public function DestroyAll() : void
      {
         var lvl:LevelPart = null;
         while(this._allLevelPart.length > 0)
         {
            lvl = this._allLevelPart.shift();
            this.DestroyLevel(lvl);
         }
         this._crntTopLeft = null;
         this._crntBottomRight = null;
         this._tabMatrix = null;
         this._allLevelPart = null;
      }
      
      private function DeleteLeftColumn() : void
      {
         var crntLvl:LevelPart = this._crntTopLeft;
         this._crntTopLeft = this._crntTopLeft.right;
         while(crntLvl.down != null)
         {
            crntLvl = crntLvl.down;
            this.HideLevel(crntLvl.up);
         }
         this.HideLevel(crntLvl);
      }
      
      public function GetTopLeft() : LevelPart
      {
         return this._crntTopLeft;
      }
      
      public function Update(context:Game) : void
      {
         var crntLvl:LevelPart = this._crntTopLeft;
         while(crntLvl != null)
         {
            this.UpdateColumn(crntLvl.down);
            if(crntLvl.right != null)
            {
               crntLvl.right.SetPos(crntLvl.x + this._levelLayer.levelPartWidth + this._context.levelManager.padding,crntLvl.y);
            }
            crntLvl = crntLvl.right;
         }
      }
      
      public function Move(xCam:Number, yCam:Number) : void
      {
         if(this._crntTopLeft == null)
         {
            return;
         }
         var parallaxView:Number = GameCamera.Z_POSITION_START / (GameCamera.Z_POSITION_START + this._levelLayer.GetZ());
         this._boundsVisibleInCam.x = xCam - this._context.camera.GetWidthView(this._levelLayer) * parallaxView / 2;
         this._boundsVisibleInCam.width = parallaxView * this._context.camera.GetWidthView(this._levelLayer);
         this._boundsVisibleInCam.y = yCam - this._context.camera.GetHeightView(this._levelLayer) * parallaxView / 2;
         this._boundsVisibleInCam.height = parallaxView * this._context.camera.GetHeightView(this._levelLayer);
         xCam /= parallaxView;
         yCam /= parallaxView;
         xCam -= this._levelLayer.xOffset;
         yCam -= this._levelLayer.yOffset;
         this._crntTopLeft.SetPos(this._crntTopLeft.GetMatrixPos().x * this._levelLayer.levelPartWidth - (xCam - this._context.camera.widthView / 2),this._crntTopLeft.GetMatrixPos().y * this._levelLayer.levelPartHeight - (yCam - this._context.camera.heightView / 2));
      }
      
      public function get boundsVisibleInCam() : Rectangle
      {
         return this._boundsVisibleInCam;
      }
      
      public function set crntBottomRight(crntBottomRight:LevelPart) : void
      {
         this._crntBottomRight = crntBottomRight;
      }
      
      public function LinkMatrix() : void
      {
         var j:int = 0;
         for(var i:int = this._crntTopLeft.GetMatrixPosX(); i <= this._crntBottomRight.GetMatrixPosX(); i++)
         {
            for(j = this._crntTopLeft.GetMatrixPosY(); j <= this._crntBottomRight.GetMatrixPosY(); j++)
            {
               this._tabMatrix[i][j].down = this._tabMatrix[i][j + 1] == undefined ? null : (this._tabMatrix[i][j + 1].IsOnStage() ? this._tabMatrix[i][j + 1] : null);
               this._tabMatrix[i][j].up = this._tabMatrix[i][j - 1] == undefined ? null : (this._tabMatrix[i][j - 1].IsOnStage() ? this._tabMatrix[i][j - 1] : null);
               this._tabMatrix[i][j].left = this._tabMatrix[i - 1] == undefined ? null : (this._tabMatrix[i - 1][j] == undefined ? null : (this._tabMatrix[i - 1][j].IsOnStage() ? this._tabMatrix[i - 1][j] : null));
               this._tabMatrix[i][j].right = this._tabMatrix[i + 1] == undefined ? null : (this._tabMatrix[i + 1][j] == undefined ? null : (this._tabMatrix[i + 1][j].IsOnStage() ? this._tabMatrix[i + 1][j] : null));
            }
         }
      }
      
      public function get crntBottomRight() : LevelPart
      {
         return this._crntBottomRight;
      }
   }
}

