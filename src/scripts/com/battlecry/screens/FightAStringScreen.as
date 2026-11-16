package com.battlecry.screens
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
   import com.lachhhEngine.io.Callback;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class FightAStringScreen extends BC_Screen
   {
      
      private var _buttonSelectGroup:ButtonSelectGroup;
      
      private var _okCallback:Callback;
      
      private var _armySelected:int;
      
      public function FightAStringScreen()
      {
         super();
      }
      
      public function get btn_army1() : ButtonSelect
      {
         return panel.getChildByName("btn_army1") as ButtonSelect;
      }
      
      public function get btn_army2() : ButtonSelect
      {
         return panel.getChildByName("btn_army2") as ButtonSelect;
      }
      
      public function get btn_army3() : ButtonSelect
      {
         return panel.getChildByName("btn_army3") as ButtonSelect;
      }
      
      public function get btn_army4() : ButtonSelect
      {
         return panel.getChildByName("btn_army4") as ButtonSelect;
      }
      
      private function onArmy1(event:MouseEvent) : void
      {
         this._armySelected = 1;
         this._buttonSelectGroup.SelectButton(this.btn_army1);
      }
      
      private function onArmy2(event:MouseEvent) : void
      {
         this._armySelected = 2;
         this._buttonSelectGroup.SelectButton(this.btn_army2);
      }
      
      private function onArmy3(event:MouseEvent) : void
      {
         this._armySelected = 3;
         this._buttonSelectGroup.SelectButton(this.btn_army3);
      }
      
      private function onArmy4(event:MouseEvent) : void
      {
         this._armySelected = 4;
         this._buttonSelectGroup.SelectButton(this.btn_army4);
      }
      
      private function onOk(event:MouseEvent) : void
      {
         Close(true,new Callback(this.AfterOkClose,this,null),false);
      }
      
      public function get btn_Cancel() : ButtonSelect
      {
         return panel.getChildByName("btn_Cancel") as ButtonSelect;
      }
      
      public function get btn_OK() : ButtonSelect
      {
         return panel.getChildByName("btn_OK") as ButtonSelect;
      }
      
      public function SetOkCallback(c:Callback) : void
      {
         this._okCallback = c;
      }
      
      private function AfterOkClose() : void
      {
         var g:BC_GameProgress = null;
         if(this.gameProgressString.text.length > 25)
         {
            g = new BC_GameProgress();
            g.Decode(this.gameProgressString.text);
            if(this._okCallback)
            {
               this._okCallback.DoCallbackWithParams([g,this._armySelected]);
            }
            return;
         }
      }
      
      public function get gameProgressString() : TextField
      {
         return panel.getChildByName("gameProgressString") as TextField;
      }
      
      public function get btn_X() : ButtonSelect
      {
         return panel.getChildByName("btn_X") as ButtonSelect;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._okCallback = null;
         this.btn_Cancel.addEventListener(MouseEvent.MOUSE_DOWN,this.onCancel);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onCancel);
         this.btn_OK.addEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
         this.btn_army1.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy1);
         this.btn_army2.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy2);
         this.btn_army3.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy3);
         this.btn_army4.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy4);
         this._buttonSelectGroup = new ButtonSelectGroup();
         this._buttonSelectGroup.AddButton(this.btn_army1);
         this._buttonSelectGroup.AddButton(this.btn_army2);
         this._buttonSelectGroup.AddButton(this.btn_army3);
         this._buttonSelectGroup.AddButton(this.btn_army4);
         this._armySelected = 1;
         this._buttonSelectGroup.SelectButton(this.btn_army1);
      }
      
      private function onCancel(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_FIGHTASTRING_SCREEN);
      }
   }
}

