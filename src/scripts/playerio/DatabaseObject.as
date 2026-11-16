package playerio
{
   public dynamic class DatabaseObject
   {
      
      public function DatabaseObject()
      {
         super();
      }
      
      public function save(useOptimisticLocks:Boolean = false, fullOverwrite:Boolean = false, callback:Function = null, errorHandler:Function = null) : void
      {
      }
      
      public function get table() : String
      {
         return "";
      }
      
      public function get key() : String
      {
         return "";
      }
   }
}

