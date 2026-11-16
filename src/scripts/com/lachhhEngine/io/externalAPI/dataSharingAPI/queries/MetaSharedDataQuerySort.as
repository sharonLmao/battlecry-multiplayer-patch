package com.lachhhEngine.io.externalAPI.dataSharingAPI.queries
{
   public class MetaSharedDataQuerySort
   {
      
      public static const DEFAULT_SORT:MetaSharedDataQuerySort = new MetaSharedDataQuerySort();
      
      private var _ascending:Boolean = true;
      
      private var _offset:int = 0;
      
      private var _limit:int = 20;
      
      public function MetaSharedDataQuerySort()
      {
         super();
      }
      
      public function set offset(offset:int) : void
      {
         this._offset = offset;
      }
      
      public function set ascending(ascending:Boolean) : void
      {
         this._ascending = ascending;
      }
      
      public function get offset() : int
      {
         return this._offset;
      }
      
      public function set limit(limit:int) : void
      {
         this._limit = limit;
      }
      
      public function get limit() : int
      {
         return this._limit;
      }
      
      public function get ascending() : Boolean
      {
         return this._ascending;
      }
   }
}

