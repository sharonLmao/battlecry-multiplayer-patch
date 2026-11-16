package com.battlecry.meta
{
   public class metaShadow extends BC_MetaUnit
   {
      
      private var _root:BC_MetaUnit;
      
      private var _posInVector:int;
      
      public function metaShadow(root:BC_MetaUnit, posInVector:int)
      {
         super(-2);
         this._root = root;
         this._posInVector = posInVector;
      }
      
      public function set root(root:BC_MetaUnit) : void
      {
         this._root = root;
      }
      
      public function set posInVector(posInVector:int) : void
      {
         this._posInVector = posInVector;
      }
      
      public function get root() : BC_MetaUnit
      {
         return this._root;
      }
      
      public function get posInVector() : int
      {
         return this._posInVector;
      }
   }
}

