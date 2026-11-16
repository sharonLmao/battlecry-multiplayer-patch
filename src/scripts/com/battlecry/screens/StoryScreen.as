package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GamePrefs;
   import com.battlecry.io.BC_GameProgress;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.files.FileManager;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class StoryScreen extends LoadGameScreen
   {
      
      private var _initialTxtY:Number;
      
      private var _currentPage:int;
      
      public function StoryScreen()
      {
         super();
      }
      
      private function CacheAllAsBitmap(mc:MovieClip) : void
      {
         mc.cacheAsBitmap = true;
         for(var i:int = 0; i < mc.numChildren; i++)
         {
            if(mc.getChildAt(i) as MovieClip)
            {
               this.CacheAllAsBitmap(mc.getChildAt(i) as MovieClip);
            }
         }
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(this.loading)
         {
            RecurPlay(this.loading);
         }
         if(CheckAllLoaded())
         {
            this.loading.visible = false;
            this.btn_fight.visible = true;
         }
         if(this.textAnim.currentFrame >= 2)
         {
            this.textAnim.play();
         }
         if(this.textAnim.currentFrame == 1 || this.textAnim.currentFrame >= 10)
         {
            this.storyTxt.text = TextFactory.instance.GetMsg(BC_Game.instance.currentCampaign.storyArray[this._currentPage - 1]);
         }
         if(this.textAnim.currentFrame >= 20)
         {
            this.textAnim.gotoAndStop(1);
         }
         this.textAnim.y = this._initialTxtY;
         this.textAnim.y += Math.abs((this.storyTxt.height - this.storyTxt.textHeight) / 2);
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         if(BC_Game.instance.currentCampaign.storyArray.length <= 1)
         {
            this.storyPagination.visible = false;
         }
         this.storyMC.gotoAndStop(BC_Game.instance.currentCampaign.campaignIcon);
         this.CacheAllAsBitmap(this.storyMC);
         this.currentPage.text = this._currentPage + "";
         this.MaxPage.text = BC_Game.instance.currentCampaign.storyArray.length + "";
         if(this._currentPage <= 1)
         {
            this.btn_PreviousPage.Select();
         }
         else
         {
            this.btn_PreviousPage.Deselect();
         }
         if(this._currentPage >= BC_Game.instance.currentCampaign.storyArray.length)
         {
            this.btn_NextPage.Select();
         }
         else
         {
            this.btn_NextPage.Deselect();
         }
         if(this.gamePrefs.musicVolume <= 1)
         {
            this.btn_Sound.Select();
         }
         else
         {
            this.btn_Sound.Deselect();
         }
      }
      
      private function CacheAllAsBitmapFalse(mc:MovieClip) : void
      {
         mc.cacheAsBitmap = false;
         for(var i:int = 0; i < mc.numChildren; i++)
         {
            if(mc.getChildAt(i) as MovieClip)
            {
               this.CacheAllAsBitmapFalse(mc.getChildAt(i) as MovieClip);
            }
         }
      }
      
      public function get btn_NextPage() : ButtonSelect
      {
         return this.storyPagination.getChildByName("btn_NextPage") as ButtonSelect;
      }
      
      public function get btn_PreviousPage() : ButtonSelect
      {
         return this.storyPagination.getChildByName("btn_PreviousPage") as ButtonSelect;
      }
      
      public function get storyMC() : MovieClip
      {
         return visual.getChildByName("storyMC") as MovieClip;
      }
      
      public function get btn_Sound() : ButtonSelect
      {
         return visual.getChildByName("btn_Sound") as ButtonSelect;
      }
      
      public function get loading() : MovieClip
      {
         return visual.getChildByName("loading") as MovieClip;
      }
      
      override protected function get closeFrame() : int
      {
         return 2;
      }
      
      override public function Destroy() : void
      {
         this.CacheAllAsBitmapFalse(this.storyMC);
         super.Destroy();
         this.btn_fight.removeEventListener(MouseEvent.MOUSE_DOWN,this.onFight);
         this.btn_PreviousPage.removeEventListener(MouseEvent.MOUSE_DOWN,this.onPrevious);
         this.btn_NextPage.removeEventListener(MouseEvent.MOUSE_DOWN,this.onNext);
         this.btn_Sound.removeEventListener(MouseEvent.MOUSE_DOWN,this.onSound);
      }
      
      public function get textAnim() : MovieClip
      {
         return visual.getChildByName("textAnim") as MovieClip;
      }
      
      private function get gamePrefs() : BC_GamePrefs
      {
         return FileManager.instance.gamePrefs as BC_GamePrefs;
      }
      
      public function get currentPage() : TextField
      {
         return this.storyPagination.getChildByName("currentPage") as TextField;
      }
      
      public function get btn_fight() : ButtonSelect
      {
         return visual.getChildByName("btn_fight") as ButtonSelect;
      }
      
      public function get storyPagination() : MovieClip
      {
         return visual.getChildByName("storyPagination") as MovieClip;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         BC_GameProgress.gameProgess.firstPlay = 1;
         this._currentPage = 1;
         InitOkBtn(this.btn_fight);
         this.btn_fight.addEventListener(MouseEvent.MOUSE_DOWN,this.onFight);
         InitOkBtn(this.btn_PreviousPage);
         this.btn_PreviousPage.addEventListener(MouseEvent.MOUSE_DOWN,this.onPrevious);
         InitOkBtn(this.btn_NextPage);
         this.btn_NextPage.addEventListener(MouseEvent.MOUSE_DOWN,this.onNext);
         InitOkBtn(this.btn_Sound);
         this.btn_Sound.addEventListener(MouseEvent.MOUSE_DOWN,this.onSound);
         this.loading.visible = true;
         this.btn_fight.visible = false;
         this._initialTxtY = this.textAnim.y;
         animation.playChildren = false;
         this.textAnim.gotoAndStop(1);
         this.Refresh();
      }
      
      public function get mcStoryTxt() : MovieClip
      {
         return this.textAnim.getChildByName("mcStoryTxt") as MovieClip;
      }
      
      private function onNext(event:MouseEvent) : void
      {
         if(this.btn_NextPage.isSelected)
         {
            return;
         }
         ++this._currentPage;
         this.textAnim.gotoAndPlay(2);
         this.Refresh();
      }
      
      private function onPrevious(event:MouseEvent) : void
      {
         if(this.btn_PreviousPage.isSelected)
         {
            return;
         }
         --this._currentPage;
         this.textAnim.gotoAndPlay(2);
         this.Refresh();
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
      
      private function onFight(event:MouseEvent) : void
      {
         Close(true,null,false);
         Main.instance.LaunchGame();
         (FileManager.instance.main.game as BC_Game).InitRoundManager(BC_GameProgress.gameProgess.CurrentSelectedArmy(),metaArmy);
      }
      
      override protected function get idleFrame() : int
      {
         return 1;
      }
      
      public function get MaxPage() : TextField
      {
         return this.storyPagination.getChildByName("MaxPage") as TextField;
      }
      
      public function get storyTxt() : TextField
      {
         return this.mcStoryTxt.getChildByName("storyTxt") as TextField;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_STORY_SCREEN);
      }
   }
}

