package com.battlecry.BedUtil
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class Captcha extends Sprite
   {
      
      private var __length:uint;
      
      private var __noiseFlag:Boolean;
      
      private var __aryCharacters:Array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
      
      private var sp_cont:Sprite = new Sprite();
      
      private var __randCode:String = "";
      
      private var __type:String;
      
      private var __size:uint;
      
      private var __tft:TextFormat = new TextFormat();
      
      private const CHANGE:String = "change";
      
      private var __aryType:Array = ["number","character","math","bt","all"];
      
      private var sp_noise:Sprite = new Sprite();
      
      public function Captcha(type:String = "number", length:uint = 5, noiseFlag:Boolean = true, size:uint = 18)
      {
         super();
         this.__type = type;
         this.__length = length;
         this.__noiseFlag = noiseFlag;
         this.__size = size;
         this.__tft.font = "Arial";
         this.__tft.size = this.__size;
         this.__tft.bold = true;
         this.sp_cont.x = this.__size / 2;
         addChild(this.sp_cont);
         if(this.__aryType.indexOf(this.__type) == -1)
         {
            this.__type = this.__aryType[3];
         }
         this.reRandCaptcha(null);
         addEventListener(MouseEvent.MOUSE_DOWN,this.reRandCaptcha);
      }
      
      private function randInt(min:int, max:int) : int
      {
         return Math.random() * (max - min) + min;
      }
      
      private function randNumber(min:Number, max:Number) : Number
      {
         return Math.random() * (max - min) + min;
      }
      
      private function drawBorder() : void
      {
      }
      
      private function randCaptcha(type:String) : void
      {
         this.__randCode = "";
         switch(type)
         {
            case this.__aryType[0]:
               this.randCaptchaWithNumber();
               break;
            case this.__aryType[1]:
               this.randCaptchaWithCharacter();
               break;
            case this.__aryType[2]:
               this.randCaptchaWithMath();
               break;
            case this.__aryType[3]:
               this.randCaptchaWithBt();
               break;
            case this.__aryType[4]:
               this.randCaptchaWithAll();
               break;
            default:
               this.randCaptchaWithNumber();
         }
      }
      
      private function removeAllChild(container:DisplayObjectContainer) : *
      {
         while(container.numChildren > 0)
         {
            container.removeChildAt(0);
         }
      }
      
      private function randCaptchaWithMath() : void
      {
         var rand1:uint = uint(this.randInt(0,5));
         var rand2:uint = uint(this.randInt(0,10));
         var rand3:uint = uint(this.randInt(0,5));
         var rand4:uint = uint(this.randInt(0,10));
         var tf:TextField = new TextField();
         tf.text = "(" + rand1 + "+" + rand2 + ")" + "*(" + rand3 + "+" + rand4 + ")";
         tf.selectable = false;
         tf.textColor = this.randInt(0,8947848);
         tf.autoSize = TextFieldAutoSize.LEFT;
         tf.setTextFormat(this.__tft);
         this.sp_cont.addChild(tf);
         this.__randCode = String((rand1 + rand2) * (rand3 + rand4));
      }
      
      private function randCaptchaWithAll() : void
      {
         var tf:TextField = null;
         var r:Number = NaN;
         for(var i:uint = 0; i < this.__length; i++)
         {
            tf = new TextField();
            r = Math.random();
            if(r < 0.5)
            {
               tf.text = String(this.randInt(0,9));
               this.__randCode += tf.text;
               tf.selectable = false;
               tf.x = int(this.__tft.size) * i;
               tf.textColor = this.randInt(0,8947848);
               tf.autoSize = TextFieldAutoSize.LEFT;
               tf.setTextFormat(this.__tft);
               this.sp_cont.addChild(tf);
            }
            else
            {
               tf.text = this.__aryCharacters[this.randInt(0,51)];
               this.__randCode += tf.text;
               tf.selectable = false;
               tf.x = int(this.__tft.size) * i;
               tf.textColor = this.randInt(0,8947848);
               tf.autoSize = TextFieldAutoSize.LEFT;
               tf.setTextFormat(this.__tft);
               this.sp_cont.addChild(tf);
            }
         }
      }
      
      public function reRandCaptcha(_e:MouseEvent) : *
      {
         this.removeAllChild(this.sp_cont);
         this.randCaptcha(this.__type);
         this.drawNoise();
         this.drawBorder();
         dispatchEvent(new Event(this.CHANGE));
      }
      
      private function randCaptchaWithBt() : void
      {
         var rand1:Number = Number(this.randNumber(0,Math.PI).toFixed(2));
         var rand2:Number = Number(this.randNumber(0,Math.PI).toFixed(2));
         var tf:TextField = new TextField();
         tf.text = "Math.pow(" + rand1 + ",Math.log(" + rand2 + "))";
         tf.selectable = false;
         tf.textColor = this.randInt(0,8947848);
         tf.autoSize = TextFieldAutoSize.LEFT;
         tf.setTextFormat(this.__tft);
         this.sp_cont.addChild(tf);
         this.__randCode = Math.pow(rand1,Math.log(rand2)).toFixed(3);
      }
      
      private function randCaptchaWithCharacter() : void
      {
         var tf:TextField = null;
         for(var i:uint = 0; i < this.__length; i++)
         {
            tf = new TextField();
            tf.text = this.__aryCharacters[this.randInt(0,51)];
            this.__randCode += tf.text;
            tf.selectable = false;
            tf.x = int(this.__tft.size) * i;
            tf.textColor = this.randInt(0,8947848);
            tf.autoSize = TextFieldAutoSize.LEFT;
            tf.setTextFormat(this.__tft);
            this.sp_cont.addChild(tf);
         }
         this.__randCode = this.__randCode.toLowerCase();
      }
      
      private function drawNoise() : void
      {
         var i:* = undefined;
         var ptx:* = undefined;
         var pty:* = undefined;
         var ex:* = undefined;
         var ey:* = undefined;
         if(this.__noiseFlag)
         {
            this.sp_noise.graphics.clear();
            for(i = 0; i < 25; i++)
            {
               ptx = this.randInt(1,width);
               pty = this.randInt(1,height);
               ex = ptx + this.randInt(-width,width);
               ey = pty + this.randInt(-height,height);
               ex = ex <= 1 ? 1 : (ex >= width ? width : ex);
               ey = ey <= 1 ? 1 : (ey >= height - 1 ? height - 1 : ey);
               this.sp_noise.graphics.lineStyle(1,this.randInt(0,16777215),0.25);
               this.sp_noise.graphics.moveTo(ptx,pty);
               this.sp_noise.graphics.lineTo(ex,ey);
            }
            this.sp_noise.width = this.sp_cont.width + this.__size;
            this.sp_noise.height = this.sp_cont.height;
            addChild(this.sp_noise);
         }
      }
      
      public function get captcha() : String
      {
         return this.__randCode;
      }
      
      private function randCaptchaWithNumber() : void
      {
         var tf:TextField = null;
         for(var i:uint = 0; i < this.__length; i++)
         {
            tf = new TextField();
            tf.text = String(this.randInt(0,9));
            this.__randCode += tf.text;
            tf.selectable = false;
            tf.x = int(this.__tft.size) * i;
            tf.textColor = this.randInt(0,8947848);
            tf.autoSize = TextFieldAutoSize.LEFT;
            tf.setTextFormat(this.__tft);
            this.sp_cont.addChild(tf);
         }
      }
   }
}

