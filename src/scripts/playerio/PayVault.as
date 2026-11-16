package playerio
{
   public interface PayVault
   {
      
      function get items() : Array;
      
      function get coins() : int;
      
      function buy(param1:Array, param2:Boolean, param3:Function = null, param4:Function = null) : void;
      
      function getBuyDirectInfo(param1:String, param2:Object, param3:Array, param4:Function = null, param5:Function = null) : void;
      
      function debit(param1:uint, param2:String, param3:Function = null, param4:Function = null) : void;
      
      function count(param1:String) : uint;
      
      function first(param1:String) : VaultItem;
      
      function give(param1:Array, param2:Function = null, param3:Function = null) : void;
      
      function getBuyCoinsInfo(param1:String, param2:Object, param3:Function = null, param4:Function = null) : void;
      
      function credit(param1:uint, param2:String, param3:Function = null, param4:Function = null) : void;
      
      function has(param1:String) : Boolean;
      
      function refresh(param1:Function = null, param2:Function = null) : void;
      
      function consume(param1:Array, param2:Function = null, param3:Function = null) : void;
      
      function readHistory(param1:uint, param2:uint, param3:Function = null, param4:Function = null) : void;
   }
}

