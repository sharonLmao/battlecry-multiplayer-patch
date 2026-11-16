package com.battlecry.init
{
   import com.battlecry.io.PlayerIO.ModelExternalPremiumAPI;
   import com.battlecry.io.PlayerIO.ModelExternalPremiumAPIEnum;
   import com.battlecry.io.multi.ArmorGamesController;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class BC_VersionInfo
   {
      
      private static var _loader:URLLoader;
      
      private static var _loadExternalConstant:Boolean;
      
      private static var _traceExternalConstant:Boolean;
      
      public static var armorGamesController:ArmorGamesController;
      
      private static var _loadExternalLanguage:Boolean = false;
      
      private static var _loadAdminDataSharedObject:Boolean = false;
      
      private static var _loadExternalAllVisual:Boolean = false;
      
      private static var _hideDebugVisual:Boolean = false;
      
      private static var _quickDebug:Boolean = false;
      
      public static var connectPIO:Boolean = false;
      
      private static var _quickDebugControlEnemy:Boolean = false;
      
      public static var isBitMapMode:Boolean = true;
      
      public static var loadExternalEnLanguageXML:Boolean = false;
      
      public static var modelExternalAPI:ModelExternalPremiumAPI = ModelExternalPremiumAPIEnum.NULL;
      
      private static var _urlChallenge:String = "www.berzerkstudio.com/games/battlecry/index.php?friend=";
      
      private static var _cookieGSURL:String = "http://www.berzerkstudio.com/games/battlecry/GS/index.php?load";
      
      private static var _cookieKongURL:String = "http://www.berzerkstudio.com/games/battlecry/KG/index.php?load";
      
      private static var _challengeWith:String = "";
      
      public static var isGamerSafe:Boolean = false;
      
      public static var isArmorGames:Boolean = false;
      
      public static var isKongregate:Boolean = false;
      
      public static var isOopla:Boolean = false;
      
      public static var URL_THUMBNAIL_RANK1:String = "http://www.berzerkstudio.com/games/coliseum/SOC_FB_RANK1.png";
      
      public static var URL_THUMBNAIL_RANK2:String = "http://www.berzerkstudio.com/games/coliseum/SOC_FB_RANK2.png";
      
      public static var URL_THUMBNAIL_RANK3:String = "http://www.berzerkstudio.com/games/coliseum/SOC_FB_RANK3.png";
      
      public static var URL_THUMBNAIL_RANK4:String = "http://www.berzerkstudio.com/games/coliseum/SOC_FB_RANK4.png";
      
      public static var URL_THUMBNAIL_RANK5:String = "http://www.berzerkstudio.com/games/coliseum/SOC_FB_RANK5.png";
      
      public static var URL_THUMBNAIL_RANK6:String = "http://www.berzerkstudio.com/games/coliseum/SOC_FB_RANK6.png";
      
      public static var URL_THUMBNAIL_RANK7:String = "http://www.berzerkstudio.com/games/coliseum/SOC_FB_RANK7.png";
      
      public static var URL_THUMBNAIL_RANK8:String = "http://www.berzerkstudio.com/games/coliseum/SOC_FB_RANK8.png";
      
      public static var URL_THUMBNAIL_RANK9:String = "http://www.berzerkstudio.com/games/coliseum/SOC_FB_RANK9.png";
      
      public static var URL_THUMBNAIL_RANK10:String = "http://www.berzerkstudio.com/games/coliseum/SOC_FB_RANK10.png";
      
      public function BC_VersionInfo()
      {
         super();
      }
      
      public static function afterGSConnect() : void
      {
         GetChallengerFromURL();
      }
      
      public static function onClickTwitter() : void
      {
         navigateToURL(new URLRequest("http://twitter.com/berzerkstudio"));
      }
      
      public static function onHostThisGame() : void
      {
         navigateToURL(new URLRequest("http://sogood.com/gamesforsite.php"));
      }
      
      public static function GetChallengerFromString(s:String) : void
      {
         _loader = new URLLoader();
         _loader.load(new URLRequest(s));
         _loader.addEventListener(Event.COMPLETE,onGetChallenge);
      }
      
      public static function get loadExternalAllVisual() : Boolean
      {
         return _loadExternalAllVisual;
      }
      
      public static function set loadExternalAllVisual(loadExternalAllVisual:Boolean) : void
      {
         _loadExternalAllVisual = loadExternalAllVisual;
      }
      
      public static function set traceExternalConstant(traceExternalConstant:Boolean) : void
      {
         _traceExternalConstant = traceExternalConstant;
      }
      
      public static function get traceExternalConstant() : Boolean
      {
         return _traceExternalConstant;
      }
      
      public static function get loadAdminDataSharedObject() : Boolean
      {
         return _loadAdminDataSharedObject;
      }
      
      public static function set loadExternalLanguage(loadExternalLanguage:Boolean) : void
      {
         _loadExternalLanguage = loadExternalLanguage;
      }
      
      public static function set hideDebugVisual(hideDebugVisual:Boolean) : void
      {
         _hideDebugVisual = hideDebugVisual;
      }
      
      public static function set loadExternalConstant(loadExternalConstant:Boolean) : void
      {
         _loadExternalConstant = loadExternalConstant;
      }
      
      private static function onGetChallenge(e:Event) : void
      {
         var msg:String = null;
         var str:String = _loader.data;
         if(str != null && str.indexOf("friend=") != -1)
         {
            msg = _loader.data.split("friend=")[1];
            _challengeWith = msg.split("&")[0];
         }
      }
      
      public static function get loadExternalConstant() : Boolean
      {
         return _loadExternalConstant;
      }
      
      public static function set quickDebug(quickDebug:Boolean) : void
      {
         _quickDebug = quickDebug;
      }
      
      public static function get quickDebugControlEnemy() : Boolean
      {
         return _quickDebugControlEnemy;
      }
      
      public static function get urlChallenge() : String
      {
         return _urlChallenge;
      }
      
      public static function get quickDebug() : Boolean
      {
         return _quickDebug;
      }
      
      public static function set challengeWith(challengeWith:String) : void
      {
         _challengeWith = challengeWith;
      }
      
      public static function GetVersion() : String
      {
         return "2.2";
      }
      
      public static function get loadExternalLanguage() : Boolean
      {
         return _loadExternalLanguage;
      }
      
      public static function onClickFacebook() : void
      {
         navigateToURL(new URLRequest("http://www.facebook.com/BerzerkStudio"));
      }
      
      public static function get hideDebugVisual() : Boolean
      {
         return _hideDebugVisual;
      }
      
      public static function onMoreGames() : void
      {
         navigateToURL(new URLRequest("http://sogood.com"));
      }
      
      public static function GetChallengerFromURL() : void
      {
         _loader = new URLLoader();
         if(isKongregate)
         {
            _loader.load(new URLRequest(_cookieKongURL));
         }
         else
         {
            _loader.load(new URLRequest(_cookieGSURL));
         }
         _loader.addEventListener(Event.COMPLETE,onGetChallenge);
      }
      
      public static function get challengeWith() : String
      {
         return _challengeWith;
      }
      
      public static function set loadAdminDataSharedObject(loadAdminDataSharedObject:Boolean) : void
      {
         _loadAdminDataSharedObject = loadAdminDataSharedObject;
      }
      
      public static function set quickDebugControlEnemy(quickDebugControlEnemy:Boolean) : void
      {
         _quickDebugControlEnemy = quickDebugControlEnemy;
      }
   }
}

