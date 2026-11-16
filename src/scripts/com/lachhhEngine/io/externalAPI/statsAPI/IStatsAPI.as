package com.lachhhEngine.io.externalAPI.statsAPI
{
   import com.lachhhEngine.io.externalAPI.IExternalAPI;
   
   public interface IStatsAPI extends IExternalAPI
   {
      
      function SendStat(param1:MetaStatData) : void;
   }
}

