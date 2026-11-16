package com.lachhhEngine.games.items
{
   import com.lachhhEngine.games.factory.ObjectFactory;
   
   public class ItemFactory extends ObjectFactory
   {
      
      public function ItemFactory()
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

