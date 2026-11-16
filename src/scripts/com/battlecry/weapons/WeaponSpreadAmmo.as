package com.battlecry.weapons
{
   import com.battlecry.meta.MetaWeaponSpread;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaAmmo;
   import com.lachhhEngine.games.physique.EquationVecto;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class WeaponSpreadAmmo extends BC_Weapon
   {
      
      private var _ammoNbr:Number = 0;
      
      private var _currentPoint:Point = new Point();
      
      private var _speed:int;
      
      private var _totalAngle:Number = 0;
      
      public function WeaponSpreadAmmo()
      {
         super();
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         super.Init(metaInfo,context);
         this._ammoNbr = MetaWeaponSpread(metaInfo).nombreBall;
         this._totalAngle = MetaWeaponSpread(metaInfo).totalAngle;
      }
      
      override protected function ShootAmmo(endOfGun:MovieClip = null) : void
      {
         var currentAmmo:MetaAmmo = null;
         var i:int = 0;
         super.ShootAmmo();
         var rot:Number = EquationVecto.GetRotation(metaWeapon.metaAmmo.vx,0,metaWeapon.metaAmmo.vy,0);
         this._currentPoint.x = metaWeapon.metaAmmo.vx;
         this._currentPoint.y = metaWeapon.metaAmmo.vy;
         this._speed = this._currentPoint.length;
         this._currentPoint.x -= EquationVecto.MyCos(this._totalAngle / 2);
         this._currentPoint.y -= EquationVecto.MySin(this._totalAngle / 2);
         rot -= this._totalAngle / 2;
         if(this._ammoNbr <= 1)
         {
            currentAmmo = MetaAmmo(metaWeapon.metaAmmo.clone());
            context.ammoManager.CreateAmmo(currentAmmo);
         }
         else
         {
            for(i = 0; i < this._ammoNbr; i++)
            {
               currentAmmo = MetaAmmo(metaWeapon.metaAmmo.clone());
               currentAmmo.vx = EquationVecto.MyCos(rot + i * (this._totalAngle / (this._ammoNbr - 1))) * this._speed;
               currentAmmo.vy = EquationVecto.MySin(rot + i * (this._totalAngle / (this._ammoNbr - 1))) * this._speed;
               context.ammoManager.CreateAmmo(currentAmmo);
            }
         }
      }
   }
}

