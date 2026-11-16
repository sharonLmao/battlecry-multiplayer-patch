package com.battlecry.screens
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class GoldRewardGrindingScreen extends BC_Screen
   {
      
      public function GoldRewardGrindingScreen()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         InitOkBtn(this.btn_X);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
      }
      
      public function SetReward(goldReward:int) : void
      {
         BC_GameProgress.gameProgess.cash += goldReward;
         this.rewardTxt.text = goldReward + "";
         ScreenManager.instance.RefreshAll();
      }
      
      public function get btn_X() : ButtonSelect
      {
         return panel.getChildByName("btn_X") as ButtonSelect;
      }
      
      public function get rewardTxt() : TextField
      {
         return panel.getChildByName("rewardTxt") as TextField;
      }
      
      private function onClose(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_OK.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         this.btn_X.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_GOLDREWARDGRINDING_SCREEN);
      }
      
      public function get btn_OK() : ButtonSelect
      {
         return panel.getChildByName("btn_OK") as ButtonSelect;
      }
   }
}

