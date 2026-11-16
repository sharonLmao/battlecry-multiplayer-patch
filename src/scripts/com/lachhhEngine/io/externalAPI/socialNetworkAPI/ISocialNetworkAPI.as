package com.lachhhEngine.io.externalAPI.socialNetworkAPI
{
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.IExternalAPI;
   
   public interface ISocialNetworkAPI extends IExternalAPI
   {
      
      function GetFriendFromUid(param1:String) : MetaSocialNetworkUser;
      
      function SendNotification(param1:MetaSocialNetworkNotification, param2:Callback = null, param3:Callback = null) : void;
      
      function GetFriendAt(param1:int) : MetaSocialNetworkUser;
      
      function LoadPicture(param1:MetaSocialNetworkUser, param2:Callback = null) : void;
      
      function GetFriendFromName(param1:String) : MetaSocialNetworkUser;
      
      function get friendsLoaded() : Boolean;
      
      function get user() : MetaSocialNetworkUser;
      
      function get numFriends() : int;
   }
}

