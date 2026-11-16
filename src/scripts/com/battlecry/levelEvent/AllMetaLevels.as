package com.battlecry.levelEvent
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaLevel;
   
   public class AllMetaLevels
   {
      
      public static var A1_Outside:MetaLevel;
      
      public function AllMetaLevels()
      {
         super();
      }
      
      public static function Init(context:Game) : void
      {
         A1_Outside = MetaManager.instance.CreateMetaLevel(LevelXML.LEVEL_XML,context);
      }
   }
}

