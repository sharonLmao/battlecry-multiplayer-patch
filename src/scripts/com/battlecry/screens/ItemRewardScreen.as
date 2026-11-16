package com.battlecry.screens
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.model.ModelCampaign;
   import com.battlecry.screens.view.ItemRewardView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class ItemRewardScreen extends BC_Screen
   {
      
      private var _itemRewardView:ItemRewardView;
      
      public function ItemRewardScreen()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._itemRewardView = new ItemRewardView(this.itemRewardView);
         InitOkBtn(this.btn_X);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         InitOkBtn(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         animation.playChildren = false;
      }
      
      public function get btn_X() : ButtonSelect
      {
         return panel.getChildByName("btn_X") as ButtonSelect;
      }
      
      public function get itemRewardView() : MovieClip
      {
         return panel.getChildByName("ItemRewardView") as MovieClip;
      }
      
      private function onX(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._itemRewardView.Destroy();
         this.btn_X.removeEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         this.btn_OK.removeEventListener(MouseEvent.MOUSE_DOWN,this.onX);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ITEMREWARD_SCREEN);
      }
      
      public function get btn_OK() : ButtonSelect
      {
         return panel.getChildByName("btn_OK") as ButtonSelect;
      }
      
      public function reward(m:ModelCampaign) : void
      {
         this._itemRewardView.Init(m.itemReward);
      }
   }
}

