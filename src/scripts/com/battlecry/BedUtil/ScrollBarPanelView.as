package com.battlecry.BedUtil
{
   import com.battlecry.BC_Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import flash.display.MovieClip;
   
   public class ScrollBarPanelView extends ObjectView
   {
      
      private var _animationContainer:Animation = null;
      
      private var _offSetX:Number;
      
      private var _offSetY:Number;
      
      private var _scrollBarView:ScrollBarView;
      
      private var _currentPosX:Number;
      
      private var _isVertical:Boolean;
      
      private var _currentPosY:Number;
      
      private var _backBoosterX:Number;
      
      public function ScrollBarPanelView(visual:MovieClip)
      {
         super(visual);
         this._animationContainer = AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_EMPTY);
         this._scrollBarView = new ScrollBarView(this.viewSquare);
         if(BC_Game.instance.isConnected)
         {
            this._backBoosterX = 330;
         }
         else
         {
            this._backBoosterX = 0;
         }
      }
      
      public function Add(object:ObjectView) : void
      {
         object.visual.x = Math.round(this._currentPosX);
         object.visual.y = Math.round(this._currentPosY);
         if(this._isVertical)
         {
            this._currentPosX += object.visual.width + this._offSetX;
            if(this._currentPosX + object.visual.width > this._scrollBarView.limitSquare.width)
            {
               this._currentPosX = this._offSetX;
               this._currentPosY += object.visual.height + this._offSetY;
            }
         }
         else
         {
            this._currentPosY += object.visual.height + this._offSetY;
            if(this._currentPosY + object.visual.height > this._scrollBarView.limitSquare.height)
            {
               this._currentPosY = 0;
               this._currentPosX += object.visual.width + this._offSetX;
            }
         }
         this._animationContainer.addChild(object.visual);
         this._scrollBarView.SetAnim(this._animationContainer);
      }
      
      public function AddSpacing(spacing:Animation) : void
      {
         spacing.x = this._currentPosX;
         spacing.y = this._currentPosY;
         if(this._isVertical)
         {
            this._currentPosX += spacing.width + this._offSetX;
            if(this._currentPosX + spacing.width > this._scrollBarView.limitSquare.width)
            {
               this._currentPosX = this._offSetX;
               this._currentPosY += spacing.height + this._offSetY;
            }
         }
         else
         {
            this._currentPosY += spacing.height + this._offSetY;
            if(this._currentPosY + spacing.height > this._scrollBarView.limitSquare.height)
            {
               this._currentPosY = 0;
               this._currentPosX += spacing.width + this._offSetX;
            }
         }
         this._animationContainer.addChild(spacing);
         this._scrollBarView.SetAnim(this._animationContainer);
      }
      
      public function get scrollBarView() : ScrollBarView
      {
         return this._scrollBarView;
      }
      
      public function get backBoosterX() : Number
      {
         return this._backBoosterX;
      }
      
      public function set scrollBarView(scrollBarView:ScrollBarView) : void
      {
         this._scrollBarView = scrollBarView;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         if(this._scrollBarView)
         {
            this._scrollBarView.Destroy();
         }
      }
      
      public function Show(mc:MovieClip) : void
      {
         if(!this._animationContainer.contains(mc))
         {
            this._animationContainer.addChild(mc);
            this._scrollBarView.SetAnim(this._animationContainer);
         }
      }
      
      public function Hide(mc:MovieClip) : void
      {
         if(this._animationContainer.contains(mc))
         {
            this._animationContainer.removeChild(mc);
            this._scrollBarView.SetAnim(this._animationContainer);
         }
      }
      
      public function set backBoosterX(backBoosterX:Number) : void
      {
         this._backBoosterX = backBoosterX;
      }
      
      public function Filter() : void
      {
         this._scrollBarView.scrollPrc = 0;
         this._scrollBarView.Refresh();
      }
      
      public function AddBackBooster(backBooster:Animation) : void
      {
         backBooster.x = this._backBoosterX;
         backBooster.y = 0;
         this._animationContainer.addChildAt(backBooster,0);
         this._scrollBarView.SetAnim(this._animationContainer);
         this._backBoosterX += backBooster.width;
      }
      
      override public function Update() : void
      {
         super.Update();
         this._scrollBarView.Update();
      }
      
      public function Init(offSetX:int, offSetY:int, isVertical:Boolean, startXOffset:int = 0, startYOffset:int = 0) : void
      {
         this._offSetX = offSetX;
         this._offSetY = offSetY;
         this._currentPosX = this._offSetX;
         this._currentPosY = 0;
         this._isVertical = isVertical;
         this._scrollBarView.Init(this._offSetX,this._offSetY,isVertical);
         this._scrollBarView.SetAnim(this._animationContainer);
         this._scrollBarView.animToShow.x += startXOffset;
         this._scrollBarView.animToShow.y += startYOffset;
         this._scrollBarView.Refresh();
      }
      
      public function get viewSquare() : MovieClip
      {
         return visual.getChildByName("viewSquare") as MovieClip;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this._scrollBarView.Refresh();
      }
      
      public function removeAll() : void
      {
         var length:int = this._animationContainer.numChildren;
         for(var i:int = 0; i < length; i++)
         {
            if(this._animationContainer.getChildAt(0) is Animation)
            {
               AnimationManager.instance.Destroy(this._animationContainer.getChildAt(0) as Animation);
               this._animationContainer.removeChildAt(0);
            }
         }
         this._currentPosX = this._offSetX;
         this._currentPosY = 0;
         this._scrollBarView.SetAnim(this._animationContainer);
         this._scrollBarView.Refresh();
      }
   }
}

