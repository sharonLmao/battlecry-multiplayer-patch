package com.battlecry.meta.model
{
   import com.battlecry.meta.MetaFlag;
   
   public class ModelFlagEnum
   {
      
      private static var _id:int = 0;
      
      public static var FLAG_NULL:ModelFlag = new ModelFlag(-1,ModelFlag.TYPE_FOND,2,-1,-1,-1,-1);
      
      public static var ALL:Vector.<ModelFlag> = new Vector.<ModelFlag>();
      
      public static var FOND:Vector.<ModelFlag> = new Vector.<ModelFlag>();
      
      public static var SYMBOLE1:Vector.<ModelFlag> = new Vector.<ModelFlag>();
      
      public static var SYMBOLE2:Vector.<ModelFlag> = new Vector.<ModelFlag>();
      
      public static var FOND_1:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,3,-1,-1,-1,-1);
      
      public static var FOND_2:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,4,-1,-1,-1,-1);
      
      public static var FOND_3:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,5,-1,-1,-1,-1);
      
      public static var FOND_4:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,6,-1,-1,-1,-1);
      
      public static var FOND_5:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,7,-1,-1,-1,-1);
      
      public static var FOND_6:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,8,-1,-1,-1,-1);
      
      public static var FOND_7:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,9,-1,-1,-1,-1);
      
      public static var FOND_8:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,10,-1,-1,-1,-1);
      
      public static var FOND_9:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,11,-1,-1,-1,-1);
      
      public static var FOND_10:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,12,-1,-1,-1,-1);
      
      public static var FOND_11:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,13,-1,-1,-1,-1);
      
      public static var FOND_12:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,14,-1,-1,-1,-1);
      
      public static var FOND_13:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,15,-1,-1,-1,-1);
      
      public static var FOND_14:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,16,-1,-1,-1,-1);
      
      public static var FOND_15:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,17,-1,-1,-1,-1);
      
      public static var FOND_16:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,18,-1,-1,-1,-1);
      
      public static var FOND_17:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,19,-1,-1,-1,-1);
      
      public static var FOND_18:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,20,-1,-1,-1,-1);
      
      public static var FOND_19:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,21,-1,-1,-1,-1);
      
      public static var FOND_20:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,22,-1,-1,-1,-1);
      
      public static var FOND_21:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,23,-1,-1,-1,-1);
      
      public static var FOND_22:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_FOND,24,-1,-1,-1,-1);
      
      public static var SYMBOLE1_SWORD:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,3,-1,-1,-1,-1);
      
      public static var SYMBOLE1_AXE:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,4,-1,-1,-1,-1);
      
      public static var SYMBOLE1_CROSS:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,5,-1,-1,-1,-1);
      
      public static var SYMBOLE1_BAT:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,6,2,-1,-1,-1);
      
      public static var SYMBOLE1_VERMIN:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,7,3,-1,-1,-1);
      
      public static var SYMBOLE1_HELM:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,8,4,-1,-1,-1);
      
      public static var SYMBOLE1_ORC:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,9,5,-1,-1,-1);
      
      public static var SYMBOLE1_STAR:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,10,6,-1,-1,-1);
      
      public static var SYMBOLE1_EAGLE:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,11,7,-1,-1,-1);
      
      public static var SYMBOLE1_SKULL:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,12,8,-1,-1,-1);
      
      public static var SYMBOLE1_EYE:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,13,9,-1,-1,-1);
      
      public static var SYMBOLE1_BULL_SKULL:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,14,10,-1,-1,-1);
      
      public static var SYMBOLE1_DRAGON:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,15,11,-1,-1,-1);
      
      public static var SYMBOLE1_FAUX:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,16,12,-1,-1,-1);
      
      public static var SYMBOLE1_OCTOPOD:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,17,13,-1,-1,-1);
      
      public static var SYMBOLE1_SKULL_2:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,18,14,-1,-1,-1);
      
      public static var SYMBOLE1_EAGLE_2:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,19,15,-1,-1,-1);
      
      public static var SYMBOLE1_BULL:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,20,16,-1,-1,-1);
      
      public static var SYMBOLE1_SKULL_3:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,21,17,-1,-1,-1);
      
      public static var SYMBOLE1_EAGLE_3:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,22,18,-1,-1,-1);
      
      public static var SYMBOLE1_DEMON:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,23,19,-1,-1,-1);
      
      public static var SYMBOLE1_UNICORN:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,24,20,-1,-1,-1);
      
      public static var SYMBOLE2_OCTOGON:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,3,-1,-1,-1,-1);
      
      public static var SYMBOLE2_HEXAGON:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,4,-1,-1,-1,-1);
      
      public static var SYMBOLE2_PENTAGON:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,5,-1,-1,-1,-1);
      
      public static var SYMBOLE2_LOSANGE:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,6,2,-1,-1,-1);
      
      public static var SYMBOLE2_SUN:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,7,3,-1,-1,-1);
      
      public static var SYMBOLE2_X:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,8,4,-1,-1,-1);
      
      public static var SYMBOLE2_STAR:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,9,5,-1,-1,-1);
      
      public static var SYMBOLE2_BANNER:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,10,6,-1,-1,-1);
      
      public static var SYMBOLE2_LYS:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,11,7,-1,-1,-1);
      
      public static var SYMBOLE2_SHIELD:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,12,8,-1,-1,-1);
      
      public static var SYMBOLE2_CIRCLE:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,13,9,-1,-1,-1);
      
      public static var SYMBOLE2_SQUARE_EXP:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,14,10,-1,-1,-1);
      
      public static var SYMBOLE2_SUN_2:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,15,11,-1,-1,-1);
      
      public static var SYMBOLE2_SHIELD_2:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,16,12,-1,-1,-1);
      
      public static var SYMBOLE2_PLUS:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,17,13,-1,-1,-1);
      
      public static var SYMBOLE2_BANNER_2:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,18,14,-1,-1,-1);
      
      public static var SYMBOLE2_GEAR:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,19,15,-1,-1,-1);
      
      public static var SYMBOLE2_CROSS:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,20,16,-1,-1,-1);
      
      public static var SYMBOLE2_TRIANGLE:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,21,17,-1,-1,-1);
      
      public static var SYMBOLE2_2SWORD:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,22,18,-1,-1,-1);
      
      public static var SYMBOLE2_BADGE:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,23,19,-1,-1,-1);
      
      public static var SYMBOLE2_CREST:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE2,24,20,-1,-1,-1);
      
      public static var SYMBOLE1_SPIDER:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,25,-1,1,-1,-1);
      
      public static var SYMBOLE1_SWORD_SNAKE:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,26,-1,2,-1,-1);
      
      public static var SYMBOLE1_BOAR:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,27,-1,3,-1,-1);
      
      public static var SYMBOLE1_ROMAN:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,28,-1,4,-1,-1);
      
      public static var SYMBOLE1_OLYMPIC:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,29,-1,5,-1,-1);
      
      public static var SYMBOLE1_MOUNTAIN:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,30,-1,-1,4,-1);
      
      public static var SYMBOLE1_TOWER:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,31,-1,-1,8,-1);
      
      public static var SYMBOLE1_THORN:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,32,-1,-1,12,-1);
      
      public static var SYMBOLE1_MOON_SUN:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,33,-1,-1,16,-1);
      
      public static var SYMBOLE1_TRI_ARROW:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,34,-1,-1,20,-1);
      
      public static var SYMBOLE1_SEA_MONSTER:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,35,-1,-1,-1,4);
      
      public static var SYMBOLE1_SPEAR_SKULL:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,36,-1,-1,-1,8);
      
      public static var SYMBOLE1_SATAN_STAR:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,37,-1,-1,-1,12);
      
      public static var SYMBOLE1_MOOSE:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,38,-1,-1,-1,16);
      
      public static var SYMBOLE1_COQ:ModelFlag = CreateModelFlag(_id++,ModelFlag.TYPE_SYMBOLE1,39,-1,-1,-1,20);
      
      public function ModelFlagEnum()
      {
         super();
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
      
      public static function CreateFlagCampain(i:int) : MetaFlag
      {
         var metaFlag:MetaFlag = new MetaFlag();
         metaFlag.fond = GetFromId(i);
         metaFlag.symbole1 = GetFromId(i + 22);
         metaFlag.symbole2 = GetFromId(i + 43);
         return metaFlag;
      }
      
      public static function GetFromId(id:int) : ModelFlag
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            if(id == ALL[i].id)
            {
               return ALL[i];
            }
         }
         return FLAG_NULL;
      }
      
      private static function CreateModelFlag(id:int, type:int, visualFrame:int, lvlToUnlock:int, numTournamentToWin:int, soloSurvivalWave:int, coopSurvivalWave:int) : ModelFlag
      {
         var m:ModelFlag = new ModelFlag(id,type,visualFrame,lvlToUnlock,numTournamentToWin,soloSurvivalWave,coopSurvivalWave);
         ALL.push(m);
         switch(m.type)
         {
            case ModelFlag.TYPE_FOND:
               FOND.push(m);
               break;
            case ModelFlag.TYPE_SYMBOLE1:
               SYMBOLE1.push(m);
               break;
            case ModelFlag.TYPE_SYMBOLE2:
               SYMBOLE2.push(m);
         }
         return m;
      }
   }
}

