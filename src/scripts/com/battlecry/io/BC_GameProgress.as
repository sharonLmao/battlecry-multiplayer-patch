package com.battlecry.io
{
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.stats.StatsStatic;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.MetaCampaignProgress;
   import com.battlecry.meta.MetaCollection;
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.MetaFlag;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelRanking;
   import com.battlecry.meta.model.ModelRankingEnum;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.io.encryption.SecureNumber;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.files.FileManager;
   import com.lachhhEngine.io.files.GameProgress;
   
   public class BC_GameProgress extends GameProgress
   {
      
      private var _lost:int;
      
      private var _dailyStage:int;
      
      private var _currentVersionInfo:String;
      
      private var _tournamentGold:int;
      
      private var _cash:SecureNumber;
      
      private var _win:int;
      
      private var _tutorialManager:TutorialManager;
      
      private var _currentSelectedArmy:int;
      
      private var _metaCampaignProgress:MetaCampaignProgress;
      
      private var _metaFlag:MetaFlag;
      
      private var _firstPlay:int;
      
      private var _metaCollection:MetaCollection;
      
      private var _playerName:String;
      
      private var _metaArmy1:BC_MetaArmy;
      
      private var _metaArmy2:BC_MetaArmy;
      
      private var _metaArmy3:BC_MetaArmy;
      
      private var _metaArmy4:BC_MetaArmy;
      
      private var _metaArmy5:BC_MetaArmy;
      
      private var _tournamentSilver:int;
      
      private var _fBAccessToken:String;
      
      private const SEPARATOR:String = "[P]";
      
      private var _numReferential:int;
      
      private var _flagManager:FlagManager;
      
      private var _init:Boolean;
      
      private var _dailyRewardDay:int;
      
      private var _ranking:ModelRanking;
      
      private var _friendList:Array;
      
      private var _craftPoint:int;
      
      public function BC_GameProgress()
      {
         super();
         this._cash = new SecureNumber(0);
         this._metaArmy1 = new BC_MetaArmy(1);
         this._metaArmy1.armyName = "Training Army";
         this._metaArmy2 = new BC_MetaArmy(2);
         this._metaArmy2.armyName = "Army2";
         this._metaArmy3 = new BC_MetaArmy(3);
         this._metaArmy3.armyName = "Army3";
         this._metaArmy4 = new BC_MetaArmy(4);
         this._metaArmy4.armyName = "Army4";
         this._metaCampaignProgress = new MetaCampaignProgress();
         this._metaFlag = new MetaFlag();
         this._currentSelectedArmy = 1;
         this._friendList = new Array();
         this._tutorialManager = new TutorialManager();
         this._flagManager = new FlagManager();
         this._playerName = ExternalAPIManager.getPremiumAPI().accountName;
         this._init = true;
         this._ranking = ModelRankingEnum.RANKING_SERF;
         this._win = 0;
         this._lost = 0;
         this._dailyRewardDay = 0;
         this._dailyStage = 0;
         this._fBAccessToken = "";
         this._firstPlay = 0;
         this._numReferential = 0;
         this._metaCollection = new MetaCollection();
         this._currentVersionInfo = "";
         this._metaArmy5 = new BC_MetaArmy(5);
         this._metaArmy5.armyName = "Army5";
         this._tournamentSilver = 0;
         this._craftPoint = 0;
         this._tournamentGold = 0;
      }
      
      public static function get gameProgess() : BC_GameProgress
      {
         return BC_GameProgress(FileManager.instance.crntGameProgress);
      }
      
      public function GetReferentialReward(numReferential:int) : int
      {
         var reward:int = Math.floor(6000 - 1000 * numReferential);
         if(reward <= 1000)
         {
            reward = 1000;
         }
         return reward;
      }
      
      public function set metaCampaignProgress(metaCampaignProgress:MetaCampaignProgress) : void
      {
         this._metaCampaignProgress = metaCampaignProgress;
      }
      
      public function set metaCollection(metaCollection:MetaCollection) : void
      {
         this._metaCollection = metaCollection;
      }
      
      override public function Decode(s:String) : void
      {
         var str:String = null;
         var params:Array = s.split(this.SEPARATOR);
         this._currentSelectedArmy = parseInt(params.shift());
         this._cash.value = parseInt(params.shift());
         this._metaFlag.Decode(params.shift());
         this._metaArmy1.Decode(params.shift());
         this._metaArmy2.Decode(params.shift());
         this._metaArmy3.Decode(params.shift());
         this._metaArmy4.Decode(params.shift());
         this._metaCampaignProgress.Decode(params.shift());
         this._tutorialManager.Decode(params.shift());
         this._flagManager.Decode(params.shift());
         this._playerName = params.shift();
         this._ranking = ModelRankingEnum.GetFromId(params.shift());
         this._win = params.shift();
         this._lost = params.shift();
         this._dailyRewardDay = params.shift();
         this._dailyStage = params.shift();
         this._fBAccessToken = params.shift();
         this._firstPlay = params.shift();
         this._numReferential = params.shift();
         var fLength:int = int(this._friendList.length);
         for(var j:int = 0; j < fLength; j++)
         {
            this._friendList.shift();
         }
         var length:int = int(params.shift());
         for(var i:int = 0; i < length; i++)
         {
            str = params.shift();
            this._friendList.push(str);
         }
         this._metaCollection.Decode(params.shift());
         if(params.length > 0)
         {
            StatsStatic.getInstance().Decode(params.shift());
         }
         if(params.length > 0)
         {
            this._currentVersionInfo = params.shift();
         }
         if(params.length > 0)
         {
            this._metaArmy5.Decode(params.shift());
         }
         if(params.length > 0)
         {
            this._tournamentSilver = parseInt(params.shift());
         }
         if(params.length > 0)
         {
            this._craftPoint = parseInt(params.shift());
         }
         if(params.length > 0)
         {
            this._tournamentGold = parseInt(params.shift());
         }
         this.CreateArmyInventory();
      }
      
      public function get metaFlag() : MetaFlag
      {
         return this._metaFlag;
      }
      
      public function getArmy(id:int) : BC_MetaArmy
      {
         switch(id)
         {
            case 1:
               return this._metaArmy1;
            case 2:
               return this._metaArmy2;
            case 3:
               return this._metaArmy3;
            case 4:
               return this._metaArmy4;
            case 5:
               return this._metaArmy5;
            default:
               return this._metaArmy1;
         }
      }
      
      public function set firstPlay(firstPlay:int) : void
      {
         this._firstPlay = firstPlay;
      }
      
      public function get playerName() : String
      {
         return this._playerName;
      }
      
      public function get firstPlay() : int
      {
         return this._firstPlay;
      }
      
      public function set playerName(playerName:String) : void
      {
         this._playerName = playerName;
      }
      
      public function set metaFlag(metaFlag:MetaFlag) : void
      {
         this._metaFlag = metaFlag;
      }
      
      public function get lost() : int
      {
         return this._lost;
      }
      
      public function get metaArmy1() : BC_MetaArmy
      {
         return this._metaArmy1;
      }
      
      public function get metaArmy3() : BC_MetaArmy
      {
         return this._metaArmy3;
      }
      
      override public function Encode() : String
      {
         var returnValue:String = "";
         returnValue += this._currentSelectedArmy + this.SEPARATOR + this._cash.value + this.SEPARATOR + this._metaFlag.Encode() + this.SEPARATOR + this._metaArmy1.Encode() + this.SEPARATOR + this._metaArmy2.Encode() + this.SEPARATOR + this._metaArmy3.Encode() + this.SEPARATOR + this._metaArmy4.Encode() + this.SEPARATOR + this._metaCampaignProgress.Encode() + this.SEPARATOR;
         returnValue += this._tutorialManager.Encode() + this.SEPARATOR;
         returnValue += this._flagManager.Encode() + this.SEPARATOR;
         returnValue += this._playerName + this.SEPARATOR;
         returnValue += this._ranking.id + this.SEPARATOR;
         returnValue += this._win + this.SEPARATOR;
         returnValue += this._lost + this.SEPARATOR;
         returnValue += this._dailyRewardDay + this.SEPARATOR;
         returnValue += this._dailyStage + this.SEPARATOR;
         returnValue += this._fBAccessToken + this.SEPARATOR;
         returnValue += this._firstPlay + this.SEPARATOR;
         returnValue += this._numReferential + this.SEPARATOR;
         returnValue += this._friendList.length + this.SEPARATOR;
         for(var i:int = 0; i < this._friendList.length; i++)
         {
            returnValue += this._friendList[i] + this.SEPARATOR;
         }
         returnValue += this._metaCollection.Encode() + this.SEPARATOR;
         returnValue += StatsStatic.getInstance().Encode() + this.SEPARATOR;
         returnValue += this._currentVersionInfo + this.SEPARATOR;
         returnValue += this._metaArmy5.Encode() + this.SEPARATOR;
         returnValue += this._tournamentSilver + this.SEPARATOR;
         returnValue += this._craftPoint + this.SEPARATOR;
         returnValue += this._tournamentGold + this.SEPARATOR;
         return returnValue.substr(0,returnValue.length - this.SEPARATOR.length);
      }
      
      override public function Init() : void
      {
         super.Init();
      }
      
      public function get metaArmy4() : BC_MetaArmy
      {
         return this._metaArmy4;
      }
      
      public function get metaArmy2() : BC_MetaArmy
      {
         return this._metaArmy2;
      }
      
      public function get cash() : Number
      {
         return this._cash.value;
      }
      
      public function get ranking() : ModelRanking
      {
         return this._ranking;
      }
      
      public function set numReferential(numReferential:int) : void
      {
         this._numReferential = numReferential;
      }
      
      public function set lost(lost:int) : void
      {
         this._lost = lost;
      }
      
      public function set flagManager(flagManager:FlagManager) : void
      {
         this._flagManager = flagManager;
      }
      
      public function get metaArmy5() : BC_MetaArmy
      {
         return this._metaArmy5;
      }
      
      public function SetCurrentSelectedArmy(currentSelectedArmy:int) : void
      {
         this._currentSelectedArmy = currentSelectedArmy;
      }
      
      public function get craftPoint() : int
      {
         return this._craftPoint;
      }
      
      public function get friendList() : Array
      {
         return this._friendList;
      }
      
      public function get tournamentSilver() : int
      {
         return this._tournamentSilver;
      }
      
      public function set metaArmy1(metaArmy1:BC_MetaArmy) : void
      {
         this._metaArmy1 = metaArmy1;
      }
      
      public function set metaArmy2(metaArmy2:BC_MetaArmy) : void
      {
         this._metaArmy2 = metaArmy2;
      }
      
      public function get dailyStage() : int
      {
         return this._dailyStage;
      }
      
      public function set metaArmy3(metaArmy3:BC_MetaArmy) : void
      {
         this._metaArmy3 = metaArmy3;
      }
      
      public function set ranking(ranking:ModelRanking) : void
      {
         this._ranking = ranking;
      }
      
      public function set cash(cash:Number) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_CASH);
         this._cash.value = cash;
         ScreenManager.instance.RefreshAll();
      }
      
      public function get tutorialManager() : TutorialManager
      {
         return this._tutorialManager;
      }
      
      public function set fBAccessToken(fBAccessToken:String) : void
      {
         this._fBAccessToken = fBAccessToken;
      }
      
      public function set metaArmy4(metaArmy4:BC_MetaArmy) : void
      {
         this._metaArmy4 = metaArmy4;
      }
      
      public function set metaArmy5(metaArmy5:BC_MetaArmy) : void
      {
         this._metaArmy5 = metaArmy5;
      }
      
      public function get currentVersionInfo() : String
      {
         return this._currentVersionInfo;
      }
      
      public function ClearAllProgress() : void
      {
         this._cash.value = 0;
         this._metaArmy1 = new BC_MetaArmy(1);
         this._metaArmy1.armyName = "Training Army";
         this._metaArmy2 = new BC_MetaArmy(2);
         this._metaArmy2.armyName = "Army2";
         this._metaArmy3 = new BC_MetaArmy(3);
         this._metaArmy3.armyName = "Army3";
         this._metaArmy4 = new BC_MetaArmy(4);
         this._metaArmy4.armyName = "Army4";
         this._metaCampaignProgress = new MetaCampaignProgress();
         this._metaFlag = new MetaFlag();
         this._currentSelectedArmy = 1;
         this._friendList = new Array();
         this._tutorialManager = new TutorialManager();
         this._flagManager = new FlagManager();
         this._playerName = ExternalAPIManager.getPremiumAPI().accountName;
         this._init = true;
         this._ranking = ModelRankingEnum.RANKING_SERF;
         this._win = 0;
         this._lost = 0;
         this._dailyStage = 0;
         this._fBAccessToken = "";
         this._firstPlay = 0;
         this._numReferential = 0;
         this._metaCollection = new MetaCollection();
         this._currentVersionInfo = "";
         this._metaArmy5 = new BC_MetaArmy(5);
         this._metaArmy5.armyName = "Army5";
         this._tournamentSilver = 0;
         this._craftPoint = 0;
         this._tournamentGold = 0;
      }
      
      public function get metaCampaignProgress() : MetaCampaignProgress
      {
         return this._metaCampaignProgress;
      }
      
      public function CreateArmyInventory() : void
      {
         var metaArmy:BC_MetaArmy = null;
         var j:int = 0;
         var k:int = 0;
         for(var i:int = 1; i < 6; i++)
         {
            metaArmy = this.getArmy(i);
            for(j = 0; j < this._metaCollection.collectionInventory.length; j++)
            {
               if(this._metaCollection.collectionInventory[j].quantity > 0)
               {
                  if(this._metaCollection.collectionInventory[j].modelEquipement.type == ModelEquipement.TYPE_CREATURE)
                  {
                     metaArmy.creatureInventory.push(new MetaEquipement(this._metaCollection.collectionInventory[j].quantity,this._metaCollection.collectionInventory[j].modelEquipement));
                  }
                  else
                  {
                     metaArmy.itemInventory.push(new MetaEquipement(this._metaCollection.collectionInventory[j].quantity,this._metaCollection.collectionInventory[j].modelEquipement));
                  }
               }
            }
            for(k = 0; k < metaArmy.unitInventory.length; k++)
            {
               metaArmy.RemoveUnitItems(metaArmy.unitInventory[k]);
            }
         }
      }
      
      public function get metaCollection() : MetaCollection
      {
         return this._metaCollection;
      }
      
      public function set craftPoint(craftPoint:int) : void
      {
         this._craftPoint = craftPoint;
      }
      
      public function get flagManager() : FlagManager
      {
         return this._flagManager;
      }
      
      public function get numReferential() : int
      {
         return this._numReferential;
      }
      
      public function set dailyRewardDay(dailyRewardDay:int) : void
      {
         this._dailyRewardDay = dailyRewardDay;
      }
      
      public function set tournamentSilver(tournamentSilver:int) : void
      {
         this._tournamentSilver = tournamentSilver;
      }
      
      public function set friendList(friendList:Array) : void
      {
         this._friendList = friendList;
      }
      
      public function get fBAccessToken() : String
      {
         return this._fBAccessToken;
      }
      
      public function set win(win:int) : void
      {
         this._win = win;
      }
      
      public function set dailyStage(dailyStage:int) : void
      {
         this._dailyStage = dailyStage;
      }
      
      public function CurrentSelectedArmy() : BC_MetaArmy
      {
         switch(this._currentSelectedArmy)
         {
            case 1:
               return this._metaArmy1;
            case 2:
               return this._metaArmy2;
            case 3:
               return this._metaArmy3;
            case 4:
               return this._metaArmy4;
            case 5:
               return this._metaArmy5;
            default:
               return this._metaArmy1;
         }
      }
      
      public function set tournamentGold(tournamentGold:int) : void
      {
         this._tournamentGold = tournamentGold;
      }
      
      public function get dailyRewardDay() : int
      {
         return this._dailyRewardDay;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
      }
      
      public function get win() : int
      {
         return this._win;
      }
      
      public function set tutorialManager(tutorialManager:TutorialManager) : void
      {
         this._tutorialManager = tutorialManager;
      }
      
      public function set currentVersionInfo(currentVersionInfo:String) : void
      {
         this._currentVersionInfo = currentVersionInfo;
      }
      
      public function get tournamentGold() : int
      {
         return this._tournamentGold;
      }
   }
}

