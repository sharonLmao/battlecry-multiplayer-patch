package com.battlecry.screens
{
   import com.battlecry.SelectionColor;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.GamerSafeController;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import playerio.DatabaseObject;
   import playerio.PlayerIOError;
   
   public class LoginScreen extends BC_Screen
   {
      
      private var _screenToClose:BC_Screen;
      
      private var _pendingName:String;
      
      public function LoginScreen()
      {
         super();
      }
      
      private function onX(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      public function get password() : TextField
      {
         return panel.getChildByName("password") as TextField;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_X);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         InitOkBtn(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
         InitOkBtn(this.btn_Cancel);
         this.btn_Cancel.addEventListener(MouseEvent.MOUSE_DOWN,this.onCancel);
         SelectionColor.setFieldSelectionColor(this.username,16513529);
         SelectionColor.setFieldSelectionColor(this.password,16513529);
      }
      
      public function get btn_X() : ButtonSelect
      {
         return panel.getChildByName("btn_X") as ButtonSelect;
      }
      
      public function get username() : TextField
      {
         return panel.getChildByName("username") as TextField;
      }
      
      public function SetInfo(screenToClose:BC_Screen) : void
      {
         this._screenToClose = screenToClose;
      }
      
      private function onCancel(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_X.removeEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         this.btn_OK.removeEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
         this.btn_Cancel.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCancel);
      }
      
      private function ShowMsg(s:String) : void
      {
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_OK,s);
      }
      
      private function onOk(event:MouseEvent) : void
      {
         var raw:String = this.username.text;
         if(raw == null)
         {
            raw = "";
         }
         var clean:String = "";
         var c:String = null;
         var i:int = 0;
         while(i < raw.length)
         {
            c = raw.charAt(i);
            if(c >= "A" && c <= "Z" || c >= "a" && c <= "z" || c >= "0" && c <= "9" || c == "_")
            {
               clean += c;
            }
            i++;
         }
         if(clean.length < 3 || clean.length > 20)
         {
            this.ShowMsg("Pick a name: 3-20 letters, numbers or _ (no spaces).");
            return;
         }
         this._pendingName = clean;
         var conn:* = PlayerIOBattleCryController.getInstance().myPublicConnection;
         if(conn == null || conn.client == null)
         {
            this.ClaimAndProceed();
            return;
         }
         conn.client.bigDB.load("PlayerObjects","GS_" + clean,this.onCheckResult,this.onCheckError);
      }
      
      private function onCheckResult(o:DatabaseObject) : void
      {
         if(o != null)
         {
            this.ShowMsg("That name is already taken. Try another.");
         }
         else
         {
            this.ClaimAndProceed();
         }
      }
      
      private function onCheckError(e:PlayerIOError) : void
      {
         this.ClaimAndProceed();
      }
      
      private function ClaimAndProceed() : void
      {
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_YES_NO,"Enable cheats? Your name will be tagged CHEAT_ and you can add coins.",new Callback(this.onCheatYes,this,null),new Callback(this.onCheatNo,this,null));
      }
      
      private function onCheatYes() : void
      {
         this.FinishName(true);
      }
      
      private function onCheatNo() : void
      {
         this.FinishName(false);
      }
      
      private function FinishName(cheat:Boolean) : void
      {
         var toClose:BC_Screen = this._screenToClose;
         GamerSafeController.BC_SetName(this._pendingName,cheat);
         Close(true,null,false);
         var connectPlayerIO:ConnectPlayerIOScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_CONNECT_PLAYERIO_SCREEN) as ConnectPlayerIOScreen;
         connectPlayerIO.SetInfo(toClose);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_LOGIN_SCREEN);
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
