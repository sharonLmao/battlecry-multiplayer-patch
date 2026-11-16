package com.battlecry.meta
{
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class MetaWeaponCircle extends BC_MetaWeapon
   {
      
      private var _NombreBall:Number;
      
      private var _SpreadVelocity:Number;
      
      public function MetaWeaponCircle()
      {
         super();
      }
      
      public function get spreadVelocity() : Number
      {
         return this._SpreadVelocity;
      }
      
      public function set nombreBall(nombreBall:Number) : void
      {
         this._NombreBall = nombreBall;
      }
      
      override public function cloneAttributes(metaObject:MetaObject) : void
      {
         super.cloneAttributes(metaObject);
         var metaWeapon:MetaWeaponCircle = MetaWeaponCircle(metaObject);
         this._SpreadVelocity = metaWeapon.spreadVelocity;
         this._NombreBall = metaWeapon.nombreBall;
      }
      
      public function set spreadVelocity(spreadVelocity:Number) : void
      {
         this._SpreadVelocity = spreadVelocity;
      }
      
      public function get nombreBall() : Number
      {
         return this._NombreBall;
      }
   }
}

