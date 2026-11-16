package com.lachhhEngine.games.scenario
{
   import com.lachhhEngine.games.factory.ObjectFactory;
   
   public class GameEventFactory extends ObjectFactory
   {
      
      private var _gameEventSwitch:int;
      
      public function GameEventFactory()
      {
         super();
         this.AddGameClass();
         this.AddEngineClass();
      }
      
      public function get ID_GAME_EVENT_SWITCH() : int
      {
         return this._gameEventSwitch;
      }
      
      protected function AddGameClass() : void
      {
      }
      
      private function AddEngineClass() : void
      {
         this._gameEventSwitch = PushClassLink(GameEventSwitch);
      }
   }
}

