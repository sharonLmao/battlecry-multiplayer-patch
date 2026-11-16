package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.heurtable.IHeurtableContainer;
   
   public class MetaLineCollision extends MetaLine
   {
      
      private var _owner:IHeurtableContainer;
      
      public function MetaLineCollision()
      {
         super();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._owner = null;
      }
      
      public function get owner() : IHeurtableContainer
      {
         return this._owner;
      }
      
      public function set owner(owner:IHeurtableContainer) : void
      {
         this._owner = owner;
      }
   }
}

