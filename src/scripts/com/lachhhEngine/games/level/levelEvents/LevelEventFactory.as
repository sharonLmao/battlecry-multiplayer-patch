package com.lachhhEngine.games.level.levelEvents
{
   import com.lachhhEngine.games.factory.ObjectFactory;
   
   public class LevelEventFactory extends ObjectFactory
   {
      
      public static var ID_LEVEL_NONE:int;
      
      public function LevelEventFactory()
      {
         super();
         this.AddEngineClass();
         this.AddGameClass();
      }
      
      private function AddEngineClass() : void
      {
         ID_LEVEL_NONE = PushClassLink(LevelEventNull);
      }
      
      protected function AddGameClass() : void
      {
      }
   }
}

