package playerio
{
   import flash.display.Loader;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   
   public final class PlayerIO
   {
      
      private static var apiError:PlayerIOError;
      
      private static var wrapper:Loader;
      
      private static var queue:Array = [];
      
      private static var wo:Object = {};
      
      public function PlayerIO()
      {
         super();
         throw new Error("You cannot create an instance of the PlayerIO class!");
      }
      
      private static function emptyQueue(e:Event = null) : void
      {
         while(queue.length)
         {
            queue.shift()();
         }
      }
      
      public static function showLogo(stage:Stage, align:String) : void
      {
         proxy("showLogo",arguments);
      }
      
      public static function connect(stage:Stage, gameid:String, connectionid:String, userid:String, auth:String, partnerId:String, callback:Function, errorhandler:Function = null) : void
      {
         proxy("connect",arguments);
      }
      
      private static function throwError(error:PlayerIOError, target:Function) : void
      {
         if(target != null)
         {
            target(error);
            return;
         }
         throw PlayerIOError;
      }
      
      private static function loadAPI() : void
      {
         var loader:URLLoader = null;
         wrapper = new Loader();
         loader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.BINARY;
         loader.addEventListener(Event.COMPLETE,function(e:Event):void
         {
            wrapper.contentLoaderInfo.addEventListener(Event.COMPLETE,emptyQueue);
            wrapper.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,handleLoadError);
            wrapper.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,handleLoadError);
            wrapper.loadBytes(loader.data,new LoaderContext(false,ApplicationDomain.currentDomain));
            wo.wrapper = wrapper;
         });
         loader.addEventListener(IOErrorEvent.IO_ERROR,handleLoadError);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,handleLoadError);
         loader.load(new URLRequest("http://api.playerio.com/flashbridge/1"));
      }
      
      private static function proxy(target:String, args:Object) : void
      {
         var api:* = undefined;
         var path:Array = null;
         if(apiError)
         {
            throwError(apiError,args[args.callee.length - 1]);
         }
         else if(Boolean(wrapper) && Boolean(wrapper.content))
         {
            try
            {
               api = wrapper.content;
               path = target.split(".");
               while(path.length > 1)
               {
                  api = api[path.shift()];
               }
               api[path[0]].apply(null,args);
            }
            catch(e:Error)
            {
               throwError(new PlayerIOError(e.message,e.errorID),args[args.callee.length - 1]);
            }
         }
         else
         {
            queue.push(function():void
            {
               args.callee.apply(null,args);
            });
         }
         if(!wrapper)
         {
            loadAPI();
         }
      }
      
      private static function handleLoadError(e:Event = null) : void
      {
         apiError = new PlayerIOError("Unable to connect to the API due to " + e.type + ". Please verify that your internet connection is working!",0);
         emptyQueue();
      }
      
      public static function get quickConnect() : QuickConnect
      {
         return new QuickConnect(proxy);
      }
      
      public static function gameFS(gameId:String) : GameFS
      {
         return new SimpleGameFS(gameId,wo);
      }
   }
}

