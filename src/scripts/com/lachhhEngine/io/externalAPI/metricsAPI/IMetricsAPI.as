package com.lachhhEngine.io.externalAPI.metricsAPI
{
   import com.lachhhEngine.io.externalAPI.IExternalAPI;
   
   public interface IMetricsAPI extends IExternalAPI
   {
      
      function RecordAPlay() : void;
      
      function RecordStats(param1:String, param2:String) : void;
   }
}

