package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.files.FileManager;
   import flash.events.MouseEvent;
   
   public class GameTypeScreen extends BC_Screen
   {
      
      public function GameTypeScreen()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_PlayOffline);
         this.btn_PlayOffline.addEventListener(MouseEvent.MOUSE_DOWN,this.onPlayOffline);
         InitOkBtn(this.btn_PlayOnline);
         this.btn_PlayOnline.addEventListener(MouseEvent.MOUSE_DOWN,this.onPlayOnline);
      }
      
      public function get btn_PlayOnline() : ButtonSelect
      {
         return visual.getChildByName("btn_PlayOnline") as ButtonSelect;
      }
      
      private function onPlayOnline(event:MouseEvent) : void
      {
         Main.instance.canLogin = true;
         Main.instance.loginScreenToClose = this;
         var connectPlayerIO:ConnectPlayerIOScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_CONNECT_PLAYERIO_SCREEN) as ConnectPlayerIOScreen;
         connectPlayerIO.SetInfo(this);
      }
      
      private function onPlayOffline(event:MouseEvent) : void
      {
         FileManager.instance.SelectGameProgress(FileManager.instance.GetGameProgress(0));
         BC_Game.instance.CheckInitGame(this);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_PlayOffline.removeEventListener(MouseEvent.MOUSE_DOWN,this.onPlayOffline);
         this.btn_PlayOnline.removeEventListener(MouseEvent.MOUSE_DOWN,this.onPlayOnline);
      }
      
      public function get btn_PlayOffline() : ButtonSelect
      {
         return visual.getChildByName("btn_PlayOffline") as ButtonSelect;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_GAMETYPE_SCREEN);
      }
   }
}

