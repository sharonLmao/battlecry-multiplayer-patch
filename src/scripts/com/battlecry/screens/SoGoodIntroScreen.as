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
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   
   public class SoGoodIntroScreen extends Screen
   {
      
      public function SoGoodIntroScreen()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickLogo);
      }
      
      private function onClickLogo(event:MouseEvent) : void
      {
         Utils.navigateToURLAndRecord(new URLRequest("http://sogood.com"));
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(this.intro.currentFrame >= this.intro.totalFrames - 2)
         {
            visual.stop();
            animation.stop();
            this.intro.stop();
            ScreenManager.instance.RemoveScreen(this);
         }
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_SOGOOD_INTRO_SCREEN);
      }
      
      public function get intro() : MovieClip
      {
         return visual.getChildByName("intro") as MovieClip;
      }
   }
}

