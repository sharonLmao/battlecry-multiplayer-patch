package com.battlecry.io
{
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.io.files.GamePrefs;
   import com.lachhhEngine.io.files.GameProgress;
   import com.lachhhEngine.io.files.GameProgressFactory;
   
   public class BC_GameProgressFactory extends GameProgressFactory
   {
      
      public function BC_GameProgressFactory()
      {
         super();
      }
      
      override public function GetNewGamePrefs(main:MainGame) : GamePrefs
      {
         return new BC_GamePrefs(main);
      }
      
      override public function GetNewInstance() : GameProgress
      {
         return new BC_GameProgress();
      }
   }
}

