package com.battlecry.screens.view
{
   import com.battlecry.meta.MetaType;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class TypeView extends ObjectView
   {
      
      private var _metaType:MetaType;
      
      public function TypeView(visual:MovieClip)
      {
         super(visual);
         this._metaType = MetaType.EMPTY_TYPE;
      }
      
      public function SetMetaType(metaType:MetaType) : void
      {
         this._metaType = metaType;
         this.Refresh();
      }
      
      public function get iconTxt() : TextField
      {
         return visual.getChildByName("icon_txt") as TextField;
      }
      
      public function get icon() : MovieClip
      {
         return visual.getChildByName("icon") as MovieClip;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         if(this.iconTxt)
         {
            this.iconTxt.text = this._metaType.value + "";
         }
         if(this.icon)
         {
            if(this._metaType.value == 0 || this._metaType.type == -1)
            {
               this.icon.visible = false;
               this.iconTxt.visible = false;
            }
            else
            {
               this.icon.visible = true;
               this.iconTxt.visible = true;
            }
            this.icon.gotoAndStop(this._metaType.type);
         }
      }
   }
}

