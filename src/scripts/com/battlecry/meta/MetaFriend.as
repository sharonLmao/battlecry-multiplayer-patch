package com.battlecry.meta
{
   public class MetaFriend
   {
      
      private var _friendName:String;
      
      private var _metaFlag:MetaFlag;
      
      private var _metaArmy5:BC_MetaArmy;
      
      public function MetaFriend(friendName:String)
      {
         super();
         this._friendName = friendName;
      }
      
      public function set metaFlag(metaFlag:MetaFlag) : void
      {
         this._metaFlag = metaFlag;
      }
      
      public function set metaArmy5(metaArmy5:BC_MetaArmy) : void
      {
         this._metaArmy5 = metaArmy5;
      }
      
      public function get friendName() : String
      {
         return this._friendName;
      }
      
      public function get metaFlag() : MetaFlag
      {
         return this._metaFlag;
      }
      
      public function set friendName(friendName:String) : void
      {
         this._friendName = friendName;
      }
      
      public function get metaArmy5() : BC_MetaArmy
      {
         return this._metaArmy5;
      }
   }
}

