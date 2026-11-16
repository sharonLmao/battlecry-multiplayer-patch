package com.lachhhEngine.games.screens
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class FlashScreen extends Screen
   {
      
      private var _maxFrame:Number;
      
      private var _frame:Number;
      
      public function FlashScreen()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         state = STATE_IDLE;
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         super.ShowIdle(context);
         visual.alpha = this._frame / this._maxFrame;
         this._frame -= context.game.speedManager.GetSpeed();
         if(this._frame <= 0)
         {
            ScreenManager.instance.RemoveScreen(this);
         }
      }
      
      override protected function get trackMetrics() : Boolean
      {
         return false;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_EMPTY);
      }
      
      public function InitFlash(color:uint, frame:Number) : void
      {
         visual.graphics.beginFill(color,1);
         visual.graphics.drawRect(0,0,visual.stage.stageWidth,visual.stage.stageHeight);
         visual.graphics.endFill();
         this._maxFrame = this._frame = frame;
      }
   }
}

