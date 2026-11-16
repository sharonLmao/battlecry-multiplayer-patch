package com.berzerkstudio.exported
{
   import com.lachhhEngine.games.animation.Animation;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol252")]
   public dynamic class BERZERK_HINT_FF3 extends Animation
   {
      
      public function BERZERK_HINT_FF3()
      {
         super();
         addFrameScript(9,frame10,20,frame21);
      }
      
      internal function frame21() : *
      {
         stop();
      }
      
      internal function frame10() : *
      {
         stop();
      }
   }
}

