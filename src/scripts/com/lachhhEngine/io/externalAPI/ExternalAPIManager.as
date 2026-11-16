package com.lachhhEngine.io.externalAPI
{
   import com.lachhhEngine.io.externalAPI.achievementAPI.IAchievementAPI;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.IDataSharingAPI;
   import com.lachhhEngine.io.externalAPI.metricsAPI.IMetricsAPI;
   import com.lachhhEngine.io.externalAPI.multiplayer.IMultiplayerAPI;
   import com.lachhhEngine.io.externalAPI.premiumAPI.IPremiumAPIController;
   import com.lachhhEngine.io.externalAPI.savefileAPI.ISaveFileAPI;
   import com.lachhhEngine.io.externalAPI.scoreAPI.IScoreAPI;
   import com.lachhhEngine.io.externalAPI.socialNetworkAPI.ISocialNetworkAPI;
   import com.lachhhEngine.io.externalAPI.statsAPI.IStatsAPI;
   
   public class ExternalAPIManager
   {
      
      private static var _emptyController:EmptyController = new EmptyController();
      
      private static var _savedFileAPI:ISaveFileAPI = _emptyController;
      
      private static var _premiumAPI:IPremiumAPIController = _emptyController;
      
      private static var _achievementAPI:IAchievementAPI = _emptyController;
      
      private static var _scoreAPI:IScoreAPI = _emptyController;
      
      private static var _metricsAPI:IMetricsAPI = _emptyController;
      
      private static var _socialNetworkAPI:ISocialNetworkAPI = _emptyController;
      
      private static var _dataSharingAPI:IDataSharingAPI = _emptyController;
      
      private static var _statsAPI:IStatsAPI = _emptyController;
      
      private static var _multiplayerAPI:IMultiplayerAPI = _emptyController;
      
      public function ExternalAPIManager()
      {
         super();
      }
      
      public static function SetMultiplayerAPI(m:IMultiplayerAPI) : void
      {
         _multiplayerAPI = m;
      }
      
      public static function getPremiumAPI() : IPremiumAPIController
      {
         return _premiumAPI;
      }
      
      public static function get emptyController() : EmptyController
      {
         return _emptyController;
      }
      
      public static function getDataSharingAPI() : IDataSharingAPI
      {
         return _dataSharingAPI;
      }
      
      public static function SetAchievementAPI(a:IAchievementAPI) : void
      {
         _achievementAPI = a;
      }
      
      public static function getSocialNetworkAPI() : ISocialNetworkAPI
      {
         return _socialNetworkAPI;
      }
      
      public static function SetScoreAPI(s:IScoreAPI) : void
      {
         _scoreAPI = s;
      }
      
      public static function getMetricsAPI() : IMetricsAPI
      {
         return _metricsAPI;
      }
      
      public static function SetStatsAPI(m:IStatsAPI) : void
      {
         _statsAPI = m;
      }
      
      public static function getScoreAPI() : IScoreAPI
      {
         return _scoreAPI;
      }
      
      public static function SetSaveFileAPI(s:ISaveFileAPI) : void
      {
         _savedFileAPI = s;
      }
      
      public static function getAchievementAPI() : IAchievementAPI
      {
         return _achievementAPI;
      }
      
      public static function SetPremiumAPI(p:IPremiumAPIController) : void
      {
         _premiumAPI = p;
      }
      
      public static function getSavedFileAPI() : ISaveFileAPI
      {
         return _savedFileAPI;
      }
      
      public static function getMultiplayerAPI() : IMultiplayerAPI
      {
         return _multiplayerAPI;
      }
      
      public static function getStatsAPI() : IStatsAPI
      {
         return _statsAPI;
      }
      
      public static function ResetAll() : void
      {
         _savedFileAPI = _emptyController;
         _premiumAPI = _emptyController;
         _achievementAPI = _emptyController;
         _scoreAPI = _emptyController;
         _metricsAPI = _emptyController;
         _socialNetworkAPI = _emptyController;
         _dataSharingAPI = _emptyController;
      }
      
      public static function SetDataSharing(m:IDataSharingAPI) : void
      {
         _dataSharingAPI = m;
      }
      
      public static function SetMetricsAPI(m:IMetricsAPI) : void
      {
         _metricsAPI = m;
      }
      
      public static function SetSocialNetworkAPI(m:ISocialNetworkAPI) : void
      {
         _socialNetworkAPI = m;
      }
   }
}

