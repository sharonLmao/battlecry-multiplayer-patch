package com.battlecry.meta
{
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class MetaWeaponSpread extends BC_MetaWeapon
   {
      
      private var _totalAngle:Number;
      
      private var _NombreBall:Number;
      
      public function MetaWeaponSpread()
      {
         super();
      }
      
      public function set nombreBall(nombreBall:Number) : void
      {
         this._NombreBall = nombreBall;
      }
      
      override public function cloneAttributes(metaObject:MetaObject) : void
      {
         super.cloneAttributes(metaObject);
         var metaWeapon:MetaWeaponSpread = MetaWeaponSpread(metaObject);
         this._totalAngle = metaWeapon.totalAngle;
         this._NombreBall = metaWeapon.nombreBall;
      }
      
      public function get nombreBall() : Number
      {
         return this._NombreBall;
      }
      
      public function set totalAngle(totalAngle:Number) : void
      {
         this._totalAngle = totalAngle;
      }
      
      public function get totalAngle() : Number
      {
         return this._totalAngle;
      }
   }
}

