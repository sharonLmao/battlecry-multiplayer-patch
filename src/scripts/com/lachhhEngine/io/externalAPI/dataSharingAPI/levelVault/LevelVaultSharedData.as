package com.lachhhEngine.io.externalAPI.dataSharingAPI.levelVault
{
   import com.lachhhEngine.io.encryption.MetaDataEncryption;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.MetaSharedData;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.fields.MetaCustomField;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.fields.MetaCustomFieldNumber;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.fields.MetaCustomFieldString;
   import com.lachhhEngine.io.gamerSafe.GamerSafe;
   
   public class LevelVaultSharedData extends MetaSharedData
   {
      
      private var _numRating:int;
      
      private var _modified:Date;
      
      private var _created:Date;
      
      private var _attributesPure:Array;
      
      private var _avgRating:Number;
      
      public function LevelVaultSharedData()
      {
         super("","");
      }
      
      override public function get numRating() : int
      {
         return this._numRating;
      }
      
      override public function get created() : Date
      {
         return this._created;
      }
      
      override public function get avgRating() : Number
      {
         return this._avgRating;
      }
      
      override public function get modified() : Date
      {
         return this._modified;
      }
      
      private function InitCustomFields() : void
      {
         var o:Object = null;
         var att:MetaCustomField = null;
         var key:String = null;
         var i:int = 0;
         for(o in this._attributesPure)
         {
            key = String(o);
            if(key != MetaSharedData.CUSTOM_FIELD_SOCIAL_AUTHOR_UID_KEY && !isNaN(this._attributesPure[o]))
            {
               att = new MetaCustomFieldNumber(key,int(this._attributesPure[o]),i);
            }
            else
            {
               att = new MetaCustomFieldString(key,String(this._attributesPure[o]));
            }
            AddCustomField(att);
            i++;
         }
      }
      
      public function Init(o:Object) : void
      {
         if(!GamerSafe.api.levelVaultReady)
         {
            return;
         }
         this._attributesPure = GamerSafe.api.levelVaultGetLevelAttributes(o);
         this._avgRating = GamerSafe.api.levelVaultGetLevelRating(o);
         this._numRating = GamerSafe.api.levelVaultGetLevelNumRatings(o);
         rawData = GamerSafe.api.levelVaultGetLevelData(o);
         id = GamerSafe.api.levelVaultGetLevelID(o);
         this._created = new Date();
         this._modified = new Date();
         this._created.setTime(Date.parse(o.Created.split("-").join("/")));
         this._modified.setTime(Date.parse(o.Modified.split("-").join("/")));
         try
         {
            data = MetaDataEncryption.GetStringFromByteArray(rawData);
         }
         catch(e:Error)
         {
         }
         this.InitCustomFields();
      }
   }
}

