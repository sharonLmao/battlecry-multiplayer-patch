package com.lachhhEngine.games.screens
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.AnimationCallback;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.io.Callback;
   import flash.display.MovieClip;
   
   public class OpenCloseScreen extends Screen
   {
      
      private var _openCallback:Callback;
      
      private var _context:Game;
      
      private var _removeOnClose:Boolean;
      
      private var _closeCallback:Callback;
      
      public function OpenCloseScreen()
      {
         super();
      }
      
      protected function get panel() : MovieClip
      {
         return MovieClip(visual.getChildByName("panel"));
      }
      
      public function set openCallback(openCallback:Callback) : void
      {
         this._openCallback = openCallback;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         animation.Update(context.game);
      }
      
      public function Open(c:Callback = null) : void
      {
         this._openCallback = c;
         animation.gotoAndPlay(this.openFrame);
         animation.SetCurrentFrame(this.openFrame);
         animation.isPlayingAnim = true;
         animation.AddCallbackAt(new AnimationCallback(this.idleFrame,this.Idle,this,null));
         state = STATE_OPENING;
      }
      
      protected function get closeFrame() : int
      {
         return 31;
      }
      
      public function get openCallback() : Callback
      {
         return this._openCallback;
      }
      
      protected function get openFrame() : int
      {
         return 1;
      }
      
      public function Idle() : void
      {
         visual.gotoAndStop(this.idleFrame);
         animation.isPlayingAnim = false;
         state = STATE_IDLE;
         if(this._openCallback != null)
         {
            this._openCallback.DoCallback();
            this._openCallback = null;
         }
      }
      
      protected function EndCloseAnim() : void
      {
         visual.stop();
         animation.AddEndCallback(new Callback(this.EndCloseAnim,this,null));
         animation.isPlayingAnim = false;
         state = STATE_NULL;
         if(this._removeOnClose)
         {
            ScreenManager.instance.RemoveScreen(this);
         }
         if(this._closeCallback != null)
         {
            this._closeCallback.DoCallback();
            this._closeCallback = null;
         }
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         animation.AddCallbackAt(new AnimationCallback(this.idleFrame,this.Idle,this,null));
         animation.AddEndCallback(new Callback(this.EndCloseAnim,this,null));
         state = STATE_OPENING;
         this._closeCallback = null;
         this._removeOnClose = false;
         this._context = context;
      }
      
      public function Close(remove:Boolean, c:Callback, quickClose:Boolean) : void
      {
         this._closeCallback = c;
         if(state == STATE_NULL && remove)
         {
            ScreenManager.instance.RemoveScreen(this);
            return;
         }
         if(remove)
         {
            RemoveListeners();
         }
         if(state == STATE_CLOSING)
         {
            return;
         }
         if(!quickClose)
         {
            visual.gotoAndPlay(this.closeFrame);
            animation.SetCurrentFrame(this.closeFrame);
         }
         else
         {
            visual.gotoAndPlay(animation.totalFrames);
            animation.SetCurrentFrame(animation.totalFrames);
         }
         animation.isPlayingAnim = true;
         state = STATE_CLOSING;
         this._removeOnClose = remove;
      }
      
      protected function get idleFrame() : int
      {
         return 16;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
      }
   }
}

