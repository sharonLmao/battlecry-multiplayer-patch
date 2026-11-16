package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.heurtable.IHeurtableContainer;
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class MetaAmmo extends MetaActor
   {
      
      private var _speed:int;
      
      private var _rayon:int;
      
      private var _targetTeam:int;
      
      private var _owner:IHeurtableContainer;
      
      private var _dmg:Number;
      
      public function MetaAmmo()
      {
         super();
      }
      
      public function get owner() : IHeurtableContainer
      {
         return this._owner;
      }
      
      override public function cloneAttributes(metaObject:MetaObject) : void
      {
         super.cloneAttributes(metaObject);
         var metaAmmo:MetaAmmo = MetaAmmo(metaObject);
         this.owner = metaAmmo.owner;
         this.dmg = metaAmmo.dmg;
         this.rayon = metaAmmo.rayon;
         this.targetTeam = metaAmmo.targetTeam;
         this.speed = metaAmmo.speed;
      }
      
      public function get dmg() : Number
      {
         return this._dmg;
      }
      
      public function set owner(owner:IHeurtableContainer) : void
      {
         this._owner = owner;
      }
      
      public function get speed() : int
      {
         return this._speed;
      }
      
      public function get rayon() : int
      {
         return this._rayon;
      }
      
      public function set targetTeam(targetTeam:int) : void
      {
         this._targetTeam = targetTeam;
      }
      
      public function get targetTeam() : int
      {
         return this._targetTeam;
      }
      
      public function set rayon(rayon:int) : void
      {
         this._rayon = rayon;
      }
      
      public function set speed(speed:int) : void
      {
         this._speed = speed;
      }
      
      public function set dmg(dmg:Number) : void
      {
         this._dmg = dmg;
      }
   }
}

