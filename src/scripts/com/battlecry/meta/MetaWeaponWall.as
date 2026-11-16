package com.battlecry.meta
{
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class MetaWeaponWall extends BC_MetaWeapon
   {
      
      private var _NombreBall:Number;
      
      private var _totalDistance:Number;
      
      public function MetaWeaponWall()
      {
         super();
      }
      
      public function set nombreBall(nombreBall:Number) : void
      {
         this._NombreBall = nombreBall;
      }
      
      public function set totalDistance(totalDis:Number) : void
      {
         this._totalDistance = totalDis;
      }
      
      override public function cloneAttributes(metaObject:MetaObject) : void
      {
         super.cloneAttributes(metaObject);
         var metaWeapon:MetaWeaponWall = MetaWeaponWall(metaObject);
         this._totalDistance = metaWeapon.totalDistance;
         this._NombreBall = metaWeapon.nombreBall;
      }
      
      public function get nombreBall() : Number
      {
         return this._NombreBall;
      }
      
      public function get totalDistance() : Number
      {
         return this._totalDistance;
      }
   }
}

