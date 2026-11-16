package playerio
{
   public interface Connection
   {
      
      function addMessageHandler(param1:String, param2:Function) : void;
      
      function removeMessageHandler(param1:String, param2:Function) : void;
      
      function send(param1:String, ... rest) : void;
      
      function get connected() : Boolean;
      
      function removeDisconnectHandler(param1:Function) : void;
      
      function createMessage(param1:String, ... rest) : Message;
      
      function disconnect() : void;
      
      function addDisconnectHandler(param1:Function) : void;
      
      function sendMessage(param1:Message) : void;
   }
}

