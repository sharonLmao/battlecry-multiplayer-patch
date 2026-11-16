package com.lachhhEngine.games.debug
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.io.stats.StatsGroup;
   
   public class DebugStatsTree extends DebugTree
   {
      
      private var _statGroup:StatsGroup;
      
      public function DebugStatsTree(statGroup:StatsGroup)
      {
         var child:DebugTree = null;
         super();
         this._statGroup = statGroup;
         for(var i:int = 0; i < this._statGroup.numStats; i++)
         {
            child = new DebugTree();
            AddChild(child);
         }
         name = this._statGroup.name;
      }
      
      override public function Update(context:Game) : void
      {
         var child:DebugTree = null;
         super.Update(context);
         for(var i:int = 0; i < this._statGroup.numStats; i++)
         {
            if(GetChildAt(i) == null)
            {
               child = new DebugTree();
               AddChild(child);
            }
            if(this._statGroup.GetStats(i).debugName == StatsGroup.AUTO_NAME)
            {
               GetChildAt(i).name = "Stats[" + i + "] : " + this._statGroup.GetValue(i);
            }
            else
            {
               GetChildAt(i).name = this._statGroup.GetStats(i).debugName + " : " + this._statGroup.GetValue(i);
            }
         }
      }
   }
}

