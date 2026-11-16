package com.lachhhEngine.games.hero
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import com.lachhhEngine.games.factory.ObjectFactory;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.utils.Utils;
   
   public class HeroManager extends FactoryObjectManager
   {
      
      public function HeroManager(context:Game, heroFactory:ObjectFactory)
      {
         super(heroFactory,MetaActor,Actor,context,"Hero");
      }
      
      public function DestroyAllHero() : void
      {
         while(activeFactoryObjects.length > 0)
         {
            this.DestroyHero(activeFactoryObjects[0] as Actor);
         }
      }
      
      public function GetPlayer1() : Actor
      {
         if(activeFactoryObjects.length <= 0)
         {
            return null;
         }
         return activeFactoryObjects[0] as Actor;
      }
      
      public function DestroyHero(hero:Actor) : void
      {
         Utils.LazyRemoveFromParent(hero.animationContainer);
         context.camera.RemoveActeur(hero);
         context.RemoveUpdatable(hero);
         Destroy(hero);
      }
      
      public function CreateHero(metaHero:MetaActor) : Actor
      {
         var hero:Actor = Actor(Create(metaHero));
         LevelLayer(metaHero.metaLayer.factoryObject).GetHeroContainer().addChild(hero.animationContainer);
         context.AddUpdatable(hero);
         context.camera.AddActeur(hero);
         return hero;
      }
   }
}

