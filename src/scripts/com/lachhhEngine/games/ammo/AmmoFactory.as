package com.lachhhEngine.games.ammo
{
   import com.lachhhEngine.games.factory.ObjectFactory;
   
   public class AmmoFactory extends ObjectFactory
   {
      
      private var _ammoMelee:int;
      
      public function AmmoFactory()
      {
         super();
         this.AddGameClass();
         this.AddEngineClass();
      }
      
      private function AddEngineClass() : void
      {
         this._ammoMelee = PushClassLink(AmmoMelee);
      }
      
      public function get ID_AMMO_MELEE() : int
      {
         return this._ammoMelee;
      }
      
      protected function AddGameClass() : void
      {
      }
   }
}

