package com.lachhhEngine.io.files
{
   import com.lachhhEngine.games.MainGame;
   
   public class GameProgressFactory
   {
      
      public function GameProgressFactory()
      {
         super();
      }
      
      public function GetNewGamePrefs(main:MainGame) : GamePrefs
      {
         return new GamePrefs(main);
      }
      
      public function GetNewInstance() : GameProgress
      {
         return new GameProgress();
      }
   }
}

