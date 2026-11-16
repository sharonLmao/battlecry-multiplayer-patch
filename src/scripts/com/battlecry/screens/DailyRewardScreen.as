package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.model.ModelBoosterPackEnum;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class DailyRewardScreen extends BC_Screen
   {
      
      private var _dailyStage:int;
      
      private var _gifted:Boolean;
      
      public function DailyRewardScreen()
      {
         super();
      }
      
      override protected function get idleFrame() : int
      {
         return 25;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_DAILYREWARD_SCREEN);
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         this.BotPanel.gotoAndStop(this._dailyStage);
      }
      
      public function get btn_Close() : MovieClip
      {
         return this.panelClose.getChildByName("btn_Close") as ButtonSelect;
      }
      
      public function get TopPanel() : MovieClip
      {
         return visual.getChildByName("TopPanel") as MovieClip;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._gifted = false;
         InitOkBtn(this.btn_Close);
         this.btn_Close.addEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         InitOkBtn(this.btn_X);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         this._dailyStage = BC_GameProgress.gameProgess.dailyStage;
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         var g:GoldRewardScreen = null;
         super.ShowIdle(context);
         if(!this._gifted)
         {
            this._gifted = true;
            if(this._dailyStage <= 4)
            {
               g = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_GOLDREWARD_SCREEN,false,true) as GoldRewardScreen;
               switch(this._dailyStage)
               {
                  case 1:
                     g.SetReward(250);
                     break;
                  case 2:
                     g.SetReward(500);
                     break;
                  case 3:
                     g.SetReward(1000);
                     break;
                  case 4:
                     g.SetReward(2000);
               }
            }
            else
            {
               BC_Game.instance.BuyBoosterPack(ModelBoosterPackEnum.PRIME_DAILY_REWARD,0);
            }
         }
      }
      
      public function get panelClose() : MovieClip
      {
         return visual.getChildByName("panelClose") as MovieClip;
      }
      
      override protected function get closeFrame() : int
      {
         return 35;
      }
      
      public function get btn_X() : ButtonSelect
      {
         return this.TopPanel.getChildByName("btn_X") as ButtonSelect;
      }
      
      private function onClose(event:MouseEvent) : void
      {
         if(!this._gifted)
         {
            return;
         }
         Close(true,null,false);
         BC_Game.instance.Save();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_Close.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         this.btn_X.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
      }
      
      public function get BotPanel() : MovieClip
      {
         return visual.getChildByName("BotPanel") as MovieClip;
      }
   }
}

