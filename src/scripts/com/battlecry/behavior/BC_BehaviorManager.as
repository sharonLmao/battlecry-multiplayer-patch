package com.battlecry.behavior
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.behaviors.BehaviorFactory;
   import com.lachhhEngine.games.behaviors.BehaviorManager;
   
   public class BC_BehaviorManager extends BehaviorManager
   {
      
      public function BC_BehaviorManager(context:Game, behaviorFactory:BehaviorFactory)
      {
         super(context,behaviorFactory);
      }
   }
}

