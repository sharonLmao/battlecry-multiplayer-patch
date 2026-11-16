package playerio
{
   import flash.display.Stage;
   
   public class QuickConnect
   {
      
      private var _proxy:Function;
      
      public function QuickConnect(proxy:Function)
      {
         super();
         this._proxy = proxy;
      }
      
      public function facebookOAuthConnectPopup(stage:Stage, gameId:String, window:String, permissions:Array, partnerId:String = "", callback:Function = null, errorHandler:Function = null) : void
      {
         this._proxy("quickConnect.facebookOAuthConnectPopup",arguments);
      }
      
      public function facebookConnect(stage:Stage, gameId:String, uid:String, sessionKey:String, partnerId:String = "", callback:Function = null, errorHandler:Function = null) : void
      {
         this._proxy("quickConnect.facebookConnect",arguments);
      }
      
      public function facebookConnectPopup(stage:Stage, gameId:String, window:String, permissions:Array, partnerId:String = "", callback:Function = null, errorHandler:Function = null) : void
      {
         this._proxy("quickConnect.facebookConnectPopup",arguments);
      }
      
      public function simpleRecoverPassword(gameId:String, usernameOrEmail:String, callback:Function = null, errorHandler:Function = null) : void
      {
         this._proxy("quickConnect.simpleRecoverPassword",arguments);
      }
      
      public function kongregateConnect(stage:Stage, gameid:String, userid:String, gameauthtoken:String, callback:Function = null, errorhandler:Function = null) : void
      {
         this._proxy("quickConnect.kongregateConnect",arguments);
      }
      
      public function simpleRegister(stage:Stage, gameid:String, username:String, password:String, email:String, captchaKey:String = "", captchaValue:String = "", extraData:Object = null, partnerId:String = "", callback:Function = null, errorhandler:Function = null) : void
      {
         this._proxy("quickConnect.simpleRegister",arguments);
      }
      
      public function simpleGetCaptcha(gameId:String, width:int, height:int, callback:Function = null, errorHandler:Function = null) : void
      {
         this._proxy("quickConnect.simpleGetCaptcha",arguments);
      }
      
      public function simpleConnect(stage:Stage, gameid:String, usernameOrEmail:String, password:String, callback:Function = null, errorhandler:Function = null) : void
      {
         this._proxy("quickConnect.simpleConnect",arguments);
      }
      
      public function facebookOAuthConnect(stage:Stage, gameId:String, accessToken:String, partnerId:String = "", callback:Function = null, errorHandler:Function = null) : void
      {
         this._proxy("quickConnect.facebookOAuthConnect",arguments);
      }
   }
}

