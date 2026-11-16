package com.battlecry.screens.view.ui
{
   import flash.display.DisplayObject;
   
   public class UIEffect
   {
      
      private var _destroyed:Boolean;
      
      private var _visual:DisplayObject;
      
      public function UIEffect(visual:DisplayObject)
      {
         super();
         this._visual = visual;
         this._destroyed = false;
         UIEffectManager.AddEffect(this);
      }
      
      public function get visual() : DisplayObject
      {
         return this._visual;
      }
      
      public function Destroy() : void
      {
         UIEffectManager.RemoveEffect(this);
         this.onDestroy();
         this._visual = null;
         this._destroyed = true;
      }
      
      public function get enabled() : Boolean
      {
         return !this._destroyed;
      }
      
      public function get destroyed() : Boolean
      {
         return this._destroyed;
      }
      
      public function Update() : void
      {
      }
      
      protected function onDestroy() : void
      {
      }
   }
}

