package com.lachhhEngine.io
{
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.externalAPI.premiumAPI.KongAPIController;
   import com.lachhhEngine.io.externalAPI.statsAPI.IStatsAPI;
   import com.lachhhEngine.io.externalAPI.statsAPI.MetaStatData;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   
   public class KongStats implements IStatsAPI
   {
      
      private static var _kongregate:KongAPIController;
      
      private static var _isInKong:Boolean = false;
      
      public function KongStats()
      {
         super();
      }
      
      public static function SubmitDataArray(kongDatas:Array) : void
      {
         if(_kongregate == null)
         {
            return;
         }
         _kongregate.SubmitDataArray(kongDatas);
      }
      
      public static function SubmitData(kongData:MetaStatData) : void
      {
         if(_kongregate == null)
         {
            return;
         }
         _kongregate.SubmitData(kongData);
      }
      
      public function get connected() : Boolean
      {
         if(_kongregate == null)
         {
            return false;
         }
         return _kongregate.connected;
      }
      
      public function get loggedIn() : Boolean
      {
         if(_kongregate == null)
         {
            return false;
         }
         return _kongregate.loggedIn;
      }
      
      public function Connect(root:MovieClip, success:Callback = null, error:Callback = null) : void
      {
      }
      
      public function Init(d:DisplayObjectContainer) : void
      {
         _isInKong = SiteLocking.IsInSite(d.root,VersionInfo.URL_SITELOCK_KONG);
         if(_isInKong)
         {
            if(ExternalAPIManager.getPremiumAPI() is KongAPIController)
            {
               _kongregate = ExternalAPIManager.getPremiumAPI() as KongAPIController;
            }
            else
            {
               _kongregate = new KongAPIController();
               _kongregate.Connect(d as MovieClip);
            }
         }
      }
      
      public function get nameOfSystem() : String
      {
         if(_kongregate == null)
         {
            return "";
         }
         return _kongregate.nameOfSystem;
      }
      
      public function SendStat(m:MetaStatData) : void
      {
         SubmitData(m);
      }
   }
}

