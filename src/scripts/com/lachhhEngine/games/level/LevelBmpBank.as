package com.lachhhEngine.games.level
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.io.Callback;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.utils.Timer;
   
   public class LevelBmpBank
   {
      
      private static var _instance:LevelBmpBank = null;
      
      public static var berzerkballByPass:Boolean = false;
      
      private var _bFinishLoading:Boolean = false;
      
      private var _allDynamicPngs:Array = new Array();
      
      private var _dynamicPng:Array = new Array();
      
      private var _strCrntLoad:String = "";
      
      private var _bIsLoading:Boolean = false;
      
      private var _tabAvailablePNG:Array = new Array();
      
      private var _callbackCompleted:Callback;
      
      private var _loader:Loader = new Loader();
      
      private var _nProgress:Number = 0;
      
      private var _tabAvailablePNGByIndex:Array = new Array();
      
      private var _timer:Timer = new Timer(0,1);
      
      private const DELAY_WAIT:int = 10;
      
      private var _tabPNGToLoad:Array = new Array();
      
      private var _nPngToLoad:uint = 0;
      
      private var _delayCount:int = 10;
      
      private var _context:Game;
      
      private var _callbackProgress:Callback;
      
      private var _blankBmpCheck:BitmapData;
      
      public function LevelBmpBank()
      {
         super();
      }
      
      public static function get instance() : LevelBmpBank
      {
         if(_instance == null)
         {
            _instance = new LevelBmpBank();
         }
         return _instance;
      }
      
      private function OnIoError(evt:Event) : void
      {
         trace("ERROR : ViseulFactory_c :: " + this._strCrntLoad + " Not found");
         this.NextLoad();
      }
      
      public function AddPNGToLoad(strPath:String, layer:LevelLayer, isDynamic:Boolean, replace:Boolean = false) : Boolean
      {
         var bd:BitmapData = null;
         if(this._bIsLoading)
         {
            trace("ERROR :: VisualFactory_c :: AddPNGToLoad :: Visual is Loading");
            return false;
         }
         if(!replace && this._tabAvailablePNG[strPath] != null)
         {
            return false;
         }
         if(this._tabAvailablePNG[strPath] != null)
         {
            bd = this._tabAvailablePNG[strPath] as BitmapData;
            bd.dispose();
            this._tabAvailablePNG[strPath] = null;
         }
         for(var i:int = 0; i < this._tabPNGToLoad.length; i++)
         {
            if(strPath == this._tabPNGToLoad[i])
            {
               return false;
            }
         }
         var layerAndPath:LayerAndPath = new LayerAndPath(strPath,layer,isDynamic);
         this._tabPNGToLoad.push(layerAndPath);
         return true;
      }
      
      public function AddBitmap(index:String, bd:BitmapData) : void
      {
         if(this.IsBlank(bd))
         {
            return;
         }
         this._tabAvailablePNG[index] = bd;
         this._tabAvailablePNGByIndex.push(bd);
      }
      
      private function NextLoad() : void
      {
         var coor:String = null;
         var aCoor:Array = null;
         var iAnimation:int = 0;
         var xDraw:int = 0;
         var yDraw:int = 0;
         var compression:Number = NaN;
         var anim:Animation = null;
         var pngOfMc:PngOfMc = null;
         this._nProgress = 0;
         if(this._tabPNGToLoad.length == 0 || true)
         {
            this.EndLoad();
            return;
         }
         var layerAndPath:LayerAndPath = this._tabPNGToLoad.shift();
         this._strCrntLoad = layerAndPath.path;
         if(layerAndPath.isDynamic)
         {
            coor = this._strCrntLoad;
            aCoor = coor.split("~");
            xDraw = int(aCoor[1]);
            yDraw = int(aCoor[2]);
            if(isNaN(Number(aCoor[0])))
            {
               iAnimation = AnimationManager.factory.FindIdByString(String(aCoor[0]));
               if(iAnimation == -1)
               {
                  throw new Error("Can\'t find the class : " + String(aCoor[0]) + " Be sure to put it in AnimationFactory");
               }
            }
            else
            {
               iAnimation = int(aCoor[0]);
            }
            compression = this._context.AlterCompression(layerAndPath.layer.compression);
            if(this._dynamicPng[iAnimation] == null)
            {
               anim = AnimationManager.instance.CreateAnimation(iAnimation);
               anim.canBeCached = true;
               AnimationManager.instance.Destroy(anim);
               this._context.AlterBackGround(anim,layerAndPath.layer);
               pngOfMc = new PngOfMc(anim,compression,layerAndPath.layer.metaLayer.isTransparent);
               this._dynamicPng[iAnimation] = pngOfMc;
               this._allDynamicPngs.push(pngOfMc);
            }
            this.CreatePartFromBd(this._dynamicPng[iAnimation],xDraw,yDraw,layerAndPath.layer,this._strCrntLoad,compression);
            --this._delayCount;
            if(this._delayCount < 0)
            {
               this._delayCount = this.DELAY_WAIT;
               this._timer.delay = 1;
               this._timer.addEventListener(TimerEvent.TIMER,this.OnWaitComplete);
               this._timer.start();
            }
            else
            {
               this.NextLoad();
            }
         }
         else
         {
            this._loader.load(new URLRequest(VersionInfo.PREFIX_LOAD + this._strCrntLoad));
         }
         layerAndPath.Destroy();
      }
      
      public function GetProgress() : Number
      {
         var nPrct:Number = (this._nPngToLoad - 1 - this._tabPNGToLoad.length) / this._nPngToLoad;
         return nPrct + this._nProgress * (1 / this._nPngToLoad);
      }
      
      public function StartLoading(callbackOnComplete:Callback, callbackProgress:Callback) : void
      {
         this._callbackCompleted = callbackOnComplete;
         this._callbackProgress = callbackProgress;
         if(this._bIsLoading)
         {
            throw new Error("VisuelFactory :: StartLoading :: Already Loading");
         }
         this._bIsLoading = true;
         this._bFinishLoading = false;
         this._nPngToLoad = this._tabPNGToLoad.length;
         this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.LoadComplete);
         this._loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.OnProgress);
         this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.OnIoError);
         this._nProgress = 0;
         this.NextLoad();
      }
      
      public function GetAllPng() : Array
      {
         return this._tabAvailablePNGByIndex;
      }
      
      private function IsBlank(bd:BitmapData) : Boolean
      {
         if(this._blankBmpCheck == null)
         {
            this._blankBmpCheck = new BitmapData(bd.width,bd.height,true,0);
         }
         else if(this._blankBmpCheck.width != bd.width || this._blankBmpCheck.height != bd.height)
         {
            this._blankBmpCheck = new BitmapData(bd.width,bd.height,true,0);
         }
         return bd.compare(this._blankBmpCheck) == 0;
      }
      
      public function get context() : Game
      {
         return this._context;
      }
      
      public function GetStrFromBmpData(bmp:BitmapData) : String
      {
         var i:String = null;
         for(i in this._tabAvailablePNG)
         {
            if(bmp == this._tabAvailablePNG[i])
            {
               return i;
            }
         }
         return null;
      }
      
      private function CreatePartFromBd(pngs:PngOfMc, x:int, y:int, layer:LevelLayer, visualName:String, compression:Number) : void
      {
         var sizeWidth:Number = layer.levelPartWidth * compression;
         var sizeHeight:Number = layer.levelPartHeight * compression;
         var partCompressBd:BitmapData = new BitmapData(sizeWidth,sizeHeight,layer.metaLayer.isTransparent,0);
         var tx:int = layer.levelPartWidth * x * compression;
         var ty:int = layer.levelPartHeight * y * compression;
         var bd:BitmapData = pngs.GetPngAt(Math.floor(tx / PngOfMc.MAX_WIDTH),Math.floor(ty / PngOfMc.MAX_HEIGHT));
         var rect:Rectangle = new Rectangle(tx % PngOfMc.MAX_WIDTH,ty % PngOfMc.MAX_HEIGHT,sizeWidth,sizeHeight);
         partCompressBd.copyPixels(bd,rect,new Point());
         this.AddBitmap(visualName,partCompressBd);
      }
      
      public function ClearAllPngOfLayer(layer:LevelLayer) : void
      {
         var bd:BitmapData = null;
         var rect:Rectangle = new Rectangle();
         var destPoint:Point = new Point();
         for(var i:int = 0; i < layer.metaLayer.allBmpPath.length; i++)
         {
            bd = this._tabAvailablePNG[layer.metaLayer.allBmpPath[i]] as BitmapData;
            if(bd != null)
            {
               if(!this._blankBmpCheck)
               {
                  this._blankBmpCheck = new BitmapData(bd.width,bd.height,true,0);
               }
               else if(this._blankBmpCheck.width != bd.width || this._blankBmpCheck.height != bd.height)
               {
                  this._blankBmpCheck.dispose();
                  this._blankBmpCheck = new BitmapData(bd.width,bd.height,true,0);
               }
               rect.width = this._blankBmpCheck.width;
               rect.height = this._blankBmpCheck.height;
               bd.copyPixels(this._blankBmpCheck,rect,destPoint);
            }
         }
      }
      
      private function EndLoad() : void
      {
         this._bIsLoading = false;
         this._bFinishLoading = true;
         if(this._callbackCompleted != null)
         {
            this._callbackCompleted.DoCallback();
            this._callbackCompleted = null;
         }
         this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.LoadComplete);
         this._loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.OnProgress);
         this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.OnIoError);
         this.DestroyPngOfMc();
      }
      
      private function OnProgress(evt:ProgressEvent) : void
      {
         this._nProgress = evt.bytesLoaded / evt.bytesTotal;
         if(this._callbackProgress != null)
         {
            this._callbackProgress.DoCallback();
         }
      }
      
      public function FillWithTextureFromMc(mc:MovieClip, bd:BitmapData) : void
      {
         var j:int = 0;
         var w:int = mc.width;
         var h:int = mc.height;
         var newBd:BitmapData = new BitmapData(bd.width,bd.height,false,0);
         var m:Matrix = new Matrix();
         var r:Rectangle = new Rectangle(0,0,bd.width,bd.height);
         var p:Point = new Point(0,0);
         for(var i:int = 0; i <= bd.width; i += w)
         {
            for(j = 0; j <= bd.height; j += h)
            {
               m.tx = i;
               m.ty = j;
               newBd.draw(mc,m);
            }
         }
         newBd.draw(bd);
         bd.copyPixels(newBd,r,p,newBd,p,true);
      }
      
      public function ClearAllPng() : void
      {
         var bd:BitmapData = null;
         var rect:Rectangle = new Rectangle();
         var destPoint:Point = new Point();
         for(var i:int = 0; i < this._tabAvailablePNGByIndex.length; i++)
         {
            bd = this._tabAvailablePNGByIndex[i] as BitmapData;
            if(!this._blankBmpCheck)
            {
               this._blankBmpCheck = new BitmapData(bd.width,bd.height,true,0);
            }
            rect.width = this._blankBmpCheck.width;
            rect.height = this._blankBmpCheck.height;
            bd.copyPixels(this._blankBmpCheck,rect,destPoint);
         }
      }
      
      public function GetBitmapDataFromStr(str:String, layer:LevelLayer, bClone:Boolean = false) : BitmapData
      {
         var aCoor:Array = null;
         var iAnimation:int = 0;
         var xDraw:int = 0;
         var yDraw:int = 0;
         var MAX_WIDTH:int = 0;
         var MAX_HEIGHT:int = 0;
         var compress:Number = NaN;
         var anim:Animation = null;
         var bd:BitmapData = null;
         var m:Matrix = null;
         if(str == null)
         {
            return null;
         }
         if(this._tabAvailablePNG[str] == null)
         {
            aCoor = str.split("~");
            xDraw = int(aCoor[1]);
            yDraw = int(aCoor[2]);
            if(isNaN(Number(aCoor[0])))
            {
               iAnimation = AnimationManager.factory.FindIdByString(String(aCoor[0]));
               if(iAnimation == -1)
               {
                  throw new Error("Can\'t find the class : " + String(aCoor[0]) + " Be sure to put it in AnimationFactory");
               }
            }
            else
            {
               iAnimation = int(aCoor[0]);
            }
            MAX_WIDTH = 1024;
            MAX_HEIGHT = 1024;
            compress = layer.metaLayer.compression;
            anim = AnimationManager.instance.CreateAnimation(iAnimation);
            anim.canBeCached = false;
            this._context.AlterBackGround(anim,layer);
            bd = new BitmapData(layer.levelPartWidth,layer.levelPartHeight,layer.metaLayer.isTransparent,0);
            m = new Matrix();
            if(!berzerkballByPass)
            {
               m.scale(compress,compress);
               m.translate(-(xDraw * layer.levelPartWidth),-(yDraw * layer.levelPartHeight));
            }
            bd.draw(anim,m,anim.transform.colorTransform);
            AnimationManager.instance.Destroy(anim);
            this._tabAvailablePNG[str] = bd;
            this._tabAvailablePNGByIndex.push(bd);
            return bd;
         }
         if(bClone)
         {
            return BitmapData(this._tabAvailablePNG[str]);
         }
         return BitmapData(this._tabAvailablePNG[str]);
      }
      
      public function Destroy() : void
      {
         var bd:BitmapData = null;
         while(this._tabAvailablePNGByIndex.length > 0)
         {
            bd = this._tabAvailablePNGByIndex.shift();
            bd.dispose();
            bd = null;
         }
         if(this._blankBmpCheck != null)
         {
            this._blankBmpCheck.dispose();
            this._blankBmpCheck = null;
         }
         this._tabAvailablePNG = new Array();
         this.DestroyPngOfMc();
      }
      
      private function DestroyPngOfMc() : void
      {
         var pngOfMc:PngOfMc = null;
         while(this._allDynamicPngs.length > 0)
         {
            pngOfMc = this._allDynamicPngs.shift();
            pngOfMc.Destroy();
            pngOfMc = null;
         }
         this._dynamicPng = new Array();
      }
      
      public function set context(context:Game) : void
      {
         this._context = context;
      }
      
      private function LoadComplete(evt:Event) : void
      {
         var bd:BitmapData = evt.target.content.bitmapData;
         this.AddBitmap(this._strCrntLoad,bd);
         this._loader.unload();
         this._nProgress = 1;
         this.NextLoad();
      }
      
      private function OnWaitComplete(e:TimerEvent) : void
      {
         this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.OnWaitComplete);
         this._timer.stop();
         this._timer = null;
         this._timer = new Timer(0,1);
         this.NextLoad();
      }
      
      public function IsReady() : Boolean
      {
         return this._bFinishLoading;
      }
      
      public function FillWithTextureFromBd(tex:BitmapData, bd:BitmapData) : void
      {
         var j:int = 0;
         var w:int = tex.width;
         var h:int = tex.height;
         var newBd:BitmapData = new BitmapData(bd.width,bd.height,false,0);
         var textW:int = tex.width;
         var textH:int = tex.height;
         var r:Rectangle = new Rectangle(0,0,bd.width,bd.height);
         var textR:Rectangle = new Rectangle(0,0,textW,textH);
         var p:Point = new Point(0,0);
         for(var i:int = 0; i <= bd.width; i += w)
         {
            for(j = 0; j <= bd.height; j += h)
            {
               p.x = i;
               p.y = j;
               newBd.copyPixels(tex,textR,p);
            }
         }
         p.x = 0;
         p.y = 0;
         newBd.draw(bd);
         bd.copyPixels(newBd,r,p,newBd,p,true);
      }
   }
}

