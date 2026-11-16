package com.battlecry.init
{
   import com.battlecry.exported.BTN_SOGOODMOREGAMES;
   import com.battlecry.exported.BTN_SOGOODPLAY;
   import com.lachhhEngine.initializers.preloader.IPreloader;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class SoGoodPreloader extends MovieClip implements IPreloader
   {
      
      private var _percent:Number;
      
      private var _sunRayInit:Boolean;
      
      private var _btnMoreGames:ButtonSelect;
      
      private var _visual:SOGOOD_PRELOADER;
      
      private var _callback:Callback;
      
      private var _btnPlay:ButtonSelect;
      
      public function SoGoodPreloader()
      {
         super();
      }
      
      public function get sunIdle() : MovieClip
      {
         return this.sunRay.getChildByName("sunIdle") as MovieClip;
      }
      
      public function get moreGamesMC() : MovieClip
      {
         return this._visual.getChildByName("moreGamesMC") as MovieClip;
      }
      
      public function get sunRay() : MovieClip
      {
         return this._visual.getChildByName("sunRay") as MovieClip;
      }
      
      public function get visual() : MovieClip
      {
         return this;
      }
      
      public function get playMC() : MovieClip
      {
         return this._visual.getChildByName("playMC") as MovieClip;
      }
      
      public function set callback(c:Callback) : void
      {
         this._callback = c;
      }
      
      public function get loader() : MovieClip
      {
         return this._visual.getChildByName("loader") as MovieClip;
      }
      
      private function onAnimationToPlay(event:Event) : void
      {
         this._visual.gotoAndStop(2);
         this._btnPlay.x = this.playMC.x;
         this._btnPlay.y = this.playMC.y;
         this.loader.y = 1000;
         this._btnMoreGames.x = this.moreGamesMC.x;
         this._btnMoreGames.y = this.moreGamesMC.y;
         if(this._sunRayInit)
         {
            if(this.sunRay.currentFrame >= this.sunRay.totalFrames)
            {
               this._sunRayInit = false;
            }
         }
         if(this._sunRayInit)
         {
            this.sunInit.visible = true;
            this.sunIdle.visible = false;
         }
         else
         {
            this.sunInit.visible = false;
            this.sunIdle.visible = true;
         }
      }
      
      public function Close() : void
      {
         this._btnPlay.visible = false;
         this._btnPlay.removeEventListener(MouseEvent.MOUSE_DOWN,this.onPlay);
         this._btnMoreGames.visible = false;
         this._btnMoreGames.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMoreGames);
         this._callback.DoCallback();
      }
      
      private function onMoreGames(event:MouseEvent) : void
      {
         navigateToURL(new URLRequest("http://sogood.com"));
      }
      
      public function get callback() : Callback
      {
         return this._callback;
      }
      
      public function get SoGoodLogo() : MovieClip
      {
         return this._visual.getChildByName("SoGoodLogo") as MovieClip;
      }
      
      public function Init() : void
      {
         this._visual = new SOGOOD_PRELOADER();
         this._visual.x = 0;
         this._visual.y = 0;
         this._sunRayInit = true;
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         addChild(this._visual);
         this._visual.addChild(this.loader);
         this.SoGoodLogo.addEventListener(MouseEvent.MOUSE_DOWN,this.onMoreGames);
         this.SoGoodLogo.useHandCursor = true;
         this.SoGoodLogo.buttonMode = true;
         this._btnPlay = new BTN_SOGOODPLAY();
         this._btnPlay.addEventListener(MouseEvent.MOUSE_DOWN,this.onPlay);
         this._visual.addChild(this._btnPlay);
         this._btnPlay.x = this.playMC.x;
         this._btnPlay.y = this.playMC.y;
         this._btnMoreGames = new BTN_SOGOODMOREGAMES();
         this._btnMoreGames.addEventListener(MouseEvent.MOUSE_DOWN,this.onMoreGames);
         this._visual.addChild(this._btnMoreGames);
         this._btnMoreGames.x = this.moreGamesMC.x;
         this._btnMoreGames.y = this.moreGamesMC.y;
      }
      
      private function onPlay(event:MouseEvent) : void
      {
         this.Close();
      }
      
      private function onEnterFrame(e:Event) : void
      {
         this._percent = this._visual.root.loaderInfo.bytesLoaded / this._visual.root.loaderInfo.bytesTotal;
         this.loader.gotoAndStop(Math.round(this._percent * 100));
         this._visual.gotoAndStop(1);
         if(this._sunRayInit)
         {
            if(this.sunRay.currentFrame >= this.sunRay.totalFrames)
            {
               this._sunRayInit = false;
            }
         }
         if(this._sunRayInit)
         {
            this.sunInit.visible = true;
            this.sunIdle.visible = false;
         }
         else
         {
            this.sunInit.visible = false;
            this.sunIdle.visible = true;
         }
         if(this._percent >= 1)
         {
            this.loader.gotoAndPlay(100);
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            addEventListener(Event.ENTER_FRAME,this.onAnimationToPlay);
         }
      }
      
      public function get sunInit() : MovieClip
      {
         return this.sunRay.getChildByName("sunInit") as MovieClip;
      }
   }
}

