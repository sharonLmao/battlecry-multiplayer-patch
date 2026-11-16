package com.battlecry.meta.model
{
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.MetaEquipement;
   
   public class ModelCampaign
   {
      
      public static const ACT1:int = 1;
      
      public static const ACT2:int = 2;
      
      public static const ACT3:int = 3;
      
      private var _storyArray:Array;
      
      private var _campaignIcon:int;
      
      private var _chapter:ModelChapter;
      
      private var _tipTxtID:int;
      
      private var _campaignName:int;
      
      private var _metaArmy:BC_MetaArmy;
      
      private var _boosterPackID:int;
      
      private var _id:int;
      
      private var _itemReward:Vector.<MetaEquipement>;
      
      private var _backGroundID:int;
      
      private var _goldReward:int;
      
      private var _campaignStage:int;
      
      private var _endStoryTxtID:int;
      
      private var _act:int;
      
      public function ModelCampaign(id:int, storyArray:Array, tipTxtID:int, endStoryTxtID:int, campaignIcon:int, campaignName:int, campaignStage:int, goldReward:int, boosterPackID:int, act:int, chapter:ModelChapter, itemReward:Vector.<MetaEquipement>, metaArmy:BC_MetaArmy, backGroundID:int)
      {
         super();
         this._id = id;
         this._storyArray = storyArray;
         this._tipTxtID = tipTxtID;
         this._endStoryTxtID = endStoryTxtID;
         this._campaignIcon = campaignIcon;
         this._campaignName = campaignName;
         this._campaignStage = campaignStage;
         this._goldReward = goldReward;
         this._boosterPackID = boosterPackID;
         this._act = act;
         this._chapter = chapter;
         this._itemReward = itemReward;
         this._metaArmy = metaArmy;
         this._backGroundID = backGroundID;
      }
      
      public function set metaArmy(metaArmy:BC_MetaArmy) : void
      {
         this._metaArmy = metaArmy;
      }
      
      public function get act() : int
      {
         return this._act;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get itemReward() : Vector.<MetaEquipement>
      {
         return this._itemReward;
      }
      
      public function set chapter(chapter:ModelChapter) : void
      {
         this._chapter = chapter;
      }
      
      public function get boosterPackID() : int
      {
         return this._boosterPackID;
      }
      
      public function get goldReward() : int
      {
         return this._goldReward;
      }
      
      public function get tipTxtID() : int
      {
         return this._tipTxtID;
      }
      
      public function set endStoryTxtID(endStoryTxtID:int) : void
      {
         this._endStoryTxtID = endStoryTxtID;
      }
      
      public function set campaignStage(campaignStage:int) : void
      {
         this._campaignStage = campaignStage;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function get campaignIcon() : int
      {
         return this._campaignIcon;
      }
      
      public function get campaignName() : int
      {
         return this._campaignName;
      }
      
      public function set act(act:int) : void
      {
         this._act = act;
      }
      
      public function set itemReward(itemReward:Vector.<MetaEquipement>) : void
      {
         this._itemReward = itemReward;
      }
      
      public function get metaArmy() : BC_MetaArmy
      {
         return this._metaArmy;
      }
      
      public function get chapter() : ModelChapter
      {
         return this._chapter;
      }
      
      public function get endStoryTxtID() : int
      {
         return this._endStoryTxtID;
      }
      
      public function get campaignStage() : int
      {
         return this._campaignStage;
      }
      
      public function set boosterPackID(boosterPackID:int) : void
      {
         this._boosterPackID = boosterPackID;
      }
      
      public function set campaignIcon(campaignIcon:int) : void
      {
         this._campaignIcon = campaignIcon;
      }
      
      public function set goldReward(goldReward:int) : void
      {
         this._goldReward = goldReward;
      }
      
      public function set tipTxtID(tipTxtID:int) : void
      {
         this._tipTxtID = tipTxtID;
      }
      
      public function set backGroundID(backGroundID:int) : void
      {
         this._backGroundID = backGroundID;
      }
      
      public function get storyArray() : Array
      {
         return this._storyArray;
      }
      
      public function get backGroundID() : int
      {
         return this._backGroundID;
      }
      
      public function set storyArray(storyArray:Array) : void
      {
         this._storyArray = storyArray;
      }
      
      public function set campaignName(campaignName:int) : void
      {
         this._campaignName = campaignName;
      }
   }
}

