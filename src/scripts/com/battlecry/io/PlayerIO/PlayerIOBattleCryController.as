package com.battlecry.io.PlayerIO
{
   import com.battlecry.init.BC_VersionInfo;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.externalAPI.premiumAPI.KongAPIController;
   import com.lachhhEngine.io.externalAPI.premiumAPI.MetaExternalPremiumItem;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.Security;
   import playerio.PlayerIOError;
   
   public class PlayerIOBattleCryController
   {
      
      private static var _instance:PlayerIOBattleCryController;
      
      private static var _modelExternsalAPI:ModelExternalPremiumAPI;
      
      private static var PIO_ID:String = "battlecry-qbkbf5in3epjv941j6vg";
      
      private var _mySecuredConnection:PlayerIOConnectionSecure;
      
      private var _myPublicConnection:PlayerIOConnectionPublic;
      
      private var _lastItemBought:MetaExternalPremiumItem;
      
      private var _pendingItemBought:MetaExternalPremiumItem;
      
      public function PlayerIOBattleCryController(root:DisplayObject, modelExternsalAPI:ModelExternalPremiumAPI, debugMode:Boolean)
      {
         super();
         _modelExternsalAPI = modelExternsalAPI;
         this._mySecuredConnection = new PlayerIOConnectionSecure(PIO_ID,root,debugMode,"SECURED");
         this._myPublicConnection = new PlayerIOConnectionPublic(PIO_ID,root,debugMode,"PUBLIC");
         this._myPublicConnection.PublicConnect(null,null);
         Security.allowDomain("*");
         Security.allowDomain("playerio.com");
      }
      
      public static function InitInstance(root:DisplayObject, modelExternal:ModelExternalPremiumAPI, debugMode:Boolean) : void
      {
         if(_instance == null)
         {
            _instance = new PlayerIOBattleCryController(root,modelExternal,debugMode);
         }
      }
      
      public static function getInstance() : PlayerIOBattleCryController
      {
         return _instance;
      }
      
      public function get myPublicConnection() : PlayerIOConnection
      {
         return this._myPublicConnection;
      }
      
      public function GetItemNumBought(m:MetaExternalPremiumItem) : int
      {
         if(this._mySecuredConnection.client == null)
         {
            return 0;
         }
         return this._mySecuredConnection.client.payVault.count(m.idPayVault);
      }
      
      public function set pendingItemBought(pendingItemBought:MetaExternalPremiumItem) : void
      {
         this._pendingItemBought = pendingItemBought;
      }
      
      public function ShowLogin() : void
      {
         switch(_modelExternsalAPI.id)
         {
            case ModelExternalPremiumAPIEnum.KONGREGATE.id:
            case ModelExternalPremiumAPIEnum.GAMERSAFE.id:
               ExternalAPIManager.getPremiumAPI().ShowLogin();
         }
      }
      
      public function set lastItemBought(lastItemBought:MetaExternalPremiumItem) : void
      {
         this._lastItemBought = lastItemBought;
      }
      
      public function ShowItem(m:MetaExternalPremiumItem) : void
      {
         if(this._mySecuredConnection.client == null)
         {
            return;
         }
         this._mySecuredConnection.client.payVault.getBuyDirectInfo("paypal",{
            "currency":"USD",
            "item_name":m.idPayVault
         },[{"itemKey":m.idPayVault}],this.onItemPurchased,this.onItemPurchasedError);
      }
      
      public function get nameOfSystem() : String
      {
         return "PlayerIO";
      }
      
      public function get lastItemBought() : MetaExternalPremiumItem
      {
         return this._lastItemBought;
      }
      
      public function get pendingItemBought() : MetaExternalPremiumItem
      {
         return this._pendingItemBought;
      }
      
      public function Reconnect(root:MovieClip, userID:String, success:Callback = null, error:Callback = null) : void
      {
         this._mySecuredConnection.Reconnect(root,userID,success,error);
      }
      
      private function onItemPurchased(o:Object) : void
      {
         navigateToURL(new URLRequest(o.paypalurl),"_blank");
      }
      
      public function Consume(m:MetaExternalPremiumItem, consumeSuccess:Function, consumeFail:Function) : void
      {
         if(this._mySecuredConnection.client == null)
         {
            return;
         }
         this._mySecuredConnection.client.payVault.consume([this._mySecuredConnection.client.payVault.first(m.idPayVault)],consumeSuccess,consumeFail);
      }
      
      public function SecureConnectWithPIO(success:Callback, error:Callback) : void
      {
         var userid:String = null;
         var token:String = null;
         switch(_modelExternsalAPI.id)
         {
            case ModelExternalPremiumAPIEnum.ARMORGAMES.id:
               userid = BC_VersionInfo.armorGamesController.userId;
               token = BC_VersionInfo.armorGamesController.authToken;
               this._mySecuredConnection.SecureConnectArmorGames(userid,token,success,error);
               break;
            case ModelExternalPremiumAPIEnum.KONGREGATE.id:
               userid = (ExternalAPIManager.getPremiumAPI() as KongAPIController).kongregate.services.getUserId();
               token = KongAPIController.instance.kongregate.services.getGameAuthToken();
               this._mySecuredConnection.SecureConnectKongregate(userid,token,success,error);
               break;
            case ModelExternalPremiumAPIEnum.GAMERSAFE.id:
               this._mySecuredConnection.SecureConnectGamerSafe("GS_guest1","",success,error);
         }
      }
      
      private function onItemPurchasedError(e:PlayerIOError) : void
      {
         this._pendingItemBought = null;
      }
      
      public function get mySecuredConnection() : PlayerIOConnectionSecure
      {
         return this._mySecuredConnection;
      }
   }
}

