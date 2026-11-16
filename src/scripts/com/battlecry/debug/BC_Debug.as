package com.battlecry.debug
{
   import com.battlecry.BC_Game;
   import com.battlecry.io.BC_GameProgress;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.debug.DebugCallback;
   import com.lachhhEngine.games.debug.DebugTree;
   import com.lachhhEngine.games.debug.GameTree;
   
   public class BC_Debug
   {
      
      public function BC_Debug()
      {
         super();
      }
      
      public static function Init(context:Game) : void
      {
         GameTree.AddChildWithCallBack(TraceDebug,BC_Debug,context);
         GameTree.AddDebugCallback(new DebugCallback("nocol",NoCol,BC_Debug,[context]));
         GameTree.AddDebugCallback(new DebugCallback("money",Money,BC_Debug,[context]));
         GameTree.AddDebugCallback(new DebugCallback("UnlockAll",UnlockAll,BC_Debug,[context]));
      }
      
      private static function TraceDebug(context:Game, child:DebugTree) : void
      {
         child.name = "Debug ";
      }
      
      private static function UnlockAll(s:String, context:BC_Game) : void
      {
         BC_Game.instance.UnlockAll();
      }
      
      private static function NoCol(s:String, context:Game) : void
      {
      }
      
      private static function Money(s:String, context:Game) : void
      {
         var params:Array = s.split("_");
         BC_GameProgress.gameProgess.cash += int(params[1]);
      }
   }
}

