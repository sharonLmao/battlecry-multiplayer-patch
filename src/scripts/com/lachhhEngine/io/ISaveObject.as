package com.lachhhEngine.io
{
   public interface ISaveObject
   {
      
      function get isDirty() : Boolean;
      
      function Decode(param1:String) : void;
      
      function Encode() : String;
      
      function set isDirty(param1:Boolean) : void;
   }
}

