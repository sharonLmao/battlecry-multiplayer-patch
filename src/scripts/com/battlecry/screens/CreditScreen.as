package com.battlecry.screens
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import flash.events.MouseEvent;
   
   public class CreditScreen extends BC_Screen
   {
      
      public function CreditScreen()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         ExternalAPIManager.getPremiumAPI().HideBar();
         InitOkBtn(this.btn_Close);
         this.btn_Close.addEventListener(MouseEvent.MOUSE_DOWN,this.onBack);
      }
      
      public function get btn_Close() : ButtonSelect
      {
         return panel.getChildByName("btn_Close") as ButtonSelect;
      }
      
      private function onBack(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_Close.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBack);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_CREDIT_SCREEN);
      }
   }
}

