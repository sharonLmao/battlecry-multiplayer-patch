package com.battlecry.levelEvent
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.level.levelEvents.LevelEvent;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.utils.Utils;
   
   public class BC_LevelEvent extends LevelEvent
   {
      
      private var _backGround:Animation;
      
      public function BC_LevelEvent()
      {
         super();
      }
      
      override public function Init(metaLevelEvent:MetaObject, context:Game) : void
      {
         var backgroundID:int = 0;
         super.Init(metaLevelEvent,context);
         var b:Array = new Array(BC_AnimationFactory.ID_BACKGROUND1,BC_AnimationFactory.ID_BACKGROUND2,BC_AnimationFactory.ID_BACKGROUND3,BC_AnimationFactory.ID_BACKGROUND4,BC_AnimationFactory.ID_BACKGROUND5,BC_AnimationFactory.ID_BACKGROUND6,BC_AnimationFactory.ID_BACKGROUND7,BC_AnimationFactory.ID_BACKGROUND8,BC_AnimationFactory.ID_BACKGROUND9,BC_AnimationFactory.ID_BACKGROUND10,BC_AnimationFactory.ID_BACKGROUND11,BC_AnimationFactory.ID_BACKGROUND12);
         if(BC_Game.instance.currentCampaign)
         {
            backgroundID = BC_Game.instance.currentCampaign.backGroundID;
         }
         else
         {
            backgroundID = Utils.PickRandomIn(b) as int;
         }
         this._backGround = AnimationManager.instance.CreateAnimation(backgroundID);
         BC_Game.instance.actionLayer.GetBackFxContainer().addChild(this._backGround);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         if(this._backGround)
         {
            Utils.LazyRemoveFromParent(this._backGround);
            AnimationManager.instance.Destroy(this._backGround);
            this._backGround = null;
         }
      }
   }
}

