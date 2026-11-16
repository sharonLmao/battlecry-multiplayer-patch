package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.model.ModelTutorialEnum;
   import com.battlecry.screens.BC_Screen;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class TopMenuView extends ObjectView
   {
      
      private var _currentScreen:BC_Screen;
      
      private var _buttonSelect:ButtonSelectGroup = new ButtonSelectGroup();
      
      public function TopMenuView(visual:DisplayObjectContainer, currentScreen:BC_Screen)
      {
         super(visual);
         this._currentScreen = currentScreen;
         this.btn_Option.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_Option.addEventListener(MouseEvent.MOUSE_DOWN,this.onOption);
         this.btn_army.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_army.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy);
         this.btn_collection.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_collection.addEventListener(MouseEvent.MOUSE_DOWN,this.onCollection);
         this.btn_flag.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_flag.addEventListener(MouseEvent.MOUSE_DOWN,this.onFlag);
         this.btn_BoosterPack.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_BoosterPack.addEventListener(MouseEvent.MOUSE_DOWN,this.onBoosterPack);
         this.btn_campaign.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_campaign.addEventListener(MouseEvent.MOUSE_DOWN,this.onCampaign);
         this.btn_battlefield.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_battlefield.addEventListener(MouseEvent.MOUSE_DOWN,this.onBattleField);
         this.btn_plus.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_plus.addEventListener(MouseEvent.MOUSE_DOWN,this.onPlus);
         this._buttonSelect = new ButtonSelectGroup();
         this._buttonSelect.AddButton(this.btn_Option);
         this._buttonSelect.AddButton(this.btn_army);
         this._buttonSelect.AddButton(this.btn_collection);
         this._buttonSelect.AddButton(this.btn_flag);
         this._buttonSelect.AddButton(this.btn_BoosterPack);
         this._buttonSelect.AddButton(this.btn_campaign);
         this._buttonSelect.AddButton(this.btn_battlefield);
         this._buttonSelect.AddButton(this.btn_plus);
         this.btn_BoosterLock.visible = false;
         this.btn_BattleFieldLock.visible = false;
         this.btn_flagLock.visible = false;
         this.btn_collectionLock.visible = false;
         this.InitLock();
         this.InitGlow();
         this.Refresh();
      }
      
      public function InitLock() : void
      {
         this.btn_BoosterLock.visible = false;
         this.btn_BattleFieldLock.visible = false;
         this.btn_flagLock.visible = false;
         this.btn_collectionLock.visible = false;
         this.btn_BoosterPack.visible = true;
         this.btn_battlefield.visible = true;
         this.btn_flag.visible = true;
      }
      
      private function onBattleField(event:MouseEvent) : void
      {
         if(this.btn_battlefield.isSelected)
         {
            return;
         }
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_BATTLESELECTION_SCREEN) > 0)
         {
            return;
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         if(BC_VersionInfo.isArmorGames)
         {
            if(BC_VersionInfo.armorGamesController.loggedIn)
            {
               BC_Game.instance.TransitionTo(this._currentScreen,BC_ScreenFactory.ID_BATTLESELECTION_SCREEN);
            }
            return;
         }
         BC_Game.instance.TransitionTo(this._currentScreen,BC_ScreenFactory.ID_BATTLESELECTION_SCREEN);
      }
      
      public function get btn_BoosterPack() : ButtonSelect
      {
         return visual.getChildByName("btn_BoosterPack") as ButtonSelect;
      }
      
      private function onCampaign(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_CAMPAIGN_SCREEN) > 0)
         {
            return;
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_Game.instance.TransitionTo(this._currentScreen,BC_ScreenFactory.ID_CAMPAIGN_SCREEN);
      }
      
      public function get moneyTxt() : TextField
      {
         return visual.getChildByName("moneyTxt") as TextField;
      }
      
      private function onOver(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ROLLOVER);
      }
      
      public function get btn_Option() : ButtonSelect
      {
         return visual.getChildByName("btn_Option") as ButtonSelect;
      }
      
      private function onPlus(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_MTX_SCREEN) > 0)
         {
            return;
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_MTX_SCREEN);
      }
      
      private function onArmy(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_ARMYCREATION_SCREEN) > 0)
         {
            return;
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_Game.instance.TransitionTo(this._currentScreen,BC_ScreenFactory.ID_ARMYCREATION_SCREEN);
      }
      
      private function onCollection(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_COLLECTION_SCREEN) > 0)
         {
            return;
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_Game.instance.TransitionTo(this._currentScreen,BC_ScreenFactory.ID_COLLECTION_SCREEN);
      }
      
      public function get btn_BoosterLock() : ButtonSelect
      {
         return visual.getChildByName("btn_BoosterLock") as ButtonSelect;
      }
      
      public function get btn_army() : ButtonSelect
      {
         return visual.getChildByName("btn_army") as ButtonSelect;
      }
      
      public function get btn_collection() : ButtonSelect
      {
         return visual.getChildByName("btn_collection") as ButtonSelect;
      }
      
      public function get btn_campaign() : ButtonSelect
      {
         return visual.getChildByName("btn_campaign") as ButtonSelect;
      }
      
      public function SetCurrentScreen(currentScreen:int) : void
      {
         switch(currentScreen)
         {
            case BC_ScreenFactory.ID_OPTION_SCREEN:
               this.btn_Option.Select();
               break;
            case BC_ScreenFactory.ID_ARMYCREATION_SCREEN:
               this.btn_army.Select();
               break;
            case BC_ScreenFactory.ID_COLLECTION_SCREEN:
               this.btn_collection.Select();
               break;
            case BC_ScreenFactory.ID_FLAG_SCREEN:
               this.btn_flag.Select();
               break;
            case BC_ScreenFactory.ID_BOOSTERPACK_SCREEN:
               this.btn_BoosterPack.Select();
               break;
            case BC_ScreenFactory.ID_CAMPAIGN_SCREEN:
               this.btn_campaign.Select();
               break;
            case BC_ScreenFactory.ID_BATTLESELECTION_SCREEN:
               this.btn_battlefield.Select();
         }
      }
      
      public function InitGlow() : void
      {
         this.flagGlow.visible = false;
         this.boosterGlow.visible = false;
         this.battlefieldGlow.visible = false;
         if(!BC_Game.instance.IsInFirstAct())
         {
            if(!BC_GameProgress.gameProgess.tutorialManager.HasBeenShown(ModelTutorialEnum.TUTORIAL_BANNER))
            {
               this.flagGlow.visible = true;
            }
            if(!BC_GameProgress.gameProgess.tutorialManager.HasBeenShown(ModelTutorialEnum.TUTORIAL_BOOSTER))
            {
               this.boosterGlow.visible = true;
            }
         }
      }
      
      public function get btn_battlefield() : ButtonSelect
      {
         return visual.getChildByName("btn_battlefield") as ButtonSelect;
      }
      
      public function get flagGlow() : MovieClip
      {
         return visual.getChildByName("flagGlow") as MovieClip;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_Option.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_Option.removeEventListener(MouseEvent.MOUSE_DOWN,this.onOption);
         this.btn_army.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_army.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArmy);
         this.btn_collection.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_collection.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCollection);
         this.btn_flag.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_flag.removeEventListener(MouseEvent.MOUSE_DOWN,this.onFlag);
         this.btn_BoosterPack.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_BoosterPack.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBoosterPack);
         this.btn_campaign.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_campaign.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCampaign);
         this.btn_battlefield.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_battlefield.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBattleField);
         this.btn_plus.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_plus.removeEventListener(MouseEvent.MOUSE_DOWN,this.onPlus);
      }
      
      private function onBoosterPack(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_BOOSTERPACK_SCREEN) > 0)
         {
            return;
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_Game.instance.TransitionTo(this._currentScreen,BC_ScreenFactory.ID_BOOSTERPACK_SCREEN);
      }
      
      private function onFlag(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_FLAG_SCREEN) > 0)
         {
            return;
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_Game.instance.TransitionTo(this._currentScreen,BC_ScreenFactory.ID_FLAG_SCREEN);
      }
      
      public function get btn_collectionLock() : ButtonSelect
      {
         return visual.getChildByName("btn_collectionLock") as ButtonSelect;
      }
      
      public function get btn_flag() : ButtonSelect
      {
         return visual.getChildByName("btn_flag") as ButtonSelect;
      }
      
      public function get btn_BattleFieldLock() : ButtonSelect
      {
         return visual.getChildByName("btn_BattleFieldLock") as ButtonSelect;
      }
      
      private function onOption(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_OPTION_SCREEN) > 0)
         {
            return;
         }
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_Game.instance.TransitionTo(this._currentScreen,BC_ScreenFactory.ID_OPTION_SCREEN);
      }
      
      public function get btn_plus() : ButtonSelect
      {
         return visual.getChildByName("btn_plus") as ButtonSelect;
      }
      
      public function get battlefieldGlow() : MovieClip
      {
         return visual.getChildByName("battlefieldGlow") as MovieClip;
      }
      
      public function get btn_flagLock() : ButtonSelect
      {
         return visual.getChildByName("btn_flagLock") as ButtonSelect;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.moneyTxt.text = BC_GameProgress.gameProgess.cash + "";
      }
      
      public function get boosterGlow() : MovieClip
      {
         return visual.getChildByName("boosterGlow") as MovieClip;
      }
   }
}

