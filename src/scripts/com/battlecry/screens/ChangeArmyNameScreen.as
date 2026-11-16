package com.battlecry.screens
{
   import com.battlecry.SelectionColor;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.KeyManager;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   
   public class ChangeArmyNameScreen extends BC_Screen
   {
      
      private var _armyCreationScreen:ArmyCreationScreen;
      
      public function ChangeArmyNameScreen()
      {
         super();
      }
      
      public function get ArmyName() : TextField
      {
         return panel.getChildByName("ArmyName") as TextField;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(KeyManager.IsKeyPressed(Keyboard.ENTER))
         {
            this.onOK(null);
         }
      }
      
      public function SetArmyCreationScreen(armyCreationScreen:ArmyCreationScreen) : void
      {
         this._armyCreationScreen = armyCreationScreen;
         this.ArmyName.text = BC_GameProgress.gameProgess.CurrentSelectedArmy().armyName;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_Cancel);
         this.btn_Cancel.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         InitOkBtn(this.btn_X);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         InitOkBtn(this.btn_Ok);
         this.btn_Ok.addEventListener(MouseEvent.MOUSE_DOWN,this.onOK);
         SelectionColor.setFieldSelectionColor(this.ArmyName,16513529);
      }
      
      public function get btn_X() : ButtonSelect
      {
         return panel.getChildByName("btn_X") as ButtonSelect;
      }
      
      private function onX(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_Cancel.removeEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         this.btn_X.removeEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         this.btn_Ok.removeEventListener(MouseEvent.MOUSE_DOWN,this.onOK);
      }
      
      private function onOK(event:MouseEvent) : void
      {
         this._armyCreationScreen.ChangeArmyName(this.ArmyName.text);
         Close(true,null,false);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_CHANGEARMYNAME_SCREEN);
      }
      
      public function get btn_Cancel() : ButtonSelect
      {
         return panel.getChildByName("btn_Cancel") as ButtonSelect;
      }
      
      public function get btn_Ok() : ButtonSelect
      {
         return panel.getChildByName("btn_Ok") as ButtonSelect;
      }
   }
}

