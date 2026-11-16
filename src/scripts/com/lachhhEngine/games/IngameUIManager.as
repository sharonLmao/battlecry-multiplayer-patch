package com.lachhhEngine.games
{
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   
   public class IngameUIManager
   {
      
      private var _fxLayer:MovieClip;
      
      private var _UILayer:MovieClip;
      
      private var _tabAnim:Array = new Array();
      
      private var _context:Game;
      
      public function IngameUIManager(context:Game)
      {
         super();
         this._context = context;
         this._fxLayer = new MovieClip();
         this._fxLayer.name = "fxLayer";
         this._UILayer = new MovieClip();
         this._UILayer.name = "UI";
         this._context.addChild(this._fxLayer);
         this._context.addChild(this._UILayer);
      }
      
      public function PlayFx(idAnim:int, x:int, y:int) : Animation
      {
         var anim:Animation = AnimationManager.instance.CreateAnimation(idAnim);
         this._fxLayer.addChild(anim);
         this._context.AddUpdatable(anim);
         anim.AddEndCallback(new Callback(this.DestroyFx,this,[anim]));
         this._tabAnim.push(anim);
         return anim;
      }
      
      public function Destroy() : void
      {
         while(this._tabAnim.length > 0)
         {
            this.DestroyFx(this._tabAnim[0]);
         }
      }
      
      private function DestroyFx(anim:Animation) : void
      {
         this._fxLayer.removeChild(anim);
         this._context.RemoveUpdatable(anim);
         AnimationManager.instance.Destroy(anim);
         Utils.RemoveFromArray(this._tabAnim,anim);
      }
   }
}

