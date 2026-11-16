package com.battlecry.screens.view
{
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.utils.Utils;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   
   public class SoGoodLogoView extends ObjectView
   {
      
      public function SoGoodLogoView(visual:DisplayObjectContainer)
      {
         super(visual);
         this.btn_SoGoodFacebook.addEventListener(MouseEvent.MOUSE_DOWN,this.onSoGoodFacebook);
         this.btn_SoGoodLink.addEventListener(MouseEvent.MOUSE_DOWN,this.onSoGoodLink);
         this.btn_SoGoodTwitter.addEventListener(MouseEvent.MOUSE_DOWN,this.onSoGoodTwitter);
      }
      
      private function onSoGoodLink(event:MouseEvent) : void
      {
         Utils.navigateToURLAndRecord(new URLRequest("http://sogood.com/"));
      }
      
      public function get btn_SoGoodLink() : ButtonSelect
      {
         return visual.getChildByName("btn_SoGoodLink") as ButtonSelect;
      }
      
      public function get btn_SoGoodTwitter() : ButtonSelect
      {
         return visual.getChildByName("btn_SoGoodTwitter") as ButtonSelect;
      }
      
      public function get btn_SoGoodFacebook() : ButtonSelect
      {
         return visual.getChildByName("btn_SoGoodFacebook") as ButtonSelect;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_SoGoodFacebook.removeEventListener(MouseEvent.MOUSE_DOWN,this.onSoGoodFacebook);
         this.btn_SoGoodLink.removeEventListener(MouseEvent.MOUSE_DOWN,this.onSoGoodLink);
         this.btn_SoGoodTwitter.removeEventListener(MouseEvent.MOUSE_DOWN,this.onSoGoodTwitter);
      }
      
      private function onSoGoodTwitter(event:MouseEvent) : void
      {
         Utils.navigateToURLAndRecord(new URLRequest("https://twitter.com/SogoodOfficial"));
      }
      
      private function onSoGoodFacebook(event:MouseEvent) : void
      {
         Utils.navigateToURLAndRecord(new URLRequest("https://www.facebook.com/SogoodTM"));
      }
   }
}

