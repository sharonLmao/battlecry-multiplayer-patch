package com.lachhhEngine.games.enemy
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.customs.AddInSightActorManager;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.physique.Actor;
   
   public class EnemyManager extends AddInSightActorManager
   {
      
      public function EnemyManager(context:Game, enemyFactory:EnemyFactory)
      {
         super(LevelLayer.ENEMY_ID,enemyFactory,MetaActor,Actor,context,"Enemy");
      }
   }
}

