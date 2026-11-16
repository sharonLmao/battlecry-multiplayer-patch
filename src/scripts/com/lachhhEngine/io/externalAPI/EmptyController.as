package com.lachhhEngine.io.externalAPI
{
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.achievementAPI.IAchievementAPI;
   import com.lachhhEngine.io.externalAPI.achievementAPI.MetaExternalAchievement;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.IDataSharingAPI;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.MetaSharedData;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.queries.MetaSharedDataQuery;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.queries.MetaSharedDataQueryFlag;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.queries.MetaSharedDataQueryRate;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.queries.MetaSharedDataQuerySave;
   import com.lachhhEngine.io.externalAPI.metricsAPI.IMetricsAPI;
   import com.lachhhEngine.io.externalAPI.multiplayer.IMultiplayerAPI;
   import com.lachhhEngine.io.externalAPI.premiumAPI.IPremiumAPIController;
   import com.lachhhEngine.io.externalAPI.premiumAPI.MetaExternalPremiumItem;
   import com.lachhhEngine.io.externalAPI.savefileAPI.ISaveFileAPI;
   import com.lachhhEngine.io.externalAPI.scoreAPI.IScoreAPI;
   import com.lachhhEngine.io.externalAPI.scoreAPI.MetaExternalScoreboard;
   import com.lachhhEngine.io.externalAPI.socialNetworkAPI.ISocialNetworkAPI;
   import com.lachhhEngine.io.externalAPI.socialNetworkAPI.MetaSocialNetworkNotification;
   import com.lachhhEngine.io.externalAPI.socialNetworkAPI.MetaSocialNetworkUser;
   import com.lachhhEngine.io.externalAPI.statsAPI.IStatsAPI;
   import com.lachhhEngine.io.externalAPI.statsAPI.MetaStatData;
   import flash.display.MovieClip;
   
   public class EmptyController implements IPremiumAPIController, IScoreAPI, IAchievementAPI, ISaveFileAPI, IMetricsAPI, ISocialNetworkAPI, IDataSharingAPI, IStatsAPI, IMultiplayerAPI
   {
      
      private var _onPurchaseCallback:Callback;
      
      private var _connectSuccessCallback:Callback;
      
      private var _connectErrorCallback:Callback;
      
      public function EmptyController()
      {
         super();
      }
      
      public function set myDataLoadedCallback(myDataLoadedCallback:Callback) : void
      {
      }
      
      public function ConvertRawData(params:Array) : Array
      {
         return null;
      }
      
      public function SaveToAPI(placeCurrent:Boolean = true) : void
      {
      }
      
      public function get friendsData() : Array
      {
         return null;
      }
      
      public function ConsumeItem(m:MetaExternalPremiumItem, numToConsume:int, callback:Callback) : void
      {
      }
      
      public function get connected() : Boolean
      {
         return false;
      }
      
      public function InUse() : Boolean
      {
         return false;
      }
      
      public function get pointAcronym() : String
      {
         return "";
      }
      
      public function get serverStartingTime() : Date
      {
         return null;
      }
      
      public function get myDataLoaded() : Boolean
      {
         return false;
      }
      
      public function SendStat(m:MetaStatData) : void
      {
      }
      
      public function LoadPicture(m:MetaSocialNetworkUser, c:Callback = null) : void
      {
      }
      
      public function RefreshMyData(processNow:Boolean) : MetaSharedDataQuery
      {
         return null;
      }
      
      public function FlashBar() : void
      {
      }
      
      public function get canGiveWeekReward() : Boolean
      {
         return false;
      }
      
      public function get mustShowPurchasePopup() : Boolean
      {
         return false;
      }
      
      public function RefreshSavedFile(onDone:Callback) : void
      {
      }
      
      public function get myDataLoadedCallback() : Callback
      {
         return null;
      }
      
      public function get myGold() : int
      {
         return 0;
      }
      
      public function GiveInARowReward(inaRow:int, reward:int) : MetaSharedDataQuery
      {
         return null;
      }
      
      public function get numFriends() : int
      {
         return 0;
      }
      
      public function GetFriendFromUid(uid:String) : MetaSocialNetworkUser
      {
         return null;
      }
      
      public function SaveSharedData(s:MetaSharedData, addAuthField:Boolean = true, isDummy:Boolean = false) : MetaSharedDataQuerySave
      {
         return null;
      }
      
      public function set connectSuccessCallback(connectSuccessCallback:Callback) : void
      {
         this._connectSuccessCallback = connectSuccessCallback;
      }
      
      public function get isEmpty() : Boolean
      {
         return false;
      }
      
      public function set connectErrorCallback(connectErrorCallback:Callback) : void
      {
         this._connectErrorCallback = connectErrorCallback;
      }
      
      public function get loggedIn() : Boolean
      {
         return false;
      }
      
      public function get myPoint() : int
      {
         return 0;
      }
      
      public function ShowLogin(o:Object = null) : void
      {
      }
      
      public function get dataLoaded() : Boolean
      {
         return false;
      }
      
      public function HideBar() : void
      {
      }
      
      public function get goldAcronym() : String
      {
         return "";
      }
      
      public function FlagData(metaData:MetaSharedData) : MetaSharedDataQueryFlag
      {
         return null;
      }
      
      public function CanGiveInaRowReward(inarow:int) : Boolean
      {
         return false;
      }
      
      public function GetItemCostPoint(m:MetaExternalPremiumItem) : int
      {
         return -1;
      }
      
      public function get accountName() : String
      {
         return "";
      }
      
      public function GetNbRewardInARowFromToday(modDay:int) : int
      {
         return 0;
      }
      
      public function GetItemCostGold(m:MetaExternalPremiumItem) : int
      {
         return -1;
      }
      
      public function RecordAPlay() : void
      {
      }
      
      public function LoadMyFriendData() : MetaSharedDataQuery
      {
         return null;
      }
      
      public function get totalWeeklyReward() : Number
      {
         return 0;
      }
      
      public function get myData() : MetaSharedData
      {
         return null;
      }
      
      public function get nbRewardedDayInARow() : int
      {
         return 0;
      }
      
      public function get hasReceivedRewardThisWeek() : Boolean
      {
         return false;
      }
      
      public function ClearData() : void
      {
      }
      
      public function get nextWeelyReward() : Date
      {
         return null;
      }
      
      public function GetServerTime() : Date
      {
         return null;
      }
      
      public function IsLastItemPurchased(m:MetaExternalPremiumItem) : Boolean
      {
         return false;
      }
      
      public function get nameOfSystem() : String
      {
         return "Empty";
      }
      
      public function ShowHighscore(m:MetaExternalScoreboard) : void
      {
      }
      
      public function set onLogInCallback(c:Callback) : void
      {
      }
      
      public function get totalReward() : Number
      {
         return 0;
      }
      
      public function GetItemNumBought(m:MetaExternalPremiumItem) : int
      {
         return -1;
      }
      
      public function HasItem(m:MetaExternalPremiumItem) : Boolean
      {
         return false;
      }
      
      public function RecordStats(name:String, group:String) : void
      {
      }
      
      public function SendNotification(msg:MetaSocialNetworkNotification, success:Callback = null, failed:Callback = null) : void
      {
      }
      
      public function ShowBar(o:Object = null) : void
      {
      }
      
      public function GiveDailyReward(reward:int) : MetaSharedDataQuery
      {
         return null;
      }
      
      public function ProcessQuery(query:MetaSharedDataQuery) : void
      {
      }
      
      public function get goldCurrencyName() : String
      {
         return "";
      }
      
      public function LoadProfile(loadFinished:Callback) : void
      {
      }
      
      public function ShowStore(o:Object = null) : void
      {
      }
      
      public function get hasReceivedRewardToday() : Boolean
      {
         return false;
      }
      
      public function get canShowMyMoney() : Boolean
      {
         return false;
      }
      
      public function set onPurchaseCallback(c:Callback) : void
      {
         this._onPurchaseCallback = c;
      }
      
      public function get nextDailyReward() : Date
      {
         return null;
      }
      
      public function ShowItem(m:MetaExternalPremiumItem) : void
      {
      }
      
      public function RateData(rate:int, metaData:MetaSharedData) : MetaSharedDataQueryRate
      {
         return null;
      }
      
      public function bestowAchievement(m:MetaExternalAchievement) : void
      {
      }
      
      public function GetFriendAt(i:int) : MetaSocialNetworkUser
      {
         return null;
      }
      
      public function get savedData() : String
      {
         return null;
      }
      
      public function get user() : MetaSocialNetworkUser
      {
         return null;
      }
      
      public function get totalDailyReward() : Number
      {
         return 0;
      }
      
      public function SendLevel(level:int, extra:Object) : void
      {
      }
      
      public function GiveWeeklyReward(reward:int) : MetaSharedDataQuery
      {
         return null;
      }
      
      public function Connect(root:MovieClip, pSuccess:Callback = null, pError:Callback = null) : void
      {
      }
      
      public function get authorKey() : String
      {
         return null;
      }
      
      public function get canShowHighscore() : Boolean
      {
         return false;
      }
      
      public function set onDataLoadedCallback(c:Callback) : void
      {
      }
      
      public function SaveData(s:String, onDone:Callback) : void
      {
      }
      
      public function GetFriendFromName(name:String) : MetaSocialNetworkUser
      {
         return null;
      }
      
      public function get socialNetworkAuthorKey() : String
      {
         return null;
      }
      
      public function SendScore(score:int, extra:Object, m:MetaExternalScoreboard) : void
      {
      }
      
      public function get pointCurrencyName() : String
      {
         return "";
      }
      
      public function SendGameOver(score:int, extra:Object) : void
      {
      }
      
      public function get canGiveDailyReward() : Boolean
      {
         return false;
      }
      
      public function get friendsLoaded() : Boolean
      {
         return false;
      }
      
      public function get allMyDatas() : Array
      {
         return null;
      }
   }
}

