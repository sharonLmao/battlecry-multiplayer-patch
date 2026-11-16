package com.battlecry.io.stats
{
   import com.lachhhEngine.io.stats.StatsGroup;
   
   public class StatsStatic extends StatsGroup
   {
      
      private static var _instance:StatsStatic;
      
      public static const ID_UPDATE_1_11_REWARDS:int = getInstance().NewStats(0,"MONEY");
      
      public function StatsStatic()
      {
         super();
      }
      
      public static function getInstance() : StatsStatic
      {
         if(_instance == null)
         {
            _instance = new StatsStatic();
         }
         return _instance;
      }
      
      override public function get name() : String
      {
         return "Static";
      }
   }
}

