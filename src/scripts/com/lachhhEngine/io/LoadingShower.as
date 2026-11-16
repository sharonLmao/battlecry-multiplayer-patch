package com.lachhhEngine.io
{
   import com.berzerkstudio.exported.LOADING_SHOWER;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.text.TextField;
   
   public class LoadingShower
   {
      
      private var _loadingScreen:MovieClip = new LOADING_SHOWER();
      
      private var _parent:DisplayObjectContainer;
      
      private var _show:Boolean;
      
      public function LoadingShower()
      {
         super();
         this._loadingScreen.x = 0;
         this._loadingScreen.y = 0;
         this._loadingScreen.addEventListener(Event.ADDED_TO_STAGE,this.onAdded,false,0,true);
         this.SetText("");
      }
      
      public function get icon() : MovieClip
      {
         return MovieClip(this.centerMc.getChildByName("icon"));
      }
      
      private function onAdded(event:Event) : void
      {
         this._loadingScreen.removeEventListener(Event.ADDED_TO_STAGE,this.onAdded);
         this._loadingScreen.addEventListener(Event.ENTER_FRAME,this.onUpdate,false,0,true);
         this._loadingScreen.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemove,false,0,true);
      }
      
      public function Hide() : void
      {
         this._show = false;
      }
      
      private function onRemove(event:Event) : void
      {
         this._loadingScreen.removeEventListener(Event.ENTER_FRAME,this.onUpdate);
         this._loadingScreen.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemove);
         this._loadingScreen.addEventListener(Event.ADDED_TO_STAGE,this.onAdded,false,0,true);
      }
      
      public function get back() : MovieClip
      {
         return MovieClip(this._loadingScreen.getChildByName("back"));
      }
      
      private function RecurPlay(d:DisplayObjectContainer) : void
      {
         var child:DisplayObject = null;
         for(var i:int = 0; i < d.numChildren; i++)
         {
            child = d.getChildAt(i);
            if(child is MovieClip)
            {
               MovieClip(child).play();
            }
            if(child is DisplayObjectContainer)
            {
               this.RecurPlay(child as DisplayObjectContainer);
            }
         }
      }
      
      public function get tf() : TextField
      {
         return TextField(this.centerMc.getChildByName("txt"));
      }
      
      public function get centerMc() : MovieClip
      {
         return MovieClip(this._loadingScreen.getChildByName("centerMc"));
      }
      
      public function SetText(txt:String) : void
      {
         this.tf.text = txt;
         this.RecurPlay(this.icon);
      }
      
      private function onUpdate(event:Event) : void
      {
         this._loadingScreen.alpha += this._show ? 0.1 : -0.1;
         this._loadingScreen.alpha = Math.min(1,Math.max(0,this._loadingScreen.alpha));
         this._loadingScreen.visible = this._show || this._loadingScreen.alpha > 0;
      }
      
      public function Destroy() : void
      {
         this._loadingScreen.removeEventListener(Event.ADDED_TO_STAGE,this.onAdded);
         this._loadingScreen.removeEventListener(Event.ENTER_FRAME,this.onUpdate);
         this._loadingScreen.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemove);
         if(this._loadingScreen.parent != null)
         {
            this._loadingScreen.parent.removeChild(this._loadingScreen);
         }
         this._loadingScreen = null;
         this._parent = null;
      }
      
      public function Show(parent:MovieClip, w:int = 700, h:int = 550) : void
      {
         this._parent = parent;
         parent.addChild(this._loadingScreen);
         this.back.width = w;
         this.back.height = h;
         this.centerMc.x = w * 0.5;
         this.centerMc.y = h * 0.5;
         this.RecurPlay(this.icon);
         this._loadingScreen.alpha = 0;
         this._show = true;
      }
   }
}

