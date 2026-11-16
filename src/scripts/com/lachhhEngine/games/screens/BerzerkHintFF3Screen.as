package com.lachhhEngine.games.screens
{
   import com.berzerkstudio.exported.BERZERK_HINT_FF3;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.events.MouseEvent;
   
   public class BerzerkHintFF3Screen extends Screen
   {
      
      public function BerzerkHintFF3Screen()
      {
         super();
         this.typedVisual.addEventListener(MouseEvent.MOUSE_DOWN,this.OnQuit,false,0,false);
         state = Screen.STATE_IDLE;
         this.UpdateLanguage();
      }
      
      public function UpdateLanguage() : void
      {
         if(this.typedVisual != null)
         {
            this.typedVisual.hint.gotoAndStop(TextFactory.instance.language.frame);
         }
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         if(this.typedVisual.currentFrame >= 20)
         {
            ScreenManager.instance.RemoveScreen(this);
         }
      }
      
      public function get typedVisual() : BERZERK_HINT_FF3
      {
         return BERZERK_HINT_FF3(visual);
      }
      
      override public function Destroy() : void
      {
         this.typedVisual.removeEventListener(MouseEvent.MOUSE_DOWN,this.OnQuit);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_BERZERK_HINT_FF3);
      }
      
      private function OnQuit(e:MouseEvent) : void
      {
         this.typedVisual.gotoAndPlay("CLOSE");
      }
   }
}

