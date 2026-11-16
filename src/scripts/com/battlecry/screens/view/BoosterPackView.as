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
   
   public class BoosterPackView extends ObjectView
   {
      
      private var _boosterPackScreen:BoosterPackScreen;
      
      private var _modelBoosterPack:ModelBoosterPack;
      
      public function BoosterPackView(visual:MovieClip)
      {
         super(visual);
         this.btnBuy.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btnBuy.addEventListener(MouseEvent.MOUSE_DOWN,this.onBuy);
      }
      
      public function get uncommun() : TextField
      {
         return visual.getChildByName("nb_Uncommun") as TextField;
      }
      
      public function setModelBoosterPack(modelBoosterPack:ModelBoosterPack, boosterPackScreen:BoosterPackScreen) : void
      {
         this._modelBoosterPack = modelBoosterPack;
         this._boosterPackScreen = boosterPackScreen;
         this.Refresh();
      }
      
      public function get commun() : TextField
      {
         return visual.getChildByName("nb_Commun") as TextField;
      }
      
      private function onBuy(event:MouseEvent) : void
      {
         var cash:Number = BC_GameProgress.gameProgess.cash;
         if(cash < this._modelBoosterPack.price)
         {
            this.NotEnoughCash();
         }
         else
         {
            (Main.instance.game as BC_Game).BuyBoosterPack(this._modelBoosterPack,this._modelBoosterPack.boosterType);
            BC_GameProgress.gameProgess.cash -= this._modelBoosterPack.price;
         }
         ScreenManager.instance.RefreshAll();
      }
      
      public function get rare() : TextField
      {
         return visual.getChildByName("nb_Rare") as TextField;
      }
      
      public function get legendary() : TextField
      {
         return visual.getChildByName("nb_Legendary") as TextField;
      }
      
      public function get cost() : TextField
      {
         return visual.getChildByName("cost_txt") as TextField;
      }
      
      public function get boosterPack() : MovieClip
      {
         return visual.getChildByName("boosterPack") as MovieClip;
      }
      
      public function get btnBuy() : ButtonSelect
      {
         return visual.getChildByName("btn_buy_booster") as ButtonSelect;
      }
      
      private function GetMoreGold() : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_MTX_SCREEN);
      }
      
      private function onOver(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ROLLOVER);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btnBuy.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBuy);
         this.btnBuy.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.cost.text = this._modelBoosterPack.price + "";
         this.commun.text = "x" + this._modelBoosterPack.nbCommun;
         this.uncommun.text = "x" + this._modelBoosterPack.nbUncommun;
         this.rare.text = "x" + this._modelBoosterPack.nbRare;
         this.legendary.text = "x" + this._modelBoosterPack.nbLegendary;
         this.boosterPack.gotoAndStop(this._modelBoosterPack.visualFrame);
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
   }
}

