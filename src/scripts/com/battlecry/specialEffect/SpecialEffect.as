package com.battlecry.specialEffect
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   
   public class SpecialEffect
   {
      
      public function SpecialEffect()
      {
         super();
      }
      
      public function get context() : BC_Game
      {
         return Main.instance.game as BC_Game;
      }
   }
}

