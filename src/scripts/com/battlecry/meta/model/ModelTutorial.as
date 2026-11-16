package com.battlecry.meta.model
{
   public class ModelTutorial
   {
      
      private var _tutoScreen:int;
      
      private var _id:int;
      
      public function ModelTutorial(id:int, tutoScreen:int)
      {
         super();
         this._id = id;
         this._tutoScreen = tutoScreen;
      }
      
      public function set tutoScreen(tutoScreen:int) : void
      {
         this._tutoScreen = tutoScreen;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function get tutoScreen() : int
      {
         return this._tutoScreen;
      }
      
      public function get id() : int
      {
         return this._id;
      }
   }
}

