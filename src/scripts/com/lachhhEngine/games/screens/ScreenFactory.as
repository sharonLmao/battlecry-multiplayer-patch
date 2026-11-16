package com.lachhhEngine.games.screens
{
   import com.lachhhEngine.games.factory.ObjectFactory;
   import com.lachhhEngine.games.levelEditor.LevelEditorLayerBrowser;
   import com.lachhhEngine.games.levelEditor.LevelEditorToolBar;
   
   public class ScreenFactory extends ObjectFactory
   {
      
      public static var LEVEL_EDITOR_TOOL_BAR:int;
      
      public static var BERZERK_MINI_INTRO:int;
      
      public static var SPECIMEN_INTRO:int;
      
      public static var BERZERKHINT_FF3:int;
      
      public static var AD_SHOWER:int;
      
      public static var LEVEL_EDITOR_LAYER_BROWSER:int;
      
      public static var LACHHH_ENGINE_SCREEN:int;
      
      public static var BERZERK_INTRO:int;
      
      public static var BERZERKHINT_FP10:int;
      
      public static var GAMESHED_PREROLL:int;
      
      public static var DEBUG_SCREEN:int;
      
      public static var FLASH_SCREEN:int;
      
      public static var CHEAT_SCREEN:int;
      
      public function ScreenFactory()
      {
         super();
         this.AddGameClass();
         this.AddEngineClass();
      }
      
      private function AddEngineClass() : void
      {
         LACHHH_ENGINE_SCREEN = PushClassLink(LachhhEngineLogo);
         BERZERK_INTRO = PushClassLink(BerzerkLogo);
         BERZERK_MINI_INTRO = PushClassLink(BerzerkMiniLogo);
         SPECIMEN_INTRO = PushClassLink(SpecimenLogo);
         BERZERKHINT_FF3 = PushClassLink(BerzerkHintFF3Screen);
         BERZERKHINT_FP10 = PushClassLink(BerzerkHintFP10Screen);
         DEBUG_SCREEN = PushClassLink(DebugScreen);
         FLASH_SCREEN = PushClassLink(FlashScreen);
         LEVEL_EDITOR_TOOL_BAR = PushClassLink(LevelEditorToolBar);
         LEVEL_EDITOR_LAYER_BROWSER = PushClassLink(LevelEditorLayerBrowser);
         CHEAT_SCREEN = PushClassLink(CheatScreen);
         GAMESHED_PREROLL = PushClassLink(GameShedPrerollScreen);
         AD_SHOWER = PushClassLink(AdShowerScreen);
      }
      
      protected function AddGameClass() : void
      {
      }
   }
}

