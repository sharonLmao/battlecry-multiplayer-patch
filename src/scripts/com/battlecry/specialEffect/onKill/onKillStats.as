package com.battlecry.specialEffect.onKill
{
   import com.battlecry.meta.model.ModelStats;
   
   public class onKillStats extends onKillEffect
   {
      
      private var _modelStats:ModelStats;
      
      private var _ammount:int;
      
      public function onKillStats(id:int, ammount:int, stats:ModelStats)
      {
         super(id);
         this._ammount = ammount;
         this._modelStats = stats;
      }
      
      public function set ammount(ammount:int) : void
      {
         this._ammount = ammount;
      }
      
      public function get modelStats() : ModelStats
      {
         return this._modelStats;
      }
      
      public function set modelStats(modelStats:ModelStats) : void
      {
         this._modelStats = modelStats;
      }
      
      public function get ammount() : int
      {
         return this._ammount;
      }
      
      override public function Cast() : void
      {
         super.Cast();
         owner.metaStatsListAura.AddValue(this._ammount,this._modelStats);
      }
   }
}

