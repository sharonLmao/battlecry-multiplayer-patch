package com.lachhhEngine.games.hero
{
   import com.lachhhEngine.games.factory.ObjectFactory;
   
   public class HeroFactory extends ObjectFactory
   {
      
      public function HeroFactory()
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

