package com.lachhhEngine.games.weapon
{
   import com.lachhhEngine.games.factory.ObjectFactory;
   
   public class WeaponFactory extends ObjectFactory
   {
      
      public function WeaponFactory()
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

