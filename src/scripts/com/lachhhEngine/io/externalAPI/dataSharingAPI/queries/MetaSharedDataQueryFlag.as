package com.lachhhEngine.io.externalAPI.dataSharingAPI.queries
{
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.MetaSharedData;
   
   public class MetaSharedDataQueryFlag extends MetaSharedDataQuery
   {
      
      private var _metaData:MetaSharedData;
      
      public function MetaSharedDataQueryFlag(data:MetaSharedData, timeOut:int = -1, success:Callback = null, error:Callback = null, debugName:String = "")
      {
         super(timeOut,success,error,debugName);
         this._metaData = data;
      }
      
      public function get metaData() : MetaSharedData
      {
         return this._metaData;
      }
   }
}

