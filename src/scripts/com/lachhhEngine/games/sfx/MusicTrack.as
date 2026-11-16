package com.lachhhEngine.games.sfx
{
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.meta.metaObject.MetaMusic;
   import com.lachhhEngine.games.meta.metaObject.MetaSfx;
   import com.lachhhEngine.io.Callback;
   import flash.media.Sound;
   import flash.media.SoundTransform;
   
   public class MusicTrack extends Sfx
   {
      
      private static var _musicVolume:Number = 1;
      
      private static var _oldMusicVolume:Number = 1;
      
      private static var _muted:Boolean = false;
      
      private static var _initPitch:Number = 1;
      
      private var _enabled:Boolean = true;
      
      private var _isLoop:Boolean = true;
      
      private var _onEndMusicCallback:Callback;
      
      private var _onStopFadingScope:Object;
      
      private var _onStopFadingParams:Array;
      
      private var _isFading:Boolean = false;
      
      private var _onStopFadingCallback:Function;
      
      private var _fadeMod:Number = 0;
      
      private var _fadeTo:Number = 1;
      
      public function MusicTrack(s:Sound)
      {
         super(s);
         soundTransform = new SoundTransform(volume * _musicVolume);
      }
      
      public static function set initPitch(initPitch:Number) : void
      {
         _initPitch = initPitch;
      }
      
      public static function get initPitch() : Number
      {
         return _initPitch;
      }
      
      public static function Mute(mute:Boolean) : void
      {
         if(_muted == mute)
         {
            return;
         }
         if(mute)
         {
            _oldMusicVolume = _musicVolume;
            _musicVolume = 0;
         }
         else
         {
            _musicVolume = _oldMusicVolume;
         }
         _muted = mute;
      }
      
      public static function SetMusicVolume(vol:Number) : void
      {
         _oldMusicVolume = vol;
         if(!_muted)
         {
            _musicVolume = vol;
         }
      }
      
      override public function Update(main:MainGame) : void
      {
         super.Update(main);
         if(this._isFading)
         {
            this.SetVolume(volume + this._fadeMod);
            if(Math.abs(this._fadeTo - volume) <= Math.abs(this._fadeMod * 2))
            {
               this._isFading = false;
               this.SetVolume(this._fadeTo);
               this.OnStopFading();
            }
         }
      }
      
      public function FadeToDestroy(nFrame:int) : void
      {
         this._onStopFadingCallback = Jukebox.instance.DestroyMusicTrack;
         this._onStopFadingScope = Jukebox.instance;
         this._onStopFadingParams = [this];
         this.FadeTo(nFrame,volume,0);
      }
      
      public function FadeTo(nFrame:int, from:Number = -1, to:Number = -1) : void
      {
         if(from == -1 && to == -1)
         {
            return;
         }
         this.SetVolume(from == -1 ? volume : from);
         this._fadeTo = to == -1 ? this._fadeTo : to;
         if(volume != this._fadeTo)
         {
            this._isFading = true;
            this._fadeMod = (this._fadeTo - volume) / nFrame;
         }
      }
      
      public function IsPlaying() : Boolean
      {
         return soundChannel != null || sound.dynamicSndChannel != null;
      }
      
      public function get position() : Number
      {
         return sound.position;
      }
      
      public function IsEnabled() : Boolean
      {
         return this._enabled;
      }
      
      public function Play(startTime:Number = 0, loops:int = 0) : void
      {
         soundChannel = sound.play(startTime,this._isLoop ? int.MAX_VALUE : loops,soundTransform);
      }
      
      public function Stop() : void
      {
         sound.stop();
         if(soundChannel != null)
         {
            soundChannel.stop();
            soundChannel = null;
         }
      }
      
      public function OnRemove() : void
      {
      }
      
      public function GetVolume() : Number
      {
         return volume;
      }
      
      public function OnAdd() : void
      {
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.Stop();
      }
      
      public function SetEnable(b:Boolean) : void
      {
         this._enabled = b;
      }
      
      override public function Init(metaObject:MetaSfx) : void
      {
         super.Init(metaObject);
         var metaMusic:MetaMusic = MetaMusic(metaObject);
         this._isLoop = metaMusic.loop;
         this._onEndMusicCallback = metaMusic.endCallback;
         this._onStopFadingCallback = null;
         this._onStopFadingScope = null;
         this._onStopFadingParams = null;
         pitch = _initPitch;
      }
      
      override public function OnSoundComplete() : void
      {
         super.OnSoundComplete();
         if(this._onEndMusicCallback != null)
         {
            this._onEndMusicCallback.DoCallback();
            this._onEndMusicCallback = null;
         }
      }
      
      public function OnStopFading() : void
      {
         if(this._onStopFadingCallback != null)
         {
            this._onStopFadingCallback.apply(this._onStopFadingScope,this._onStopFadingParams);
         }
      }
      
      public function SetVolume(n:Number) : void
      {
         soundTransform.volume = n * _musicVolume;
         volume = n;
         if(soundChannel != null)
         {
            soundChannel.soundTransform = soundTransform;
         }
      }
   }
}

