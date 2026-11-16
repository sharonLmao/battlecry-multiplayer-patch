package com.battlecry.screens
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class QuestionScreen extends BC_Screen
   {
      
      public static var TYPE_OK:int = 1;
      
      public static var TYPE_YES_NO:int = 2;
      
      private var _noCallback:Callback;
      
      private var _yesCallback:Callback;
      
      public function QuestionScreen()
      {
         super();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_X.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         this.btn_no.removeEventListener(MouseEvent.MOUSE_DOWN,this.No);
         this.btn_yes.removeEventListener(MouseEvent.MOUSE_DOWN,this.Yes);
         this.btn_OK.removeEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
      }
      
      public function get btn_no() : ButtonSelect
      {
         return panel.getChildByName("btn_no") as ButtonSelect;
      }
      
      private function Yes(event:MouseEvent) : void
      {
         if(this._yesCallback)
         {
            this._yesCallback.DoCallback();
         }
         Close(true,null,false);
      }
      
      private function No(event:MouseEvent) : void
      {
         if(this._noCallback)
         {
            this._noCallback.DoCallback();
         }
         Close(true,null,false);
      }
      
      public function get btn_yes() : ButtonSelect
      {
         return panel.getChildByName("btn_yes") as ButtonSelect;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_X);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         InitOkBtn(this.btn_no);
         this.btn_no.addEventListener(MouseEvent.MOUSE_DOWN,this.No);
         InitOkBtn(this.btn_yes);
         this.btn_yes.addEventListener(MouseEvent.MOUSE_DOWN,this.Yes);
         InitOkBtn(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
      }
      
      public function get btn_X() : ButtonSelect
      {
         return panel.getChildByName("btn_X") as ButtonSelect;
      }
      
      public function setInfo(type:int, str:String, yesCallBack:Callback = null, noCallBack:Callback = null) : void
      {
         if(type == TYPE_OK)
         {
            this.btn_OK.visible = true;
            this.btn_yes.visible = false;
            this.btn_no.visible = false;
         }
         else
         {
            this.btn_OK.visible = false;
            this.btn_yes.visible = true;
            this.btn_no.visible = true;
         }
         this.info_text.text = str;
         this.info_text.y += Math.abs((this.info_text.height - this.info_text.textHeight) / 2);
         this._yesCallback = yesCallBack;
         this._noCallback = noCallBack;
      }
      
      private function onClose(event:MouseEvent) : void
      {
         if(this._noCallback)
         {
            this._noCallback.DoCallback();
         }
         Close(true,null,false);
      }
      
      private function onOk(event:MouseEvent) : void
      {
         if(this._yesCallback)
         {
            this._yesCallback.DoCallback();
         }
         Close(true,null,false);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_QUESTION_SCREEN);
      }
      
      public function get info_text() : TextField
      {
         return panel.getChildByName("info_text") as TextField;
      }
      
      public function get btn_OK() : ButtonSelect
      {
         return panel.getChildByName("btn_OK") as ButtonSelect;
      }
   }
}

