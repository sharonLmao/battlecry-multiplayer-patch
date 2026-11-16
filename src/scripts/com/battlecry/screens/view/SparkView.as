package com.battlecry.screens.view
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.screens.view.animationview.AnimationView;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import flash.display.DisplayObjectContainer;
   
   public class SparkView extends ObjectView
   {
      
      private var _spinSpd:Number;
      
      private var _lifeTime:Number;
      
      private var _forceY:Number;
      
      private var _multVit:Number;
      
      private var _forceX:Number;
      
      private var _animView:AnimationView;
      
      private var _destroy:Boolean;
      
      public function SparkView(visual:DisplayObjectContainer, posX:Number, posY:Number)
      {
         super(visual);
         this._multVit = 8;
         this._animView = new AnimationView(visualMc);
         this._animView.SetAnim(BC_AnimationFactory.ID_FX_SPARK);
         this._animView.anim.x = posX;
         this._animView.anim.y = posY;
         this._destroy = false;
         this._animView.anim.scaleX = this._animView.anim.scaleY = 0.5 + Math.random() * 0.5;
         this._lifeTime = 25;
         this._spinSpd = Math.random() * 25;
         var r:Number = Math.random();
         if(r <= 0.5)
         {
            this._spinSpd *= -1;
         }
         this._forceX = -5 + Math.random() * 10;
         this._forceY = -5 + Math.random() * 10;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._animView.Destroy();
      }
      
      override public function Update() : void
      {
         super.Update();
         this._animView.anim.x += this._forceX * this._multVit;
         this._animView.anim.y += this._forceY * this._multVit;
         this._forceY += 0.1;
         this._animView.anim.rotation += this._spinSpd;
         --this._lifeTime;
         if(this._lifeTime <= 0)
         {
            this._animView.anim.alpha -= 0.02;
            this._animView.anim.scaleX *= 0.98;
            this._animView.anim.scaleY = this._animView.anim.scaleX;
            if(this._animView.anim.alpha <= 0)
            {
               this._destroy = true;
            }
         }
         if(this._multVit > 1)
         {
            --this._multVit;
         }
      }
      
      public function set destroy(destroy:Boolean) : void
      {
         this._destroy = destroy;
      }
      
      public function get destroy() : Boolean
      {
         return this._destroy;
      }
   }
}

