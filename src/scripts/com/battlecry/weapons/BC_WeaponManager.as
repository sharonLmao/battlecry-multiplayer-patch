package com.battlecry.weapons
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.weapon.WeaponFactory;
   import com.lachhhEngine.games.weapon.WeaponManager;
   
   public class BC_WeaponManager extends WeaponManager
   {
      
      public function BC_WeaponManager(context:Game, objFactory:WeaponFactory)
      {
         super(context,objFactory);
      }
   }
}

