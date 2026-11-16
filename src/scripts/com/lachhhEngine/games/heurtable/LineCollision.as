package com.lachhhEngine.games.heurtable
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaLineCollision;
   import com.lachhhEngine.games.physique.Collision;
   import com.lachhhEngine.games.physique.Line;
   
   public class LineCollision extends Line implements IHeurtable
   {
      
      private var _owner:IHeurtableContainer;
      
      public function LineCollision()
      {
         super();
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         super.Init(metaInfo,context);
         this._owner = MetaLineCollision(metaInfo).owner;
      }
      
      public function set owner(h:IHeurtableContainer) : void
      {
         this._owner = h;
      }
      
      public function get owner() : IHeurtableContainer
      {
         return this._owner;
      }
      
      public function OnHit(h:IHeurtable, oCol:Collision) : void
      {
      }
   }
}

