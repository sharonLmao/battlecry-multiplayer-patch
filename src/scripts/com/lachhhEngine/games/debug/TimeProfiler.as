package com.lachhhEngine.games.debug
{
   import com.lachhhEngine.initializers.VersionInfo;
   import flash.utils.getTimer;
   
   public class TimeProfiler
   {
      
      private static var _instance:TimeProfiler;
      
      private var _updatableTimeProfiler:Array;
      
      private var _index:int;
      
      private var _profilerChild:DebugTree;
      
      private var _init:Boolean = false;
      
      private var _profileTime:int;
      
      public function TimeProfiler()
      {
         super();
      }
      
      public static function get instance() : TimeProfiler
      {
         if(_instance == null)
         {
            _instance = new TimeProfiler();
         }
         return _instance;
      }
      
      private static function get canProfile() : Boolean
      {
         return VersionInfo.debugVersion && VersionInfo.canProfileTime;
      }
      
      public static function RemoveAllChild() : void
      {
         GameTree.msChild.RemoveAllChild();
      }
      
      public function StartProfile(name:String) : void
      {
         var d:DebugTree = null;
         if(!canProfile)
         {
            return;
         }
         this.Init();
         if(this._updatableTimeProfiler[this._index] == null)
         {
            d = new DebugTree();
            this._updatableTimeProfiler[this._index] = d;
         }
         this._profilerChild = this._updatableTimeProfiler[this._index];
         DebugTree(this._updatableTimeProfiler[this._index]).name = name;
         this._profileTime = getTimer();
      }
      
      public function Reset() : void
      {
         if(!canProfile)
         {
            return;
         }
         this._index = 0;
      }
      
      private function Init() : void
      {
         if(!canProfile)
         {
            return;
         }
         if(this._init)
         {
            return;
         }
         this._updatableTimeProfiler = new Array();
         this._index = 0;
         this._init = false;
      }
      
      public function StopProfile(index:int = -1) : void
      {
         if(!canProfile || this._profilerChild == null)
         {
            return;
         }
         var diff:int = getTimer() - this._profileTime;
         this._profilerChild.name += " : " + diff;
         if(index == -1)
         {
            GameTree.msChild.AddChild(this._profilerChild);
         }
         else
         {
            GameTree.msChild.AddChildAt(this._profilerChild,index);
         }
         this._profilerChild = null;
      }
   }
}

