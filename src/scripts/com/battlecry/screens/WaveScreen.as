package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.io.Callback;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class WaveScreen extends BC_Screen
   {
      
      private var _timeToClose:Number;
      
      private var _wave:int;
      
      public function WaveScreen()
      {
         super();
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         super.ShowIdle(context);
         if(this._timeToClose > 0)
         {
            --this._timeToClose;
         }
         else
         {
            Close(true,new Callback(this.AfterClose,this,null),false);
         }
      }
      
      private function AfterClose() : void
      {
         BC_Game.instance.survivalMove = false;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(visual.currentFrame == 5)
         {
            Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_THUNDERSTORMSTAFF);
         }
         this.waveTxt.text = "WAVE " + this._wave;
      }
      
      public function get waveMC() : MovieClip
      {
         return visual.getChildByName("waveMC") as MovieClip;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._timeToClose = 60;
      }
      
      override protected function get closeFrame() : int
      {
         return 31;
      }
      
      override protected function get idleFrame() : int
      {
         return 30;
      }
      
      public function SetWave(wave:int) : void
      {
         this._wave = wave;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_WAVE_SCREEN);
      }
      
      public function get waveTxt() : TextField
      {
         return this.waveMC.getChildByName("waveTxt") as TextField;
      }
   }
}