import com.lachhhEngine.utils.Utils;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.geom.Matrix;
import flash.geom.Point;

class LayerAndPath
{
   
   private var _layer:LevelLayer;
   
   private var _isDynamic:Boolean;
   
   private var _path:String;
   
   public function LayerAndPath(path:String, layer:LevelLayer, isDynamic:Boolean)
   {
      super();
      this._path = path;
      this._layer = layer;
      this._isDynamic = isDynamic;
   }
   
   public function get layer() : LevelLayer
   {
      return this._layer;
   }
   
   public function get path() : String
   {
      return this._path;
   }
   
   public function Destroy() : void
   {
      this._path = null;
      this._layer = null;
   }
   
   public function get isDynamic() : Boolean
   {
      return this._isDynamic;
   }
}

class PngOfMc
{
   
   public static const MAX_WIDTH:int = 1024;
   
   public static const MAX_HEIGHT:int = 1024;
   
   private var _height:int;
   
   private var _width:int;
   
   private var _pngs:Array;
   
   private var _pngsMatrix:Array;
   
   public function PngOfMc(mc:MovieClip, precision:Number, transparent:Boolean)
   {
      var y:Number = NaN;
      var bd:BitmapData = null;
      var m:Matrix = null;
      this._pngsMatrix = new Array();
      this._pngs = new Array();
      super();
      var compress:Number = precision;
      var origin:Point = Utils.GetOriginOfMc(mc);
      var offSet:Point = new Point();
      if(origin.x < 0)
      {
         offSet.x = -origin.x;
      }
      if(origin.x > mc.width)
      {
         offSet.x = origin.x - mc.width;
      }
      if(origin.y < 0)
      {
         offSet.y = -origin.y;
      }
      if(origin.x > mc.width)
      {
         offSet.y = origin.y - mc.height;
      }
      this._width = Math.ceil((mc.width + offSet.x) / MAX_WIDTH * compress);
      this._height = Math.ceil((mc.height + offSet.y) / MAX_HEIGHT * compress);
      for(var x:Number = 0; x < this._width; x++)
      {
         for(y = 0; y < this._height; y++)
         {
            if(this._pngsMatrix[x] == null)
            {
               this._pngsMatrix[x] = new Array();
            }
         }
         bd = new BitmapData(MAX_WIDTH,MAX_HEIGHT,transparent,0);
         m = new Matrix();
         m.scale(compress,compress);
         m.translate(-(x * MAX_WIDTH),-(y * MAX_HEIGHT));
         bd.draw(mc,m);
         this._pngsMatrix[x][y] = bd;
         this._pngs.push(bd);
      }
   }
   
   public function Destroy() : void
   {
      var bd:BitmapData = null;
      while(this._pngs.length > 0)
      {
         bd = this._pngs.shift();
         bd.dispose();
         bd = null;
      }
      this._pngsMatrix = new Array();
   }
   
   public function GetPngAt(x:int, y:int) : BitmapData
   {
      if(this._pngsMatrix[x] == null)
      {
         return null;
      }
      return this._pngsMatrix[x][y];
   }
}
