package com.lachhhEngine.utils
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.games.physique.EquationVecto;
   import com.lachhhEngine.interfaces.forms.Button;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.externalAPI.metricsAPI.MetricGroup;
   import com.lachhhEngine.multilingual.TextFactory;
   import de.polygonal.math.RandomGenerator;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class Utils
   {
      
      private static const BLACK_N_WHITE:ColorMatrixFilter = new ColorMatrixFilter([0.3086000084877014,0.6093999743461609,0.0820000022649765,0,0,0.3086000084877014,0.6093999743461609,0.0820000022649765,0,0,0.3086000084877014,0.6093999743461609,0.0820000022649765,0,0,0,0,0,1,0]);
      
      private static var _theFilter:ColorMatrixFilter = ColorMatrixFilter(BLACK_N_WHITE.clone());
      
      private static var _theFilterArray:Array = [_theFilter];
      
      public function Utils()
      {
         super();
      }
      
      public static function SetColor(d:DisplayObject, r:Number = 0, g:Number = 0, b:Number = 0, a:Number = 0, rm:Number = 1, gm:Number = 1, bm:Number = 1, am:Number = 1) : void
      {
         var ct:ColorTransform = d.transform.colorTransform;
         ct.redOffset = r;
         ct.greenOffset = g;
         ct.blueOffset = b;
         ct.alphaOffset = a;
         ct.redMultiplier = rm;
         ct.greenMultiplier = gm;
         ct.blueMultiplier = bm;
         ct.alphaMultiplier = am;
         d.transform.colorTransform = ct;
      }
      
      public static function PutBlackAndWhite(d:DisplayObject, blackNWhite:Boolean = true) : void
      {
         if(blackNWhite)
         {
            d.filters = _theFilterArray;
         }
         else
         {
            d.filters = [];
         }
      }
      
      public static function PutTh(i:int) : String
      {
         if(i == 0)
         {
            return "0";
         }
         if(i == 1)
         {
            return TextFactory.instance.GetMsg(TextFactory.ID_RANK_1ST);
         }
         if(i == 2)
         {
            return TextFactory.instance.GetMsg(TextFactory.ID_RANK_2ND);
         }
         if(i == 3)
         {
            return TextFactory.instance.GetMsg(TextFactory.ID_RANK_3RD);
         }
         return i + TextFactory.instance.GetMsg(TextFactory.ID_RANK_TH);
      }
      
      public static function CropIn(value:int, rangeStart:int, rangeEnd:int) : int
      {
         var result:int = value;
         var diff:int = rangeEnd - rangeStart + 1;
         if(diff <= 0)
         {
            return -1;
         }
         while(result < rangeStart)
         {
            result += diff;
         }
         while(result > rangeEnd)
         {
            result -= diff;
         }
         return result;
      }
      
      public static function navigateToURLAndRecord(urlRequest:URLRequest, window:String = null) : void
      {
         navigateToURL(urlRequest,window);
         var urlArray:Array = urlRequest.url.split("http://");
         var url:String = urlArray[urlArray.length - 1];
         url = url.split("/").join("_");
         ExternalAPIManager.getMetricsAPI().RecordStats(url,MetricGroup.VIRAL);
      }
      
      public static function GetRandomInRange(n1:Number, n2:Number, randomGen:RandomGenerator = null) : Number
      {
         if(randomGen)
         {
            return n1 + randomGen.nextDouble() * (n2 - n1);
         }
         return n1 + Math.random() * (n2 - n1);
      }
      
      public static function AddInArrayIfNotIn(array:Array, elem:Object) : void
      {
         for(var i:int = 0; i < array.length; i++)
         {
            if(array[i] == elem)
            {
               return;
            }
         }
         array.push(elem);
      }
      
      public static function CreateBmpFromMc(anim:MovieClip) : Bitmap
      {
         var bmp:Bitmap = null;
         var origin:Point = GetOriginOfMc(anim);
         var bd:BitmapData = new BitmapData(anim.width,anim.height,true,0);
         var m:Matrix = new Matrix();
         m.translate(origin.x,origin.y);
         bd.draw(anim,m);
         bmp = new Bitmap(bd);
         bmp.x = -origin.x;
         bmp.y = -origin.y;
         return bmp;
      }
      
      public static function RemoveFromArray(array:Array, elem:Object) : Boolean
      {
         for(var i:int = 0; i < array.length; i++)
         {
            if(array[i] == elem)
            {
               array.splice(i,1);
               return true;
            }
         }
         return false;
      }
      
      public static function LazyRemoveFromParent(d:DisplayObject) : void
      {
         if(d == null)
         {
            return;
         }
         if(d.parent != null)
         {
            d.parent.removeChild(d);
         }
      }
      
      public static function IsActorInRange(actor1:Actor, actor2:Actor, rayon:Number) : Boolean
      {
         var dx:Number = actor2.px - actor1.px;
         var dy:Number = actor2.py - actor1.py;
         return dx * dx + dy * dy < rayon * rayon;
      }
      
      public static function lerp(start:Number, end:Number, prct:Number) : Number
      {
         var diff:Number = end - start;
         return Math.min(end,Math.max(start,start + prct * diff));
      }
      
      public static function GetHomingAngle(angle:Number, x1:Number, y1:Number, x2:Number, y2:Number, precision:Number) : Number
      {
         var realAngle:Number = EquationVecto.GetRotation(x2,x1,y2,y1);
         for(var nDiff:Number = realAngle - angle; nDiff > 180; )
         {
            nDiff -= 360;
         }
         while(nDiff < -180)
         {
            nDiff += 360;
         }
         while(angle > 180)
         {
            angle -= 360;
         }
         while(angle < -180)
         {
            angle += 360;
         }
         return angle + nDiff * precision;
      }
      
      public static function SetColor2(d:DisplayObject, color:uint) : void
      {
         var ct:ColorTransform = d.transform.colorTransform;
         ct.color = color;
         ct.alphaOffset = 0;
         ct.redMultiplier = 0;
         ct.greenMultiplier = 0;
         ct.blueMultiplier = 0;
         ct.alphaMultiplier = 1;
         d.transform.colorTransform = ct;
      }
      
      public static function RemoveNull(array:Array) : void
      {
         for(var i:int = 0; i < array.length; i++)
         {
            if(array[i] == null)
            {
               array.splice(i,1);
               i--;
            }
         }
      }
      
      public static function FrameToTime(frame:int, fps:int) : String
      {
         var min:int = Math.floor(frame / (fps * 60));
         frame -= fps * 60 * min;
         var sec:int = Math.floor(frame / fps);
         frame -= fps * sec;
         var ms:int = Math.floor(frame / fps * 100);
         return PutZero(min) + ":" + PutZero(sec) + ":" + PutZero(ms);
      }
      
      public static function PickRandomIn(a:Array, randomGen:RandomGenerator = null) : Object
      {
         var r:int = 0;
         if(a.length <= 0)
         {
            return null;
         }
         if(randomGen != null)
         {
            r = Math.floor(randomGen.nextDouble() * a.length);
         }
         else
         {
            r = Math.floor(Math.random() * a.length);
         }
         return a[r];
      }
      
      public static function FrameToTimeAdvanced(frame:int, fps:int, minuteLabel:String = null, secondLabel:String = null, msLabel:String = null) : String
      {
         var min:int = Math.floor(frame / (fps * 60));
         frame -= fps * 60 * min;
         var sec:int = Math.floor(frame / fps);
         frame -= fps * sec;
         var ms:int = Math.floor(frame / fps * 100);
         var result:String = "";
         if(minuteLabel != null)
         {
            result += PutZero(min) + " " + minuteLabel;
         }
         if(secondLabel != null)
         {
            result += PutZero(sec) + " " + secondLabel;
         }
         if(msLabel != null)
         {
            result += PutZero(ms) + " " + msLabel;
         }
         return result;
      }
      
      public static function IsInArray(array:Array, elem:Object) : Boolean
      {
         for(var i:int = 0; i < array.length; i++)
         {
            if(array[i] == elem)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function FindPointOptimized(pResult:Point, context:Game, lvl:LevelLayer, mc:DisplayObjectContainer) : Point
      {
         var crntMc:DisplayObjectContainer = mc;
         var m:Matrix = new Matrix();
         while(crntMc != lvl.visual && crntMc != null)
         {
            m.concat(crntMc.transform.matrix);
            crntMc = crntMc.parent;
         }
         m.concat(lvl.visual.transform.matrix);
         pResult.x = m.tx;
         pResult.y = m.ty;
         return context.camera.ConvertPointToMoteur(pResult,lvl);
      }
      
      public static function GetIndexOfElem(array:Array, elem:Object) : int
      {
         for(var i:int = 0; i < array.length; i++)
         {
            if(array[i] == elem)
            {
               return i;
            }
         }
         return -1;
      }
      
      public static function SetMaxSizeOfTxtField(tf:TextField, maxSize:int) : void
      {
         if(tf == null)
         {
            return;
         }
         var textFormat:TextFormat = tf.getTextFormat();
         var size:int = Math.max(maxSize,8);
         textFormat.size = size;
         tf.setTextFormat(textFormat);
         while((tf.maxScrollV > 1 || tf.maxScrollH > 1) && size > 8)
         {
            size--;
            textFormat.size = size;
            tf.setTextFormat(textFormat);
         }
      }
      
      public static function ClearArray(array:Array) : void
      {
         if(array == null)
         {
            return;
         }
         while(array.length > 0)
         {
            array.shift();
         }
      }
      
      public static function RoundOn(n:Number, tolerance:Number) : Number
      {
         var floor:Number = Math.ceil(n / tolerance) * tolerance;
         var ceil:Number = Math.floor(n / tolerance) * tolerance;
         var diff:Number = n - floor;
         var prct:Number = diff / (ceil - floor);
         return prct <= 0.5 ? floor : ceil;
      }
      
      public static function IsInstanceOfClass(obj:Object, classes:Array) : Boolean
      {
         for(var i:int = 0; i < classes.length; i++)
         {
            if(obj is classes[i])
            {
               return true;
            }
         }
         return false;
      }
      
      public static function SetColorDEPRECATED(r:int, g:int, b:int, a:int, d:DisplayObject) : void
      {
         var ct:ColorTransform = new ColorTransform();
         ct.redOffset = r;
         ct.blueOffset = b;
         ct.greenOffset = g;
         ct.alphaMultiplier = a;
         d.transform.colorTransform = ct;
      }
      
      public static function EnableButton(pEnable:Boolean, mc:Button) : void
      {
         if(pEnable)
         {
            SetColorDEPRECATED(0,0,0,1,mc);
            mc.gotoUp();
         }
         else
         {
            SetColorDEPRECATED(100,100,100,1,mc);
            mc.gotoUp();
         }
         mc.mouseEnabled = pEnable;
         mc.mouseChildren = pEnable;
      }
      
      public static function RecurStop(mc:MovieClip) : void
      {
         var d:DisplayObject = null;
         var m:MovieClip = null;
         for(var i:int = 0; i < mc.numChildren; i++)
         {
            d = mc.getChildAt(i);
            if(d is MovieClip)
            {
               m = MovieClip(d);
               RecurStop(m);
               m.gotoAndStop(1);
            }
         }
      }
      
      public static function PutZero(n:int, digits:int = 2) : String
      {
         var temp:Number = NaN;
         var s:String = String(n);
         if(n <= 0)
         {
            temp = 1 / Math.pow(10,digits - 1);
         }
         else
         {
            temp = n / Math.pow(10,digits - 1);
         }
         while(temp < 1)
         {
            temp *= 10;
            s = "0" + s;
         }
         return s;
      }
      
      public static function GetOriginOfMc(mc:DisplayObject) : Point
      {
         var rect:Rectangle = mc.getBounds(mc);
         var origin:Point = new Point();
         origin.x = mc.x - rect.x;
         origin.y = mc.y - rect.y;
         return origin;
      }
      
      public static function PutVirgules(n:int) : String
      {
         var index:int = 0;
         var len:int = 0;
         var result:* = n + "";
         var tempA:Array = new Array();
         for(var i:int = result.length - 1; i >= 0; i -= 3)
         {
            index = Math.max(0,i - 2);
            len = i - index + 1;
            if(len > 0)
            {
               tempA.unshift(result.substr(index,len));
            }
         }
         return tempA.join(",");
      }
      
      public static function FindPoint(context:Game, lvl:LevelLayer, mc:DisplayObjectContainer) : Point
      {
         var p:Point = null;
         var crntMc:DisplayObjectContainer = mc;
         var m:Matrix = new Matrix();
         while(crntMc != lvl.visual && crntMc != null)
         {
            m.concat(crntMc.transform.matrix);
            crntMc = crntMc.parent;
         }
         m.concat(lvl.visual.transform.matrix);
         p = new Point(m.tx,m.ty);
         return context.camera.ConvertPointToMoteur(p,lvl);
      }
   }
}

