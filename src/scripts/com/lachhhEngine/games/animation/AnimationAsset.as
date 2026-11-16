package com.lachhhEngine.games.animation
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   
   public class AnimationAsset extends Animation
   {
      
      private var _groupId:int;
      
      private var _animationParent:Animation;
      
      public function AnimationAsset()
      {
         super();
         this._groupId = AnimationManager.factory.GetAnimationAssetGroup(this);
         addEventListener(Event.ADDED_TO_STAGE,this.addedToStage,false,0,true);
      }
      
      public function get groupId() : int
      {
         return this._groupId;
      }
      
      private function FindAnimation(mc:DisplayObjectContainer) : Animation
      {
         if(mc.parent is Animation && Animation(mc.parent).GetAnimAssetGroup(this._groupId) != null)
         {
            return Animation(mc.parent);
         }
         return this.FindAnimation(mc.parent);
      }
      
      private function addedToStage(e:Event) : void
      {
         this._animationParent = this.FindAnimation(this);
         this._animationParent.AddAnimationAsset(this);
         addEventListener(Event.REMOVED_FROM_STAGE,this.removedFromStage,false,0,true);
         removeEventListener(Event.ADDED_TO_STAGE,this.addedToStage,false);
      }
      
      private function removedFromStage(e:Event) : void
      {
         this._animationParent.RemoveAnimationAsset(this);
         this._animationParent = null;
         addEventListener(Event.ADDED_TO_STAGE,this.addedToStage,false,0,true);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.removedFromStage);
      }
      
      protected function set groupId(groupId:int) : void
      {
         this._groupId = groupId;
      }
   }
}

