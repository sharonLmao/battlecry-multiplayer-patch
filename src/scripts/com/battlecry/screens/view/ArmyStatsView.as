package com.battlecry.screens.view
{
   import com.battlecry.io.BC_GameProgress;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class ArmyStatsView extends ObjectView
   {
      
      public function ArmyStatsView(visual:DisplayObjectContainer)
      {
         super(visual);
      }
      
      public function get rankingName() : TextField
      {
         return visual.getChildByName("rankingName") as TextField;
      }
      
      public function get armyRankIcon() : MovieClip
      {
         return visual.getChildByName("armyRankIcon") as MovieClip;
      }
      
      public function get btn_desactivateArmy() : ButtonSelect
      {
         return visual.getChildByName("btn_desactivateArmy") as ButtonSelect;
      }
      
      public function get armyLost() : TextField
      {
         return visual.getChildByName("armyLost") as TextField;
      }
      
      public function get btn_ResetArmy() : ButtonSelect
      {
         return visual.getChildByName("btn_ResetArmy") as ButtonSelect;
      }
      
      public function get armyRank() : TextField
      {
         return visual.getChildByName("armyRank") as TextField;
      }
      
      public function get btn_showLadder() : ButtonSelect
      {
         return visual.getChildByName("btn_showLadder") as ButtonSelect;
      }
      
      public function get btn_rankedMatch() : ButtonSelect
      {
         return visual.getChildByName("btn_rankedMatch") as ButtonSelect;
      }
      
      public function get btn_Refresh() : ButtonSelect
      {
         return visual.getChildByName("btn_Refresh") as ButtonSelect;
      }
      
      public function get armyDraw() : TextField
      {
         return visual.getChildByName("armyDraw") as TextField;
      }
      
      public function get btn_activateArmy() : ButtonSelect
      {
         return visual.getChildByName("btn_activateArmy") as ButtonSelect;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.btn_activateArmy.visible = false;
         this.btn_desactivateArmy.visible = false;
         if(BC_GameProgress.gameProgess.CurrentSelectedArmy().IsMultiplayer())
         {
            visualMc.gotoAndStop(2);
            this.btn_desactivateArmy.visible = true;
            this.btn_rankedMatch.Deselect();
            this.btn_Refresh.Deselect();
            this.btn_ResetArmy.Deselect();
         }
         else
         {
            visualMc.gotoAndStop(1);
            this.btn_activateArmy.visible = true;
            this.btn_rankedMatch.Select();
            this.btn_Refresh.Select();
            this.btn_ResetArmy.Select();
         }
         this.armyRank.text = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank + "";
         this.armyRankIcon.gotoAndStop(BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank);
         this.rankingName.text = TextFactory.instance.GetMsg(BC_GameProgress.gameProgess.CurrentSelectedArmy().GetRankName(BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerRank));
         this.armyWin.text = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerWin + "";
         this.armyLost.text = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerLost + "";
         this.armyDraw.text = BC_GameProgress.gameProgess.CurrentSelectedArmy().multiPlayerDraw + "";
      }
      
      public function get armyWin() : TextField
      {
         return visual.getChildByName("armyWin") as TextField;
      }
   }
}

