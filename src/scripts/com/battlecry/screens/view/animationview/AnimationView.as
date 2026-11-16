package com.battlecry.screens.view.animationview
{
   import com.battlecry.BC_Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.draw.CopypixelableBmpData;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.utils.Utils;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.utils.Dictionary;
   
   public class AnimationView extends ObjectView
   {
      
      private var _dictVectorChild:Dictionary;
      
      private var _animId:int;
      
      private var _dictBmpChild:Dictionary;
      
      private var _anim:Animation;
      
      private var _isVector:Boolean;
      
      private var _animBmp:AnimationBmp;
      
      public function AnimationView(visual:MovieClip)
      {
         super(visual);
         this._isVector = true;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.DestroyAnimation();
      }
      
      public function SetAnim(idAnim:int) : void
      {
         if(idAnim == this._animId)
         {
            return;
         }
         this.DestroyAnimation();
         this._animId = idAnim;
         this._anim = AnimationManager.instance.CreateAnimation(idAnim);
         visual.addChild(this._anim);
      }
      
      override public function Update() : void
      {
         super.Update();
         if(this._anim)
         {
            this._anim.Update(BC_Game.instance);
         }
      }
      
      protected function DestroyAnimation() : void
      {
         if(this._anim != null)
         {
            this.ToVector();
            Utils.LazyRemoveFromParent(this._anim);
            AnimationManager.instance.Destroy(this._anim);
            this._anim = null;
            this._animId = -1;
         }
      }
      
      public function get anim() : Animation
      {
         return this._anim;
      }
      
      public function ToBmp() : void
      {
         var d:DisplayObject = null;
         var dc:DisplayObjectContainer = null;
         var vAllChild:Vector.<DisplayObject> = null;
         var childBmpCopy:CopypixelableBmpData = null;
         var childBmp:Bitmap = null;
         var child:DisplayObject = null;
         if(!this._isVector)
         {
            return;
         }
         if(!this._anim)
         {
            return;
         }
         this._isVector = false;
         this._dictVectorChild = new Dictionary();
         this._dictBmpChild = new Dictionary();
         this._animBmp = AnimationBmpDict.GetAnimationBmp(this.anim);
         for(var i:int = 0; i < this.anim.numChildren; i++)
         {
            d = this.anim.getChildAt(i);
            dc = d as DisplayObjectContainer;
            if(!dc)
            {
               d.visible = false;
            }
            else if(dc.name.indexOf("instance") == -1)
            {
               vAllChild = new Vector.<DisplayObject>();
               while(dc.numChildren > 0)
               {
                  child = dc.getChildAt(0);
                  vAllChild.push(child);
                  dc.removeChild(child);
               }
               childBmpCopy = this._animBmp.GetCopyChild(dc.name);
               childBmp = new Bitmap(childBmpCopy.bmpData);
               childBmp.x = childBmpCopy.x;
               childBmp.y = childBmpCopy.y;
               dc.addChild(childBmp);
               this._dictVectorChild[dc.name] = vAllChild;
               this._dictBmpChild[dc.name] = childBmp;
            }
            else
            {
               dc.visible = false;
            }
         }
         var animBmpCopy:CopypixelableBmpData = this._animBmp.copyBmp;
         var animBmp:Bitmap = new Bitmap(animBmpCopy.bmpData);
         animBmp.x = animBmpCopy.x;
         animBmp.y = animBmpCopy.y;
         this.anim.addChildAt(animBmp,0);
         this._dictBmpChild["this"] = animBmp;
      }
      
      public function get animId() : int
      {
         return this._animId;
      }
      
      public function ToVector() : void
      {
         var d:DisplayObject = null;
         var dc:DisplayObjectContainer = null;
         var vAllChild:Vector.<DisplayObject> = null;
         var childBmp:Bitmap = null;
         var child:DisplayObject = null;
         if(this._isVector)
         {
            return;
         }
         if(!this._anim)
         {
            return;
         }
         this._isVector = true;
         for(var i:int = 0; i < this.anim.numChildren; i++)
         {
            d = this.anim.getChildAt(i);
            dc = d as DisplayObjectContainer;
            if(!dc)
            {
               d.visible = true;
            }
            else if(dc.name.indexOf("instance") == -1)
            {
               vAllChild = this._dictVectorChild[dc.name] as Vector.<DisplayObject>;
               childBmp = this._dictBmpChild[dc.name] as Bitmap;
               dc.removeChild(childBmp);
               childBmp = null;
               this._dictBmpChild[dc.name] = null;
               while(vAllChild.length > 0)
               {
                  child = vAllChild.shift();
                  dc.addChild(child);
               }
            }
            else
            {
               dc.visible = true;
            }
         }
         var animBmp:Bitmap = this._dictBmpChild["this"];
         this.anim.removeChild(animBmp);
         this._dictBmpChild["this"] = null;
         this._animBmp = null;
      }
   }
}

