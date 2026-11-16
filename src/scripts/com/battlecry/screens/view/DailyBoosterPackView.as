package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.model.ModelBoosterPack;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.BoosterPackScreen;
   import com.battlecry.screens.QuestionScreen;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class DailyBoosterPackView extends ObjectView
   {
      
      private var _boosterPackScreen:BoosterPackScreen;
      
      private var _dailyModelBoosterPack:ModelBoosterPack;
      
      private var _weeklyModelBoosterPack:ModelBoosterPack;
      
      public function DailyBoosterPackView(visual:MovieClip, boosterPackScreen:BoosterPackScreen)
      {
         super(visual);
         this._boosterPackScreen = boosterPackScreen;
         this.btn_buy_daily.addEventListener(MouseEvent.MOUSE_DOWN,this.onBuyDaily);
         this.btn_buy_daily.addEventListener(MouseEvent.MOUSE_DOWN,this.onOver);
         this.btn_buy_weekly.addEventListener(MouseEvent.MOUSE_DOWN,this.onBuyWeekly);
         this.btn_buy_weekly.addEventListener(MouseEvent.MOUSE_DOWN,this.onOver);
      }
      
      public function get weeklyModelBoosterPack() : ModelBoosterPack
      {
         return this._weeklyModelBoosterPack;
      }
      
      private function onBuyWeekly(event:MouseEvent) : void
      {
         var cash:Number = BC_GameProgress.gameProgess.cash;
         if(cash < this._weeklyModelBoosterPack.price)
         {
            this.NotEnoughCash();
         }
         else
         {
            (Main.instance.game as BC_Game).BuyBoosterPack(this._weeklyModelBoosterPack,this._weeklyModelBoosterPack.boosterType);
            BC_GameProgress.gameProgess.cash -= this._weeklyModelBoosterPack.price;
         }
         ScreenManager.instance.RefreshAll();
      }
      
      public function get weeklyRollOver() : MovieClip
      {
         return visual.getChildByName("weeklyRollOver") as MovieClip;
      }
      
      private function onOver(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ROLLOVER);
      }
      
      public function get dailyModelBoosterPack() : ModelBoosterPack
      {
         return this._dailyModelBoosterPack;
      }
      
      private function NotEnoughCash() : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_QUESTION_SCREEN) > 0)
         {
            return;
         }
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_YES_NO,TextFactory.instance.GetMsg(BC_TextFactory.ID_NOT_ENOUGH_CASH),new Callback(this.GetMoreGold,this,null));
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_buy_daily.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBuyDaily);
         this.btn_buy_daily.removeEventListener(MouseEvent.MOUSE_DOWN,this.onOver);
         this.btn_buy_weekly.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBuyWeekly);
         this.btn_buy_weekly.removeEventListener(MouseEvent.MOUSE_DOWN,this.onOver);
      }
      
      public function get daily_cost_txt() : TextField
      {
         return visual.getChildByName("daily_cost_txt") as TextField;
      }
      
      public function SetWeeklyBoosterPack(modelBoosterPack:ModelBoosterPack) : void
      {
         this._weeklyModelBoosterPack = modelBoosterPack;
      }
      
      public function get weeklyIcon() : MovieClip
      {
         return visual.getChildByName("weeklyIcon") as MovieClip;
      }
      
      public function get dailyRollOver() : MovieClip
      {
         return visual.getChildByName("dailyRollOver") as MovieClip;
      }
      
      private function GetMoreGold() : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_MTX_SCREEN);
      }
      
      public function get dailyIcon() : MovieClip
      {
         return visual.getChildByName("dailyIcon") as MovieClip;
      }
      
      public function get btn_buy_weekly() : ButtonSelect
      {
         return visual.getChildByName("btn_buy_weekly") as ButtonSelect;
      }
      
      private function onBuyDaily(event:MouseEvent) : void
      {
         var cash:Number = BC_GameProgress.gameProgess.cash;
         if(cash < this._dailyModelBoosterPack.price)
         {
            this.NotEnoughCash();
         }
         else
         {
            (Main.instance.game as BC_Game).BuyBoosterPack(this._dailyModelBoosterPack,this._dailyModelBoosterPack.boosterType);
            BC_GameProgress.gameProgess.cash -= this._dailyModelBoosterPack.price;
         }
         ScreenManager.instance.RefreshAll();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.dailyIcon.gotoAndStop(this._dailyModelBoosterPack.visualFrame);
         this.daily_cost_txt.text = this._dailyModelBoosterPack.price + "";
         this.weeklyIcon.gotoAndStop(this._weeklyModelBoosterPack.visualFrame);
         this.weekly_cost_txt.text = this._weeklyModelBoosterPack.price + "";
      }
      
      public function get weekly_cost_txt() : TextField
      {
         return visual.getChildByName("weekly_cost_txt") as TextField;
      }
      
      public function get btn_buy_daily() : ButtonSelect
      {
         return visual.getChildByName("btn_buy_daily") as ButtonSelect;
      }
      
      public function SetDailyBoosterPack(modelBoosterPack:ModelBoosterPack) : void
      {
         this._dailyModelBoosterPack = modelBoosterPack;
      }
   }
}

