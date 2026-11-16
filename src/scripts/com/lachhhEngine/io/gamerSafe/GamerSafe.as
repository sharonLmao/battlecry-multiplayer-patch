package com.lachhhEngine.io.gamerSafe
{
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.system.Security;
   import flash.utils.ByteArray;
   
   public class GamerSafe extends Sprite
   {
      
      public static const version:String = "01";
      
      protected static var _instance:GamerSafe = null;
      
      public static const EVT_NETWORKING_ERROR:String = "networking_error";
      
      public static const EVT_ACCOUNT_CHANGE:String = "account_change";
      
      public static const EVT_LOGIN:String = "login";
      
      public static const EVT_LOGIN_FAILED:String = "login_failed";
      
      public static const EVT_AUTO_LOGIN_FAILED:String = "auto_login_failed";
      
      public static const EVT_BEGIN_SESSION:String = "begin_session";
      
      public static const EVT_BEGIN_SESSION_FAILED:String = "begin_session_failed";
      
      public static const EVT_ITEM_PURCHASE:String = "item_purchase";
      
      public static const EVT_ITEM_PURCHASE_CANCELED:String = "item_purchase_canceled";
      
      public static const EVT_ITEM_PURCHASE_FAILED:String = "item_purchase_failed";
      
      public static const EVT_SCOREBOARD_ENTRIES_RECEIVED:String = "scoreboard_entries_received";
      
      public static const EVT_SCOREBOARD_ENTRIES_ERROR:String = "scoreboard_entries_error";
      
      public static const EVT_SCOREBOARD_ENTRY_SUBMITTED:String = "scoreboard_entry_submitted";
      
      public static const EVT_OTHER_GAME_PROFILE_RECEIVED:String = "other_game_profile_received";
      
      public static const EVT_UNREGISTERED_NAME:String = "unregistered_name";
      
      public static const EVT_CONSUMPTION_COMPLETED:String = "consumption_completed";
      
      public static const EVT_REGISTRATION_FORM_CLOSED:String = "register_close";
      
      public static const EVT_LOGIN_FORM_CLOSED:String = "login_close";
      
      public static const EVT_BRIDGE_SUCCESS:String = "bridge_success";
      
      public static const EVT_BRIDGE_ERROR:String = "bridge_error";
      
      public static const EVT_PAYMENT_PANEL_SHOWN:String = "payment_panel_shown";
      
      public static const EVT_PAYMENT_PANEL_HIDDEN:String = "payment_panel_hidden";
      
      public static const EVT_USERNAME_FETCHED:String = "username_fetched";
      
      public static const EVT_AVATAR_FETCHED:String = "avatar_fetched";
      
      public static const EVT_INUSE_STARTED:String = "inUseStarted";
      
      public static const EVT_INUSE_ENDED:String = "inUseEnded";
      
      public static const EVT_INUSE_CHANGED:String = "inUseChanged";
      
      public static const EVT_STATUSBAR_MOUSEOVER:String = "statusbar_mouseover";
      
      public static const EVT_STATUSBAR_MOUSEOUT:String = "statusbar_mouseout";
      
      public static const EVT_LEVELVAULT_LEVEL_CREATED:String = "level_created";
      
      public static const EVT_LEVELVAULT_LEVEL_EDITED:String = "level_edited";
      
      public static const EVT_LEVELVAULT_LEVEL_NUMERICS_SET:String = "level_numerics_set";
      
      public static const EVT_LEVELVAULT_LEVEL_STRINGS_SET:String = "level_strings_set";
      
      public static const EVT_LEVELVAULT_LEVEL_RATED:String = "level_rated";
      
      public static const EVT_LEVELVAULT_LEVEL_NUMERICS_INCREMENTED:String = "level_numerics_incremented";
      
      public static const EVT_LEVELVAULT_LEVEL_FLAGGED:String = "level_flagged";
      
      public static const EVT_LEVELVAULT_LEVEL_DELETED:String = "level_deleted";
      
      public static const EVT_LEVELVAULT_GOT_SINGLE_LEVEL:String = "got_level";
      
      public static const EVT_LEVELVAULT_GOT_LEVELS:String = "got_levels";
      
      public static const EVT_LEVELVAULT_GOT_NUM_LEVELS:String = "got_num_levels";
      
      public static const EVT_LEVELVAULT_GOT_LEVEL_RANKING:String = "got_level_ranking";
      
      public static const EVT_LEVELVAULT_GOT_INDEX:String = "got_index";
      
      public static const EVT_FACEBOOK_CONNECTED:String = "fb_connected";
      
      public static const EVT_FACEBOOK_LOGIN_FAILED:String = "fb_login_failed";
      
      public static const EVT_FACEBOOK_GOT_USER:String = "fb_got_user";
      
      public static const EVT_FACEBOOK_GOT_FRIENDS:String = "fb_got_friends";
      
      public static const EVT_FACEBOOK_WALL_POST_SUCCESS:String = "fb_wallpost_success";
      
      public static const EVT_FACEBOOK_WALL_POST_FAILED:String = "fb_wallpost_fail";
      
      public static const EVT_FACEBOOK_PROMPT_CLOSED:String = "fb_prompt_closed";
      
      public static const EVT_TWITTER_CONNECTED:String = "twit_connected";
      
      public static const EVT_TWITTER_LOGIN_FAILED:String = "twit_login_failed";
      
      public static const EVT_TWITTER_GOT_USER:String = "twit_got_user";
      
      public static const EVT_TWITTER_POST_SUCCESS:String = "twit_post_success";
      
      public static const EVT_TWITTER_POST_FAILED:String = "twit_post_fail";
      
      private var _evt_onScoreSubmitted:Function = null;
      
      private var _stageHeight:Number = 400;
      
      private var _evt_onLevelVaultLevelRated:Function = null;
      
      private var _evt_onTwitterPostFailed:Function = null;
      
      private var _evt_onOtherGameProfileReceived:Function = null;
      
      private var _evt_onLevelVaultLevelEdited:Function = null;
      
      private var _levelVaultTempAttributes:Object;
      
      private var _evt_onPaymentPanelShown:Function = null;
      
      private var _storedPasscode:String = "G11b0b69c415aa6b59ba31a0a39bcc8447aaf5cfe4:1303154416";
      
      private var _evt_accountChange:Function = null;
      
      private var _evt_onRegistrationFormClosed:Function = null;
      
      private var _evt_apiReady:Function = null;
      
      private var _evt_itemPurchase:Function = null;
      
      private var _context:LoaderContext;
      
      private var _evt_onLevelVaultLevelStringsSet:Function = null;
      
      private var _evt_login:Function = null;
      
      private var _evt_onScoreboardError:Function = null;
      
      private var _evt_onBridgeError:Function = null;
      
      private var _evt_onTwitterPromptClosed:Function = null;
      
      private var _evt_onTwitterConnected:Function = null;
      
      private var _levelVaultLastError:String = "";
      
      private var _evt_beginSession:Function = null;
      
      private var _gamerSafe:Object = null;
      
      private var _evt_onLevelVaultLevelNumericsSet:Function = null;
      
      private var _evt_confYes:Function = null;
      
      private var _evt_onTwitterLoginFailed:Function = null;
      
      private var _status:String = "Loading";
      
      private var _evt_onLevelVaultGotNumLevels:Function = null;
      
      private var _inUse:Boolean = false;
      
      private var _loaded:Boolean = false;
      
      private var _evt_onFacebookLoginFailed:Function = null;
      
      private var _evt_useChanged:Function = null;
      
      private var _loader:Loader;
      
      private var _request:URLRequest;
      
      private var _evt_onLoginFormClosed:Function = null;
      
      private var _referrer:String = "";
      
      private var _evt_itemPurchaseFailed:Function = null;
      
      private var _evt_onStatusBarMouseOver:Function = null;
      
      private var _tmpAchievementSkin:Object;
      
      private var _tmpSkin:Object;
      
      private var _evt_onTwitterGotUser:Function = null;
      
      private var _stage:Stage;
      
      private var _evt_onUnregisteredName:Function = null;
      
      private var _evt_onLevelVaultGotLevel:Function = null;
      
      private var _evt_onLevelVaultGotLevelRanking:Function = null;
      
      private var _evt_itemPurchaseCanceled:Function = null;
      
      private var _evt_useEnded:Function = null;
      
      private var _evt_onFacebookWallPostFailed:Function = null;
      
      private var _evt_networkingError:Function = null;
      
      private var _evt_loginFailed:Function = null;
      
      private var _evt_onLevelVaultLevelCreated:Function = null;
      
      private var _evt_onLevelVaultGotLevels:Function = null;
      
      private var _evt_onStatusBarMouseOut:Function = null;
      
      private var _evt_onFacebookGotLocalUser:Function = null;
      
      private var _evt_onScoreboardRecieved:Function = null;
      
      private var _evt_autoLoginFailed:Function = null;
      
      private var _evt_onConsumptionCompleted:Function = null;
      
      private var _evt_onLevelVaultLevelNumericsIncremented:Function = null;
      
      private var _evt_useStarted:Function = null;
      
      private var _stageWidth:Number = 550;
      
      private var _evt_onFacebookConnected:Function = null;
      
      private var _evt_onFacebookWallPostSuccess:Function = null;
      
      private var _evt_beginSessionFailed:Function = null;
      
      private var _evt_onFacebookGotFriends:Function = null;
      
      private var _evt_onTwitterPostSuccess:Function = null;
      
      private var _evt_onLevelVaultGotIndex:Function = null;
      
      private var _dialogsOpen:uint = 0;
      
      private var _storedHashseed:String = "eeb86caec26ec616d294ee14cc1143a807981de1";
      
      private var _evt_onPaymentPanelHidden:Function = null;
      
      private var _evt_confNo:Function = null;
      
      private var _evt_onBridgeSuccess:Function = null;
      
      private var _evt_onLevelVaultLevelDeleted:Function = null;
      
      private var _evt_onFacebookPromptClosed:Function = null;
      
      private var _evt_onLevelVaultLevelFlagged:Function = null;
      
      private var _evt_onLevelVaultLevelAttributesChanged:Function = null;
      
      public function GamerSafe(parent:*, passcode:String = null, hashseed:String = null, isAir:Boolean = false)
      {
         this._tmpSkin = {};
         this._tmpAchievementSkin = {};
         this._levelVaultTempAttributes = {};
         this._loader = new Loader();
         this._context = new LoaderContext(true);
         this._request = new URLRequest("http://components.gamersafe.com/GamerSafe." + version + ".swf");
         super();
         if(_instance == null)
         {
            _instance = this;
            if(passcode != null)
            {
               this._storedPasscode = passcode;
            }
            if(hashseed != null)
            {
               this._storedHashseed = hashseed;
            }
            if(!isAir)
            {
               Security.allowDomain("*");
               Security.allowInsecureDomain("*");
               this._context.applicationDomain = ApplicationDomain.currentDomain;
               this._status = "Downloading";
               try
               {
                  this._loader.load(this._request,this._context);
                  this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
                  this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadingComplete);
               }
               catch(s:SecurityError)
               {
                  _status = "Failed";
                  trace("Security error - GamerSafe library cannot load");
                  _loader = null;
               }
            }
            else
            {
               this._status = "Downloading";
               try
               {
                  this._loader.load(this._request,this._context);
                  this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
                  this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadingCompleteAir);
               }
               catch(s:SecurityError)
               {
                  _status = "Failed";
                  trace("Security error - GamerSafe library cannot load");
                  _loader = null;
               }
            }
            addEventListener(Event.ADDED_TO_STAGE,this.setupStage);
            if(parent is Sprite || parent is MovieClip || parent is Stage)
            {
               parent.addChild(this);
            }
            else
            {
               trace("Incompatible parent!");
            }
            return;
         }
         trace("GamerSafe: Instance Error: The GamerSafe class is a singleton and should only be constructed once. Use Gamersafe.instance instead.");
      }
      
      public static function get api() : GamerSafe
      {
         if(_instance == null)
         {
            trace("GamerSafe: Instance Error: Attempted to get instance before initial construction.");
            return null;
         }
         return _instance;
      }
      
      public static function get apiLoaded() : Boolean
      {
         return _instance != null;
      }
      
      public function set onFacebookLoginFailed(func:Function) : void
      {
         this._evt_onFacebookLoginFailed = func;
      }
      
      public function get loaded() : Boolean
      {
         return this._loaded;
      }
      
      public function facebookConfigureAttachment(name:String, caption:String = null, description:String = null, link:String = null, picture:String = null) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.facebookConfigureAttachment(name,caption,description,link,picture);
      }
      
      public function levelVaultRegisterPersistentErrorCallback(callback:Function, ... args) : void
      {
         var i:* = undefined;
         if(this._gamerSafe == null)
         {
            trace("GamerSafe is not ready to register the Persistent Error Callback! Please wait for BeginSession.");
            return;
         }
         var a:Array = [];
         a.push(callback);
         for each(i in args)
         {
            a.push(i);
         }
         (this._gamerSafe.levelVaultRegisterPersistentErrorCallback as Function).apply(this,a);
      }
      
      public function levelVaultGetLastNumLevels() : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetLastNumLevels();
      }
      
      public function levelVaultRegisterErrorCallback(callback:Function, ... args) : void
      {
         var i:* = undefined;
         if(this._gamerSafe == null)
         {
            trace("GamerSafe is not ready to register the Error Callback! Please wait for BeginSession.");
            return;
         }
         var a:Array = [];
         a.push(callback);
         for each(i in args)
         {
            a.push(i);
         }
         (this._gamerSafe.levelVaultRegisterErrorCallback as Function).apply(this,a);
      }
      
      public function set highScore(value:Number) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.highScore = value;
      }
      
      private function e_onBeginSessionFailed(e:Event) : void
      {
         if(this._evt_beginSessionFailed != null)
         {
            this._evt_beginSessionFailed();
         }
         dispatchEvent(e);
      }
      
      public function levelVaultIncrementNumerics(levelOrLevelId:*, keys:Array) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultIncrementNumerics(levelOrLevelId,keys);
      }
      
      public function levelVaultGetLastSelectedLevel() : Object
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",null);
         }
         return this._gamerSafe.levelVaultGetLastSelectedLevel();
      }
      
      public function get onOtherGameProfileReceived() : Function
      {
         return this._evt_onOtherGameProfileReceived;
      }
      
      public function get gamerTestMode() : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         return this._gamerSafe.gamerTestMode;
      }
      
      public function levelVaultGetLastRanking() : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",-1);
         }
         return this._gamerSafe.levelVaultGetLastRanking();
      }
      
      public function levelVaultGetLevelsAdvanced(attributes:Array, order:Array, limit:uint = 20, offset:uint = 0) : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetLevelsAdvanced(attributes,order,limit,offset);
      }
      
      public function hasAchievement(achievementId:int) : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         if(this.inSession == false)
         {
            return false;
         }
         return this._gamerSafe.hasAchievement(achievementId);
      }
      
      public function get failed() : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         return this._gamerSafe.failed;
      }
      
      public function get onUseStarted() : Function
      {
         return this._evt_useStarted;
      }
      
      private function e_onOtherGameProfileReceived(e:Event) : void
      {
         if(this._evt_onOtherGameProfileReceived != null)
         {
            this._evt_onOtherGameProfileReceived();
         }
         dispatchEvent(e);
      }
      
      private function e_onRegistrationFormClosed(e:Event) : void
      {
         if(this._evt_onRegistrationFormClosed != null)
         {
            this._evt_onRegistrationFormClosed();
         }
         dispatchEvent(e);
      }
      
      public function get onTwitterGotUser() : Function
      {
         return this._evt_onTwitterGotUser;
      }
      
      public function facebookGetPicture(uid:String = "me") : URLRequest
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.facebookGetPicture(uid);
      }
      
      public function showStatusBar(configuration:Object = null) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.showStatusBar(configuration);
      }
      
      private function e_onLevelVaultLevelStringsSet(e:Event) : void
      {
         if(this._evt_onLevelVaultLevelStringsSet != null)
         {
            this._evt_onLevelVaultLevelStringsSet();
         }
         dispatchEvent(e);
      }
      
      private function e_onBeginSession(e:Event) : void
      {
         if(this._evt_beginSession != null)
         {
            this._evt_beginSession();
         }
         dispatchEvent(e);
      }
      
      public function closeItemInterface() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.closeItemInterface();
      }
      
      public function get latestItemConsumptionInfo() : Object
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.getLatestItemConsumptionInfo();
      }
      
      private function e_onLevelVaultLevelNumericsIncremented(e:Event) : void
      {
         if(this._evt_onLevelVaultLevelNumericsIncremented != null)
         {
            this._evt_onLevelVaultLevelNumericsIncremented();
         }
         dispatchEvent(e);
      }
      
      public function setAchievementStyle(name:String, value:*) : void
      {
         if(this._loaded == false)
         {
            this._tmpAchievementSkin[name] = value;
            return;
         }
         var o:Object = new Object();
         o[name] = value;
         this._gamerSafe.setAchievementSkin(o);
      }
      
      public function set onOtherGameProfileReceived(func:Function) : void
      {
         this._evt_onOtherGameProfileReceived = func;
      }
      
      public function getAvatar(uid:uint) : String
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.getAvatar(uid);
      }
      
      public function set onStatusBarMouseOut(func:Function) : void
      {
         this._evt_onStatusBarMouseOut = func;
      }
      
      private function e_onLevelVaultLevelEdited(e:Event) : void
      {
         if(this._evt_onLevelVaultLevelEdited != null)
         {
            this._evt_onLevelVaultLevelEdited();
         }
         dispatchEvent(e);
      }
      
      public function getSavedGame(idx:int = 0) : String
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.getSavedGame(idx);
      }
      
      private function e_onTwitterLoginFailed(e:Event) : void
      {
         if(this._evt_onTwitterLoginFailed != null)
         {
            this._evt_onTwitterLoginFailed();
         }
         dispatchEvent(e);
      }
      
      public function levelVaultFetchLevelByID(levelId:int) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultFetchLevelByID(levelId);
      }
      
      public function set onUseStarted(func:Function) : void
      {
         this._evt_useStarted = func;
      }
      
      public function get onUseEnded() : Function
      {
         return this._evt_useEnded;
      }
      
      public function set onLevelVaultLevelEdited(func:Function) : void
      {
         this._evt_onLevelVaultLevelEdited = func;
      }
      
      public function set onTwitterGotUser(func:Function) : void
      {
         this._evt_onTwitterGotUser = func;
      }
      
      public function get onBeginSessionFailed() : Function
      {
         return this._evt_beginSessionFailed;
      }
      
      public function get levelVaultLastSelectedLevelsReceipt() : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultLastSelectedLevelsReceipt;
      }
      
      private function get levelVaultEventObject() : EventDispatcher
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",null);
         }
         return this._gamerSafe.levelVaultEventObject;
      }
      
      public function levelVaultGetIndexAdvanced(attributes:Array, order:Array, limit:uint = 20, offset:uint = 0) : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetIndexAdvanced(attributes,order,limit,offset);
      }
      
      public function set onScoreSubmitted(func:Function) : void
      {
         this._evt_onScoreSubmitted = func;
      }
      
      private function e_onUseEnded(e:*) : void
      {
         --this._dialogsOpen;
         if(this._dialogsOpen > 0)
         {
            return;
         }
         this._inUse = false;
         if(this._evt_useChanged != null)
         {
            this._evt_useChanged();
         }
         if(this._evt_useEnded != null)
         {
            this._evt_useEnded();
         }
         dispatchEvent(new Event(EVT_INUSE_ENDED));
         dispatchEvent(new Event(EVT_INUSE_CHANGED));
      }
      
      public function showFriendsList(x:int, y:int, width:int = 400, height:int = 350) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.facebookShowFriendsList(x,y,width,height);
      }
      
      public function get onBridgeSuccess() : Function
      {
         return this._evt_onBridgeSuccess;
      }
      
      public function get onAccountChange() : Function
      {
         return this._evt_accountChange;
      }
      
      public function get onBridgeError() : Function
      {
         return this._evt_onBridgeError;
      }
      
      private function e_onConfirmNo(e:Event) : void
      {
         if(this._evt_confNo != null)
         {
            this._evt_confNo();
         }
         dispatchEvent(new Event("confirmedNo"));
      }
      
      public function hideShopButton(disable:Boolean = true) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.hideShopButton(disable);
      }
      
      public function set onLevelVaultGotNumLevels(func:Function) : void
      {
         this._evt_onLevelVaultGotNumLevels = func;
      }
      
      public function get onLevelVaultLevelNumericsIncremented() : Function
      {
         return this._evt_onLevelVaultLevelNumericsIncremented;
      }
      
      public function get onItemPurchase() : Function
      {
         return this._evt_itemPurchase;
      }
      
      public function set onScoreboardRecieved(func:Function) : void
      {
         this._evt_onScoreboardRecieved = func;
      }
      
      public function levelVaultSetExpiringStringAttribute(levelOrLevelId:*, key:String, value:String, expires:String) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this.levelVaultSetExpiringStringAttributes(levelOrLevelId,[key],[value],[expires]);
      }
      
      private function e_onBridgeSuccess(e:Event) : void
      {
         if(this._evt_onBridgeSuccess != null)
         {
            this._evt_onBridgeSuccess();
         }
         dispatchEvent(e);
      }
      
      public function set onFacebookPromptClosed(func:Function) : void
      {
         this._evt_onFacebookPromptClosed = func;
      }
      
      public function bestowAchievement(achievementId:uint) : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         this._gamerSafe.bestowAchievement(achievementId);
         return true;
      }
      
      public function fetchUsernames(uids:Array = null) : Array
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.fetchUsernames(uids);
      }
      
      private function e_onAccountChange(e:Event) : void
      {
         if(this._evt_accountChange != null)
         {
            this._evt_accountChange();
         }
         dispatchEvent(e);
      }
      
      public function levelVaultGetLevelsByDateCreated(start_date:String, end_date:String, ascending:Boolean = true, limit:uint = 20, offset:uint = 0) : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetLevelsByDateCreated(start_date,end_date,ascending,limit,offset);
      }
      
      public function hasItem(itemId:int) : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         if(this.inSession == false)
         {
            return false;
         }
         return this._gamerSafe.hasItem(itemId);
      }
      
      public function get onLogin() : Function
      {
         return this._evt_login;
      }
      
      public function get levelVaultLastEditedLevelID() : uint
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetLastEditedLevelID();
      }
      
      public function setSavedGame(save:String, idx:int = 0) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.setSavedGame(save,idx);
      }
      
      public function get onTwitterLoginFailed() : Function
      {
         return this._evt_onTwitterLoginFailed;
      }
      
      public function levelVaultSetStringAttributes(levelOrLevelId:*, keys:Array, data:Array) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultSetStringAttributes(levelOrLevelId,keys,data);
      }
      
      public function get username() : String
      {
         if(this._loaded == false)
         {
            return "GamerSafe";
         }
         return this._gamerSafe.username;
      }
      
      public function levelVaultSetExpiringNumericAttribute(levelOrLevelId:*, key:String, value:Number, expires:String) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this.levelVaultSetExpiringNumericAttributes(levelOrLevelId,[key],[value],[expires]);
      }
      
      public function get onLevelVaultLevelDeleted() : Function
      {
         return this._evt_onLevelVaultLevelDeleted;
      }
      
      public function set onUseEnded(func:Function) : void
      {
         this._evt_useEnded = func;
      }
      
      private function e_onConfirmYes(e:Event) : void
      {
         if(this._evt_confYes != null)
         {
            this._evt_confYes();
         }
         dispatchEvent(new Event("confirmedYes"));
      }
      
      public function levelVaultSetAttributes(levelOrLevelId:*, attributes:Object) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultSetAttributes(levelOrLevelId,attributes);
      }
      
      private function e_onTwitterGotUser(e:Event) : void
      {
         if(this._evt_onTwitterGotUser != null)
         {
            this._evt_onTwitterGotUser();
         }
         dispatchEvent(e);
      }
      
      public function get twitterUser() : XML
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.twitterUser;
      }
      
      private function e_onTwitterPostFailed(e:Event) : void
      {
         if(this._evt_onTwitterPostFailed != null)
         {
            this._evt_onTwitterPostFailed();
         }
         dispatchEvent(e);
      }
      
      public function set onItemPurchaseCanceled(func:Function) : void
      {
         this._evt_itemPurchaseCanceled = func;
      }
      
      public function levelVaultGetLevelsByRating(min_rating:Number, max_rating:Number, ascending:Boolean = true, limit:uint = 20, offset:uint = 0) : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetLevelsByRating(min_rating,max_rating,ascending,limit,offset);
      }
      
      public function levelVaultSwitchGame(passcode:String = "") : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",null);
         }
         return this._gamerSafe.levelVaultSwitchGame(passcode);
      }
      
      private function e_onLevelVaultGotNumLevels(e:Event) : void
      {
         if(this._evt_onLevelVaultGotNumLevels != null)
         {
            this._evt_onLevelVaultGotNumLevels();
         }
         dispatchEvent(e);
      }
      
      public function set onUseChanged(func:Function) : void
      {
         this._evt_useChanged = func;
      }
      
      public function requestOtherGameProfile(otherGamePasscode:String) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.requestOtherGameProfile(otherGamePasscode);
      }
      
      private function e_onLevelVaultLevelAttributesChanged(e:Event) : void
      {
         if(this._evt_onLevelVaultLevelAttributesChanged != null)
         {
            this._evt_onLevelVaultLevelAttributesChanged();
         }
         dispatchEvent(e);
      }
      
      public function showFriendsPanel(width:int = 400, height:int = 350) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.facebookShowFriendsPanel(width,height);
      }
      
      public function closeShop() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.closeShop();
      }
      
      public function get onFacebookGotLocalUser() : Function
      {
         return this._evt_onFacebookGotLocalUser;
      }
      
      public function set onBeginSessionFailed(func:Function) : void
      {
         this._evt_beginSessionFailed = func;
      }
      
      public function get dialogsOpen() : uint
      {
         return this._dialogsOpen;
      }
      
      public function levelVaultRateLevel(levelOrLevelId:*, rating:uint) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultRateLevel(levelOrLevelId,rating);
      }
      
      public function get onLevelVaultLevelStringsSet() : Function
      {
         return this._evt_onLevelVaultLevelStringsSet;
      }
      
      private function e_onPaymentPanelShown(e:Event) : void
      {
         if(this._evt_onPaymentPanelShown != null)
         {
            this._evt_onPaymentPanelShown();
         }
         dispatchEvent(e);
      }
      
      private function e_onUnregisteredName(e:Event) : void
      {
         if(this._evt_onUnregisteredName != null)
         {
            this._evt_onUnregisteredName();
         }
         dispatchEvent(e);
      }
      
      public function set onLevelVaultLevelRated(func:Function) : void
      {
         this._evt_onLevelVaultLevelRated = func;
      }
      
      public function levelVaultCreateLevelFromObject(level:Object) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultCreateLevelFromObject(level);
      }
      
      public function get onBeginSession() : Function
      {
         return this._evt_beginSession;
      }
      
      public function consumeItem(itemId:int, numToConsume:int) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.consumeItem(itemId,numToConsume);
      }
      
      public function hideFriendsList() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.facebookHideFriendsList();
      }
      
      public function get levelVaultReady() : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultReady;
      }
      
      public function levelVaultRegisterCallback(callback:Function, ... args) : void
      {
         var i:* = undefined;
         if(this._gamerSafe == null)
         {
            trace("GamerSafe is not ready to register the LV Callback! Please wait for BeginSession.");
            return;
         }
         var a:Array = [];
         a.push(callback);
         for each(i in args)
         {
            a.push(i);
         }
         (this._gamerSafe.levelVaultRegisterCallback as Function).apply(this,a);
      }
      
      public function get signupUrl() : String
      {
         if(this._loaded == false)
         {
            return "";
         }
         return this._gamerSafe.signupUrl;
      }
      
      private function e_onStatusBarMouseOver(e:Event) : void
      {
         if(this._evt_onStatusBarMouseOver != null)
         {
            this._evt_onStatusBarMouseOver();
         }
         dispatchEvent(e);
      }
      
      public function get onLevelVaultLevelFlagged() : Function
      {
         return this._evt_onLevelVaultLevelFlagged;
      }
      
      public function set onAccountChange(func:Function) : void
      {
         this._evt_accountChange = func;
      }
      
      public function set onBridgeSuccess(func:Function) : void
      {
         this._evt_onBridgeSuccess = func;
      }
      
      public function set onBridgeError(func:Function) : void
      {
         this._evt_onBridgeError = func;
      }
      
      public function get levelVaultShareCookie() : String
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",null);
         }
         return this._gamerSafe.levelVaultShareCookie;
      }
      
      public function set onFacebookWallPostSuccess(func:Function) : void
      {
         this._evt_onFacebookWallPostSuccess = func;
      }
      
      public function get userAuthKey() : String
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.userAuthKey;
      }
      
      public function levelVaultGetNumLevelsAdvanced(attributes:Array) : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetNumLevelsAdvanced(attributes);
      }
      
      private function e_onTwitterPromptClosed(e:Event) : void
      {
         if(this._evt_onTwitterPromptClosed != null)
         {
            this._evt_onTwitterPromptClosed();
         }
         dispatchEvent(e);
      }
      
      protected function levelVaultFail(reason:String, returnValue:* = false) : *
      {
         trace("[ LevelVault Error:",reason,"]");
         this._levelVaultLastError = reason;
         return returnValue;
      }
      
      public function levelVaultGetLastIndex() : Array
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",[]);
         }
         return this._gamerSafe.levelVaultGetLastIndex();
      }
      
      public function set onApiReady(func:Function) : void
      {
         this._evt_apiReady = func;
      }
      
      public function set onLevelVaultGotLevelRanking(func:Function) : void
      {
         this._evt_onLevelVaultGotLevelRanking = func;
      }
      
      public function levelVaultGetLevelsByDateModified(start_date:String, end_date:String, ascending:Boolean = true, limit:uint = 20, offset:uint = 0) : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetLevelsByDateModified(start_date,end_date,ascending,limit,offset);
      }
      
      public function set onItemPurchase(func:Function) : void
      {
         this._evt_itemPurchase = func;
      }
      
      public function set onLevelVaultLevelNumericsIncremented(func:Function) : void
      {
         this._evt_onLevelVaultLevelNumericsIncremented = func;
      }
      
      private function e_onLevelVaultGotLevel(e:Event) : void
      {
         if(this._evt_onLevelVaultGotLevel != null)
         {
            this._evt_onLevelVaultGotLevel();
         }
         dispatchEvent(e);
      }
      
      public function get onConsumptionCompleted() : Function
      {
         return this._evt_onConsumptionCompleted;
      }
      
      private function e_onLevelVaultLevelNumericsSet(e:Event) : void
      {
         if(this._evt_onLevelVaultLevelNumericsSet != null)
         {
            this._evt_onLevelVaultLevelNumericsSet();
         }
         dispatchEvent(e);
      }
      
      public function get levelVaultLastCreatedLevelID() : uint
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetLastCreatedLevelID();
      }
      
      public function get wantsNewsletter() : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         return this._gamerSafe.wantsNewsletter;
      }
      
      public function levelVaultGetAttributeRanking(value:int, attribute:String, ascending:Boolean = false) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultGetAttributeRanking(value,attribute,ascending);
      }
      
      public function enable() : void
      {
         if(this._status == "Disabled")
         {
            this._status = "Ready";
            this._loaded = true;
         }
      }
      
      public function set onFacebookConnected(func:Function) : void
      {
         this._evt_onFacebookConnected = func;
      }
      
      public function get paymentUrl() : String
      {
         if(this._loaded == false)
         {
            return "";
         }
         return this._gamerSafe.paymentUrl;
      }
      
      public function set partner(partner:String) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.setPartner(partner);
      }
      
      public function logout() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.logout();
      }
      
      public function showFriendsScoreboard(scoreboardId:int = -1) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.showFriendsScoreboard(scoreboardId);
      }
      
      public function set onLogin(func:Function) : void
      {
         this._evt_login = func;
      }
      
      public function get latestScoreboardEntries() : Object
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.getLatestScoreboardEntries();
      }
      
      public function get onStatusBarMouseOver() : Function
      {
         return this._evt_onStatusBarMouseOver;
      }
      
      public function get onConfirmNo() : Function
      {
         return this._evt_confNo;
      }
      
      private function e_onScoreboardError(e:Event) : void
      {
         if(this._evt_onScoreboardError != null)
         {
            this._evt_onScoreboardError();
         }
         dispatchEvent(e);
      }
      
      public function set onTwitterLoginFailed(func:Function) : void
      {
         this._evt_onTwitterLoginFailed = func;
      }
      
      public function get onLoginFailed() : Function
      {
         return this._evt_loginFailed;
      }
      
      public function levelVaultGetLastSelectedLevels() : Array
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",[]);
         }
         return this._gamerSafe.levelVaultGetLastSelectedLevels();
      }
      
      public function get latestItemPurchaseInfo() : Object
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.getLatestItemPurchaseInfo();
      }
      
      public function get onTwitterPromptClosed() : Function
      {
         return this._evt_onTwitterPromptClosed;
      }
      
      private function beginSession(gamePasscode:String, gameHashseed:String) : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         this._gamerSafe.beginSession(gamePasscode,gameHashseed,this._referrer);
         return true;
      }
      
      private function e_onFacebookLoginFailed(e:Event) : void
      {
         if(this._evt_onFacebookLoginFailed != null)
         {
            this._evt_onFacebookLoginFailed();
         }
         dispatchEvent(e);
      }
      
      public function get onRegistrationFormClosed() : Function
      {
         return this._evt_onRegistrationFormClosed;
      }
      
      public function get facebookLocalUser() : Object
      {
         if(this._loaded == false)
         {
            return {};
         }
         return this._gamerSafe.facebookLocalUser;
      }
      
      public function get inSession() : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         return this._gamerSafe.inSession;
      }
      
      private function onLoadingError(e:IOErrorEvent) : void
      {
         this._loaded = false;
         this._status = "Failed";
         trace("Failed to load GamerSafe");
      }
      
      public function twitterPost(text:String, useUrl:Boolean = false) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.twitterPost(text,useUrl);
      }
      
      public function setRegistrationDefaults(defaults:Object) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.setRegisterDefaults(defaults);
      }
      
      public function get gamerXP() : uint
      {
         if(this._loaded == false)
         {
            return 0;
         }
         return this._gamerSafe.gamerXP;
      }
      
      public function levelVaultGetLevelRating(level:Object = null) : Number
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetLevelRating(level);
      }
      
      public function twitterConfigure(hashtag:String, url:String) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.twitterConfigure(hashtag,url);
      }
      
      public function set onItemPurchaseFailed(func:Function) : void
      {
         this._evt_itemPurchaseFailed = func;
      }
      
      public function set onLevelVaultLevelDeleted(func:Function) : void
      {
         this._evt_onLevelVaultLevelDeleted = func;
      }
      
      public function showPublisherPanel(uids:Array = null, width:int = 400, height:int = 350) : void
      {
         var me:Array = null;
         if(this._loaded == false)
         {
            return;
         }
         if(uids != null)
         {
            this._gamerSafe.facebookShowPublisherPanel(uids,width,height);
         }
         else
         {
            me = [{"id":"me"}];
            this._gamerSafe.facebookShowPublisherPanel(me,width,height);
         }
      }
      
      public function get gameAuthCode() : String
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.gameAuthCode;
      }
      
      public function levelVaultGetLevelsByNumericData(key:String, min:Number, max:Number, ascending:Boolean = true, limit:uint = 20, offset:uint = 0) : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetLevelsByNumericData(key,min,max,ascending,limit,offset);
      }
      
      public function levelVaultIncrementNumeric(levelOrLevelId:*, key:String) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultIncrementNumeric(levelOrLevelId,key);
      }
      
      public function get latestOtherGameProfile() : Object
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.getLatestOtherGameProfile();
      }
      
      private function e_onUseStarted(e:*) : void
      {
         ++this._dialogsOpen;
         if(this._dialogsOpen > 1)
         {
            return;
         }
         this._inUse = true;
         if(this._evt_useChanged != null)
         {
            this._evt_useChanged();
         }
         if(this._evt_useStarted != null)
         {
            this._evt_useStarted();
         }
         dispatchEvent(new Event(EVT_INUSE_STARTED));
         dispatchEvent(new Event(EVT_INUSE_CHANGED));
      }
      
      public function get onTwitterConnected() : Function
      {
         return this._evt_onTwitterConnected;
      }
      
      private function e_onLevelVaultGotLevelRanking(e:Event) : void
      {
         if(this._evt_onLevelVaultGotLevelRanking != null)
         {
            this._evt_onLevelVaultGotLevelRanking();
         }
         dispatchEvent(e);
      }
      
      public function get twitterLoggedIn() : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         return this._gamerSafe.twitterLoggedIn;
      }
      
      public function get onLevelVaultGotLevel() : Function
      {
         return this._evt_onLevelVaultGotLevel;
      }
      
      private function levelVaultSetTempAttributes(e:Event) : void
      {
         removeEventListener(GamerSafe.EVT_LEVELVAULT_LEVEL_CREATED,this.levelVaultSetTempAttributes);
         this.levelVaultSetAttributes(this.levelVaultLastCreatedLevelID,this._levelVaultTempAttributes);
         this._levelVaultTempAttributes = {};
      }
      
      public function set onLevelVaultLevelAttributesChanged(func:Function) : void
      {
         this._evt_onLevelVaultLevelAttributesChanged = func;
      }
      
      public function showTwitterPublisher(x:int, y:int, width:int = 400, height:int = 230) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.twitterShowPublisher(x,y,width,height);
      }
      
      public function set onScoreboardError(func:Function) : void
      {
         this._evt_onScoreboardError = func;
      }
      
      public function getSkin() : Object
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.getSkin();
      }
      
      public function set autoLogin(value:Boolean) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.autoLogin = value;
      }
      
      private function e_onScoreboardRecieved(e:Event) : void
      {
         if(this._evt_onScoreboardRecieved != null)
         {
            this._evt_onScoreboardRecieved();
         }
         dispatchEvent(e);
      }
      
      public function levelVaultCreateLevel(levelData:*) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         if(levelData is ByteArray)
         {
            return this.levelVaultCreateLevelFromBytes(levelData);
         }
         return this.levelVaultCreateLevelFromObject(levelData);
      }
      
      public function get onFacebookLoginFailed() : Function
      {
         return this._evt_onFacebookLoginFailed;
      }
      
      public function flashBar() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.flashBar();
      }
      
      public function levelVaultFlagLevel(levelOrLevelId:*) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultFlagLevel(levelOrLevelId);
      }
      
      public function set achievementPopupPosition(point:Point) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.achievementPopupPosition = point;
      }
      
      public function showScoreSubmit(score:Number, extra:String, showAsTime:Boolean = false, scoreboardID:int = -1) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.showScoreSubmitPrompt(score,extra,scoreboardID,showAsTime);
      }
      
      public function set onUnregisteredName(func:Function) : void
      {
         this._evt_onUnregisteredName = func;
      }
      
      public function levelVaultGetNumLevels() : uint
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetNumLevels();
      }
      
      public function hideInterface() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.visible = false;
      }
      
      public function set onFacebookGotFriends(func:Function) : void
      {
         this._evt_onFacebookGotFriends = func;
      }
      
      public function set onFacebookGotLocalUser(func:Function) : void
      {
         this._evt_onFacebookGotLocalUser = func;
      }
      
      public function get highScore() : Number
      {
         if(this._loaded == false)
         {
            return 0;
         }
         if(this.inSession == false)
         {
            return 0;
         }
         return this._gamerSafe.highScore;
      }
      
      public function fetchAvatars(uids:Array = null) : Array
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.fetchAvatars(uids);
      }
      
      public function set onTwitterPostSuccess(func:Function) : void
      {
         this._evt_onTwitterPostSuccess = func;
      }
      
      public function set onLevelVaultGotIndex(func:Function) : void
      {
         this._evt_onLevelVaultGotIndex = func;
      }
      
      public function hideTwitterPublisher() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.twitterHidePublisher();
      }
      
      public function levelVaultEditLevel(levelOrLevelId:*, levelData:ByteArray) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultEditLevel(levelOrLevelId,levelData);
      }
      
      public function get account() : Object
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.account;
      }
      
      public function levelVaultSetNumericAttributes(levelOrLevelId:*, keys:Array, data:Array) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultSetNumericAttributes(levelOrLevelId,keys,data);
      }
      
      public function get inUse() : Boolean
      {
         return this._inUse;
      }
      
      public function set savedGame(save:String) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.savedGame = save;
      }
      
      public function levelVaultGetLevelNumRatings(level:Object = null) : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetLevelNumRatings(level);
      }
      
      public function get applicationDomain() : ApplicationDomain
      {
         return this._loader.contentLoaderInfo.applicationDomain;
      }
      
      public function set onLevelVaultLevelStringsSet(func:Function) : void
      {
         this._evt_onLevelVaultLevelStringsSet = func;
      }
      
      public function get iconUrl() : String
      {
         if(this._loaded == false)
         {
            return "";
         }
         return this._gamerSafe.iconUrl;
      }
      
      private function e_onFacebookGotLocalUser(e:Event) : void
      {
         if(this._evt_onFacebookGotLocalUser != null)
         {
            this._evt_onFacebookGotLocalUser();
         }
         dispatchEvent(e);
      }
      
      public function showRegistrationForm() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.showRegistrationForm();
      }
      
      private function e_onNetworkingError(e:Event) : void
      {
         if(this._evt_networkingError != null)
         {
            this._evt_networkingError();
         }
         dispatchEvent(e);
      }
      
      private function e_onFacebookWallPostFailed(e:Event) : void
      {
         if(this._evt_onFacebookWallPostFailed != null)
         {
            this._evt_onFacebookWallPostFailed();
         }
         dispatchEvent(e);
      }
      
      public function levelVaultCreateLevelFromBytes(levelData:ByteArray) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultCreateLevel(levelData);
      }
      
      public function get onStatusBarMouseOut() : Function
      {
         return this._evt_onStatusBarMouseOut;
      }
      
      private function e_onLevelVaultLevelCreated(e:Event) : void
      {
         if(this._evt_onLevelVaultLevelCreated != null)
         {
            this._evt_onLevelVaultLevelCreated();
         }
         dispatchEvent(e);
      }
      
      private function e_onBridgeError(e:Event) : void
      {
         if(this._evt_onBridgeError != null)
         {
            this._evt_onBridgeError();
         }
         dispatchEvent(e);
      }
      
      public function get loggedIn() : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         return this._gamerSafe.loggedIn;
      }
      
      public function get onScoreSubmitted() : Function
      {
         return this._evt_onScoreSubmitted;
      }
      
      public function getUsername(uid:uint) : String
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.getUsername(uid);
      }
      
      public function set onPaymentPanelHidden(func:Function) : void
      {
         this._evt_onPaymentPanelHidden = func;
      }
      
      public function get onLevelVaultGotNumLevels() : Function
      {
         return this._evt_onLevelVaultGotNumLevels;
      }
      
      public function set onBeginSession(func:Function) : void
      {
         this._evt_beginSession = func;
      }
      
      public function get onScoreboardRecieved() : Function
      {
         return this._evt_onScoreboardRecieved;
      }
      
      public function set onLevelVaultLevelFlagged(func:Function) : void
      {
         this._evt_onLevelVaultLevelFlagged = func;
      }
      
      private function e_onLoginFormClosed(e:Event) : void
      {
         if(this._evt_onLoginFormClosed != null)
         {
            this._evt_onLoginFormClosed();
         }
         dispatchEvent(e);
      }
      
      public function get onLevelVaultLevelEdited() : Function
      {
         return this._evt_onLevelVaultLevelEdited;
      }
      
      private function e_onItemPurchaseFailed(e:Event) : void
      {
         if(this._evt_itemPurchaseFailed != null)
         {
            this._evt_itemPurchaseFailed();
         }
         dispatchEvent(e);
      }
      
      public function get onFacebookPromptClosed() : Function
      {
         return this._evt_onFacebookPromptClosed;
      }
      
      public function setStyle(name:String, value:*) : void
      {
         if(this._loaded == false)
         {
            this._tmpSkin[name] = value;
            return;
         }
         var o:Object = new Object();
         o[name] = value;
         this._gamerSafe.setSkin(o);
      }
      
      public function facebookWallPost(text:String, target:String = "me") : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.facebookWallPost(text,target);
      }
      
      public function showScoreboard(scoreboardId:int = -1) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.showScoreboard(scoreboardId);
      }
      
      public function levelVaultSetStringAttribute(levelOrLevelId:*, key:String, value:String) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultSetStringAttribute(levelOrLevelId,key,value);
      }
      
      public function showLogin(configuration:Object = null) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.showLogin(configuration);
      }
      
      private function setupStage(e:Event) : void
      {
         if(stage == null)
         {
            return;
         }
         this._stage = stage;
         this._stage.addEventListener(Event.RESIZE,this.resizeStage);
         this._stageWidth = stage.stageWidth;
         this._stageHeight = stage.stageHeight;
         if(root != null)
         {
            this._referrer = root.loaderInfo.loaderURL;
         }
         if(this.loaded)
         {
            this._gamerSafe.componentWidth = this._stageWidth;
            this._gamerSafe.componentHeight = this._stageHeight;
            this._stage.addChild(this._gamerSafe as Sprite);
         }
      }
      
      public function get onItemPurchaseCanceled() : Function
      {
         return this._evt_itemPurchaseCanceled;
      }
      
      private function e_onConsumptionCompleted(e:Event) : void
      {
         if(this._evt_onConsumptionCompleted != null)
         {
            this._evt_onConsumptionCompleted();
         }
         dispatchEvent(e);
      }
      
      public function bestowFreeItem(itemID:int) : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         this._gamerSafe.bestowFreeItem(itemID);
         return true;
      }
      
      public function saveToScoreboard(score:Number, extra:String, scoreboardID:int = -1, unregistered_name:String = "") : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.saveToScoreboard(score,extra,scoreboardID,unregistered_name);
      }
      
      public function get onLevelVaultLevelRated() : Function
      {
         return this._evt_onLevelVaultLevelRated;
      }
      
      public function get onUseChanged() : Function
      {
         return this._evt_useChanged;
      }
      
      public function set onConfirmYes(func:Function) : void
      {
         this._evt_confYes = func;
      }
      
      public function get FAQUrl() : String
      {
         if(this._loaded == false)
         {
            return "";
         }
         return this._gamerSafe.FAQUrl;
      }
      
      public function levelVaultGetLevelsRandom(count:uint) : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetLevelsRandom(count);
      }
      
      public function get onFacebookWallPostSuccess() : Function
      {
         return this._evt_onFacebookWallPostSuccess;
      }
      
      private function e_onAutoLoginFailed(e:Event) : void
      {
         if(this._evt_autoLoginFailed != null)
         {
            this._evt_autoLoginFailed();
         }
         dispatchEvent(e);
      }
      
      public function get countryCode() : String
      {
         if(this._loaded == false)
         {
            return "";
         }
         if(this.inSession == false)
         {
            return "";
         }
         return this._gamerSafe.countryCode;
      }
      
      public function get onApiReady() : Function
      {
         return this._evt_apiReady;
      }
      
      private function e_onTwitterPostSuccess(e:Event) : void
      {
         if(this._evt_onTwitterPostSuccess != null)
         {
            this._evt_onTwitterPostSuccess();
         }
         dispatchEvent(e);
      }
      
      public function levelVaultSetNumericAttribute(levelOrLevelId:*, key:String, value:Number) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultSetNumericAttribute(levelOrLevelId,key,value);
      }
      
      public function configureView(config:Object) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.configureView(config);
      }
      
      private function e_onLevelVaultGotIndex(e:Event) : void
      {
         if(this._evt_onLevelVaultGotIndex != null)
         {
            this._evt_onLevelVaultGotIndex();
         }
         dispatchEvent(e);
      }
      
      private function e_onFacebookGotFriends(e:Event) : void
      {
         if(this._evt_onFacebookGotFriends != null)
         {
            this._evt_onFacebookGotFriends();
         }
         dispatchEvent(e);
      }
      
      public function get onLevelVaultGotLevelRanking() : Function
      {
         return this._evt_onLevelVaultGotLevelRanking;
      }
      
      public function levelVaultDeleteLevel(levelOrLevelId:*) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultDeleteLevel(levelOrLevelId);
      }
      
      public function set onLevelVaultGotLevels(func:Function) : void
      {
         this._evt_onLevelVaultGotLevels = func;
      }
      
      private function onLoadingComplete(e:Event) : void
      {
         this._status = "Ready";
         this._loaded = true;
         this._gamerSafe = this._loader.content as Object;
         this._gamerSafe.componentWidth = this._stageWidth;
         this._gamerSafe.componentHeight = this._stageHeight;
         this._gamerSafe.setSkin(this._tmpSkin);
         this._gamerSafe.setAchievementSkin(this._tmpAchievementSkin);
         this._gamerSafe.addEventListener(EVT_NETWORKING_ERROR,this.e_onNetworkingError);
         this._gamerSafe.addEventListener(EVT_ACCOUNT_CHANGE,this.e_onAccountChange);
         this._gamerSafe.addEventListener("account_refresh",this.e_onAccountChange);
         this._gamerSafe.addEventListener(EVT_LOGIN,this.e_onLogin);
         this._gamerSafe.addEventListener(EVT_LOGIN_FAILED,this.e_onLoginFailed);
         this._gamerSafe.addEventListener(EVT_AUTO_LOGIN_FAILED,this.e_onAutoLoginFailed);
         this._gamerSafe.addEventListener(EVT_BEGIN_SESSION,this.e_onBeginSession);
         this._gamerSafe.addEventListener(EVT_BEGIN_SESSION_FAILED,this.e_onBeginSessionFailed);
         this._gamerSafe.addEventListener(EVT_ITEM_PURCHASE,this.e_onItemPurchase);
         this._gamerSafe.addEventListener(EVT_ITEM_PURCHASE_CANCELED,this.e_onItemPurchaseCanceled);
         this._gamerSafe.addEventListener(EVT_ITEM_PURCHASE_FAILED,this.e_onItemPurchaseFailed);
         this._gamerSafe.addEventListener("yes",this.e_onConfirmYes);
         this._gamerSafe.addEventListener("no",this.e_onConfirmNo);
         this._gamerSafe.addEventListener("dialog_begin",this.e_onUseStarted);
         this._gamerSafe.addEventListener("dialog_end",this.e_onUseEnded);
         this._gamerSafe.addEventListener(EVT_SCOREBOARD_ENTRIES_ERROR,this.e_onScoreboardError);
         this._gamerSafe.addEventListener(EVT_SCOREBOARD_ENTRIES_RECEIVED,this.e_onScoreboardRecieved);
         this._gamerSafe.addEventListener(EVT_SCOREBOARD_ENTRY_SUBMITTED,this.e_onScoreSubmitted);
         this._gamerSafe.addEventListener(EVT_UNREGISTERED_NAME,this.e_onUnregisteredName);
         this._gamerSafe.addEventListener(EVT_CONSUMPTION_COMPLETED,this.e_onConsumptionCompleted);
         this._gamerSafe.addEventListener(EVT_REGISTRATION_FORM_CLOSED,this.e_onRegistrationFormClosed);
         this._gamerSafe.addEventListener(EVT_LOGIN_FORM_CLOSED,this.e_onLoginFormClosed);
         this._gamerSafe.addEventListener(EVT_OTHER_GAME_PROFILE_RECEIVED,this.e_onOtherGameProfileReceived);
         this._gamerSafe.addEventListener(EVT_BRIDGE_SUCCESS,this.e_onBridgeSuccess);
         this._gamerSafe.addEventListener(EVT_BRIDGE_ERROR,this.e_onBridgeError);
         this._gamerSafe.addEventListener(EVT_PAYMENT_PANEL_SHOWN,this.e_onPaymentPanelShown);
         this._gamerSafe.addEventListener(EVT_PAYMENT_PANEL_HIDDEN,this.e_onPaymentPanelHidden);
         this._gamerSafe.addEventListener(EVT_STATUSBAR_MOUSEOVER,this.e_onStatusBarMouseOver);
         this._gamerSafe.addEventListener(EVT_STATUSBAR_MOUSEOUT,this.e_onStatusBarMouseOut);
         var levelVaultListener:EventDispatcher = this.levelVaultEventObject;
         levelVaultListener.addEventListener(EVT_LEVELVAULT_GOT_LEVELS,this.e_onLevelVaultGotLevels);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_GOT_NUM_LEVELS,this.e_onLevelVaultGotNumLevels);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_GOT_SINGLE_LEVEL,this.e_onLevelVaultGotLevel);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_GOT_LEVEL_RANKING,this.e_onLevelVaultGotLevelRanking);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_GOT_INDEX,this.e_onLevelVaultGotIndex);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_LEVEL_CREATED,this.e_onLevelVaultLevelCreated);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_LEVEL_DELETED,this.e_onLevelVaultLevelDeleted);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_LEVEL_EDITED,this.e_onLevelVaultLevelEdited);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_LEVEL_FLAGGED,this.e_onLevelVaultLevelFlagged);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_LEVEL_RATED,this.e_onLevelVaultLevelRated);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_LEVEL_NUMERICS_SET,this.e_onLevelVaultLevelNumericsSet);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_LEVEL_STRINGS_SET,this.e_onLevelVaultLevelStringsSet);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_LEVEL_NUMERICS_INCREMENTED,this.e_onLevelVaultLevelNumericsIncremented);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_LEVEL_NUMERICS_SET,this.e_onLevelVaultLevelAttributesChanged);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_LEVEL_STRINGS_SET,this.e_onLevelVaultLevelAttributesChanged);
         levelVaultListener.addEventListener(EVT_LEVELVAULT_LEVEL_NUMERICS_INCREMENTED,this.e_onLevelVaultLevelAttributesChanged);
         this._gamerSafe.addEventListener(EVT_FACEBOOK_CONNECTED,this.e_onFacebookConnected);
         this._gamerSafe.addEventListener(EVT_FACEBOOK_LOGIN_FAILED,this.e_onFacebookLoginFailed);
         this._gamerSafe.addEventListener(EVT_FACEBOOK_GOT_USER,this.e_onFacebookGotLocalUser);
         this._gamerSafe.addEventListener(EVT_FACEBOOK_GOT_FRIENDS,this.e_onFacebookGotFriends);
         this._gamerSafe.addEventListener(EVT_FACEBOOK_WALL_POST_SUCCESS,this.e_onFacebookWallPostSuccess);
         this._gamerSafe.addEventListener(EVT_FACEBOOK_WALL_POST_FAILED,this.e_onFacebookWallPostFailed);
         this._gamerSafe.addEventListener(EVT_FACEBOOK_PROMPT_CLOSED,this.e_onFacebookPromptClosed);
         this._gamerSafe.addEventListener(EVT_TWITTER_CONNECTED,this.e_onTwitterConnected);
         this._gamerSafe.addEventListener(EVT_TWITTER_LOGIN_FAILED,this.e_onTwitterLoginFailed);
         this._gamerSafe.addEventListener(EVT_TWITTER_GOT_USER,this.e_onTwitterGotUser);
         this._gamerSafe.addEventListener(EVT_TWITTER_POST_SUCCESS,this.e_onTwitterPostSuccess);
         this._gamerSafe.addEventListener(EVT_TWITTER_POST_FAILED,this.e_onTwitterPostFailed);
         if(this._stage != null)
         {
            this._stage.addChild(this._gamerSafe as Sprite);
         }
         if(root != null)
         {
            this._referrer = root.loaderInfo.loaderURL;
         }
         if(this._storedPasscode != "")
         {
            this.beginSession(this._storedPasscode,this._storedHashseed);
         }
         this.showStatusBar();
         this.e_onApiReady(new Event("apiReady"));
      }
      
      private function resizeStage(e:Event) : void
      {
         if(this.loaded == false)
         {
            return;
         }
         this._stageWidth = this._stage.stageWidth;
         this._stageHeight = this._stage.stageHeight;
         this._gamerSafe.componentWidth = this._stageWidth;
         this._gamerSafe.componentHeight = this._stageHeight;
      }
      
      private function onLoadingCompleteAir(e:Event) : void
      {
         this._status = "Loading";
         var context:LoaderContext = new LoaderContext();
         if("allowLoadBytesCodeExecution" in context)
         {
            context["allowLoadBytesCodeExecution"] = true;
         }
         this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onLoadingCompleteAir);
         this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadingComplete);
         this._loader.loadBytes(this._loader.contentLoaderInfo.bytes,context);
      }
      
      public function showAchievements(configuration:Object = null) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.showAchievements(configuration);
      }
      
      private function e_onApiReady(e:Event) : void
      {
         if(this._evt_apiReady != null)
         {
            this._evt_apiReady();
         }
         dispatchEvent(e);
      }
      
      public function showInterface() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.visible = true;
      }
      
      private function get sprite() : Sprite
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.sprite;
      }
      
      public function levelVaultGetLevelData(level:Object = null) : ByteArray
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",null);
         }
         return this._gamerSafe.levelVaultGetLevelData(level);
      }
      
      private function e_onPaymentPanelHidden(e:Event) : void
      {
         if(this._evt_onPaymentPanelHidden != null)
         {
            this._evt_onPaymentPanelHidden();
         }
         dispatchEvent(e);
      }
      
      public function get onFacebookConnected() : Function
      {
         return this._evt_onFacebookConnected;
      }
      
      public function get onItemPurchaseFailed() : Function
      {
         return this._evt_itemPurchaseFailed;
      }
      
      public function hidePublisher() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.facebookHidePublisher();
      }
      
      public function set onConsumptionCompleted(func:Function) : void
      {
         this._evt_onConsumptionCompleted = func;
      }
      
      public function showSmallScoreSubmit(score:Number, extra:String, showAsTime:Boolean = false, scoreboardID:int = -1) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.showSmallScoreSubmitPrompt(score,extra,scoreboardID,showAsTime);
      }
      
      private function e_onScoreSubmitted(e:Event) : void
      {
         if(this._evt_onScoreSubmitted != null)
         {
            this._evt_onScoreSubmitted();
         }
         dispatchEvent(e);
      }
      
      public function get onLevelVaultLevelAttributesChanged() : Function
      {
         return this._evt_onLevelVaultLevelAttributesChanged;
      }
      
      public function disable() : void
      {
         if(this._status == "Ready")
         {
            this._status = "Disabled";
            this._loaded = false;
         }
      }
      
      public function get facebookLocalUserId() : int
      {
         if(this._loaded == false)
         {
            return 0;
         }
         return this._gamerSafe.facebookLocalUserId;
      }
      
      private function e_onLogin(e:Event) : void
      {
         if(this._evt_login != null)
         {
            this._evt_login();
         }
         this.flashBar();
         dispatchEvent(e);
      }
      
      private function e_onLevelVaultGotLevels(e:Event) : void
      {
         if(this._evt_onLevelVaultGotLevels != null)
         {
            this._evt_onLevelVaultGotLevels();
         }
         dispatchEvent(e);
      }
      
      public function twitterConnect() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.twitterConnect();
      }
      
      public function set wantsNewsletter(wants:Boolean) : void
      {
         if(this._loaded == true)
         {
            this._gamerSafe.wantsNewsletter = wants;
         }
      }
      
      public function get autoLogin() : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         return this._gamerSafe.autoLogin;
      }
      
      public function getItemById(item_id:int) : Object
      {
         var i:Object = null;
         if(this._loaded == false)
         {
            return null;
         }
         if(this.inSession == false)
         {
            return null;
         }
         var _items:Array = this.items;
         for each(i in _items)
         {
            if(i.id == item_id)
            {
               return i;
            }
         }
         return null;
      }
      
      public function set onConfirmNo(func:Function) : void
      {
         this._evt_confNo = func;
      }
      
      public function get onUnregisteredName() : Function
      {
         return this._evt_onUnregisteredName;
      }
      
      public function get unregisteredName() : String
      {
         if(this._loaded == false)
         {
            return "";
         }
         return this._gamerSafe.unregisteredName;
      }
      
      public function get achievementPopupPosition() : Point
      {
         if(this._loaded == false)
         {
            return new Point(0,0);
         }
         return this._gamerSafe.achievementPopupPosition;
      }
      
      public function get onFacebookGotFriends() : Function
      {
         return this._evt_onFacebookGotFriends;
      }
      
      public function get onLevelVaultGotIndex() : Function
      {
         return this._evt_onLevelVaultGotIndex;
      }
      
      public function getAchievementSkin() : Object
      {
         if(this._loaded == false)
         {
            return null;
         }
         return this._gamerSafe.getAchievementSkin();
      }
      
      public function levelVaultGetLevelID(level:Object = null) : uint
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",null);
         }
         return this._gamerSafe.levelVaultGetLevelID(level);
      }
      
      public function get savedGame() : String
      {
         if(this._loaded == false)
         {
            return "";
         }
         if(this._gamerSafe.savedGame == null)
         {
            return "";
         }
         return this._gamerSafe.savedGame;
      }
      
      public function get onTwitterPostSuccess() : Function
      {
         return this._evt_onTwitterPostSuccess;
      }
      
      public function levelVaultSetExpiringStringAttributes(levelOrLevelId:*, keys:Array, data:Array, expires:Array) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultSetExpiringStringAttributes(levelOrLevelId,keys,data,expires);
      }
      
      public function showMessageBox(title:String, text:String, isConfirm:Boolean = true) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.messageBox(title,text,isConfirm);
      }
      
      public function get onScoreboardError() : Function
      {
         return this._evt_onScoreboardError;
      }
      
      public function get achievements() : Array
      {
         if(this._loaded == false)
         {
            return [];
         }
         if(this.inSession == false)
         {
            return [];
         }
         return this._gamerSafe.achievementList;
      }
      
      public function get onPaymentPanelHidden() : Function
      {
         return this._evt_onPaymentPanelHidden;
      }
      
      public function set onNetworkingError(func:Function) : void
      {
         this._evt_networkingError = func;
      }
      
      public function get startingTime() : Date
      {
         if(this._loaded == false)
         {
            return null;
         }
         if(this.inSession == false)
         {
            return null;
         }
         return this._gamerSafe.startingTime;
      }
      
      public function levelVaultGetLevelsLike(key:String, value:String, ascending:Boolean = true, limit:uint = 20, offset:uint = 0) : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetLevelsLike(key,value,ascending,limit,offset);
      }
      
      public function set onFacebookWallPostFailed(func:Function) : void
      {
         this._evt_onFacebookWallPostFailed = func;
      }
      
      public function get facebookLoggedIn() : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         return this._gamerSafe.facebookLoggedIn;
      }
      
      public function set onStatusBarMouseOver(func:Function) : void
      {
         this._evt_onStatusBarMouseOver = func;
      }
      
      public function levelVaultGetLevelAsObject(level:Object = null) : Object
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",null);
         }
         return this._gamerSafe.levelVaultGetLevelAsObject(level);
      }
      
      public function showSmallScoreboard(scoreboardId:int = -1) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.showSmallScoreboard(scoreboardId);
      }
      
      public function get gamerGold() : uint
      {
         if(this._loaded == false)
         {
            return 0;
         }
         return this._gamerSafe.gamerGold;
      }
      
      private function e_onFacebookWallPostSuccess(e:Event) : void
      {
         if(this._evt_onFacebookWallPostSuccess != null)
         {
            this._evt_onFacebookWallPostSuccess();
         }
         dispatchEvent(e);
      }
      
      public function facebookConnect(requireLogin:Boolean = false) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.facebookConnect(requireLogin);
      }
      
      public function get onConfirmYes() : Function
      {
         return this._evt_confYes;
      }
      
      public function set onTwitterPromptClosed(func:Function) : void
      {
         this._evt_onTwitterPromptClosed = func;
      }
      
      private function e_onLoginFailed(e:Event) : void
      {
         if(this._evt_loginFailed != null)
         {
            this._evt_loginFailed();
         }
         dispatchEvent(e);
      }
      
      public function set onRegistrationFormClosed(func:Function) : void
      {
         this._evt_onRegistrationFormClosed = func;
      }
      
      private function e_onStatusBarMouseOut(e:Event) : void
      {
         if(this._evt_onStatusBarMouseOut != null)
         {
            this._evt_onStatusBarMouseOut();
         }
         dispatchEvent(e);
      }
      
      public function set onLoginFailed(func:Function) : void
      {
         this._evt_loginFailed = func;
      }
      
      public function levelVaultCreateLevelWithAttributes(levelData:*, attributes:Object) : Boolean
      {
         if(this.levelVaultCreateLevel(levelData))
         {
            this._levelVaultTempAttributes = attributes;
            addEventListener(GamerSafe.EVT_LEVELVAULT_LEVEL_CREATED,this.levelVaultSetTempAttributes);
            return true;
         }
         return this.levelVaultFail(this._levelVaultLastError);
      }
      
      public function get onLevelVaultGotLevels() : Function
      {
         return this._evt_onLevelVaultGotLevels;
      }
      
      public function login(username:String, password:String, rememberMe:Boolean = false) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.login(username,password,rememberMe);
      }
      
      private function e_onFacebookPromptClosed(e:Event) : void
      {
         if(this._evt_onFacebookPromptClosed != null)
         {
            this._evt_onFacebookPromptClosed();
         }
         dispatchEvent(e);
      }
      
      public function set onLevelVaultLevelCreated(func:Function) : void
      {
         this._evt_onLevelVaultLevelCreated = func;
      }
      
      public function levelVaultGetLevelAttributes(level:Object = null) : Array
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",[]);
         }
         return this._gamerSafe.levelVaultGetLevelAttributes(level);
      }
      
      public function levelVaultSetExpiringNumericAttributes(levelOrLevelId:*, keys:Array, data:Array, expires:Array) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultSetExpiringNumericAttributes(levelOrLevelId,keys,data,expires);
      }
      
      public function set onTwitterPostFailed(func:Function) : void
      {
         this._evt_onTwitterPostFailed = func;
      }
      
      public function set onLoginFormClosed(func:Function) : void
      {
         this._evt_onLoginFormClosed = func;
      }
      
      private function e_onLevelVaultLevelDeleted(e:Event) : void
      {
         if(this._evt_onLevelVaultLevelDeleted != null)
         {
            this._evt_onLevelVaultLevelDeleted();
         }
         dispatchEvent(e);
      }
      
      public function levelVaultGetLevelAsCustomObject(type:Class, level:Object = null) : *
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",null);
         }
         return this._gamerSafe.levelVaultGetLevelAsCustomObject(type,level);
      }
      
      public function tryAutoLogin() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.tryAutoLogin();
      }
      
      public function showPublisher(x:int, y:int, uids:Array = null, width:int = 400, height:int = 350) : void
      {
         var me:Array = null;
         if(this._loaded == false)
         {
            return;
         }
         if(uids != null)
         {
            this._gamerSafe.facebookShowPublisher(uids,x,y,width,height);
         }
         else
         {
            me = [{"id":"me"}];
            this._gamerSafe.facebookShowPublisher(me,x,y,width,height);
         }
      }
      
      public function set onLevelVaultGotLevel(func:Function) : void
      {
         this._evt_onLevelVaultGotLevel = func;
      }
      
      public function get onFacebookWallPostFailed() : Function
      {
         return this._evt_onFacebookWallPostFailed;
      }
      
      public function requestScoreboardEntries(scoreboardID:int = -1) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.requestScoreboardEntries(scoreboardID);
      }
      
      public function set onLevelVaultLevelNumericsSet(func:Function) : void
      {
         this._evt_onLevelVaultLevelNumericsSet = func;
      }
      
      public function showShop(configuration:Object = null) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.showShop(configuration);
      }
      
      public function get onNetworkingError() : Function
      {
         return this._evt_networkingError;
      }
      
      public function levelVaultGetLevelRanking(levelId:int, attribute:String, ascending:Boolean = false) : Boolean
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded");
         }
         return this._gamerSafe.levelVaultGetLevelRanking(levelId,attribute,ascending);
      }
      
      private function e_onItemPurchaseCanceled(e:Event) : void
      {
         if(this._evt_itemPurchaseCanceled != null)
         {
            this._evt_itemPurchaseCanceled();
         }
         dispatchEvent(e);
      }
      
      public function hideStatusBar() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.hideStatusBar();
      }
      
      private function e_onLevelVaultLevelRated(e:Event) : void
      {
         if(this._evt_onLevelVaultLevelStringsSet != null)
         {
            this._evt_onLevelVaultLevelStringsSet();
         }
         dispatchEvent(e);
      }
      
      public function levelVaultGetLevelsByStringData(key:String, value:String, ascending:Boolean = true, limit:uint = 20, offset:uint = 0) : int
      {
         if(this._loaded == false)
         {
            return this.levelVaultFail("API not yet loaded",0);
         }
         return this._gamerSafe.levelVaultGetLevelsByStringData(key,value,ascending,limit,offset);
      }
      
      public function set onTwitterConnected(func:Function) : void
      {
         this._evt_onTwitterConnected = func;
      }
      
      public function get levelVaultLastError() : String
      {
         return this._levelVaultLastError;
      }
      
      public function closeScoreboard() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.closeScoreboard();
      }
      
      public function showPopup(text:String, configuration:Object = null) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.showPopup(text,configuration);
      }
      
      public function get onLevelVaultLevelCreated() : Function
      {
         return this._evt_onLevelVaultLevelCreated;
      }
      
      public function purchaseItem(itemID:int, priceID:int = 0) : Boolean
      {
         if(this._loaded == false)
         {
            return false;
         }
         return this._gamerSafe.purchaseItem(itemID,priceID);
      }
      
      public function requestUnregisteredName() : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.requestUnregisteredUserName();
      }
      
      public function get onTwitterPostFailed() : Function
      {
         return this._evt_onTwitterPostFailed;
      }
      
      public function get onLoginFormClosed() : Function
      {
         return this._evt_onLoginFormClosed;
      }
      
      public function getConsumptionsAvailable(itemId:int) : int
      {
         if(this._loaded == false)
         {
            return 0;
         }
         if(this.inSession == false)
         {
            return 0;
         }
         return this._gamerSafe.getConsumptionsAvailable(itemId);
      }
      
      private function e_onLevelVaultLevelFlagged(e:Event) : void
      {
         if(this._evt_onLevelVaultLevelFlagged != null)
         {
            this._evt_onLevelVaultLevelFlagged();
         }
         dispatchEvent(e);
      }
      
      public function showTwitterPublisherPanel(width:int = 400, height:int = 350) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.twitterShowPublisherPanel(width,height);
      }
      
      public function get items() : Array
      {
         if(this._loaded == false)
         {
            return [];
         }
         if(this.inSession == false)
         {
            return [];
         }
         return this._gamerSafe.itemList;
      }
      
      public function get gamerPoints() : uint
      {
         if(this._loaded == false)
         {
            return 0;
         }
         return this._gamerSafe.gamerPoints;
      }
      
      public function get onLevelVaultLevelNumericsSet() : Function
      {
         return this._evt_onLevelVaultLevelNumericsSet;
      }
      
      private function e_onItemPurchase(e:Event) : void
      {
         if(this._evt_itemPurchase != null)
         {
            this._evt_itemPurchase();
         }
         dispatchEvent(e);
      }
      
      public function purchaseItemInterface(itemId:int, priceID:int = 0) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         if(this.inSession == false)
         {
            return;
         }
         this._gamerSafe.purchaseItemInterface(itemId,priceID);
      }
      
      public function levelVaultGetAllLevels(ascending:Boolean = true, limit:uint = 20, offset:uint = 0) : int
      {
         return this.levelVaultGetLevelsByRating(0,10,ascending,limit,offset);
      }
      
      public function get facebookFriends() : Array
      {
         if(this._loaded == false)
         {
            return [];
         }
         return this._gamerSafe.facebookFriends;
      }
      
      public function set onAutoLoginFailed(func:Function) : void
      {
         this._evt_autoLoginFailed = func;
      }
      
      private function e_onFacebookConnected(e:Event) : void
      {
         if(this._evt_onFacebookConnected != null)
         {
            this._evt_onFacebookConnected();
         }
         dispatchEvent(e);
      }
      
      public function get status() : String
      {
         return this._status;
      }
      
      public function get isGamerGoldPurchaseDisabled() : Boolean
      {
         if(this._loaded == false)
         {
            return true;
         }
         return this._gamerSafe.isGamerGoldPurchaseDisabled;
      }
      
      public function get onPaymentPanelShown() : Function
      {
         return this._evt_onPaymentPanelShown;
      }
      
      private function e_onTwitterConnected(e:Event) : void
      {
         if(this._evt_onTwitterConnected != null)
         {
            this._evt_onTwitterConnected();
         }
         dispatchEvent(e);
      }
      
      public function set onPaymentPanelShown(func:Function) : void
      {
         this._evt_onPaymentPanelShown = func;
      }
      
      public function get onAutoLoginFailed() : Function
      {
         return this._evt_autoLoginFailed;
      }
      
      public function setShopCategoryVisible(category:int, visible:Boolean) : void
      {
         if(this._loaded == false)
         {
            return;
         }
         this._gamerSafe.setShopCategoryVisible(category,visible);
      }
   }
}

