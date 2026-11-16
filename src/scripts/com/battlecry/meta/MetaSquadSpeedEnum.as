package com.battlecry.meta
{
   import com.battlecry.multilingual.BC_TextFactory;
   
   public class MetaSquadSpeedEnum
   {
      
      private static var _id:int = 0;
      
      private static var ALL_SPEED:Vector.<MetaSquadSpeed> = new Vector.<MetaSquadSpeed>();
      
      public static var SPEED_NULL:MetaSquadSpeed = CreateMetaSquadSpeed(-1,-1,0);
      
      public static var SPEED_HOLD:MetaSquadSpeed = CreateMetaSquadSpeed(_id++,BC_TextFactory.ID_SQUAD_SPEED_HOLD,0);
      
      public static var SPEED_SLOW:MetaSquadSpeed = CreateMetaSquadSpeed(_id++,BC_TextFactory.ID_SQUAD_SPEED_SLOW,1);
      
      public static var SPEED_FAST:MetaSquadSpeed = CreateMetaSquadSpeed(_id++,BC_TextFactory.ID_SQUAD_SPEED_FAST,2);
      
      public function MetaSquadSpeedEnum()
      {
         super();
      }
      
      public static function GetFromId(id:int) : MetaSquadSpeed
      {
         for(var i:int = 0; i < ALL_SPEED.length; i++)
         {
            if(ALL_SPEED[i].id == id)
            {
               return ALL_SPEED[i];
            }
         }
         return SPEED_NULL;
      }
      
      private static function CreateMetaSquadSpeed(id:int, titleId:int, speedValue:int) : MetaSquadSpeed
      {
         var s:MetaSquadSpeed = new MetaSquadSpeed(id,titleId,speedValue);
         ALL_SPEED.push(s);
         return s;
      }
   }
}

