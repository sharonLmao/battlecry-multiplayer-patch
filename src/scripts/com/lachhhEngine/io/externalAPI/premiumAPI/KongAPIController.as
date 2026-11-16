package com.lachhhEngine.io.externalAPI.premiumAPI
{
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.LoadingShower;
   import com.lachhhEngine.io.SiteLocking;
   import com.lachhhEngine.io.externalAPI.statsAPI.IStatsAPI;
   import com.lachhhEngine.io.externalAPI.statsAPI.MetaStatData;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.Security;
   
   public class KongAPIController implements IPremiumAPIController, IStatsAPI
   {
      
      private static var _instance:KongAPIController;
      
      private var _kongregate:*;
      
      private var _onPurchaseCallback:Callback;
      
      private var _connected:Boolean;
      
      private var _lastPremiumItemBought:MetaExternalPremiumItem;
      
      private var _root:MovieClip;
      
      private var _isOnKong:Boolean;
      
      private var _premiumItemPending:MetaExternalPremiumItem;
      
      private var _connecting:Boolean;
      
      private var _inventory:Array;
      
      private var _logInCallback:Callback;
      
      private var _loading:LoadingShower;
      
      public function KongAPIController()
      {
         super();
         this._connected = false;
         this._connecting = false;
         this._inventory = new Array();
         if(!_instance)
         {
            _instance = this;
            this._premiumItemPending = null;
            this._lastPremiumItemBought = null;
            return;
         }
         throw new Error("KongAPICreatedTwice");
      }
      
      public static function get instance() : KongAPIController
      {
         return _instance;
      }
      
      public function get canShowMyMoney() : Boolean
      {
         return false;
      }
      
      public function GetServerTime() : Date
      {
         return null;
      }
      
      public function InUse() : Boolean
      {
         return false;
      }
      
      public function ConsumeItem(m:MetaExternalPremiumItem, numToConsume:int, callback:Callback) : void
      {
         throw new Error("to be coded");
      }
      
      public function get connected() : Boolean
      {
         return this._connected;
      }
      
      public function get pointAcronym() : String
      {
         return "Kreds";
      }
      
      private function onUserItems(result:Object) : void
      {
         var str:String = null;
         var i:int = 0;
         var item:Object = null;
         trace("User item list received, success: " + result.success);
         if(result.success)
         {
            str = "";
            for(i = 0; i < result.data.length; i++)
            {
               item = result.data[i];
               str += i + 1 + ". " + item.identifier + ", " + item.id + "," + item.data;
               this._inventory.push(item);
            }
            if(this._logInCallback != null)
            {
               this._logInCallback.DoCallback();
            }
         }
      }
      
      public function IsLastItemPurchased(m:MetaExternalPremiumItem) : Boolean
      {
         if(this._lastPremiumItemBought == null)
         {
            return false;
         }
         return this._lastPremiumItemBought.idKong == m.idKong;
      }
      
      public function SendStat(m:MetaStatData) : void
      {
         this.SubmitData(m);
      }
      
      public function set onLogInCallback(c:Callback) : void
      {
         this._logInCallback = c;
      }
      
      private function onUpdateItems(result:Object) : void
      {
         var str:String = null;
         var i:int = 0;
         var item:Object = null;
         trace("User item list received, success: " + result.success);
         if(result.success)
         {
            this._inventory = [];
            str = "";
            for(i = 0; i < result.data.length; i++)
            {
               item = result.data[i];
               trace(i + 1 + ". " + item.identifier + ", " + item.id + "," + item.data);
               this._inventory.push(item);
               str += i + 1 + ". " + item.identifier + ", " + item.id + "," + item.data;
            }
         }
      }
      
      public function FlashBar() : void
      {
      }
      
      public function SubmitData(kongData:MetaStatData) : void
      {
         if(!this._isOnKong || this._kongregate == null || this._kongregate.stats == null)
         {
            return;
         }
         this._kongregate.stats.submit(kongData.name,kongData.value);
      }
      
      public function get nameOfSystem() : String
      {
         return "Kongregate";
      }
      
      public function get myGold() : int
      {
         return 0;
      }
      
      public function HasItem(m:MetaExternalPremiumItem) : Boolean
      {
         return this.GetItemNumBought(m) > 0;
      }
      
      public function GetItemNumBought(m:MetaExternalPremiumItem) : int
      {
         var item:Object = null;
         var cpt:int = 0;
         for(var i:int = 0; i < this._inventory.length; i++)
         {
            item = this._inventory[i];
            if(m.idKong.toLocaleLowerCase() == item.identifier.toLocaleLowerCase())
            {
               cpt++;
            }
         }
         return cpt;
      }
      
      public function get goldCurrencyName() : String
      {
         return "Kreds";
      }
      
      private function onPurchaseResult(result:Object) : void
      {
         if(result.success)
         {
            this._lastPremiumItemBought = this._premiumItemPending;
            this.kongregate.mtx.requestUserItemList(null,this.onUpdateItems);
            if(this._onPurchaseCallback != null)
            {
               this._onPurchaseCallback.DoCallback();
            }
            this._loading.Hide();
         }
         else
         {
            this._loading.Hide();
         }
         this._premiumItemPending = null;
      }
      
      private function loadComplete(event:Event) : void
      {
         this._kongregate = event.target.content;
         this._kongregate.services.connect();
         this._connected = true;
         if(this.loggedIn)
         {
            this.kongregate.mtx.requestUserItemList(null,this.onUserItems);
            this.kongregate.services.addEventListener("login",this.onKongregateInPageLogin);
         }
      }
      
      public function ShowStore(o:Object = null) : void
      {
         if(!this.loggedIn)
         {
            this.ShowLogin();
            return;
         }
      }
      
      public function get loggedIn() : Boolean
      {
         if(!this.connected)
         {
            return false;
         }
         return !this.kongregate.services.isGuest();
      }
      
      public function get serverStartingTime() : Date
      {
         return null;
      }
      
      public function ShowBar(o:Object = null) : void
      {
      }
      
      public function ShowItem(m:MetaExternalPremiumItem) : void
      {
         if(!this.loggedIn)
         {
            this.ShowLogin();
            return;
         }
         this.PurchaseItem(m);
      }
      
      public function Connect(root:MovieClip, success:Callback = null, error:Callback = null) : void
      {
         if(this._connected || this._connecting)
         {
            return;
         }
         this._connecting = true;
         this._root = root;
         this._loading = new LoadingShower();
         this._isOnKong = SiteLocking.IsInSite(root,VersionInfo.URL_SITELOCK_KONG);
         if(!this._isOnKong)
         {
            return;
         }
         var paramObj:Object = LoaderInfo(root.loaderInfo).parameters;
         var apiPath:String = paramObj.kongregate_api_path || "http://www.kongregate.com/flash/API_AS3_Local.swf";
         Security.allowDomain(apiPath);
         var request:URLRequest = new URLRequest(apiPath);
         var loader:Loader = new Loader();
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadComplete);
         loader.load(request);
         root.addChild(loader);
      }
      
      public function get goldAcronym() : String
      {
         return "Kreds";
      }
      
      public function ShowLogin(o:Object = null) : void
      {
         if(!this.connected)
         {
            return;
         }
         this.kongregate.services.showSignInBox();
      }
      
      private function PurchaseItem(m:MetaExternalPremiumItem) : void
      {
         if(!this.connected)
         {
            return;
         }
         this._premiumItemPending = m;
         this.kongregate.mtx.purchaseItems([m.idKong],this.onPurchaseResult);
         this._loading.Show(this._root);
      }
      
      public function GetItemCostGold(m:MetaExternalPremiumItem) : int
      {
         return 0;
      }
      
      public function HideBar() : void
      {
      }
      
      public function set onPurchaseCallback(c:Callback) : void
      {
         this._onPurchaseCallback = c;
      }
      
      public function GetItemCostPoint(m:MetaExternalPremiumItem) : int
      {
         return 0;
      }
      
      public function get myPoint() : int
      {
         return 0;
      }
      
      public function get accountName() : String
      {
         if(!this.connected)
         {
            return "";
         }
         return this.kongregate.services.getUsername();
      }
      
      public function get kongregate() : *
      {
         return this._kongregate;
      }
      
      public function get mustShowPurchasePopup() : Boolean
      {
         return false;
      }
      
      public function get pointCurrencyName() : String
      {
         return "Kreds";
      }
      
      public function SubmitDataArray(kongDatas:Array) : void
      {
         var kongMetaData:MetaStatData = null;
         if(!this._isOnKong || this._kongregate == null || this._kongregate.stats == null)
         {
            return;
         }
         for(var i:int = 0; i < kongDatas.length; i++)
         {
            kongMetaData = MetaStatData(kongDatas[i]);
            this.SubmitData(kongMetaData);
         }
      }
      
      private function onKongregateInPageLogin(event:Event) : void
      {
         this.kongregate.mtx.requestUserItemList(null,this.onUserItems);
      }
   }
}

