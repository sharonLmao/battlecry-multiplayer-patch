package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.heurtable.IHeurtableContainer;
   
   public class MetaCircleCollision extends MetaCircle
   {
      
      private var _owner:IHeurtableContainer;
      
      public function MetaCircleCollision()
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

