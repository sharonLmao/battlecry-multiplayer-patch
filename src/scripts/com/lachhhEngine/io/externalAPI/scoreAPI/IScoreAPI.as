package com.lachhhEngine.io.externalAPI.scoreAPI
{
   import com.lachhhEngine.io.externalAPI.IExternalAPI;
   
   public interface IScoreAPI extends IExternalAPI
   {
      
      function ShowHighscore(param1:MetaExternalScoreboard) : void;
      
      function SendScore(param1:int, param2:Object, param3:MetaExternalScoreboard) : void;
      
      function get canShowHighscore() : Boolean;
      
      function SendLevel(param1:int, param2:Object) : void;
      
      function SendGameOver(param1:int, param2:Object) : void;
   }
}

