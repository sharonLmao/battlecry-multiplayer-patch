package com.lachhhEngine.io.externalAPI.achievementAPI
{
   public class MetaExternalAchievementGatcha
   {
      
      private var _key:String;
      
      private var _title:String;
      
      private var _data:String;
      
      private var _desc:String;
      
      private var _iconUrl:String;
      
      private var _category:String;
      
      public function MetaExternalAchievementGatcha(key:String, title:String, desc:String, iconURL:String = null, category:String = null, data:String = null)
      {
         super();
         this._key = key;
         this._title = title;
         this._desc = desc;
         this._category = category;
         this._iconUrl = iconURL;
         this._data = data;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function GetObject() : Object
      {
         var obj:Object = new Object();
         obj.achievement = this.key;
         obj.title = this.title;
         obj.description = this.desc;
         if(this.iconUrl != null)
         {
            obj.icon = this.iconUrl;
         }
         return obj;
      }
      
      public function get iconUrl() : String
      {
         return this._iconUrl;
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get key() : String
      {
         return this._key;
      }
   }
}

