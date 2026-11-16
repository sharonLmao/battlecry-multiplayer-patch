package com.battlecry.io
{
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.io.files.GamePrefs;
   import flash.display.StageQuality;
   
   public class BC_GamePrefs extends GamePrefs
   {
      
      private var _musicVolume:Number = 100;
      
      private var _defaultQuality:int = 1;
      
      private var _soundVolume:Number = 100;
      
      private var _stageQuality:String;
      
      public function BC_GamePrefs(main:MainGame)
      {
         super(main);
         this._soundVolume = 100;
         this._musicVolume = 100;
         this._defaultQuality = GamePrefs.QUALITY_MED;
         this._stageQuality = StageQuality.MEDIUM;
         this.SetQuality(GamePrefs.QUALITY_MED);
      }
      
      public function get stageQuality() : String
      {
         return this._stageQuality;
      }
      
      public function set stageQuality(stageQuality:String) : void
      {
         this._stageQuality = stageQuality;
      }
      
      public function UpdateQuality(i:int = -1) : void
      {
         if(i == -1)
         {
            i = this._defaultQuality;
         }
         switch(i)
         {
            case QUALITY_LOW:
               this._stageQuality = StageQuality.LOW;
               main.stage.quality = StageQuality.LOW;
               quality = GamePrefs.QUALITY_LOW;
               break;
            case QUALITY_MED:
               this._stageQuality = StageQuality.MEDIUM;
               main.stage.quality = StageQuality.MEDIUM;
               quality = GamePrefs.QUALITY_MED;
               break;
            case QUALITY_HIGH:
               this._stageQuality = StageQuality.HIGH;
               main.stage.quality = StageQuality.HIGH;
               quality = GamePrefs.QUALITY_HIGH;
               break;
            default:
               throw new Error("Wrong QualityId : Use GamePrefs.QUALITY_XXX");
         }
      }
      
      public function get soundVolume() : Number
      {
         return this._soundVolume;
      }
      
      override public function SetQuality(iQuality:int) : void
      {
         super.SetQuality(iQuality);
         this._defaultQuality = iQuality;
         this.UpdateQuality(iQuality);
      }
      
      override public function Decode(s:String) : void
      {
         var params:Array = s.split(SEPARATOR);
         this._stageQuality = params.shift();
         quality = int(params.shift());
         language = params.shift();
         musicOn = params.shift() == "1";
         soundOn = params.shift() == "1";
         haveASaveFileOnPremiumAPI = params.shift() == "1";
         this._soundVolume = int(params.shift());
         this._musicVolume = int(params.shift());
         if(language == "null" || language == null)
         {
            language = "en";
         }
         SetLanguage(language);
         this.SetQuality(quality);
         Jukebox.instance.SetFxVolume(this._soundVolume / 100);
         Jukebox.instance.SetMusicVolume(this._musicVolume / 100);
         SetMusicOn(true);
         SetSoundOn(soundOn);
      }
      
      public function set soundVolume(soundVolume:Number) : void
      {
         this._soundVolume = soundVolume;
         Jukebox.instance.SetFxVolume(soundVolume / 100);
      }
      
      override public function get haveASaveFileOnPremiumAPI() : Boolean
      {
         return false;
      }
      
      override public function Encode() : String
      {
         return this._stageQuality + SEPARATOR + quality + SEPARATOR + language + SEPARATOR + (musicOn ? "1" : "0") + SEPARATOR + (soundOn ? "1" : "0") + SEPARATOR + (this.haveASaveFileOnPremiumAPI ? "1" : "0") + SEPARATOR + this._soundVolume + SEPARATOR + this._musicVolume;
      }
      
      public function set musicVolume(musicVolume:Number) : void
      {
         this._musicVolume = musicVolume;
         Jukebox.instance.SetMusicVolume(musicVolume / 100);
      }
      
      public function get musicVolume() : Number
      {
         return this._musicVolume;
      }
   }
}

