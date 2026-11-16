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
   
   public class SpecimenLogo extends Screen
   {
      
      private var _firstFrame:Boolean;
      
      private var _closed:Boolean = false;
      
      private var _frameRate:int;
      
      private var _sponsorVisual:MovieClip;
      
      private var _nextScreen:int = -1;
      
      public function SpecimenLogo()
      {
         super();
         state = STATE_IDLE;
      }
      
      public function set nextScreen(nextScreen:int) : void
      {
         this._nextScreen = nextScreen;
      }
      
      public function get nextScreen() : int
      {
         return this._nextScreen;
      }
      
      protected function GetVisualString() : String
      {
         return "com.berzerkstudio.exported.SPECIMEN_LOGO";
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_EMPTY);
      }
      
      override protected function get trackMetrics() : Boolean
      {
         return false;
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         var w:int;
         var h:int;
         var mainClass:Class = null;
         super.Init(metaInfo,context);
         this._firstFrame = true;
         w = context.GetVisualContainer().stage.stageWidth;
         h = context.GetVisualContainer().stage.stageHeight;
         visual.graphics.beginFill(16777215);
         visual.graphics.drawRect(0,0,w,h);
         visual.graphics.endFill();
         if(VersionInfo.canHaveExternalLinks)
         {
            visual.addEventListener(MouseEvent.MOUSE_DOWN,VersionInfo.OnClickSpecimenSite);
            visual.buttonMode = true;
         }
         try
         {
            mainClass = Class(getDefinitionByName(this.GetVisualString()));
            if(mainClass)
            {
               this._sponsorVisual = MovieClip(new mainClass());
               visual.addChild(this._sponsorVisual);
               this._sponsorVisual.x = w / 2;
               this._sponsorVisual.y = h / 2;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         if(this._firstFrame)
         {
            this._frameRate = visual.stage.frameRate;
            visual.stage.frameRate = 50;
            this._firstFrame = false;
         }
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
      
      override public function Destroy() : void
      {
         super.Destroy();
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
         visual.stage.frameRate = this._frameRate;
         ScreenManager.instance.RemoveScreen(this);
      }
   }
}

