package com.battlecry.enemy
{
   import com.battlecry.actor.BC_Actor;
   import com.lachhhEngine.games.enemy.EnemyFactory;
   
   public class BC_EnemyFactory extends EnemyFactory
   {
      
      private static var _instance:BC_EnemyFactory;
      
      public static var ID_UNIT:int;
      
      public function BC_EnemyFactory()
      {
         super();
         if(_instance != null)
         {
            throw new Error("instance already created");
         }
         _instance = this;
      }
      
      public static function get instance() : BC_EnemyFactory
      {
         return _instance;
      }
      
      override protected function AddGameClass() : void
      {
         super.AddGameClass();
         ID_UNIT = PushClassLink(BC_Actor);
      }
   }
}

