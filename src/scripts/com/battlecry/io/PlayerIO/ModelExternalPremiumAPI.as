package com.battlecry.io.PlayerIO
{
   import com.battlecry.meta.model.ModelObject;
   
   public class ModelExternalPremiumAPI extends ModelObject
   {
      
      private var _prefixId:String;
      
      public function ModelExternalPremiumAPI(id:int, prefixId:String)
      {
         super(id);
         this._prefixId = prefixId;
      }
      
      public function get prefixId() : String
      {
         return this._prefixId;
      }
   }
}

