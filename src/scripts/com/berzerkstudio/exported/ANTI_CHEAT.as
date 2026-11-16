package com.berzerkstudio.exported
{
   import com.lachhhEngine.games.animation.Animation;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol262")]
   public dynamic class ANTI_CHEAT extends Animation
   {
      
      public var mc:MovieClip;
      
      public function ANTI_CHEAT()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onClick(param1:MouseEvent) : void
      {
         navigateToURL(new URLRequest("http://www.berzerkstudio.com"),"_blank");
      }
      
      internal function frame1() : *
      {
         mc = this;
         mc.buttonMode = true;
         mc.addEventListener(MouseEvent.MOUSE_DOWN,onClick);
      }
   }
}

