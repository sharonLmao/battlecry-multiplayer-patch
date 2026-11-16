package com.battlecry.screens
{
   import com.lachhhEngine.games.screens.ScreenFactory;
   
   public class BC_ScreenFactory extends ScreenFactory
   {
      
      public static var ID_SOGOOD_INTRO_SCREEN:int;
      
      public static var ID_TUTORIAL_BOOSTER_SCREEN:int;
      
      public static var ID_COLLECTION_SCREEN:int;
      
      public static var ID_CHANGERANK_SCREEN:int;
      
      public static var ID_CHANGEARMYNAME_SCREEN:int;
      
      public static var ID_SHAREONFACEBOOK_SCREEN:int;
      
      public static var ID_ITEMDESCRIPTION_SCREEN:int;
      
      public static var ID_ADDAFRIEND_SCREEN:int;
      
      public static var ID_TUTORIAL_ARCHER_SCREEN:int;
      
      public static var ID_LINK_SCREEN:int;
      
      public static var ID_RANKEDMATCH_SCREEN:int;
      
      public static var ID_ARMYINFO_SCREEN:int;
      
      public static var ID_CHALLENGE_LOGIN_SCREEN:int;
      
      public static var ID_TUTORIAL_WIZARD_SCREEN:int;
      
      public static var ID_ENDGAME_CAMPAIGN_SCREEN:int;
      
      public static var ID_SAVE_SCREEN:int;
      
      public static var ID_CONNECT_PLAYERIO_SCREEN:int;
      
      public static var ID_NBRUNIT_SCREEN:int;
      
      public static var ID_CREDIT_SCREEN:int;
      
      public static var ID_WAVE_SCREEN:int;
      
      public static var ID_UNITDESCRIPTION_SCREEN:int;
      
      public static var ID_FIGHTAFRIEND_SCREEN:int;
      
      public static var ID_OPTION_SCREEN:int;
      
      public static var ID_CAMPAIGNARMYCREATION_SCREEN:int;
      
      public static var ID_CAMPAIGN_SCREEN:int;
      
      public static var ID_ENDGAME_SCREEN:int;
      
      public static var ID_ENDGAME_SURVIVAL_SCREEN:int;
      
      public static var ID_LOADGAME_INFOS_SCREEN:int;
      
      public static var ID_ARMYCREATION_SCREEN:int;
      
      public static var ID_TUTORIAL_MULTIPLAYER_SCREEN:int;
      
      public static var ID_TRANSITION_SCREEN:int;
      
      public static var ID_ARMYSELECT_SCREEN:int;
      
      public static var ID_FLAG_SCREEN:int;
      
      public static var ID_MTX_SCREEN:int;
      
      public static var ID_FIGHTASTRING_SCREEN:int;
      
      public static var ID_BOOSTERPACK_SCREEN:int;
      
      public static var ID_SEARCHINGOPPONENT500_SCREEN:int;
      
      public static var ID_LOADGAME_SCREEN:int;
      
      public static var ID_FRIENDARMYSELECT_SCREEN:int;
      
      public static var ID_TUTORIAL_CREATE_SCREEN:int;
      
      public static var ID_LOADING_SCREEN:int;
      
      public static var ID_CAPTCHA_SCREEN:int;
      
      public static var ID_TUTORIAL_INGAME_SCREEN:int;
      
      public static var ID_BOOSTERPACKINFO_SCREEN:int;
      
      public static var ID_AG_SPLASH_SCREEN:int;
      
      public static var ID_LOADGAME_SURVIVALINFOS_SCREEN:int;
      
      public static var ID_RANKMETER_TUTO_SCREEN:int;
      
      public static var ID_UNITCREATION_SCREEN:int;
      
      public static var ID_STORY_SCREEN:int;
      
      public static var ID_GAMETYPE_SCREEN:int;
      
      public static var ID_ENDACT_SCREEN:int;
      
      public static var ID_QUESTION_SCREEN:int;
      
      public static var ID_LOGIN_SCREEN:int;
      
      public static var ID_DAILYREWARD_SCREEN:int;
      
      public static var ID_TUTORIAL_UNLOCKACT2_SCREEN:int;
      
      public static var ID_BATTLEFIELD_SCREEN:int;
      
      public static var ID_RANKMETER_SCREEN:int;
      
      public static var ID_TUTORIAL_INITIAL_SCREEN:int;
      
      public static var ID_REFERENTIALREWARD_SCREEN:int;
      
      public static var ID_SEARCHINGOPPONENT_SCREEN:int;
      
      public static var ID_TUTORIAL_FLAG_SCREEN:int;
      
      public static var ID_TUTORIAL_TIMER_SCREEN:int;
      
      public static var ID_GOLDREWARDGRINDING_SCREEN:int;
      
      public static var ID_ITEM_REWARD_SCREEN:int;
      
      public static var ID_ARMYSURVIVALSELECT_SCREEN:int;
      
      public static var ID_GOLDREWARD_SCREEN:int;
      
      public static var ID_BATTLESELECTION_SCREEN:int;
      
      public static var ID_TITLE_SCREEN:int;
      
      public static var ID_INGAME_SCREEN:int;
      
      public function BC_ScreenFactory()
      {
         super();
         ID_INGAME_SCREEN = PushClassLink(IngameScreen);
         ID_ENDGAME_SCREEN = PushClassLink(EndGameScreen);
         ID_ENDGAME_CAMPAIGN_SCREEN = PushClassLink(EndGameCampaignScreen);
         ID_ARMYCREATION_SCREEN = PushClassLink(ArmyCreationScreen);
         ID_FLAG_SCREEN = PushClassLink(FlagScreen);
         ID_TITLE_SCREEN = PushClassLink(TitleScreen);
         ID_CREDIT_SCREEN = PushClassLink(CreditScreen);
         ID_OPTION_SCREEN = PushClassLink(OptionScreen);
         ID_COLLECTION_SCREEN = PushClassLink(CollectionScreen);
         ID_BOOSTERPACK_SCREEN = PushClassLink(BoosterPackScreen);
         ID_BATTLEFIELD_SCREEN = PushClassLink(BattleFieldScreen);
         ID_UNITDESCRIPTION_SCREEN = PushClassLink(UnitDescriptionScreen);
         ID_UNITCREATION_SCREEN = PushClassLink(UnitCreationScreen);
         ID_NBRUNIT_SCREEN = PushClassLink(NbrUnitScreen);
         ID_ITEMDESCRIPTION_SCREEN = PushClassLink(ItemDescriptionScreen);
         ID_BOOSTERPACKINFO_SCREEN = PushClassLink(BoosterPackInfoScreen);
         ID_QUESTION_SCREEN = PushClassLink(QuestionScreen);
         ID_SAVE_SCREEN = PushClassLink(SaveScreen);
         ID_TRANSITION_SCREEN = PushClassLink(TransitionScreen);
         ID_FIGHTAFRIEND_SCREEN = PushClassLink(FightAFriendScreen);
         ID_ADDAFRIEND_SCREEN = PushClassLink(AddAFriendScreen);
         ID_LOADING_SCREEN = PushClassLink(SearchingFriendScreen);
         ID_ARMYINFO_SCREEN = PushClassLink(ArmyInfoScreen);
         ID_RANKEDMATCH_SCREEN = PushClassLink(RankedMatchScreen);
         ID_SEARCHINGOPPONENT_SCREEN = PushClassLink(SearchingOpponentScreen);
         ID_SEARCHINGOPPONENT500_SCREEN = PushClassLink(SearchingOpponent500Screen);
         ID_CHANGERANK_SCREEN = PushClassLink(ChangeRankScreen);
         ID_LOADGAME_SCREEN = PushClassLink(LoadGameScreen);
         ID_CAMPAIGN_SCREEN = PushClassLink(CampaignScreen);
         ID_RANKMETER_SCREEN = PushClassLink(RankMeterScreen);
         ID_CHANGEARMYNAME_SCREEN = PushClassLink(ChangeArmyNameScreen);
         ID_CAMPAIGNARMYCREATION_SCREEN = PushClassLink(CampaignArmyCreationScreen);
         ID_LOGIN_SCREEN = PushClassLink(LoginScreen);
         ID_CONNECT_PLAYERIO_SCREEN = PushClassLink(ConnectPlayerIOScreen);
         ID_GAMETYPE_SCREEN = PushClassLink(GameTypeScreen);
         ID_GOLDREWARD_SCREEN = PushClassLink(GoldRewardScreen);
         ID_DAILYREWARD_SCREEN = PushClassLink(DailyRewardScreen);
         ID_ARMYSELECT_SCREEN = PushClassLink(ArmySelectScreen);
         ID_ARMYSURVIVALSELECT_SCREEN = PushClassLink(ArmySurvivalSelectScreen);
         ID_FRIENDARMYSELECT_SCREEN = PushClassLink(FriendArmySelectScreen);
         ID_MTX_SCREEN = PushClassLink(MTX_Screen);
         ID_STORY_SCREEN = PushClassLink(StoryScreen);
         ID_ITEM_REWARD_SCREEN = PushClassLink(ItemRewardScreen);
         ID_LINK_SCREEN = PushClassLink(LinkScreen);
         ID_TUTORIAL_CREATE_SCREEN = PushClassLink(Tutorial_Create_Screen);
         ID_TUTORIAL_FLAG_SCREEN = PushClassLink(Tutorial_Flag_Screen);
         ID_TUTORIAL_TIMER_SCREEN = PushClassLink(Tutorial_Timer_Screen);
         ID_TUTORIAL_MULTIPLAYER_SCREEN = PushClassLink(Tutorial_Multiplayer_Screen);
         ID_RANKMETER_TUTO_SCREEN = PushClassLink(RankMeterTutoScreen);
         ID_TUTORIAL_INGAME_SCREEN = PushClassLink(Tutorial_InGame_Screen);
         ID_TUTORIAL_WIZARD_SCREEN = PushClassLink(Tutorial_Wizard_Screen);
         ID_TUTORIAL_UNLOCKACT2_SCREEN = PushClassLink(Tutorial_UnlockAct2_Screen);
         ID_TUTORIAL_BOOSTER_SCREEN = PushClassLink(Tutorial_Booster_Screen);
         ID_TUTORIAL_INITIAL_SCREEN = PushClassLink(Tutorial_Initial_Screen);
         ID_TUTORIAL_ARCHER_SCREEN = PushClassLink(Tutorial_Archer_Screen);
         ID_LOADGAME_INFOS_SCREEN = PushClassLink(LoadGameInfosScreen);
         ID_CHALLENGE_LOGIN_SCREEN = PushClassLink(ChallengeLoginScreen);
         ID_SHAREONFACEBOOK_SCREEN = PushClassLink(ShareOnFacebookScreen);
         ID_REFERENTIALREWARD_SCREEN = PushClassLink(ReferentialRewardScreen);
         ID_ENDACT_SCREEN = PushClassLink(EndActScreen);
         ID_FIGHTASTRING_SCREEN = PushClassLink(FightAStringScreen);
         ID_SOGOOD_INTRO_SCREEN = PushClassLink(SoGoodIntroScreen);
         ID_GOLDREWARDGRINDING_SCREEN = PushClassLink(GoldRewardGrindingScreen);
         ID_CAPTCHA_SCREEN = PushClassLink(CaptchaScreen);
         ID_BATTLESELECTION_SCREEN = PushClassLink(BattleSelectionScreen);
         ID_WAVE_SCREEN = PushClassLink(WaveScreen);
         ID_ENDGAME_SURVIVAL_SCREEN = PushClassLink(EndGameSurvivalScreen);
         ID_LOADGAME_SURVIVALINFOS_SCREEN = PushClassLink(LoadGameSurvivalInfosScreen);
         ID_AG_SPLASH_SCREEN = PushClassLink(ArmorGamesSplash);
      }
   }
}

