package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class Tutorial_Multiplayer_Screen extends BC_Screen
   {
      
      private var _rankMeterTutoScreen:RankMeterTutoScreen;
      
      private var _stage:int;
      
      public function Tutorial_Multiplayer_Screen()
      {
         super();
      }
      
      public function get armyRank() : TextField
      {
         return visual.getChildByName("armyRank") as TextField;
      }
      
      public function get armyRankIcon() : MovieClip
      {
         return visual.getChildByName("armyRankIcon") as MovieClip;
      }
      
      public function get rankingName() : TextField
      {
         return visual.getChildByName("rankingName") as TextField;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         visual.gotoAndStop(this._stage);
         switch(this._stage)
         {
            case 6:
               this.armyRankIcon.gotoAndStop(1);
               this.armyRank.text = "1";
               this.rankingName.text = TextFactory.instance.GetMsg(BC_GameProgress.gameProgess.metaArmy1.GetRankName(1));
               break;
            case 8:
               break;
            case 9:
               if(this._rankMeterTutoScreen.isFinished)
               {
                  this._stage = 10;
               }
               break;
            case 13:
               this.Close(true,null,false);
         }
      }
      
      private function onNextTuto(event:MouseEvent) : void
      {
         if(this._stage == 8)
         {
            if(this._rankMeterTutoScreen == null)
            {
               this._rankMeterTutoScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_RANKMETER_TUTO_SCREEN,false,true) as RankMeterTutoScreen;
            }
            ++this._stage;
            return;
         }
         if(this._stage == 9)
         {
            if(Boolean(this._rankMeterTutoScreen) && this._rankMeterTutoScreen.isIdle)
            {
               this._rankMeterTutoScreen.Close(true,null,false);
            }
            return;
         }
         ++this._stage;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._rankMeterTutoScreen = null;
         this._stage = 1;
         InitOkBtn(this.btn_NextTuto);
         this.btn_NextTuto.addEventListener(MouseEvent.MOUSE_DOWN,this.onNextTuto);
         animation.playChildren = false;
      }
      
      public function get btn_NextTuto() : ButtonSelect
      {
         return visual.getChildByName("btn_NextTuto") as ButtonSelect;
      }
      
      override public function Close(remove:Boolean, c:Callback, quickClose:Boolean) : void
      {
         super.Close(remove,c,quickClose);
         BC_Game.instance.Save();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_NextTuto.removeEventListener(MouseEvent.MOUSE_DOWN,this.onNextTuto);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_TUTORIAL_MULTIPLAYER_SCREEN);
      }
   }
}

