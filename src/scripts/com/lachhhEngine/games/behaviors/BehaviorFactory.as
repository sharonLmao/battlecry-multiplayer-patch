package com.lachhhEngine.games.behaviors
{
   import com.lachhhEngine.games.factory.ObjectFactory;
   
   public class BehaviorFactory extends ObjectFactory
   {
      
      private var _instanceTypeEaseOutTo:int;
      
      private var _instanceTypeFadeColor:int;
      
      private var _instanceTypeMoveTo:int;
      
      private var _instanceTypeEaseInTo:int;
      
      public function BehaviorFactory()
      {
         super();
         this.AddGameClass();
         this.AddEngineClass();
      }
      
      public function get ID_FADE_COLOR() : int
      {
         return this._instanceTypeFadeColor;
      }
      
      protected function AddGameClass() : void
      {
      }
      
      public function get ID_EASE_OUT() : int
      {
         return this._instanceTypeEaseOutTo;
      }
      
      public function get ID_EASE_IN() : int
      {
         return this._instanceTypeEaseInTo;
      }
      
      public function get ID_MOVE_TO() : int
      {
         return this._instanceTypeMoveTo;
      }
      
      private function AddEngineClass() : void
      {
         this._instanceTypeMoveTo = PushClassLink(MoveTo);
         this._instanceTypeEaseOutTo = PushClassLink(EaseOutTo);
         this._instanceTypeEaseInTo = PushClassLink(EaseInTo);
         this._instanceTypeFadeColor = PushClassLink(ObjetMoteurFadeColor);
      }
   }
}

