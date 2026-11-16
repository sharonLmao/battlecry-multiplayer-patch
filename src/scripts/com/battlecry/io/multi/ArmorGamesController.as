package com.battlecry.io.multi
{
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.premiumAPI.IPremiumAPIController;
   import com.lachhhEngine.io.externalAPI.premiumAPI.MetaExternalPremiumItem;
   import flash.display.MovieClip;
   
   public class ArmorGamesController implements IPremiumAPIController
   {
      
      private var _armor_auth_token:String;
      
      private var _connected:Boolean = false;
      
      private var _armor_user_id:String;
      
      private var _loggedIn:Boolean = false;
      
      private var _debug:Boolean = false;
      
      public function ArmorGamesController(userID:String, authToken:String, debug:Boolean, debugLog:Boolean)
      {
         super();
         this._armor_user_id = userID;
         this._armor_auth_token = authToken;
         this._connected = true;
         this._debug = debug;
         if(this._debug)
         {
            if(debugLog)
            {
               this.DebugFetchAuth();
            }
            else
            {
               this._loggedIn = false;
            }
         }
         else if(this._armor_user_id == null || this._armor_user_id == "" || this._armor_auth_token == null || this._armor_auth_token == "")
         {
            this._loggedIn = false;
         }
         else
         {
            this._loggedIn = true;
         }
      }
      
      public function GetServerTime() : Date
      {
         return null;
      }
      
      public function InUse() : Boolean
      {
         return null;
      }
      
      public function DebugFetchAuth() : void
      {
         this._armor_user_id = "70bfb238c4613d1619ebc3eb6ea43c8b";
         this._armor_auth_token = "6815462295219087ca9b2ce91f1fed9f";
         this._loggedIn = true;
      }
      
      public function get pointAcronym() : String
      {
         return null;
      }
      
      public function ConsumeItem(m:MetaExternalPremiumItem, numToConsume:int, callback:Callback) : void
      {
      }
      
      public function get connected() : Boolean
      {
         return this._connected;
      }
      
      public function IsLastItemPurchased(m:MetaExternalPremiumItem) : Boolean
      {
         return null;
      }
      
      public function FlashBar() : void
      {
      }
      
      public function get mustShowPurchasePopup() : Boolean
      {
         return null;
      }
      
      public function get nameOfSystem() : String
      {
         return "ArmorGames";
      }
      
      public function HasItem(m:MetaExternalPremiumItem) : Boolean
      {
         return null;
      }
      
      public function GetItemNumBought(m:MetaExternalPremiumItem) : int
      {
         return 0;
      }
      
      public function get authToken() : String
      {
         return this._armor_auth_token;
      }
      
      public function get serverStartingTime() : Date
      {
         return null;
      }
      
      public function get myGold() : int
      {
         return 0;
      }
      
      public function get goldCurrencyName() : String
      {
         return null;
      }
      
      public function ShowBar(o:Object = null) : void
      {
      }
      
      public function set onLogInCallback(c:Callback) : void
      {
      }
      
      public function get goldAcronym() : String
      {
         return null;
      }
      
      public function ShowStore(o:Object = null) : void
      {
      }
      
      public function get userId() : String
      {
         return this._armor_user_id;
      }
      
      public function get loggedIn() : Boolean
      {
         return this._loggedIn;
      }
      
      public function Connect(root:MovieClip, success:Callback = null, error:Callback = null) : void
      {
      }
      
      public function ShowItem(m:MetaExternalPremiumItem) : void
      {
      }
      
      public function get debug() : Boolean
      {
         return this._debug;
      }
      
      public function GetItemCostGold(m:MetaExternalPremiumItem) : int
      {
         return 0;
      }
      
      public function GetItemCostPoint(m:MetaExternalPremiumItem) : int
      {
         return 0;
      }
      
      public function ShowLogin(o:Object = null) : void
      {
      }
      
      public function get myPoint() : int
      {
         return 0;
      }
      
      public function get canShowMyMoney() : Boolean
      {
         return null;
      }
      
      public function HideBar() : void
      {
      }
      
      public function set onPurchaseCallback(c:Callback) : void
      {
      }
      
      public function get accountName() : String
      {
         return null;
      }
      
      public function get pointCurrencyName() : String
      {
         return null;
      }
   }
}

