package com.lachhhEngine.io.externalAPI.premiumAPI
{
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.IExternalAPI;
   
   public interface IPremiumAPIController extends IExternalAPI
   {
      
      function InUse() : Boolean;
      
      function get goldAcronym() : String;
      
      function ShowStore(param1:Object = null) : void;
      
      function GetServerTime() : Date;
      
      function get canShowMyMoney() : Boolean;
      
      function set onPurchaseCallback(param1:Callback) : void;
      
      function get myPoint() : int;
      
      function ShowLogin(param1:Object = null) : void;
      
      function ConsumeItem(param1:MetaExternalPremiumItem, param2:int, param3:Callback) : void;
      
      function ShowItem(param1:MetaExternalPremiumItem) : void;
      
      function HideBar() : void;
      
      function get pointAcronym() : String;
      
      function GetItemCostGold(param1:MetaExternalPremiumItem) : int;
      
      function IsLastItemPurchased(param1:MetaExternalPremiumItem) : Boolean;
      
      function get accountName() : String;
      
      function GetItemCostPoint(param1:MetaExternalPremiumItem) : int;
      
      function set onLogInCallback(param1:Callback) : void;
      
      function get serverStartingTime() : Date;
      
      function FlashBar() : void;
      
      function get mustShowPurchasePopup() : Boolean;
      
      function GetItemNumBought(param1:MetaExternalPremiumItem) : int;
      
      function get pointCurrencyName() : String;
      
      function HasItem(param1:MetaExternalPremiumItem) : Boolean;
      
      function get myGold() : int;
      
      function ShowBar(param1:Object = null) : void;
      
      function get goldCurrencyName() : String;
   }
}

