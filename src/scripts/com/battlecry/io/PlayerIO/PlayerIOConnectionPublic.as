package com.battlecry.io.PlayerIO
{
   import com.lachhhEngine.io.Callback;
   import flash.display.DisplayObject;
   import playerio.Client;
   import playerio.PlayerIO;
   
   public class PlayerIOConnectionPublic extends PlayerIOConnection
   {
      
      public function PlayerIOConnectionPublic(gameId:String, root:DisplayObject, debugMode:Boolean, debugName:String)
      {
         super(gameId,root,debugMode,debugName);
      }
      
      public function PublicConnect(success:Callback, error:Callback) : void
      {
         SetCallbacks(success,error);
         PlayerIO.connect(root.stage,gameId,"public","testuser","","",this.onConnectPublic,onConnectError);
      }
      
      private function onConnectPublic(client:Client) : void
      {
         DeclareSuccess(client,false);
         TraceMsg("Connected on \'public\' connection.");
      }
   }
}

