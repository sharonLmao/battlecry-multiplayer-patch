package com.battlecry.screens.view
{
   import com.battlecry.BedUtil.Slider;
   import com.battlecry.io.BC_GamePrefs;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.files.FileManager;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   
   public class SoundsView extends ObjectView
   {
      
      private var _soundSlider:Slider;
      
      private var _musicSlider:Slider;
      
      public function SoundsView(visual:DisplayObjectContainer)
      {
         super(visual);
         this._soundSlider = new Slider(this.soundSlider,new Callback(this.SetSfxVolumeFromSlider,this,null));
         this._musicSlider = new Slider(this.musicSlider,new Callback(this.SetMusicVolumeFromSlider,this,null));
         this.Refresh();
         this.SetSfxVolumeFromSlider();
         this.SetMusicVolumeFromSlider();
      }
      
      public function get soundSlider() : MovieClip
      {
         return visual.getChildByName("soundSlider") as MovieClip;
      }
      
      private function get gamePrefs() : BC_GamePrefs
      {
         return FileManager.instance.gamePrefs as BC_GamePrefs;
      }
      
      public function get musicSlider() : MovieClip
      {
         return visual.getChildByName("musicSlider") as MovieClip;
      }
      
      private function SetSfxVolumeFromSlider() : void
      {
         this.gamePrefs.SetSoundOn(true);
         this.gamePrefs.soundVolume = Math.round(this._soundSlider.prct * 100);
         if(this._soundSlider.prct <= 0.01)
         {
            this.gamePrefs.SetSoundOn(false);
         }
         this.Refresh();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         if(!this.gamePrefs.soundOn)
         {
            this._soundSlider.prct = 0;
         }
         else
         {
            this._soundSlider.prct = this.gamePrefs.soundVolume / 100;
         }
         if(!this.gamePrefs.musicOn)
         {
            this._musicSlider.prct = 0;
         }
         else
         {
            this._musicSlider.prct = this.gamePrefs.musicVolume / 100;
         }
      }
      
      private function SetMusicVolumeFromSlider() : void
      {
         this.gamePrefs.SetMusicOn(true);
         this.gamePrefs.musicVolume = Math.round(this._musicSlider.prct * 100);
         if(this._musicSlider.prct <= 0.01)
         {
            this.gamePrefs.SetMusicOn(false);
         }
         this.Refresh();
      }
   }
}

