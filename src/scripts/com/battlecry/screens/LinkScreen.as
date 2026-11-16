package com.battlecry.screens
{
   import com.battlecry.Main;
   import com.battlecry.SelectionColor;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class LinkScreen extends BC_Screen
   {
      
      public function LinkScreen()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_X);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         InitOkBtn(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         SelectionColor.setFieldSelectionColor(this.Link,16513529);
         this.Link.text = "Add me by name: " + Main.instance.GetMultiplayerName();
      }
      
      public function get Link() : TextField
      {
         return panel.getChildByName("Link") as TextField;
      }
      
      public function get btn_X() : ButtonSelect
      {
         return panel.getChildByName("btn_X") as ButtonSelect;
      }
      
      private function onClose(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_X.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         this.btn_OK.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_LINK_SCREEN);
      }
      
      public function get btn_OK() : ButtonSelect
      {
         return panel.getChildByName("btn_OK") as ButtonSelect;
      }
   }
}

