package com.lachhhEngine.games.teams
{
   public class TeamFactory
   {
      
      public const ALL_PERSO_TEAM:int = 3;
      
      public const ALLY1_TEAM:int = 1;
      
      public const NB_TEAM:int = 6;
      
      public const ALLY_EVENT_TEAM:int = 4;
      
      public const ALLY_ITEM_TEAM:int = 16;
      
      public const ENEMY1_TEAM:int = 2;
      
      public const ENEMY_ITEM_TEAM:int = 32;
      
      public const ENEMY_EVENT_TEAM:int = 8;
      
      public const ALL_ITEM_TEAM:int = 48;
      
      public const ALL_TEAM:int = 63;
      
      public function TeamFactory()
      {
         super();
      }
      
      public function GetTeamNameById(i:int) : String
      {
         switch(i)
         {
            case this.ALLY1_TEAM:
               return "ALLY1_TEAM";
            case this.ENEMY1_TEAM:
               return "ENEMY1_TEAM";
            case this.ALL_PERSO_TEAM:
               return "ALL_PERSO_TEAM";
            case this.ALLY_EVENT_TEAM:
               return "ALLY_EVENT_TEAM";
            case this.ENEMY_EVENT_TEAM:
               return "ENEMY_EVENT_TEAM";
            case this.ALLY_ITEM_TEAM:
               return "ALLY_ITEM_TEAM";
            case this.ENEMY_ITEM_TEAM:
               return "ENEMY_ITEM_TEAM";
            case this.ALL_ITEM_TEAM:
               return "ALL_ITEM_TEAM";
            case this.ALL_TEAM:
               return "ALL_TEAM";
            default:
               return "null";
         }
      }
      
      public function GetTeamNumberByName(str:String) : Number
      {
         if(this[str] == undefined)
         {
            trace("ERROR :: Game_c :: GetTeamNumberByName :: WRONG NAME : " + str);
            return -1;
         }
         return this[str];
      }
   }
}

