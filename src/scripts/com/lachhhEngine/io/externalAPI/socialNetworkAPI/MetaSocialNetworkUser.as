package com.lachhhEngine.io.externalAPI.socialNetworkAPI
{
   import com.lachhhEngine.io.Callback;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   
   public class MetaSocialNetworkUser
   {
      
      private var _img:Bitmap;
      
      private var _loadCallback:Callback;
      
      private var _imageLoader:URLLoader = new URLLoader();
      
      private var _uid:String;
      
      private var _name:String;
      
      public function MetaSocialNetworkUser(uid:String, name:String)
      {
         super();
         this._uid = uid;
         this._name = name;
      }
      
      private function imageLoaded(event:Event) : void
      {
         var loader:URLLoader = event.target as URLLoader;
         var loaderBmp:Loader = new Loader();
         loaderBmp.loadBytes(loader.data);
         loaderBmp.contentLoaderInfo.addEventListener(Event.COMPLETE,this.imgBmpLoaded);
      }
      
      private function imgBmpLoaded(event:Event) : void
      {
         try
         {
            this._img = Bitmap(event.target.content);
            if(this._img)
            {
               this._img.smoothing = true;
            }
            if(this._loadCallback)
            {
               this._loadCallback.DoCallback();
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get imgData() : BitmapData
      {
         if(!this._img)
         {
            return null;
         }
         return this._img.bitmapData;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function LoadImage(urlrequest:URLRequest, c:Callback = null) : void
      {
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.BINARY;
         loader.addEventListener(Event.COMPLETE,this.imageLoaded);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.imageLoadFail);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.imageLoadFail);
         loader.load(urlrequest);
         this._loadCallback = c;
      }
      
      public function get imgLoaded() : Boolean
      {
         return this._img != null;
      }
      
      private function imageLoadFail(event:IOErrorEvent) : void
      {
         trace("MetaSocialNetworkUser Load Image Failed : " + this._uid);
      }
   }
}

