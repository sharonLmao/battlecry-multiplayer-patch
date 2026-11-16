package com.lachhhEngine.games.scenario
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObject;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaGameEventSwitch;
   
   public class GameEventManager extends FactoryObjectManager
   {
      
      public function GameEventManager(context:Game, gameEventFactory:GameEventFactory)
      {
         super(gameEventFactory,MetaObject,FactoryObject,context,"Game Switch");
      }
      
      public function CreateGameEventSwitch(metaGameEventSwitch:MetaGameEventSwitch) : GameEventSwitch
      {
         metaGameEventSwitch.instanceType = GameEventFactory(factory).ID_GAME_EVENT_SWITCH;
         var gameEventSwitch:GameEventSwitch = GameEventSwitch(Create(metaGameEventSwitch));
         var team:int = context.teamFactory.GetTeamNumberByName(metaGameEventSwitch.team);
         LevelLayer(metaGameEventSwitch.metaLayer.factoryObject).AddTeamCollision(gameEventSwitch,team);
         return gameEventSwitch;
      }
      
      public function DestroyGameEventSwitch(gameEventSwitch:GameEventSwitch) : void
      {
         var metaGameEventSwitch:MetaGameEventSwitch = MetaGameEventSwitch(gameEventSwitch.metaInfo);
         LevelLayer(metaGameEventSwitch.metaLayer.factoryObject).RemoveTeamCollision(gameEventSwitch,context.teamFactory.GetTeamNumberByName(metaGameEventSwitch.team));
         Destroy(gameEventSwitch);
      }
      
      public function get typedFactory() : GameEventFactory
      {
         return GameEventFactory(factory);
      }
      
      public function DestroyAllEventSwitch() : void
      {
         while(activeFactoryObjects.length > 0)
         {
            this.DestroyGameEventSwitch(activeFactoryObjects[0] as GameEventSwitch);
         }
      }
      
      public function SendMessage(s:String) : void
      {
         context.levelEventManager.GetCurrentLevelEvent().OnMessage(context,s);
      }
   }
}

