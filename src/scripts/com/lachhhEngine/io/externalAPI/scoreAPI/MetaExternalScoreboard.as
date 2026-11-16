package com.lachhhEngine.io.externalAPI.scoreAPI
{
   public class MetaExternalScoreboard
   {
      
      private var _idBoardTeaGamesLevel:String;
      
      private var _idBoardMochi:String;
      
      private var _idBoardGS:int;
      
      private var _idBoardTeaGamesDifficulty:String;
      
      public function MetaExternalScoreboard(idBoardGS:int, idBoardMochi:String, idBoardteaGamesDifficulty:String = "", idBoardteaGamesLevel:String = "")
      {
         super();
         this._idBoardGS = idBoardGS;
         this._idBoardMochi = idBoardMochi;
         this._idBoardTeaGamesDifficulty = idBoardteaGamesDifficulty;
         this._idBoardTeaGamesLevel = idBoardteaGamesLevel;
      }
      
      public function get idBoardTeaGamesDifficulty() : String
      {
         return this._idBoardTeaGamesDifficulty;
      }
      
      public function get idBoardTeaGamesLevel() : String
      {
         return this._idBoardTeaGamesLevel;
      }
      
      public function get idBoardMochi() : String
      {
         return this._idBoardMochi;
      }
      
      public function get idBoardGS() : int
      {
         return this._idBoardGS;
      }
   }
}

