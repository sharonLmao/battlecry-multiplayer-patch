package com.battlecry.battle
{
   import com.battlecry.BC_Game;
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.enemy.BC_EnemyManager;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.meta.BC_MetaActor;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.BC_MetaSquad;
   import com.battlecry.meta.model.ModelEquipementEnum;
   import com.battlecry.meta.model.ModelSurvivalArmyEnum;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.games.sfx.Sound2D;
   
   public class RoundManager
   {
      
      public static const VICTORY:int = 1;
      
      public static const LOST:int = 2;
      
      public static const DRAW:int = 3;
      
      private var _progressionPerc:Number;
      
      private var _summonManager:SummonManager;
      
      private var _Scenario:ScenarioManager;
      
      private var _unitArmy1:Vector.<BC_MetaActor> = new Vector.<BC_MetaActor>();
      
      private var _unitArmy2:Vector.<BC_MetaActor> = new Vector.<BC_MetaActor>();
      
      private var _grid:Grid;
      
      private var _simulation:Boolean;
      
      private var _victoriousTeam:int;
      
      private var _updateVolmeSound:Number;
      
      private var _army1:BattleArmy;
      
      private var _army2:BattleArmy;
      
      private var _inBattleField:Boolean;
      
      private var _start:Boolean;
      
      private var _progressionCounter:Number;
      
      private var _context:BC_Game;
      
      private var _battleFieldSound:Sound2D;
      
      private var _gameTimer:int;
      
      private var _Action:ActionManager;
      
      private var _soundPlaying:Boolean;
      
      public function RoundManager(context:BC_Game)
      {
         super();
         this._context = context;
      }
      
      public function team1FirstSquad() : BattleSquad
      {
         return this._army1.squadQueue[0];
      }
      
      private function StartBattleFieldSound() : void
      {
         if(!this._soundPlaying)
         {
            this._soundPlaying = true;
            this._battleFieldSound = Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_MELEELOOP);
         }
         if(this._soundPlaying == false)
         {
            return;
         }
         var numUnit:int = int(this._army1.squadQueue[0].unitList.length + this._army2.squadQueue[0].unitList.length);
         if(numUnit >= 12)
         {
            this._updateVolmeSound = 1;
         }
         else if(numUnit >= 9)
         {
            this._updateVolmeSound = 0.8;
         }
         else if(numUnit >= 6)
         {
            this._updateVolmeSound = 0.6;
         }
         else if(numUnit >= 4)
         {
            this._updateVolmeSound = 0.4;
         }
         else if(numUnit >= 2)
         {
            this._updateVolmeSound = 0.2;
         }
      }
      
      public function victoriousTeam() : int
      {
         return this._victoriousTeam;
      }
      
      public function CreateGrid() : void
      {
         this._grid = new Grid();
         this._grid.Init(this._context);
      }
      
      public function clearArmy() : void
      {
         var length:int = 0;
         length = int(this._unitArmy1.length);
         for(var i:int = 0; i < length; i++)
         {
            this._unitArmy1.shift();
         }
         length = int(this._unitArmy2.length);
         for(i = 0; i < length; i++)
         {
            this._unitArmy2.shift();
         }
      }
      
      public function get gameTimer() : int
      {
         return this._gameTimer;
      }
      
      public function set grid(grid:Grid) : void
      {
         this._grid = grid;
      }
      
      public function CheckVictorious() : void
      {
         if(this._army1.CheckAllUnitsDead() && this._army2.CheckAllUnitsDead())
         {
            this._victoriousTeam = DRAW;
            BC_Game.instance.EndGame();
            this._start = false;
            this._simulation = false;
            return;
         }
         if(this._army1.CheckAllUnitsDead())
         {
            this._victoriousTeam = LOST;
            BC_Game.instance.EndGame();
            this._start = false;
            this._simulation = false;
            return;
         }
         if(this._army2.CheckAllUnitsDead())
         {
            if(BC_Game.instance.isSurvival)
            {
               if(BC_Game.instance.survivalLevel < 20)
               {
                  this._victoriousTeam = VICTORY;
                  ++BC_Game.instance.survivalLevel;
                  this.ReInitSurvival();
                  return;
               }
            }
            this._victoriousTeam = VICTORY;
            BC_Game.instance.EndGame();
            this._start = false;
            this._simulation = false;
            return;
         }
      }
      
      public function get team2() : BattleArmy
      {
         return this._army2;
      }
      
      public function set summonManager(summonManager:SummonManager) : void
      {
         this._summonManager = summonManager;
      }
      
      public function get summonManager() : SummonManager
      {
         return this._summonManager;
      }
      
      public function StopBattleField() : void
      {
         this._inBattleField = false;
         this._soundPlaying = false;
         (this._army1.squadQueue[0] as BattleSquad).inBattleField = false;
         (this._army2.squadQueue[0] as BattleSquad).inBattleField = false;
         this._updateVolmeSound = 0;
      }
      
      private function CheckBattleField() : void
      {
         if(this._army1.squadQueue.length <= 0 || this._army2.squadQueue.length <= 0)
         {
            return;
         }
         var squad1:BattleSquad = this._army1.squadQueue[0] as BattleSquad;
         var squad2:BattleSquad = this._army2.squadQueue[0] as BattleSquad;
         if(squad1 == null || squad2 == null)
         {
            return;
         }
         if(squad2.position - squad1.position <= 3)
         {
            this._inBattleField = true;
            this.StartBattleFieldSound();
            squad1.inBattleField = true;
            squad2.inBattleField = true;
         }
      }
      
      public function set progressionPerc(progressionPerc:Number) : void
      {
         this._progressionPerc = progressionPerc;
      }
      
      public function Init(metaArmy1:BC_MetaArmy, metaArmy2:BC_MetaArmy) : void
      {
         this._summonManager = new SummonManager();
         this._soundPlaying = false;
         this._updateVolmeSound = 1;
         this._start = false;
         this._progressionCounter = 0;
         this._progressionPerc = 0;
         this._inBattleField = false;
         this._victoriousTeam = 0;
         this._army1 = new BattleArmy(MiscConstants.TEAM1);
         this._army1.Init(this._context,metaArmy1,BC_Game.instance.isSurvival);
         this._army2 = new BattleArmy(MiscConstants.TEAM2);
         this._army2.Init(this._context,metaArmy2,false);
         this._Action = new ActionManager();
         this._Scenario = new ScenarioManager();
         this._Action.Init(this._army1,this._army2);
         this._Scenario.Init(this._army1,this._army2);
         this._gameTimer = 0;
         this._simulation = true;
      }
      
      public function set progressionCounter(progressionCounter:Number) : void
      {
         this._progressionCounter = progressionCounter;
      }
      
      private function CheckMoveSound() : void
      {
         var i:int = 0;
         var j:int = 0;
         var actor:BC_Actor = null;
         var horseWalk:Boolean = false;
         var humanWalk:Boolean = false;
         var artilleryMove:Boolean = false;
         var behemotMove:Boolean = false;
         for(i = 0; i < this._army1.squadQueue.length; i++)
         {
            for(j = 0; j < this._army1.squadQueue[i].unitList.length; j++)
            {
               actor = this._army1.squadQueue[i].unitList[j];
               if(actor.canMove)
               {
                  if(actor.metaActor.metaUnit.playerEquipement.specialEquip.isHorse())
                  {
                     if(horseWalk == false)
                     {
                        horseWalk = true;
                        Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_HORSEWALK);
                     }
                  }
                  else if(actor.metaActor.metaUnit.playerEquipement.creatureEquip.isArtillery() && actor.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.id != ModelEquipementEnum.CREATURE_STEAM_BEHEMOT.id)
                  {
                     if(artilleryMove == false)
                     {
                        artilleryMove = true;
                        Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_WARMACHINEMOVE);
                     }
                  }
                  else if(actor.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.id == ModelEquipementEnum.CREATURE_STEAM_BEHEMOT.id)
                  {
                     if(behemotMove == false)
                     {
                        behemotMove = true;
                        Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_BEHEMOTHMOVE);
                     }
                  }
                  else if(this._inBattleField == false && humanWalk == false)
                  {
                     humanWalk = true;
                     Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ARMYWALK);
                  }
               }
            }
         }
         for(i = 0; i < this._army2.squadQueue.length; i++)
         {
            for(j = 0; j < this._army2.squadQueue[i].unitList.length; j++)
            {
               actor = this._army2.squadQueue[i].unitList[j];
               if(actor.canMove)
               {
                  if(actor.metaActor.metaUnit.playerEquipement.specialEquip.isHorse())
                  {
                     if(horseWalk == false)
                     {
                        horseWalk = true;
                        Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_HORSEWALK);
                     }
                  }
                  else if(actor.metaActor.metaUnit.playerEquipement.creatureEquip.isArtillery() && actor.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.id != ModelEquipementEnum.CREATURE_STEAM_BEHEMOT.id)
                  {
                     if(artilleryMove == false)
                     {
                        artilleryMove = true;
                        Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_WARMACHINEMOVE);
                     }
                  }
                  else if(actor.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.id == ModelEquipementEnum.CREATURE_STEAM_BEHEMOT.id)
                  {
                     if(behemotMove == false)
                     {
                        behemotMove = true;
                        Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_BEHEMOTHMOVE);
                     }
                  }
                  else if(this._inBattleField == false && humanWalk == false)
                  {
                     humanWalk = true;
                     Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ARMYWALK);
                  }
               }
            }
         }
      }
      
      public function team2FirstSquad() : BattleSquad
      {
         return this._army2.squadQueue[0];
      }
      
      public function get progressionPerc() : Number
      {
         return this._progressionPerc;
      }
      
      public function AddSummon(teamId:int, timer:int, type:int, onRaiseUndead:Boolean) : void
      {
         if(teamId == MiscConstants.TEAM1)
         {
            this._summonManager.CreateSummon(this._army1,timer,type,onRaiseUndead);
         }
         else
         {
            this._summonManager.CreateSummon(this._army2,timer,type,onRaiseUndead);
         }
      }
      
      public function set start(start:Boolean) : void
      {
         this._start = start;
      }
      
      public function get progressionCounter() : Number
      {
         return this._progressionCounter;
      }
      
      public function get grid() : Grid
      {
         return this._grid;
      }
      
      public function get inBattleField() : Boolean
      {
         return this._inBattleField;
      }
      
      public function Destroy() : void
      {
         var i:int = 0;
         this._army1.Destroy();
         this._army2.Destroy();
         this._grid.Destroy();
         var squadVector:Vector.<BC_MetaSquad> = new Vector.<BC_MetaSquad>();
         squadVector.push(this._army1.metaArmy.metaSquad1,this._army1.metaArmy.metaSquad2,this._army1.metaArmy.metaSquad3,this._army1.metaArmy.metaSquad4,this._army1.metaArmy.metaSquad5);
         for(var j:int = 0; j < squadVector.length; j++)
         {
            for(i = 0; i < squadVector[j].unitVector.length; i++)
            {
               squadVector[j].unitVector[i].ClearBitmapData();
            }
         }
         var squadVector2:Vector.<BC_MetaSquad> = new Vector.<BC_MetaSquad>();
         squadVector2.push(this._army2.metaArmy.metaSquad1,this._army2.metaArmy.metaSquad2,this._army2.metaArmy.metaSquad3,this._army2.metaArmy.metaSquad4,this._army2.metaArmy.metaSquad5);
         for(j = 0; j < squadVector2.length; j++)
         {
            for(i = 0; i < squadVector2[j].unitVector.length; i++)
            {
               squadVector2[j].unitVector[i].ClearBitmapData();
            }
         }
      }
      
      public function SortOnce() : void
      {
         this._army1.SortOnce();
         this._army2.SortOnce();
      }
      
      public function ReInitSurvival() : void
      {
         var metaArmy2:BC_MetaArmy = null;
         var random:int = 0;
         this._progressionCounter = 0;
         this._progressionPerc = 0;
         this._inBattleField = false;
         this._army1.AllUnitIdle();
         this._army2 = new BattleArmy(MiscConstants.TEAM2);
         var currentWave:Vector.<BC_MetaArmy> = ModelSurvivalArmyEnum.WAVE_ARRAY[BC_Game.instance.survivalLevel - 1];
         if(currentWave.length == 1)
         {
            metaArmy2 = currentWave[0];
         }
         else
         {
            random = Math.floor(Math.random() * currentWave.length);
            metaArmy2 = currentWave[random];
         }
         this._army2.Init(this._context,metaArmy2,false);
         this._Action.Init(this._army1,this._army2);
         this._Scenario.Init(this._army1,this._army2);
         BC_Game.instance.survivalMove = true;
      }
      
      public function get start() : Boolean
      {
         return this._start;
      }
      
      public function set gameTimer(gameTimer:int) : void
      {
         this._gameTimer = gameTimer;
      }
      
      public function Update() : void
      {
         if(this._start)
         {
            if(this._context.paused)
            {
               return;
            }
            if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_WAVE_SCREEN) > 0)
            {
               this._army1.AllUnitIdle();
            }
            else if(BC_Game.instance.survivalMove)
            {
               this._army1.AllUnitIdle();
               this._army2.SurvivalMove();
               this._victoriousTeam = 0;
            }
            else
            {
               if(this._progressionPerc <= 0)
               {
                  this._army1.UpdateUnit();
                  this._army2.UpdateUnit();
                  this.CheckVictorious();
                  if(this._victoriousTeam == 0)
                  {
                     this._Action.NewTurn();
                     this._Scenario.NewTurn();
                     this._Action.DamageResolution();
                  }
                  this._summonManager.Update();
                  this.CheckMoveSound();
                  this.CheckBattleField();
               }
               this._progressionCounter += this._context.speedManager.GetSpeed();
               this._progressionPerc = this._progressionCounter * 100 / 36;
               this._Action.Update();
               this._Scenario.Update();
               if(this._progressionCounter >= 36)
               {
                  this._Action.ResetAll();
                  this._progressionCounter = 0;
                  this._progressionPerc = 0;
                  ++this._gameTimer;
                  BC_Game.instance.ingame.RefreshGameTimer();
                  if(!BC_Game.instance.isSurvival && Math.floor(this._gameTimer / 60) >= 5)
                  {
                     (BC_Game.instance.enemyManager as BC_EnemyManager).KillAllUnit();
                  }
               }
            }
         }
         if(this._battleFieldSound)
         {
            if(this._battleFieldSound.volume > this._updateVolmeSound + 0.01)
            {
               this._battleFieldSound.SetVolume(this._battleFieldSound.volume - 0.01);
            }
            else if(this._battleFieldSound.volume < this._updateVolmeSound - 0.01)
            {
               this._battleFieldSound.SetVolume(this._battleFieldSound.volume + 0.01);
            }
            if(this._battleFieldSound.volume <= 0.01)
            {
               this._battleFieldSound.Stop();
               Jukebox.instance.DestroySound(this._battleFieldSound);
               this._battleFieldSound = null;
               this._soundPlaying = false;
            }
         }
      }
      
      public function EmptyMyArmy() : void
      {
         this._army1.RemoveAllUnit();
      }
      
      public function set team1(team1:BattleArmy) : void
      {
         this._army1 = team1;
      }
      
      public function set team2(team2:BattleArmy) : void
      {
         this._army2 = team2;
      }
      
      public function set inBattleField(inBattleField:Boolean) : void
      {
         this._inBattleField = inBattleField;
      }
      
      public function get team1() : BattleArmy
      {
         return this._army1;
      }
   }
}

