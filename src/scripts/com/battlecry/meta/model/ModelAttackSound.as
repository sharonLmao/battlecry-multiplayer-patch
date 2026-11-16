package com.battlecry.meta.model
{
   public class ModelAttackSound
   {
      
      private var _initialSound:int;
      
      private var _frameOfInitialSound:int;
      
      private var _finalSound:int;
      
      private var _id:int;
      
      public function ModelAttackSound(id1:int, initialSound1:int, frameOfInitialSound1:int, finalSound1:int)
      {
         super();
         this._id = id1;
         this._initialSound = initialSound1;
         this._frameOfInitialSound = frameOfInitialSound1;
         this._finalSound = finalSound1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set frameOfInitialSound(frameOfInitialSound:int) : void
      {
         this._frameOfInitialSound = frameOfInitialSound;
      }
      
      public function get initialSound() : int
      {
         return this._initialSound;
      }
      
      public function Reset() : void
      {
      }
      
      public function set finalSound(finalSound:int) : void
      {
         this._finalSound = finalSound;
      }
      
      public function set initialSound(initialSound:int) : void
      {
         this._initialSound = initialSound;
      }
      
      public function get finalSound() : int
      {
         return this._finalSound;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function get frameOfInitialSound() : int
      {
         return this._frameOfInitialSound;
      }
   }
}

