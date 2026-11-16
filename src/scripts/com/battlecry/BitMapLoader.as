package com.battlecry
{
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.meta.model.ModelBitMapAnimation;
   import com.battlecry.meta.model.ModelBitmapAnimationsGroup;
   import com.battlecry.meta.model.ModelBitmapData;
   import com.battlecry.screens.Units.UnitView;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.utils.Utils;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class BitMapLoader
   {
      
      private var _x:Number;
      
      private var _y:Number;
      
      private var _rollAnim2:UnitView;
      
      private var _currentModelBitmapAnimation:ModelBitMapAnimation;
      
      private var _metaUnit:BC_MetaUnit;
      
      private var _bmpRectangle:Rectangle;
      
      private var _rollAnim:UnitView;
      
      private var _numAnimationRegistered:int;
      
      private var _animContainer2:Animation;
      
      private var _bmpMatrix:Matrix;
      
      private var _newAnim:Boolean;
      
      private var _bmpMatrix2:Matrix;
      
      private var _currentModelBitmapAnimation2:ModelBitMapAnimation;
      
      private var _animContainer:Animation;
      
      private var _modelBitmapAnimationGroup:ModelBitmapAnimationsGroup;
      
      private var _bmpRectangle2:Rectangle;
      
      private var _bmd2:BitmapData;
      
      private var _finishLoading:Boolean;
      
      private var _bmd:BitmapData;
      
      public function BitMapLoader(x:Number, y:Number, metaUnit:BC_MetaUnit)
      {
         super();
         this._x = x;
         this._y = y;
         this._finishLoading = false;
         this._metaUnit = metaUnit;
         this._modelBitmapAnimationGroup = new ModelBitmapAnimationsGroup();
         metaUnit.modelBitmapAnimationGroup = this._modelBitmapAnimationGroup;
         this._newAnim = false;
         this._numAnimationRegistered = 0;
         this._animContainer = AnimationManager.instance.CreateAnimation(0);
         this._animContainer.x = this._x;
         this._animContainer.y = this._y;
         BC_Game.instance.addChild(this._animContainer);
         this._animContainer2 = AnimationManager.instance.CreateAnimation(0);
         this._animContainer2.x = this._x;
         this._animContainer2.y = this._y + 200;
         BC_Game.instance.addChild(this._animContainer2);
         this._rollAnim = new UnitView(this._animContainer,false);
         this._rollAnim.SetMetaUnit(this._metaUnit);
         this._rollAnim2 = new UnitView(this._animContainer2,false);
         this._rollAnim2.SetMetaUnit(this._metaUnit);
         this._bmpMatrix = new Matrix();
         this._bmpMatrix.translate(25,-this._y - 25);
         this._bmpMatrix2 = new Matrix();
         this._bmpMatrix2.translate(25,-y - 200 - 25);
      }
      
      public function Update() : void
      {
         var factoryID:int = 0;
         var r:Rectangle = null;
         var x:Number = NaN;
         var y:Number = NaN;
         var m:ModelBitmapData = null;
         var r2:Rectangle = null;
         var x2:Number = NaN;
         var y2:Number = NaN;
         var m2:ModelBitmapData = null;
         if(this._finishLoading)
         {
            return;
         }
         if(!this._newAnim)
         {
            this._newAnim = true;
            this._currentModelBitmapAnimation = null;
            this._currentModelBitmapAnimation2 = null;
            factoryID = this._metaUnit.modelAnim.GetAnimOnID(this._numAnimationRegistered);
            this._rollAnim.SetAnim(factoryID);
            this._currentModelBitmapAnimation = new ModelBitMapAnimation(factoryID);
            if(this._numAnimationRegistered + 1 < this._metaUnit.modelAnim.animArray.length)
            {
               factoryID = this._metaUnit.modelAnim.GetAnimOnID(this._numAnimationRegistered + 1);
               this._rollAnim2.SetAnim(factoryID);
               this._currentModelBitmapAnimation2 = new ModelBitMapAnimation(factoryID);
            }
         }
         if(this._currentModelBitmapAnimation)
         {
            this._bmd = new BitmapData(this._rollAnim.animContainer.width,this._rollAnim.animContainer.height,true,0);
            this._bmd.fillRect(this._bmd.rect,0);
            this._bmpMatrix = new Matrix();
            r = this._rollAnim.animContainer.getBounds(this._rollAnim.animContainer);
            x = -this._x - r.x;
            y = -this._y - r.y;
            this._bmpMatrix.translate(x,y);
            this._bmpRectangle = new Rectangle(0,0,r.width,r.height);
            this._bmd.lock();
            this._bmd.draw(BC_Game.instance,this._bmpMatrix,null,null,this._bmpRectangle);
            this._bmd.unlock();
            m = new ModelBitmapData(this._bmd,r);
            this._currentModelBitmapAnimation.AddBitMapData(m);
            if(this._rollAnim.anim.currentFrame >= this._rollAnim.anim.totalFrames)
            {
               this._newAnim = false;
               ++this._numAnimationRegistered;
               this._modelBitmapAnimationGroup.AddModelBitMapAnimationGroup(this._currentModelBitmapAnimation);
               if(this._numAnimationRegistered >= this._metaUnit.modelAnim.animArray.length)
               {
                  this._metaUnit.modelBitmapAnimationGroup = this._modelBitmapAnimationGroup;
                  this._finishLoading = true;
               }
            }
            else if(this._rollAnim)
            {
               this._rollAnim.Update();
            }
         }
         if(this._currentModelBitmapAnimation2)
         {
            this._bmd2 = new BitmapData(this._rollAnim2.animContainer.width,this._rollAnim2.animContainer.height,true,0);
            this._bmd2.fillRect(this._bmd2.rect,0);
            this._bmpMatrix2 = new Matrix();
            r2 = this._rollAnim2.animContainer.getBounds(this._rollAnim2.animContainer);
            x2 = -this._x - r2.x;
            y2 = -this._y - 200 - r2.y;
            this._bmpMatrix2.translate(x2,y2);
            this._bmpRectangle2 = new Rectangle(0,0,r2.width,r2.height);
            this._bmd2.lock();
            this._bmd2.draw(BC_Game.instance,this._bmpMatrix2,null,null,this._bmpRectangle2);
            this._bmd2.unlock();
            m2 = new ModelBitmapData(this._bmd2,r2);
            this._currentModelBitmapAnimation2.AddBitMapData(m2);
            if(this._rollAnim2.anim.currentFrame >= this._rollAnim2.anim.totalFrames)
            {
               this._newAnim = false;
               ++this._numAnimationRegistered;
               this._modelBitmapAnimationGroup.AddModelBitMapAnimationGroup(this._currentModelBitmapAnimation2);
               if(this._numAnimationRegistered >= this._metaUnit.modelAnim.animArray.length)
               {
                  this._metaUnit.modelBitmapAnimationGroup = this._modelBitmapAnimationGroup;
                  this._finishLoading = true;
               }
            }
            else if(this._rollAnim2)
            {
               this._rollAnim2.Update();
            }
         }
      }
      
      public function get modelBitmapAnimationGroup() : ModelBitmapAnimationsGroup
      {
         return this._modelBitmapAnimationGroup;
      }
      
      public function Destroy() : void
      {
         if(this._bmpRectangle)
         {
            this._bmpRectangle = null;
         }
         if(this._bmpRectangle2)
         {
            this._bmpRectangle2 = null;
         }
         if(this._bmpMatrix)
         {
            this._bmpMatrix = null;
         }
         if(this._bmpMatrix2)
         {
            this._bmpMatrix2 = null;
         }
         if(this._animContainer)
         {
            Utils.LazyRemoveFromParent(this._animContainer);
            AnimationManager.instance.Destroy(this._animContainer);
            this._animContainer = null;
         }
         if(this._animContainer2)
         {
            Utils.LazyRemoveFromParent(this._animContainer2);
            AnimationManager.instance.Destroy(this._animContainer2);
            this._animContainer2 = null;
         }
         if(this._rollAnim)
         {
            this._rollAnim.Destroy();
            this._rollAnim = null;
         }
         if(this._rollAnim2)
         {
            this._rollAnim2.Destroy();
            this._rollAnim2 = null;
         }
      }
      
      public function get rollAnim() : UnitView
      {
         return this._rollAnim;
      }
      
      public function get finishLoading() : Boolean
      {
         return this._finishLoading;
      }
   }
}

