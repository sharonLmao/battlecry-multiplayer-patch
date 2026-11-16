package com.lachhhEngine.io.files
{
   import com.lachhhEngine.io.ISaveObject;
   
   public class GameProgress implements ISaveObject
   {
      
      private var _id:int;
      
      private var _isEmpty:Boolean;
      
      public function GameProgress()
      {
         super();
         this._id = -1;
         this.Init();
      }
      
      public function get isEmpty() : Boolean
      {
         return this._isEmpty;
      }
      
      public function set isEmpty(isEmpty:Boolean) : void
      {
         this._isEmpty = isEmpty;
      }
      
      public function Clear() : void
      {
         this.Destroy();
         this.Init();
      }
      
      public function get isDirty() : Boolean
      {
         return true;
      }
      
      public function Init() : void
      {
         this._isEmpty = true;
      }
      
      public function Decode(s:String) : void
      {
      }
      
      public function Encode() : String
      {
         return "";
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function Destroy() : void
      {
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function Clone() : GameProgress
      {
         return FileManager.instance.CloneGameProgress(this);
      }
      
      public function set isDirty(value:Boolean) : void
      {
      }
   }
}

