package com.battlecry.screens
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.Screen;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.initializers.VersionInfo;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class ArmorGamesSplash extends Screen
   {
      
      private var _visual:MovieClip;
      
      public function ArmorGamesSplash()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickSponsor);
      }
      
      private function onClickSponsor(event:MouseEvent) : void
      {
         VersionInfo.OnClickSponsorMoreGames(null);
      }
      
      public function Close() : void
      {
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(visual.currentFrame >= visual.totalFrames)
         {
            ScreenManager.instance.RemoveScreen(this);
         }
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_AG_SPLASH_SCREEN);
      }
   }
}

