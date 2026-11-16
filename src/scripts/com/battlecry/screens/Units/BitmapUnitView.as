package com.battlecry.screens.Units
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.meta.MetaSquadSpeedEnum;
   import com.battlecry.meta.model.ModelBitMapAnimation;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationCallback;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.utils.Utils;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   public class BitmapUnitView extends ObjectView
   {
      
      private var _bmd:BitmapData;
      
      private var _bmp:Bitmap = null;
      
      private var _metaUnit:BC_MetaUnit;
      
      private var _animID:int;
      
      private var _endCallBack:Array;
      
      private var _specialAnim:Animation;
      
      private var _animCallBack:Array;
      
      private var _currentIndex:int;
      
      private var _currentBitmapAnimation:ModelBitMapAnimation;
      
      public function BitmapUnitView(visual:MovieClip)
      {
         super(visual);
         this._animID = -1;
         this._endCallBack = new Array();
         this._animCallBack = new Array();
         this._bmp = new Bitmap(this._bmd);
         visual.addChild(this._bmp);
      }
      
      public function SetSkeletonRaise() : void
      {
         this.SetAnim(BC_AnimationFactory.ID_ANIM_SKELETON_RAISE);
      }
      
      public function SetChargeUpIdle() : void
      {
         this.SetAnim(this._metaUnit.modelAnim.animChargeUpIdle);
      }
      
      public function SetChargeUpWalk() : void
      {
         this.SetAnim(this._metaUnit.modelAnim.animChargeUpWalk);
      }
      
      public function SetMetaUnit(metaUnit:BC_MetaUnit) : void
      {
         this._metaUnit = metaUnit;
         visual.visible = true;
         Refresh();
      }
      
      public function PickRandomInVector(v:Vector.<int>) : int
      {
         var i:int = Math.ceil(Math.random() * v.length);
         return v[i - 1];
      }
      
      public function set specialAnim(specialAnim:Animation) : void
      {
         this._specialAnim = specialAnim;
      }
      
      public function SetMove() : void
      {
         if(this._metaUnit.speed.speedValue == MetaSquadSpeedEnum.SPEED_SLOW.speedValue)
         {
            this.SetAnim(this._metaUnit.modelAnim.animWalkIdle);
         }
         else
         {
            this.SetAnim(this._metaUnit.modelAnim.animRunIdle);
         }
      }
      
      public function SetCasterMeleeAttackWalk(c:AnimationCallback) : void
      {
         if(this._metaUnit.playerEquipement.specialEquip.isHorse())
         {
            this.SetAnim(BC_AnimationFactory.ID_WALKATTACK_1HANDEDWEAPON_HORSE);
         }
         else if(this._metaUnit.playerEquipement.specialEquip.isBoar())
         {
            this.SetAnim(BC_AnimationFactory.ID_WALKATTACK_1HANDEDWEAPON_BOAR);
         }
         else
         {
            this.SetAnim(BC_AnimationFactory.ID_WALKATTACK_1HANDEDWEAPON);
         }
         this.AddCallbackAt(c);
      }
      
      public function set metaUnit(metaUnit:BC_MetaUnit) : void
      {
         this._metaUnit = metaUnit;
      }
      
      public function SetSkeletonWarriorRaise() : void
      {
         this.SetAnim(BC_AnimationFactory.ID_ANIM_SKELETON_WARRIOR_RAISE);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         Utils.LazyRemoveFromParent(this._bmp);
         this._bmp = null;
         this._animID = -1;
         if(this._specialAnim)
         {
            Utils.LazyRemoveFromParent(this._specialAnim);
            AnimationManager.instance.Destroy(this._specialAnim);
            this._specialAnim = null;
         }
      }
      
      public function SetDashAttack(c:AnimationCallback) : void
      {
         if(this._metaUnit.speed.speedValue == MetaSquadSpeedEnum.SPEED_SLOW.speedValue)
         {
            this.SetAnim(this._metaUnit.modelAnim.animAttackWalk);
         }
         else
         {
            this.SetAnim(this._metaUnit.modelAnim.animAttackDash);
         }
         this.AddCallbackAt(c);
      }
      
      public function SetDie(c:Callback) : void
      {
         this.SetAnim(this._metaUnit.modelAnim.animDie);
         this.AddEndCallback(c);
      }
      
      public function get metaUnit() : BC_MetaUnit
      {
         return this._metaUnit;
      }
      
      public function get specialAnim() : Animation
      {
         return this._specialAnim;
      }
      
      public function SetReloadWalk(c:AnimationCallback = null) : void
      {
         this.SetAnim(this._metaUnit.modelAnim.animReloadWalk);
         if(c)
         {
            this.AddCallbackAt(c);
         }
      }
      
      public function SetLarva() : void
      {
         this.SetAnim(BC_AnimationFactory.ID_ANIM_LARVA);
      }
      
      override public function Update() : void
      {
         var j:int = 0;
         super.Update();
         if(this._animID == BC_AnimationFactory.ID_ANIM_SKELETON_RAISE || this._animID == BC_AnimationFactory.ID_ANIM_SKELETON_WARRIOR_RAISE || this._animID == BC_AnimationFactory.ID_ANIM_LARVA)
         {
            if(this._specialAnim)
            {
               this._specialAnim.Update(BC_Game.instance);
            }
            for(j = int(this._animCallBack.length - 1); j >= 0; j--)
            {
               if((this._animCallBack[j] as AnimationCallback).frame >= this._specialAnim.currentFrame)
               {
                  (this._animCallBack[j] as AnimationCallback).DoCallback();
                  this._animCallBack.splice(j,1);
               }
            }
            if(this._specialAnim.currentFrame >= this._specialAnim.totalFrames)
            {
               for(j = int(this._endCallBack.length - 1); j >= 0; j--)
               {
                  (this._endCallBack[j] as Callback).DoCallback();
                  this._endCallBack.splice(j,1);
               }
            }
            return;
         }
         if(this._currentBitmapAnimation == null || this._currentBitmapAnimation.bitMapDataArray.length <= 0)
         {
            return;
         }
         this._bmp.bitmapData = this._currentBitmapAnimation.bitMapDataArray[this._currentIndex].bmd;
         var r1:Rectangle = this._currentBitmapAnimation.bitMapDataArray[this._currentIndex].rect;
         this._bmp.x = r1.x;
         this._bmp.y = r1.y;
         this._currentIndex += BC_Game.instance.speedManager.GetSpeed();
         for(var i:int = int(this._animCallBack.length - 1); i >= 0; i--)
         {
            if((this._animCallBack[i] as AnimationCallback).frame >= this._currentIndex)
            {
               (this._animCallBack[i] as AnimationCallback).DoCallback();
               this._animCallBack.splice(i,1);
            }
         }
         if(this._currentIndex >= this._currentBitmapAnimation.bitMapDataArray.length)
         {
            this._currentIndex = 0;
            for(i = int(this._endCallBack.length - 1); i >= 0; i--)
            {
               (this._endCallBack[i] as Callback).DoCallback();
               this._endCallBack.splice(i,1);
            }
         }
      }
      
      public function SetCasterMeleeAttack(c:AnimationCallback) : void
      {
         var a:Array = null;
         if(this._metaUnit.playerEquipement.specialEquip.isHorse())
         {
            this.SetAnim(BC_AnimationFactory.ID_ATTACK_1HANDEDWEAPON_HORSE);
         }
         else if(this._metaUnit.playerEquipement.specialEquip.isBoar())
         {
            this.SetAnim(BC_AnimationFactory.ID_ATTACK_1HANDEDWEAPON_BOAR);
         }
         else
         {
            a = new Array(BC_AnimationFactory.ID_ATTACK_2HANDEDWEAPON_01,BC_AnimationFactory.ID_ATTACK_2HANDEDWEAPON_02,BC_AnimationFactory.ID_ATTACK_2HANDEDWEAPON_03);
            this.SetAnim(Utils.PickRandomIn(a) as int);
         }
         this.AddCallbackAt(c);
      }
      
      public function SetReloadIdle(c:AnimationCallback = null) : void
      {
         this.SetAnim(this._metaUnit.modelAnim.animReloadIdle);
         if(c)
         {
            this.AddCallbackAt(c);
         }
      }
      
      public function SetAttack(c:AnimationCallback) : void
      {
         var i:int = this.PickRandomInVector(this._metaUnit.modelAnim.animAttack);
         this.SetAnim(i);
         this.AddCallbackAt(c);
      }
      
      public function SetAnim(animID:int) : void
      {
         if(this._animID == animID)
         {
            return;
         }
         this._currentBitmapAnimation = this._metaUnit.modelBitmapAnimationGroup.GetBitmapAnimationOnFactoryID(animID);
         this._currentIndex = 0;
         this._animID = animID;
         if(this._animID == BC_AnimationFactory.ID_ANIM_LARVA)
         {
            if(!this._specialAnim)
            {
               this._specialAnim = AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ANIM_LARVA);
               this._specialAnim.visible = true;
               visual.addChild(this._specialAnim);
               this._bmp.visible = false;
            }
            return;
         }
         if(Boolean(this._specialAnim) && this._bmp.visible == false)
         {
            AnimationManager.instance.Destroy(this._specialAnim);
            this._specialAnim.visible = false;
            this._bmp.visible = true;
            this._specialAnim = null;
            Utils.LazyRemoveFromParent(this._specialAnim);
         }
         if(this._animID == BC_AnimationFactory.ID_ANIM_SKELETON_RAISE || this._animID == BC_AnimationFactory.ID_ANIM_SKELETON_WARRIOR_RAISE)
         {
            if(!this._specialAnim)
            {
               this._specialAnim = AnimationManager.instance.CreateAnimation(this._animID);
               this._specialAnim.visible = true;
               visual.addChild(this._specialAnim);
               this._bmp.visible = false;
            }
            return;
         }
         if(Boolean(this._specialAnim) && this._bmp.visible == false)
         {
            AnimationManager.instance.Destroy(this._specialAnim);
            this._specialAnim.visible = false;
            this._bmp.visible = true;
            this._specialAnim = null;
            Utils.LazyRemoveFromParent(this._specialAnim);
         }
      }
      
      public function AddCallbackAt(c:AnimationCallback) : void
      {
         this._animCallBack.push(c);
      }
      
      public function SetIdle() : void
      {
         this.SetAnim(this._metaUnit.modelAnim.animIdle);
      }
      
      public function AddEndCallback(c:Callback) : void
      {
         this._endCallBack.push(c);
      }
   }
}

