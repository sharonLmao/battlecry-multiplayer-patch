package com.battlecry.levelEvent
{
   import com.lachhhEngine.games.level.levelEvents.LevelEventFactory;
   
   public class BC_LevelEventFactory extends LevelEventFactory
   {
      
      public function BC_LevelEventFactory()
      {
         super();
         PushClassLink(levelEvent1);
      }
   }
}

