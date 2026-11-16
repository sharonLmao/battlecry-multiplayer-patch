package com.battlecry.hero
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.ObjectFactory;
   import com.lachhhEngine.games.hero.HeroManager;
   
   public class BC_HeroManager extends HeroManager
   {
      
      public function BC_HeroManager(context:Game, heroFactory:ObjectFactory)
      {
         super(context,heroFactory);
      }
   }
}

