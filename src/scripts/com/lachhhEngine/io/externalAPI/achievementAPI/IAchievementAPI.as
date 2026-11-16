package com.lachhhEngine.io.externalAPI.achievementAPI
{
   import com.lachhhEngine.io.externalAPI.IExternalAPI;
   
   public interface IAchievementAPI extends IExternalAPI
   {
      
      function bestowAchievement(param1:MetaExternalAchievement) : void;
   }
}

