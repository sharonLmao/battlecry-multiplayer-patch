package com.battlecry.screens
{
   import com.battlecry.SelectionColor;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.BC_MetaArmy;
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
   
   public class CampaignArmyCreationScreen extends BC_Screen
   {
      
      private var _metaArmy:BC_MetaArmy;
      
      public function CampaignArmyCreationScreen()
      {
         super();
      }
      
      public function SetMetaArmy(metaArmy:BC_MetaArmy) : void
      {
         this._metaArmy = metaArmy;
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
            this.onOk(null);
         }
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
         this.btn_Ok.addEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
         this.btn_Cancel.addEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
         SelectionColor.setFieldSelectionColor(this.ArmyName,16513529);
      }
      
      public function get btn_X() : ButtonSelect
      {
         return panel.getChildByName("btn_X") as ButtonSelect;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_X.removeEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
         this.btn_Ok.removeEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
         this.btn_Cancel.removeEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
      }
      
      private function onOk(event:MouseEvent) : void
      {
         this._metaArmy.armyName = this.ArmyName.text;
         var s:ArmyInfoScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ARMYINFO_SCREEN,false,true) as ArmyInfoScreen;
         s.SetText(this._metaArmy.Encode());
         close();
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

