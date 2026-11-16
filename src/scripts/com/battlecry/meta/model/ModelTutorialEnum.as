package com.battlecry.meta.model
{
   import com.battlecry.screens.BC_ScreenFactory;
   
   public class ModelTutorialEnum
   {
      
      private static var _id:int = 0;
      
      public static var TUTORIAL_NULL:ModelTutorial = new ModelTutorial(-1,-1);
      
      public static var ALL:Vector.<ModelTutorial> = new Vector.<ModelTutorial>();
      
      public static var TUTORIAL_CREATE_UNIT:ModelTutorial = CreateModelTutorial(_id++,BC_ScreenFactory.ID_TUTORIAL_CREATE_SCREEN);
      
      public static var TUTORIAL_FLAG:ModelTutorial = CreateModelTutorial(_id++,BC_ScreenFactory.ID_TUTORIAL_FLAG_SCREEN);
      
      public static var TUTORIAL_TIMER:ModelTutorial = CreateModelTutorial(_id++,BC_ScreenFactory.ID_TUTORIAL_TIMER_SCREEN);
      
      public static var TUTORIAL_MULTIPLAYER:ModelTutorial = CreateModelTutorial(_id++,BC_ScreenFactory.ID_TUTORIAL_MULTIPLAYER_SCREEN);
      
      public static var TUTORIAL_INGAME:ModelTutorial = CreateModelTutorial(_id++,BC_ScreenFactory.ID_TUTORIAL_INGAME_SCREEN);
      
      public static var TUTORIAL_WIZARD:ModelTutorial = CreateModelTutorial(_id++,BC_ScreenFactory.ID_TUTORIAL_WIZARD_SCREEN);
      
      public static var TUTORIAL_UNLOCK_ACT2:ModelTutorial = CreateModelTutorial(_id++,BC_ScreenFactory.ID_TUTORIAL_UNLOCKACT2_SCREEN);
      
      public static var TUTORIAL_BOOSTER:ModelTutorial = CreateModelTutorial(_id++,BC_ScreenFactory.ID_TUTORIAL_BOOSTER_SCREEN);
      
      public static var TUTORIAL_INITIAL:ModelTutorial = CreateModelTutorial(_id++,BC_ScreenFactory.ID_TUTORIAL_INITIAL_SCREEN);
      
      public static var TUTORIAL_ARCHER:ModelTutorial = CreateModelTutorial(_id++,BC_ScreenFactory.ID_TUTORIAL_ARCHER_SCREEN);
      
      public static var TUTORIAL_BANNER:ModelTutorial = CreateModelTutorial(_id++,-1);
      
      public function ModelTutorialEnum()
      {
         super();
      }
      
      public static function GetFromId(id:int) : ModelTutorial
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            if(id == ALL[i].id)
            {
               return ALL[i];
            }
         }
         return TUTORIAL_NULL;
      }
      
      private static function CreateModelTutorial(id:int, tutoScreen:int) : ModelTutorial
      {
         var m:ModelTutorial = new ModelTutorial(id,tutoScreen);
         ALL.push(m);
         return m;
      }
   }
}

