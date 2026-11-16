package com.battlecry.meta.model
{
   import com.battlecry.multilingual.BC_TextFactory;
   
   public class ModelRankingEnum
   {
      
      private static var _id:int = 0;
      
      public static var STATS_NULL:ModelRanking = new ModelRanking(-1,-1,-1);
      
      public static var ALL:Vector.<ModelRanking> = new Vector.<ModelRanking>();
      
      public static var RANKING_SERF:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_SERF,BC_TextFactory.ID_RANKING_SERF);
      
      public static var RANKING_PEASANT:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_PEASANT,BC_TextFactory.ID_RANKING_PEASANT);
      
      public static var RANKING_CONSCRIPT:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_CONSCRIPT,BC_TextFactory.ID_RANKING_CONSCRIPT);
      
      public static var RANKING_SQUIRE:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_SQUIRE,BC_TextFactory.ID_RANKING_SQUIRE);
      
      public static var RANKING_MEN_AT_ARMS:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_MEN_AT_ARMS,BC_TextFactory.ID_RANKING_MEN_AT_ARMS);
      
      public static var RANKING_SOLDIER:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_SOLDIER,BC_TextFactory.ID_RANKING_SOLDIER);
      
      public static var RANKING_MERCENARY:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_MERCENARY,BC_TextFactory.ID_RANKING_MERCENARY);
      
      public static var RANKING_ELITE_SOLDIER:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_ELITE_SOLDIER,BC_TextFactory.ID_RANKING_ELITE_SOLDIER);
      
      public static var RANKING_CAPTAIN:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_CAPTAIN,BC_TextFactory.ID_RANKING_CAPTAIN);
      
      public static var RANKING_KNIGHT:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_KNIGHT,BC_TextFactory.ID_RANKING_KNIGHT);
      
      public static var RANKING_BARON:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_BARON,BC_TextFactory.ID_RANKING_BARON);
      
      public static var RANKING_DUKE:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_DUKE,BC_TextFactory.ID_RANKING_DUKE);
      
      public static var RANKING_LORD:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_LORD,BC_TextFactory.ID_RANKING_LORD);
      
      public static var RANKING_CHAMPION:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_CHAMPION,BC_TextFactory.ID_RANKING_CHAMPION);
      
      public static var RANKING_COMMANDER:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_COMMANDER,BC_TextFactory.ID_RANKING_COMMANDER);
      
      public static var RANKING_GENERAL:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_GENERAL,BC_TextFactory.ID_RANKING_GENERAL);
      
      public static var RANKING_BATTLE_MASTER:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_BATTLE_MASTER,BC_TextFactory.ID_RANKING_BATTLE_MASTER);
      
      public static var RANKING_HERO:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_HERO,BC_TextFactory.ID_RANKING_HERO);
      
      public static var RANKING_ARCH_DUKE:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_ARCH_DUKE,BC_TextFactory.ID_RANKING_ARCH_DUKE);
      
      public static var RANKING_CHANCELLOR:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_CHANCELLOR,BC_TextFactory.ID_RANKING_CHANCELLOR);
      
      public static var RANKING_WARLORD:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_WARLORD,BC_TextFactory.ID_RANKING_WARLORD);
      
      public static var RANKING_KING:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_KING,BC_TextFactory.ID_RANKING_KING);
      
      public static var RANKING_OVERLORD:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_OVERLORD,BC_TextFactory.ID_RANKING_OVERLORD);
      
      public static var RANKING_EMPEROR:ModelRanking = CreateModelRanking(_id++,ModelRanking.RANKING_EMPEROR,BC_TextFactory.ID_RANKING_EMPEROR);
      
      public function ModelRankingEnum()
      {
         super();
      }
      
      private static function CreateModelRanking(id:int, value:int, nameID:int) : ModelRanking
      {
         var m:ModelRanking = new ModelRanking(id,value,nameID);
         ALL.push(m);
         return m;
      }
      
      public static function GetFromId(id:int) : ModelRanking
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            if(id == ALL[i].id)
            {
               return ALL[i];
            }
         }
         return STATS_NULL;
      }
   }
}

