package com.lachhhEngine.games.level
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.GameCamera;
   import com.lachhhEngine.games.IUpdatable;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.draw.DrawManager;
   import com.lachhhEngine.games.effects.GameEffect;
   import com.lachhhEngine.games.effects.GameEffectContainerId;
   import com.lachhhEngine.games.meta.metaObject.MetaLayer;
   import com.lachhhEngine.games.meta.metaObject.MetaLevel;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.utils.Utils;
   import flash.display.Bitmap;
   
   public class LevelManager implements IUpdatable
   {
      
      private static var _noTiling:Boolean = false;
      
      private var _metaLevel:MetaLevel;
      
      private var _drawManager:DrawManager;
      
      private var _backPath:String;
      
      private var _padding:int = -1;
      
      private var _staticBack:Bitmap;
      
      private var _tabLayer:Array = new Array();
      
      private var _isEnable:Boolean = true;
      
      private var _context:Game;
      
      private var _actionLayer:LevelLayer;
      
      public function LevelManager(context:Game)
      {
         super();
         this._context = context;
         LevelBmpBank.instance.context = context;
         this._drawManager = new DrawManager(context);
      }
      
      public static function set noTiling(noTiling:Boolean) : void
      {
         _noTiling = noTiling;
      }
      
      public static function get noTiling() : Boolean
      {
         return _noTiling;
      }
      
      public function get actionLayer() : LevelLayer
      {
         return this._actionLayer;
      }
      
      public function set visible(b:Boolean) : void
      {
         var oLayer:LevelLayer = null;
         for(var i:int = 0; i < this._tabLayer.length; i++)
         {
            oLayer = this._tabLayer[i];
            oLayer.visual.visible = b;
         }
      }
      
      public function get drawManager() : DrawManager
      {
         return this._drawManager;
      }
      
      public function set padding(padding:int) : void
      {
         this._padding = padding;
      }
      
      public function get padding() : int
      {
         return this._padding;
      }
      
      public function CreateLayer(metaLayer:MetaLayer) : LevelLayer
      {
         var layer:LevelLayer = new LevelLayer(this._context);
         layer.Init(metaLayer,this._context);
         layer.destroyMeta = false;
         this._tabLayer.push(layer);
         return layer;
      }
      
      public function IsEnabled() : Boolean
      {
         return this._isEnable;
      }
      
      public function LoadLevel(metaLevel:MetaLevel, endCallBack:Callback, progressCallback:Callback) : void
      {
         var metaLayer:MetaLayer = null;
         var layer:LevelLayer = null;
         var j:int = 0;
         var iAnimation:int = 0;
         var anim:Animation = null;
         var oLayer:LevelLayer = null;
         var g:GameEffect = null;
         this._metaLevel = metaLevel;
         for(var i:int = 0; i < metaLevel.metaLayers.length; i++)
         {
            metaLayer = metaLevel.metaLayers[i];
            layer = this.CreateLayer(metaLayer);
            this._context.GetVisualContainer().addChildAt(layer.visual,i);
            if(layer.IsActionLayer())
            {
               this._actionLayer = layer;
            }
            for(j = 0; j < metaLayer.allBmpPath.length; j++)
            {
               LevelBmpBank.instance.AddPNGToLoad(metaLayer.allBmpPath[j],layer,layer.metaLayer.isDynamicVisual);
            }
         }
         this._backPath = metaLevel.visualStaticBack;
         if(this._backPath != null && this._backPath != "")
         {
            if(isNaN(Number(this._backPath)))
            {
               iAnimation = AnimationManager.factory.FindIdByString(this._backPath);
               if(iAnimation == -1)
               {
                  throw new Error("Can\'t find the class : " + this._backPath + " Be sure to put it in AnimationFactory");
               }
            }
            else
            {
               iAnimation = int(this._backPath);
            }
            anim = AnimationManager.instance.CreateAnimation(iAnimation);
            this._staticBack = Utils.CreateBmpFromMc(anim);
            this._context.GetVisualContainer().addChildAt(this._staticBack,0);
            AnimationManager.instance.Destroy(anim);
         }
         if(!_noTiling)
         {
            LevelBmpBank.instance.StartLoading(endCallBack,progressCallback);
         }
         else
         {
            for(i = 0; i < this._tabLayer.length; i++)
            {
               oLayer = this._tabLayer[i];
               g = this._context.gameEffectManager.CreateStaticFx(oLayer.metaLayer.dynamicVisualId,GameEffectContainerId.BELOW,oLayer.xOffset,oLayer.yOffset,oLayer.metaLayer,-1,true);
               g.cameraCanControlMe = false;
               --g.px;
               --g.py;
               g.animation.recurPlay(g.animation);
               oLayer.GetLevelPartContainer().addChild(g.animationContainer);
            }
            if(endCallBack)
            {
               endCallBack.DoCallback();
            }
         }
      }
      
      public function OnRemove(context:Game) : void
      {
      }
      
      public function SetEnable(b:Boolean) : void
      {
         this._isEnable = b;
      }
      
      public function Update(context:Game) : void
      {
         var oLayer:LevelLayer = null;
         for(var i:int = 0; i < this._tabLayer.length; i++)
         {
            oLayer = this._tabLayer[i];
            oLayer.levelPartMgr.Update(context);
         }
         this._isEnable = false;
      }
      
      public function Draw() : void
      {
         var oLayer:LevelLayer = null;
         var w:Number = this._context.camera.GetWidthView(this._actionLayer);
         var h:Number = this._context.camera.GetHeightView(this._actionLayer);
         this.drawManager.Clear(w,h);
         for(var i:int = 0; i < this._tabLayer.length; i++)
         {
            oLayer = this._tabLayer[i];
            this.drawManager.StartBatch(this._actionLayer);
            oLayer.visual.Draw(this.drawManager);
            this.drawManager.EndBatch(oLayer);
         }
      }
      
      public function GetAllLayers() : Array
      {
         return this._tabLayer;
      }
      
      public function Move(x:Number, y:Number, oCam:GameCamera) : void
      {
         var oLayer:LevelLayer = null;
         if(_noTiling)
         {
            return;
         }
         for(var i:int = 0; i < this._tabLayer.length; i++)
         {
            oLayer = this._tabLayer[i];
            oLayer.levelPartMgr.LoadLevelPart(oCam);
         }
         this._isEnable = true;
      }
      
      public function GetActionLevelManager() : LevelPartManager
      {
         return this._tabLayer[1].GetLevelPartManager();
      }
      
      public function DestroyAllLayer() : void
      {
         var oLayer:LevelLayer = null;
         while(this._tabLayer.length > 0)
         {
            oLayer = this._tabLayer.shift();
            oLayer.levelPartMgr.DestroyAll();
            oLayer.Destroy();
            Utils.LazyRemoveFromParent(oLayer.visual);
         }
         this._backPath = "";
         if(this._staticBack != null)
         {
            this._context.GetVisualContainer().removeChild(this._staticBack);
            this._staticBack.bitmapData.dispose();
            this._staticBack = null;
         }
         this.drawManager.Destroy();
      }
      
      public function OnAdd(context:Game) : void
      {
      }
      
      public function GetLayer(i:uint) : LevelLayer
      {
         return this._tabLayer[i];
      }
      
      public function get metaLevel() : MetaLevel
      {
         return this._metaLevel;
      }
   }
}

