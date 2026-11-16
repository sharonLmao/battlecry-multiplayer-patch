package com.lachhhEngine.io.files
{
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.io.ISaveObject;
   import com.lachhhEngine.multilingual.TextFactory;
   import com.lachhhEngine.multilingual.TextFieldFinder;
   
   public class GamePrefs implements ISaveObject
   {
      
      public static const SEPARATOR:String = "~";
      
      public static const QUALITY_LOW:int = 0;
      
      public static const QUALITY_MED:int = 1;
      
      public static const QUALITY_HIGH:int = 2;
      
      private var _quality:int = 2;
      
      private var _soundOn:Boolean = true;
      
      private var _main:MainGame;
      
      private var _musicOn:Boolean = true;
      
      private var _haveASaveFileOnPremiumAPI:Boolean = false;
      
      private var _language:String = TextFactory.instance.LANGUAGE_EN.locale;
      
      public function GamePrefs(main:MainGame)
      {
         super();
         this._main = main;
      }
      
      public function SetMusicOn(b:Boolean) : void
      {
         this._musicOn = b;
         Jukebox.instance.MuteMusic(!b);
      }
      
      public function NextQuality() : void
      {
         switch(this._quality)
         {
            case QUALITY_LOW:
               this.SetQuality(QUALITY_MED);
               break;
            case QUALITY_MED:
               this.SetQuality(QUALITY_HIGH);
               break;
            case QUALITY_HIGH:
               this.SetQuality(QUALITY_LOW);
         }
      }
      
      public function get isDirty() : Boolean
      {
         return true;
      }
      
      public function NextLanguage() : void
      {
         TextFactory.instance.NextLanguage();
         this.SetLanguage(TextFactory.instance.language.locale);
      }
      
      public function Decode(s:String) : void
      {
         var params:Array = s.split(SEPARATOR);
         this._quality = int(params.shift());
         this._language = params.shift();
         this._musicOn = params.shift() == "1";
         this._soundOn = params.shift() == "1";
         this._haveASaveFileOnPremiumAPI = params.shift() == "1";
         this.SetLanguage(this._language);
         this.SetQuality(this._quality);
         this.SetMusicOn(this._musicOn);
         this.SetSoundOn(this._soundOn);
      }
      
      public function set isDirty(value:Boolean) : void
      {
      }
      
      public function ToggleMusic() : void
      {
         this.SetMusicOn(!this._musicOn);
      }
      
      public function PrevLanguage() : void
      {
         TextFactory.instance.PrevLanguage();
         this.SetLanguage(TextFactory.instance.language.locale);
      }
      
      public function PrevQuality() : void
      {
         switch(this._quality)
         {
            case QUALITY_LOW:
               this.SetQuality(QUALITY_HIGH);
               break;
            case QUALITY_MED:
               this.SetQuality(QUALITY_LOW);
               break;
            case QUALITY_HIGH:
               this.SetQuality(QUALITY_MED);
         }
      }
      
      public function set soundOn(soundOn:Boolean) : void
      {
         this._soundOn = soundOn;
      }
      
      public function SetQuality(iQuality:int) : void
      {
         this._quality = iQuality;
         switch(this._quality)
         {
            case QUALITY_LOW:
            case QUALITY_MED:
            case QUALITY_HIGH:
               break;
            default:
               throw new Error("Wrong QualityId : Use GamePrefs.QUALITY_XXX");
         }
      }
      
      public function set musicOn(musicOn:Boolean) : void
      {
         this._musicOn = musicOn;
      }
      
      private function UpdateLanguage() : void
      {
         if(TextFactory.instance.GetLanguageFromLocale(this._language) == null)
         {
            this._language = VersionInfo.defaultLanguage;
         }
         TextFactory.instance.SetLanguageFromLocale(this._language);
         TextFieldFinder.Update();
      }
      
      public function get musicOn() : Boolean
      {
         return this._musicOn;
      }
      
      public function get soundOn() : Boolean
      {
         return this._soundOn;
      }
      
      public function get language() : String
      {
         return this._language;
      }
      
      public function set haveASaveFileOnPremiumAPI(haveASaveFileOnGS:Boolean) : void
      {
         this._haveASaveFileOnPremiumAPI = haveASaveFileOnGS;
      }
      
      public function set language(language:String) : void
      {
         this._language = language;
      }
      
      public function SetSoundOn(b:Boolean) : void
      {
         this._soundOn = b;
         Jukebox.instance.MuteSound(!b);
      }
      
      public function get haveASaveFileOnPremiumAPI() : Boolean
      {
         return this._haveASaveFileOnPremiumAPI;
      }
      
      public function Encode() : String
      {
         return this._quality + SEPARATOR + this._language + SEPARATOR + (this._musicOn ? "1" : "0") + SEPARATOR + (this._soundOn ? "1" : "0") + SEPARATOR + (this._haveASaveFileOnPremiumAPI ? "1" : "0");
      }
      
      public function get main() : MainGame
      {
         return this._main;
      }
      
      public function SetLanguage(locale:String) : void
      {
         this._language = locale;
         this.UpdateLanguage();
      }
      
      public function ToggleSound() : void
      {
         this.SetSoundOn(!this._soundOn);
      }
      
      public function set quality(quality:int) : void
      {
         this._quality = quality;
      }
      
      public function get quality() : int
      {
         return this._quality;
      }
   }
}

