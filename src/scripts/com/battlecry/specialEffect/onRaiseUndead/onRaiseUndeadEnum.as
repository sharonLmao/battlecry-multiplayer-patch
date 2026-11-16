package com.battlecry.specialEffect.onRaiseUndead
{
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.meta.model.ModelEquipement;
   
   public class onRaiseUndeadEnum
   {
      
      private static var _id:int = 0;
      
      public static var EFFECT_NULL:onRaiseUndead = new onRaiseUndead(-1);
      
      public static var ALL:Vector.<onRaiseUndead> = new Vector.<onRaiseUndead>();
      
      public static var YASUR_ARMOR:onRaiseUndeadBuff = CreateOnRaiseUndeadBuff(_id++,new MetaStatsList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),1,onRaiseUndead.RANGE_ALL,ModelEquipement.GENRE_CREATURE_UNDEAD);
      
      public static var YASUR_RING:onRaiseUndeadRaiseAdd = CreateOnRaiseUndeadRaiseAdd(_id++);
      
      public function onRaiseUndeadEnum()
      {
         super();
      }
      
      private static function CreateOnRaiseUndeadRaiseAdd(id:int) : onRaiseUndeadRaiseAdd
      {
         var c:onRaiseUndeadRaiseAdd = new onRaiseUndeadRaiseAdd(id);
         ALL.push(c);
         return c;
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
      
      private static function CreateOnRaiseUndeadBuff(id:int, statsList1:MetaStatsList, defModifier1:int, range1:int, creatureType1:int) : onRaiseUndeadBuff
      {
         var c:onRaiseUndeadBuff = new onRaiseUndeadBuff(id,statsList1,defModifier1,range1,creatureType1);
         ALL.push(c);
         return c;
      }
      
      public static function GetFromId(id:int) : onRaiseUndead
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
   }
}

