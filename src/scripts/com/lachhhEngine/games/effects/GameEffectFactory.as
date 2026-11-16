package com.lachhhEngine.games.effects
{
   import com.lachhhEngine.games.factory.ObjectFactory;
   
   public class GameEffectFactory extends ObjectFactory
   {
      
      private var _gameFx:int;
      
      public function GameEffectFactory()
      {
         super();
         this.AddGameClass();
         this.AddEngineClass();
      }
      
      private function AddEngineClass() : void
      {
         this._gameFx = PushClassLink(GameEffect);
      }
      
      public function get ID_GAME_FX_NORMAL() : int
      {
         return this._gameFx;
      }
      
      protected function AddGameClass() : void
      {
      }
   }
}

