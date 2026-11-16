package BerzerkVisual_fla
{
   import com.berzerkstudio.exported.FlashPlayerButton;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol158")]
   public dynamic class FlashPlayerNeeded_12 extends MovieClip
   {
      
      public var flash_mc:FlashPlayerButton;
      
      public function FlashPlayerNeeded_12()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onClick(e:MouseEvent) : void
      {
         navigateToURL(new URLRequest("http://get.adobe.com/flashplayer/?promoid=DXLUJ"),"_blank");
      }
      
      internal function frame1() : *
      {
         addEventListener(MouseEvent.CLICK,onClick);
         buttonMode = true;
      }
   }
}

