package com.lachhhEngine.games.screens
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.initializers.VersionInfo;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   
   public class LachhhEngineLogo extends Screen
   {
      
      private var _closed:Boolean = false;
      
      private var _sponsorVisual:MovieClip;
      
      private var _nextScreen:int = -1;
      
      public function LachhhEngineLogo()
      {
         super();
         state = STATE_IDLE;
      }
      
      public function set nextScreen(nextScreen:int) : void
      {
         this._nextScreen = nextScreen;
      }
      
      protected function GetVisualString() : String
      {
         return "com.lachhhEngine.exported.LACHHH_ENGINE_LOGO";
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         var mainClass:Class = null;
         super.Init(metaInfo,context);
         visual.graphics.beginFill(16777215);
         visual.graphics.drawRect(0,0,700,550);
         visual.graphics.endFill();
         if(VersionInfo.canHaveExternalLinks)
         {
            visual.addEventListener(MouseEvent.MOUSE_DOWN,VersionInfo.OnClickBerzerkSite);
            visual.buttonMode = true;
         }
         try
         {
            mainClass = Class(getDefinitionByName(this.GetVisualString()));
            if(mainClass)
            {
               this._sponsorVisual = MovieClip(new mainClass());
               this._sponsorVisual.x = 700 / 2;
               this._sponsorVisual.y = 550 / 2;
               visual.addChild(this._sponsorVisual);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         if(this._sponsorVisual == null)
         {
            this.Close();
            return;
         }
         if(this._sponsorVisual.currentFrame >= this._sponsorVisual.totalFrames - 3)
         {
            this.Close();
         }
      }
      
      private function Close() : void
      {
         if(this._closed)
         {
            return;
         }
         this._closed = true;
         if(this._sponsorVisual != null)
         {
            this._sponsorVisual.stop();
            visual.removeChild(this._sponsorVisual);
         }
         ScreenManager.instance.RemoveScreen(this);
      }
      
      override protected function get trackMetrics() : Boolean
      {
         return false;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_EMPTY);
      }
      
      public function get nextScreen() : int
      {
         return this._nextScreen;
      }
   }
}

