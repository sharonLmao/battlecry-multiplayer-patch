package com.lachhhEngine.io.externalAPI
{
   import com.lachhhEngine.io.Callback;
   import flash.display.MovieClip;
   
   public interface IExternalAPI
   {
      
      function get nameOfSystem() : String;
      
      function get connected() : Boolean;
      
      function Connect(param1:MovieClip, param2:Callback = null, param3:Callback = null) : void;
      
      function get loggedIn() : Boolean;
   }
}

