package com.battlecry.weapons
{
   import com.lachhhEngine.games.meta.metaObject.MetaAmmo;
   import flash.display.MovieClip;
   
   public class WeaponThrowAmmo extends BC_Weapon
   {
      
      public function WeaponThrowAmmo()
      {
         super();
      }
      
      override protected function ShootAmmo(endOfGun:MovieClip = null) : void
      {
         super.ShootAmmo();
         context.ammoManager.CreateAmmo(MetaAmmo(metaWeapon.metaAmmo.clone()));
      }
   }
}

