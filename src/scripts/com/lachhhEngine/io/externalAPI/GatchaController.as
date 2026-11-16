package com.lachhhEngine.io.externalAPI
{
   import com.gatcha.api.GameEvent;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.achievementAPI.IAchievementAPI;
   import com.lachhhEngine.io.externalAPI.achievementAPI.MetaExternalAchievement;
   import com.lachhhEngine.io.externalAPI.premiumAPI.IPremiumAPIController;
   import com.lachhhEngine.io.externalAPI.premiumAPI.MetaExternalPremiumItem;
   import com.lachhhEngine.io.externalAPI.savefileAPI.ISaveFileAPI;
   import com.lachhhEngine.io.externalAPI.scoreAPI.IScoreAPI;
   import com.lachhhEngine.io.externalAPI.scoreAPI.MetaExternalScoreboard;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class GatchaController implements IScoreAPI, IAchievementAPI, ISaveFileAPI, IPremiumAPIController
   {
      
      private var _onPurchaseCallback:Callback;
      
      private var _itemsToLoad:Vector.<MetaExternalPremiumItem> = new Vector.<MetaExternalPremiumItem>();
      
      private var _lastItemRequested:MetaExternalPremiumItem = null;
      
      private var EMPTY:String = "[EMPTY]";
      
      private var _lastItemBought:MetaExternalPremiumItem = null;
      
      private var _loginSuccess:Callback;
      
      private var _itemPending:MetaExternalPremiumItem;
      
      private var _dictInventory:Array = new Array();
      
      private var _savedData:String = "";
      
      private var _onDataLoaded:Callback;
      
      private var _connected:Boolean;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var _loggedIn:Boolean;
      
      private var _loginError:Callback;
      
      private var _playerInfo:GatchaPlayerInfo = new GatchaPlayerInfo();
      
      private var STORAGE_GAME_KEY:String = "GAME";
      
      private var _onLoginCallback:Callback;
      
      public function GatchaController()
      {
         super();
      }
      
      public function InUse() : Boolean
      {
         return false;
      }
      
      private function onLoadSaveFileSuccess(e:GameEvent) : void
      {
         this._eventDispatcher.removeEventListener(GameEvent.GET_PERSISTENT_STORAGE_RESULT,this.onLoadSaveFileSuccess);
         this._eventDispatcher.removeEventListener(GameEvent.GET_PERSISTENT_STORAGE_FAIL,this.onLoadSaveFileFail);
         this._savedData = e.data;
         this.StartNextLoadItem();
         if(this._onDataLoaded)
         {
            this._onDataLoaded.DoCallback();
         }
      }
      
      public function get connected() : Boolean
      {
         return this._connected;
      }
      
      public function ConsumeItem(m:MetaExternalPremiumItem, numToConsume:int, callback:Callback) : void
      {
      }
      
      public function get pointAcronym() : String
      {
         return "";
      }
      
      public function get serverStartingTime() : Date
      {
         return null;
      }
      
      public function FlashBar() : void
      {
      }
      
      public function get mustShowPurchasePopup() : Boolean
      {
         return false;
      }
      
      public function get myGold() : int
      {
         return 0;
      }
      
      private function onPurchaseFail(e:Event) : void
      {
         this._lastItemRequested = null;
      }
      
      private function onSaveFail(e:Event) : void
      {
      }
      
      public function get isEmpty() : Boolean
      {
         return this._savedData == this.EMPTY;
      }
      
      public function get loggedIn() : Boolean
      {
         return this._loggedIn;
      }
      
      public function get dataLoaded() : Boolean
      {
         return this._savedData != "";
      }
      
      public function HideBar() : void
      {
      }
      
      public function ShowLogin(o:Object = null) : void
      {
      }
      
      private function onLoadSaveFileFail(e:Event) : void
      {
         this._eventDispatcher.removeEventListener(GameEvent.GET_PERSISTENT_STORAGE_RESULT,this.onLoadSaveFileSuccess);
         this._eventDispatcher.removeEventListener(GameEvent.GET_PERSISTENT_STORAGE_FAIL,this.onLoadSaveFileFail);
         this._savedData = this.EMPTY;
         this.StartNextLoadItem();
         if(this._onDataLoaded)
         {
            this._onDataLoaded.DoCallback();
         }
      }
      
      public function GetItemCostGold(m:MetaExternalPremiumItem) : int
      {
         return m.gatchaCost;
      }
      
      private function onLoadItemBoughtSuccess(e:GameEvent) : void
      {
         this._dictInventory[this._itemPending.idGatcha] = parseInt(e.data);
         this._itemPending = null;
         this._eventDispatcher.removeEventListener(GameEvent.GET_PERSISTENT_STORAGE_RESULT,this.onLoadItemBoughtSuccess);
         this._eventDispatcher.removeEventListener(GameEvent.GET_PERSISTENT_STORAGE_FAIL,this.onLoadItemBoughtFail);
         this.StartNextLoadItem();
      }
      
      public function GetItemCostPoint(m:MetaExternalPremiumItem) : int
      {
         return 0;
      }
      
      private function onSaveSuccess(e:Event) : void
      {
      }
      
      public function get goldAcronym() : String
      {
         return "CR";
      }
      
      public function get myPoint() : int
      {
         return 0;
      }
      
      public function ClearData() : void
      {
         this.SaveData(this.EMPTY,null);
      }
      
      private function onConnectSuccess(e:Event) : void
      {
         this._connected = this._loggedIn = true;
         this.LoadData(this.STORAGE_GAME_KEY);
         if(this._onLoginCallback)
         {
            this._onLoginCallback.DoCallback();
         }
         if(this._loginSuccess != null)
         {
            this._loginSuccess.DoCallback();
         }
      }
      
      public function get accountName() : String
      {
         return this._playerInfo.nickname;
      }
      
      private function onGetPlayerInfo(e:GameEvent) : void
      {
         this._playerInfo.Init(e.data);
         this._loggedIn = true;
      }
      
      public function GetServerTime() : Date
      {
         return null;
      }
      
      public function IsLastItemPurchased(m:MetaExternalPremiumItem) : Boolean
      {
         return m == this._lastItemBought;
      }
      
      public function ShowHighscore(m:MetaExternalScoreboard) : void
      {
      }
      
      private function StartNextLoadItem() : void
      {
         if(!this.dataLoaded)
         {
            return;
         }
         if(this._itemPending != null)
         {
            return;
         }
         if(this._itemsToLoad.length <= 0)
         {
            return;
         }
         this._itemPending = this._itemsToLoad.shift();
         this._eventDispatcher.addEventListener(GameEvent.GET_PERSISTENT_STORAGE_RESULT,this.onLoadItemBoughtSuccess);
         this._eventDispatcher.addEventListener(GameEvent.GET_PERSISTENT_STORAGE_FAIL,this.onLoadItemBoughtFail);
         this.LoadData(this._itemPending.idGatcha);
      }
      
      public function get nameOfSystem() : String
      {
         return "Gatcha";
      }
      
      public function LoadNumItemBought(m:MetaExternalPremiumItem) : void
      {
         this._itemsToLoad.push(m);
         this.StartNextLoadItem();
      }
      
      public function set onLogInCallback(c:Callback) : void
      {
         this._onLoginCallback = c;
      }
      
      public function GetItemNumBought(m:MetaExternalPremiumItem) : int
      {
         return this._dictInventory[m.idGatcha];
      }
      
      public function SendGameOver(score:int, extra:Object) : void
      {
      }
      
      public function HasItem(m:MetaExternalPremiumItem) : Boolean
      {
         return this.GetItemNumBought(m) >= 1;
      }
      
      public function SendLevel(level:int, extra:Object) : void
      {
      }
      
      public function ShowBar(o:Object = null) : void
      {
      }
      
      public function get canShowMyMoney() : Boolean
      {
         return false;
      }
      
      private function onConnectFail(e:Event) : void
      {
         if(this._loginError != null)
         {
            this._loginError.DoCallback();
         }
      }
      
      public function bestowAchievement(m:MetaExternalAchievement) : void
      {
         if(m.gatcha == null)
         {
            return;
         }
         this._eventDispatcher.dispatchEvent(new GameEvent(GameEvent.ACHIEVEMENT_REACHED,m.gatcha.GetObject()));
      }
      
      private function LoadData(key:String) : void
      {
         this._eventDispatcher.dispatchEvent(new GameEvent(GameEvent.GET_PERSISTENT_STORAGE,key));
      }
      
      public function Connect(root:MovieClip, success:Callback = null, error:Callback = null) : void
      {
         this._eventDispatcher = root;
         this._loginSuccess = success;
         this._loginError = error;
         this._eventDispatcher.addEventListener(GameEvent.SINGLEPLAYER_START_GAME_RESULT,this.onConnectSuccess);
         this._eventDispatcher.addEventListener(GameEvent.SINGLEPLAYER_START_GAME_FAIL,this.onConnectFail);
         this._eventDispatcher.addEventListener(GameEvent.PUT_PERSISTENT_STORAGE_RESULT,this.onSaveSuccess);
         this._eventDispatcher.addEventListener(GameEvent.PUT_PERSISTENT_STORAGE_FAIL,this.onSaveFail);
         this._eventDispatcher.addEventListener(GameEvent.GET_PERSISTENT_STORAGE_RESULT,this.onLoadSaveFileSuccess);
         this._eventDispatcher.addEventListener(GameEvent.GET_PERSISTENT_STORAGE_FAIL,this.onLoadSaveFileFail);
         this._eventDispatcher.addEventListener(GameEvent.GET_PLAYERINFO_RESULT,this.onGetPlayerInfo);
         this._eventDispatcher.addEventListener(GameEvent.GET_CREDITS_RESULT,this.onPurchaseSuccess);
         this._eventDispatcher.addEventListener(GameEvent.GET_CREDITS_FAIL,this.onPurchaseFail);
         this._connected = true;
         this._eventDispatcher.dispatchEvent(new GameEvent(GameEvent.GET_PLAYERINFO));
         this._eventDispatcher.dispatchEvent(new GameEvent(GameEvent.SINGLEPLAYER_START_GAME));
      }
      
      public function ShowStore(o:Object = null) : void
      {
      }
      
      public function get goldCurrencyName() : String
      {
         return "Credits";
      }
      
      public function ShowItem(m:MetaExternalPremiumItem) : void
      {
         if(m == null)
         {
            return;
         }
         if(this._lastItemRequested != null)
         {
            return;
         }
         if(m.gatchaCost == 0)
         {
            throw new Error("MetaExternalPremiumItem.gatchaCost == 0,  enter right number");
         }
         var o:Object = new Object();
         o.amount = m.gatchaCost;
         o.reason = m.gatchaReason;
         this._eventDispatcher.dispatchEvent(new GameEvent(GameEvent.GET_CREDITS,o));
         this._lastItemRequested = m;
      }
      
      public function get savedData() : String
      {
         return this._savedData;
      }
      
      public function get canShowHighscore() : Boolean
      {
         return false;
      }
      
      private function onLoadItemBoughtFail(e:GameEvent) : void
      {
         this._dictInventory[this._itemPending.idGatcha] = 0;
         this._itemPending = null;
         this._eventDispatcher.removeEventListener(GameEvent.GET_PERSISTENT_STORAGE_RESULT,this.onLoadItemBoughtSuccess);
         this._eventDispatcher.removeEventListener(GameEvent.GET_PERSISTENT_STORAGE_FAIL,this.onLoadItemBoughtFail);
         this.StartNextLoadItem();
      }
      
      public function SendScore(score:int, extra:Object, m:MetaExternalScoreboard) : void
      {
         this._eventDispatcher.dispatchEvent(new GameEvent(GameEvent.SINGLEPLAYER_UPDATE_HIGHSCORE,score));
      }
      
      private function onPurchaseSuccess(e:Event) : void
      {
         this._lastItemBought = this._lastItemRequested;
         this._lastItemRequested = null;
         var numBought:int = this.GetItemNumBought(this._lastItemBought) + 1;
         this._dictInventory[this._lastItemBought.idGatcha] = numBought;
         this.SaveDataWithKey(numBought + "",this._lastItemBought.idGatcha,null);
         if(this._onPurchaseCallback)
         {
            this._onPurchaseCallback.DoCallback();
         }
      }
      
      public function SaveData(s:String, onDone:Callback) : void
      {
         this.SaveDataWithKey(s,this.STORAGE_GAME_KEY,onDone);
      }
      
      private function SaveDataWithKey(s:String, key:String, onDone:Callback) : void
      {
         var o:Object = new Object();
         o.key = key;
         o.value = s;
         this._eventDispatcher.dispatchEvent(new GameEvent(GameEvent.PUT_PERSISTENT_STORAGE,o));
      }
      
      public function set onDataLoadedCallback(c:Callback) : void
      {
         this._onDataLoaded = c;
      }
      
      public function get pointCurrencyName() : String
      {
         return "";
      }
      
      public function set onPurchaseCallback(c:Callback) : void
      {
         this._onPurchaseCallback = c;
      }
   }
}

