package com.battlecry.io
{
   import com.battlecry.meta.model.ModelFlag;
   import com.battlecry.meta.model.ModelFlagEnum;
   import com.lachhhEngine.io.files.FileManager;
   import com.lachhhEngine.utils.Utils;
   
   public class FlagManager
   {
      
      private const SEPARATOR:String = "[TM]";
      
      private var _flagUnlocked:Array;
      
      public function FlagManager()
      {
         super();
         this._flagUnlocked = new Array();
         this._flagUnlocked.push(ModelFlagEnum.FOND_1.id,ModelFlagEnum.FOND_2.id,ModelFlagEnum.FOND_3.id,ModelFlagEnum.FOND_4.id,ModelFlagEnum.FOND_5.id,ModelFlagEnum.FOND_6.id,ModelFlagEnum.FOND_7.id,ModelFlagEnum.FOND_8.id,ModelFlagEnum.FOND_9.id,ModelFlagEnum.FOND_10.id,ModelFlagEnum.FOND_11.id,ModelFlagEnum.FOND_12.id,ModelFlagEnum.FOND_13.id,ModelFlagEnum.FOND_14.id,ModelFlagEnum.FOND_15.id,ModelFlagEnum.FOND_16.id,ModelFlagEnum.FOND_17.id,ModelFlagEnum.FOND_18.id,ModelFlagEnum.FOND_19.id,ModelFlagEnum.FOND_20.id,ModelFlagEnum.FOND_21.id,ModelFlagEnum.FOND_22.id,ModelFlagEnum.SYMBOLE1_SWORD.id,ModelFlagEnum.SYMBOLE1_AXE.id,ModelFlagEnum.SYMBOLE1_CROSS.id,ModelFlagEnum.SYMBOLE2_OCTOGON.id,ModelFlagEnum.SYMBOLE2_HEXAGON.id,ModelFlagEnum.SYMBOLE2_PENTAGON.id);
      }
      
      public function UnlockFlag(m:ModelFlag) : void
      {
         if(Utils.IsInArray(this._flagUnlocked,m.id))
         {
            return;
         }
         this._flagUnlocked.push(m.id);
         FileManager.instance.SaveToExternalAPI();
      }
      
      public function IsFlagUnlock(m:ModelFlag) : Boolean
      {
         return Utils.IsInArray(this._flagUnlocked,m.id);
      }
      
      public function Encode() : String
      {
         var returnValue:String = "";
         returnValue += this._flagUnlocked.length + this.SEPARATOR;
         for(var i:int = 0; i < this._flagUnlocked.length; i++)
         {
            returnValue += this._flagUnlocked[i] + this.SEPARATOR;
         }
         return returnValue.substr(0,returnValue.length - this.SEPARATOR.length);
      }
      
      public function Decode(s:String) : void
      {
         var params:Array = s.split(this.SEPARATOR);
         Utils.ClearArray(this._flagUnlocked);
         var Length:int = int(params.shift());
         for(var j:int = 0; j < Length; j++)
         {
            this._flagUnlocked.push(parseInt(params.shift()));
         }
      }
   }
}

