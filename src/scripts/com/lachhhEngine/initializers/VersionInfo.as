package com.lachhhEngine.initializers
{
   import com.lachhhEngine.games.screens.ContextMenuItemWithCallback;
   import com.lachhhEngine.initializers.preloader.IPreloader;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.externalAPI.metricsAPI.MetricGroup;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class VersionInfo
   {
      
      private static var _cpmPreloaderId:String;
      
      private static var _sponsorSiteMoreGamesUrl:String;
      
      private static var _sponsorSiteUrl:String;
      
      private static var _sponsorSiteThisGameUrl:String;
      
      private static var _cpmInterlevelId:String;
      
      private static var _preloader:IPreloader;
      
      private static var _urlsSiteLocks:Array;
      
      private static var _sponsorName:String;
      
      public static const NAME_TEMPLATE:String = "\'SponsorName\'";
      
      public static const NAME_KONGREGATE:String = "Kongregate";
      
      public static const NAME_FOG:String = "Free Online Games";
      
      public static const NAME_GAMEZHERO:String = "GameZhero";
      
      public static const NAME_ANDKON:String = "Andkon";
      
      public static const NAME_CANDYSTAND:String = "CandyStand";
      
      public static const NAME_ZAPAK:String = "Zapak";
      
      public static const NAME_ADDICTINGGAMES:String = "AddictingGames";
      
      public static const NAME_4KIDS:String = "4Kids.tv";
      
      public static const NAME_ARMORGAMES:String = "ArmorGames";
      
      public static const NAME_MINIJUEGOS:String = "MiniJuegos";
      
      public static const NAME_GAMESHED:String = "GameShed";
      
      public static const NAME_YOARCADE:String = "YoArcade.net";
      
      public static const NAME_King:String = "King.com";
      
      public static const NAME_MOFUNZONE:String = "MoFunZone.com";
      
      public static const NAME_MAXGAMES:String = "MaxGames.com";
      
      public static const NAME_GATCHA:String = "Gatcha.com";
      
      public static const NAME_PLAYHUB:String = "PlayHub.com";
      
      public static const NAME_SPIL_GROUP:String = "agame.com";
      
      public static const NAME_ZAPAPA:String = "zapapa.com";
      
      public static const NAME_HYVES:String = "zapapa.nl";
      
      public static const NAME_SOCIAL_AFFILIATES:String = "SA Games";
      
      public static const NAME_NEWGROUNDS:String = "Newgrounds";
      
      public static const NAME_OURWORLD:String = "OurWorld.com";
      
      public static const NAME_DRAUGIEM:String = "Draugiem";
      
      public static const NAME_BERZERK:String = "Berzerk Studio";
      
      public static const NAME_SPECIMEN:String = "Specimen Games";
      
      public static const NAME_NEXTPLAY:String = "NextPlay.com";
      
      public static const NAME_GIFTNGAMES:String = "GiftsNGames.com";
      
      public static const NAME_JALUDO:String = "jaludo.com";
      
      public static const NAME_GAMETAKO:String = "gametako.com";
      
      public static const NAME_TEAGAMES:String = "teagames.com";
      
      public static const NAME_KEYGAMES:String = "Keygames.com";
      
      public static const NAME_SPELE_NL:String = "Spele.nl";
      
      public static const NAME_HACKED_GAMES:String = "hackedgames.com";
      
      public static const NAME_POG:String = "plentyofgames.com";
      
      public static const NAME_MINICLIP:String = "MiniClip.com";
      
      public static const NAME_MOCHIGAMES:String = "mochigames.com";
      
      public static const NAME_FLASHJOLT:String = "FlashJolt";
      
      public static const NAME_BUBBLEBOX:String = "BubbleBox";
      
      public static const PREFIX_LOAD:String = "";
      
      public static const FRAME_TEMPLATE:int = 1;
      
      public static const FRAME_KONG:int = 2;
      
      public static const FRAME_FOG:int = 3;
      
      public static const FRAME_GAMEZHERO:int = 4;
      
      public static const FRAME_ANDKON:int = 5;
      
      public static const FRAME_ZAPAK:int = 6;
      
      public static const FRAME_ADDICTINGGAMES:int = 7;
      
      public static const FRAME_4KIDS:int = 8;
      
      public static const FRAME_CANDYSTAND:int = 9;
      
      public static const FRAME_ARMORGAMES:int = 10;
      
      public static const FRAME_MINIJUEGOS:int = 11;
      
      public static const FRAME_GAMESHED:int = 12;
      
      public static const FRAME_YOARCADE:int = 13;
      
      public static const FRAME_KING:int = 14;
      
      public static const FRAME_MOFUNZONE:int = 15;
      
      public static const FRAME_MAXGAMES:int = 16;
      
      public static const FRAME_GATCHA:int = 17;
      
      public static const FRAME_PLAYHUB:int = 18;
      
      public static const FRAME_SPIL_GROUP:int = 19;
      
      public static const FRAME_ZAPAPA:int = 19;
      
      public static const FRAME_HYVES:int = 19;
      
      public static const FRAME_GOO:int = 20;
      
      public static const FRAME_SOCIAL_AFFILIATES:int = 21;
      
      public static const FRAME_NEWGROUNDS:int = 22;
      
      public static const FRAME_OURWORLD:int = 23;
      
      public static const FRAME_DRAUGIEM:int = 24;
      
      public static const FRAME_BERZERK:int = 25;
      
      public static const FRAME_NEXTPLAY:int = 26;
      
      public static const FRAME_GIFTNGAMES:int = 27;
      
      public static const FRAME_JALUDO:int = 28;
      
      public static const FRAME_GAMETAKO:int = 29;
      
      public static const FRAME_TEAGAMES:int = 30;
      
      public static const FRAME_KEYGAMES:int = 31;
      
      public static const FRAME_SPELE_NL:int = 32;
      
      public static const FRAME_HACKED_GAMES:int = 33;
      
      public static const FRAME_POG:int = 34;
      
      public static const FRAME_MOCHIGAMES:int = 35;
      
      public static const FRAME_MINICLIP:int = 36;
      
      public static const FRAME_SPECIMEN:int = 37;
      
      public static const FRAME_FLASHJOLT:int = 38;
      
      public static const FRAME_BUBBLEBOX:int = 39;
      
      public static const URL_BERZERK_DISTRIBUTION:String = "http://flashgamedistribution.com/profile/BerzerkStudio";
      
      public static const URL_SITELOCK_GAMERSAFE:String = "gamersafe.com";
      
      public static const URL_SITELOCK_FGL:String = "flashgamelicense.com";
      
      public static const URL_SITELOCK_BERZERK:String = "berzerkstudio.com";
      
      public static const URL_SITELOCK_BERZERK_LAND:String = "berzerk-land.com";
      
      public static const URL_SITELOCK_KONG:String = "kongregate.com";
      
      public static const URL_SITELOCK_FOG:String = "freeonlinegames.com";
      
      public static const URL_SITELOCK_GAMEZHERO:String = "gamezhero.com";
      
      public static const URL_SITELOCK_ANDKON:String = "andkon.com";
      
      public static const URL_SITELOCK_WHIRLED:String = "whirled.com";
      
      public static const URL_SITELOCK_CANDYSTAND:String = "candystand.com";
      
      public static const URL_SITELOCK_ZAPAK:String = "zapak.com";
      
      public static const URL_SITELOCK_ADDICTINGGAMES:String = "addictinggames.com";
      
      public static const URL_SITELOCK_4KIDS:String = "4kids.tv";
      
      public static const URL_SITELOCK_4KIDS_1:String = "4kids.com";
      
      public static const URL_SITELOCK_4KIDS_2:String = "4kidstv.com";
      
      public static const URL_SITELOCK_4KIDS_3:String = "cw4kids.com";
      
      public static const URL_SITELOCK_ARMORGAMES:String = "armorgames.com";
      
      public static const URL_SITELOCK_MINIJUEGOS:String = "minijuegos.com";
      
      public static const URL_SITELOCK_GAMESHED:String = "gameshed.com";
      
      public static const URL_SITELOCK_YOARCADE:String = "yoarcade.net";
      
      public static const URL_SITELOCK_KING:String = "king.com";
      
      public static const URL_SITELOCK_KING2:String = "midasplayer.com";
      
      public static const URL_SITELOCK_MOFUNZONE:String = "mofunzone.com";
      
      public static const URL_SITELOCK_MAXGAMES:String = "maxgames.com";
      
      public static const URL_SITELOCK_GATCHA_1:String = "gatcha.com";
      
      public static const URL_SITELOCK_GATCHA_2:String = "gatcdn.com";
      
      public static const URL_SITELOCK_GATCHA_3:String = "devgatcha01.netnoc";
      
      public static const URL_SITELOCK_PLAYHUB:String = "playhub.com";
      
      public static const URL_SITELOCK_SPIL_GROUP:String = "agame.com";
      
      public static const URL_SITELOCK_ZAPAPA:String = "zapapa.com";
      
      public static const URL_SITELOCK_HYVES:String = "zapapa.nl";
      
      public static const URL_SITELOCK_NEXTPLAY:String = "zapapa.nl";
      
      public static const URL_SITELOCK_JALUDO:String = "jaludo.com";
      
      public static const URL_SITELOCK_KEYGAMES:String = "keygames.com";
      
      public static const URL_SITELOCK_SPELE_NL:String = "spele.nl";
      
      public static const URL_SITELOCK_HACKED_GAME:String = "hackedgames.com";
      
      public static const URL_SITELOCK_POG:String = "plentyofgames.com";
      
      public static const URL_SITELOCK_MINICLIP:String = "miniclip.com";
      
      public static const URL_SITELOCK_NEWGROUNDS1:String = "ungrounded.net";
      
      public static const URL_SITELOCK_NEWGROUNDS2:String = "newgrounds.com";
      
      public static const URL_SITELOCK_OURWORLD:String = "ourworld.com";
      
      public static const URL_SITELOCK_GIFTNGAMES_1:String = "giftsngames";
      
      public static const URL_SITELOCK_BUBBLEBOX:String = "bubblebox.com";
      
      public static const URL_SITELOCK_SPIL_GROUP2:String = "spilgames.com";
      
      public static const URL_SITELOCK_SPIL_GROUP_AD_FREE1:String = "agame.com";
      
      public static const URL_SITELOCK_SPIL_GROUP_AD_FREE2:String = "xiaoyouxi.cn";
      
      public static const URL_SITELOCK_SPIL_GROUP_AD_FREE3:String = "files.game.com.cn";
      
      public static const URL_SITELOCK_SPIL_GROUP_AD_FREE4:String = "files.game.asia";
      
      public static const URL_SITELOCK_4399_1:String = "4399.com";
      
      public static const URL_SITELOCK_4399_2:String = "ff130.com";
      
      public static const URL_SITELOCK_4399_3:String = "4399pk.com";
      
      public static const URL_SITELOCK_SOCIAL_AFFILIATES_1:String = "vkontakte.ru";
      
      public static const URL_SITELOCK_SOCIAL_AFFILIATES_2:String = "my.mail.ru";
      
      public static const URL_SITELOCK_SOCIAL_AFFILIATES_3:String = "odnoklassniki.ru";
      
      public static const URL_SITELOCK_SOCIAL_AFFILIATES_4:String = "facebook.com";
      
      public static const URL_SITELOCK_SOCIAL_AFFILIATES_G2G_1:String = "gate2game.com";
      
      public static const URL_SITELOCK_SOCIAL_AFFILIATES_G2G_2:String = "gate2game.ru";
      
      public static const URL_SITELOCK_DRAUGIEM:String = "draugiem.com";
      
      public static const URL_SITELOCK_GAMETAKO:String = "gametako.com";
      
      public static const URL_SITELOCK_TEAGAMES:String = "teagames.com";
      
      public static const URL_SITELOCK_MOCHIGAMES:String = "mochigames.com";
      
      public static const URL_SITELOCK_MOCHIMEDIA:String = "mochimedia.com";
      
      public static const URL_SITELOCK_MOCHIADS:String = "mochiads.com";
      
      public static const URL_SITELOCK_FLASHJOLT:String = "flashjolt.com";
      
      private static var _autoTransferFileOnConnect:Boolean = true;
      
      private static var _dontTouchStage:Boolean = false;
      
      private static var _debugVersion:Boolean = false;
      
      private static var _canBePlayedOffline:Boolean = false;
      
      private static var _useSiteLock:Boolean = true;
      
      private static var _ignoreExtensionDomain:Boolean = false;
      
      private static var _exclusiveStuffVisible:Boolean = true;
      
      private static var _exclusiveStuffEnabled:Boolean = false;
      
      private static var _canShowBerzerkAnims:Boolean = true;
      
      private static var _canHaveExternalLinks:Boolean = true;
      
      private static var _canShowAds:Boolean = false;
      
      private static var _sponsorContextMenuItem:ContextMenuItemWithCallback = new ContextMenuItemWithCallback("",true,true,true,new Callback(onClickMenuItem,VersionInfo,null));
      
      private static var _sponsorVisualFrame:int = 1;
      
      private static var _showGSDescInPreloader:Boolean = true;
      
      private static var _gamerSafeLinkInPreloader:Boolean = true;
      
      private static var _candyStandId:String = "TEST";
      
      private static var _defaultLanguage:String = "EN";
      
      private static var _defaultLanguageForcedOnLoad:Boolean = false;
      
      private static var _transparentBackGroundOnPreloader:Boolean = false;
      
      private static var _gameTitle:String = "";
      
      private static var _languageAvailables:Array = ["en","fr"];
      
      private static var _urlSiteGamerSafe:String = "http://www.gamersafe.com";
      
      private static var _versionInfo:String = "";
      
      private static var _useEncryptionForSaveFile:Boolean = true;
      
      private static var _noKeyManager:Boolean = false;
      
      public static const URL_SITE_BERZERK:String = "http://www.berzerk-land.com";
      
      public static const URL_MORE_GAMES_BERZERK:String = "http://www.berzerk-land.com";
      
      public static const URL_THIS_GAME_BERZERK:String = "http://www.berzerk-land.com";
      
      public static const URL_SITE_SPECIMEN:String = "http://www.SpecimenGames.com";
      
      public static const URL_MORE_GAMES_SPECIMEN:String = "http://www.SpecimenGames.com";
      
      public static const URL_THIS_GAME_SPECIMEN:String = "http://www.SpecimenGames.com";
      
      public static const URL_SITE_KONG:String = "http://www.kongregate.com/";
      
      public static const URL_MORE_GAMES_KONG:String = "http://www.kongregate.com/";
      
      public static const URL_THIS_GAME_KONG:String = "http://www.kongregate.com/";
      
      public static const URL_SITE_FOG:String = "http://www.freeonlinegames.com";
      
      public static const URL_MORE_GAMES_FOG:String = "http://www.freeonlinegames.com";
      
      public static const URL_THIS_GAME_FOG:String = "http://www.freeonlinegames.com?mechanicalcommando";
      
      public static const URL_SITE_GAMEZHERO:String = "http://www.gamezhero.com";
      
      public static var URL_MORE_GAMES_GAMEZHERO:String = "http://www.gamezhero.com";
      
      public static const URL_THIS_GAME_GAMEZHERO:String = "http://www.gamezhero.com?mechanicalcommando";
      
      public static const URL_SITE_ANDKON:String = "http://www.andkon.com/arcade";
      
      public static const URL_MORE_GAMES_ANDKON:String = "http://www.andkon.com/arcade";
      
      public static const URL_THIS_GAME_ANDKON:String = "http://www.andkon.com?mechanicalcommando";
      
      public static const URL_SITE_ZAPAK:String = "http://www.zapak.com";
      
      public static const URL_MORE_GAMES_ZAPAK:String = "http://www.zapak.com";
      
      public static const URL_THIS_GAME_ZAPAK:String = "http://www.zapak.com?mechanicalcommando";
      
      public static const URL_SITE_ADDICTINGGAMES:String = "http://www.addictinggames.com";
      
      public static const URL_MORE_GAMES_ADDICTINGGAMES:String = "http://www.addictinggames.com";
      
      public static const URL_THIS_GAME_ADDICTINGGAMES:String = "http://www.addictinggames.com?mechanicalcommando";
      
      public static const URL_SITE_4KIDS:String = "http://www.4kids.tv";
      
      public static const URL_MORE_GAMES_4KIDS:String = "http://www.4kids.tv";
      
      public static const URL_THIS_GAME_4KIDS:String = "http://www.4kids.tv?mechanicalcommando";
      
      public static const URL_SITE_CANDYSTAND:String = "http://www.candystand.com";
      
      public static const URL_MORE_GAMES_CANDYSTAND:String = "http://www.candystand.com";
      
      public static const URL_THIS_GAME_CANDYSTAND:String = "http://www.candystand.com?mechanicalcommando";
      
      public static const URL_SITE_MINICLIP:String = "http://www.miniclip.com";
      
      public static const URL_MORE_GAMES_MINICLIP:String = "http://www.miniclip.com";
      
      public static const URL_THIS_GAME_MINICLIP:String = "http://www.miniclip.com";
      
      public static const URL_SITE_ARMORGAMES:String = "http://www.armorgames.com";
      
      public static const URL_MORE_GAMES_ARMORGAMES:String = "http://www.armorgames.com";
      
      public static const URL_THIS_GAME_ARMORGAMES:String = "http://www.armorgames.com?mechanicalcommando";
      
      public static const URL_SITE_MINIJUEGOS:String = "http://www.minijuegos.com";
      
      public static const URL_MORE_GAMES_MINIJUEGOS:String = "http://www.minijuegos.com";
      
      public static const URL_THIS_GAME_MINIJUEGOS:String = "http://www.minijuegos.com?mechanicalcommando";
      
      public static const URL_SITE_GAMESHED:String = "http://www.gameshed.com";
      
      public static const URL_MORE_GAMES_GAMESHED:String = "http://www.gameshed.com";
      
      public static const URL_THIS_GAME_GAMESHED:String = "http://www.gameshed.com?mechanicalcommando";
      
      public static const URL_SITE_YOARCADE:String = "http://www.yoarcade.net";
      
      public static const URL_MORE_GAMES_YOARCADE:String = "http://www.yoarcade.net";
      
      public static const URL_THIS_GAME_YOARCADE:String = "http://www.yoarcade.net?mechanicalcommando";
      
      public static const URL_SITE_SOCIAL_AFFILIATES_1:String = "http://vkontakte.ru/club18561080";
      
      public static const URL_MORE_GAMES_SOCIAL_AFFILIATES_1:String = "http://vkontakte.ru/club18561080";
      
      public static const URL_SITE_SOCIAL_AFFILIATES_2:String = "http://my.mail.ru/community/sa_games/";
      
      public static const URL_MORE_GAMES_SOCIAL_AFFILIATES_2:String = "http://my.mail.ru/community/sa_games/";
      
      public static const URL_SITE_KING:String = "http://www.king.com";
      
      public static const URL_MORE_GAMES_KING:String = "http://www.king.com";
      
      public static const URL_SITE_MOFUNZONE:String = "http://www.mofunzone.com/";
      
      public static const URL_MORE_GAMES_MOFUNZONE:String = "http://www.mofunzone.com/";
      
      public static const URL_SITE_MAXGAMES:String = "http://www.maxgames.com/";
      
      public static const URL_MORE_GAMES_MAXGAMES:String = "http://www.maxgames.com/";
      
      public static const URL_SITE_GATCHA:String = "";
      
      public static const URL_MORE_GAMES_GATCHA:String = "http://www.netlog.com/play/";
      
      public static const URL_SITE_PLAYHUB:String = "http://www.playhub.com";
      
      public static const URL_MORE_GAMES_PLAYHUB:String = "http://www.playhub.com";
      
      public static const URL_SITE_HACKED_GAMES:String = "http://www.hackedgames.com";
      
      public static const URL_MORE_GAMES_HACKED_GAMES:String = "http://www.hackedgames.com";
      
      public static const URL_SITE_POG:String = "http://www.plentyofgames.com";
      
      public static const URL_MORE_GAMES_POG:String = "http://www.plentyofgames.com/ref=ffmore";
      
      public static const URL_SITE_SPIL_GROUP:String = "http://www.agame.com";
      
      public static const URL_MORE_GAMES_SPIL_GROUP:String = "http://www.agame.com";
      
      public static const URL_SITE_ZAPAPA:String = "http://www.zapapa.com";
      
      public static const URL_MORE_GAMES_ZAPAPA:String = "http://www.zapapa.com";
      
      public static const URL_SITE_HYVES:String = "http://www.zapapa.nl";
      
      public static const URL_MORE_GAMES_HYVES:String = "http://www.zapapa.nl";
      
      public static const URL_SITE_NEWGROUNDS:String = "http://www.newgrounds.com";
      
      public static const URL_MORE_GAMES_NEWGROUNDS:String = "http://www.newgrounds.com/game/";
      
      public static const URL_SITE_SOCIAL_AFFILIATES_G2G:String = "";
      
      public static const URL_MORE_GAMES_SOCIAL_AFFILIATES_G2G:String = "";
      
      public static const URL_SITE_OURWORLD:String = "";
      
      public static const URL_MORE_GAMES_OURWORLD:String = "";
      
      public static const URL_SITE_DRAUGIEM:String = "http://www.draugiem.com";
      
      public static const URL_MORE_GAMES_DRAUGIEM:String = "http://www.draugiem.com";
      
      public static const URL_SITE_NEXTPLAY:String = "";
      
      public static const URL_MORE_GAMES_NEXTPLAY:String = "";
      
      public static const URL_SITE_GIFTSNGAMES:String = "http://www.giftsngames.com";
      
      public static const URL_MORE_GAMES_GIFTSNGAMES:String = "http://www.giftsngames.com";
      
      public static const URL_SITE_JALUDO:String = "";
      
      public static const URL_MORE_GAMES_JALUDO:String = "";
      
      public static const URL_SITE_GAMETAKO:String = "http://www.gametako.com";
      
      public static const URL_MORE_GAMES_GAMETAKO:String = "http://www.gametako.com";
      
      public static const URL_SITE_TEAGAMES:String = "http://www.teagames.com";
      
      public static const URL_MORE_GAMES_TEAGAMES:String = "http://www.teagames.com";
      
      public static const URL_SITE_FLASHJOLT:String = "http://www.flashjolt.com";
      
      public static const URL_MORE_GAMES_FLASHJOLT:String = "http://www.flashjolt.com";
      
      public static const URL_SITE_KEYGAMES:String = "http://keygames.com/games/action/air-fight/?utm_source=games&utm_medium=exclusives&utm_campaign=burning-skies";
      
      public static const URL_MORE_GAMES_KEYGAMES:String = "http://keygames.com/games/action/air-fight/?utm_source=games&utm_medium=exclusives&utm_campaign=burning-skies";
      
      public static const URL_SITE_SPELE_NL:String = "http://spele.nl/games/actie/luchtgevecht/?utm_source=games&utm_medium=exclusives&utm_campaign=burning-skies";
      
      public static const URL_MORE_GAMES_SPELE_NL:String = "http://spele.nl/games/actie/luchtgevecht/?utm_source=games&utm_medium=exclusives&utm_campaign=burning-skies";
      
      public static const URL_SITE_MOCHIGAMES:String = "http://www.mochigames.com";
      
      public static const URL_MORE_GAMES_MOCHIGAMES:String = "http://www.mochigames.com";
      
      public static const URL_SITE_BUBBLEBOX:String = "http://www.bubblebox.com";
      
      public static const URL_MORE_GAMES_BUBBLEBOX:String = "http://www.bubblebox.com";
      
      public static const URL_BERZERK_FORUM:String = "http://www.berzerkstudio.com/forum";
      
      public static const URL_BERZERK_TWITTER:String = "http://twitter.com/berzerkstudio";
      
      public static const URL_BERZERK_FACEBOOK:String = "http://www.facebook.com/pages/Berzerk-Studio/184038174958740";
      
      public static const GAME_ID_CPM_ID:String = "297QEDC33543";
      
      public static const GAME_ID_FOG:int = 322;
      
      private static var _candyStandScoreHandling:Boolean = false;
      
      private static var _gamezheroGameName:String = "zombiebillyshow";
      
      private static var _gamezheroGameCode:String = "204153165155170158200163208080147198160174163224166209196161158150204209159173213202166216151195147151173154157";
      
      private static var _zapakGameId:int = 888;
      
      private static var _canProfileTime:Boolean = false;
      
      private static var _showCannotPublishSticker:Boolean = false;
      
      private static var _isIphoneVersion:Boolean = false;
      
      private static var _defaultScaleMode:String = StageScaleMode.EXACT_FIT;
      
      public function VersionInfo()
      {
         super();
      }
      
      public static function get canShowBerzerkAnims() : Boolean
      {
         return _canShowBerzerkAnims;
      }
      
      public static function get sponsorSiteUrl() : String
      {
         return _sponsorSiteUrl;
      }
      
      public static function set canShowBerzerkAnims(canShowBerzerkAnims:Boolean) : void
      {
         _canShowBerzerkAnims = canShowBerzerkAnims;
      }
      
      public static function get languageAvailables() : Array
      {
         return _languageAvailables;
      }
      
      public static function set canBePlayedOffline(canBePlayedOffline:Boolean) : void
      {
         _canBePlayedOffline = canBePlayedOffline;
      }
      
      public static function set canProfileTime(canProfileTime:Boolean) : void
      {
         _canProfileTime = canProfileTime;
      }
      
      public static function get canHaveExternalLinks() : Boolean
      {
         return _canHaveExternalLinks;
      }
      
      public static function set sponsorSiteUrl(sponsorSiteUrl:String) : void
      {
         _sponsorSiteUrl = sponsorSiteUrl;
      }
      
      public static function get exclusiveStuffEnabled() : Boolean
      {
         return _exclusiveStuffEnabled;
      }
      
      public static function get preloader() : IPreloader
      {
         return _preloader;
      }
      
      public static function set languageAvailables(languageAvailables:Array) : void
      {
         _languageAvailables = languageAvailables;
      }
      
      public static function set canHaveExternalLinks(b:Boolean) : void
      {
         _canHaveExternalLinks = b;
      }
      
      public static function get defaultLanguage() : String
      {
         return _defaultLanguage;
      }
      
      public static function set exclusiveStuffEnabled(exclusiveStuffEnabled:Boolean) : void
      {
         _exclusiveStuffEnabled = exclusiveStuffEnabled;
      }
      
      public static function get defaultScaleMode() : String
      {
         return _defaultScaleMode;
      }
      
      public static function get sponsorName() : String
      {
         return _sponsorName;
      }
      
      public static function set preloader(preloader:IPreloader) : void
      {
         _preloader = preloader;
      }
      
      public static function set gamezheroGameName(gamezheroGameName:String) : void
      {
         _gamezheroGameName = gamezheroGameName;
      }
      
      public static function set cpmPreloaderId(cpmPreloaderId:String) : void
      {
         _cpmPreloaderId = cpmPreloaderId;
      }
      
      public static function get noKeyManager() : Boolean
      {
         return _noKeyManager;
      }
      
      public static function get urlsSiteLocks() : Array
      {
         return _urlsSiteLocks;
      }
      
      public static function get cpmInterlevelId() : String
      {
         return _cpmInterlevelId;
      }
      
      public static function get transparentBackGroundOnPreloader() : Boolean
      {
         return _transparentBackGroundOnPreloader;
      }
      
      public static function set canShowAds(b:Boolean) : void
      {
         _canShowAds = b;
      }
      
      public static function get gamerSafeLinkInPerloader() : Boolean
      {
         return _gamerSafeLinkInPreloader;
      }
      
      public static function set candyStandScoreHandling(candyStandScoreHandling:Boolean) : void
      {
         _candyStandScoreHandling = candyStandScoreHandling;
      }
      
      public static function set zapakGameId(zapakGameId:int) : void
      {
         _zapakGameId = zapakGameId;
      }
      
      public static function set sponsorVisualFrame(sponsorVisualFrame:int) : void
      {
         _sponsorVisualFrame = sponsorVisualFrame;
      }
      
      public static function get sponsorContextMenuItem() : ContextMenuItemWithCallback
      {
         return _sponsorContextMenuItem;
      }
      
      public static function get isIphoneVersion() : Boolean
      {
         return _isIphoneVersion;
      }
      
      public static function set defaultLanguage(defaultLanguage:String) : void
      {
         _defaultLanguage = defaultLanguage;
      }
      
      public static function get sponsorSiteMoreGamesUrl() : String
      {
         return _sponsorSiteMoreGamesUrl;
      }
      
      public static function get gameTitle() : String
      {
         return _gameTitle;
      }
      
      public static function get dontTouchStage() : Boolean
      {
         return _dontTouchStage;
      }
      
      public static function get showGSDescInPreloader() : Boolean
      {
         return _showGSDescInPreloader;
      }
      
      public static function set defaultScaleMode(defaultScaleMode:String) : void
      {
         _defaultScaleMode = defaultScaleMode;
      }
      
      public static function set sponsorName(value:String) : void
      {
         _sponsorName = value;
         if(value == NAME_BERZERK)
         {
            _sponsorContextMenuItem.contextMenuItem.caption = "www.berzerkstudio.com";
         }
         else
         {
            _sponsorContextMenuItem.contextMenuItem.caption = "Sponsored by " + value;
         }
      }
      
      public static function get versionInfo() : String
      {
         return _versionInfo;
      }
      
      public static function get ignoreExtensionDomain() : Boolean
      {
         return _ignoreExtensionDomain;
      }
      
      public static function get urlSiteGamerSafe() : String
      {
         return _urlSiteGamerSafe;
      }
      
      public static function get useEncryptionForSaveFile() : Boolean
      {
         return _useEncryptionForSaveFile;
      }
      
      public static function get exclusiveStuffVisible() : Boolean
      {
         return _exclusiveStuffVisible;
      }
      
      public static function set noKeyManager(noKeyManager:Boolean) : void
      {
         _noKeyManager = noKeyManager;
      }
      
      public static function get gamezheroGameCode() : String
      {
         return _gamezheroGameCode;
      }
      
      public static function set transparentBackGroundOnPreloader(transparentBackGroundOnPreloader:Boolean) : void
      {
         _transparentBackGroundOnPreloader = transparentBackGroundOnPreloader;
      }
      
      public static function set debugVersion(debugVersion:Boolean) : void
      {
         _debugVersion = debugVersion;
      }
      
      public static function set defaultLanguageForcedOnLoad(defaultLanguageForcedOnLoad:Boolean) : void
      {
         _defaultLanguageForcedOnLoad = defaultLanguageForcedOnLoad;
      }
      
      public static function get canBePlayedOffline() : Boolean
      {
         return _canBePlayedOffline;
      }
      
      public static function get canProfileTime() : Boolean
      {
         return _canProfileTime;
      }
      
      public static function set urlsSiteLocks(urlsSiteLocks:Array) : void
      {
         _urlsSiteLocks = urlsSiteLocks;
      }
      
      public static function set cpmInterlevelId(cpmInterlevelId:String) : void
      {
         _cpmInterlevelId = cpmInterlevelId;
      }
      
      public static function get gamezheroGameName() : String
      {
         return _gamezheroGameName;
      }
      
      public static function get sponsorVisualFrame() : int
      {
         return _sponsorVisualFrame;
      }
      
      public static function get cpmPreloaderId() : String
      {
         return _cpmPreloaderId;
      }
      
      public static function get canShowAds() : Boolean
      {
         return _canShowAds;
      }
      
      public static function get candyStandScoreHandling() : Boolean
      {
         return _candyStandScoreHandling;
      }
      
      public static function get zapakGameId() : int
      {
         return _zapakGameId;
      }
      
      public static function set gamerSafeLinkInPerloader(gamerSafeLinkInPerloader:Boolean) : void
      {
         _gamerSafeLinkInPreloader = gamerSafeLinkInPerloader;
      }
      
      public static function set sponsorSiteThisGameUrl(sponsorSiteThisGameUrl:String) : void
      {
         _sponsorSiteThisGameUrl = sponsorSiteThisGameUrl;
      }
      
      public static function set isIphoneVersion(isIphoneVersion:Boolean) : void
      {
         _isIphoneVersion = isIphoneVersion;
      }
      
      public static function set autoTransferFileOnConnect(autoTransferFileOnConnect:Boolean) : void
      {
         _autoTransferFileOnConnect = autoTransferFileOnConnect;
      }
      
      public static function set candyStandId(candyStandId:String) : void
      {
         _candyStandId = candyStandId;
      }
      
      public static function set dontTouchStage(dontTouchStage:Boolean) : void
      {
         _dontTouchStage = dontTouchStage;
      }
      
      public static function OnClickSponsorSite(e:Event) : void
      {
         if(_sponsorSiteUrl == "" || _sponsorSiteUrl == null)
         {
            return;
         }
         navigateToURL(new URLRequest(_sponsorSiteUrl));
         ExternalAPIManager.getMetricsAPI().RecordStats(_sponsorSiteUrl,MetricGroup.VIRAL);
      }
      
      public static function OnClickSponsorThisGame(e:Event) : void
      {
         if(_sponsorSiteThisGameUrl == "" || _sponsorSiteThisGameUrl == null)
         {
            return;
         }
         navigateToURL(new URLRequest(_sponsorSiteThisGameUrl));
         ExternalAPIManager.getMetricsAPI().RecordStats(_sponsorSiteThisGameUrl,MetricGroup.VIRAL);
      }
      
      public static function get debugVersion() : Boolean
      {
         return _debugVersion;
      }
      
      public static function set sponsorContextMenuItem(sponsorContextMenuItem:ContextMenuItemWithCallback) : void
      {
         _sponsorContextMenuItem = sponsorContextMenuItem;
      }
      
      public static function set sponsorSiteMoreGamesUrl(sponsorSiteMoreGamesUrl:String) : void
      {
         _sponsorSiteMoreGamesUrl = sponsorSiteMoreGamesUrl;
      }
      
      public static function set gameTitle(gameTitle:String) : void
      {
         _gameTitle = gameTitle;
      }
      
      public static function get defaultLanguageForcedOnLoad() : Boolean
      {
         return _defaultLanguageForcedOnLoad;
      }
      
      private static function onClickMenuItem() : void
      {
         if(VersionInfo.sponsorSiteUrl == "" || VersionInfo.sponsorSiteUrl == null)
         {
            return;
         }
         navigateToURL(new URLRequest(VersionInfo.sponsorSiteUrl));
         ExternalAPIManager.getMetricsAPI().RecordStats(VersionInfo.sponsorSiteUrl,MetricGroup.VIRAL);
      }
      
      public static function OnClickBerzerkSite(e:Event) : void
      {
         navigateToURL(new URLRequest(URL_SITE_BERZERK));
         ExternalAPIManager.getMetricsAPI().RecordStats(URL_SITE_BERZERK,MetricGroup.VIRAL);
      }
      
      public static function set showGSDescInPreloader(showGSDescInPreloader:Boolean) : void
      {
         _showGSDescInPreloader = showGSDescInPreloader;
      }
      
      public static function set exclusiveStuffVisible(exclusiveStuffVisible:Boolean) : void
      {
         _exclusiveStuffVisible = exclusiveStuffVisible;
      }
      
      public static function set versionInfo(versionInfo:String) : void
      {
         _versionInfo = versionInfo;
      }
      
      public static function get autoTransferFileOnConnect() : Boolean
      {
         return _autoTransferFileOnConnect;
      }
      
      public static function set useEncryptionForSaveFile(useEncryptionForSaveFile:Boolean) : void
      {
         _useEncryptionForSaveFile = useEncryptionForSaveFile;
      }
      
      public static function OnClickSponsorMoreGames(e:Event) : void
      {
         if(_sponsorSiteMoreGamesUrl == "" || _sponsorSiteMoreGamesUrl == null)
         {
            return;
         }
         navigateToURL(new URLRequest(_sponsorSiteMoreGamesUrl));
         ExternalAPIManager.getMetricsAPI().RecordStats(_sponsorSiteMoreGamesUrl,MetricGroup.VIRAL);
      }
      
      public static function set urlSiteGamerSafe(urlSiteGamerSafe:String) : void
      {
         _urlSiteGamerSafe = urlSiteGamerSafe;
      }
      
      public static function get sponsorSiteThisGameUrl() : String
      {
         return _sponsorSiteThisGameUrl;
      }
      
      public static function set ignoreExtensionDomain(ignoreExtensionDomain:Boolean) : void
      {
         _ignoreExtensionDomain = ignoreExtensionDomain;
      }
      
      public static function get candyStandId() : String
      {
         return _candyStandId;
      }
      
      public static function set useSiteLock(useSiteLock:Boolean) : void
      {
         _useSiteLock = useSiteLock;
      }
      
      public static function set showCannotPublishSticker(showCannotPublishSticker:Boolean) : void
      {
         _showCannotPublishSticker = showCannotPublishSticker;
      }
      
      public static function get useSiteLock() : Boolean
      {
         return _useSiteLock;
      }
      
      public static function set gamezheroGameCode(gamezheroGameCode:String) : void
      {
         _gamezheroGameCode = gamezheroGameCode;
      }
      
      public static function get showCannotPublishSticker() : Boolean
      {
         return _showCannotPublishSticker;
      }
      
      public static function OnClickSpecimenSite(e:Event) : void
      {
         navigateToURL(new URLRequest(URL_SITE_SPECIMEN));
         ExternalAPIManager.getMetricsAPI().RecordStats(URL_SITE_SPECIMEN,MetricGroup.VIRAL);
      }
   }
}

