package com.battlecry.meta
{
   import com.lachhhEngine.multilingual.TextFactory;
   
   public class MetaSquadSpeed
   {
      
      private var _id:int;
      
      private var _speedValue:int;
      
      private var _titleId:int;
      
      public function MetaSquadSpeed(id:int, title:int, speedValue:int)
      {
         super();
         this._id = id;
         this._titleId = title;
         this._speedValue = speedValue;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set speedValue(speedValue:int) : void
      {
         this._speedValue = speedValue;
      }
      
      public function get speedValue() : int
      {
         return this._speedValue;
      }
      
      public function get titleStr() : String
      {
         return TextFactory.instance.GetMsg(this._titleId);
      }
      
      public function get titleId() : int
      {
         return this._titleId;
      }
   }
}

