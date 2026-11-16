package com.lachhhEngine.games.screens
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.initializers.VersionInfo;
   import flash.display.Stage;
   import flash.events.MouseEvent;
   
   public class CheatScreen extends Screen
   {
      
      public function CheatScreen()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         state = STATE_OPENING;
         visual.alpha = 0;
         if(VersionInfo.canHaveExternalLinks)
         {
            visual.addEventListener(MouseEvent.MOUSE_DOWN,VersionInfo.OnClickBerzerkSite);
            visual.buttonMode = true;
         }
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         this.PlaceVisual(context.stage);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_CHEAT_DETECTED);
      }
      
      private function PlaceVisual(stage:Stage) : void
      {
         if(stage != null)
         {
            visual.x = stage.stageWidth / 2;
            visual.y = stage.stageHeight / 2;
         }
      }
      
      override public function ShowOpen(context:MainGame) : void
      {
         visual.alpha += 0.05;
         if(visual.alpha >= 1)
         {
            visual.alpha = 1;
            state = STATE_IDLE;
         }
         this.PlaceVisual(context.stage);
      }
   }
}

