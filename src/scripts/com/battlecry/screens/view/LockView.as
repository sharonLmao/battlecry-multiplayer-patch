package com.battlecry.screens.view
{
   import com.lachhhEngine.games.screens.view.ObjectView;
   import flash.display.MovieClip;
   
   public class LockView extends ObjectView
   {
      
      private var _isLocked:Boolean;
      
      public function LockView(visual:MovieClip)
      {
         super(visual);
         this._isLocked = false;
         visual.visible = false;
      }
      
      public function UnLock() : void
      {
         visual.visible = false;
         this._isLocked = false;
      }
      
      public function isLocked() : Boolean
      {
         return this._isLocked;
      }
      
      public function Lock() : void
      {
         visual.visible = true;
         this._isLocked = true;
      }
   }
}

