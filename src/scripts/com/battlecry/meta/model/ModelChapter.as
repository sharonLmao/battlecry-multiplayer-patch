package com.battlecry.meta.model
{
   public class ModelChapter
   {
      
      private var _act:int;
      
      private var _nameID:int;
      
      private var _id:int;
      
      public function ModelChapter(id:int, nameID:int, act:int)
      {
         super();
         this._id = id;
         this._nameID = nameID;
         this._act = act;
      }
      
      public function set act(act:int) : void
      {
         this._act = act;
      }
      
      public function set nameID(nameID:int) : void
      {
         this._nameID = nameID;
      }
      
      public function get nameID() : int
      {
         return this._nameID;
      }
      
      public function get act() : int
      {
         return this._act;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function get id() : int
      {
         return this._id;
      }
   }
}

