package com.lachhhEngine.games.weapon
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import com.lachhhEngine.games.meta.metaObject.MetaWeapon;
   
   public class WeaponManager extends FactoryObjectManager
   {
      
      public function WeaponManager(context:Game, objFactory:WeaponFactory)
      {
         super(objFactory,MetaWeapon,Weapon,context,"Weapon");
      }
      
      public function CreateWeapon(metaWeapon:MetaWeapon) : Weapon
      {
         return Weapon(Create(metaWeapon));
      }
      
      public function DestroyWeapon(weapon:Weapon) : void
      {
         Destroy(weapon);
      }
   }
}

