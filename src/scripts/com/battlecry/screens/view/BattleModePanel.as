package com.battlecry.screens.view
{
   import com.battlecry.screens.BattleSelectionScreen;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   
   public class BattleModePanel extends BattleSelectionPanel
   {
      
      public function BattleModePanel(visual:DisplayObjectContainer, battleSelectionScreen:BattleSelectionScreen)
      {
         super(visual,battleSelectionScreen);
         this.btn_Classic1000.addEventListener(MouseEvent.MOUSE_DOWN,this.onClassic1000);
         this.btn_Classic500.addEventListener(MouseEvent.MOUSE_DOWN,this.onClassic500);
         this.btn_SurvivalCoop.addEventListener(MouseEvent.MOUSE_DOWN,this.onSurvivalCoop);
         this.btn_Tournament.addEventListener(MouseEvent.MOUSE_DOWN,this.onTournament);
      }
      
      private function onClassic500(event:MouseEvent) : void
      {
         battleSelectionScreen.SetPanel(BattleSelectionScreen.CLASSIC_500_PANEL);
      }
      
      public function get btn_SurvivalCoop() : ButtonSelect
      {
         return panel.getChildByName("btn_SurvivalCoop") as ButtonSelect;
      }
      
      public function get btn_Classic500() : ButtonSelect
      {
         return panel.getChildByName("btn_Classic500") as ButtonSelect;
      }
      
      private function onTournament(event:MouseEvent) : void
      {
         battleSelectionScreen.SetPanel(BattleSelectionScreen.TOURNAMENT_PANEL);
      }
      
      private function onClassic1000(event:MouseEvent) : void
      {
         battleSelectionScreen.SetPanel(BattleSelectionScreen.CLASSIC_1000_PANEL);
      }
      
      private function onSurvivalCoop(event:MouseEvent) : void
      {
         battleSelectionScreen.SetPanel(BattleSelectionScreen.SURVIVAL_COOP_PANEL);
      }
      
      public function get btn_Tournament() : ButtonSelect
      {
         return panel.getChildByName("btn_Tournament") as ButtonSelect;
      }
      
      public function get btn_Classic1000() : ButtonSelect
      {
         return panel.getChildByName("btn_Classic1000") as ButtonSelect;
      }
   }
}

