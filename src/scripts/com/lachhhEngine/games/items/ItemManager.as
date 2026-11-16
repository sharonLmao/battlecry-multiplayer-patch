package com.lachhhEngine.games.items
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.customs.ActorManager;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.physique.Actor;
   
   public class ItemManager extends ActorManager
   {
      
      public function ItemManager(context:Game, itemFactory:ItemFactory)
      {
         super(LevelLayer.ITEM_PART_ID,itemFactory,MetaActor,Actor,context,"Item");
      }
   }
}

