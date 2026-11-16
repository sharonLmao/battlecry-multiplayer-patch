package com.battlecry.screens.Units
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.meta.MetaSquadSpeedEnum;
   import com.battlecry.screens.view.animationview.AnimationBmp;
   import com.battlecry.screens.view.animationview.AnimationBmpDict;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationCallback;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.draw.CopypixelableBmpData;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.utils.Utils;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   
   public class UnitView extends ObjectView
   {
      
      public static const ASSET_WEAPON:int = 0;
      
      public static const ASSET_SHIELD:int = 1;
      
      public static const ASSET_SKIN:int = 2;
      
      public static const ASSET_ARMOR:int = 3;
      
      public static const ASSET_HORSE:int = 4;
      
      public static const ASSET_ANIMAL:int = 5;
      
      private var _animID:int;
      
      private var _metaUnit:BC_MetaUnit;
      
      private var _dictVectorChild:Dictionary;
      
      private var _dictBmpChild:Dictionary;
      
      private var _isVector:Boolean;
      
      private var _isInterface:Boolean;
      
      private var _animBmp:AnimationBmp;
      
      private const ARROW_FRAME:int = 100;
      
      private var _animContainer:Animation = null;
      
      private var _anim:Animation = null;
      
      public function UnitView(visual:MovieClip, isInterface:Boolean = false)
      {
         super(visual);
         this._isInterface = isInterface;
         this._animContainer = AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_EMPTY);
         this._animContainer.AddAnimationAssetGroup("ASSET_WEAPON",ASSET_WEAPON);
         this._animContainer.AddAnimationAssetGroup("ASSET_SHIELD",ASSET_SHIELD);
         this._animContainer.AddAnimationAssetGroup("ASSET_SKIN",ASSET_SKIN);
         this._animContainer.AddAnimationAssetGroup("ASSET_ARMOR",ASSET_ARMOR);
         this._animContainer.AddAnimationAssetGroup("ASSET_HORSE",ASSET_HORSE);
         this._animContainer.AddAnimationAssetGroup("ASSET_ANIMAL",ASSET_ANIMAL);
         if(this.emc)
         {
            this._animContainer.x = this.emc.x;
            this._animContainer.y = this.emc.y;
            this.emc.visible = false;
         }
         else
         {
            this._animContainer.x = 0;
            this._animContainer.y = 0;
         }
         if(this.btnSelect)
         {
            this.btnSelect.mouseEnabled = false;
            this.btnSelect.mouseChildren = false;
         }
         this.HideDispoSquare();
         this.HideErrorSquare();
         visual.addChild(this._animContainer);
         this._animContainer.visible = true;
         this._animContainer.mouseEnabled = false;
         this._animContainer.mouseChildren = false;
         if(this.hitArea)
         {
            visual.addChild(this.hitArea);
         }
         if(this.highLightInventory)
         {
            this.highLightInventory.mouseEnabled = false;
            this.HideInventoryHighLight();
         }
         if(this.holdCtrl)
         {
            this.holdCtrl.visible = false;
            this.holdCtrl.mouseChildren = false;
            this.holdCtrl.mouseEnabled = false;
         }
         this._animID = -99;
         this._isVector = true;
      }
      
      public function recurPlay(mc:MovieClip) : void
      {
         var d:DisplayObject = null;
         var m:MovieClip = null;
         for(var i:int = 0; i < mc.numChildren; i++)
         {
            d = mc.getChildAt(i);
            if(d is MovieClip)
            {
               m = MovieClip(d);
               this.recurPlay(m);
               m.play();
            }
         }
      }
      
      public function set animContainer(animContainer:Animation) : void
      {
         this._animContainer = animContainer;
      }
      
      public function HideErrorSquare() : void
      {
         if(this.errorSquare)
         {
            this.errorSquare.visible = false;
         }
      }
      
      public function get btnSelect() : ButtonSelect
      {
         return visual.getChildByName("btnSelect") as ButtonSelect;
      }
      
      public function RefreshText() : void
      {
         if(this.quantityText)
         {
            visual.addChild(this.quantityText);
            this.quantityText.text = "x" + this._metaUnit.quantity;
            this.quantityText.mouseEnabled = false;
         }
      }
      
      public function get dispoSquare() : MovieClip
      {
         return visual.getChildByName("dispoSquare") as MovieClip;
      }
      
      public function get anim() : Animation
      {
         return this._anim;
      }
      
      public function SetMetaUnit(metaUnit:BC_MetaUnit) : void
      {
         if(Boolean(this._metaUnit) && this._metaUnit.id < 0)
         {
            this._animID = -1;
         }
         this._metaUnit = metaUnit;
         this._metaUnit.ChooseAnimSet();
         visual.visible = true;
         this.Refresh();
      }
      
      public function OffSet(x:int, y:int) : void
      {
         this._animContainer.x = this.emc.x + x;
         this._animContainer.y = this.emc.y + y;
      }
      
      public function ShowInventoryHighLight() : void
      {
         this.btnSelect.Select();
         if(this.holdCtrl)
         {
            this.holdCtrl.visible = true;
            visual.addChild(this.holdCtrl);
         }
      }
      
      public function SetSkeletonWarriorRaise() : void
      {
         this.SetAnim(BC_AnimationFactory.ID_ANIM_SKELETON_WARRIOR_RAISE);
      }
      
      public function HideInventoryHighLight() : void
      {
         this.btnSelect.Deselect();
         if(this.holdCtrl)
         {
            this.holdCtrl.visible = false;
         }
      }
      
      public function get animContainer() : Animation
      {
         return this._animContainer;
      }
      
      public function get shadow() : MovieClip
      {
         return visual.getChildByName("shadow") as MovieClip;
      }
      
      public function get highLightInventory() : MovieClip
      {
         return visual.getChildByName("highLightInventory") as MovieClip;
      }
      
      public function get metaUnit() : BC_MetaUnit
      {
         return this._metaUnit;
      }
      
      public function SetAttack(c:AnimationCallback) : void
      {
         var i:int = this.PickRandomInVector(this._metaUnit.modelAnim.animAttack);
         this.SetAnim(i);
         this._anim.AddCallbackAt(c);
      }
      
      public function ShowDispoSquare() : void
      {
         if(this.dispoSquare)
         {
            this.dispoSquare.visible = true;
         }
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
      
      public function SetIdle() : void
      {
         this.SetAnim(this._metaUnit.modelAnim.animIdle);
         var context:BC_Game = Main.instance.game as BC_Game;
         if(Boolean(this._anim) && context.roundManager == null)
         {
            this.recurStop(this._anim);
            this._anim.gotoAndStop(1);
            this._anim.isPlayingAnim = false;
            this._anim.playChildren = false;
         }
      }
      
      public function SetChargeUpWalk() : void
      {
         this.SetAnim(this._metaUnit.modelAnim.animChargeUpWalk);
      }
      
      override public function Refresh() : void
      {
         if(this._metaUnit == null)
         {
            return;
         }
         super.Refresh();
         this.RefreshText();
         if(this.emc)
         {
            this._animContainer.x = this.emc.x;
            this._animContainer.y = this.emc.y;
            this.emc.visible = false;
            this.emc.mouseChildren = false;
            this.emc.mouseEnabled = false;
         }
         else
         {
            this._animContainer.x = 0;
            this._animContainer.y = 0;
         }
         if(this._metaUnit.playerEquipement.weaponEquip.isBow())
         {
            this._animContainer.SetFrameOfAssets(this.ARROW_FRAME,ASSET_WEAPON);
            this._animContainer.SetFrameOfAssets(this._metaUnit.playerEquipement.weaponEquip.modelEquipement.itemVisualFrame,ASSET_SHIELD);
         }
         else
         {
            this._animContainer.SetFrameOfAssets(this._metaUnit.playerEquipement.weaponEquip.modelEquipement.itemVisualFrame,ASSET_WEAPON);
            this._animContainer.SetFrameOfAssets(this._metaUnit.playerEquipement.shieldEquip.modelEquipement.itemVisualFrame,ASSET_SHIELD);
         }
         this._animContainer.SetFrameOfAssets(this._metaUnit.playerEquipement.creatureEquip.modelEquipement.itemVisualFrame,ASSET_SKIN);
         this._animContainer.SetFrameOfAssets(this._metaUnit.playerEquipement.armorEquip.modelEquipement.itemVisualFrame,ASSET_ARMOR);
         this._animContainer.SetFrameOfAssets(this._metaUnit.playerEquipement.specialEquip.modelEquipement.itemVisualFrame,ASSET_HORSE);
         this._animContainer.SetFrameOfAssets(this._metaUnit.playerEquipement.specialEquip.modelEquipement.itemVisualFrame,ASSET_ANIMAL);
         if(this.isEmpty())
         {
            this.DestroyAnimation();
            return;
         }
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
      
      public function get hitArea() : MovieClip
      {
         return visual.getChildByName("hitArea") as MovieClip;
      }
      
      public function get usedSquare() : MovieClip
      {
         return visual.getChildByName("usedSquare") as MovieClip;
      }
      
      private function isEmpty() : Boolean
      {
         return this._metaUnit.id == -1 || this._metaUnit.id == -2;
      }
      
      public function SetChargeUpIdle() : void
      {
         this.SetAnim(this._metaUnit.modelAnim.animChargeUpIdle);
      }
      
      public function HideDispoSquare() : void
      {
         if(this.dispoSquare)
         {
            this.dispoSquare.visible = false;
         }
      }
      
      public function DestroyAnimation() : void
      {
         if(this._anim)
         {
            Utils.LazyRemoveFromParent(this._anim);
            AnimationManager.instance.Destroy(this._anim);
            this._anim = null;
         }
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
               m = MovieClip(d);
               this.recurStop(m);
               m.stop();
            }
         }
      }
      
      public function get holdCtrl() : MovieClip
      {
         return visual.getChildByName("holdCtrl") as MovieClip;
      }
      
      public function set metaUnit(metaUnit:BC_MetaUnit) : void
      {
         this._metaUnit = metaUnit;
      }
      
      public function PickRandomInVector(v:Vector.<int>) : int
      {
         var i:int = Math.ceil(Math.random() * v.length);
         return v[i - 1];
      }
      
      public function FollowMouse(context:BC_Game) : void
      {
         if(this._anim)
         {
            visual.x = context.mouseX;
            visual.y = context.mouseY + 15;
         }
      }
      
      public function RefreshUsedSquare() : void
      {
         if(this._metaUnit.id == -1)
         {
            this.usedSquare.visible = false;
         }
         else
         {
            this.usedSquare.visible = true;
         }
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         if(this._animContainer)
         {
            Utils.LazyRemoveFromParent(this._animContainer);
            AnimationManager.instance.Destroy(this._animContainer);
            this._animContainer = null;
         }
         this.DestroyAnimation();
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
         this._anim.AddCallbackAt(c);
      }
      
      public function get emc() : MovieClip
      {
         return visual.getChildByName("emc") as MovieClip;
      }
      
      public function SetDie(c:Callback) : void
      {
         this.SetAnim(this._metaUnit.modelAnim.animDie);
         this._anim.AddEndCallback(c);
      }
      
      public function get quantityText() : TextField
      {
         return visual.getChildByName("quantityText") as TextField;
      }
      
      public function SetReloadWalk(c:AnimationCallback = null) : void
      {
         this.SetAnim(this._metaUnit.modelAnim.animReloadWalk);
         if(c)
         {
            this._anim.AddCallbackAt(c);
         }
      }
      
      public function SetLarva() : void
      {
         this.SetAnim(BC_AnimationFactory.ID_ANIM_LARVA);
      }
      
      public function ShowErrorSquare() : void
      {
         if(this.errorSquare)
         {
            this.errorSquare.visible = true;
         }
      }
      
      override public function Update() : void
      {
         super.Update();
         if(this._isInterface)
         {
            return;
         }
         if(Boolean(this._anim) && Boolean(this._animContainer))
         {
            this._anim.Update(Main.instance.game);
         }
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
         animBmp.scaleX = this.anim.scaleX;
         animBmp.scaleY = this.anim.scaleY;
         this.anim.addChildAt(animBmp,0);
         this._dictBmpChild["this"] = animBmp;
      }
      
      public function SetReloadIdle(c:AnimationCallback = null) : void
      {
         this.SetAnim(this._metaUnit.modelAnim.animReloadIdle);
         if(c)
         {
            this._anim.AddCallbackAt(c);
         }
      }
      
      public function get errorSquare() : MovieClip
      {
         return visual.getChildByName("errorSquare") as MovieClip;
      }
      
      public function SetAnim(animID:int) : void
      {
         if(this._animID == animID)
         {
            return;
         }
         this._animID = animID;
         if(this._metaUnit.id == -1 || this._metaUnit.id == -2 || animID < 0)
         {
            return;
         }
         this.DestroyAnimation();
         this._anim = AnimationManager.instance.CreateAnimation(animID);
         this._animContainer.addChild(this._anim);
         this._anim.gotoAndPlay(1);
         this._anim.isPlayingAnim = true;
         this._anim.mouseEnabled = false;
         this._anim.mouseChildren = false;
         this.recurPlay(this._anim);
         this.Refresh();
      }
      
      public function SetSkeletonRaise() : void
      {
         this.SetAnim(BC_AnimationFactory.ID_ANIM_SKELETON_RAISE);
      }
   }
}

