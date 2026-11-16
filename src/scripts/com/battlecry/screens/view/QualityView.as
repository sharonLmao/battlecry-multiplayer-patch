package com.battlecry.screens.view
{
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.BC_GamePrefs;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
   import com.lachhhEngine.io.files.FileManager;
   import com.lachhhEngine.io.files.GamePrefs;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   
   public class QualityView extends ObjectView
   {
      
      private var _buttonSelectGroup:ButtonSelectGroup;
      
      public function QualityView(visual:DisplayObjectContainer)
      {
         super(visual);
         this.btn_QualityLow.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_QualityLow.addEventListener(MouseEvent.MOUSE_DOWN,this.OnQualityLow);
         this.btn_QualityMed.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_QualityMed.addEventListener(MouseEvent.MOUSE_DOWN,this.onQualityMed);
         this.btn_QualityHigh.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_QualityHigh.addEventListener(MouseEvent.MOUSE_DOWN,this.onQualityHigh);
         this._buttonSelectGroup = new ButtonSelectGroup();
         this._buttonSelectGroup.AddButton(this.btn_QualityLow);
         this._buttonSelectGroup.AddButton(this.btn_QualityMed);
         this._buttonSelectGroup.AddButton(this.btn_QualityHigh);
         this.Refresh();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_QualityLow.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_QualityLow.removeEventListener(MouseEvent.MOUSE_DOWN,this.OnQualityLow);
         this.btn_QualityMed.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_QualityMed.removeEventListener(MouseEvent.MOUSE_DOWN,this.onQualityMed);
         this.btn_QualityHigh.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_QualityHigh.removeEventListener(MouseEvent.MOUSE_DOWN,this.onQualityHigh);
      }
      
      private function onQualityHigh(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         this.gamePrefs.SetQuality(GamePrefs.QUALITY_HIGH);
         this.Refresh();
      }
      
      public function get btn_QualityHigh() : ButtonSelect
      {
         return visual.getChildByName("btn_QualityHigh") as ButtonSelect;
      }
      
      private function onQualityMed(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         this.gamePrefs.SetQuality(GamePrefs.QUALITY_MED);
         this.Refresh();
      }
      
      public function get btn_QualityMed() : ButtonSelect
      {
         return visual.getChildByName("btn_QualityMed") as ButtonSelect;
      }
      
      private function OnQualityLow(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         this.gamePrefs.SetQuality(GamePrefs.QUALITY_LOW);
         this.Refresh();
      }
      
      public function get btn_QualityLow() : ButtonSelect
      {
         return visual.getChildByName("btn_QualityLow") as ButtonSelect;
      }
      
      private function onOver(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ROLLOVER);
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         switch(this.gamePrefs.quality)
         {
            case GamePrefs.QUALITY_LOW:
               this._buttonSelectGroup.SelectButton(this.btn_QualityLow);
               break;
            case GamePrefs.QUALITY_MED:
               this._buttonSelectGroup.SelectButton(this.btn_QualityMed);
               break;
            case GamePrefs.QUALITY_HIGH:
               this._buttonSelectGroup.SelectButton(this.btn_QualityHigh);
         }
      }
      
      private function get gamePrefs() : BC_GamePrefs
      {
         return FileManager.instance.gamePrefs as BC_GamePrefs;
      }
   }
}

