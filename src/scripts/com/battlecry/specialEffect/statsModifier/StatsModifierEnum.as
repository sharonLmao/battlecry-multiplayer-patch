package com.battlecry.specialEffect.statsModifier
{
   public class StatsModifierEnum
   {
      
      private static var _id:int = 0;
      
      public static var INFINITE:int = -1;
      
      public static var LIMIT:int = 0;
      
      public static var EFFECT_NULL:StatsModifier = new StatsModifier(-1,-1,-1,INFINITE);
      
      public static var ALL:Vector.<StatsModifier> = new Vector.<StatsModifier>();
      
      public static var MAGE_ROBE_MODIFIER:StatsModifier = CreateModifierEffect(_id++,StatsModifier.TYPE_CASTINGTIME,-2,2);
      
      public static var WIZARD_RING_MODIFIER:StatsModifier = CreateModifierEffect(_id++,StatsModifier.TYPE_CASTINGTIME,-2,2);
      
      public static var ICY_ROBE_MODIFIER:StatsModifier = CreateModifierEffect(_id++,StatsModifier.TYPE_CASTINGTIME,-1,2);
      
      public static var TIMESLOW_RING_MODIFIER:StatsModifier = CreateModifierEffect(_id++,StatsModifier.TYPE_CASTINGTIME,3,2);
      
      public static var TIMEWARP_RING_MODIFIER:StatsModifier = CreateModifierEffect(_id++,StatsModifier.TYPE_CASTINGTIME,-4,2);
      
      public static var OCTOPOD_MODIFIER:StatsModifier = CreateModifierEffect(_id++,StatsModifier.TYPE_CASTINGTIME,-5,2);
      
      public static var ARCHMAGE_MAIL_MODIFIER:StatsModifier = CreateModifierEffect(_id++,StatsModifier.TYPE_CASTINGTIME,-5,2);
      
      public static var LUMINARY_RING_MODIFIER:StatsModifier = CreateModifierEffect(_id++,StatsModifier.TYPE_CASTINGTIME,-10,2);
      
      public static var UMENTH_ARMOR_MODIFIER:StatsModifier = CreateModifierEffect(_id++,StatsModifier.TYPE_CASTINGTIME,-10,2);
      
      public static var CURSED_RING:StatsModifier = CreateModifierEffect(_id++,StatsModifier.TYPE_LIFE,-5,1);
      
      public function StatsModifierEnum()
      {
         super();
      }
      
      private static function CreateModifierEffect(id:int, type:int, value:int, limit:int) : StatsModifier
      {
         var c:StatsModifier = new StatsModifier(id,type,value,limit);
         ALL.push(c);
         return c;
      }
      
      public static function GetFromId(id:int) : StatsModifier
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            if(id == ALL[i].id)
            {
               return ALL[i];
            }
         }
         return EFFECT_NULL;
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
   }
}

