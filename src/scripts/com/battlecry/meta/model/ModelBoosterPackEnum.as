package com.battlecry.meta.model
{
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.multilingual.BC_TextFactory;
   
   public class ModelBoosterPackEnum
   {
      
      public static var ALL_SET:Array;
      
      public static var ALL_SET_TEXT:Array;
      
      private static var _id:int = 0;
      
      public static var BOOSTER_NULL:ModelBoosterPack = new ModelBoosterPack(-1,1,0,0,0,0,0,-1,-1,new Vector.<MetaEquipement>());
      
      public static var ALL:Vector.<ModelBoosterPack> = new Vector.<ModelBoosterPack>();
      
      public static var PRIME:Vector.<ModelBoosterPack> = new Vector.<ModelBoosterPack>();
      
      public static var EXPANSION1:Vector.<ModelBoosterPack> = new Vector.<ModelBoosterPack>();
      
      public static var MYTHIC:Vector.<ModelBoosterPack> = new Vector.<ModelBoosterPack>();
      
      public static var DAILY:Vector.<ModelBoosterPack> = new Vector.<ModelBoosterPack>();
      
      public static var PRIME_STONE_BOOSTER:ModelBoosterPack = CreateModelBoosterPack(_id++,1,380,0,0,1,14,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_PRIME_STONE_BOOSTER,new Vector.<MetaEquipement>(),false);
      
      public static var PRIME_STONE_STARTER:ModelBoosterPack = CreateModelBoosterPack(_id++,2,1160,0,0,2,48,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_PRIME_STONE_STARTER,new Vector.<MetaEquipement>(),false);
      
      public static var PRIME_IRON_BOOSTER:ModelBoosterPack = CreateModelBoosterPack(_id++,3,700,0,0,5,10,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_PRIME_IRON_BOOSTER,new Vector.<MetaEquipement>(),false);
      
      public static var PRIME_IRON_STARTER:ModelBoosterPack = CreateModelBoosterPack(_id++,4,2600,0,0,20,30,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_PRIME_IRON_STARTER,new Vector.<MetaEquipement>(),false);
      
      public static var PRIME_STEEL_BOOSTER:ModelBoosterPack = CreateModelBoosterPack(_id++,5,2660,0,2,5,8,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_PRIME_STEEL_BOOSTER,new Vector.<MetaEquipement>(),false);
      
      public static var PRIME_STEEL_STARTER:ModelBoosterPack = CreateModelBoosterPack(_id++,6,7900,0,5,25,20,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_PRIME_STEEL_STARTER,new Vector.<MetaEquipement>(),false);
      
      public static var PRIME_GOLD_BOOSTER:ModelBoosterPack = CreateModelBoosterPack(_id++,7,10000,1,4,10,0,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_PRIME_GOLD_BOOSTER,new Vector.<MetaEquipement>(),false);
      
      public static var ASHES_STONE_BOOSTER:ModelBoosterPack = CreateModelBoosterPack(_id++,8,380,0,0,1,14,ModelBoosterPack.TYPE_EXPANSION1,BC_TextFactory.ID_PRIME_STONE_BOOSTER,new Vector.<MetaEquipement>(),false);
      
      public static var ASHES_STONE_STARTER:ModelBoosterPack = CreateModelBoosterPack(_id++,9,1160,0,0,2,48,ModelBoosterPack.TYPE_EXPANSION1,BC_TextFactory.ID_PRIME_STONE_STARTER,new Vector.<MetaEquipement>(),false);
      
      public static var ASHES_IRON_BOOSTER:ModelBoosterPack = CreateModelBoosterPack(_id++,10,700,0,0,5,10,ModelBoosterPack.TYPE_EXPANSION1,BC_TextFactory.ID_PRIME_IRON_BOOSTER,new Vector.<MetaEquipement>(),false);
      
      public static var ASHES_IRON_STARTER:ModelBoosterPack = CreateModelBoosterPack(_id++,11,2600,0,0,20,30,ModelBoosterPack.TYPE_EXPANSION1,BC_TextFactory.ID_PRIME_IRON_STARTER,new Vector.<MetaEquipement>(),false);
      
      public static var ASHES_STEEL_BOOSTER:ModelBoosterPack = CreateModelBoosterPack(_id++,12,2660,0,2,5,8,ModelBoosterPack.TYPE_EXPANSION1,BC_TextFactory.ID_PRIME_STEEL_BOOSTER,new Vector.<MetaEquipement>(),false);
      
      public static var ASHES_STEEL_STARTER:ModelBoosterPack = CreateModelBoosterPack(_id++,13,7900,0,5,25,20,ModelBoosterPack.TYPE_EXPANSION1,BC_TextFactory.ID_PRIME_STEEL_STARTER,new Vector.<MetaEquipement>(),false);
      
      public static var ASHES_GOLD_BOOSTER:ModelBoosterPack = CreateModelBoosterPack(_id++,14,10000,1,4,10,0,ModelBoosterPack.TYPE_EXPANSION1,BC_TextFactory.ID_PRIME_GOLD_BOOSTER,new Vector.<MetaEquipement>(),false);
      
      public static var MYTHIC_STONE_BOOSTER:ModelBoosterPack = CreateModelBoosterPack(_id++,15,380,0,0,1,14,ModelBoosterPack.TYPE_MYTHIC,BC_TextFactory.ID_PRIME_STONE_BOOSTER,new Vector.<MetaEquipement>(),false);
      
      public static var MYTHIC_STONE_STARTER:ModelBoosterPack = CreateModelBoosterPack(_id++,16,1160,0,0,2,48,ModelBoosterPack.TYPE_MYTHIC,BC_TextFactory.ID_PRIME_STONE_STARTER,new Vector.<MetaEquipement>(),false);
      
      public static var MYTHIC_IRON_BOOSTER:ModelBoosterPack = CreateModelBoosterPack(_id++,17,700,0,0,5,10,ModelBoosterPack.TYPE_MYTHIC,BC_TextFactory.ID_PRIME_IRON_BOOSTER,new Vector.<MetaEquipement>(),false);
      
      public static var MYTHIC_IRON_STARTER:ModelBoosterPack = CreateModelBoosterPack(_id++,18,2600,0,0,20,30,ModelBoosterPack.TYPE_MYTHIC,BC_TextFactory.ID_PRIME_IRON_STARTER,new Vector.<MetaEquipement>(),false);
      
      public static var MYTHIC_STEEL_BOOSTER:ModelBoosterPack = CreateModelBoosterPack(_id++,19,2660,0,2,5,8,ModelBoosterPack.TYPE_MYTHIC,BC_TextFactory.ID_PRIME_STEEL_BOOSTER,new Vector.<MetaEquipement>(),false);
      
      public static var MYTHIC_STEEL_STARTER:ModelBoosterPack = CreateModelBoosterPack(_id++,20,7900,0,5,25,20,ModelBoosterPack.TYPE_MYTHIC,BC_TextFactory.ID_PRIME_STEEL_STARTER,new Vector.<MetaEquipement>(),false);
      
      public static var MYTHIC_GOLD_BOOSTER:ModelBoosterPack = CreateModelBoosterPack(_id++,21,10000,1,4,10,0,ModelBoosterPack.TYPE_MYTHIC,BC_TextFactory.ID_PRIME_GOLD_BOOSTER,new Vector.<MetaEquipement>(),false);
      
      public static var PRIME_DAILY_REWARD:ModelBoosterPack = new ModelBoosterPack(_id++,1,0,0,1,0,0,ModelBoosterPack.TYPE_DAILY,BC_TextFactory.ID_RARE_DAILY_REWARD_2,new Vector.<MetaEquipement>());
      
      public static var DAILY_REWARD_UNDEAD:ModelBoosterPack = CreateModelBoosterPack(_id++,1,2000,0,0,0,12,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_DAILY_PACK,new Vector.<MetaEquipement>(),true);
      
      public static var DAILY_REWARD_HUMAN:ModelBoosterPack = CreateModelBoosterPack(_id++,2,2000,0,0,0,12,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_DAILY_PACK,new Vector.<MetaEquipement>(),true);
      
      public static var DAILY_REWARD_ORC:ModelBoosterPack = CreateModelBoosterPack(_id++,3,2000,0,0,0,12,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_DAILY_PACK,new Vector.<MetaEquipement>(),true);
      
      public static var DAILY_REWARD_VERMIN:ModelBoosterPack = CreateModelBoosterPack(_id++,4,5000,0,0,12,0,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_DAILY_PACK,new Vector.<MetaEquipement>(),true);
      
      public static var DAILY_REWARD_BEHEMOT:ModelBoosterPack = CreateModelBoosterPack(_id++,5,6000,0,1,0,0,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_DAILY_PACK,new Vector.<MetaEquipement>(),true);
      
      public static var DAILY_REWARD_REPTILIAN:ModelBoosterPack = CreateModelBoosterPack(_id++,6,5000,0,0,12,0,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_DAILY_PACK,new Vector.<MetaEquipement>(),true);
      
      public static var DAILY_REWARD_OCTOPOD:ModelBoosterPack = CreateModelBoosterPack(_id++,7,6000,0,1,0,0,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_DAILY_PACK,new Vector.<MetaEquipement>(),true);
      
      public static var DAILY_REWARD_FIRE:ModelBoosterPack = CreateModelBoosterPack(_id++,8,6000,0,6,0,0,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_DAILY_PACK,new Vector.<MetaEquipement>(),true);
      
      public static var DAILY_REWARD_WATER:ModelBoosterPack = CreateModelBoosterPack(_id++,9,6000,0,6,0,0,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_DAILY_PACK,new Vector.<MetaEquipement>(),true);
      
      public static var DAILY_REWARD_POISON:ModelBoosterPack = CreateModelBoosterPack(_id++,10,6000,0,6,0,0,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_DAILY_PACK,new Vector.<MetaEquipement>(),true);
      
      public static var DAILY_REWARD_THUNDER:ModelBoosterPack = CreateModelBoosterPack(_id++,11,6000,0,6,0,0,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_DAILY_PACK,new Vector.<MetaEquipement>(),true);
      
      public static var DAILY_REWARD_IMP:ModelBoosterPack = CreateModelBoosterPack(_id++,12,5000,0,0,12,0,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_DAILY_PACK,new Vector.<MetaEquipement>(),true);
      
      public static var DAILY_REWARD_GOLEM:ModelBoosterPack = CreateModelBoosterPack(_id++,13,5000,0,0,12,0,ModelBoosterPack.TYPE_PRIME,BC_TextFactory.ID_DAILY_PACK,new Vector.<MetaEquipement>(),true);
      
      public static var CRAFT_COMMUN:ModelBoosterPack = CreateModelBoosterPack(_id++,1,0,0,0,0,1,ModelBoosterPack.TYPE_CRAFT,BC_TextFactory.ID_COMMUN_TEXT,new Vector.<MetaEquipement>(),false);
      
      public static var CRAFT_UNCOMMUN:ModelBoosterPack = CreateModelBoosterPack(_id++,1,0,0,0,1,0,ModelBoosterPack.TYPE_CRAFT,BC_TextFactory.ID_UNCOMMUN_TEXT,new Vector.<MetaEquipement>(),false);
      
      public static var CRAFT_RARE:ModelBoosterPack = CreateModelBoosterPack(_id++,1,0,0,1,0,0,ModelBoosterPack.TYPE_CRAFT,BC_TextFactory.ID_RARE_TEXT,new Vector.<MetaEquipement>(),false);
      
      public static var CRAFT_LEGENDARY:ModelBoosterPack = CreateModelBoosterPack(_id++,1,0,1,0,0,0,ModelBoosterPack.TYPE_CRAFT,BC_TextFactory.ID_LEGENDARY_TEXT,new Vector.<MetaEquipement>(),false);
      
      public function ModelBoosterPackEnum()
      {
         super();
      }
      
      public static function GetFromId(id:int) : ModelBoosterPack
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            if(id == ALL[i].id)
            {
               return ALL[i];
            }
         }
         return BOOSTER_NULL;
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
      
      public static function Init() : void
      {
         ALL_SET = new Array();
         ALL_SET.push(ALL,PRIME,EXPANSION1,MYTHIC);
         ALL_SET_TEXT = new Array(BC_TextFactory.ID_ALL_SET,BC_TextFactory.ID_PRIME_SET_1,BC_TextFactory.ID_EXPANSION_SET_1,BC_TextFactory.ID_MYTHIC_BOOSTER_REWARD,BC_TextFactory.ID_RARE_DAILY_REWARD_1,BC_TextFactory.ID_CRAFT_BOOSTER_REWARD);
         DAILY_REWARD_UNDEAD.itemArray.push(new MetaEquipement(12,ModelEquipementEnum.CREATURE_UNDEAD));
         DAILY_REWARD_HUMAN.itemArray.push(new MetaEquipement(12,ModelEquipementEnum.CREATURE_HUMAN));
         DAILY_REWARD_ORC.itemArray.push(new MetaEquipement(12,ModelEquipementEnum.CREATURE_ORC));
         DAILY_REWARD_VERMIN.itemArray.push(new MetaEquipement(12,ModelEquipementEnum.CREATURE_VERMINE));
         DAILY_REWARD_BEHEMOT.itemArray.push(new MetaEquipement(1,ModelEquipementEnum.CREATURE_STEAM_BEHEMOT));
         DAILY_REWARD_REPTILIAN.itemArray.push(new MetaEquipement(12,ModelEquipementEnum.CREATURE_REPTILIAN));
         DAILY_REWARD_OCTOPOD.itemArray.push(new MetaEquipement(1,ModelEquipementEnum.CREATURE_OCTOPOD));
         DAILY_REWARD_FIRE.itemArray.push(new MetaEquipement(6,ModelEquipementEnum.CREATURE_FIREELEMENTAL));
         DAILY_REWARD_WATER.itemArray.push(new MetaEquipement(6,ModelEquipementEnum.CREATURE_WATERELEMENTAL));
         DAILY_REWARD_POISON.itemArray.push(new MetaEquipement(6,ModelEquipementEnum.CREATURE_POISONELEMENTAL));
         DAILY_REWARD_THUNDER.itemArray.push(new MetaEquipement(6,ModelEquipementEnum.CREATURE_THUNDERELEMENTAL));
         DAILY_REWARD_IMP.itemArray.push(new MetaEquipement(12,ModelEquipementEnum.CREATURE_IMP));
         DAILY_REWARD_GOLEM.itemArray.push(new MetaEquipement(12,ModelEquipementEnum.CREATURE_GOLEM));
      }
      
      public static function GetDailyFromId(id:int) : ModelBoosterPack
      {
         for(var i:int = 0; i < DAILY.length; i++)
         {
            if(id == DAILY[i].id)
            {
               return DAILY[i];
            }
         }
         return BOOSTER_NULL;
      }
      
      private static function CreateModelBoosterPack(id:int, visualFrame:int, price:Number, nbLegendary:int, nbRare:int, nbUncommun:int, nbCommun:int, boosterType:int, boosterName:int, itemArray:Vector.<MetaEquipement>, isDaily:Boolean) : ModelBoosterPack
      {
         var m:ModelBoosterPack = new ModelBoosterPack(id,visualFrame,price,nbLegendary,nbRare,nbUncommun,nbCommun,boosterType,boosterName,itemArray);
         if(boosterType == ModelBoosterPack.TYPE_CRAFT)
         {
            return m;
         }
         if(isDaily)
         {
            DAILY.push(m);
         }
         else
         {
            ALL.push(m);
            switch(boosterType)
            {
               case ModelBoosterPack.TYPE_PRIME:
                  PRIME.push(m);
                  break;
               case ModelBoosterPack.TYPE_EXPANSION1:
                  EXPANSION1.push(m);
                  break;
               case ModelBoosterPack.TYPE_MYTHIC:
                  MYTHIC.push(m);
            }
         }
         return m;
      }
   }
}

