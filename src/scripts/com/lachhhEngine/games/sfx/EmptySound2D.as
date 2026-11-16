package com.lachhhEngine.games.sfx
{
   import com.lachhhEngine.games.MainGame;
   import flash.media.Sound;
   
   public class EmptySound2D extends Sound2D
   {
      
      public function EmptySound2D(s:Sound)
      {
         super(s);
      }
      
      override public function Update(main:MainGame) : void
      {
      }
      
      override public function Stop() : void
      {
      }
      
      override public function Play(bLoop:Boolean = false) : Boolean
      {
         return false;
      }
      
      override public function SetVolume(n:Number) : void
      {
      }
   }
}

