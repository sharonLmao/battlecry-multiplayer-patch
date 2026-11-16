package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.screens.view.LanguageView;
   import com.battlecry.screens.view.QualityView;
   import com.battlecry.screens.view.SoundsView;
   import com.battlecry.screens.view.TopMenuView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.GamerSafeController;
   import com.lachhhEngine.multilingual.TextFactory;
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   
   public class OptionScreen extends BC_Screen
   {
      
      private var _qualityView:QualityView;
      
      private var _languageView:LanguageView;
      
      private var _armyToLoad:int;
      
      private var _topMenuView:TopMenuView;
      
      private var _soundsView:SoundsView;
      
      public function OptionScreen()
      {
         super();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this._topMenuView.Refresh();
      }
      
      private function onDeleteData(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_QUESTION_SCREEN) > 0)
         {
            return;
         }
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_YES_NO,TextFactory.instance.GetMsg(BC_TextFactory.ID_DO_YOU_WANT_DELETE),new Callback(this.onYesDelete,this,null));
      }
      
      public function get qualityView() : MovieClip
      {
         return visual.getChildByName("qualityView") as MovieClip;
      }
      
      public function get soundsView() : MovieClip
      {
         return visual.getChildByName("soundsView") as MovieClip;
      }
      
      private function onCodex(event:MouseEvent) : void
      {
         Utils.navigateToURLAndRecord(new URLRequest("http://www.berzerk-land.com/forum/viewforum.php?f=24"));
      }
      
      public function get anim() : MovieClip
      {
         return this.loading.getChildByName("anim") as MovieClip;
      }
      
      private function onYesDelete() : void
      {
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_YES_NO,TextFactory.instance.GetMsg(BC_TextFactory.ID_ARE_YOU_SURE_YOU_WANT_TO_DELETE),new Callback(this.onDelete,this,null));
      }
      
      public function get loading() : MovieClip
      {
         return visual.getChildByName("loading") as MovieClip;
      }
      
      public function get btn_BackToTitle() : ButtonSelect
      {
         return visual.getChildByName("btn_BackToTitle") as ButtonSelect;
      }
      
      public function get btn_Credits() : ButtonSelect
      {
         return visual.getChildByName("btn_Credits") as ButtonSelect;
      }
      
      public function get btn_DeleteData() : ButtonSelect
      {
         return visual.getChildByName("btn_DeleteData") as ButtonSelect;
      }
      
      public function get topMenuView() : MovieClip
      {
         return visual.getChildByName("TopMenuView") as MovieClip;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         if(this._languageView)
         {
            this._languageView.Destroy();
         }
         if(this._qualityView)
         {
            this._qualityView.Destroy();
         }
         this._topMenuView.Destroy();
         this.btn_Credits.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCredits);
         this.btn_Codex.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCodex);
         this.btn_BackToTitle.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBack);
      }
      
      public function get languageView() : MovieClip
      {
         return visual.getChildByName("languageView") as MovieClip;
      }
      
      private function onBack(event:MouseEvent) : void
      {
         BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_TITLE_SCREEN);
      }
      
      public function get btn_Codex() : ButtonSelect
      {
         return visual.getChildByName("btn_Codex") as ButtonSelect;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(this.anim)
         {
            this.anim.play();
         }
      }
      
      private function onDelete() : void
      {
         this.loading.visible = true;
         this.LoadAllArmy();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._languageView = new LanguageView(this.languageView);
         this._qualityView = new QualityView(this.qualityView);
         this._soundsView = new SoundsView(this.soundsView);
         this._topMenuView = new TopMenuView(this.topMenuView,this);
         this._topMenuView.SetCurrentScreen(BC_ScreenFactory.ID_OPTION_SCREEN);
         InitOkBtn(this.btn_Credits);
         this.btn_Credits.addEventListener(MouseEvent.MOUSE_DOWN,this.onCredits);
         InitOkBtn(this.btn_Codex);
         this.btn_Codex.addEventListener(MouseEvent.MOUSE_DOWN,this.onCodex);
         InitOkBtn(this.btn_BackToTitle);
         this.btn_BackToTitle.addEventListener(MouseEvent.MOUSE_DOWN,this.onBack);
         InitOkBtn(this.btn_DeleteData);
         this.btn_DeleteData.addEventListener(MouseEvent.MOUSE_DOWN,this.onDeleteData);
         this.loading.visible = false;
         this._armyToLoad = 0;
         this.Refresh();
      }
      
      private function onCredits(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_CREDIT_SCREEN) > 0)
         {
            return;
         }
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_CREDIT_SCREEN,false,true);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_OPTION_SCREEN);
      }
      
      private function LoadAllArmy() : void
      {
         ++this._armyToLoad;
         if(this._armyToLoad <= 4)
         {
            if(BC_GameProgress.gameProgess.getArmy(this._armyToLoad).multiPlayerActivated <= 0)
            {
               this.LoadAllArmy();
            }
            else
            {
               PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.deleteKeys("ArmyList",[Main.instance.GetPIOid() + "_army" + this._armyToLoad],this.LoadAllArmy,this.LoadAllArmy);
            }
            return;
         }
         if(this._armyToLoad == 5)
         {
            if(BC_GameProgress.gameProgess.getArmy(this._armyToLoad).multiPlayerActivated <= 0)
            {
               this.LoadAllArmy();
            }
            else
            {
               PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.deleteKeys("ArmyListSmall",[Main.instance.GetPIOid() + "_army" + this._armyToLoad],this.LoadAllArmy,this.LoadAllArmy);
            }
            return;
         }
         BC_GameProgress.gameProgess.ClearAllProgress();
         BC_Game.instance.Save();
         GamerSafeController.BC_ClearIdentity();
         this.loading.visible = false;
         this.onBack(null);
      }
   }
}

