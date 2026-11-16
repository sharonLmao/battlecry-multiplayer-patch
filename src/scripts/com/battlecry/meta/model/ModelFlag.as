package com.battlecry.meta.model
{
   public class ModelFlag
   {
      
      public static const TYPE_FOND:int = 1;
      
      public static const TYPE_SYMBOLE1:int = 2;
      
      public static const TYPE_SYMBOLE2:int = 3;
      
      private var _id:int;
      
      private var _selected:Boolean;
      
      private var _visualFrame:int;
      
      private var _type:int;
      
      private var _coopSurvivalWave:int;
      
      private var _lvlToUnlock:int;
      
      private var _numTournamentToWin:int;
      
      private var _soloSurvivalWave:int;
      
      public function ModelFlag(id:int, type:int, visualFrame:int, lvlToUnlock:int, numTournamentToWin:int, soloSurvivalWave:int, coopSurvivalWave:int)
      {
         super();
         this._id = id;
         this._type = type;
         this._visualFrame = visualFrame;
         this._selected = false;
         this._lvlToUnlock = lvlToUnlock;
         this._numTournamentToWin = numTournamentToWin;
         this._soloSurvivalWave = soloSurvivalWave;
         this._coopSurvivalWave = coopSurvivalWave;
      }
      
      public function set lvlToUnlock(lvlToUnlock:int) : void
      {
         this._lvlToUnlock = lvlToUnlock;
      }
      
      public function set selected(selected:Boolean) : void
      {
         this._selected = selected;
      }
      
      public function set coopSurvivalWave(coopSurvivalWave:int) : void
      {
         this._coopSurvivalWave = coopSurvivalWave;
      }
      
      public function get coopSurvivalWave() : int
      {
         return this._coopSurvivalWave;
      }
      
      public function get visualFrame() : int
      {
         return this._visualFrame;
      }
      
      public function get numTournamentToWin() : int
      {
         return this._numTournamentToWin;
      }
      
      public function get soloSurvivalWave() : int
      {
         return this._soloSurvivalWave;
      }
      
      public function set visualFrame(visualFrame:int) : void
      {
         this._visualFrame = visualFrame;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function get lvlToUnlock() : int
      {
         return this._lvlToUnlock;
      }
      
      public function set numTournamentToWin(numTournamentToWin:int) : void
      {
         this._numTournamentToWin = numTournamentToWin;
      }
      
      public function set soloSurvivalWave(soloSurvivalWave:int) : void
      {
         this._soloSurvivalWave = soloSurvivalWave;
      }
      
      public function Reset() : void
      {
      }
      
      public function set type(type:int) : void
      {
         this._type = type;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get id() : int
      {
         return this._id;
      }
   }
}

