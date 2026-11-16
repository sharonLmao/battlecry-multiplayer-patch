package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.model.ModelCampaign;
   import com.battlecry.screens.ArmySelectScreen;
   import com.battlecry.screens.BC_Screen;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class CampaignView extends ObjectView
   {
      
      private var _campaignRewardView:CampaignRewardView;
      
      private var _modelCampaign:ModelCampaign;
      
      private var _screenToClose:BC_Screen;
      
      public function CampaignView(visual:DisplayObjectContainer, screenToClose:BC_Screen)
      {
         super(visual);
         this._screenToClose = screenToClose;
         this._campaignRewardView = new CampaignRewardView(this.mcReward);
         this.btn_Fight.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_Fight.addEventListener(MouseEvent.MOUSE_DOWN,this.onFight);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._campaignRewardView.Destroy();
         this.btn_Fight.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_Fight.removeEventListener(MouseEvent.MOUSE_DOWN,this.onFight);
      }
      
      public function get campaignName() : TextField
      {
         return visual.getChildByName("campaignName") as TextField;
      }
      
      public function get mcReward() : MovieClip
      {
         return visual.getChildByName("mcReward") as MovieClip;
      }
      
      public function get smallPic() : MovieClip
      {
         return visual.getChildByName("smallPic") as MovieClip;
      }
      
      public function get btn_Fight() : ButtonSelect
      {
         return visual.getChildByName("btn_Fight") as ButtonSelect;
      }
      
      private function onFight(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         BC_Game.instance.currentCampaign = this._modelCampaign;
         var a:ArmySelectScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ARMYSELECT_SCREEN) as ArmySelectScreen;
         a.SetScreenToClose(this._screenToClose);
      }
      
      private function onOver(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ROLLOVER);
      }
      
      public function SetModelCampaign(modelCampaign:ModelCampaign) : void
      {
         this._modelCampaign = modelCampaign;
         this._campaignRewardView.SetModelCampaign(modelCampaign);
         this.Refresh();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.btn_Fight.visible = true;
         if(this._modelCampaign.campaignStage < BC_GameProgress.gameProgess.metaCampaignProgress.GetCurrentCampaignLvl())
         {
            visualMc.gotoAndStop(1);
         }
         else if(this._modelCampaign.campaignStage == BC_GameProgress.gameProgess.metaCampaignProgress.GetCurrentCampaignLvl())
         {
            visualMc.gotoAndStop(2);
         }
         else
         {
            visualMc.gotoAndStop(3);
            this.btn_Fight.visible = false;
         }
         this.campaignName.text = TextFactory.instance.GetMsg(this._modelCampaign.campaignName);
         this.smallPic.gotoAndStop(this._modelCampaign.campaignIcon);
      }
   }
}

