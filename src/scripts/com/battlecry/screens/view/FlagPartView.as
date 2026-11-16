package com.battlecry.screens.view
{
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.model.ModelFlag;
   import com.battlecry.meta.model.ModelFlagEnum;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class FlagPartView extends ObjectView
   {
      
      private var _modelFlag:ModelFlag;
      
      public function FlagPartView(visual:MovieClip)
      {
         super(visual);
         this.lock.mouseEnabled = false;
         this.lock.mouseChildren = false;
         this._modelFlag = ModelFlagEnum.FLAG_NULL;
         this.fondPart.gotoAndStop(2);
         this.symbole1Part.gotoAndStop(2);
         this.symbole2Part.gotoAndStop(2);
      }
      
      public function get toolTipSoloSurvival() : MovieClip
      {
         return this.btn_FlagViewSquare.getChildByName("toolTipSoloSurvival") as MovieClip;
      }
      
      public function get tooltip() : MovieClip
      {
         return this.btn_FlagViewSquare.getChildByName("tooltip") as MovieClip;
      }
      
      public function get tooltipTournament() : MovieClip
      {
         return this.btn_FlagViewSquare.getChildByName("tooltipTournament") as MovieClip;
      }
      
      public function get tooltipIconRank() : MovieClip
      {
         return this.tooltip.getChildByName("iconRank") as MovieClip;
      }
      
      public function set modelFlag(modelFlag:ModelFlag) : void
      {
         this._modelFlag = modelFlag;
      }
      
      public function get lock() : MovieClip
      {
         return this.btn_FlagViewSquare.getChildByName("lock") as MovieClip;
      }
      
      public function get toolTipCoopSurvival() : MovieClip
      {
         return this.btn_FlagViewSquare.getChildByName("toolTipCoopSurvival") as MovieClip;
      }
      
      public function get coopNumSurvivalWave() : TextField
      {
         return this.toolTipCoopSurvival.getChildByName("numSurvivalWave") as TextField;
      }
      
      public function get btn_FlagViewSquare() : ButtonSelect
      {
         return visual.getChildByName("btn_FlagViewSquare") as ButtonSelect;
      }
      
      public function get fondPart() : MovieClip
      {
         return this.btn_FlagViewSquare.getChildByName("fondPart") as MovieClip;
      }
      
      public function SetModelFlag(modelFlag:ModelFlag) : void
      {
         this._modelFlag = modelFlag;
         this.tooltip.visible = false;
         this.tooltipTournament.visible = false;
         this.toolTipSoloSurvival.visible = false;
         this.toolTipCoopSurvival.visible = false;
         if(this._modelFlag.lvlToUnlock > 0)
         {
            this.tooltip.visible = true;
            this.tooltipIconRank.gotoAndStop(this._modelFlag.lvlToUnlock);
         }
         else
         {
            this.tooltipIconRank.gotoAndStop(1);
         }
         if(this._modelFlag.numTournamentToWin > 0)
         {
            this.tooltipTournament.visible = true;
            this.numTournamentToWin.text = "x" + this._modelFlag.numTournamentToWin;
         }
         if(this._modelFlag.soloSurvivalWave > 0)
         {
            this.toolTipSoloSurvival.visible = true;
            this.soloNumSurvivalWave.text = this._modelFlag.soloSurvivalWave + "";
         }
         if(this._modelFlag.coopSurvivalWave > 0)
         {
            this.toolTipCoopSurvival.visible = true;
            this.coopNumSurvivalWave.text = this._modelFlag.coopSurvivalWave + "";
         }
         if(BC_GameProgress.gameProgess.flagManager.IsFlagUnlock(modelFlag))
         {
            this.tooltip.visible = false;
            this.tooltipTournament.visible = false;
            this.toolTipSoloSurvival.visible = false;
            this.toolTipCoopSurvival.visible = false;
         }
         this.Refresh();
      }
      
      public function get modelFlag() : ModelFlag
      {
         return this._modelFlag;
      }
      
      public function get symbole1Part() : MovieClip
      {
         return this.btn_FlagViewSquare.getChildByName("symbole1Part") as MovieClip;
      }
      
      public function get symbole2Part() : MovieClip
      {
         return this.btn_FlagViewSquare.getChildByName("symbole2Part") as MovieClip;
      }
      
      public function get numTournamentToWin() : TextField
      {
         return this.tooltipTournament.getChildByName("numTournamentToWin") as TextField;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.fondPart.gotoAndStop(2);
         this.symbole1Part.gotoAndStop(2);
         this.symbole2Part.gotoAndStop(2);
         switch(this._modelFlag.type)
         {
            case ModelFlag.TYPE_FOND:
               this.fondPart.gotoAndStop(this._modelFlag.visualFrame);
               break;
            case ModelFlag.TYPE_SYMBOLE1:
               this.symbole1Part.gotoAndStop(this._modelFlag.visualFrame);
               break;
            case ModelFlag.TYPE_SYMBOLE2:
               this.symbole2Part.gotoAndStop(this._modelFlag.visualFrame);
         }
         this.lock.visible = !BC_GameProgress.gameProgess.flagManager.IsFlagUnlock(this._modelFlag);
         if(this._modelFlag.selected)
         {
            this.btn_FlagViewSquare.Select();
         }
         else
         {
            this.btn_FlagViewSquare.Deselect();
         }
      }
      
      public function get soloNumSurvivalWave() : TextField
      {
         return this.toolTipSoloSurvival.getChildByName("numSurvivalWave") as TextField;
      }
   }
}

