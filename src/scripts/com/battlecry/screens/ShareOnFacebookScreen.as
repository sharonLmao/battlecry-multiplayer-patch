package com.battlecry.screens
{
   import Facebook.FB;
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import playerio.Client;
   import playerio.PlayerIO;
   import playerio.PlayerIOError;
   
   public class ShareOnFacebookScreen extends BC_Screen
   {
      
      private var _sharing:Boolean;
      
      public function ShareOnFacebookScreen()
      {
         super();
      }
      
      public function get btn_cancel() : ButtonSelect
      {
         return visual.getChildByName("btn_cancel") as ButtonSelect;
      }
      
      private function HandleFail(error:PlayerIOError) : void
      {
         Close(true,null,false);
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_OK,"Error Happened, Could Not Share On Facebook... Please Try Again!");
         BC_Game.instance.fbConnected = false;
         BC_GameProgress.gameProgess.fBAccessToken = "";
         BC_Game.instance.Save();
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(this.anim)
         {
            this.anim.play();
         }
      }
      
      private function Connect() : void
      {
         BC_Game.instance.fbConnected = true;
         if((BC_GameProgress.gameProgess.fBAccessToken == "" || BC_GameProgress.gameProgess.fBAccessToken == "null") && BC_GameProgress.gameProgess.fBAccessToken != null)
         {
            PlayerIO.quickConnect.facebookOAuthConnectPopup(BC_Game.instance.stage,"battlecry-qbkbf5in3epjv941j6vg","_blank",["publish_stream"],null,this.HandleSuccess,this.HandleFail);
         }
         else
         {
            PlayerIO.quickConnect.facebookOAuthConnect(BC_Game.instance.stage,"battlecry-qbkbf5in3epjv941j6vg",BC_GameProgress.gameProgess.fBAccessToken,"",this.HandleSuccessQuick,this.HandleFail);
         }
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_cancel);
         this.btn_cancel.addEventListener(MouseEvent.MOUSE_DOWN,this.onCancel);
         if(BC_Game.instance.fbConnected)
         {
            this.Share();
         }
         else
         {
            this.Connect();
         }
      }
      
      public function get anim() : MovieClip
      {
         return visual.getChildByName("anim") as MovieClip;
      }
      
      private function HandleSuccessQuick(client:Client, facebookuserid:String) : void
      {
         FB.init({
            "access_token":BC_GameProgress.gameProgess.fBAccessToken,
            "app_id":"565901413434115",
            "debug":false
         });
         this.Share();
      }
      
      private function onCancel(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      private function HandleSuccess(client:Client, access_token:String, facebookuserid:String) : void
      {
         FB.init({
            "access_token":access_token,
            "app_id":"565901413434115",
            "debug":true
         });
         BC_GameProgress.gameProgess.fBAccessToken = access_token;
         this.Share();
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_SHAREONFACEBOOK_SCREEN);
      }
      
      private function Share() : void
      {
         var body:* = "BattleCry";
         var body2:* = "Try And Beat My Army On BattleCry !!";
         var facebookLink:String = Main.instance.GetFacebookLink();
         FB.api("/me/feed","post",{
            "name":body,
            "description":body2,
            "picture":"http://www.berzerkstudio.com/games/battlecry/BC_ICON_154x154.png",
            "link":facebookLink
         },function(response:*):*
         {
            var q:QuestionScreen = null;
            var q1:QuestionScreen = null;
            if(!response || Boolean(response.error))
            {
               Close(true,null,false);
               q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
               q.setInfo(QuestionScreen.TYPE_OK,"Error Happened, Could Not Share On Facebook... Please Try Again!");
               BC_Game.instance.fbConnected = false;
               BC_GameProgress.gameProgess.fBAccessToken = "";
               BC_Game.instance.Save();
            }
            else
            {
               Close(true,null,false);
               q1 = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
               q1.setInfo(QuestionScreen.TYPE_OK,"Your Link Was Shared On Facebook.");
            }
         });
      }
   }
}

