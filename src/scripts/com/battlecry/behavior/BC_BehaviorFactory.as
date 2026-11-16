package com.battlecry.behavior
{
   import com.lachhhEngine.games.behaviors.Behavior;
   import com.lachhhEngine.games.behaviors.BehaviorFactory;
   
   public class BC_BehaviorFactory extends BehaviorFactory
   {
      
      public static var ID_BEHAVIOR_NULL:int;
      
      public static var ID_BEHAVIOR_UNIT:int;
      
      public static const BEHAVIOR_NULL:Behavior = new Behavior();
      
      public function BC_BehaviorFactory()
      {
         super();
         ID_BEHAVIOR_UNIT = PushClassLink(BehaviorUnit);
      }
   }
}

