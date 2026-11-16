package com.lachhhEngine.io.externalAPI.premiumAPI
{
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.externalAPI.GatchaController;
   
   public class MetaExternalPremiumItem
   {
      
      private var _idPayVault:String;
      
      private var _gatchaReason:String;
      
      private var _idPayVaultValue:int;
      
      private var _gatchaCost:int;
      
      private var _idMTV:String;
      
      private var _idMochiCoin:String;
      
      private var _idGatcha:String;
      
      private var _idGS:int;
      
      private var _idKong:String;
      
      public function MetaExternalPremiumItem(idGS:int = -1, idMochiCoin:String = "", idMTV:String = "", idGatcha:String = "", idKong:String = "", gatchaCost:int = 0, gatchaReason:String = "", idPayVault:String = "", idPayVaultValue:int = 0)
      {
         var g:GatchaController = null;
         super();
         this._idGS = idGS;
         this._idMochiCoin = idMochiCoin;
         this._idMTV = idMTV;
         this._idGatcha = idGatcha;
         this._idKong = idKong;
         this._gatchaCost = gatchaCost;
         this._gatchaReason = gatchaReason;
         this._idPayVault = idPayVault;
         this._idPayVaultValue = idPayVaultValue;
         if(ExternalAPIManager.getPremiumAPI() is GatchaController)
         {
            g = ExternalAPIManager.getPremiumAPI() as GatchaController;
            g.LoadNumItemBought(this);
         }
      }
      
      public function get idGS() : int
      {
         return this._idGS;
      }
      
      public function get idPayVaultValue() : int
      {
         return this._idPayVaultValue;
      }
      
      public function get idMTV() : String
      {
         return this._idMTV;
      }
      
      public function get idKong() : String
      {
         return this._idKong;
      }
      
      public function get idMochiCoin() : String
      {
         return this._idMochiCoin;
      }
      
      public function get idPayVault() : String
      {
         return this._idPayVault;
      }
      
      public function get gatchaReason() : String
      {
         return this._gatchaReason;
      }
      
      public function get gatchaCost() : int
      {
         return this._gatchaCost;
      }
      
      public function get idGatcha() : String
      {
         return this._idGatcha;
      }
   }
}

