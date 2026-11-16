package playerio
{
   import flash.display.Stage;
   
   public interface Client
   {
      
      function get connectUserId() : String;
      
      function get multiplayer() : Multiplayer;
      
      function get stage() : Stage;
      
      function get partnerPay() : PartnerPay;
      
      function get payVault() : PayVault;
      
      function get errorLog() : ErrorLog;
      
      function get bigDB() : BigDB;
      
      function get gameFS() : GameFS;
   }
}

