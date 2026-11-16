package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.model.ModelTutorialEnum;
   import com.battlecry.screens.view.FlagSetView;
   import com.battlecry.screens.view.TopMenuView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class FlagScreen extends BC_Screen
   {
      
      private var _showTutorial:Boolean;
      
      private var _topMenuView:TopMenuView;
      
      private var _flagSetView:FlagSetView;
      
      public function FlagScreen()
      {
         super();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._flagSetView.ClearAllSelection();
         this._flagSetView.Destroy();
         this._topMenuView.Destroy();
         this.btnSaveFlag.removeEventListener(MouseEvent.MOUSE_DOWN,this.onSaveFlag);
      }
      
      public function get flagSetView() : MovieClip
      {
         return visual.getChildByName("flagSetView") as MovieClip;
      }
      
      public function get btnSaveFlag() : ButtonSelect
      {
         return visual.getChildByName("btn_saveFlag") as ButtonSelect;
      }
      
      private function onSaveFlag(event:MouseEvent) : void
      {
         BC_GameProgress.gameProgess.metaFlag.Copy(this._flagSetView.metaFlag);
         BC_Game.instance.Save();
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         this._flagSetView.Update();
         if(!this._showTutorial)
         {
            this._showTutorial = true;
            BC_GameProgress.gameProgess.tutorialManager.ShowTutorial(ModelTutorialEnum.TUTORIAL_BANNER);
            this._topMenuView.InitGlow();
         }
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_FLAG_SCREEN);
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._topMenuView = new TopMenuView(this.topMenuView,this);
         this._topMenuView.SetCurrentScreen(BC_ScreenFactory.ID_FLAG_SCREEN);
         this._showTutorial = false;
         InitOkBtn(this.btnSaveFlag);
         this.btnSaveFlag.addEventListener(MouseEvent.MOUSE_DOWN,this.onSaveFlag);
         this._flagSetView = new FlagSetView(this.flagSetView);
         animation.playChildren = false;
         Jukebox.instance.FadeToMusic(BC_SfxFactory.ID_MUSIC_UI_ARMY);
      }
      
      public function get topMenuView() : MovieClip
      {
         return visual.getChildByName("TopMenuView") as MovieClip;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this._topMenuView.Refresh();
      }
   }
}

