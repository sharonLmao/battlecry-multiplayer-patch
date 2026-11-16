package com.battlecry.effects
{
   import com.lachhhEngine.games.effects.GameEffectFactory;
   
   public class BC_GameEffectFactory extends GameEffectFactory
   {
      
      public static var ID_IDLESPELL:int;
      
      public static var ID_FLOATINGTEXT:int;
      
      public static var ID_PROJECTILE:int;
      
      public function BC_GameEffectFactory()
      {
         super();
      }
      
      override protected function AddGameClass() : void
      {
         super.AddGameClass();
         ID_PROJECTILE = PushClassLink(Projectile);
         ID_IDLESPELL = PushClassLink(IdleSpell);
         ID_FLOATINGTEXT = PushClassLink(FloatingText);
      }
   }
}

