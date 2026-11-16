package com.battlecry.io
{
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import de.polygonal.math.RandomGenerator;
   
   public class ServerUtils
   {
      
      private static var _localTime:Date;
      
      private static var _serverTime:Date;
      
      private static var _random:RandomGenerator = new RandomGenerator();
      
      public function ServerUtils()
      {
         super();
      }
      
      public static function get serverTime() : Date
      {
         if(!_serverTime)
         {
            _serverTime = ExternalAPIManager.getPremiumAPI().serverStartingTime;
         }
         return _serverTime;
      }
      
      public static function get serverDay() : int
      {
         if(!_localTime)
         {
            _localTime = new Date();
         }
         var d:Date = serverTime;
         if(!d)
         {
            d = _localTime;
         }
         return d.date;
      }
      
      public static function GetRandomSeedBasedOnDay() : Number
      {
         _random.seed = (serverDay + 1) * (2147483646 / 30);
         return _random.nextDouble();
      }
      
      public static function get serverMonth() : int
      {
         if(!_localTime)
         {
            _localTime = new Date();
         }
         var d:Date = serverTime;
         if(!d)
         {
            d = _localTime;
         }
         return d.month;
      }
   }
}

