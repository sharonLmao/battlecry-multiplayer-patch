package com.battlecry.exported
{
   import com.lachhhEngine.games.animation.Animation;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4442")]
   public dynamic class SCROLLBARSPACING extends Animation
   {
      
      public function SCROLLBARSPACING()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         visible = false;
      }
   }
}

