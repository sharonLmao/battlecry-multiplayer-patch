package com.battlecry.screens.view
{
   import com.battlecry.factories.BC_SfxFactory;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class LanguageView extends ObjectView
   {
      
      public function LanguageView(visual:DisplayObjectContainer)
      {
         super(visual);
         this.btn_NextLanguage.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_NextLanguage.addEventListener(MouseEvent.MOUSE_DOWN,this.onNextLanguage);
         this.btn_PrevLanguage.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_PrevLanguage.addEventListener(MouseEvent.MOUSE_DOWN,this.onPrevLanguage);
         this.Refresh();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_NextLanguage.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_NextLanguage.removeEventListener(MouseEvent.MOUSE_DOWN,this.onNextLanguage);
         this.btn_PrevLanguage.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.btn_PrevLanguage.removeEventListener(MouseEvent.MOUSE_DOWN,this.onPrevLanguage);
      }
      
      private function onOver(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ROLLOVER);
      }
      
      public function get btn_PrevLanguage() : ButtonSelect
      {
         return visual.getChildByName("btn_PrevLanguage") as ButtonSelect;
      }
      
      public function get languageTxt() : TextField
      {
         return visual.getChildByName("languageTxt") as TextField;
      }
      
      private function onPrevLanguage(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         TextFactory.instance.PrevLanguage();
         this.Refresh();
      }
      
      private function onNextLanguage(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         TextFactory.instance.NextLanguage();
         this.Refresh();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.languageTxt.text = TextFactory.instance.language.fullName;
      }
      
      public function get btn_NextLanguage() : ButtonSelect
      {
         return visual.getChildByName("btn_NextLanguage") as ButtonSelect;
      }
   }
}

