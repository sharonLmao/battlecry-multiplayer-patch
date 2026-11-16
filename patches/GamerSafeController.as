package com.lachhhEngine.io.externalAPI
{
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.encryption.MetaDataEncryption;
   import com.lachhhEngine.io.externalAPI.achievementAPI.IAchievementAPI;
   import com.lachhhEngine.io.externalAPI.achievementAPI.MetaExternalAchievement;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.fields.MetaCustomField;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.levelVault.LevelVaultSharedData;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.levelVault.MetaSharedDataQueryGSONLY;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.queries.MetaSharedDataQuerySort;
   import com.lachhhEngine.io.externalAPI.premiumAPI.IPremiumAPIController;
   import com.lachhhEngine.io.externalAPI.premiumAPI.MetaExternalPremiumItem;
   import com.lachhhEngine.io.externalAPI.savefileAPI.ISaveFileAPI;
   import com.lachhhEngine.io.externalAPI.scoreAPI.IScoreAPI;
   import com.lachhhEngine.io.externalAPI.scoreAPI.MetaExternalScoreboard;
   import com.lachhhEngine.io.gamerSafe.GamerSafe;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.net.SharedObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   
   public class GamerSafeController implements IPremiumAPIController, IScoreAPI, IAchievementAPI, ISaveFileAPI
   {
      
      private var _onConsumeCallback:Callback;
      
      private var _onPurchaseCallback:Callback;
      
      private var _hashSeed:String;
      
      private var _callQueues:Array = new Array();
      
      private var _loginErrorCallback:Callback;
      
      private var _crntServerTime:Date;
      
      private var _hourDelayFromServer:int = 0;
      
      private var _lastItemPurchased:Object;
      
      private var _connectSuccessCallback:Callback;
      
      private var _levelVaultBusy:Boolean;
      
      private var _timer:Timer;
      
      private var _idSavedGame:int = 0;
      
      private var _connectErrorCallback:Callback;
      
      private var _partner:String;
      
      private var _yesCallback:Callback;
      
      private var _loginSuccessCallback:Callback;
      
      private var _noCallback:Callback;
      
      private var _onDataLoadedCallback:Callback;
      
      private var _onLoginCallback:Callback;
      
      private var _passCode:String;
      
      private var _levelVaultPersistentCallbackError:Callback;
      
      public function GamerSafeController(hashSeed:String, passCode:String, partner:String = "")
      {
         super();
         this._hashSeed = hashSeed;
         this._passCode = passCode;
         this._partner = partner;
      }
      
      public function GetLevelsFromNumericKey(key:String, valueMin:int, valueMax:int, sort:MetaSharedDataQuerySort, success:Callback, error:Callback) : MetaSharedDataQueryGSONLY
      {
         if(sort == null)
         {
            sort = MetaSharedDataQuerySort.DEFAULT_SORT;
         }
         var metaCall:MetaSharedDataQueryGSONLY = new MetaSharedDataQueryGSONLY(success,error,"GetLevelsFromNumericMetaSharedDataQueryGSONLYSort, value = " + valueMin + "-" + valueMax);
         GamerSafe.api.levelVaultGetLevelsByNumericData(key,valueMin,valueMax,sort.ascending,sort.limit,sort.offset);
         this.InitCall(metaCall,true);
         return metaCall;
      }
      
      public function InUse() : Boolean
      {
         if(!this.loggedIn)
         {
            return false;
         }
         return GamerSafe.api.inUse;
      }
      
      private function confirmYes() : void
      {
         if(this._yesCallback != null)
         {
            this._yesCallback.DoCallback();
         }
         this.AfterConfirm();
      }
      
      public function get connected() : Boolean
      {
         return GamerSafe.api != null && GamerSafe.api.loaded;
      }
      
      public function get playerName() : String
      {
         if(GamerSafe.api != null && GamerSafe.api.loaded)
         {
            var n:String = GamerSafe.api.username;
            if(n != null && n != "" && n != "GamerSafe")
            {
               return n;
            }
         }
         return BC_LocalName();
      }
      
      private static var _bcName:String = null;
      
      public static function BC_LocalName() : String
      {
         if(_bcName != null)
         {
            return _bcName;
         }
         var nm:String = null;
         try
         {
            var so:SharedObject = SharedObject.getLocal("battlecry_guest","/");
            nm = so.data.username as String;
            if(nm == null || nm == "")
            {
               nm = "guest" + Math.floor(Math.random() * 2000000000).toString(36);
               so.data.username = nm;
               try
               {
                  so.flush();
               }
               catch(ef:Error)
               {
               }
            }
            if(so.data.cheat == true)
            {
               nm = "CHEAT_" + nm;
            }
         }
         catch(e:Error)
         {
            if(nm == null || nm == "")
            {
               nm = "guest" + Math.floor(Math.random() * 2000000000).toString(36);
            }
         }
         _bcName = nm;
         return nm;
      }
      
      public static function BC_HasName() : Boolean
      {
         try
         {
            var so:SharedObject = SharedObject.getLocal("battlecry_guest","/");
            return so.data.named == true;
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      public static function BC_ClearIdentity() : void
      {
         try
         {
            var so:SharedObject = SharedObject.getLocal("battlecry_guest","/");
            delete so.data.username;
            delete so.data.named;
            delete so.data.cheat;
            try
            {
               so.flush();
            }
            catch(ef:Error)
            {
            }
         }
         catch(e:Error)
         {
         }
         _bcName = null;
      }
      
      public static function BC_IsCheat() : Boolean
      {
         try
         {
            var so:SharedObject = SharedObject.getLocal("battlecry_guest","/");
            return so.data.cheat == true;
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      public static function BC_SetName(name:String, cheat:Boolean) : void
      {
         try
         {
            var so:SharedObject = SharedObject.getLocal("battlecry_guest","/");
            so.data.username = name;
            so.data.named = true;
            so.data.cheat = cheat;
            try
            {
               so.flush();
            }
            catch(ef:Error)
            {
            }
         }
         catch(e:Error)
         {
         }
         _bcName = null;
      }
      
      public function ConsumeItem(m:MetaExternalPremiumItem, numToConsume:int, callback:Callback) : void
      {
         this._onConsumeCallback = callback;
         GamerSafe.api.consumeItem(m.idGS,numToConsume);
      }
      
      public function get pointAcronym() : String
      {
         return "GP";
      }
      
      public function get tomorrow() : Date
      {
         var dtCurrentToday:Date = this.serverStartingTime;
         return new Date(dtCurrentToday.getUTCFullYear(),dtCurrentToday.getMonth(),dtCurrentToday.getDate() + 1);
      }
      
      public function get serverStartingTime() : Date
      {
         return GamerSafe.api.startingTime;
      }
      
      public function get mustShowPurchasePopup() : Boolean
      {
         return false;
      }
      
      public function FlashBar() : void
      {
         if(!this.connected)
         {
            return;
         }
         GamerSafe.api.flashBar();
      }
      
      protected function onBeginSession() : void
      {
         if(this._partner != "")
         {
            GamerSafe.api.partner = this._partner;
         }
         if(this._connectSuccessCallback != null)
         {
            this._connectSuccessCallback.DoCallback();
            this._connectSuccessCallback = null;
         }
         this._crntServerTime = new Date();
         this._crntServerTime.setTime(this.serverStartingTime.getTime());
         this._hourDelayFromServer = this.serverStartingTime.getHours() - this._crntServerTime.getHours();
         this._timer.start();
      }
      
      public function get today() : Date
      {
         return this.serverStartingTime;
      }
      
      protected function onLevelStringSet() : void
      {
         this.EndTransactionWithLevelVault();
      }
      
      public function get idSavedGame() : int
      {
         return this._idSavedGame;
      }
      
      public function get loggedIn() : Boolean
      {
         return true;
      }
      
      public function get isEmpty() : Boolean
      {
         return this.savedData == null || this.savedData == "" || this.savedData == "false";
      }
      
      public function get myPoint() : int
      {
         if(!this.loggedIn)
         {
            return 0;
         }
         return GamerSafe.api.gamerPoints;
      }
      
      public function ShowLogin(o:Object = null) : void
      {
         if(!this.connected)
         {
            return;
         }
         GamerSafe.api.showLogin(o);
      }
      
      public function get dataLoaded() : Boolean
      {
         return this.loggedIn;
      }
      
      public function HideBar() : void
      {
         if(!this.connected)
         {
            return;
         }
         GamerSafe.api.hideStatusBar();
      }
      
      protected function onLevelCreated() : void
      {
         this.EndTransactionWithLevelVault();
      }
      
      public function GetItemCostGold(m:MetaExternalPremiumItem) : int
      {
         var item:Object = this.GetItemInfo(m.idGS);
         if(item == null)
         {
            return -1;
         }
         var prices:Array = item.prices;
         if(prices == null || prices[0] == null)
         {
            return -1;
         }
         var price:Object = prices[0];
         if(price == null || price.goldCost == null || isNaN(price.goldCost))
         {
            return -1;
         }
         return price.goldCost;
      }
      
      protected function onLevelNumericsSet() : void
      {
         this.EndTransactionWithLevelVault();
      }
      
      public function get myGold() : int
      {
         if(!this.loggedIn)
         {
            return 0;
         }
         return GamerSafe.api.gamerGold;
      }
      
      public function get goldAcronym() : String
      {
         return "GG";
      }
      
      protected function onLoginError() : void
      {
         if(this._loginErrorCallback != null)
         {
            this._loginErrorCallback.DoCallback();
            this._loginErrorCallback = null;
         }
      }
      
      public function FlagLevel(id:int, success:Callback, error:Callback) : MetaSharedDataQueryGSONLY
      {
         var metaCall:MetaSharedDataQueryGSONLY = new MetaSharedDataQueryGSONLY(success,error,"Flag Level #" + id);
         this.InitCall(metaCall,GamerSafe.api.levelVaultFlagLevel(id));
         return metaCall;
      }
      
      public function DestroyLevel(id:int, success:Callback, error:Callback) : MetaSharedDataQueryGSONLY
      {
         var metaCall:MetaSharedDataQueryGSONLY = new MetaSharedDataQueryGSONLY(success,error,"Destroy Level #" + id);
         this.InitCall(metaCall,GamerSafe.api.levelVaultDeleteLevel(id));
         return metaCall;
      }
      
      public function GetItemCostPoint(m:MetaExternalPremiumItem) : int
      {
         var item:Object = this.GetItemInfo(m.idGS);
         if(item == null)
         {
            return -1;
         }
         var prices:Array = item.prices;
         if(prices == null || prices[0] == null)
         {
            return -1;
         }
         var price:Object = prices[0];
         if(price == null || price.pointCost == null || isNaN(price.pointCost))
         {
            return -1;
         }
         return price.pointCost;
      }
      
      private function onTimerTick(e:Event) : void
      {
         this._crntServerTime.setTime(this._crntServerTime.getTime() + 1000);
      }
      
      private function AfterConfirm() : void
      {
         this._yesCallback = null;
         this._noCallback = null;
      }
      
      public function SetExpiringNumericAttributes(id:int, keys:Array, values:Array, expires:Array, success:Callback, error:Callback) : MetaSharedDataQueryGSONLY
      {
         var metaCall:MetaSharedDataQueryGSONLY = new MetaSharedDataQueryGSONLY(success,error,"SetExpiringNumericAttributes Level #" + id);
         this.InitCall(metaCall,GamerSafe.api.levelVaultSetExpiringNumericAttributes(id,keys,values,expires));
         return metaCall;
      }
      
      protected function onGetLevels() : void
      {
         var data:LevelVaultSharedData = null;
         var array:Array = GamerSafe.api.levelVaultGetLastSelectedLevels();
         var result:Array = new Array();
         var i:int = 0;
         while(i < array.length)
         {
            data = new LevelVaultSharedData();
            data.Init(array[i]);
            result.push(data);
            i++;
         }
         this.EndTransactionWithLevelVault([result]);
      }
      
      public function RateLevel(id:int, rating:uint, success:Callback, error:Callback) : MetaSharedDataQueryGSONLY
      {
         var metaCall:MetaSharedDataQueryGSONLY = new MetaSharedDataQueryGSONLY(success,error,"Rate Level #" + id + " : " + rating);
         this.InitCall(metaCall,GamerSafe.api.levelVaultRateLevel(id,rating));
         return metaCall;
      }
      
      protected function onLevelEdited() : void
      {
         this.EndTransactionWithLevelVault();
      }
      
      public function get accountName() : String
      {
         return this.playerName;
      }
      
      public function SetPersistentErrorCallback(c:Callback) : void
      {
         this._levelVaultPersistentCallbackError = c;
      }
      
      private function EndTransactionWithLevelVault(params:Array = null) : void
      {
      }
      
      protected function onLevelDeleted() : void
      {
         this.EndTransactionWithLevelVault();
      }
      
      public function set idSavedGame(idSavedGame:int) : void
      {
         this._idSavedGame = idSavedGame;
      }
      
      public function ClearData() : void
      {
         this.SaveData("",null);
      }
      
      public function EditLevel(code:String, id:int, success:Callback, error:Callback) : MetaSharedDataQueryGSONLY
      {
         var metaCall:MetaSharedDataQueryGSONLY = new MetaSharedDataQueryGSONLY(success,error,"Edit Level #" + id);
         var data:ByteArray = MetaDataEncryption.GetEncryptedByteArray(code);
         this.InitCall(metaCall,GamerSafe.api.levelVaultEditLevel(id,data));
         return metaCall;
      }
      
      public function get nextWeek() : Date
      {
         var dtCurrentToday:Date = this.serverStartingTime;
         return new Date(dtCurrentToday.getUTCFullYear(),dtCurrentToday.getMonth(),dtCurrentToday.getDate() - dtCurrentToday.getDay() + 8);
      }
      
      protected function onBeginSessionFailed() : void
      {
         if(this._connectErrorCallback != null)
         {
            this._connectErrorCallback.DoCallback();
            this._connectErrorCallback = null;
         }
      }
      
      public function GetCustomData(m:MetaExternalPremiumItem) : String
      {
         var item:Object = this.GetItemInfo(m.idGS);
         if(item == null)
         {
            return "";
         }
         return item.developerCode;
      }
      
      public function GetServerTime() : Date
      {
         return this._crntServerTime;
      }
      
      public function IsLastItemPurchased(m:MetaExternalPremiumItem) : Boolean
      {
         return m.idGS == this._lastItemPurchased.itemID;
      }
      
      public function get nameOfSystem() : String
      {
         return "GamerSafe";
      }
      
      protected function onItemConsumed() : void
      {
         if(this._onConsumeCallback != null)
         {
            this._onConsumeCallback.DoCallback();
         }
      }
      
      protected function onLevelRated() : void
      {
         this.EndTransactionWithLevelVault();
      }
      
      private function confirmNo() : void
      {
         if(this._noCallback != null)
         {
            this._noCallback.DoCallback();
         }
         this.AfterConfirm();
      }
      
      public function ShowHighscore(m:MetaExternalScoreboard) : void
      {
         if(!this.connected || m == null)
         {
            return;
         }
         GamerSafe.api.showScoreboard(m.idBoardGS);
      }
      
      public function set onLogInCallback(c:Callback) : void
      {
         this._onLoginCallback = c;
      }
      
      public function GetItemNumBought(m:MetaExternalPremiumItem) : int
      {
         if(!this.connected)
         {
            return -1;
         }
         var i:Object = GamerSafe.api.getItemById(m.idGS);
         if(i == null)
         {
            return -1;
         }
         return i.numOwned != null ? int(i.numOwned) : 0;
      }
      
      public function SetLoginCallback(pSuccess:Callback = null, pError:Callback = null) : void
      {
         this._loginSuccessCallback = pSuccess;
         this._loginErrorCallback = pError;
      }
      
      public function HasItem(m:MetaExternalPremiumItem) : Boolean
      {
         if(!this.connected || m == null)
         {
            return false;
         }
         return GamerSafe.api.hasItem(m.idGS);
      }
      
      private function InitCall(metaCall:MetaSharedDataQueryGSONLY, callSucceed:Boolean) : void
      {
         if(callSucceed)
         {
            metaCall.LaunchCall();
         }
         else
         {
            metaCall.SetError(GamerSafe.api.levelVaultLastError);
         }
      }
      
      public function get thisWeek() : Date
      {
         var dtCurrentToday:Date = this.serverStartingTime;
         return new Date(dtCurrentToday.getUTCFullYear(),dtCurrentToday.getMonth(),dtCurrentToday.getDate() - dtCurrentToday.getDay());
      }
      
      protected function onItemPurchase() : void
      {
         this._lastItemPurchased = GamerSafe.api.latestItemPurchaseInfo;
         if(this._onPurchaseCallback != null)
         {
            this._onPurchaseCallback.DoCallback();
         }
      }
      
      protected function onLevelFlagged() : void
      {
         this.EndTransactionWithLevelVault();
      }
      
      public function ShowBar(o:Object = null) : void
      {
         if(!this.connected)
         {
            return;
         }
         GamerSafe.api.showStatusBar(o);
      }
      
      private function GetItemInfo(itemId:int) : Object
      {
         var item:Object = null;
         var i:int = 0;
         while(i < GamerSafe.api.items.length)
         {
            item = GamerSafe.api.items[i];
            if(item.id == itemId)
            {
               return item;
            }
            i++;
         }
         return null;
      }
      
      protected function onLogInSuccess() : void
      {
         if(this._onDataLoadedCallback != null)
         {
            this._onDataLoadedCallback.DoCallback();
            this._onDataLoadedCallback = null;
         }
         if(this._loginSuccessCallback != null)
         {
            this._loginSuccessCallback.DoCallback();
            this._loginSuccessCallback = null;
         }
         if(this._onLoginCallback != null)
         {
            this._onLoginCallback.DoCallback();
         }
      }
      
      public function SetExpiringNumericAttribute(id:int, key:String, value:int, expires:String, success:Callback, error:Callback) : MetaSharedDataQueryGSONLY
      {
         var metaCall:MetaSharedDataQueryGSONLY = new MetaSharedDataQueryGSONLY(success,error,"SetExpiringNumericAttribute Level #" + id);
         this.InitCall(metaCall,GamerSafe.api.levelVaultSetExpiringNumericAttribute(id,key,value,expires));
         return metaCall;
      }
      
      public function GetLevelsFromStringKey(key:String, value:String, sort:MetaSharedDataQuerySort, success:Callback, error:Callback) : MetaSharedDataQueryGSONLY
      {
         if(sort == null)
         {
            sort = MetaSharedDataQuerySort.DEFAULT_SORT;
         }
         var metaCall:MetaSharedDataQueryGSONLY = new MetaSharedDataQueryGSONLY(success,error,"GetLevelMetaSharedDataQueryGSONLYSort : " + key + ", value = " + value);
         GamerSafe.api.levelVaultGetLevelsByStringData(key,value,sort.ascending,sort.limit,sort.offset);
         this.InitCall(metaCall,true);
         return metaCall;
      }
      
      public function bestowAchievement(m:MetaExternalAchievement) : void
      {
         if(!this.connected || m == null)
         {
            return;
         }
         GamerSafe.api.bestowAchievement(m.idGS);
      }
      
      public function ShowStore(o:Object = null) : void
      {
         if(!this.connected)
         {
            return;
         }
         GamerSafe.api.showShop(o);
      }
      
      public function SendGameOver(score:int, extra:Object) : void
      {
      }
      
      public function get canShowMyMoney() : Boolean
      {
         return true;
      }
      
      public function CreateLevel(code:String, attributes:Array, success:Callback, error:Callback) : MetaSharedDataQueryGSONLY
      {
         var data:ByteArray = MetaDataEncryption.GetEncryptedByteArray(code);
         var objAtt:Object = MetaCustomField.GetObjectFromArray(attributes);
         var metaCall:MetaSharedDataQueryGSONLY = new MetaSharedDataQueryGSONLY(success,error,"Create Level");
         this.InitCall(metaCall,GamerSafe.api.levelVaultCreateLevelWithAttributes(data,objAtt));
         return metaCall;
      }
      
      public function PopupForIncorrectDataStorage(yesCallback:Callback, noCallback:Callback) : void
      {
         this._yesCallback = yesCallback;
         this._noCallback = noCallback;
         GamerSafe.api.onConfirmYes = this.confirmYes;
         GamerSafe.api.onConfirmNo = this.confirmNo;
         GamerSafe.api.showMessageBox(TextFactory.instance.GetMsg(TextFactory.ID_GS_NEED_LOG_TITLE),TextFactory.instance.GetMsg(TextFactory.ID_GS_NEED_LOG),true);
      }
      
      public function Connect(root:MovieClip, pSuccess:Callback = null, pError:Callback = null) : void
      {
         root.addChild(new GamerSafe(root,this._passCode,this._hashSeed));
         GamerSafe.api.onBeginSession = this.onBeginSession;
         GamerSafe.api.onBeginSessionFailed = this.onBeginSessionFailed;
         GamerSafe.api.onLogin = this.onLogInSuccess;
         GamerSafe.api.onLoginFailed = this.onLoginError;
         GamerSafe.api.onItemPurchase = this.onItemPurchase;
         GamerSafe.api.onConsumptionCompleted = this.onItemPurchase;
         GamerSafe.api.onLevelVaultGotLevel = this.onGetLevel;
         GamerSafe.api.onLevelVaultGotLevels = this.onGetLevels;
         GamerSafe.api.onLevelVaultLevelCreated = this.onLevelCreated;
         GamerSafe.api.onLevelVaultLevelDeleted = this.onLevelDeleted;
         GamerSafe.api.onLevelVaultLevelEdited = this.onLevelEdited;
         GamerSafe.api.onLevelVaultLevelFlagged = this.onLevelFlagged;
         GamerSafe.api.onLevelVaultLevelRated = this.onLevelRated;
         GamerSafe.api.onLevelVaultLevelNumericsSet = this.onLevelNumericsSet;
         GamerSafe.api.onLevelVaultLevelStringsSet = this.onLevelStringSet;
         this._connectSuccessCallback = pSuccess;
         this._connectErrorCallback = pError;
         this._timer = new Timer(1000);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimerTick);
      }
      
      protected function onGetLevel() : void
      {
         var data:LevelVaultSharedData = new LevelVaultSharedData();
         data.Init(GamerSafe.api.levelVaultGetLastSelectedLevel());
         this.EndTransactionWithLevelVault([data]);
      }
      
      public function ClearLevelVaultQueue() : void
      {
         this._callQueues = [];
         this._levelVaultBusy = false;
      }
      
      public function ShowItem(m:MetaExternalPremiumItem) : void
      {
         if(m == null)
         {
            return;
         }
         if(this.connected)
         {
            GamerSafe.api.purchaseItemInterface(m.idGS);
            return;
         }
         this._lastItemPurchased = {"itemID":m.idGS};
         if(this._onPurchaseCallback != null)
         {
            this._onPurchaseCallback.DoCallback();
         }
      }
      
      public function get savedData() : String
      {
         if(!this.connected)
         {
            return null;
         }
         return GamerSafe.api.getSavedGame(this._idSavedGame);
      }
      
      public function get goldCurrencyName() : String
      {
         return "GamerGold";
      }
      
      private function onPersistentError() : void
      {
         if(this._levelVaultPersistentCallbackError != null)
         {
            this._levelVaultPersistentCallbackError.DoCallback();
         }
      }
      
      public function SendScore(score:int, extra:Object, m:MetaExternalScoreboard) : void
      {
         if(!this.connected || m == null)
         {
            return;
         }
         GamerSafe.api.showScoreSubmit(score,String(extra),false,m.idBoardGS);
      }
      
      public function get canShowHighscore() : Boolean
      {
         return true;
      }
      
      public function set onDataLoadedCallback(c:Callback) : void
      {
         this._onDataLoadedCallback = c;
      }
      
      public function SaveData(s:String, onDone:Callback) : void
      {
         if(!this.connected)
         {
            return;
         }
         if(s.length > 10000)
         {
            trace("***WARNING*** GamerSafe Data is over 10k, save probably won\'t work. ");
         }
         GamerSafe.api.setSavedGame(s,this._idSavedGame);
      }
      
      public function SetStringAttribute(id:int, key:String, value:String, success:Callback, error:Callback) : MetaSharedDataQueryGSONLY
      {
         var metaCall:MetaSharedDataQueryGSONLY = new MetaSharedDataQueryGSONLY(success,error,"SetStringAttribute Level #" + id);
         this.InitCall(metaCall,GamerSafe.api.levelVaultSetStringAttribute(id,key,value));
         return metaCall;
      }
      
      public function GetLevelById(id:int, success:Callback, error:Callback) : MetaSharedDataQueryGSONLY
      {
         var metaCall:MetaSharedDataQueryGSONLY = new MetaSharedDataQueryGSONLY(success,error,"Get Level #" + id);
         this.InitCall(metaCall,GamerSafe.api.levelVaultFetchLevelByID(id));
         return metaCall;
      }
      
      public function get isLevelVaultBusy() : Boolean
      {
         return this._levelVaultBusy;
      }
      
      public function get pointCurrencyName() : String
      {
         return "GamerPoint";
      }
      
      public function SendLevel(level:int, extra:Object) : void
      {
      }
      
      public function set onPurchaseCallback(onPurchaseCallback:Callback) : void
      {
         this._onPurchaseCallback = onPurchaseCallback;
      }
   }
}

