package com.lachhhEngine.io.stats
{
   import com.lachhhEngine.io.encryption.SecureNumber;
   
   public class Stats
   {
      
      private var _debugName:String;
      
      private var _secureNumber:SecureNumber;
      
      public function Stats(secureNumber:SecureNumber, debugName:String)
      {
         super();
         this._secureNumber = secureNumber;
         this._debugName = debugName;
      }
      
      public function get secureNumber() : SecureNumber
      {
         return this._secureNumber;
      }
      
      public function get debugName() : String
      {
         return this._debugName;
      }
   }
}

