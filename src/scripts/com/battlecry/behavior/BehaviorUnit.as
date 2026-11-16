package com.battlecry.behavior
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.behaviors.Behavior;
   import com.lachhhEngine.games.behaviors.IControllable;
   
   public class BehaviorUnit extends Behavior
   {
      
      public function BehaviorUnit()
      {
         super();
      }
      
      override public function Control(context:Game, obj:IControllable) : void
      {
         super.Control(context,obj);
      }
   }
}

