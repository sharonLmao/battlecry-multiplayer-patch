package com.lachhhEngine.games.animation
{
   import com.lachhhEngine.utils.Utils;
   
   public class AnimationAssetGroup
   {
      
      private var _anims:Array;
      
      private var _name:String;
      
      private var _frame:int;
      
      private var _visible:Boolean;
      
      private var _groupId:int;
      
      public function AnimationAssetGroup(name:String, groupId:int)
      {
         super();
         this._name = name;
         this._groupId = groupId;
         this._anims = new Array();
         this._visible = true;
         this._frame = 1;
      }
      
      public function Destroy() : void
      {
         Utils.ClearArray(this._anims);
         this._anims = null;
      }
      
      private function SetAllAnimVisible() : void
      {
         var a:Animation = null;
         for(var i:int = 0; i < this._anims.length; i++)
         {
            a = this._anims[i];
            a.visible = this._visible;
         }
      }
      
      public function set visible(visible:Boolean) : void
      {
         this._visible = visible;
         this.SetAllAnimVisible();
      }
      
      public function AddAnimationAsset(a:AnimationAsset) : void
      {
         this._anims.push(a);
         a.gotoAndStop(this.frame);
         a.visible = this._visible;
      }
      
      public function set frame(frame:int) : void
      {
         this._frame = frame;
         this.SetFrameOfAllAnim();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get frame() : int
      {
         return this._frame;
      }
      
      private function SetFrameOfAllAnim() : void
      {
         var a:Animation = null;
         for(var i:int = 0; i < this._anims.length; i++)
         {
            a = this._anims[i];
            a.gotoAndStop(this.frame);
         }
      }
      
      public function get anims() : Array
      {
         return this._anims;
      }
      
      public function get groupId() : int
      {
         return this._groupId;
      }
      
      public function RemoveAnimationAsset(a:AnimationAsset) : void
      {
         Utils.RemoveFromArray(this._anims,a);
      }
      
      public function get visible() : Boolean
      {
         return this._visible;
      }
   }
}

