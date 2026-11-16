package com.battlecry.weapons
{
   import com.lachhhEngine.games.weapon.WeaponFactory;
   
   public class BC_WeaponFactory extends WeaponFactory
   {
      
      public static var ID_META_MK_WEAPON_CIRCLE:int;
      
      public static var ID_META_MK_WEAPON_WALL:int;
      
      public static var ID_META_MK_WEAPON_SPREAD:int;
      
      public static var ID_META_MK_WEAPON_THROW:int;
      
      public function BC_WeaponFactory()
      {
         super();
         ID_META_MK_WEAPON_THROW = PushClassLink(WeaponThrowAmmo);
         ID_META_MK_WEAPON_SPREAD = PushClassLink(WeaponSpreadAmmo);
         ID_META_MK_WEAPON_CIRCLE = PushClassLink(WeaponCircleAmmo);
         ID_META_MK_WEAPON_WALL = PushClassLink(WeaponWallAmmo);
      }
   }
}

