package playerio
{
   import flash.utils.ByteArray;
   
   public interface Message
   {
      
      function add(... rest) : void;
      
      function get length() : int;
      
      function getString(param1:int) : String;
      
      function toString() : String;
      
      function getUInt(param1:int) : uint;
      
      function getBoolean(param1:int) : Boolean;
      
      function set type(param1:String) : void;
      
      function getInt(param1:int) : int;
      
      function get type() : String;
      
      function getByteArray(param1:int) : ByteArray;
      
      function getNumber(param1:int) : Number;
   }
}

