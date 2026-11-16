package com.lachhhEngine.games.scenario
{
   import com.lachhhEngine.games.heurtable.IHeurtable;
   import com.lachhhEngine.games.heurtable.IHeurtableContainer;
   import com.lachhhEngine.games.meta.metaObject.MetaGameEventSwitch;
   import com.lachhhEngine.games.physique.Circle;
   import com.lachhhEngine.games.physique.Collision;
   
   public class GameEventSwitch extends Circle implements IHeurtable
   {
      
      private var _bIsDestroyed:Boolean = false;
      
      public function GameEventSwitch()
      {
         super();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         if(this._bIsDestroyed)
         {
            return;
         }
         this._bIsDestroyed = true;
      }
      
      public function set owner(h:IHeurtableContainer) : void
      {
      }
      
      public function get gameEventMgr() : GameEventManager
      {
         return GameEventManager(factoryObjectManager);
      }
      
      public function get owner() : IHeurtableContainer
      {
         return null;
      }
      
      public function set team(team:String) : void
      {
         MetaGameEventSwitch(metaInfo).team = team;
      }
      
      public function OnHit(h:IHeurtable, oCol:Collision) : void
      {
         var metaGameEventSwitch:MetaGameEventSwitch = MetaGameEventSwitch(metaInfo);
         this.gameEventMgr.SendMessage(MetaGameEventSwitch(metaInfo).message);
         if(metaGameEventSwitch.destroyable)
         {
            this.gameEventMgr.DestroyGameEventSwitch(this);
         }
      }
      
      public function get team() : String
      {
         return MetaGameEventSwitch(metaInfo).team;
      }
   }
}

