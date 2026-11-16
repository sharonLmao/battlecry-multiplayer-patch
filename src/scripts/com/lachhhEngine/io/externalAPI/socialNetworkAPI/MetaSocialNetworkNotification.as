package com.lachhhEngine.io.externalAPI.socialNetworkAPI
{
   public class MetaSocialNetworkNotification
   {
      
      private var _thumbnailUrl:String = "http://www.berzerkstudio.com/Logo100x100wAddress.png";
      
      private var _msgTxt:String = "";
      
      private var _title1Txt:String = "Game Name";
      
      private var _link:String = "http://www.berzerkstudio.com/";
      
      private var _userTarget:MetaSocialNetworkUser;
      
      private var _descTxt:String = "Game Description";
      
      private var _title2Txt:String = "<b>by Berzerk Studio</b>";
      
      public function MetaSocialNetworkNotification()
      {
         super();
      }
      
      public function set thumbnailUrl(thumbnailUrl:String) : void
      {
         this._thumbnailUrl = thumbnailUrl;
      }
      
      public function get title1Txt() : String
      {
         return this._title1Txt;
      }
      
      public function set msgTxt(titleTxt:String) : void
      {
         this._msgTxt = titleTxt;
      }
      
      public function get descTxt() : String
      {
         return this._descTxt;
      }
      
      public function get thumbnailUrl() : String
      {
         return this._thumbnailUrl;
      }
      
      public function set title2Txt(title2Txt:String) : void
      {
         this._title2Txt = title2Txt;
      }
      
      public function get msgTxt() : String
      {
         return this._msgTxt;
      }
      
      public function set link(link:String) : void
      {
         this._link = link;
      }
      
      public function set title1Txt(title1Txt:String) : void
      {
         this._title1Txt = title1Txt;
      }
      
      public function set userTarget(userTarget:MetaSocialNetworkUser) : void
      {
         this._userTarget = userTarget;
      }
      
      public function get link() : String
      {
         return this._link;
      }
      
      public function get userTarget() : MetaSocialNetworkUser
      {
         return this._userTarget;
      }
      
      public function get title2Txt() : String
      {
         return this._title2Txt;
      }
      
      public function set descTxt(descTxt:String) : void
      {
         this._descTxt = descTxt;
      }
   }
}

