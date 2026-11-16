package com.battlecry.meta.model
{
   public class ModelObject
   {
      
      private var _id:int;
      
      public function ModelObject(id:int)
      {
         super();
         this._id = id;
      }
      
      public function get isNull() : Boolean
      {
         return this._id == -1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
   }
}

