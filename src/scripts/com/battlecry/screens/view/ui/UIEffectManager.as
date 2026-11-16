package com.battlecry.screens.view.ui
{
   public class UIEffectManager
   {
      
      private static var _effects:Array = new Array();
      
      private static var _effectsToRemove:Array = new Array();
      
      public function UIEffectManager()
      {
         super();
      }
      
      public static function Update() : void
      {
         var crntEffect:UIEffect = null;
         for(var i:int = 0; i < _effects.length; i++)
         {
            crntEffect = _effects[i];
            if(crntEffect.enabled)
            {
               crntEffect.Update();
            }
         }
         while(_effectsToRemove.length > 0)
         {
            RemoveEffectImmediate(_effectsToRemove.shift());
         }
      }
      
      public static function AddEffect(effect:UIEffect) : void
      {
         _effects.push(effect);
      }
      
      public static function RemoveEffect(effect:UIEffect) : void
      {
         _effectsToRemove.push(effect);
      }
      
      public static function RemoveEffectImmediate(effect:UIEffect) : void
      {
         for(var i:int = 0; i < _effects.length; i++)
         {
            if(_effects[i] == effect)
            {
               _effects.splice(i,1);
               return;
            }
         }
      }
      
      public static function length() : int
      {
         return _effects.length;
      }
   }
}

