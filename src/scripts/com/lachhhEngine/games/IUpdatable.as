package com.lachhhEngine.games
{
   public interface IUpdatable
   {
      
      function OnAdd(param1:Game) : void;
      
      function SetEnable(param1:Boolean) : void;
      
      function IsEnabled() : Boolean;
      
      function Update(param1:Game) : void;
      
      function OnRemove(param1:Game) : void;
   }
}

