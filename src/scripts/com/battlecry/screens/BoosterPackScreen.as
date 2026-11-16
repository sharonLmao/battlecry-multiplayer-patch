package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.ServerUtils;
   import com.battlecry.meta.model.ModelBoosterPack;
   import com.battlecry.meta.model.ModelBoosterPackEnum;
   import com.battlecry.meta.model.ModelTutorialEnum;
   import com.battlecry.screens.view.BoosterPackSetView;
   import com.battlecry.screens.view.TopMenuView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class BoosterPackScreen extends BC_Screen
   {
      
      private var _topMenuView:TopMenuView;
      
      private var _dailyPack:ModelBoosterPack;
      
      private var _showTutorial:Boolean;
      
      private var _weeklyPack:ModelBoosterPack;
      
      private var _currentSelectedSet:int;
      
      private var _boosterPackSetView:BoosterPackSetView;
      
      public function BoosterPackScreen()
      {
         super();
      }
      
      public function get boosterPackRightGlow() : MovieClip
      {
         return visual.getChildByName("boosterPackRightGlow") as MovieClip;
      }
      
      public function get weeklyPack() : ModelBoosterPack
      {
         return this._weeklyPack;
      }
      
      private function InitDaily() : void
      {
         var i:int = 0;
         var a:Array = new Array();
         for(i = 0; i < ModelBoosterPackEnum.DAILY.length; i++)
         {
            a[i] = ModelBoosterPackEnum.DAILY[i];
         }
         var weeklyIndex:int = ServerUtils.serverMonth % 12;
         this._weeklyPack = a[weeklyIndex];
         a.splice(weeklyIndex,1);
         var monthDay:Array = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
         var numDay:int = ServerUtils.serverDay;
         for(i = 0; i < ServerUtils.serverMonth; i++)
         {
            numDay += monthDay[i];
         }
         var dailyIndex:int = numDay % a.length;
         this._dailyPack = a[dailyIndex];
      }
      
      private function onPreviousSet(event:MouseEvent) : void
      {
         var prct:Number = NaN;
         --this._currentSelectedSet;
         if(this._currentSelectedSet < 1)
         {
            this._currentSelectedSet = ModelBoosterPackEnum.ALL_SET.length - 1;
         }
         BC_GameProgress.gameProgess.metaCampaignProgress.boosterGlow = 1;
         this.InitGlow();
         if(this._currentSelectedSet == 1)
         {
            prct = 0;
         }
         else if(this._currentSelectedSet == 2)
         {
            if(BC_Game.instance.isConnected)
            {
               prct = 0.47;
            }
            else
            {
               prct = 0.44;
            }
         }
         else if(BC_Game.instance.isConnected)
         {
            prct = 0.83;
         }
         else
         {
            prct = 0.8;
         }
         this._boosterPackSetView.SetScrollBarPrct(prct);
         this.Refresh();
      }
      
      public function get boosterPackView() : MovieClip
      {
         return visual.getChildByName("boosterPackView") as MovieClip;
      }
      
      private function onNextSet(event:MouseEvent) : void
      {
         var prct:Number = NaN;
         ++this._currentSelectedSet;
         if(this._currentSelectedSet >= ModelBoosterPackEnum.ALL_SET.length)
         {
            this._currentSelectedSet = 1;
         }
         BC_GameProgress.gameProgess.metaCampaignProgress.boosterGlow = 1;
         this.InitGlow();
         if(this._currentSelectedSet == 1)
         {
            prct = 0;
         }
         else if(this._currentSelectedSet == 2)
         {
            if(BC_Game.instance.isConnected)
            {
               prct = 0.47;
            }
            else
            {
               prct = 0.44;
            }
         }
         else if(BC_Game.instance.isConnected)
         {
            prct = 0.83;
         }
         else
         {
            prct = 0.8;
         }
         this._boosterPackSetView.SetScrollBarPrct(prct);
         this.Refresh();
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         super.ShowIdle(context);
      }
      
      public function get dailyPack() : ModelBoosterPack
      {
         return this._dailyPack;
      }
      
      public function get currentSelectedSet() : int
      {
         return this._currentSelectedSet;
      }
      
      public function get SetTxt() : TextField
      {
         return visual.getChildByName("SetTxt") as TextField;
      }
      
      public function set weeklyPack(weeklyPack:ModelBoosterPack) : void
      {
         this._weeklyPack = weeklyPack;
      }
      
      public function get topMenuView() : MovieClip
      {
         return visual.getChildByName("TopMenuView") as MovieClip;
      }
      
      public function set currentSelectedSet(currentSelectedSet:int) : void
      {
         this._currentSelectedSet = currentSelectedSet;
      }
      
      public function InitGlow() : void
      {
         this.boosterPackLeftGlow.visible = false;
         this.boosterPackRightGlow.visible = false;
         if(BC_GameProgress.gameProgess.metaCampaignProgress.boosterGlow == 0)
         {
            this.boosterPackLeftGlow.visible = true;
            this.boosterPackRightGlow.visible = true;
         }
      }
      
      public function set dailyPack(dailyPack:ModelBoosterPack) : void
      {
         this._dailyPack = dailyPack;
      }
      
      public function get btn_PreviousSet() : ButtonSelect
      {
         return visual.getChildByName("btn_PreviousSet") as ButtonSelect;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(!this._showTutorial)
         {
            this._showTutorial = true;
            BC_GameProgress.gameProgess.tutorialManager.ShowTutorial(ModelTutorialEnum.TUTORIAL_BOOSTER);
            this._topMenuView.InitGlow();
         }
         this._boosterPackSetView.Update();
      }
      
      public function get btn_NextSet() : ButtonSelect
      {
         return visual.getChildByName("btn_NextSet") as ButtonSelect;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._boosterPackSetView.Destroy();
         this._topMenuView.Destroy();
         this.btn_PreviousSet.removeEventListener(MouseEvent.MOUSE_DOWN,this.onPreviousSet);
         this.btn_NextSet.removeEventListener(MouseEvent.MOUSE_DOWN,this.onNextSet);
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._currentSelectedSet = 1;
         this._showTutorial = false;
         this.InitDaily();
         this._boosterPackSetView = new BoosterPackSetView(this.boosterPackView,this);
         this._boosterPackSetView.Init(ModelBoosterPackEnum.ALL);
         this._boosterPackSetView.Refresh();
         this._topMenuView = new TopMenuView(this.topMenuView,this);
         this._topMenuView.SetCurrentScreen(BC_ScreenFactory.ID_BOOSTERPACK_SCREEN);
         InitOkBtn(this.btn_PreviousSet);
         this.btn_PreviousSet.addEventListener(MouseEvent.MOUSE_DOWN,this.onPreviousSet);
         InitOkBtn(this.btn_NextSet);
         this.btn_NextSet.addEventListener(MouseEvent.MOUSE_DOWN,this.onNextSet);
         if(ModelBoosterPackEnum.ALL_SET.length <= 1)
         {
            this.btn_PreviousSet.visible = false;
            this.btn_NextSet.visible = false;
         }
         this.InitGlow();
         Jukebox.instance.FadeToMusic(BC_SfxFactory.ID_MUSIC_UI_ARMY);
         this.Refresh();
      }
      
      public function get boosterPackLeftGlow() : MovieClip
      {
         return visual.getChildByName("boosterPackLeftGlow") as MovieClip;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this._topMenuView.Refresh();
         this.SetTxt.text = TextFactory.instance.GetMsg(ModelBoosterPackEnum.ALL_SET_TEXT[this._currentSelectedSet]);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_BOOSTERPACK_SCREEN);
      }
   }
}

