package com.lachhhEngine.games.physique
{
   import com.lachhhEngine.games.factory.ObjectFactory;
   import com.lachhhEngine.games.heurtable.CircleCollision;
   import com.lachhhEngine.games.heurtable.LineCollision;
   
   public class PhysicFactory extends ObjectFactory
   {
      
      private var _instanceActor:int;
      
      private var _instanceCircle:int;
      
      private var _instanceLineCollision:int;
      
      private var _instanceCircleCollision:int;
      
      private var _instanceLine:int;
      
      public function PhysicFactory()
      {
         super();
         this.AddGameClass();
         this.AddEngineClass();
      }
      
      protected function AddGameClass() : void
      {
      }
      
      public function get ID_CIRCLE_COLLISION() : int
      {
         return this._instanceCircleCollision;
      }
      
      public function get ID_LINE_COLLISION() : int
      {
         return this._instanceLineCollision;
      }
      
      public function get ID_ACTOR() : int
      {
         return this._instanceActor;
      }
      
      private function AddEngineClass() : void
      {
         this._instanceActor = PushClassLink(Actor);
         this._instanceCircle = PushClassLink(Circle);
         this._instanceCircleCollision = PushClassLink(CircleCollision);
         this._instanceLine = PushClassLink(Line);
         this._instanceLineCollision = PushClassLink(LineCollision);
      }
      
      public function get ID_LINE() : int
      {
         return this._instanceLine;
      }
      
      public function get ID_CIRCLE() : int
      {
         return this._instanceCircle;
      }
   }
}

