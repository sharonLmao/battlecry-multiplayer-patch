package com.lachhhEngine.io.externalAPI.dataSharingAPI
{
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.fields.MetaCustomField;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.fields.MetaCustomFieldString;
   import flash.utils.ByteArray;
   
   public class MetaSharedData
   {
      
      public static const EMPTY_STRING:String = "[EMPTY]";
      
      public static const CUSTOM_FIELD_DUMMY_KEY:String = "IS_DUMMY";
      
      public static const CUSTOM_FIELD_AUTHOR_KEY:String = "GS_AUTHOR";
      
      public static const CUSTOM_FIELD_SOCIAL_AUTHOR_UID_KEY:String = "SOCIALNETWORK_AUTHOR";
      
      public static const CUSTOM_FIELD_DAILY_REWARD_KEY:String = "DAILY_REWARD_";
      
      public static const CUSTOM_FIELD_WEEKLY_REWARD_KEY:String = "WEEKLY_REWARD_";
      
      public static const CUSTOM_FIELD_INAROW_REWARD_KEY:String = "IN_A_ROW_REWARD_";
      
      public static const CUSTOM_FIELD_GAMEINFO:String = "GAME_INFO";
      
      private var _id:int = -1;
      
      private var _rawData:ByteArray;
      
      private var _data:String = "[EMPTY]";
      
      private var _customFields:Array = new Array();
      
      public function MetaSharedData(author:String, socialAuthor:String)
      {
         super();
         this.AddCustomField(new MetaCustomFieldString(CUSTOM_FIELD_DUMMY_KEY,"FALSE"));
         this.AddCustomField(new MetaCustomFieldString(CUSTOM_FIELD_AUTHOR_KEY,author));
         this.AddCustomField(new MetaCustomFieldString(CUSTOM_FIELD_SOCIAL_AUTHOR_UID_KEY,socialAuthor));
      }
      
      public function get isEmpty() : Boolean
      {
         return this._data == EMPTY_STRING;
      }
      
      public function RemoveCustomField(m:MetaCustomField) : void
      {
         var att:MetaCustomField = null;
         for(var i:int = 0; i < this.numCustomFields; i++)
         {
            att = this.GetCustomField(i);
            if(m == att)
            {
               this._customFields.splice(i,1);
               return;
            }
         }
      }
      
      public function AddCustomField(m:MetaCustomField) : void
      {
         var toDelete:MetaCustomField = this.GetCustomFieldFromKey(m.key);
         if(toDelete != null)
         {
            this.RemoveCustomField(toDelete);
         }
         this._customFields.push(m);
      }
      
      public function get customFields() : Array
      {
         return this._customFields;
      }
      
      public function get author() : String
      {
         return this.GetCustomStringValue(CUSTOM_FIELD_AUTHOR_KEY);
      }
      
      private function SetCustomStringValue(key:String, value:String) : void
      {
         var field:MetaCustomFieldString = this.GetCustomFieldFromKey(key) as MetaCustomFieldString;
         if(field == null)
         {
            field = new MetaCustomFieldString(key,value);
            this.AddCustomField(field);
            return;
         }
         field.value = value;
      }
      
      public function get avgRating() : Number
      {
         return 0;
      }
      
      public function get modified() : Date
      {
         return null;
      }
      
      public function set data(data:String) : void
      {
         this._data = data;
      }
      
      public function set author(name:String) : void
      {
         this.SetCustomStringValue(CUSTOM_FIELD_AUTHOR_KEY,name);
      }
      
      public function get socialAuthorUid() : String
      {
         return this.GetCustomStringValue(CUSTOM_FIELD_SOCIAL_AUTHOR_UID_KEY);
      }
      
      private function GetCustomStringValue(key:String) : String
      {
         var field:MetaCustomField = this.GetCustomFieldFromKey(key);
         if(field == null)
         {
            return null;
         }
         return field.value as String;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isNew() : Boolean
      {
         return this.id == -1;
      }
      
      public function get isAutoGameInfo() : Boolean
      {
         var field:MetaCustomField = this.GetCustomFieldFromKey(CUSTOM_FIELD_GAMEINFO);
         if(field == null)
         {
            return false;
         }
         return true;
      }
      
      public function GetCustomFieldFromKey(key:String) : MetaCustomField
      {
         var att:MetaCustomField = null;
         for(var i:int = 0; i < this.numCustomFields; i++)
         {
            att = this.GetCustomField(i);
            if(key == att.key)
            {
               return att;
            }
         }
         return null;
      }
      
      public function set rawData(rawData:ByteArray) : void
      {
         this._rawData = rawData;
      }
      
      public function get numRating() : int
      {
         return 0;
      }
      
      public function get created() : Date
      {
         return null;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get numCustomFields() : int
      {
         return this._customFields.length;
      }
      
      public function get rawData() : ByteArray
      {
         return this._rawData;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function set socialAuthorUid(name:String) : void
      {
         this.SetCustomStringValue(CUSTOM_FIELD_SOCIAL_AUTHOR_UID_KEY,name);
      }
      
      public function GetCustomField(i:int) : MetaCustomField
      {
         return this._customFields[i] as MetaCustomField;
      }
      
      public function set isDummy(value:Boolean) : void
      {
         var dummyField:MetaCustomFieldString = this.GetCustomFieldFromKey(CUSTOM_FIELD_DUMMY_KEY) as MetaCustomFieldString;
         var strValue:String = value ? "TRUE" : "FALSE";
         if(dummyField != null)
         {
            dummyField.value = strValue;
         }
         else
         {
            this.AddCustomField(new MetaCustomFieldString(CUSTOM_FIELD_DUMMY_KEY,strValue));
         }
      }
   }
}

