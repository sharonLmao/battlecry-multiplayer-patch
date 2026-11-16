package com.lachhhEngine.games.screens
{
   import com.berzerkstudio.exported.SCREEN_AD_SHOWER;
   import com.cpmStar.AdLoader;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.interfaces.forms.Button;
   import com.lachhhEngine.io.Callback;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AdShowerScreen extends Screen
   {
      
      private var _timer:Timer;
      
      private var _closed:Boolean = false;
      
      private var _secondLeft:int;
      
      private var _cpmStarAd:AdLoader;
      
      private var _closeCallback:Callback;
      
      public function AdShowerScreen()
      {
         super();
      }
      
      override public function Destroy() : void
      {
         this.quit.removeEventListener(MouseEvent.CLICK,this.OnClickQuit);
      }
      
      override public function ShowClose(context:MainGame) : void
      {
         if(this._cpmStarAd.alpha > 0)
         {
            this._cpmStarAd.alpha -= 0.1;
         }
         else
         {
            this.typedVisual.alpha -= 0.1;
            if(this.typedVisual.alpha <= 0)
            {
               if(this._closeCallback != null)
               {
                  this._closeCallback.DoCallback();
               }
               this.typedVisual.removeChild(this._cpmStarAd);
               ScreenManager.instance.RemoveScreen(this);
            }
         }
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_SCREEN_AD_SHOWER);
      }
      
      private function tick(t:TimerEvent) : void
      {
         --this._secondLeft;
         if(this._secondLeft <= 0)
         {
            this.quit.visible = true;
         }
      }
      
      override public function ShowOpen(context:MainGame) : void
      {
         this.typedVisual.alpha += 0.1;
         if(this.typedVisual.alpha >= 1)
         {
            this.typedVisual.alpha = 1;
            state = STATE_IDLE;
         }
      }
      
      private function get typedVisual() : SCREEN_AD_SHOWER
      {
         return SCREEN_AD_SHOWER(visual);
      }
      
      private function get quit() : Button
      {
         return Button(this.typedVisual.getChildByName("quit"));
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         super.Init(metaInfo,context);
         this.quit.addEventListener(MouseEvent.CLICK,this.OnClickQuit);
         state = STATE_OPENING;
         this._secondLeft = 5;
         this._cpmStarAd = new AdLoader(VersionInfo.cpmInterlevelId);
         this._cpmStarAd.x = 700 / 2 - 300 / 2;
         this._cpmStarAd.y = 550 / 2 - 250 / 2;
         this.typedVisual.addChild(this._cpmStarAd);
         this.typedVisual.alpha = 0;
         this._timer = new Timer(1000,this._secondLeft);
         this._timer.addEventListener(TimerEvent.TIMER,this.tick);
         this._timer.start();
         this.quit.visible = false;
         this._closeCallback = null;
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
      }
      
      private function OnClickQuit(e:MouseEvent) : void
      {
         this.Close();
      }
      
      public function SetCloseCallback(c:Callback) : void
      {
         this._closeCallback = c;
      }
      
      private function Close() : void
      {
         if(this._closed)
         {
            return;
         }
         this._closed = true;
         ScreenManager.instance.CloseScreen(this);
         this.Destroy();
      }
   }
}

