package com.battlecry.screens
{
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import flash.events.MouseEvent;
   
   public class ChallengeLoginScreen extends BC_Screen
   {
      
      public function ChallengeLoginScreen()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         var c:ConnectPlayerIOScreen = null;
         super.Init(metaObject,context);
         InitOkBtn(this.btn_ChallengeLogin);
         this.btn_ChallengeLogin.addEventListener(MouseEvent.MOUSE_DOWN,this.onChallengeLogin);
         if(ExternalAPIManager.getPremiumAPI().loggedIn)
         {
            c = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_CONNECT_PLAYERIO_SCREEN,false,true) as ConnectPlayerIOScreen;
            c.SetInfo(this);
         }
      }
      
      public function get btn_ChallengeLogin() : ButtonSelect
      {
         return visual.getChildByName("btn_ChallengeLogin") as ButtonSelect;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_CHALLENGELOGIN_SCREEN);
      }
      
      private function onChallengeLogin(event:MouseEvent) : void
      {
         if(!ExternalAPIManager.getPremiumAPI().loggedIn)
         {
            if(BC_VersionInfo.isGamerSafe || BC_VersionInfo.isKongregate)
            {
               Main.instance.canLogin = true;
               ExternalAPIManager.getPremiumAPI().ShowLogin();
               Main.instance.loginScreenToClose = this;
            }
            return;
         }
      }
   }
}

