package com.lachhhEngine.io.externalAPI.dataSharingAPI
{
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.IExternalAPI;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.queries.MetaSharedDataQuery;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.queries.MetaSharedDataQueryFlag;
   import com.lachhhEngine.io.externalAPI.dataSharingAPI.queries.MetaSharedDataQueryRate;
   
   public interface IDataSharingAPI extends IExternalAPI
   {
      
      function GetNbRewardInARowFromToday(param1:int) : int;
      
      function get totalDailyReward() : Number;
      
      function get myDataLoadedCallback() : Callback;
      
      function RateData(param1:int, param2:MetaSharedData) : MetaSharedDataQueryRate;
      
      function get nextWeelyReward() : Date;
      
      function RefreshMyData(param1:Boolean) : MetaSharedDataQuery;
      
      function get totalReward() : Number;
      
      function FlagData(param1:MetaSharedData) : MetaSharedDataQueryFlag;
      
      function set myDataLoadedCallback(param1:Callback) : void;
      
      function LoadMyFriendData() : MetaSharedDataQuery;
      
      function get myDataLoaded() : Boolean;
      
      function get allMyDatas() : Array;
      
      function GiveInARowReward(param1:int, param2:int) : MetaSharedDataQuery;
      
      function get friendsData() : Array;
      
      function GiveWeeklyReward(param1:int) : MetaSharedDataQuery;
      
      function get canGiveWeekReward() : Boolean;
      
      function get canGiveDailyReward() : Boolean;
      
      function CanGiveInaRowReward(param1:int) : Boolean;
      
      function get totalWeeklyReward() : Number;
      
      function get nextDailyReward() : Date;
      
      function get myData() : MetaSharedData;
      
      function get hasReceivedRewardToday() : Boolean;
      
      function get nbRewardedDayInARow() : int;
      
      function ProcessQuery(param1:MetaSharedDataQuery) : void;
      
      function get hasReceivedRewardThisWeek() : Boolean;
      
      function GiveDailyReward(param1:int) : MetaSharedDataQuery;
   }
}

