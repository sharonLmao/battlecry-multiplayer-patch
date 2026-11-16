package com.battlecry.io.PlayerIO
{
   import com.battlecry.Main;
   import com.battlecry.init.BC_VersionInfo;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.externalAPI.premiumAPI.KongAPIController;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import playerio.Client;
   import playerio.Connection;
   import playerio.Message;
   import playerio.PlayerIO;
   import playerio.PlayerIOError;
   
   public class PlayerIOConnectionSecure extends PlayerIOConnection
   {
      
      public var userId:String;
      
      public var myAccountName:String = "";
      
      public var msgAuthType:String;
      
      public var authToken:String;
      
      public var myDate:Date;
      
      private var _connection:Connection;
      
      public function PlayerIOConnectionSecure(gameId:String, root:DisplayObject, debugMode:Boolean, debugName:String)
      {
         super(gameId,root,debugMode,debugName);
         partner = "";
         this.msgAuthType = "";
      }
      
      private function onAuthaurizationMsg(m:Message) : void
      {
         var bidon1:String = null;
         var auAuthBidon1:String = null;
         var bidon:String = null;
         var auAuthBidon:String = null;
         var auAuth:String = null;
         if(m.length == 0)
         {
            onConnectError(new PlayerIOError("Secured authorizatioon failed",27667));
            this._connection.disconnect();
            this._connection = null;
         }
         else
         {
            TraceMsg("Received Auth Info From Server.");
            if(BC_VersionInfo.modelExternalAPI.id == ModelExternalPremiumAPIEnum.ARMORGAMES.id)
            {
               bidon1 = m.getString(0);
               auAuthBidon1 = m.getString(1);
               Main.instance.serverDay = m.getInt(2);
               this.onSecuredConnectSuccessArmorGames();
            }
            else if(BC_VersionInfo.modelExternalAPI.id == ModelExternalPremiumAPIEnum.KONGREGATE.id)
            {
               bidon = m.getString(0);
               auAuthBidon = m.getString(1);
               Main.instance.serverDay = m.getInt(2);
               this.onSecuredConnectSuccessKong();
            }
            else
            {
               this.myAccountName = m.getString(0);
               auAuth = m.getString(1);
               Main.instance.serverDay = m.getInt(2);
               PlayerIO.connect(root.stage,gameId,"secure",this.myAccountName,auAuth,partner,this.onSecuredConnectSuccess,function(e:PlayerIOError):void
               {
                  onConnectError(e);
                  _connection.disconnect();
                  _connection = null;
               });
            }
         }
      }
      
      private function onSecuredConnectSuccessKong() : void
      {
         this._connection.disconnect();
         this._connection = null;
         ExternalAPIManager.SetSaveFileAPI(this);
         Main.instance.AddDataLoadedCallBack();
         Main.instance.SetPurchaseCallback();
         DeclareSuccess(client,true);
         TraceMsg("Secure Connect SUCCESS!");
      }
      
      private function onSecuredConnectSuccess(client:Client) : void
      {
         this._connection.disconnect();
         this._connection = null;
         ExternalAPIManager.SetSaveFileAPI(this);
         Main.instance.AddDataLoadedCallBack();
         Main.instance.SetPurchaseCallback();
         DeclareSuccess(client,true);
         TraceMsg("Secure Connect SUCCESS!");
      }
      
      public function SecureConnectKongregate(pUserId:String, pAuthToken:String, success:Callback = null, error:Callback = null) : void
      {
         partner = "kongregate";
         this.msgAuthType = "authKongregate";
         this.userId = "KG_" + (ExternalAPIManager.getPremiumAPI() as KongAPIController).accountName;
         this.authToken = pAuthToken;
         this.myAccountName = "KG_" + (ExternalAPIManager.getPremiumAPI() as KongAPIController).accountName;
         PlayerIO.connect(root.stage,gameId,"public",this.myAccountName,"","",this.CheckKongTime,onConnectError);
         SetCallbacks(success,error);
      }
      
      private function onRoomConnected(con:Connection) : void
      {
         this._connection = con;
         con.addMessageHandler("auth",this.onAuthaurizationMsg);
         con.send(this.msgAuthType,this.userId,this.authToken);
         TraceMsg("AuthRoom Joined.");
         TraceMsg("Sending Auth...");
      }
      
      public function CheckKongTime(client:Client) : void
      {
         if(debugMode)
         {
            client.multiplayer.developmentServer = "localhost:8184";
         }
         client.multiplayer.createJoinRoom(null,"AuthRoom",false,{},{},this.onRoomConnected,onConnectError);
         SetClient(client);
         TraceMsg("Connected on \'public\' connection.");
         TraceMsg("Joining AuthRoom...");
      }
      
      public function SecureConnect(success:Callback, error:Callback) : void
      {
         if(connectPending)
         {
            return;
         }
         DeclarePending();
         SetCallbacks(success,error);
         PlayerIO.connect(root.stage,gameId,"public",Main.instance.GetPIOid(),"",partner,this.onConnectTemp,onConnectError);
         TraceMsg("Attempting Connect With GamerSafe");
      }
      
      public function SecureConnectGamerSafe(pUserId:String, pAuthToken:String, success:Callback, error:Callback) : void
      {
         partner = "gamersafe";
         this.msgAuthType = "authGamerSafe";
         this.userId = pUserId;
         this.authToken = pAuthToken;
         this.SecureConnect(success,error);
      }
      
      private function onSecuredConnectSuccessArmorGames() : void
      {
         this._connection.disconnect();
         this._connection = null;
         ExternalAPIManager.SetSaveFileAPI(this);
         Main.instance.AddDataLoadedCallBack();
         Main.instance.SetPurchaseCallback();
         DeclareSuccess(client,true);
         TraceMsg("Secure Connect SUCCESS!");
      }
      
      public function SecureConnectArmorGames(pUserId:String, pAuthToken:String, success:Callback = null, error:Callback = null) : void
      {
         partner = "armorgames";
         this.msgAuthType = "authKongregate";
         this.userId = "AG_" + pUserId;
         this.authToken = pAuthToken;
         this.myAccountName = this.userId;
         PlayerIO.connect(root.stage,gameId,"public",this.myAccountName,"","",this.CheckArmorGamesTime,onConnectError);
         SetCallbacks(success,error);
         trace("SecureConnectArmorGames");
      }
      
      public function Reconnect(root:MovieClip, userID:String, success:Callback, error:Callback) : void
      {
         partner = "kongregate";
         this.msgAuthType = "authKongregate";
         this.userId = userID;
         this.myAccountName = "KG_" + (ExternalAPIManager.getPremiumAPI() as KongAPIController).accountName;
         this.authToken = KongAPIController.instance.kongregate.services.getGameAuthToken();
         SetCallbacks(success,error);
         PlayerIO.connect(root.stage,gameId,"public",this.myAccountName,"",partner,this.onConnectTemp,onConnectError);
      }
      
      private function onAuthaurizationMsgError(m:Message) : void
      {
         onConnectError(new PlayerIOError("Secured authorizatioon failed",27667));
         this._connection.disconnect();
         this._connection = null;
      }
      
      public function CheckArmorGamesTime(client:Client) : void
      {
         if(debugMode)
         {
            client.multiplayer.developmentServer = "localhost:8184";
         }
         client.multiplayer.createJoinRoom(null,"AuthRoom",false,{},{},this.onRoomConnected,onConnectError);
         SetClient(client);
         trace("CheckArmorGamesTime");
         TraceMsg("Connected on \'public\' connection.");
         TraceMsg("Joining AuthRoom...");
      }
      
      private function onConnectTemp(client:Client) : void
      {
         this.myAccountName = Main.instance.GetPIOid();
         Main.instance.serverDay = new Date().time / 86400000;
         TraceMsg("Connected on \'public\' connection.");
         TraceMsg("AuthRoom silent. Using public session as guest.");
         DeclareSuccess(client,true);
      }
   }
}

