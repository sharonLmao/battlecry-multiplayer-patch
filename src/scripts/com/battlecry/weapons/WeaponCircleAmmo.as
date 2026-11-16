package com.battlecry.weapons
{
   import com.battlecry.meta.MetaWeaponCircle;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaAmmo;
   import com.lachhhEngine.games.physique.EquationVecto;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class WeaponCircleAmmo extends BC_Weapon
   {
      
      private var _ammoNbr:Number = 0;
      
      private var _currentPoint:Point = new Point();
      
      private var _circleVelocity:Number = 0;
      
      private var _totalAngle:Number = 0;
      
      public function WeaponCircleAmmo()
      {
         super();
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         super.Init(metaInfo,context);
         this._ammoNbr = MetaWeaponCircle(metaInfo).nombreBall;
         this._circleVelocity = MetaWeaponCircle(metaInfo).spreadVelocity;
         this._currentPoint.x = 0;
         this._currentPoint.y = 0;
         this._totalAngle = 360;
      }
      
      override protected function ShootAmmo(endOfGun:MovieClip = null) : void
      {
         var i:int = 0;
         var currentAmmo:MetaAmmo = null;
         super.ShootAmmo();
         this._currentPoint.x = metaWeapon.metaAmmo.x;
         for(this._currentPoint.y = metaWeapon.metaAmmo.y; i < this._ammoNbr; )
         {
            currentAmmo = MetaAmmo(metaWeapon.metaAmmo.clone());
            currentAmmo.x = metaWeapon.metaAmmo.x;
            currentAmmo.y = metaWeapon.metaAmmo.y;
            currentAmmo.x += 20 * EquationVecto.MyCos(this._totalAngle / this._ammoNbr * i);
            currentAmmo.y += 20 * EquationVecto.MySin(this._totalAngle / this._ammoNbr * i);
            currentAmmo.vx += EquationVecto.MyCos(this._totalAngle / this._ammoNbr * i) * this._circleVelocity * 0.25;
            currentAmmo.vy += EquationVecto.MySin(this._totalAngle / this._ammoNbr * i) * this._circleVelocity * 0.25;
            context.ammoManager.CreateAmmo(currentAmmo);
            i++;
         }
      }
   }
}

