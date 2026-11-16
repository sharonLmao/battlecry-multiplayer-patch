package com.lachhhEngine.games.animation
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.IUpdatable;
   import com.lachhhEngine.games.draw.DrawManager;
   import com.lachhhEngine.games.draw.ICopyPixelable;
   import com.lachhhEngine.games.meta.metaObject.MetaAnimation;
   import com.lachhhEngine.interfaces.forms.Button;
   import com.lachhhEngine.io.Callback;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   
   public class Animation extends MovieClip implements IUpdatable
   {
      
      private var _metaAnimation:MetaAnimation;
      
      private var _enabled:Boolean = true;
      
      private var _looping:Boolean = true;
      
      private var _animationAssetGroups:Vector.<AnimationAssetGroup>;
      
      private var _isPlaying:Boolean;
      
      private var _playChildren:Boolean = true;
      
      private var _speed:Number = 1;
      
      private var _callbacks:Vector.<AnimationCallback>;
      
      private var _triggerEndCallbackOnDestroy:Boolean;
      
      private var _canBeDrawn:Boolean;
      
      private var _frame:Number = 1;
      
      private var _endCallBacks:Vector.<Callback>;
      
      private var _canBeCached:Boolean = true;
      
      public function Animation()
      {
         super();
         this._callbacks = new Vector.<AnimationCallback>();
         this._endCallBacks = new Vector.<Callback>();
         this._animationAssetGroups = new Vector.<AnimationAssetGroup>();
      }
      
      public function recurPlay(mc:MovieClip) : void
      {
         var d:DisplayObject = null;
         var m:MovieClip = null;
         for(var i:int = 0; i < mc.numChildren; i++)
         {
            d = mc.getChildAt(i);
            if(d is MovieClip && !(d is Button) && !(d is AnimationAsset))
            {
               m = d as MovieClip;
               this.recurPlay(m);
               m.gotoAndPlay(1);
            }
         }
      }
      
      public function set metaAnimation(metaAnimation:MetaAnimation) : void
      {
         this._metaAnimation = metaAnimation;
      }
      
      public function RemoveCallback(a:AnimationCallback) : void
      {
         var c:AnimationCallback = null;
         for(var i:int = 0; i < this._callbacks.length; i++)
         {
            c = this._callbacks[i];
            if(c == a)
            {
               this._callbacks.splice(i,1);
               return;
            }
         }
      }
      
      public function get metaAnimation() : MetaAnimation
      {
         return this._metaAnimation;
      }
      
      public function get triggerEndCallbackOnDestroy() : Boolean
      {
         return this._triggerEndCallbackOnDestroy;
      }
      
      public function set speed(speed:Number) : void
      {
         this._speed = speed;
      }
      
      public function RemoveAnimationAsset(a:AnimationAsset) : void
      {
         var group:AnimationAssetGroup = this.GetAnimAssetGroup(a.groupId);
         group.RemoveAnimationAsset(a);
      }
      
      public function AddAnimationAssetGroup2(group:AnimationAssetGroup, autoReplace:Boolean = true) : AnimationAssetGroup
      {
         var i:int = 0;
         var myGroup:AnimationAssetGroup = this.GetAnimAssetGroup(group.groupId);
         if(myGroup != null)
         {
            if(!autoReplace)
            {
               throw new Error("Group already exist");
            }
            for(i = 0; i < this._animationAssetGroups.length; i++)
            {
               if(this._animationAssetGroups[i] == myGroup)
               {
                  this._animationAssetGroups.splice(i,1);
                  break;
               }
            }
         }
         this._animationAssetGroups.push(group);
         return group;
      }
      
      public function OnAdd(context:Game) : void
      {
      }
      
      private function CheckCallBacks(pBefore:int, pAfter:int) : void
      {
         var c:AnimationCallback = null;
         if(pBefore == pAfter)
         {
            return;
         }
         for(var i:int = 0; i < this._callbacks.length; i++)
         {
            c = this._callbacks[i];
            if(c.frame != -1)
            {
               if(pAfter >= c.frame && pBefore < c.frame)
               {
                  c.DoCallback();
                  if(!c.repeat)
                  {
                     this._callbacks.splice(i,1);
                     i--;
                  }
               }
            }
            else if(pAfter < pBefore)
            {
               c.DoCallback();
               if(!c.repeat)
               {
                  this._callbacks.splice(i,1);
                  i--;
               }
            }
         }
      }
      
      private function recurGotoAndStop(mc:MovieClip) : void
      {
         var d:DisplayObject = null;
         var m:MovieClip = null;
         for(var i:int = 0; i < mc.numChildren; i++)
         {
            d = mc.getChildAt(i);
            if(d is MovieClip && !(d is Button) && !(d is AnimationAsset))
            {
               m = d as MovieClip;
               this.recurGotoAndStop(m);
               if(m.currentFrame >= m.totalFrames)
               {
                  m.gotoAndStop(1);
               }
               else
               {
                  m.gotoAndStop(m.currentFrame + 1);
               }
            }
         }
      }
      
      public function set isPlayingAnim(isPlaying:Boolean) : void
      {
         this._isPlaying = isPlaying;
      }
      
      public function AddAnimationAsset(a:AnimationAsset) : void
      {
         var group:AnimationAssetGroup = this.GetAnimAssetGroup(a.groupId);
         group.AddAnimationAsset(a);
      }
      
      public function IsEnabled() : Boolean
      {
         return this._enabled;
      }
      
      public function Init(metaAnim:MetaAnimation) : void
      {
         this._metaAnimation = metaAnim;
         this._frame = 1;
         this._isPlaying = true;
         this._looping = true;
         this._canBeDrawn = true;
         this._speed = 1;
         this._triggerEndCallbackOnDestroy = false;
      }
      
      public function SetFrameOfAssets(frame:int, groupId:int) : void
      {
         var animGroup:AnimationAssetGroup = this.GetAnimAssetGroup(groupId);
         animGroup.frame = frame;
      }
      
      public function set playChildren(playChildren:Boolean) : void
      {
         this._playChildren = playChildren;
      }
      
      public function GetAnimAssetGroup(groupId:int) : AnimationAssetGroup
      {
         var animAssetGroups:AnimationAssetGroup = null;
         if(this._animationAssetGroups == null)
         {
            this._animationAssetGroups = new Vector.<AnimationAssetGroup>();
         }
         for(var i:int = 0; i < this._animationAssetGroups.length; i++)
         {
            animAssetGroups = this._animationAssetGroups[i];
            if(animAssetGroups.groupId == groupId)
            {
               return animAssetGroups;
            }
         }
         return null;
      }
      
      public function get canBeDrawn() : Boolean
      {
         return this._canBeDrawn;
      }
      
      public function AddCallbackAt(animationCallBack:AnimationCallback) : void
      {
         this._callbacks.push(animationCallBack);
      }
      
      public function get canBeCached() : Boolean
      {
         return this._canBeCached;
      }
      
      public function RemoveAllChild() : void
      {
         var child:DisplayObject = null;
         while(numChildren > 0)
         {
            child = getChildAt(0);
            removeChild(child);
         }
      }
      
      public function ReplaceAnim(anim:Animation, oldAnim:Animation) : void
      {
         var index:int = 0;
         if(oldAnim != null)
         {
            index = getChildIndex(oldAnim);
            removeChild(oldAnim);
            addChildAt(anim,index);
         }
         else
         {
            addChild(anim);
         }
      }
      
      public function get speed() : Number
      {
         return this._speed;
      }
      
      public function SetAssetsVisible(visible:Boolean, groupId:int) : void
      {
         var animGroup:AnimationAssetGroup = this.GetAnimAssetGroup(groupId);
         animGroup.visible = visible;
      }
      
      public function GetCurrentFrame() : Number
      {
         return Math.min(Math.max(1,this._frame),totalFrames);
      }
      
      public function AddAnimationAssetGroup(name:String, groupId:int) : AnimationAssetGroup
      {
         if(this.GetAnimAssetGroup(groupId) != null)
         {
            return this.GetAnimAssetGroup(groupId);
         }
         var group:AnimationAssetGroup = new AnimationAssetGroup(name,groupId);
         this._animationAssetGroups.push(group);
         return group;
      }
      
      public function get playChildren() : Boolean
      {
         return this._playChildren;
      }
      
      public function get isPlayingAnim() : Boolean
      {
         return this._isPlaying;
      }
      
      public function Destroy() : void
      {
         var c:Callback = null;
         var animAssetGroup:AnimationAssetGroup = null;
         while(this._callbacks.length > 0)
         {
            this._callbacks.shift();
         }
         if(this._triggerEndCallbackOnDestroy)
         {
            if(this._endCallBacks.length > 0)
            {
               c = this._endCallBacks.shift();
               c.DoCallback();
            }
         }
         else
         {
            while(this._endCallBacks.length > 0)
            {
               this._endCallBacks.shift();
            }
         }
         this.recurStop(this);
         gotoAndStop(1);
         stop();
         this._frame = 1;
         transform.matrix = new Matrix();
         transform.colorTransform = new ColorTransform();
         filters = [];
         graphics.clear();
         mouseChildren = true;
         mouseEnabled = true;
         buttonMode = false;
         visible = true;
         alpha = 1;
         while(this._animationAssetGroups.length > 0)
         {
            animAssetGroup = this._animationAssetGroups.shift();
            animAssetGroup.Destroy();
         }
      }
      
      public function SetCurrentFrame(n:int) : void
      {
         this._frame = n;
         gotoAndStop(this._frame);
      }
      
      public function recurStop(mc:MovieClip) : void
      {
         var d:DisplayObject = null;
         var m:MovieClip = null;
         for(var i:int = 0; i < mc.numChildren; i++)
         {
            d = mc.getChildAt(i);
            if(d is MovieClip)
            {
               m = d as MovieClip;
               this.recurStop(m);
               m.gotoAndStop(1);
            }
         }
      }
      
      public function set triggerEndCallbackOnDestroy(triggerEndCallbackOnDEstroy:Boolean) : void
      {
         this._triggerEndCallbackOnDestroy = triggerEndCallbackOnDEstroy;
      }
      
      public function get looping() : Boolean
      {
         return this._looping;
      }
      
      public function OnRemove(context:Game) : void
      {
      }
      
      public function SetEnable(b:Boolean) : void
      {
         this._enabled = b;
      }
      
      public function Update(context:Game) : void
      {
         var frameAfter:int = 0;
         var c:Callback = null;
         if(!this._isPlaying)
         {
            return;
         }
         var frameBefore:int = Math.floor(this._frame);
         this._frame += context.speedManager.GetFrameSpeed() * this._speed;
         if(Math.floor(this._frame) > totalFrames)
         {
            if(this._endCallBacks.length > 0)
            {
               c = this._endCallBacks.shift();
               c.DoCallback();
            }
            if(this._looping)
            {
               while(this._frame > totalFrames)
               {
                  this._frame -= totalFrames;
               }
            }
         }
         frameAfter = Math.floor(this._frame);
         this.CheckCallBacks(frameBefore,frameAfter);
         if(this._looping || frameAfter < totalFrames)
         {
            gotoAndStop(frameAfter);
         }
         else
         {
            gotoAndStop(totalFrames);
         }
         if(this._playChildren && frameBefore != frameAfter)
         {
            this.recurGotoAndStop(this);
         }
      }
      
      private function RecurDraw(mc:DisplayObjectContainer, drawManager:DrawManager) : void
      {
         var d:DisplayObject = null;
         var m:DisplayObjectContainer = null;
         for(var i:int = 0; i < mc.numChildren; i++)
         {
            d = mc.getChildAt(i);
            if(d is ICopyPixelable)
            {
               drawManager.DrawBatch(ICopyPixelable(d));
            }
            else if(!(d is Animation && !Animation(d).canBeDrawn))
            {
               if(d is DisplayObjectContainer)
               {
                  m = DisplayObjectContainer(d);
                  this.RecurDraw(m,drawManager);
               }
            }
         }
      }
      
      public function Draw(drawManager:DrawManager) : void
      {
         this.RecurDraw(this,drawManager);
      }
      
      public function set canBeDrawn(canBeDrawn:Boolean) : void
      {
         this._canBeDrawn = canBeDrawn;
      }
      
      public function set canBeCached(canBeCached:Boolean) : void
      {
         this._canBeCached = canBeCached;
      }
      
      public function set looping(looping:Boolean) : void
      {
         this._looping = looping;
      }
      
      public function AddEndCallback(callback:Callback) : void
      {
         this._endCallBacks.push(callback);
      }
   }
}

