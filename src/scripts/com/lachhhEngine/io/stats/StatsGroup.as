package com.lachhhEngine.io.stats
{
   import com.lachhhEngine.io.encryption.SecureNumber;
   
   public class StatsGroup
   {
      
      public static const AUTO_NAME:String = "AUTO";
      
      private static var _allStatsGroup:Array = new Array();
      
      private var _stats:Array = new Array();
      
      private const SEPARATOR:String = "[STATG]";
      
      private var _defaultStats:Array = new Array();
      
      public function StatsGroup()
      {
         super();
         _allStatsGroup.push(this);
      }
      
      public static function get allStatsGroup() : Array
      {
         return _allStatsGroup;
      }
      
      public function GetStats(id:int) : Stats
      {
         return Stats(this._stats[id]);
      }
      
      public function get name() : String
      {
         return "StatsGroup";
      }
      
      public function Decode(s:String) : void
      {
         if(s == "" || s == null)
         {
            return;
         }
         var params:Array = s.split(this.SEPARATOR);
         for(var i:int = 0; i < params.length; i++)
         {
            if(!isNaN(Number(params[i])))
            {
               this.SetValue(i,params[i]);
            }
         }
      }
      
      public function SetValue(id:int, value:Number) : void
      {
         if(this._stats[id] == null)
         {
            return;
         }
         SecureNumber(Stats(this._stats[id]).secureNumber).value = value;
      }
      
      public function AddValue(id:int, value:Number) : void
      {
         this.SetValue(id,this.GetValue(id) + value);
      }
      
      public function Encode() : String
      {
         var result:String = "";
         for(var i:int = 0; i < this._stats.length; i++)
         {
            result += this.GetValue(i) + this.SEPARATOR;
         }
         return result.substr(0,result.length - this.SEPARATOR.length);
      }
      
      public function ResetToDefault() : void
      {
         for(var i:int = 0; i < this._stats.length; i++)
         {
            this.SetValue(i,SecureNumber(this._defaultStats[i]).value);
         }
      }
      
      public function get numStats() : int
      {
         return this._stats.length;
      }
      
      public function GetValue(id:int) : Number
      {
         return SecureNumber(Stats(this._stats[id]).secureNumber).value;
      }
      
      public function NewStats(defaultValue:Number = 0, debugName:String = "AUTO") : int
      {
         var stats:Stats = new Stats(new SecureNumber(defaultValue),debugName);
         this._stats.push(stats);
         this._defaultStats.push(new SecureNumber(defaultValue));
         return this._stats.length - 1;
      }
   }
}

