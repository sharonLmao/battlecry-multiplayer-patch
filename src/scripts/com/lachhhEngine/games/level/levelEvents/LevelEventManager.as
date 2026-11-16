package com.lachhhEngine.games.level.levelEvents
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObject;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaLevelEvent;
   
   public class LevelEventManager extends FactoryObjectManager
   {
      
      private var _crntLevel:LevelEvent;
      
      public function LevelEventManager(context:Game, levelEventFactory:LevelEventFactory)
      {
         super(levelEventFactory,MetaLevelEvent,LevelEvent,context);
      }
      
      public function DoActionLevel(context:Game, action:int) : void
      {
         this._crntLevel.DoAction(context,action);
      }
      
      public function InitLevel(context:Game, levelEventId:int) : void
      {
         this.DestroyLevel(context);
         var metaLevelEvent:MetaLevelEvent = MetaManager.instance.CreateMetaLevelEvent(levelEventId);
         this._crntLevel = LevelEvent(Create(metaLevelEvent));
      }
      
      public function GetCurrentLevelEvent() : LevelEvent
      {
         return this._crntLevel;
      }
      
      public function DestroyLevel(context:Game) : void
      {
         if(this._crntLevel != null)
         {
            Destroy(FactoryObject(this._crntLevel));
            this._crntLevel = null;
         }
      }
      
      public function UpdateLevel(context:Game) : void
      {
         if(this._crntLevel != null)
         {
            this._crntLevel.UpdateLevel(context);
         }
      }
      
      public function SetCurrentLevelEvent(levelEvent:LevelEvent) : void
      {
         this._crntLevel = levelEvent;
      }
   }
}

