package com.lachhhEngine.io.externalAPI.dataSharingAPI.queries
{
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.MetaSharedData;
   
   public class MetaSharedDataQueryRate extends MetaSharedDataQuery
   {
      
      private var _metaSharedData:MetaSharedData;
      
      private var _rating:Number;
      
      public function MetaSharedDataQueryRate(metaSharedData:MetaSharedData, rating:Number, timeOut:int = -1, success:Callback = null, error:Callback = null, debugName:String = "")
      {
         super(timeOut,success,error,debugName);
         this._metaSharedData = metaSharedData;
         this._rating = rating;
      }
      
      public function get metaSharedData() : MetaSharedData
      {
         return this._metaSharedData;
      }
      
      public function get rating() : Number
      {
         return this._rating;
      }
   }
}

