package com.lachhhEngine.games.sfx
{
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.factory.SfxFactory;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaMusic;
   import com.lachhhEngine.games.meta.metaObject.MetaSound2D;
   import com.lachhhEngine.games.physique.Actor;
   import flash.media.Sound;
   
   public class Jukebox extends SfxManager
   {
      
      private static var _instance:Jukebox = null;
      
      private var _addedSound:Array = new Array();
      
      private var _tabSound:Array = new Array();
      
      private var _emptySound:EmptySound2D = new EmptySound2D(new Sound());
      
      private var _musicMuted:Boolean = false;
      
      private var _noSoundDeviceDetected:Boolean = false;
      
      private var _tabMusic:Array = new Array();
      
      private var _soundMuted:Boolean = false;
      
      public function Jukebox(soundFactory:SfxFactory)
      {
         super(soundFactory);
         if(_instance != null)
         {
            throw new Error("Jukebox already instanciated : Use Jukebox.instance");
         }
         _instance = this;
         this._emptySound.Init(new MetaSound2D());
      }
      
      public static function get instance() : Jukebox
      {
         return _instance;
      }
      
      public function SetMusicVolume(vol:Number) : void
      {
         MusicTrack.SetMusicVolume(vol);
         this.UpdateMusicVolume();
      }
      
      private function UpdateMusicVolume() : void
      {
         var m:MusicTrack = null;
         for(var i:int = 0; i < this._tabMusic.length; i++)
         {
            m = this._tabMusic[i];
            m.SetVolume(m.GetVolume());
         }
      }
      
      public function SetFxVolume(vol:Number) : void
      {
         Sound2D.SetFxVolume(vol);
      }
      
      public function PlayCurrentMusicTrack() : void
      {
         if(this.GetCurrentMusicTrack() != null)
         {
            this.GetCurrentMusicTrack().Play();
         }
      }
      
      public function get musicMuted() : Boolean
      {
         return this._musicMuted;
      }
      
      public function GetNbMusicTrack() : Number
      {
         return this._tabMusic.length;
      }
      
      public function PlaySoundFromMeta(metaSound:MetaSound2D) : Sound2D
      {
         var j:int = 0;
         var sameTypeAdded:int = 0;
         if(this._noSoundDeviceDetected)
         {
            return this._emptySound;
         }
         if(this._soundMuted && !metaSound.loop)
         {
            return this._emptySound;
         }
         if(this._tabSound.length >= 20)
         {
            for(j = 0; j < this._tabSound.length; j++)
            {
               if(!this._tabSound[j].GetIsLooping())
               {
                  this.DestroySound(this._tabSound[j]);
                  break;
               }
            }
         }
         if(this._tabSound.length >= 25)
         {
            this.DestroySound(this._tabSound[0]);
         }
         if(metaSound.limitToAddPerFrame > 0)
         {
            sameTypeAdded = this.SoundAddedOfType(metaSound.instanceType);
            if(sameTypeAdded >= metaSound.limitToAddPerFrame)
            {
               return null;
            }
         }
         var oSon:Sound2D = CreateSound2D(metaSound);
         if(!oSon.Play(metaSound.loop))
         {
            this._noSoundDeviceDetected = true;
            return this._emptySound;
         }
         this._tabSound.push(oSon);
         this._addedSound.push(metaSound.instanceType);
         return oSon;
      }
      
      public function DestroyAllSounds() : void
      {
         while(this._tabSound.length > 0)
         {
            if(!this.DestroySound(this._tabSound[0]))
            {
               this._tabSound.shift();
            }
         }
      }
      
      public function SetMute(bMute:Boolean) : void
      {
         this.MuteMusic(bMute);
         this.MuteSound(bMute);
      }
      
      public function MuteSound(mute:Boolean) : void
      {
         var s:Sound2D = null;
         Sound2D.Mute(mute);
         this._soundMuted = mute;
         for(var i:int = 0; i < this._tabSound.length; i++)
         {
            s = this._tabSound[i];
            if(mute)
            {
               s.Stop();
            }
         }
      }
      
      public function SetPitchOfAllMusics(pitch:Number) : void
      {
         var sfx:Sfx = null;
         for(var i:int = 0; i < this._tabMusic.length; i++)
         {
            sfx = this._tabMusic[i];
            sfx.pitch = pitch;
         }
         MusicTrack.initPitch = pitch;
      }
      
      public function PlaySound(idSfx:int) : Sound2D
      {
         var result:Sound2D = null;
         var metaSound:MetaSound2D = MetaManager.instance.CreateMetaSound2D(idSfx);
         result = this.PlaySoundFromMeta(metaSound);
         if(result == this._emptySound)
         {
            MetaManager.instance.DestroyMetaData(metaSound);
         }
         return result;
      }
      
      public function FadeAllMusicToDestroy(timeFade:int = 72) : void
      {
         var m:MusicTrack = null;
         for(var i:int = 0; i < this._tabMusic.length; i++)
         {
            m = MusicTrack(this._tabMusic[i]);
            m.FadeToDestroy(timeFade);
         }
      }
      
      public function DestroyMusicTrack(m:MusicTrack) : void
      {
         for(var i:int = 0; i < this._tabMusic.length; i++)
         {
            if(this._tabMusic[i] == m)
            {
               DestroyMusic(m);
               this._tabMusic.splice(i,1);
               return;
            }
         }
         trace("WARNING : Music not found in Jukebox.DestroyMusicTrack");
      }
      
      public function SoundAddedOfType(iType:int) : int
      {
         var count:int = 0;
         for(var i:int = 0; i < this._addedSound.length; i++)
         {
            if(this._addedSound[i] == iType)
            {
               count++;
            }
         }
         return count;
      }
      
      public function get soundMuted() : Boolean
      {
         return this._soundMuted;
      }
      
      public function DestroySound(oSon:Sound2D) : Boolean
      {
         if(oSon is EmptySound2D)
         {
            return true;
         }
         for(var i:int = 0; i < this._tabSound.length; i++)
         {
            if(this._tabSound[i] == oSon)
            {
               this._tabSound.splice(i,1);
               DestroySound2D(oSon);
               return true;
            }
         }
         if(oSon.GetSound() != null)
         {
            trace("WARNING :: Jukebox_C :: DestroySound :: Sound not found : " + oSon.GetSound());
         }
         return false;
      }
      
      public function Update(main:MainGame) : void
      {
         var m:MusicTrack = null;
         var son:Sound2D = null;
         while(this._addedSound.length > 0)
         {
            this._addedSound.shift();
         }
         for(var i:int = 0; i < this._tabMusic.length; i++)
         {
            m = MusicTrack(this._tabMusic[i]);
            m.Update(main);
         }
         for(i = 0; i < this._tabSound.length; i++)
         {
            son = this._tabSound[i];
            son.Update(main);
         }
      }
      
      public function SetPitchOfAllSound(pitch:Number) : void
      {
         var sfx:Sfx = null;
         for(var i:int = 0; i < this._tabSound.length; i++)
         {
            sfx = this._tabSound[i];
            sfx.pitch = pitch;
         }
         Sound2D.initPitch = pitch;
      }
      
      public function MuteMusic(mute:Boolean) : void
      {
         MusicTrack.Mute(mute);
         this._musicMuted = mute;
         this.UpdateMusicVolume();
      }
      
      public function PlaySound2D(idSfx:int, emetteur:Actor, loop:Boolean = false, distPan:int = 200, distVolume:int = 500) : Sound2D
      {
         var result:Sound2D = null;
         var metaSound:MetaSound2D = MetaManager.instance.CreateMetaSound2D(idSfx);
         metaSound.mcEmetteur = emetteur;
         metaSound.distPan = distPan;
         metaSound.distVolume = distVolume;
         metaSound.loop = loop;
         result = this.PlaySoundFromMeta(metaSound);
         if(result == this._emptySound)
         {
            MetaManager.instance.DestroyMetaData(metaSound);
         }
         return result;
      }
      
      public function FadeToMusic(idMusic:int, timeFade:int = 72, forceFade:Boolean = false) : MusicTrack
      {
         var m:MusicTrack = null;
         if(this.GetCurrentMusicTrack() != null && this.GetCurrentMusicTrack().metaInfo.instanceType == idMusic && !forceFade)
         {
            return this.GetCurrentMusicTrack();
         }
         this.FadeAllMusicToDestroy(timeFade);
         var metaMusic:MetaMusic = MetaManager.instance.CreateMetaMusic(idMusic);
         m = CreateMusic(metaMusic);
         m.FadeTo(timeFade,0,1);
         m.Init(metaMusic);
         m.Play(0,100);
         this._tabMusic.unshift(m);
         return m;
      }
      
      public function GetCurrentMusicTrack() : MusicTrack
      {
         return this._tabMusic[0];
      }
      
      public function DestroyAllMusicTrack() : void
      {
         while(this._tabMusic.length > 0)
         {
            this.DestroyMusicTrack(MusicTrack(this._tabMusic[0]));
         }
      }
      
      public function GetNbSounds() : Number
      {
         return this._tabSound.length;
      }
      
      public function StopCurrentMusicTrack() : void
      {
         if(this.GetCurrentMusicTrack() != null)
         {
            this.GetCurrentMusicTrack().Stop();
         }
      }
      
      public function DestroyAll() : void
      {
         this.DestroyAllMusicTrack();
         this.DestroyAllSounds();
      }
   }
}

