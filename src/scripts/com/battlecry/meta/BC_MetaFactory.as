package com.battlecry.meta
{
   import com.lachhhEngine.games.meta.MetaFactory;
   
   public class BC_MetaFactory extends MetaFactory
   {
      
      public static var ID_META_SQUAD:int;
      
      public static var ID_META_MK_HERO:int;
      
      public static var ID_META_MK_WEAPON:int;
      
      public static var ID_META_MK_WEAPON_WALL:int;
      
      public static var ID_META_MK_WEAPON_SPREAD:int;
      
      public static var ID_META_MK_WEAPON_CIRCLE:int;
      
      public static var ID_META_MK_ACTOR:int;
      
      public static var ID_META_ARMY:int;
      
      public function BC_MetaFactory()
      {
         super();
         ID_META_MK_ACTOR = PushClassLink(BC_MetaActor);
         ID_META_MK_HERO = PushClassLink(BC_MetaHero);
         ID_META_MK_WEAPON = PushClassLink(BC_MetaWeapon);
         ID_META_MK_WEAPON_SPREAD = PushClassLink(MetaWeaponSpread);
         ID_META_MK_WEAPON_CIRCLE = PushClassLink(MetaWeaponCircle);
         ID_META_MK_WEAPON_WALL = PushClassLink(MetaWeaponWall);
         ID_META_ARMY = PushClassLink(BC_MetaArmy);
         ID_META_SQUAD = PushClassLink(BC_MetaSquad);
      }
   }
}

