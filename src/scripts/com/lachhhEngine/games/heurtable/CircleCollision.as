package com.lachhhEngine.games.heurtable
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaCircleCollision;
   import com.lachhhEngine.games.physique.Circle;
   import com.lachhhEngine.games.physique.Collision;
   
   public class CircleCollision extends Circle implements IHeurtable
   {
      
      private var _owner:IHeurtableContainer = null;
      
      public function CircleCollision()
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
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         var metaCircleCol:MetaCircleCollision = MetaCircleCollision(metaObject);
         this._owner = metaCircleCol.owner;
      }
      
      public function OnHit(h:IHeurtable, oCol:Collision) : void
      {
         this._owner.OnOwnerHit(this,h,oCol);
      }
   }
}

