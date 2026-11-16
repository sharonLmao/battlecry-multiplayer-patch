package com.lachhhEngine.initializers.preloader.berzerk
{
   import com.lachhhEngine.initializers.preloader.IPreloader;
   import com.lachhhEngine.io.Callback;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.text.TextField;
   
   public class NoBsPreloader extends MovieClip implements IPreloader
   {
      
      private var _callback:Callback;
      
      private var _tf:TextField = new TextField();
      
      private var _prct:Number = 0;
      
      public function NoBsPreloader()
      {
         super();
      }
      
      public function get visual() : MovieClip
      {
         return this;
      }
      
      public function get callback() : Callback
      {
         return this._callback;
      }
      
      private function Update(e:Event) : void
      {
         this._prct = root.loaderInfo.bytesLoaded / root.loaderInfo.bytesTotal;
         graphics.clear();
         graphics.beginFill(16711680);
         graphics.drawRect(200,500,300 * this._prct,20);
         graphics.endFill();
         this._tf.x = 530;
         this._tf.y = 500;
         this._tf.textColor = 0;
         this._tf.text = Math.floor(this._prct * 100) + "";
         if(this._prct >= 1)
         {
            this.EndPreloader();
         }
      }
      
      public function set callback(callback:Callback) : void
      {
         this._callback = callback;
      }
      
      public function Init() : void
      {
         addEventListener(Event.ENTER_FRAME,this.Update);
         addChild(this._tf);
      }
      
      private function EndPreloader() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.Update);
         this._callback.DoCallback();
         this._callback = null;
      }
   }
}

