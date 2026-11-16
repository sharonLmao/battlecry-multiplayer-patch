package com.lachhhEngine.io.externalAPI.dataSharingAPI.queries
{
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.MetaSharedData;
   
   public class MetaSharedDataQuerySave extends MetaSharedDataQuery
   {
      
      private var _encryptData:Boolean;
      
      private var _metaData:MetaSharedData;
      
      public function MetaSharedDataQuerySave(metaData:MetaSharedData, timeOut:int = -1, success:Callback = null, error:Callback = null, encryptData:Boolean = true, debugName:String = "")
      {
         super(timeOut,success,error,debugName);
         this._metaData = metaData;
         this._encryptData = encryptData;
      }
      
      public function get encryptData() : Boolean
      {
         return this._encryptData;
      }
      
      public function get metaData() : MetaSharedData
      {
         return this._metaData;
      }
   }
}

