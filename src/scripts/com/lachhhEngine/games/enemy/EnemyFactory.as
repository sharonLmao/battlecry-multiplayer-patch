package com.lachhhEngine.games.enemy
{
   import com.lachhhEngine.games.factory.ObjectFactory;
   
   public class EnemyFactory extends ObjectFactory
   {
      
      public function EnemyFactory()
      {
         super();
         this.AddGameClass();
         this.AddEngineClass();
      }
      
      private function AddEngineClass() : void
      {
      }
      
      protected function AddGameClass() : void
      {
      }
   }
}

