package com.battlecry.BedUtil
{
   import com.battlecry.Main;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class ScrollBarView extends ObjectView
   {
      
      private var _offSetX:Number;
      
      private var _offSetY:Number;
      
      private var _scrollPrc:Number;
      
      private var _animToShow:Animation = null;
      
      private var _tickSpeed:Number;
      
      private var _isDragging:Boolean;
      
      private var _goingDown:Boolean;
      
      private var _counter:Number;
      
      private const WAIT_TIME:int = 3;
      
      private var _isVertical:Boolean;
      
      private var _dragOffSet:Number;
      
      private var _goingUp:Boolean;
      
      private var _anim:Animation = null;
      
      public function ScrollBarView(visual:MovieClip)
      {
         super(visual);
         this._animToShow = AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_EMPTY);
         this._anim = AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_EMPTY);
         visual.addChild(this._animToShow);
         this._animToShow.addChild(this._anim);
         this._animToShow.scrollRect = new Rectangle(this.limitSquare.x,this.limitSquare.y,this.limitSquare.width,this.limitSquare.height);
         this.btn_up.addEventListener(MouseEvent.MOUSE_DOWN,this.onUp);
         this.btn_down.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.pointer.addEventListener(MouseEvent.MOUSE_DOWN,this.onPointer);
         this.back.addEventListener(MouseEvent.MOUSE_DOWN,this.onBack);
         visual.addEventListener(MouseEvent.MOUSE_WHEEL,this.onWheel);
      }
      
      public function get animToShow() : Animation
      {
         return this._animToShow;
      }
      
      public function get anim() : Animation
      {
         return this._anim;
      }
      
      public function set animToShow(animToShow:Animation) : void
      {
         this._animToShow = animToShow;
      }
      
      public function get scrollPrc() : Number
      {
         return this._scrollPrc;
      }
      
      private function HideUnseen() : void
      {
         var mc:MovieClip = null;
         for(var i:int = 0; i < this._anim.numChildren; i++)
         {
            if(this._anim.getChildAt(i) as MovieClip)
            {
               mc = this._anim.getChildAt(i) as MovieClip;
               mc.visible = false;
               if(this._isVertical)
               {
                  if(mc.y + this._anim.y + mc.height >= -50 && mc.y + this._anim.y <= this.limitSquare.height + 50)
                  {
                     mc.visible = true;
                  }
               }
               else if(mc.x + this._anim.x + mc.width >= -50 && mc.x + this._anim.x <= this.limitSquare.width + 50)
               {
                  mc.visible = true;
               }
            }
         }
      }
      
      private function PointerUp(event:MouseEvent) : void
      {
         visual.stage.removeEventListener(MouseEvent.MOUSE_UP,this.PointerUp);
         this._isDragging = false;
         this._dragOffSet = 0;
         this._goingDown = false;
         this._goingUp = false;
         this._counter = this.WAIT_TIME;
      }
      
      private function onDown(event:MouseEvent) : void
      {
         if(!this.isScrollable())
         {
            return;
         }
         visual.stage.addEventListener(MouseEvent.MOUSE_UP,this.PointerUp);
         this._goingDown = true;
      }
      
      public function set anim(anim:Animation) : void
      {
         this._anim = anim;
      }
      
      public function get btn_down() : ButtonSelect
      {
         return visual.getChildByName("btn_down") as ButtonSelect;
      }
      
      public function set scrollPrc(scrollPrc:Number) : void
      {
         this._scrollPrc = scrollPrc;
      }
      
      public function Init(offSetX:Number, offSetY:Number, isVertical:Boolean) : void
      {
         this._isVertical = isVertical;
         this._offSetX = offSetX;
         this._offSetY = offSetY;
         this._scrollPrc = 0;
         this._isDragging = false;
         this._goingUp = false;
         this._goingDown = false;
         this._counter = this.WAIT_TIME;
         this._tickSpeed = 0;
         this._isVertical = isVertical;
         this._dragOffSet = 0;
         this.Refresh();
      }
      
      public function get limitSquare() : MovieClip
      {
         return visual.getChildByName("limitSquare") as MovieClip;
      }
      
      override public function Refresh() : void
      {
         var p:Number = NaN;
         var fullLength:Number = NaN;
         super.Refresh();
         if(this._anim.height <= 0 || this._anim.width <= 0 || this._anim.numChildren == 0)
         {
            this.pointer.scaleY = 1;
            this._scrollPrc = 0;
            if(this._isVertical)
            {
               this.pointer.y = this.back.y;
            }
            else
            {
               this.pointer.x = this.back.x;
            }
            return;
         }
         this._animToShow.addChild(this._anim);
         if(this._isVertical)
         {
            if(this._anim.height <= this.limitSquare.height - this._offSetY)
            {
               this.pointer.scaleY = 1;
            }
            else
            {
               p = this._anim.height - (this.limitSquare.height - this._offSetY);
               p /= this._anim.getChildAt(0).height;
               this.pointer.scaleY = 1 / (p + 1);
               if(this.pointer.scaleY <= 0.2)
               {
                  this.pointer.scaleY = 0.2;
               }
            }
            fullLength = this.pointer.height * 100 / (this.pointer.scaleY * 100);
            this._anim.y = (this._anim.height - this.limitSquare.height + this._offSetY) * this._scrollPrc * -1;
            this.pointer.y = (fullLength - this.pointer.height) * this._scrollPrc + this.back.y;
            this._tickSpeed = this._anim.getChildAt(0).height / this._anim.height;
         }
         else
         {
            if(this._anim.width <= this.limitSquare.width - this._offSetX)
            {
               this.pointer.scaleY = 1;
            }
            else
            {
               p = this._anim.width - (this.limitSquare.width - this._offSetX);
               p /= this._anim.getChildAt(0).width;
               this.pointer.scaleX = 1 / (p + 1);
               if(this.pointer.scaleX <= 0.2)
               {
                  this.pointer.scaleX = 0.2;
               }
            }
            fullLength = this.pointer.width * 100 / (this.pointer.scaleX * 100);
            this._anim.x = (this._anim.width - this.limitSquare.width + this._offSetX) * this._scrollPrc * -1;
            this.pointer.x = (fullLength - this.pointer.width) * this._scrollPrc + this.back.x;
            this._tickSpeed = this._anim.getChildAt(0).width / this._anim.width;
         }
         this.HideUnseen();
      }
      
      private function onWheel(event:MouseEvent) : void
      {
         if(!this.isScrollable())
         {
            return;
         }
         this._scrollPrc += event.delta / 100 * -1;
         if(this._scrollPrc >= 1)
         {
            this._scrollPrc = 1;
         }
         else if(this._scrollPrc <= 0)
         {
            this._scrollPrc = 0;
         }
         this.Refresh();
      }
      
      public function get pointer() : MovieClip
      {
         return visual.getChildByName("Pointer") as MovieClip;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         while(this._anim.numChildren > 0)
         {
            if(this._anim.getChildAt(0) is Animation)
            {
               AnimationManager.instance.Destroy(this._anim.getChildAt(0) as Animation);
               this._anim.removeChildAt(0);
            }
         }
         if(this._anim)
         {
            Utils.LazyRemoveFromParent(this._anim);
            AnimationManager.instance.Destroy(this._anim);
         }
         while(this._animToShow.numChildren > 0)
         {
            if(this._animToShow.getChildAt(0) is Animation)
            {
               AnimationManager.instance.Destroy(this._animToShow.getChildAt(0) as Animation);
               this._animToShow.removeChildAt(0);
            }
         }
         if(this._animToShow)
         {
            Utils.LazyRemoveFromParent(this._animToShow);
            AnimationManager.instance.Destroy(this._animToShow);
         }
         this._anim = null;
         this._animToShow.scrollRect = null;
         this._animToShow = null;
         this.btn_up.removeEventListener(MouseEvent.MOUSE_DOWN,this.onUp);
         this.btn_down.removeEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.pointer.removeEventListener(MouseEvent.MOUSE_DOWN,this.onPointer);
         this.back.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBack);
         visual.removeEventListener(MouseEvent.MOUSE_WHEEL,this.onWheel);
      }
      
      private function onPointer(event:MouseEvent) : void
      {
         if(!this.isScrollable())
         {
            return;
         }
         visual.stage.addEventListener(MouseEvent.MOUSE_UP,this.PointerUp);
         this._isDragging = true;
         if(this._isVertical)
         {
            this._dragOffSet = this.back.mouseY - (this.pointer.y - this.back.y);
         }
         else
         {
            this._dragOffSet = this.back.mouseX - (this.pointer.x - this.back.x);
         }
      }
      
      private function onUp(event:MouseEvent) : void
      {
         if(!this.isScrollable())
         {
            return;
         }
         visual.stage.addEventListener(MouseEvent.MOUSE_UP,this.PointerUp);
         this._goingUp = true;
      }
      
      public function get btn_up() : ButtonSelect
      {
         return visual.getChildByName("btn_up") as ButtonSelect;
      }
      
      public function get back() : MovieClip
      {
         return visual.getChildByName("back") as MovieClip;
      }
      
      override public function Update() : void
      {
         if(!this._anim)
         {
         }
         super.Update();
         var fullLength:Number = 0;
         if(this._goingDown)
         {
            this._counter += Main.instance.game.speedManager.GetSpeed();
            if(this._counter >= this.WAIT_TIME)
            {
               if(this._scrollPrc < 1)
               {
                  if(this._scrollPrc >= 1 - this._tickSpeed)
                  {
                     this._scrollPrc = 1;
                  }
                  else
                  {
                     this._scrollPrc += this._tickSpeed;
                  }
               }
               this._counter = 0;
               this.Refresh();
            }
         }
         if(this._goingUp)
         {
            this._counter += Main.instance.game.speedManager.GetSpeed();
            if(this._counter >= this.WAIT_TIME)
            {
               if(this._scrollPrc > 0)
               {
                  if(this._scrollPrc <= 0 + this._tickSpeed)
                  {
                     this._scrollPrc = 0;
                  }
                  else
                  {
                     this._scrollPrc -= this._tickSpeed;
                  }
               }
               this._counter = 0;
               this.Refresh();
            }
         }
         if(this._isDragging)
         {
            if(this._isVertical)
            {
               fullLength = this.pointer.height * 100 / (this.pointer.scaleY * 100);
               fullLength -= this.pointer.height;
               this.pointer.y = this.back.mouseY - this._dragOffSet;
               if(this.pointer.y < 0)
               {
                  this.pointer.y = 0;
               }
               else if(this.pointer.y > fullLength)
               {
                  this.pointer.y = fullLength;
               }
               this._scrollPrc = this.pointer.y / fullLength;
            }
            else
            {
               fullLength = this.pointer.width * 100 / (this.pointer.scaleX * 100);
               fullLength -= this.pointer.width;
               this.pointer.x = this.back.mouseX - this._dragOffSet;
               if(this.pointer.x < 0)
               {
                  this.pointer.x = 0;
               }
               else if(this.pointer.x > fullLength)
               {
                  this.pointer.x = fullLength;
               }
               this._scrollPrc = this.pointer.x / fullLength;
            }
            this.Refresh();
         }
      }
      
      private function onBack(event:MouseEvent) : void
      {
         if(!this.isScrollable())
         {
            return;
         }
         var fullLength:Number = 0;
         if(this._isVertical)
         {
            fullLength = this.pointer.height * 100 / (this.pointer.scaleY * 100);
            fullLength -= this.pointer.height;
            this._scrollPrc = (this.back.mouseY - this.pointer.height / 2) / fullLength;
            if(this._scrollPrc <= 0)
            {
               this._scrollPrc = 0;
            }
            else if(this._scrollPrc >= 1)
            {
               this._scrollPrc = 1;
            }
         }
         else
         {
            fullLength = this.pointer.width * 100 / (this.pointer.scaleX * 100);
            fullLength -= this.pointer.width;
            this._scrollPrc = (this.back.mouseX - this.pointer.width / 2) / fullLength;
            if(this._scrollPrc <= 0)
            {
               this._scrollPrc = 0;
            }
            else if(this._scrollPrc >= 1)
            {
               this._scrollPrc = 1;
            }
         }
         this.Refresh();
      }
      
      private function isScrollable() : Boolean
      {
         if(this._isVertical)
         {
            if(this._anim.height <= this._animToShow.height - this._offSetY)
            {
               return false;
            }
         }
         else if(this._anim.width <= this._animToShow.width - this._offSetX)
         {
            return false;
         }
         return true;
      }
      
      public function SetAnim(anim:Animation) : void
      {
         this._anim = anim;
         if(this._isVertical)
         {
            if(this._anim.height <= this.limitSquare.height)
            {
               this.btn_down.visible = false;
               this.btn_up.visible = false;
               this.back.visible = false;
               this.pointer.visible = false;
            }
            else
            {
               this.btn_down.visible = true;
               this.btn_up.visible = true;
               this.back.visible = true;
               this.pointer.visible = true;
            }
         }
         else if(this._anim.width <= this.limitSquare.width)
         {
            this.btn_down.visible = false;
            this.btn_up.visible = false;
            this.back.visible = false;
            this.pointer.visible = false;
         }
         else
         {
            this.btn_down.visible = true;
            this.btn_up.visible = true;
            this.back.visible = true;
            this.pointer.visible = true;
         }
         this._scrollPrc = 0;
      }
   }
}

