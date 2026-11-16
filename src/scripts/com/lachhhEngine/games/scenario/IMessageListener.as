package com.lachhhEngine.games.scenario
{
   public interface IMessageListener
   {
      
      function OnMessage(param1:String) : void;
      
      function get tag() : String;
   }
}

