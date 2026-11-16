package com.battlecry.meta
{
   import com.battlecry.meta.model.ModelCampaignEnum;
   import com.battlecry.meta.model.ModelChapter;
   import com.battlecry.meta.model.ModelChapterEnum;
   
   public class MetaCampaignProgress
   {
      
      private const SEPARATOR:String = "[CP]";
      
      private var _HeroesCampaignLvl:int;
      
      private var _campaignGlow:int;
      
      private var _AshesCampaignLvl:int;
      
      private var _MythicCampaignLvl:int;
      
      private var _currentChapter:ModelChapter;
      
      private var _boosterGlow:int;
      
      public function MetaCampaignProgress()
      {
         super();
         this._HeroesCampaignLvl = 1;
         this._AshesCampaignLvl = 1;
         this._boosterGlow = 0;
         this._campaignGlow = 0;
         this._MythicCampaignLvl = 1;
         this._currentChapter = ModelChapterEnum.CHAPTER1;
      }
      
      public function set boosterGlow(boosterGlow:int) : void
      {
         this._boosterGlow = boosterGlow;
      }
      
      public function get campaignGlow() : int
      {
         return this._campaignGlow;
      }
      
      public function set campaignGlow(campaignGlow:int) : void
      {
         this._campaignGlow = campaignGlow;
      }
      
      public function Decode(s:String) : void
      {
         var params:Array = s.split(this.SEPARATOR);
         this._HeroesCampaignLvl = params.shift();
         if(params.length > 0)
         {
            this._AshesCampaignLvl = params.shift();
         }
         if(params.length > 0)
         {
            this._boosterGlow = params.shift();
         }
         if(params.length > 0)
         {
            this._campaignGlow = params.shift();
         }
         if(params.length > 0)
         {
            this._MythicCampaignLvl = params.shift();
         }
      }
      
      public function GetCurrentCampaignLvl() : int
      {
         if(this._currentChapter.id == ModelChapterEnum.CHAPTER1.id)
         {
            return this._HeroesCampaignLvl;
         }
         if(this._currentChapter.id == ModelChapterEnum.CHAPTER2.id)
         {
            return this._AshesCampaignLvl;
         }
         if(this._currentChapter.id == ModelChapterEnum.CHAPTER3.id)
         {
            return this._MythicCampaignLvl;
         }
         return 1;
      }
      
      public function set heroesCampaignLvl(heroesCampaignLvl:int) : void
      {
         this._HeroesCampaignLvl = heroesCampaignLvl;
      }
      
      public function AddCurrentCampaignLvl() : void
      {
         if(this._currentChapter.id == ModelChapterEnum.CHAPTER1.id)
         {
            ++this._HeroesCampaignLvl;
         }
         if(this._currentChapter.id == ModelChapterEnum.CHAPTER2.id)
         {
            ++this._AshesCampaignLvl;
         }
         if(this._currentChapter.id == ModelChapterEnum.CHAPTER3.id)
         {
            ++this._MythicCampaignLvl;
         }
      }
      
      public function get currentChapter() : ModelChapter
      {
         return this._currentChapter;
      }
      
      public function set ashesCampaignLvl(ashesCampaignLvl:int) : void
      {
         this._AshesCampaignLvl = ashesCampaignLvl;
      }
      
      public function set currentChapter(currentChapter:ModelChapter) : void
      {
         this._currentChapter = currentChapter;
      }
      
      public function get heroesCampaignLvl() : int
      {
         return this._HeroesCampaignLvl;
      }
      
      public function GetChapterEndActArray() : Array
      {
         if(this._currentChapter.id == ModelChapterEnum.CHAPTER1.id)
         {
            return ModelCampaignEnum.CHAPTER_1_END_ACT;
         }
         if(this._currentChapter.id == ModelChapterEnum.CHAPTER2.id)
         {
            return ModelCampaignEnum.CHAPTER_2_END_ACT;
         }
         if(this._currentChapter.id == ModelChapterEnum.CHAPTER3.id)
         {
            return ModelCampaignEnum.CHAPTER_3_END_ACT;
         }
         return null;
      }
      
      public function get ashesCampaignLvl() : int
      {
         return this._AshesCampaignLvl;
      }
      
      public function GetEndActImageAddition() : int
      {
         if(this._currentChapter.id == ModelChapterEnum.CHAPTER1.id)
         {
            return 0;
         }
         if(this._currentChapter.id == ModelChapterEnum.CHAPTER2.id)
         {
            return 3;
         }
         if(this._currentChapter.id == ModelChapterEnum.CHAPTER3.id)
         {
            return 4;
         }
         return 0;
      }
      
      public function Encode() : String
      {
         return this._HeroesCampaignLvl + this.SEPARATOR + this._AshesCampaignLvl + this.SEPARATOR + this._boosterGlow + this.SEPARATOR + this._campaignGlow + this.SEPARATOR + this._MythicCampaignLvl;
      }
      
      public function get boosterGlow() : int
      {
         return this._boosterGlow;
      }
   }
}

