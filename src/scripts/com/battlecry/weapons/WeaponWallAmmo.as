package com.battlecry.weapons
{
   import com.battlecry.meta.MetaWeaponWall;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaAmmo;
   import com.lachhhEngine.games.physique.EquationVecto;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class WeaponWallAmmo extends BC_Weapon
   {
      
      private var _startingPoint:Point = new Point();
      
      private var _ammoNbr:Number = 0;
      
      private var _totalDistance:Number = 0;
      
      public function WeaponWallAmmo()
      {
         super();
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         super.Init(metaInfo,context);
         this._ammoNbr = MetaWeaponWall(metaInfo).nombreBall;
         this._totalDistance = MetaWeaponWall(metaInfo).totalDistance;
      }
      
      override protected function ShootAmmo(endOfGun:MovieClip = null) : void
      {
         var i:int = 0;
         var currentAmmo:MetaAmmo = null;
         super.ShootAmmo();
         var angle:Number = 0;
         angle = EquationVecto.GetRotation(metaWeapon.metaAmmo.vx,0,metaWeapon.metaAmmo.vy,0) + 90;
         this._startingPoint.x = metaWeapon.metaAmmo.x;
         this._startingPoint.y = metaWeapon.metaAmmo.y;
         this._startingPoint.x -= EquationVecto.MyCos(angle) * this._totalDistance / 2;
         for(this._startingPoint.y -= EquationVecto.MySin(angle) * this._totalDistance / 2; i < this._ammoNbr; )
         {
            currentAmmo = MetaAmmo(metaWeapon.metaAmmo.clone());
            currentAmmo.x = this._startingPoint.x;
            currentAmmo.y = this._startingPoint.y;
            currentAmmo.x += i * EquationVecto.MyCos(angle) * (this._totalDistance / this._ammoNbr);
            currentAmmo.y += i * EquationVecto.MySin(angle) * (this._totalDistance / this._ammoNbr);
            context.ammoManager.CreateAmmo(currentAmmo);
            i++;
         }
      }
   }
}

