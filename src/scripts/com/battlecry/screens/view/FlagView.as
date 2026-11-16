package com.battlecry.screens.view
{
   import com.battlecry.meta.MetaFlag;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import flash.display.MovieClip;
   
   public class FlagView extends ObjectView
   {
      
      private var _metaFlag:MetaFlag;
      
      public function FlagView(visual:MovieClip)
      {
         super(visual);
      }
      
      public function SetMetaFlag(metaFlag:MetaFlag) : void
      {
         this._metaFlag = metaFlag;
         this.Refresh();
      }
      
      public function get symbole1() : MovieClip
      {
         return visual.getChildByName("symbole1") as MovieClip;
      }
      
      public function get symbole2() : MovieClip
      {
         return visual.getChildByName("symbole2") as MovieClip;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         if(this._metaFlag == null)
         {
            return;
         }
         this.fond.gotoAndStop(this._metaFlag.fond.visualFrame);
         this.symbole1.gotoAndStop(this._metaFlag.symbole1.visualFrame);
         this.symbole2.gotoAndStop(this._metaFlag.symbole2.visualFrame);
      }
      
      public function get fond() : MovieClip
      {
         return visual.getChildByName("fond") as MovieClip;
      }
   }
}

