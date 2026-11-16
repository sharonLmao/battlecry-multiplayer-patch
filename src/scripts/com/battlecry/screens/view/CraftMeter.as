package com.battlecry.screens.view
{
   import com.battlecry.io.BC_GameProgress;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   
   public class CraftMeter extends ObjectView
   {
      
      private var _currentCraftPoint:int;
      
      public function CraftMeter(visual:DisplayObjectContainer)
      {
         super(visual);
         this._currentCraftPoint = BC_GameProgress.gameProgess.craftPoint;
      }
      
      public function get crafPointer() : MovieClip
      {
         return visual.getChildByName("crafPointer") as MovieClip;
      }
      
      override public function Update() : void
      {
         var speed:Number = NaN;
         super.Update();
         var toGoPoint:int = BC_GameProgress.gameProgess.craftPoint;
         var diff:int = Math.abs(Math.round(toGoPoint - this._currentCraftPoint));
         if(diff >= 1000)
         {
            speed = 250;
         }
         else if(diff >= 250)
         {
            speed = 50;
         }
         else if(diff >= 50)
         {
            speed = 10;
         }
         else if(diff >= 10)
         {
            speed = 5;
         }
         else
         {
            speed = 0;
         }
         if(speed == 0)
         {
            this._currentCraftPoint = toGoPoint;
         }
         else if(this._currentCraftPoint < toGoPoint)
         {
            this._currentCraftPoint += speed;
         }
         else if(this._currentCraftPoint > toGoPoint)
         {
            this._currentCraftPoint -= speed;
         }
         this.crafPointer.y = 190 - 340 * (this._currentCraftPoint / 10000);
      }
   }
}

