package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class Tutorial_Initial_Screen extends BC_Screen
   {
      
      private var _stage:int;
      
      public function Tutorial_Initial_Screen()
      {
         super();
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         animation.playChildren = true;
         visual.gotoAndStop(this._stage);
         switch(this._stage)
         {
            case 1:
               if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_ARMYCREATION_SCREEN) > 0)
               {
                  this._stage = 2;
               }
               break;
            case 4:
               if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_CAMPAIGN_SCREEN) > 0)
               {
                  this.Close(true,null,false);
               }
         }
         if(this.arrow1)
         {
            this.arrow1.play();
         }
         if(this.arrow2)
         {
            this.arrow2.play();
         }
         if(this.arrow3)
         {
            this.arrow3.play();
         }
         if(this.arrow4)
         {
            this.arrow4.play();
         }
         if(this.arrow5)
         {
            this.arrow5.play();
         }
      }
      
      public function get arrow1() : MovieClip
      {
         return visual.getChildByName("arrow1") as MovieClip;
      }
      
      public function get arrow2() : MovieClip
      {
         return visual.getChildByName("arrow2") as MovieClip;
      }
      
      public function get arrow3() : MovieClip
      {
         return visual.getChildByName("arrow3") as MovieClip;
      }
      
      public function get arrow4() : MovieClip
      {
         return visual.getChildByName("arrow4") as MovieClip;
      }
      
      public function get arrow5() : MovieClip
      {
         return visual.getChildByName("arrow5") as MovieClip;
      }
      
      private function onNextTuto(event:MouseEvent) : void
      {
         ++this._stage;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_NextTuto);
         this.btn_NextTuto.addEventListener(MouseEvent.MOUSE_DOWN,this.onNextTuto);
         this._stage = 1;
      }
      
      public function get btn_NextTuto() : ButtonSelect
      {
         return visual.getChildByName("btn_NextTuto") as ButtonSelect;
      }
      
      override public function Close(remove:Boolean, c:Callback, quickClose:Boolean) : void
      {
         super.Close(remove,c,quickClose);
         BC_Game.instance.Save();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_NextTuto.removeEventListener(MouseEvent.MOUSE_DOWN,this.onNextTuto);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_TUTORIAL_INITIAL_SCREEN);
      }
   }
}

