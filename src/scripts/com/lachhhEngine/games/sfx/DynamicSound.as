package com.lachhhEngine.games.sfx
{
   import flash.events.Event;
   import flash.events.SampleDataEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.ByteArray;
   
   public class DynamicSound
   {
      
      private var _dynamicSndChannel:SoundChannel;
      
      private var _numSamples:int;
      
      private var _sfx:Sfx;
      
      private var _loops:int;
      
      private var _isDestroyed:Boolean;
      
      private var _loadedMP3Samples:ByteArray;
      
      private var _bytes:ByteArray = null;
      
      private var _playbackSpeed:Number = 1;
      
      private var _dynamicSound:Sound;
      
      private var _phase:Number;
      
      private var _bruteSound:Sound;
      
      public function DynamicSound(s:Sound, sfx:Sfx)
      {
         super();
         this._bruteSound = s;
         this._sfx = sfx;
         this._isDestroyed = false;
      }
      
      public function stop() : void
      {
         if(this._dynamicSound)
         {
            this._dynamicSound.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
            this._dynamicSound = null;
         }
         if(this._dynamicSndChannel)
         {
            this._dynamicSndChannel.removeEventListener(Event.SOUND_COMPLETE,this.soundComplete);
            this._dynamicSndChannel = null;
         }
      }
      
      private function onSampleData(event:SampleDataEvent) : void
      {
         var l:Number = NaN;
         var r:Number = NaN;
         var outputLength:int = 0;
         while(outputLength < 2048)
         {
            this._loadedMP3Samples.position = int(this._phase) * 8;
            l = this._loadedMP3Samples.readFloat();
            r = this._loadedMP3Samples.readFloat();
            event.data.writeFloat(l);
            event.data.writeFloat(r);
            outputLength++;
            this._phase += this._playbackSpeed;
            if(this._phase < 0)
            {
               this._phase += this._numSamples;
            }
            else if(this._phase >= this._numSamples)
            {
               this._phase -= this._numSamples;
               --this._loops;
            }
         }
      }
      
      public function get playbackSpeed() : Number
      {
         return this._playbackSpeed;
      }
      
      public function get sound() : Sound
      {
         return this._bruteSound;
      }
      
      public function Destroy() : void
      {
         this._isDestroyed = true;
         this.stop();
      }
      
      public function set playbackSpeed(value:Number) : void
      {
         this._playbackSpeed = value;
      }
      
      public function get hasFinishedPlaying() : Boolean
      {
         return this._loops < 0;
      }
      
      private function soundComplete(e:Event) : void
      {
         this._sfx.OnSoundComplete();
      }
      
      public function get position() : Number
      {
         if(this._sfx.metaInfo.pitchable)
         {
            return int(this._phase) / 44.1;
         }
         return this.dynamicSndChannel.position;
      }
      
      public function get dynamicSound() : Sound
      {
         return this._dynamicSound;
      }
      
      public function get dynamicSndChannel() : SoundChannel
      {
         return this._dynamicSndChannel;
      }
      
      public function play(startTime:Number = 0, loops:int = 0, sndTransform:SoundTransform = null) : SoundChannel
      {
         this.stop();
         if(this._sfx.metaInfo.pitchable)
         {
            if(this._bytes == null)
            {
               this._bytes = new ByteArray();
               this._bruteSound.extract(this._bytes,int(this._bruteSound.length * 44.1));
            }
            this._dynamicSound = new Sound();
            this._dynamicSound.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
            this._loadedMP3Samples = this._bytes;
            this._numSamples = this._bytes.length / 8;
            this._phase = startTime * 44.1;
            this._loops = loops;
            this._dynamicSndChannel = this._dynamicSound.play(startTime,loops,sndTransform);
         }
         else
         {
            this._dynamicSndChannel = this._bruteSound.play(startTime,loops,sndTransform);
            if(loops <= 0 && this._dynamicSndChannel != null)
            {
               this._dynamicSndChannel.addEventListener(Event.SOUND_COMPLETE,this.soundComplete);
            }
         }
         return this._dynamicSndChannel;
      }
   }
}

