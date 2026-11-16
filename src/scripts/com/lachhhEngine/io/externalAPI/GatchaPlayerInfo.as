package com.lachhhEngine.io.externalAPI
{
   public class GatchaPlayerInfo
   {
      
      private var _age:int;
      
      private var _profileurl:String;
      
      private var _nickname:String;
      
      private var _sexualorientation:String;
      
      private var _gender:String;
      
      private var _thumbnailurl:String;
      
      private var _country:String;
      
      private var _login:Boolean;
      
      private var _init:Boolean = false;
      
      private var _networkpresence:String;
      
      private var _language:String;
      
      private var _id:String;
      
      public function GatchaPlayerInfo()
      {
         super();
      }
      
      public function get gender() : String
      {
         return this._gender;
      }
      
      public function get thumbnailurl() : String
      {
         return this._thumbnailurl;
      }
      
      public function get nickname() : String
      {
         return this._nickname;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get init() : Boolean
      {
         return this._init;
      }
      
      public function get country() : String
      {
         return this._country;
      }
      
      public function get language() : String
      {
         return this._language;
      }
      
      public function get sexualorientation() : String
      {
         return this._sexualorientation;
      }
      
      public function get login() : Boolean
      {
         return this._login;
      }
      
      public function get profileurl() : String
      {
         return this._profileurl;
      }
      
      public function Init(o:Object) : void
      {
         this._init = true;
         this._login = o.login;
         this._country = o.country;
         this._language = o.language;
         this._nickname = o.nickname;
         this._age = o.age;
         this._gender = o.gender;
         this._id = o.id;
         this._networkpresence = o.networkpresence;
         this._sexualorientation = o.sexualorientation;
         this._profileurl = o.profileurl;
         this._thumbnailurl = o.thumbnailurl;
      }
      
      public function get networkpresence() : String
      {
         return this._networkpresence;
      }
      
      public function get age() : int
      {
         return this._age;
      }
   }
}

