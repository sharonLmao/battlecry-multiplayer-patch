package playerio
{
   internal class SimpleGameFS implements GameFS
   {
      
      private var wo:Object;
      
      private var gameId:String;
      
      public function SimpleGameFS(gameId:String, wo:Object)
      {
         super();
         this.gameId = gameId;
         this.wo = wo;
      }
      
      public function getURL(path:String) : String
      {
         if(path.substring(0,1) != "/")
         {
            throw new Error("GameFS paths must be absolute and start with a slash (/). IE PlayerIO.gameFS(\"[gameid]\").getURL(\"/folder/file.extention\")",0);
         }
         if(Boolean(this.wo.wrapper) && Boolean(this.wo.wrapper.content) && Boolean(this.wo.wrapper.content.hasOwnProperty("getURL")))
         {
            return this.wo.wrapper.content.getURL(this.gameId,path);
         }
         return "http://r.playerio.com/r/" + this.gameId + path;
      }
   }
}

