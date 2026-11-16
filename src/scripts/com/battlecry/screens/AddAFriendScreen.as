package com.battlecry.screens
{
   import com.battlecry.Main;
   import com.battlecry.SelectionColor;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.KeyManager;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   
   public class AddAFriendScreen extends BC_Screen
   {
      
      public function AddAFriendScreen()
      {
         super();
      }
      
      public function ShowQuestion(id:int) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_QUESTION_SCREEN) > 0)
         {
            return;
         }
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(id));
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(KeyManager.IsKeyPressed(Keyboard.ENTER) && ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_QUESTION_SCREEN) <= 0)
         {
            this.onOK(null);
         }
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.MOUSE_DOWN,this.onOK);
         InitOkBtn(this.btn_X);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         InitOkBtn(this.btn_Cancel);
         this.btn_Cancel.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         SelectionColor.setFieldSelectionColor(this.friendName,16513529);
      }
      
      private function CheckIfAlreadyFriend(s:String) : Boolean
      {
         for(var i:int = 0; i < BC_GameProgress.gameProgess.friendList.length; i++)
         {
            if(s == BC_GameProgress.gameProgess.friendList[i])
            {
               return true;
            }
         }
         return false;
      }
      
      public function get btn_X() : ButtonSelect
      {
         return panel.getChildByName("btn_X") as ButtonSelect;
      }
      
      public function get friendName() : TextField
      {
         return panel.getChildByName("friendName") as TextField;
      }
      
      private function onX(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_OK.removeEventListener(MouseEvent.MOUSE_DOWN,this.onOK);
         this.btn_X.removeEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         this.btn_Cancel.removeEventListener(MouseEvent.MOUSE_DOWN,this.onX);
      }
      
      private function onOK(event:MouseEvent) : void
      {
         var name:String = null;
         var s1:SearchingFriendScreen = null;
         if(this.friendName.text == ExternalAPIManager.getPremiumAPI().accountName)
         {
            this.ShowQuestion(BC_TextFactory.ID_CANT_ADD_YOURSELF);
         }
         else
         {
            name = Main.instance.GetPrefix() + this.friendName.text;
            if(this.CheckIfAlreadyFriend(name))
            {
               this.ShowQuestion(BC_TextFactory.ID_ALREADY_YOUR_FRIEND);
            }
            else if(name == Main.instance.GetPIOid())
            {
               this.ShowQuestion(BC_TextFactory.ID_CANT_ADD_YOURSELF);
            }
            else
            {
               s1 = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_LOADING_SCREEN,false,true) as SearchingFriendScreen;
               s1.Search(name,this);
            }
         }
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ADDAFRIEND_SCREEN);
      }
      
      public function get btn_Cancel() : ButtonSelect
      {
         return panel.getChildByName("btn_Cancel") as ButtonSelect;
      }
      
      public function get btn_OK() : ButtonSelect
      {
         return panel.getChildByName("btn_OK") as ButtonSelect;
      }
   }
}

