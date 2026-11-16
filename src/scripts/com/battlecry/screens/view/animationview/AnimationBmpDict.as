package com.battlecry.screens.view.animationview
{
   import com.lachhhEngine.games.animation.Animation;
   import flash.utils.Dictionary;
   
   public class AnimationBmpDict
   {
      
      private static var _dict:Dictionary = new Dictionary();
      
      public function AnimationBmpDict()
      {
         super();
      }
      
      public static function GetAnimationBmp(anim:Animation) : AnimationBmp
      {
         if(_dict[anim.metaAnimation.instanceType] == null)
         {
            _dict[anim.metaAnimation.instanceType] = new AnimationBmp(anim);
         }
         return _dict[anim.metaAnimation.instanceType];
      }
   }
}

