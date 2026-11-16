package com.lachhhEngine.io.externalAPI.achievementAPI
{
   public class MetaExternalAchievement
   {
      
      private var _idNewgrounds:String;
      
      private var _idHiLvl:String;
      
      private var _idAdultSwim:String;
      
      private var _idSpillGroup:String;
      
      private var _idGameShed:Number;
      
      private var _gatcha:MetaExternalAchievementGatcha;
      
      private var _idGS:int;
      
      private var _idMochi:String;
      
      private var _idSocialAffiliates:String;
      
      private var _idMoFunZone:String;
      
      public function MetaExternalAchievement(idGS:int = -1, idGameShed:Number = -1, idMoFunZone:String = "", idNewgrounds:String = "", gatcha:MetaExternalAchievementGatcha = null, idSpillGroup:String = "", idSocialAffiliates:String = "", idMochi:String = "", idAdultSwim:String = "", idHiLvl:String = "")
      {
         super();
         this._idGS = idGS;
         this._idGameShed = idGameShed;
         this._idMoFunZone = idMoFunZone;
         this._idNewgrounds = idNewgrounds;
         this._idSpillGroup = idSpillGroup;
         this._idSocialAffiliates = idSocialAffiliates;
         this._gatcha = gatcha;
         this._idMochi = idMochi;
         this._idAdultSwim = idAdultSwim;
         this._idHiLvl = idHiLvl;
      }
      
      public function get idGameShed() : Number
      {
         return this._idGameShed;
      }
      
      public function get gatcha() : MetaExternalAchievementGatcha
      {
         return this._gatcha;
      }
      
      public function get idGS() : int
      {
         return this._idGS;
      }
      
      public function get idAdultSwim() : String
      {
         return this._idAdultSwim;
      }
      
      public function get idSocialAffiliates() : String
      {
         return this._idSocialAffiliates;
      }
      
      public function get idNewgrounds() : String
      {
         return this._idNewgrounds;
      }
      
      public function get idMoFunZone() : String
      {
         return this._idMoFunZone;
      }
      
      public function get idSpillGroup() : String
      {
         return this._idSpillGroup;
      }
      
      public function get idMochi() : String
      {
         return this._idMochi;
      }
      
      public function get idHiLvl() : String
      {
         return this._idHiLvl;
      }
   }
}

