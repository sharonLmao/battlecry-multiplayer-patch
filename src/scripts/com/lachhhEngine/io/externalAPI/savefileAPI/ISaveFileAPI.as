package com.lachhhEngine.io.externalAPI.savefileAPI
{
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.IExternalAPI;
   
   public interface ISaveFileAPI extends IExternalAPI
   {
      
      function get savedData() : String;
      
      function get isEmpty() : Boolean;
      
      function set onDataLoadedCallback(param1:Callback) : void;
      
      function ClearData() : void;
      
      function SaveData(param1:String, param2:Callback) : void;
      
      function get dataLoaded() : Boolean;
   }
}

