package com.lachhhEngine.games.sfx
{
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.meta.metaObject.MetaSfx;
   import com.lachhhEngine.games.meta.metaObject.MetaSound2D;
   import com.lachhhEngine.games.physique.Actor;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class Sound2D extends Sfx
   {
      
      private static var _muted:Boolean = false;
      
      private static var _FXvolume:Number = 1;
      
      private static var _oldFXVolume:Number = 1;
      
      private static var _initPitch:Number = 1;
      
      private var _id:int;
      
      private var _distVolume:Number = -1;
      
      private var _bIsLooping:Boolean = false;
      
      private var _distPan:Number = -1;
      
      private var _msStart:Number = 0;
      
      private var _isPlaying:Boolean;
      
      private var _mcEmetteur:Actor = null;
      
      public function Sound2D(s:Sound)
      {
         super(s);
         soundTransform = new SoundTransform(volume * _FXvolume);
      }
      
      public static function set initPitch(initPitch:Number) : void
      {
         _initPitch = initPitch;
      }
      
      public static function SetFxVolume(vol:Number) : void
      {
         _FXvolume = vol;
         _oldFXVolume = vol;
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
         _muted = mute;
         if(mute)
         {
            _oldFXVolume = _FXvolume;
            _FXvolume = 0;
         }
         else
         {
            _FXvolume = _oldFXVolume;
         }
      }
      
      private function CalculateTransform(main:MainGame) : void
      {
         var dx:Number = NaN;
         var dy:Number = NaN;
         var nDist:Number = NaN;
         var pan:Number = NaN;
         var vol:Number = NaN;
         if(this._mcEmetteur == null)
         {
            soundTransform.volume = Jukebox.instance.soundMuted ? 0 : volume * _FXvolume;
            return;
         }
         if(main == null || main.game == null)
         {
            soundTransform.volume = 0;
         }
         else
         {
            dx = this._mcEmetteur.px - main.game.camera.GetX();
            dy = this._mcEmetteur.py - main.game.camera.GetY();
            nDist = dx * dx + dy * dy;
            pan = Math.min(Math.max(-1,dx / this._distPan),1);
            vol = Math.max(Math.min(1 - nDist / (this._distVolume * this._distVolume),1),0);
            soundTransform.pan = pan;
            soundTransform.volume = Jukebox.instance.soundMuted ? 0 : vol * volume * _FXvolume;
         }
      }
      
      public function Play(bLoop:Boolean = false) : Boolean
      {
         if(length == 0)
         {
            trace("WARNING : Sound2D_c : The sound isn\'t map to anything. ");
            return true;
         }
         this._bIsLooping = bLoop;
         soundTransform.volume = _FXvolume;
         soundChannel = sound.play(this._msStart,bLoop ? int.MAX_VALUE : 0,soundTransform);
         if(soundChannel == null)
         {
            return false;
         }
         if(bLoop)
         {
         }
         this._isPlaying = true;
         return true;
      }
      
      public function IsEnabled() : Boolean
      {
         return !(soundTransform == null || soundChannel == null || this._mcEmetteur == null);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         if(soundChannel != null)
         {
            soundChannel.stop();
         }
         this._mcEmetteur = null;
         this._isPlaying = false;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function GetIsLooping() : Boolean
      {
         return this._bIsLooping;
      }
      
      public function OnRemove() : void
      {
      }
      
      public function get isPlaying() : Boolean
      {
         return this._isPlaying;
      }
      
      public function Stop() : void
      {
         if(soundChannel == null)
         {
            trace("WARNING :: 2DSound :: Stop :: Sound has not be played before : " + this);
            return;
         }
         soundChannel.stop();
         this._isPlaying = false;
      }
      
      public function get mcEmetteur() : Actor
      {
         return this._mcEmetteur;
      }
      
      public function SetEnable(b:Boolean) : void
      {
      }
      
      public function GetChannel() : SoundChannel
      {
         return soundChannel;
      }
      
      override public function Update(main:MainGame) : void
      {
         super.Update(main);
         this.CalculateTransform(main);
         soundChannel.soundTransform = soundTransform;
      }
      
      public function OnAdd() : void
      {
      }
      
      public function set mcEmetteur(mcEmetteur:Actor) : void
      {
         this._mcEmetteur = mcEmetteur;
      }
      
      override public function OnSoundComplete() : void
      {
         if(this._bIsLooping)
         {
            return;
         }
         Jukebox.instance.DestroySound(this);
      }
      
      public function GetSound() : Sound
      {
         return sound.sound;
      }
      
      public function SetVolume(n:Number) : void
      {
         soundTransform.volume = n;
         volume = n;
         soundChannel.soundTransform = soundTransform;
      }
      
      override public function Init(metaObject:MetaSfx) : void
      {
         super.Init(metaObject);
         var metaSound:MetaSound2D = MetaSound2D(metaObject);
         this._mcEmetteur = metaSound.mcEmetteur;
         this._id = metaSound.instanceType;
         this._distPan = metaSound.distPan;
         this._distVolume = metaSound.distVolume;
         this._msStart = metaSound.msStart;
         this.CalculateTransform(null);
         this._isPlaying = false;
         pitch = _initPitch;
      }
   }
}

