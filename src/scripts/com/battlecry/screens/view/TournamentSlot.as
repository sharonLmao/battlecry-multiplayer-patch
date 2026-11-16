package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.meta.MetaEnemyLoaded;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class TournamentSlot extends ObjectView
   {
      
      private var _metaEnemyLoaded:MetaEnemyLoaded;
      
      private var _flagView:FlagView;
      
      private var _tournamentRank:int;
      
      private var _tournamentStage:int;
      
      private var _tournamentPanel:TournamentPanel;
      
      public function TournamentSlot(visual:DisplayObjectContainer, tournamentStage:int, tournamentPanel:TournamentPanel)
      {
         super(visual);
         this._tournamentStage = tournamentStage;
         this._tournamentPanel = tournamentPanel;
         this._tournamentRank = -1;
         this._flagView = new FlagView(this.allyflagView);
         this.btn_FightTournament.addEventListener(MouseEvent.MOUSE_DOWN,this.onFightTournament);
         if(this.btn_FightTournament)
         {
            this.btn_FightTournament.visible = false;
         }
         if(this.armyRankIcon)
         {
            this.armyRankIcon.visible = false;
         }
         if(this.allyflagView)
         {
            this.allyflagView.visible = false;
         }
         visualMc.gotoAndStop(1);
      }
      
      override public function Update() : void
      {
         super.Update();
         if(this._tournamentRank == -1)
         {
            if(this.tournamentRank)
            {
               this.tournamentRank.text = "???";
            }
         }
         else if(this.tournamentRank)
         {
            this.tournamentRank.text = this._tournamentRank + "";
         }
         if(this._metaEnemyLoaded == null)
         {
            return;
         }
         this.Refresh();
      }
      
      public function get armyRankIcon() : MovieClip
      {
         return visual.getChildByName("armyRankIcon") as MovieClip;
      }
      
      public function SetMetaLoadedEnemy(metaEnemyLoaded:MetaEnemyLoaded) : void
      {
         if(metaEnemyLoaded == null)
         {
            return;
         }
         this._metaEnemyLoaded = metaEnemyLoaded;
         if(this.btn_FightTournament)
         {
            this.btn_FightTournament.visible = true;
         }
         if(this.armyRankIcon)
         {
            this.armyRankIcon.visible = true;
         }
         if(this.allyflagView)
         {
            this.allyflagView.visible = true;
         }
      }
      
      public function get playerName() : TextField
      {
         return visual.getChildByName("playerName") as TextField;
      }
      
      public function get allyflagView() : MovieClip
      {
         return visual.getChildByName("allyflagView") as MovieClip;
      }
      
      public function get tournamentRank() : TextField
      {
         return visual.getChildByName("tournamentRank") as TextField;
      }
      
      public function SetTournamentRank(rank:int) : void
      {
         this._tournamentRank = rank;
      }
      
      private function onFightTournament(event:MouseEvent) : void
      {
         if(this.btn_FightTournament.isSelected)
         {
            return;
         }
         this._tournamentPanel.FightTournament(this._metaEnemyLoaded);
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.btn_FightTournament.visible = true;
         if(BC_Game.instance.currentTournamentLevel > this._tournamentStage)
         {
            visualMc.gotoAndStop(3);
            this.btn_FightTournament.visible = false;
         }
         else if(BC_Game.instance.currentTournamentLevel == this._tournamentStage)
         {
            visualMc.gotoAndStop(1);
            this.btn_FightTournament.Deselect();
         }
         else
         {
            visualMc.gotoAndStop(2);
            this.btn_FightTournament.Select();
         }
         if(this._tournamentRank == -1)
         {
            if(this.playerName)
            {
               this.playerName.text = "???";
            }
         }
         else if(this.playerName)
         {
            this.playerName.text = this._metaEnemyLoaded.enemyName;
         }
         this._flagView.SetMetaFlag(this._metaEnemyLoaded.metaFlag);
         this.armyRankIcon.gotoAndStop(this._metaEnemyLoaded.metaArmy.multiPlayerRank);
      }
      
      public function get btn_FightTournament() : ButtonSelect
      {
         return visual.getChildByName("btn_FightTournament") as ButtonSelect;
      }
   }
}

