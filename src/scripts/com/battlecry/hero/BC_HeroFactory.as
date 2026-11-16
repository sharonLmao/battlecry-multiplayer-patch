package com.battlecry.hero
{
   import com.lachhhEngine.games.hero.HeroFactory;
   
   public class BC_HeroFactory extends HeroFactory
   {
      
      private static var _instance:BC_HeroFactory;
      
      public static var ID_HERO:int;
      
      public function BC_HeroFactory()
      {
         super();
         _instance = this;
      }
      
      override protected function AddGameClass() : void
      {
         super.AddGameClass();
         ID_HERO = PushClassLink(Hero);
      }
   }
}

