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
   
   public class ReferentialRewardScreen extends BC_Screen
   {
      
      private var _cashReward:int;
      
      public function ReferentialRewardScreen()
      {
         super();
      }
      
      public function get numReferal() : TextField
      {
         return panel.getChildByName("numReferal") as TextField;
      }
      
      public function SetReferential(ref:String) : void
      {
         this.referent.text = ref;
         this.rewardTxt.text = this._cashReward + "";
         this.numReferal.text = BC_GameProgress.gameProgess.numReferential + "";
         BC_GameProgress.gameProgess.cash += this._cashReward;
         ScreenManager.instance.RefreshAll();
      }
      
      public function get rewardTxt() : TextField
      {
         return panel.getChildByName("rewardTxt") as TextField;
      }
      
      public function get referent() : TextField
      {
         return panel.getChildByName("referent") as TextField;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._cashReward = BC_GameProgress.gameProgess.GetReferentialReward(BC_GameProgress.gameProgess.numReferential);
         InitOkBtn(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         InitOkBtn(this.btn_X);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
      }
      
      public function get btn_X() : ButtonSelect
      {
         return panel.getChildByName("btn_X") as ButtonSelect;
      }
      
      private function onClose(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_REFERENTIALREWARD_SCREEN);
      }
      
      public function get btn_OK() : ButtonSelect
      {
         return panel.getChildByName("btn_OK") as ButtonSelect;
      }
   }
}

