package com.lachhhEngine.games.screens
{
   import com.lachhhEngine.io.Callback;
   import flash.events.ContextMenuEvent;
   import flash.ui.ContextMenuItem;
   
   public class ContextMenuItemWithCallback
   {
      
      private var _contextMenuItem:ContextMenuItem;
      
      private var _callback:Callback;
      
      public function ContextMenuItemWithCallback(caption:String, separatorBefore:Boolean = false, enabled:Boolean = true, visible:Boolean = true, callback:Callback = null)
      {
         super();
         this._contextMenuItem = new ContextMenuItem(caption,separatorBefore,enabled,visible);
         this._callback = callback;
         if(this._callback != null)
         {
            this._contextMenuItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this.onClick,false,0,true);
         }
      }
      
      public function get contextMenuItem() : ContextMenuItem
      {
         return this._contextMenuItem;
      }
      
      private function onClick(e:ContextMenuEvent) : void
      {
         this._callback.DoCallback();
      }
   }
}

