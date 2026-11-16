package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.io.BC_GamePrefs;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.screens.view.SoGoodLogoView;
   import com.battlecry.screens.view.VersionUpdateView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.files.FileManager;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   
   public class TitleScreen extends BC_Screen
   {
      
      private var _versionUpdateView:VersionUpdateView;
      
      private var _ooplaLogo:DisplayObject;
      
      private var _soGoodLogoView:SoGoodLogoView;
      
      public function TitleScreen()
      {
         super();
      }
      
      public function get btn_Facebook() : ButtonSelect
      {
         return visual.getChildByName("btn_Facebook") as ButtonSelect;
      }
      
      private function onStart(event:MouseEvent) : void
      {
         var c:ConnectPlayerIOScreen = null;
         var q:QuestionScreen = null;
         var c1:ConnectPlayerIOScreen = null;
         if(BC_VersionInfo.isArmorGames)
         {
            if(BC_VersionInfo.armorGamesController.loggedIn)
            {
               c = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_CONNECT_PLAYERIO_SCREEN) as ConnectPlayerIOScreen;
               c.SetInfo(this);
            }
            else
            {
               q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
               q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_NOT_CONNECTED_ON_ARMORGAMES));
            }
         }
         else
         {
            BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_GAMETYPE_SCREEN);
         }
      }
      
      public function get soGoodLogo() : MovieClip
      {
         return visual.getChildByName("soGoodLogo") as MovieClip;
      }
      
      private function onAG(event:MouseEvent) : void
      {
         VersionInfo.OnClickSponsorSite(null);
      }
      
      public function get btn_start() : ButtonSelect
      {
         return this.startPannel.getChildByName("btn_start") as ButtonSelect;
      }
      
      public function get btn_Twitter() : ButtonSelect
      {
         return visual.getChildByName("btn_Twitter") as ButtonSelect;
      }
      
      public function get btn_moreGames() : ButtonSelect
      {
         return this.menuPanel.getChildByName("btn_moreGames") as ButtonSelect;
      }
      
      private function get versionUpdateView() : MovieClip
      {
         return visual.getChildByName("VersionUpdateView") as MovieClip;
      }
      
      private function onFacebook(event:MouseEvent) : void
      {
         BC_VersionInfo.onClickFacebook();
      }
      
      private function onMoreGames(event:MouseEvent) : void
      {
         BC_VersionInfo.onMoreGames();
      }
      
      public function get btn_Sound() : ButtonSelect
      {
         return visual.getChildByName("btn_Sound") as ButtonSelect;
      }
      
      private function onTwitter(event:MouseEvent) : void
      {
         BC_VersionInfo.onClickTwitter();
      }
      
      override protected function get closeFrame() : int
      {
         return 29;
      }
      
      public function get btn_Credits() : ButtonSelect
      {
         return this.menuPanel.getChildByName("btn_Credits") as ButtonSelect;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_start.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStart);
         this.btn_Credits.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCredit);
         this.btn_host.removeEventListener(MouseEvent.MOUSE_DOWN,this.onHost);
         this.btn_moreGames.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMoreGames);
         this.btn_Sound.removeEventListener(MouseEvent.MOUSE_DOWN,this.onSound);
         this.btn_Facebook.removeEventListener(MouseEvent.MOUSE_DOWN,this.onFacebook);
         this.btn_Twitter.removeEventListener(MouseEvent.MOUSE_DOWN,this.onTwitter);
         this._versionUpdateView.Destroy();
      }
      
      private function onClickOopla(event:MouseEvent) : void
      {
         VersionInfo.OnClickSponsorSite(null);
      }
      
      private function get titleBG() : MovieClip
      {
         return visual.getChildByName("titleBG") as MovieClip;
      }
      
      private function get gamePrefs() : BC_GamePrefs
      {
         return FileManager.instance.gamePrefs as BC_GamePrefs;
      }
      
      public function get startPannel() : MovieClip
      {
         return visual.getChildByName("startPannel") as MovieClip;
      }
      
      public function get menuPanel() : MovieClip
      {
         return visual.getChildByName("menuPanel") as MovieClip;
      }
      
      private function onHost(event:MouseEvent) : void
      {
         BC_VersionInfo.onHostThisGame();
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         this._versionUpdateView.Update();
      }
      
      private function onLogo(event:MouseEvent) : void
      {
         VersionInfo.OnClickSponsorSite(null);
      }
      
      public function get btn_host() : ButtonSelect
      {
         return this.menuPanel.getChildByName("btn_host") as ButtonSelect;
      }
      
      internal function onError(errEvent:Event) : void
      {
      }
      
      private function get AGLogo() : ButtonSelect
      {
         return visual.getChildByName("AGLogo") as ButtonSelect;
      }
      
      internal function onCompleteHandler(loadEvent:Event) : void
      {
         this._ooplaLogo = loadEvent.currentTarget.content;
         this._ooplaLogo.width = 225;
         this._ooplaLogo.height = 125;
         this._ooplaLogo.x = 550;
         this._ooplaLogo.y = 475;
         visual.addChild(this._ooplaLogo);
         this._ooplaLogo.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickOopla);
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         var mLoader:Loader = null;
         var logoUrl:String = null;
         var mRequest:URLRequest = null;
         super.Init(metaObject,context);
         ExternalAPIManager.getPremiumAPI().HideBar();
         this._soGoodLogoView = new SoGoodLogoView(this.soGoodLogo);
         if(BC_VersionInfo.isOopla)
         {
            this.soGoodLogo.visible = false;
            mLoader = new Loader();
            if(ExternalInterface.available)
            {
               logoUrl = ExternalInterface.call("getLogoUrl") || "http://oopla.com/assets/ooplaLogo.swf";
            }
            else
            {
               logoUrl = "http://oopla.com/assets/ooplaLogo.swf";
            }
            mRequest = new URLRequest(logoUrl);
            mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onCompleteHandler);
            mLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
            mLoader.load(mRequest);
         }
         this.AGLogo.visible = false;
         if(BC_VersionInfo.isArmorGames)
         {
            this.soGoodLogo.visible = false;
            this.AGLogo.visible = true;
            this.AGLogo.useHandCursor = true;
            this.AGLogo.addEventListener(MouseEvent.MOUSE_DOWN,this.onAG);
         }
         InitOkBtn(this.btn_start);
         this.btn_start.addEventListener(MouseEvent.MOUSE_DOWN,this.onStart);
         InitOkBtn(this.btn_Credits);
         this.btn_Credits.addEventListener(MouseEvent.MOUSE_DOWN,this.onCredit);
         InitOkBtn(this.btn_host);
         this.btn_host.addEventListener(MouseEvent.MOUSE_DOWN,this.onHost);
         InitOkBtn(this.btn_moreGames);
         this.btn_moreGames.addEventListener(MouseEvent.MOUSE_DOWN,this.onMoreGames);
         InitOkBtn(this.btn_Sound);
         this.btn_Sound.addEventListener(MouseEvent.MOUSE_DOWN,this.onSound);
         InitOkBtn(this.btn_Facebook);
         this.btn_Facebook.addEventListener(MouseEvent.MOUSE_DOWN,this.onFacebook);
         InitOkBtn(this.btn_Twitter);
         this.btn_Twitter.addEventListener(MouseEvent.MOUSE_DOWN,this.onTwitter);
         Jukebox.instance.FadeToMusic(BC_SfxFactory.ID_MUSIC_INTERFACES);
         this._versionUpdateView = new VersionUpdateView(this.versionUpdateView);
         animation.playChildren = false;
         this.titleBG.gotoAndStop(1);
         this.Refresh();
      }
      
      private function onCredit(event:MouseEvent) : void
      {
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_CREDIT_SCREEN);
      }
      
      override protected function get idleFrame() : int
      {
         return 28;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         if(this.gamePrefs.musicVolume <= 1)
         {
            this.btn_Sound.Select();
         }
         else
         {
            this.btn_Sound.Deselect();
         }
         this._versionUpdateView.Refresh();
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_TITLE_SCREEN);
      }
      
      private function onSound(event:MouseEvent) : void
      {
         if(this.gamePrefs.musicVolume <= 1)
         {
            Jukebox.instance.MuteMusic(false);
            Jukebox.instance.MuteSound(false);
            this.gamePrefs.soundVolume = 100;
            this.gamePrefs.musicVolume = 100;
            this.gamePrefs.soundOn = true;
            this.gamePrefs.musicOn = true;
         }
         else
         {
            Jukebox.instance.MuteMusic(true);
            Jukebox.instance.MuteSound(true);
            this.gamePrefs.soundVolume = 0;
            this.gamePrefs.musicVolume = 0;
            this.gamePrefs.soundOn = false;
            this.gamePrefs.musicOn = false;
         }
         this.Refresh();
      }
   }
}

