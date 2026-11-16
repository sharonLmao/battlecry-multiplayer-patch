package com.battlecry.screens
{
   import com.battlecry.BedUtil.Captcha;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.KeyManager;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   
   public class CaptchaScreen extends BC_Screen
   {
      
      private var _captcha:Captcha;
      
      public function CaptchaScreen()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
         this._captcha = new Captcha("all",10,true,45);
         this._captcha.x = -70;
         this._captcha.y = 60;
         panel.addChild(this._captcha);
      }
      
      private function onOk(event:MouseEvent) : void
      {
         var q:QuestionScreen = null;
         if(this.CaptchaText.text == this._captcha.captcha)
         {
            Close(true,null,false);
         }
         else
         {
            q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
            q.setInfo(QuestionScreen.TYPE_OK,"Wrong Captcha");
            this._captcha.reRandCaptcha(null);
            this.CaptchaText.text = "";
         }
      }
      
      public function get CaptchaText() : TextField
      {
         return panel.getChildByName("CaptchaText") as TextField;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_QUESTION_SCREEN) <= 0)
         {
            if(KeyManager.IsKeyPressed(Keyboard.ENTER))
            {
               this.onOk(null);
            }
         }
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_CAPTCHA_SCREEN);
      }
      
      public function get btn_OK() : ButtonSelect
      {
         return panel.getChildByName("btn_OK") as ButtonSelect;
      }
   }
}

