package com.lachhhEngine.games.sfx
{
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.meta.metaObject.MetaSfx;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class Sfx
   {
      
      private var _sound:DynamicSound;
      
      private var _soundChannel:SoundChannel = null;
      
      private var _metaInfo:MetaSfx;
      
      private var _canBeCached:Boolean = true;
      
      private var _volume:Number = 1;
      
      private var _soundTransform:SoundTransform = null;
      
      public function Sfx(s:Sound)
      {
         super();
         this._sound = new DynamicSound(s,this);
      }
      
      public function get pitch() : Number
      {
         return this._sound.playbackSpeed;
      }
      
      public function set pitch(prct:Number) : void
      {
         this._sound.playbackSpeed = prct;
      }
      
      public function get sound() : DynamicSound
      {
         return this._sound;
      }
      
      public function get metaInfo() : MetaSfx
      {
         return this._metaInfo;
      }
      
      public function Destroy() : void
      {
         this._sound.Destroy();
      }
      
      public function get soundTransform() : SoundTransform
      {
         return this._soundTransform;
      }
      
      public function set sound(sound:DynamicSound) : void
      {
         this._sound = sound;
      }
      
      public function get volume() : Number
      {
         return this._volume;
      }
      
      public function set soundChannel(soundChannel:SoundChannel) : void
      {
         this._soundChannel = soundChannel;
      }
      
      public function Update(main:MainGame) : void
      {
         if(this._sound.hasFinishedPlaying)
         {
            this.OnSoundComplete();
         }
      }
      
      public function set canBeCached(canBeCached:Boolean) : void
      {
         this._canBeCached = canBeCached;
      }
      
      public function set metaInfo(metaInfo:MetaSfx) : void
      {
         this._metaInfo = metaInfo;
      }
      
      public function OnSoundComplete() : void
      {
      }
      
      public function set volume(volume:Number) : void
      {
         this._volume = volume;
      }
      
      public function get canBeCached() : Boolean
      {
         return this._canBeCached;
      }
      
      public function Init(metaSfx:MetaSfx) : void
      {
         this._metaInfo = metaSfx;
      }
      
      public function set soundTransform(soundTransform:SoundTransform) : void
      {
         this._soundTransform = soundTransform;
      }
      
      public function get soundChannel() : SoundChannel
      {
         return this._soundChannel;
      }
   }
}

