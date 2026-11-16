package com.battlecry.io
{
   import com.battlecry.meta.model.ModelTutorial;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.utils.Utils;
   
   public class TutorialManager
   {
      
      private const SEPARATOR:String = "[TM]";
      
      private var _tutoShown:Array;
      
      public function TutorialManager()
      {
         super();
         this._tutoShown = new Array();
      }
      
      public function set tutoShown(tutoShown:Array) : void
      {
         this._tutoShown = tutoShown;
      }
      
      public function UnlockAchievement(m:ModelTutorial) : void
      {
         this._tutoShown.push(m.id);
      }
      
      public function Decode(s:String) : void
      {
         var params:Array = s.split(this.SEPARATOR);
         Utils.ClearArray(this._tutoShown);
         var Length:int = int(params.shift());
         for(var j:int = 0; j < Length; j++)
         {
            this._tutoShown.push(params.shift());
         }
      }
      
      public function HasBeenShown(m:ModelTutorial) : Boolean
      {
         var id:int = 0;
         for(var i:int = 0; i < this._tutoShown.length; i++)
         {
            id = int(this._tutoShown[i]);
            if(m.id == id)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get tutoShown() : Array
      {
         return this._tutoShown;
      }
      
      public function ShowTutorial(m:ModelTutorial) : void
      {
         if(VersionInfo.debugVersion)
         {
            return;
         }
         if(Utils.IsInArray(this._tutoShown,m.id))
         {
            return;
         }
         this._tutoShown.push(m.id);
         if(m.tutoScreen == -1)
         {
            return;
         }
         ScreenManager.instance.ShowScreen(m.tutoScreen,false,true);
      }
      
      public function Encode() : String
      {
         var returnValue:String = "";
         returnValue += this._tutoShown.length + this.SEPARATOR;
         for(var i:int = 0; i < this._tutoShown.length; i++)
         {
            returnValue += this._tutoShown[i] + this.SEPARATOR;
         }
         return returnValue.substr(0,returnValue.length - this.SEPARATOR.length);
      }
   }
}

