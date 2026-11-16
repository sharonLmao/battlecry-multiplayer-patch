package com.battlecry.meta.model
{
   public class ModelAnim
   {
      
      private var _animAttackDash:int;
      
      private var _animReloadWalk:int;
      
      private var _animReloadIdle:int;
      
      private var _id:int;
      
      private var _animAttackWalk:int;
      
      private var _animArray:Array;
      
      private var _animWalkIdle:int;
      
      private var _animAttack:Vector.<int> = new Vector.<int>();
      
      private var _animIdle:int;
      
      private var _animChargeUpWalk:int;
      
      private var _animRunIdle:int;
      
      private var _animDie:int;
      
      private var _animChargeUpIdle:int;
      
      public function ModelAnim(id:int, animIdle:int, animWalkIdle:int, animRunIdle:int, animDie:int, animChargeUpIdle:int, animChargeUpWalk:int, animReloadIdle:int, animReloadWalk:int, animAttack:Vector.<int>, animAttackWalk:int, animAttackDash:int)
      {
         super();
         this._id = id;
         this._animIdle = animIdle;
         this._animWalkIdle = animWalkIdle;
         this._animRunIdle = animRunIdle;
         this._animDie = animDie;
         this._animChargeUpIdle = animChargeUpIdle;
         this._animChargeUpWalk = animChargeUpWalk;
         this._animReloadIdle = animReloadIdle;
         this._animReloadWalk = animReloadWalk;
         for(var i:int = 0; i < animAttack.length; i++)
         {
            this._animAttack[i] = animAttack[i];
         }
         this._animAttackWalk = animAttackWalk;
         this._animAttackDash = animAttackDash;
         this._animArray = new Array(this._animIdle,this._animWalkIdle,this._animRunIdle,this._animDie,this._animChargeUpIdle,this._animChargeUpWalk,this._animReloadIdle,this._animReloadWalk,this._animAttackWalk,this._animAttackDash);
         for(i = 0; i < animAttack.length; i++)
         {
            this._animArray.push(this._animAttack[i]);
         }
      }
      
      public function get animIdle() : int
      {
         return this._animIdle;
      }
      
      public function get animChargeUpWalk() : int
      {
         return this._animChargeUpWalk;
      }
      
      public function set animIdle(animIdle:int) : void
      {
         this._animIdle = animIdle;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set animChargeUpWalk(animChargeUpWalk:int) : void
      {
         this._animChargeUpWalk = animChargeUpWalk;
      }
      
      public function get animAttackWalk() : int
      {
         return this._animAttackWalk;
      }
      
      public function get animChargeUpIdle() : int
      {
         return this._animChargeUpIdle;
      }
      
      public function set animChargeUpIdle(animChargeUpIdle:int) : void
      {
         this._animChargeUpIdle = animChargeUpIdle;
      }
      
      public function get animRunIdle() : int
      {
         return this._animRunIdle;
      }
      
      public function get animDie() : int
      {
         return this._animDie;
      }
      
      public function Reset() : void
      {
      }
      
      public function get animAttack() : Vector.<int>
      {
         return this._animAttack;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function set animAttackWalk(animAttackWalk:int) : void
      {
         this._animAttackWalk = animAttackWalk;
      }
      
      public function get animArray() : Array
      {
         return this._animArray;
      }
      
      public function set animAttackDash(animAttackDash:int) : void
      {
         this._animAttackDash = animAttackDash;
      }
      
      public function GetAnimOnID(index:int) : int
      {
         return this._animArray[index];
      }
      
      public function set animRunIdle(animRunIdle:int) : void
      {
         this._animRunIdle = animRunIdle;
      }
      
      public function set animWalkIdle(animWalkIdle:int) : void
      {
         this._animWalkIdle = animWalkIdle;
      }
      
      public function set animDie(animDie:int) : void
      {
         this._animDie = animDie;
      }
      
      public function get animAttackDash() : int
      {
         return this._animAttackDash;
      }
      
      public function set animReloadWalk(animReloadWalk:int) : void
      {
         this._animReloadWalk = animReloadWalk;
      }
      
      public function get animWalkIdle() : int
      {
         return this._animWalkIdle;
      }
      
      public function set animAttack(animAttack:Vector.<int>) : void
      {
         this._animAttack = animAttack;
      }
      
      public function get animReloadWalk() : int
      {
         return this._animReloadWalk;
      }
      
      public function set animReloadIdle(animReloadIdle:int) : void
      {
         this._animReloadIdle = animReloadIdle;
      }
      
      public function get animReloadIdle() : int
      {
         return this._animReloadIdle;
      }
   }
}

