package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.meta.MetaEnemyLoaded;
   import com.battlecry.screens.ArmySelectScreen;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.BattleSelectionScreen;
   import com.battlecry.screens.GoldRewardScreen;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.files.FileManager;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import playerio.DatabaseObject;
   import playerio.PlayerIOError;
   
   public class TournamentPanel extends BattleSelectionPanel
   {
      
      private var _enemyArmySelected:String;
      
      private var _fullEnemyArmyname:String;
      
      private var _cancel:Boolean;
      
      private var _playSilverAnim:Boolean;
      
      private var _enemyName:String;
      
      private var _playGoldAnim:Boolean;
      
      private var _tournamentSlot1:TournamentSlot;
      
      private var _tournamentSlot2:TournamentSlot;
      
      private var _tournamentSlot3:TournamentSlot;
      
      private var _tournamentSlot4:TournamentSlot;
      
      private var _tournamentSlot5:TournamentSlot;
      
      private var _tournamentRank:int;
      
      private var _rankToLoad:int;
      
      private var _enemyArmyStats:DatabaseObject;
      
      public function TournamentPanel(visual:DisplayObjectContainer, battleSelectionScreen:BattleSelectionScreen)
      {
         super(visual,battleSelectionScreen);
         this._cancel = false;
         this.btn_Refresh_Tournament.addEventListener(MouseEvent.MOUSE_DOWN,this.onRefreshTournament);
         this._tournamentSlot1 = new TournamentSlot(this.tournamentSlot1,1,this);
         this._tournamentSlot2 = new TournamentSlot(this.tournamentSlot2,2,this);
         this._tournamentSlot3 = new TournamentSlot(this.tournamentSlot3,3,this);
         this._tournamentSlot4 = new TournamentSlot(this.tournamentSlot4,4,this);
         this._tournamentSlot5 = new TournamentSlot(this.tournamentSlot5,5,this);
         this.btn_cancel.addEventListener(MouseEvent.MOUSE_DOWN,this.onCancel);
         this._playSilverAnim = false;
         this.SilverSkullAnim.gotoAndStop(1);
         this.SilverSkullAnim.visible = false;
         this.SilverSkullAnim.mouseChildren = false;
         this.SilverSkullAnim.mouseEnabled = false;
         this._playGoldAnim = false;
         this.GoldSkullAnim.gotoAndStop(1);
         this.GoldSkullAnim.visible = false;
         this.GoldSkullAnim.mouseChildren = false;
         this.GoldSkullAnim.mouseEnabled = false;
         this._tournamentRank = 1;
         this.loadingTournament.visible = false;
         if(this.anim)
         {
            this.RecurPlay(this.anim);
         }
      }
      
      public function FightTournament(m:MetaEnemyLoaded) : void
      {
         BC_Game.instance.isTournament = true;
         BC_Game.instance.metaEnemyLoaded = m;
         var a:ArmySelectScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ARMYSELECT_SCREEN) as ArmySelectScreen;
         a.SetScreenToClose(battleSelectionScreen);
      }
      
      private function onRefreshTournament(event:MouseEvent) : void
      {
         while(BC_Game.instance.tournamentLoaded.length > 0)
         {
            BC_Game.instance.tournamentLoaded.shift();
         }
         BC_Game.instance.currentTournamentLevel = 1;
         this.CheckLoadEnemy();
      }
      
      public function get silverSkullTxt() : TextField
      {
         return panel.getChildByName("silverSkullTxt") as TextField;
      }
      
      public function get tournamentSlot1() : MovieClip
      {
         return panel.getChildByName("tournamentSlot1") as MovieClip;
      }
      
      public function get tournamentSlot2() : MovieClip
      {
         return panel.getChildByName("tournamentSlot2") as MovieClip;
      }
      
      private function PlayGoldAnim() : void
      {
         this._playGoldAnim = true;
      }
      
      public function get tournamentSlot4() : MovieClip
      {
         return panel.getChildByName("tournamentSlot4") as MovieClip;
      }
      
      public function get tournamentSlot5() : MovieClip
      {
         return panel.getChildByName("tournamentSlot5") as MovieClip;
      }
      
      public function EndLoading() : void
      {
         this.loadingTournament.visible = false;
         this._tournamentSlot1.SetMetaLoadedEnemy(BC_Game.instance.tournamentLoaded[0]);
         this._tournamentSlot2.SetMetaLoadedEnemy(BC_Game.instance.tournamentLoaded[1]);
         this._tournamentSlot3.SetMetaLoadedEnemy(BC_Game.instance.tournamentLoaded[2]);
         this._tournamentSlot4.SetMetaLoadedEnemy(BC_Game.instance.tournamentLoaded[3]);
         this._tournamentSlot5.SetMetaLoadedEnemy(BC_Game.instance.tournamentLoaded[4]);
         this.CheckTournamentRank();
         this._tournamentSlot1.SetTournamentRank(this._tournamentRank);
         this._tournamentSlot2.SetTournamentRank(this._tournamentRank + 1);
         this._tournamentSlot3.SetTournamentRank(this._tournamentRank + 2);
         this._tournamentSlot4.SetTournamentRank(this._tournamentRank + 3);
         this._tournamentSlot5.SetTournamentRank(this._tournamentRank + 4);
      }
      
      public function get anim() : MovieClip
      {
         return this.loadingTournament.getChildByName("anim") as MovieClip;
      }
      
      public function get tournamentSlot3() : MovieClip
      {
         return panel.getChildByName("tournamentSlot3") as MovieClip;
      }
      
      private function SuccessLoadEnemy(a:Array) : void
      {
         var s:String = null;
         if(this._cancel)
         {
            return;
         }
         var r:int = Math.floor(Math.random() * a.length);
         var o:DatabaseObject = a[r];
         this._enemyArmyStats = o;
         if(o)
         {
            if(this.AlreadyLoaded(o.key) || o.key == Main.instance.GetPIOid() + "_army1" || o.key == Main.instance.GetPIOid() + "_army2" || o.key == Main.instance.GetPIOid() + "_army3" || o.key == Main.instance.GetPIOid() + "_army4" || o.key == Main.instance.GetPIOid() + "_army5")
            {
               this.LoadEnemy();
            }
            else
            {
               this._fullEnemyArmyname = o.key;
               this._enemyArmySelected = o.key.substr(o.key.length - 5,5);
               s = o.key.substr(0,o.key.length - 6);
               this._enemyName = s.substr(3,s.length - 3);
               PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("PlayerObjects",s,this.SuccessLoadPlayerData,this.FailLoadEnemy);
            }
         }
         else
         {
            this.NextLoad();
         }
      }
      
      private function NextLoad() : void
      {
         if(BC_Game.instance.tournamentLoaded.length >= 5)
         {
            this.EndLoading();
            return;
         }
         --this._rankToLoad;
         this.LoadEnemy();
      }
      
      private function LoadEnemy() : void
      {
         this._tournamentSlot1.SetTournamentRank(-1);
         this._tournamentSlot2.SetTournamentRank(-1);
         this._tournamentSlot3.SetTournamentRank(-1);
         this._tournamentSlot4.SetTournamentRank(-1);
         this._tournamentSlot5.SetTournamentRank(-1);
         this.loadingTournament.visible = true;
         if(this._rankToLoad > 20)
         {
            this._rankToLoad = 20;
         }
         if(this._rankToLoad < 1)
         {
            this._rankToLoad = 1;
         }
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.loadRange("ArmyList","Rank",[this._rankToLoad],null,null,25,this.SuccessLoadEnemy,this.FailLoadEnemy);
      }
      
      private function FailLoadEnemy(p:PlayerIOError) : void
      {
         this.NextLoad();
      }
      
      private function PlaySilverAnim() : void
      {
         this._playSilverAnim = true;
      }
      
      override public function QuickOpen() : void
      {
         var g:GoldRewardScreen = null;
         super.QuickOpen();
         if(BC_Game.instance.tournamentReward != -1)
         {
            g = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_GOLDREWARD_SCREEN,false,true) as GoldRewardScreen;
            g.SetReward(BC_Game.instance.tournamentReward);
            BC_Game.instance.tournamentReward = -1;
            FileManager.instance.SaveToExternalAPI();
         }
         if(BC_Game.instance.currentTournamentLevel >= 6)
         {
            this.EndLoading();
            this.CheckPlayTournamentAnim();
            return;
         }
         this.CheckLoadEnemy();
      }
      
      public function onCancel(event:MouseEvent) : void
      {
         this._cancel = true;
         this.loadingTournament.visible = false;
      }
      
      private function CheckLoadEnemy() : void
      {
         if(BC_Game.instance.tournamentLoaded.length >= 5)
         {
            this.EndLoading();
            return;
         }
         while(BC_Game.instance.tournamentLoaded.length > 0)
         {
            BC_Game.instance.tournamentLoaded.shift();
         }
         this._cancel = false;
         this._rankToLoad = 0;
         for(var i:int = 0; i < 4; i++)
         {
            if(this._rankToLoad < BC_GameProgress.gameProgess.getArmy(i).multiPlayerRank)
            {
               this._rankToLoad = BC_GameProgress.gameProgess.getArmy(i).multiPlayerRank;
            }
         }
         this._rankToLoad += 5;
         this.LoadEnemy();
      }
      
      private function CheckTournamentRank() : void
      {
         var add:int = BC_GameProgress.gameProgess.tournamentGold + BC_GameProgress.gameProgess.tournamentSilver;
         this._tournamentRank = Math.round(add * 5 + 1);
      }
      
      public function get loadingTournament() : MovieClip
      {
         return panel.getChildByName("loadingTournament") as MovieClip;
      }
      
      public function get btn_Refresh_Tournament() : ButtonSelect
      {
         return panel.getChildByName("btn_Refresh_Tournament") as ButtonSelect;
      }
      
      public function get goldSkullTxt() : TextField
      {
         return panel.getChildByName("goldSkullTxt") as TextField;
      }
      
      public function get btn_cancel() : ButtonSelect
      {
         return this.loadingTournament.getChildByName("btn_cancel") as ButtonSelect;
      }
      
      public function AlreadyLoaded(armyName:String) : Boolean
      {
         var m:MetaEnemyLoaded = null;
         for(var i:int = 0; i < BC_Game.instance.tournamentLoaded.length; i++)
         {
            m = BC_Game.instance.tournamentLoaded[i];
            if(m.fullArmyName == armyName)
            {
               return true;
            }
         }
         return false;
      }
      
      private function RecurPlay(mc:MovieClip) : void
      {
         mc.play();
         for(var i:int = 0; i < mc.numChildren; i++)
         {
            if(mc.getChildAt(i) as MovieClip)
            {
               this.RecurPlay(mc.getChildAt(i) as MovieClip);
            }
         }
      }
      
      override public function Update() : void
      {
         super.Update();
         this._tournamentSlot1.Update();
         this._tournamentSlot2.Update();
         this._tournamentSlot3.Update();
         this._tournamentSlot4.Update();
         this._tournamentSlot5.Update();
         this.silverSkullTxt.text = BC_GameProgress.gameProgess.tournamentSilver + "";
         this.goldSkullTxt.text = BC_GameProgress.gameProgess.tournamentGold + "";
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_GOLDREWARD_SCREEN) > 0)
         {
            return;
         }
         if(this._playSilverAnim)
         {
            this.SilverSkullAnim.visible = true;
            this.SilverSkullAnim.play();
            if(this.SilverSkullAnim.currentFrame == 5)
            {
               Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_THUNDERSTORMSTAFF);
            }
            if(this.SilverSkullAnim.currentFrame >= this.SilverSkullAnim.totalFrames)
            {
               this._playSilverAnim = false;
               this.SilverSkullAnim.visible = false;
               this.SilverSkullAnim.gotoAndStop(1);
               ++BC_GameProgress.gameProgess.tournamentSilver;
               BC_Game.instance.CheckUnlockFlag();
               this.onRefreshTournament(null);
               BC_Game.instance.Save();
            }
         }
         else
         {
            this.SilverSkullAnim.visible = false;
            this.SilverSkullAnim.gotoAndStop(1);
         }
         if(this._playGoldAnim)
         {
            this.GoldSkullAnim.visible = true;
            this.GoldSkullAnim.play();
            if(this.GoldSkullAnim.currentFrame == 5)
            {
               Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_THUNDERSTORMSTAFF);
            }
            if(this.GoldSkullAnim.currentFrame >= this.GoldSkullAnim.totalFrames)
            {
               this._playGoldAnim = false;
               this.GoldSkullAnim.visible = false;
               this.GoldSkullAnim.gotoAndStop(1);
               ++BC_GameProgress.gameProgess.tournamentGold;
               BC_Game.instance.CheckUnlockFlag();
               this.onRefreshTournament(null);
               BC_Game.instance.Save();
            }
         }
         else
         {
            this.GoldSkullAnim.visible = false;
            this.GoldSkullAnim.gotoAndStop(1);
         }
      }
      
      override public function Open(c:Callback = null) : void
      {
         var g:GoldRewardScreen = null;
         super.Open(c);
         if(BC_Game.instance.tournamentReward != -1)
         {
            g = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_GOLDREWARD_SCREEN,false,true) as GoldRewardScreen;
            g.SetReward(BC_Game.instance.tournamentReward);
            BC_Game.instance.tournamentReward = -1;
            FileManager.instance.SaveToExternalAPI();
         }
         if(BC_Game.instance.currentTournamentLevel >= 6)
         {
            this.EndLoading();
            super.Open(new Callback(this.CheckPlayTournamentAnim,this,null));
            return;
         }
         this.CheckLoadEnemy();
      }
      
      public function get GoldSkullAnim() : MovieClip
      {
         return panel.getChildByName("GoldSkullAnim") as MovieClip;
      }
      
      public function get SilverSkullAnim() : MovieClip
      {
         return panel.getChildByName("SilverSkullAnim") as MovieClip;
      }
      
      private function SuccessLoadPlayerData(o:DatabaseObject) : void
      {
         var s:String;
         var m:MetaEnemyLoaded;
         var enemyProgress:BC_GameProgress;
         var params:Array;
         if(this._cancel)
         {
            return;
         }
         enemyProgress = new BC_GameProgress();
         params = (o.savefile as String).split("*");
         params.shift();
         s = params[0];
         s = s.substr(1,s.length - 1);
         try
         {
            enemyProgress.Decode(s);
         }
         catch(error:Error)
         {
            LoadEnemy();
            return;
         }
         m = new MetaEnemyLoaded();
         m = new MetaEnemyLoaded();
         m.fullArmyName = this._fullEnemyArmyname;
         m.enemyName = this._enemyName;
         m.metaFlag = enemyProgress.metaFlag;
         switch(this._enemyArmySelected)
         {
            case "army1":
               m.metaArmy = enemyProgress.getArmy(1);
               break;
            case "army2":
               m.metaArmy = enemyProgress.getArmy(2);
               break;
            case "army3":
               m.metaArmy = enemyProgress.getArmy(3);
               break;
            case "army4":
               m.metaArmy = enemyProgress.getArmy(4);
         }
         if(m.metaArmy == null)
         {
            this.LoadEnemy();
            return;
         }
         if(m.metaArmy.GetArmyValue() <= 0 || m.metaArmy.teamId != 5 && m.metaArmy.GetArmyValue() > 1000 || m.metaArmy.teamId == 5 && m.metaArmy.GetArmyValue() > 500)
         {
            if(this._enemyArmyStats)
            {
               this._enemyArmyStats.Wins = 0;
               this._enemyArmyStats.Losts = 0;
               this._enemyArmyStats.Draws = 0;
               this._enemyArmyStats.RankLvl = 1;
               this._enemyArmyStats.CurrentRankCount = 0;
               this._enemyArmyStats.Offline = 0;
               this._enemyArmyStats.OfflineCash = 250;
               this._enemyArmyStats.save();
            }
            this.LoadEnemy();
            return;
         }
         BC_Game.instance.tournamentLoaded.unshift(m);
         this.NextLoad();
      }
      
      public function CheckPlayTournamentAnim() : void
      {
         if(BC_GameProgress.gameProgess.tournamentSilver != 0 && Math.floor(BC_GameProgress.gameProgess.tournamentSilver / 4) > BC_GameProgress.gameProgess.tournamentGold && BC_GameProgress.gameProgess.tournamentSilver % 4 == 0)
         {
            this.PlayGoldAnim();
         }
         else
         {
            this.PlaySilverAnim();
         }
      }
   }
}

