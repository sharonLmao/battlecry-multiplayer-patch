package com.battlecry.meta
{
   import com.battlecry.meta.model.ModelFlag;
   import com.battlecry.meta.model.ModelFlagEnum;
   
   public class MetaFlag
   {
      
      private var _symbole1:ModelFlag;
      
      private var _symbole2:ModelFlag;
      
      private const SEPARATOR:String = "[F]";
      
      private var _fond:ModelFlag;
      
      public function MetaFlag()
      {
         super();
         this._fond = ModelFlagEnum.FLAG_NULL;
         this._symbole1 = ModelFlagEnum.FLAG_NULL;
         this._symbole2 = ModelFlagEnum.FLAG_NULL;
      }
      
      public function get symbole1() : ModelFlag
      {
         return this._symbole1;
      }
      
      public function get symbole2() : ModelFlag
      {
         return this._symbole2;
      }
      
      public function set fond(fond:ModelFlag) : void
      {
         this._fond = fond;
      }
      
      public function Decode(s:String) : void
      {
         var params:Array = s.split(this.SEPARATOR);
         this._fond = ModelFlagEnum.GetFromId(params.shift());
         this._symbole1 = ModelFlagEnum.GetFromId(params.shift());
         this._symbole2 = ModelFlagEnum.GetFromId(params.shift());
      }
      
      public function set symbole1(symbole1:ModelFlag) : void
      {
         this._symbole1 = symbole1;
      }
      
      public function set symbole2(symbole2:ModelFlag) : void
      {
         this._symbole2 = symbole2;
      }
      
      public function Copy(metaFlag:MetaFlag) : void
      {
         this._fond = metaFlag.fond;
         this._symbole1 = metaFlag.symbole1;
         this._symbole2 = metaFlag.symbole2;
      }
      
      public function Encode() : String
      {
         return this._fond.id + this.SEPARATOR + this._symbole1.id + this.SEPARATOR + this._symbole2.id;
      }
      
      public function get fond() : ModelFlag
      {
         return this._fond;
      }
   }
}

