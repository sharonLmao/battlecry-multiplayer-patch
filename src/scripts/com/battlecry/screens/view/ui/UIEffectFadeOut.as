package com.battlecry.screens.view.ui
{
   import com.battlecry.BC_Game;
   import com.lachhhEngine.utils.Utils;
   import flash.display.DisplayObject;
   
   public class UIEffectFadeOut extends UIEffect
   {
      
      private var _fadeOutTimeStart:Number = 0;
      
      public var color:int = 16777215;
      
      private var _g:Number = 0;
      
      private var _b:Number = 0;
      
      private var _prct:Number = 1;
      
      private var _r:Number = 0;
      
      public var fadeOutTime:Number = 60;
      
      public function UIEffectFadeOut(visual:DisplayObject, pFadeOutTime:int, color1:int)
      {
         super(visual);
         this.fadeOutTime = this._fadeOutTimeStart = pFadeOutTime;
         this._prct = 1;
         this.color = color1;
         this._r = (this.color >> 16 & 0xFF) + 0;
         this._g = (this.color >> 8 & 0xFF) + 0;
         this._b = (this.color >> 0 & 0xFF) + 0;
         Utils.SetColor(visual,this._r * this._prct,this._g * this._prct,this._b * this._prct);
      }
      
      public static function Create(visual:DisplayObject, fadeOutTime:int, color:uint) : UIEffectFadeOut
      {
         if(fadeOutTime <= 0)
         {
            throw new Error("FadeoutTime Cannot be negative");
         }
         return new UIEffectFadeOut(visual,fadeOutTime,color);
      }
      
      override public function Update() : void
      {
         super.Update();
         this.fadeOutTime -= BC_Game.instance.speedManager.GetSpeed();
         this._prct = this.fadeOutTime / this._fadeOutTimeStart;
         Utils.SetColor(visual,this._r * this._prct,this._g * this._prct,this._b * this._prct);
         this.fadeOutTime -= BC_Game.instance.speedManager.GetSpeed();
         if(this.fadeOutTime <= 0)
         {
            Destroy();
         }
      }
      
      override protected function onDestroy() : void
      {
         super.onDestroy();
         Utils.SetColor(visual);
      }
   }
}

