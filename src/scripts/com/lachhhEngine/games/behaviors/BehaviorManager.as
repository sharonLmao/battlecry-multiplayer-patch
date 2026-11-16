package com.lachhhEngine.games.behaviors
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import com.lachhhEngine.games.meta.metaObject.MetaBehavior;
   
   public class BehaviorManager extends FactoryObjectManager
   {
      
      public static const ID_CREATE_BEHAVIOR:String = "ADDBEH";
      
      public function BehaviorManager(context:Game, behaviorFactory:BehaviorFactory)
      {
         super(behaviorFactory,MetaBehavior,Behavior,context,"Behavior");
      }
      
      public function DestroyBehavior(b:Behavior) : void
      {
         Destroy(b);
      }
      
      public function CreateBehavior(metaBehavior:MetaBehavior) : Behavior
      {
         return Behavior(Create(metaBehavior));
      }
   }
}

