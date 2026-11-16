package com.battlecry.actor
{
   import com.battlecry.BC_Game;
   import com.battlecry.battle.BattleArmy;
   import com.battlecry.battle.BattleSquad;
   import com.battlecry.battle.Grid;
   import com.battlecry.battle.GridCase;
   import com.battlecry.battle.GridPos;
   import com.battlecry.battle.Summon;
   import com.battlecry.behavior.BC_BehaviorFactory;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.effects.BC_GameEffect;
   import com.battlecry.effects.BC_GameEffectManager;
   import com.battlecry.effects.Projectile;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.meta.BC_MetaActor;
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.MetaPlayerEquipement;
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.meta.model.ModelAttack;
   import com.battlecry.meta.model.ModelAttackSoundEnum;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelEquipementEnum;
   import com.battlecry.meta.model.ModelProjectileEffect;
   import com.battlecry.meta.model.ModelProjectileEffectEnum;
   import com.battlecry.meta.model.ModelStatsEnum;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.Units.BitmapUnitView;
   import com.battlecry.screens.Units.UnitView;
   import com.battlecry.screens.WaveScreen;
   import com.battlecry.specialEffect.SpecialEffectManager;
   import com.battlecry.specialEffect.timedEffects.TimedEffectEnum;
   import com.battlecry.specialEffect.timedEffects.TimedMorphLarva;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.AnimationCallback;
   import com.lachhhEngine.games.behaviors.Behavior;
   import com.lachhhEngine.games.effects.GameEffect;
   import com.lachhhEngine.games.effects.GameEffectContainerId;
   import com.lachhhEngine.games.factory.FactoryObject;
   import com.lachhhEngine.games.heurtable.IHeurtable;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaBehavior;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.games.physique.Collision;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.utils.Utils;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class BC_Actor extends Actor
   {
      
      private var _direction:Point = new Point();
      
      public const LEFT:int = -1;
      
      private var _larva:Boolean;
      
      private var _toMove:Point = new Point();
      
      private var _handleShoot:Boolean = false;
      
      private var _maxChargeUpTime:int;
      
      private var _changedRow:Boolean;
      
      private var _range:int;
      
      private var _supGridCase:Vector.<GridCase> = new Vector.<GridCase>();
      
      private var _finalCase:GridCase;
      
      private var _targetToHit:Vector.<BC_Actor> = new Vector.<BC_Actor>();
      
      private var _modelEffect:ModelProjectileEffect;
      
      private var _metaStatsListAura:MetaStatsList;
      
      private var _positionInSquad:GridPos;
      
      private var _onKillCounter:Number;
      
      private var _context:BC_Game;
      
      private var _isTransformedDemonWarrior:Boolean;
      
      private var _teamId:int;
      
      private var _canMove:Boolean;
      
      private var _specialEffectManager:SpecialEffectManager;
      
      private var _chargingUp:Boolean;
      
      private var _maxHp:Number;
      
      public const UP:int = -1;
      
      private var _skeletonRaise:Boolean;
      
      public const DOWN:int = 1;
      
      private var _hp:Number;
      
      private var _startPosition:Point = new Point();
      
      private var _canDie:Boolean;
      
      private var _effect:BC_GameEffect;
      
      private var _behavior:Behavior;
      
      private var _handleMove:Point = new Point();
      
      private var _canAttack:Boolean;
      
      private var _chargeUpTime:int;
      
      private var _squadId:int;
      
      private var _focusTarget:BC_Actor;
      
      private var _isDead:Boolean;
      
      private var _activateOnKill:Boolean;
      
      private var _actorViewBitmap:BitmapUnitView;
      
      private var _selfDmg:int;
      
      private var _actorViewVector:UnitView;
      
      private var _startChargeUpTime:int;
      
      private var _survivalToMove:Number;
      
      private var _gridCase:GridCase;
      
      public const RIGHT:int = 1;
      
      public function BC_Actor()
      {
         super();
      }
      
      override public function Update(context:Game) : void
      {
         if(this._activateOnKill)
         {
            ++this._onKillCounter;
            if(this._onKillCounter >= 2)
            {
               this._onKillCounter = 0;
               this._activateOnKill = false;
               this._specialEffectManager.CastOnKill();
            }
         }
         if(context == null || this._isDead)
         {
            return;
         }
         super.Update(context);
         this.Behave();
         if(BC_VersionInfo.isBitMapMode)
         {
            this._actorViewBitmap.Update();
         }
         else
         {
            this._actorViewVector.Update();
         }
         this._gridCase.Refresh();
         if(animationContainer.alpha < 1)
         {
            animationContainer.alpha += 0.05;
         }
         if(this._canMove)
         {
            px = this._startPosition.x + this._direction.x * this._context.roundManager.progressionPerc;
            py = this._startPosition.y + this._direction.y * this._context.roundManager.progressionPerc;
         }
      }
      
      public function set squadId(squadId:int) : void
      {
         this._squadId = squadId;
      }
      
      public function GenerateTimedDmg(animID:int, targetList:Vector.<BC_Actor>, dmgList:MetaStatsList) : void
      {
         for(var i:int = 0; i < targetList.length; i++)
         {
            targetList[i].specialHit(dmgList,this);
            if(animID != -1)
            {
               (context.gameEffectManager as BC_GameEffectManager).CreateStaticFx(animID,GameEffectContainerId.ABOVE,targetList[i].px,targetList[i].py,context.actionLayer.metaLayer);
            }
         }
      }
      
      public function get hp() : Number
      {
         return this._hp;
      }
      
      public function get squadId() : int
      {
         return this._squadId;
      }
      
      public function set hp(hp:Number) : void
      {
         this._hp = hp;
      }
      
      private function CheckSupGridCase(directionX:int, directionY:int) : Boolean
      {
         var gridCase:GridCase = null;
         var toCheckCase:GridCase = null;
         var returnValue:Boolean = true;
         for(var i:int = 0; i < this._supGridCase.length; i++)
         {
            gridCase = this._supGridCase[i];
            toCheckCase = this._context.grid.GetCaseFromPos(gridCase.gridPos.x + directionX,gridCase.gridPos.y + directionY);
            if(this.grid.CheckMoveSupGridCase(toCheckCase,this) == false)
            {
               returnValue = false;
            }
         }
         return returnValue;
      }
      
      public function createAttackEffect(animID:int, targetList:Vector.<BC_Actor>, dmgList:MetaStatsList) : void
      {
         var m:GameEffect = (context.gameEffectManager as BC_GameEffectManager).CreateStaticFx(animID,GameEffectContainerId.ABOVE,this._targetToHit[0].px,this._targetToHit[0].py,context.actionLayer.metaLayer);
         if(this.teamId == MiscConstants.TEAM2)
         {
            m.animation.scaleX *= -1;
         }
         for(var i:int = 0; i < targetList.length; i++)
         {
            targetList[i].specialHit(dmgList,this);
         }
      }
      
      public function get larva() : Boolean
      {
         return this._larva;
      }
      
      public function AllUnitIdle() : void
      {
         if(BC_VersionInfo.isBitMapMode)
         {
            this._actorViewBitmap.SetIdle();
         }
         else
         {
            this._actorViewVector.SetIdle();
         }
      }
      
      public function get canBehave() : Boolean
      {
         return true;
      }
      
      public function ReduceLarvaTime(time:int) : void
      {
         var i:int = 0;
         if(this._larva)
         {
            for(i = 0; i < this._specialEffectManager.timedEffect.length; i++)
            {
               if(this._specialEffectManager.timedEffect[i] is TimedMorphLarva)
               {
                  this._specialEffectManager.timedEffect[i].duration -= time;
                  this._specialEffectManager.timedEffect[i].coolDown -= time;
               }
            }
         }
      }
      
      public function CastTimed() : void
      {
         this._specialEffectManager.CastTimed();
      }
      
      public function get handleMove() : Point
      {
         return this._handleMove;
      }
      
      private function CheckLarva() : void
      {
         for(var i:int = 0; i < this._specialEffectManager.timedEffect.length; i++)
         {
            if(this._specialEffectManager.timedEffect[i] is TimedMorphLarva)
            {
               this._larva = true;
               return;
            }
         }
      }
      
      public function get actorViewVector() : UnitView
      {
         return this._actorViewVector;
      }
      
      public function set targetToHit(targetToHit:Vector.<BC_Actor>) : void
      {
         this._targetToHit = targetToHit;
      }
      
      public function set canDie(canDie:Boolean) : void
      {
         this._canDie = canDie;
      }
      
      public function set larva(larva:Boolean) : void
      {
         this._larva = larva;
      }
      
      public function specialHit(dmgList:MetaStatsList, enemy:BC_Actor) : void
      {
         if(BC_VersionInfo.isBitMapMode)
         {
            if(this._actorViewBitmap.specialAnim)
            {
               return;
            }
         }
         var dmg:Number = 0;
         var myPlayerEquipement:MetaPlayerEquipement = this.metaActor.metaUnit.playerEquipement;
         if(dmgList.slashAttack > 0)
         {
            dmg += myPlayerEquipement.SlashResist + this.metaStatsListAura.slashResist >= dmgList.slashAttack ? 0 : dmgList.slashAttack - (myPlayerEquipement.SlashResist + this.metaStatsListAura.slashResist);
         }
         if(dmgList.bluntAttack > 0)
         {
            dmg += myPlayerEquipement.BluntResist + this.metaStatsListAura.bluntResist >= dmgList.bluntAttack ? 0 : dmgList.bluntAttack - (myPlayerEquipement.BluntResist + this.metaStatsListAura.bluntResist);
         }
         if(dmgList.piercingAttack > 0)
         {
            dmg += myPlayerEquipement.PierceResist + this.metaStatsListAura.piercingResist >= dmgList.piercingAttack ? 0 : dmgList.piercingAttack - (myPlayerEquipement.PierceResist + this.metaStatsListAura.piercingResist);
         }
         if(dmgList.explosionAttack > 0)
         {
            dmg += myPlayerEquipement.ExplosionResist + this.metaStatsListAura.explosionResist >= dmgList.explosionAttack ? 0 : dmgList.explosionAttack - (myPlayerEquipement.ExplosionResist + this.metaStatsListAura.explosionResist);
         }
         if(dmgList.fireAttack > 0)
         {
            dmg += myPlayerEquipement.FireResist + this.metaStatsListAura.fireResist >= dmgList.fireAttack ? 0 : dmgList.fireAttack - (myPlayerEquipement.FireResist + this.metaStatsListAura.fireResist);
         }
         if(dmgList.iceAttack > 0)
         {
            dmg += myPlayerEquipement.IceResist + this.metaStatsListAura.iceResist >= dmgList.iceAttack ? 0 : dmgList.iceAttack - (myPlayerEquipement.IceResist + this.metaStatsListAura.iceResist);
         }
         if(dmgList.poisonAttack > 0)
         {
            dmg += myPlayerEquipement.PoisonResist + this.metaStatsListAura.poisonResist >= dmgList.poisonAttack ? 0 : dmgList.poisonAttack - (myPlayerEquipement.PoisonResist + this.metaStatsListAura.poisonResist);
         }
         if(dmgList.lightningAttack > 0)
         {
            dmg += myPlayerEquipement.LightningResist + this.metaStatsListAura.lightningResist >= dmgList.lightningAttack ? 0 : dmgList.lightningAttack - (myPlayerEquipement.LightningResist + this.metaStatsListAura.lightningResist);
         }
         if(dmgList.darkAttack > 0)
         {
            dmg += myPlayerEquipement.DarkResist + this.metaStatsListAura.darkResist >= dmgList.darkAttack ? 0 : dmgList.darkAttack - (myPlayerEquipement.DarkResist + this.metaStatsListAura.darkResist);
         }
         if(dmgList.holyAttack > 0)
         {
            dmg += myPlayerEquipement.HolyResist + this.metaStatsListAura.holyResist >= dmgList.holyAttack ? 0 : dmgList.holyAttack - (myPlayerEquipement.HolyResist + this.metaStatsListAura.holyResist);
         }
         if(dmg <= 0)
         {
            dmg = 0.5;
         }
         this._hp -= dmg;
         if(this.CheckDie())
         {
            enemy.activateOnKill = true;
         }
      }
      
      public function set actorViewBitmap(actorViewBitmap:BitmapUnitView) : void
      {
         this._actorViewBitmap = actorViewBitmap;
      }
      
      public function get actorViewBitmap() : BitmapUnitView
      {
         return this._actorViewBitmap;
      }
      
      public function set gridCase(gridCase:GridCase) : void
      {
         this._gridCase = gridCase;
      }
      
      public function get targetToHit() : Vector.<BC_Actor>
      {
         return this._targetToHit;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._isTransformedDemonWarrior = false;
         this._changedRow = true;
         this._activateOnKill = false;
         this._onKillCounter = 0;
         this._context = context as BC_Game;
         this._canMove = false;
         this._hp = this._maxHp = this.metaActor.metaUnit.playerEquipement.Defense;
         this._skeletonRaise = false;
         if(BC_VersionInfo.isBitMapMode)
         {
            this._actorViewBitmap = new BitmapUnitView(animationContainer);
            this._actorViewBitmap.SetMetaUnit(this.metaActor.metaUnit);
            this._actorViewBitmap.SetIdle();
         }
         else
         {
            this._actorViewVector = new UnitView(animationContainer);
            this._actorViewVector.SetMetaUnit(this.metaActor.metaUnit);
            this._actorViewVector.SetIdle();
         }
         this._teamId = this.metaActor.teamId;
         this._squadId = this.metaActor.squadId;
         this._range = this.metaActor.range;
         if(this._range <= 0)
         {
            this._range = 1;
         }
         this._chargeUpTime = this._maxChargeUpTime = this._startChargeUpTime = this.metaActor.chargeupTime;
         this._chargingUp = false;
         this._modelEffect = this.metaActor.metaUnit.playerEquipement.effect;
         this._positionInSquad = new GridPos(this.metaActor.metaUnit.posInSquad.x,this.metaActor.metaUnit.posInSquad.y);
         RemoveCercleVision();
         if(this.metaActor.teamId == MiscConstants.TEAM2)
         {
            animationContainer.scaleX *= -1;
            this._positionInSquad.x = 2 - this._positionInSquad.x;
         }
         this._gridCase = this._context.grid.GetCase(this.metaActor.teamId,this.metaActor.squadId,this._positionInSquad);
         this._gridCase.actor = this;
         this.RefreshSupGridCase();
         this.AddSupGridCase();
         var p:Point = this._context.grid.gridCasePosition(this._gridCase);
         px = p.x;
         py = p.y;
         if(this.metaActor.teamId == MiscConstants.TEAM2 && BC_Game.instance.isSurvival)
         {
            this._survivalToMove = 500;
            px += this._survivalToMove;
         }
         this._specialEffectManager = new SpecialEffectManager(this,this.metaActor.metaUnit.playerEquipement.specialEffect,context as BC_Game);
         this._metaStatsListAura = new MetaStatsList();
         this._isDead = false;
         this._canDie = false;
         this._handleMove.x = this._handleMove.y = 0;
         this._handleShoot = false;
         this.SwitchBehavior(this.metaActor.metaBehavior);
         this.SortOnAllY();
         this._specialEffectManager.CastModifier(this);
         this.CheckLarva();
         if(this._larva)
         {
            if(BC_VersionInfo.isBitMapMode)
            {
               this._actorViewBitmap.SetLarva();
            }
            else
            {
               this._actorViewVector.SetLarva();
            }
         }
         animationContainer.addEventListener(MouseEvent.MOUSE_OVER,this.onRollOver);
         animationContainer.addEventListener(MouseEvent.MOUSE_OUT,this.onRollOut);
         this._selfDmg = 0;
      }
      
      public function CheckAttackLeftSummon() : void
      {
         var i:int = 0;
         var toCheckCase:GridCase = null;
         var a:BC_Actor = null;
         for(var j:int = 0; j < 1; j++)
         {
            for(i = 1; i <= 15; i++)
            {
               toCheckCase = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x - i,this._gridCase.gridPos.y + j);
               if(toCheckCase == null)
               {
                  return;
               }
               if(toCheckCase.gridPos.x > 45 || toCheckCase.gridPos.x < 0)
               {
                  return;
               }
               if(toCheckCase.gridPos.y > 5 || toCheckCase.gridPos.y < 0)
               {
                  return;
               }
               a = this.grid.CheckAttackCase(this.teamId,toCheckCase);
               if(a)
               {
                  this._focusTarget = a;
                  if(!this._focusTarget.canDie)
                  {
                     this._canAttack = true;
                     return;
                  }
                  this._canAttack = false;
               }
               else
               {
                  this._canAttack = false;
               }
            }
         }
      }
      
      private function DeleteSupGridCase() : void
      {
         for(var i:int = 0; i < this._supGridCase.length; i++)
         {
            this._supGridCase[i].actor = null;
         }
      }
      
      public function set maxHp(maxHp:Number) : void
      {
         this._maxHp = maxHp;
      }
      
      public function get range() : int
      {
         return this._range;
      }
      
      public function set actorViewVector(actorViewVector:UnitView) : void
      {
         this._actorViewVector = actorViewVector;
      }
      
      public function get grid() : Grid
      {
         return this._context.grid;
      }
      
      private function RefreshSupGridCase() : void
      {
         var newgridCasePos:GridPos = null;
         for(var i:int = 0; i < this.metaActor.supGridCase.length; i++)
         {
            newgridCasePos = new GridPos(0,this._gridCase.gridPos.y);
            if(this.teamId == MiscConstants.TEAM1)
            {
               newgridCasePos.x = this._positionInSquad.x - this.metaActor.supGridCase[i].x;
               newgridCasePos.y = this._positionInSquad.y + this.metaActor.supGridCase[i].y;
            }
            else
            {
               newgridCasePos.x = this._positionInSquad.x + this.metaActor.supGridCase[i].x;
               newgridCasePos.y = this._positionInSquad.y + this.metaActor.supGridCase[i].y;
            }
            this._supGridCase.push(this._context.grid.GetCase(this.metaActor.teamId,this.metaActor.squadId,newgridCasePos));
            this._supGridCase[0].actor = this;
         }
      }
      
      public function Behave() : void
      {
         this._behavior.Control(context,this);
      }
      
      private function DestroyBehavior() : void
      {
         if(this._behavior != null && this._behavior != BC_BehaviorFactory.BEHAVIOR_NULL)
         {
            context.behaviorManager.DestroyBehavior(this._behavior);
            this._behavior = null;
         }
      }
      
      public function set specialEffectManager(specialEffectManager:SpecialEffectManager) : void
      {
         this._specialEffectManager = specialEffectManager;
      }
      
      public function AfterDead() : void
      {
         if(this._isDead)
         {
            return;
         }
         this._isDead = true;
         this._specialEffectManager.RemoveAura();
         this._specialEffectManager.RemoveOnRaise();
         BC_Game.instance.enemyManager.DestroyActor(this);
      }
      
      public function get canShoot() : Boolean
      {
         return true;
      }
      
      public function MoveInBattleField() : void
      {
         if(this._teamId == MiscConstants.TEAM1)
         {
            this.BattleMoveRight();
         }
         else
         {
            this.BattleMoveLeft();
         }
      }
      
      public function SetSpecialEffectCastTime(castingTimeModifier:Number) : void
      {
         this._specialEffectManager.SetCastTimeModifier(castingTimeModifier);
      }
      
      public function SurvivalMove() : void
      {
         var waveScreen:WaveScreen = null;
         if(BC_VersionInfo.isBitMapMode)
         {
            this._actorViewBitmap.SetMove();
         }
         else
         {
            this._actorViewVector.SetMove();
         }
         px -= 5;
         this._survivalToMove -= 5;
         if(this._survivalToMove <= 0)
         {
            if(BC_VersionInfo.isBitMapMode)
            {
               this._actorViewBitmap.SetIdle();
            }
            else
            {
               this._actorViewVector.SetIdle();
            }
            if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_WAVE_SCREEN) <= 0)
            {
               waveScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_WAVE_SCREEN) as WaveScreen;
               waveScreen.SetWave(BC_Game.instance.survivalLevel);
               this._survivalToMove = 500;
            }
         }
      }
      
      private function Cast() : void
      {
         var i:int = 0;
         var r:Number = NaN;
         var squad:BattleSquad = null;
         var p:Point = null;
         var ennemyTeam:BattleArmy = null;
         var meteor:GameEffect = null;
         var m:GameEffect = null;
         var g:GameEffect = null;
         if(this._modelEffect != ModelProjectileEffectEnum.EFFECT_NULL)
         {
            if(this._modelEffect.modelAttackSound.initialSound != -1)
            {
               if(BC_VersionInfo.isBitMapMode)
               {
                  this._actorViewBitmap.AddCallbackAt(new AnimationCallback(this._modelEffect.modelAttackSound.frameOfInitialSound,this.PlayInitialSound,this,null));
               }
               else
               {
                  this._actorViewVector.anim.AddCallbackAt(new AnimationCallback(this._modelEffect.modelAttackSound.frameOfInitialSound,this.PlayInitialSound,this,null));
               }
            }
            if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_RAISEUNDEAD)
            {
               this._effect = (this._context.gameEffectManager as BC_GameEffectManager).CreateProjectile(px,py,this._modelEffect.effectAnimId);
               (this._effect as Projectile).team = this._teamId;
               (this._effect as Projectile).finalSound = ModelAttackSoundEnum.DARK_STAFF.finalSound;
               this._effect.Ready(this._focusTarget,this._modelEffect.onHitAnimId,this._modelEffect.offSetY,this._modelEffect.startOffSetY,this);
            }
            else if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_PROJECTILE)
            {
               this._effect = (this._context.gameEffectManager as BC_GameEffectManager).CreateProjectile(px,py,this._modelEffect.effectAnimId);
               (this._effect as Projectile).team = this._teamId;
               (this._effect as Projectile).finalSound = this._modelEffect.modelAttackSound.finalSound;
               this._effect.Ready(this._focusTarget,this._modelEffect.onHitAnimId,this._modelEffect.offSetY,this._modelEffect.startOffSetY,this);
               if(this.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.id == ModelEquipementEnum.CREATURE_RUSTY_CANON.id)
               {
                  this._selfDmg = 100000;
               }
            }
            else if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_IDLESPELL)
            {
               this._effect = (this._context.gameEffectManager as BC_GameEffectManager).CreateIdleSpell(px,py,this._modelEffect.effectAnimId);
               this._effect.Ready(this._focusTarget,this._modelEffect.onHitAnimId,this._modelEffect.offSetY,this._modelEffect.startOffSetY,this);
               this._context.PlaySound(this._modelEffect.modelAttackSound.initialSound,1);
            }
            else if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_MELEEAOESPELL)
            {
               if(this._teamId == MiscConstants.TEAM1)
               {
                  squad = this._context.roundManager.team2.squadQueue[0];
                  p = this._context.grid.gridCasePosition(new GridCase(new GridPos(squad.position,0)));
                  (this._context.gameEffectManager as BC_GameEffectManager).CreateStaticFx(this._modelEffect.effectAnimId,GameEffectContainerId.ABOVE,p.x,p.y,this._context.actionLayer.metaLayer);
               }
               else
               {
                  squad = this._context.roundManager.team1.squadQueue[0];
                  p = this._context.grid.gridCasePosition(new GridCase(new GridPos(squad.position - 2,0)));
                  (this._context.gameEffectManager as BC_GameEffectManager).CreateStaticFx(this._modelEffect.effectAnimId,GameEffectContainerId.ABOVE,p.x,p.y,this._context.actionLayer.metaLayer);
               }
            }
            else if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_MELEERANDOMATTACK)
            {
               p = this._context.grid.gridCasePosition(new GridCase(new GridPos(this._targetToHit[0].gridCase.gridPos.x,this._targetToHit[0].gridCase.gridPos.y)));
               (this._context.gameEffectManager as BC_GameEffectManager).CreateStaticFx(this._modelEffect.effectAnimId,GameEffectContainerId.ABOVE,p.x,p.y,this._context.actionLayer.metaLayer);
            }
            else if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_SQUADFRONTLINE || this._modelEffect.effectType == ModelProjectileEffect.TYPE_FIRST3LANE)
            {
               for(i = 0; i < this._targetToHit.length; i++)
               {
                  r = Math.ceil(Math.random() * 10 + 1);
                  if(BC_VersionInfo.isBitMapMode)
                  {
                     this._actorViewBitmap.AddCallbackAt(new AnimationCallback(r,this.CreateLineEffect,this,[this._targetToHit[i],this._modelEffect.effectAnimId]));
                  }
                  else
                  {
                     this._actorViewVector.anim.AddCallbackAt(new AnimationCallback(r,this.CreateLineEffect,this,[this._targetToHit[i],this._modelEffect.effectAnimId]));
                  }
               }
            }
            else if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_MELEESPLASHATTACK)
            {
               if(this._modelEffect.onHitAnimId == -1)
               {
                  this.CreateMeleeEffect();
               }
               else if(BC_VersionInfo.isBitMapMode)
               {
                  this._actorViewBitmap.AddCallbackAt(new AnimationCallback(this._modelEffect.onHitAnimId,this.CreateMeleeEffect,this,null));
               }
               else
               {
                  this._actorViewVector.anim.AddCallbackAt(new AnimationCallback(this._modelEffect.onHitAnimId,this.CreateMeleeEffect,this,null));
               }
            }
            else if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_ALLUNITS)
            {
               this._context.gameEffectManager.CreateStaticFx(this._modelEffect.effectAnimId,GameEffectContainerId.ABOVE,0,0,this._context.actionLayer.metaLayer);
            }
            else if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_ALLENEMYUNITS)
            {
               if(this._teamId == MiscConstants.TEAM1)
               {
                  ennemyTeam = this._context.roundManager.team2;
               }
               else
               {
                  ennemyTeam = this._context.roundManager.team1;
               }
               for(i = 0; i < ennemyTeam.squadQueue.length; i++)
               {
                  r = Math.random();
                  if(r < 0.5)
                  {
                     meteor = this._context.gameEffectManager.CreateStaticFx(this._modelEffect.effectAnimId,GameEffectContainerId.ABOVE,ennemyTeam.squadQueue[i].GetPos0().x,ennemyTeam.squadQueue[i].GetPos0().y,this._context.actionLayer.metaLayer);
                  }
                  else
                  {
                     meteor = this._context.gameEffectManager.CreateStaticFx(this._modelEffect.onHitAnimId,GameEffectContainerId.ABOVE,ennemyTeam.squadQueue[i].GetPos0().x,ennemyTeam.squadQueue[i].GetPos0().y,this._context.actionLayer.metaLayer);
                  }
                  if(this._teamId == MiscConstants.TEAM2)
                  {
                     meteor.animationContainer.scaleX = -1;
                  }
               }
            }
            else if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_FULLLINE)
            {
               m = this._context.gameEffectManager.CreateStaticFx(this._modelEffect.effectAnimId,GameEffectContainerId.ABOVE,px,py,this._context.actionLayer.metaLayer);
               if(this._teamId == MiscConstants.TEAM2)
               {
                  m.animation.scaleX *= -1;
               }
            }
            else if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_MORPH)
            {
               this._context.gameEffectManager.CreateStaticFx(this._modelEffect.effectAnimId,GameEffectContainerId.ABOVE,px,py,this._context.actionLayer.metaLayer);
            }
            else if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_ALL_NON_UNDEAD)
            {
               for(i = 0; i < this._targetToHit.length; i++)
               {
                  g = this._context.gameEffectManager.CreateStaticFx(this._modelEffect.effectAnimId,GameEffectContainerId.ABOVE,this._targetToHit[i].px,this._targetToHit[i].py,this._context.actionLayer.metaLayer);
                  if(this._teamId == MiscConstants.TEAM2)
                  {
                     g.animation.scaleX *= -1;
                  }
               }
            }
         }
      }
      
      public function Move2() : void
      {
         if(this._canDie)
         {
            return;
         }
         if(this._teamId == MiscConstants.TEAM1)
         {
            this.CheckMoveRight();
         }
         else
         {
            this.CheckMoveLeft();
         }
      }
      
      public function transformDemonWarrior() : void
      {
         if(BC_VersionInfo.isBitMapMode)
         {
            this.metaActor.metaUnit = BC_Game.instance.demonWarrior;
         }
         else
         {
            this.metaActor.metaUnit.playerEquipement.creatureEquip = new MetaEquipement(0,ModelEquipementEnum.CREATURE_DEMON);
            this.metaActor.metaUnit.playerEquipement.weaponEquip = new MetaEquipement(0,ModelEquipementEnum.WEAPON_PYROBLADE);
            this.metaActor.metaUnit.playerEquipement.shieldEquip = new MetaEquipement(0,ModelEquipementEnum.SHIELD_BAXSHIELD);
            this.metaActor.metaUnit.playerEquipement.armorEquip = new MetaEquipement(0,ModelEquipementEnum.ARMOR_CORRUPTEDMAIL);
            this.metaActor.metaUnit.playerEquipement.specialEquip = new MetaEquipement(0,ModelEquipementEnum.SPECIAL_CULTISTHANDRELIC);
         }
         var g:GameEffect = BC_Game.instance.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_DARKBALL_EXPLODE,GameEffectContainerId.ABOVE,px,py,BC_Game.instance.actionLayer.metaLayer) as GameEffect;
         g.py -= 5;
         g.animationContainer.scaleX = 1.25;
         g.animationContainer.scaleY = 1.25;
         this._specialEffectManager = new SpecialEffectManager(this,this.metaActor.metaUnit.playerEquipement.specialEffect,context as BC_Game);
         this._hp = this._maxHp = this.metaActor.metaUnit.playerEquipement.Defense;
         this._range = this.metaActor.metaUnit.playerEquipement.Range;
         if(this._range <= 0)
         {
            this._range = 1;
         }
         this._chargeUpTime = this._maxChargeUpTime = this._startChargeUpTime = this.metaActor.metaUnit.playerEquipement.reloadTime;
         this._chargingUp = false;
         this._modelEffect = this.metaActor.metaUnit.playerEquipement.effect;
         if(BC_VersionInfo.isBitMapMode)
         {
            this._actorViewBitmap.SetMetaUnit(this.metaActor.metaUnit);
            this._actorViewBitmap.SetIdle();
         }
         else
         {
            this._actorViewVector.SetMetaUnit(this.metaActor.metaUnit);
            this._actorViewVector.SetIdle();
         }
         this._isTransformedDemonWarrior = true;
      }
      
      public function get startChargeUpTime() : int
      {
         return this._startChargeUpTime;
      }
      
      public function SortOnYDepth() : void
      {
         var actors:Vector.<BC_Actor> = null;
         if(this._teamId == BC_Game.instance.teamFactory.ALLY1_TEAM)
         {
            actors = BC_Game.instance.roundManager.team1.GetSquad(this._squadId).unitList;
         }
         else
         {
            actors = BC_Game.instance.roundManager.team2.GetSquad(this._squadId).unitList;
         }
         var actorsToCheck:Array = new Array();
         for(var i:int = 0; i < actors.length; i++)
         {
            actorsToCheck.push(actors[i]);
         }
         actorsToCheck.sortOn("py",Array.NUMERIC);
         for(i = 0; i < actorsToCheck.length; i++)
         {
            this._context.actionLayer.GetEnemyContainer().addChild((actorsToCheck[i] as Actor).animationContainer);
         }
      }
      
      public function Attack() : void
      {
         if(this._canDie)
         {
            return;
         }
         if(this._modelEffect.isInfiniteRange())
         {
            this._canAttack = true;
            return;
         }
         if(this._teamId == MiscConstants.TEAM1)
         {
            this.CheckAttackRight();
         }
         else
         {
            this.CheckAttackLeft();
         }
      }
      
      public function CastAura() : void
      {
         this._specialEffectManager.CastAura();
         this._specialEffectManager.CastStartUp();
      }
      
      private function SpecialHitTarget(dmgList:MetaStatsList) : void
      {
         for(var i:int = 0; i < this._targetToHit.length; i++)
         {
            this._targetToHit[i].animationContainer.alpha = 0;
            this._targetToHit[i].specialHit(dmgList,this);
         }
         var length:int = int(this._targetToHit.length);
         for(var j:int = 0; j < length; j++)
         {
            this._targetToHit.shift();
         }
         if(this._effect)
         {
            this._effect = null;
         }
      }
      
      private function FindNearestEnnemy(ennemySquad:BattleSquad) : BC_Actor
      {
         var nearestEnnemy:BC_Actor = null;
         var ennemy:BC_Actor = null;
         var length:Number = NaN;
         var nearestLength:Number = 1000;
         for(var i:int = 0; i < ennemySquad.unitList.length; i++)
         {
            ennemy = ennemySquad.unitList[i];
            if(!ennemy.canDie)
            {
               length = Math.sqrt(Math.pow(ennemy.px - px,2) + Math.pow(ennemy.py - py,2));
               if(length < nearestLength)
               {
                  nearestEnnemy = ennemy;
                  nearestLength = length;
               }
            }
         }
         return nearestEnnemy;
      }
      
      public function Hit(enemy:BC_Actor) : void
      {
         if(metaInfo == null)
         {
            return;
         }
         if(BC_VersionInfo.isBitMapMode)
         {
            if(this._actorViewBitmap.specialAnim)
            {
               return;
            }
         }
         var dmg:Number = 0;
         var myPlayerEquipement:MetaPlayerEquipement = this.metaActor.metaUnit.playerEquipement;
         var enemyPlayerEquipement:MetaPlayerEquipement = enemy.metaActor.metaUnit.playerEquipement;
         if(enemyPlayerEquipement.SlashAttack + enemy.metaStatsListAura.slashAttack > 0)
         {
            dmg += myPlayerEquipement.SlashResist + this.metaStatsListAura.slashResist >= enemyPlayerEquipement.SlashAttack + enemy.metaStatsListAura.slashAttack ? 0 : enemyPlayerEquipement.SlashAttack + enemy.metaStatsListAura.slashAttack - (myPlayerEquipement.SlashResist + this.metaStatsListAura.slashResist);
         }
         if(enemyPlayerEquipement.BluntAttack + enemy.metaStatsListAura.bluntAttack > 0)
         {
            dmg += myPlayerEquipement.BluntResist + this.metaStatsListAura.bluntResist >= enemyPlayerEquipement.BluntAttack + enemy.metaStatsListAura.bluntAttack ? 0 : enemyPlayerEquipement.BluntAttack + enemy.metaStatsListAura.bluntAttack - (myPlayerEquipement.BluntResist + this.metaStatsListAura.bluntResist);
         }
         if(enemyPlayerEquipement.PierceAttack + enemy.metaStatsListAura.piercingAttack > 0)
         {
            dmg += myPlayerEquipement.PierceResist + this.metaStatsListAura.piercingResist >= enemyPlayerEquipement.PierceAttack + enemy.metaStatsListAura.piercingAttack ? 0 : enemyPlayerEquipement.PierceAttack + enemy.metaStatsListAura.piercingAttack - (myPlayerEquipement.PierceResist + this.metaStatsListAura.piercingResist);
         }
         if(enemyPlayerEquipement.ExplosionAttack + enemy.metaStatsListAura.explosionAttack > 0)
         {
            dmg += myPlayerEquipement.ExplosionResist + this.metaStatsListAura.explosionResist >= enemyPlayerEquipement.ExplosionAttack + enemy.metaStatsListAura.explosionAttack ? 0 : enemyPlayerEquipement.ExplosionAttack + enemy.metaStatsListAura.explosionAttack - (myPlayerEquipement.ExplosionResist + this.metaStatsListAura.explosionResist);
         }
         if(enemyPlayerEquipement.FireAttack + enemy.metaStatsListAura.fireAttack > 0)
         {
            dmg += myPlayerEquipement.FireResist + this.metaStatsListAura.fireResist >= enemyPlayerEquipement.FireAttack + enemy.metaStatsListAura.fireAttack ? 0 : enemyPlayerEquipement.FireAttack + enemy.metaStatsListAura.fireAttack - (myPlayerEquipement.FireResist + this.metaStatsListAura.fireResist);
         }
         if(enemyPlayerEquipement.IceAttack + enemy.metaStatsListAura.iceAttack > 0)
         {
            dmg += myPlayerEquipement.IceResist + this.metaStatsListAura.iceResist >= enemyPlayerEquipement.IceAttack + enemy.metaStatsListAura.iceAttack ? 0 : enemyPlayerEquipement.IceAttack + enemy.metaStatsListAura.iceAttack - (myPlayerEquipement.IceResist + this.metaStatsListAura.iceResist);
         }
         if(enemyPlayerEquipement.PoisonAttack + enemy.metaStatsListAura.poisonAttack > 0)
         {
            dmg += myPlayerEquipement.PoisonResist + this.metaStatsListAura.poisonResist >= enemyPlayerEquipement.PoisonAttack + enemy.metaStatsListAura.poisonAttack ? 0 : enemyPlayerEquipement.PoisonAttack + enemy.metaStatsListAura.poisonAttack - (myPlayerEquipement.PoisonResist + this.metaStatsListAura.poisonResist);
         }
         if(enemyPlayerEquipement.Lightningattack + enemy.metaStatsListAura.lightningAttack > 0)
         {
            dmg += myPlayerEquipement.LightningResist + this.metaStatsListAura.lightningResist >= enemyPlayerEquipement.Lightningattack + enemy.metaStatsListAura.lightningAttack ? 0 : enemyPlayerEquipement.Lightningattack + enemy.metaStatsListAura.lightningAttack - (myPlayerEquipement.LightningResist + this.metaStatsListAura.lightningResist);
         }
         if(enemyPlayerEquipement.DarkAttack + enemy.metaStatsListAura.darkAttack > 0)
         {
            dmg += myPlayerEquipement.DarkResist + this.metaStatsListAura.darkResist >= enemyPlayerEquipement.DarkAttack + enemy.metaStatsListAura.darkAttack ? 0 : enemyPlayerEquipement.DarkAttack + enemy.metaStatsListAura.darkAttack - (myPlayerEquipement.DarkResist + this.metaStatsListAura.darkResist);
         }
         if(enemyPlayerEquipement.HolyAttack + enemy.metaStatsListAura.holyAttack > 0)
         {
            dmg += myPlayerEquipement.HolyResist + this.metaStatsListAura.holyResist >= enemyPlayerEquipement.HolyAttack + enemy.metaStatsListAura.holyAttack ? 0 : enemyPlayerEquipement.HolyAttack + enemy.metaStatsListAura.holyAttack - (myPlayerEquipement.HolyResist + this.metaStatsListAura.holyResist);
         }
         if(dmg <= 0)
         {
            dmg = 0.5;
         }
         this._hp -= dmg;
         if(this.CheckDie())
         {
            enemy.activateOnKill = true;
         }
      }
      
      private function CreateMeleeEffect() : void
      {
         var g:GameEffect = (this._context.gameEffectManager as BC_GameEffectManager).CreateStaticFx(this._modelEffect.effectAnimId,GameEffectContainerId.ABOVE,this._targetToHit[0].px,py,this._context.actionLayer.metaLayer);
         if(this._teamId == MiscConstants.TEAM2)
         {
            g.animation.scaleX *= -1;
         }
      }
      
      public function get teamId() : int
      {
         return this._teamId;
      }
      
      private function BattleMoveLeft() : void
      {
         var diffY:int = 0;
         var diffX:int = 0;
         var CaseInFront:GridCase = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x - 1,this._gridCase.gridPos.y);
         if(CaseInFront.actor != null && CaseInFront.actor.teamId != this.teamId)
         {
            return;
         }
         var nearestEnnemy:BC_Actor = this.FindNearestEnnemy(this._context.roundManager.team1FirstSquad());
         if(nearestEnnemy == null)
         {
            return;
         }
         var ennemyCase:GridCase = nearestEnnemy.gridCase;
         var nearestFrontCase:GridCase = this._context.grid.CheckForNearestFrontCase(this._gridCase,this._teamId);
         var directionY:int = 0;
         var directionX:int = 0;
         if(this._gridCase.gridPos.x > this._context.roundManager.team2.squadQueue[0].position)
         {
            if(nearestFrontCase)
            {
               diffY = nearestFrontCase.gridPos.y - this._gridCase.gridPos.y;
               diffX = nearestFrontCase.gridPos.x - this._gridCase.gridPos.x;
               if(diffX < 0 && CaseInFront.actor == null)
               {
                  directionX = this.LEFT;
               }
               else if(diffY < 0)
               {
                  directionY = this.UP;
               }
               else if(diffY > 0)
               {
                  directionY = this.DOWN;
               }
            }
            else
            {
               directionX = this.LEFT;
            }
         }
         else
         {
            diffY = ennemyCase.gridPos.y - this._gridCase.gridPos.y;
            diffX = ennemyCase.gridPos.x + 1 - this._gridCase.gridPos.x;
            if(diffY < 0)
            {
               directionY = this.UP;
            }
            else if(diffY > 0)
            {
               directionY = this.DOWN;
            }
         }
         var toCheckCase:GridCase = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x + directionX,this._gridCase.gridPos.y + directionY);
         if(this.grid.CheckMoveCase(toCheckCase))
         {
            if(this._supGridCase.length > 0)
            {
               if(this.CheckSupGridCase(directionX,directionY))
               {
                  this.GoTo(toCheckCase);
               }
            }
            else
            {
               this.GoTo(toCheckCase);
            }
            return;
         }
      }
      
      public function CheckMoveLeft() : void
      {
         var toCheckCase:GridCase = null;
         if(this._finalCase == null)
         {
            this._finalCase = this._gridCase;
         }
         toCheckCase = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x - 1,this._gridCase.gridPos.y);
         if(toCheckCase.gridPos.x > 45 || toCheckCase.gridPos.x < 0)
         {
            return;
         }
         if(this.grid.CheckMoveCase(toCheckCase))
         {
            this._finalCase = toCheckCase;
         }
         else if(toCheckCase.actor.hp <= 0)
         {
            this._finalCase = toCheckCase;
         }
         this.GoTo(this._finalCase);
      }
      
      public function set range(range:int) : void
      {
         this._range = range;
      }
      
      public function set skeletonRaise(skeletonRaise:Boolean) : void
      {
         if(skeletonRaise)
         {
            animationContainer.visible = false;
         }
         this._skeletonRaise = skeletonRaise;
      }
      
      public function set positionInSquad(positionInSquad:GridPos) : void
      {
         this._positionInSquad = positionInSquad;
      }
      
      public function CheckAttackLeft() : void
      {
         var i:int = 0;
         var toCheckCase:GridCase = null;
         var a:BC_Actor = null;
         for(var j:int = 0; j < this.metaActor.metaUnit.playerEquipement.hauteur; j++)
         {
            for(i = 1; i <= this._range; i++)
            {
               toCheckCase = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x - i,this._gridCase.gridPos.y + j);
               if(toCheckCase == null)
               {
                  return;
               }
               if(toCheckCase.gridPos.x > 45 || toCheckCase.gridPos.x < 0)
               {
                  return;
               }
               if(toCheckCase.gridPos.y > 5 || toCheckCase.gridPos.y < 0)
               {
                  return;
               }
               a = this.grid.CheckAttackCase(this.teamId,toCheckCase);
               if(a)
               {
                  this._focusTarget = a;
                  if(!this._focusTarget.canDie)
                  {
                     this._canAttack = true;
                     return;
                  }
                  this._canAttack = false;
               }
               else
               {
                  this._canAttack = false;
               }
            }
         }
      }
      
      private function PlayMeleeSound() : void
      {
         var i:int = 0;
         if(this.metaActor == null || this.metaActor.metaUnit == null || this.metaActor.metaUnit.playerEquipement == null)
         {
            return;
         }
         if(this.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.id == -1)
         {
            i = Utils.PickRandomIn(BC_SfxFactory.PunchImpact) as int;
            this._context.PlaySound(i,1);
         }
         else if(this._targetToHit.length > 0)
         {
            if(this._targetToHit[0] == null || this._targetToHit[0].metaActor == null || this._targetToHit[0].metaActor.metaUnit == null || this._targetToHit[0].metaActor.metaUnit.playerEquipement == null)
            {
               return;
            }
            if(this._targetToHit[0].metaActor.metaUnit.playerEquipement.shieldEquip.modelEquipement.id != -1)
            {
               i = Utils.PickRandomIn(BC_SfxFactory.ShieldImpactSound) as int;
               this._context.PlaySound(i,1);
            }
            else
            {
               i = Utils.PickRandomIn(BC_SfxFactory.ImpactSound) as int;
               this._context.PlaySound(i,1);
            }
         }
      }
      
      public function get maxHp() : Number
      {
         return this._maxHp;
      }
      
      public function get gridCase() : GridCase
      {
         return this._gridCase;
      }
      
      public function AddSelfDestructTime(time:int) : void
      {
         for(var i:int = 0; i < this._specialEffectManager.timedEffect.length; i++)
         {
            if(this._specialEffectManager.timedEffect[i].id == TimedEffectEnum.TIMEDEAD.id)
            {
               this._specialEffectManager.timedEffect[i].duration += time;
               this._specialEffectManager.timedEffect[i].coolDown += time;
            }
         }
      }
      
      public function UpdateVisual(isInBattleField:Boolean) : void
      {
         var g:GameEffect = null;
         var m:ModelAttack = null;
         var BA:BattleArmy = null;
         var SQ:BattleSquad = null;
         var i:int = 0;
         if(isInBattleField && this._changedRow)
         {
            this._changedRow = false;
            this.SortOnYDepth();
         }
         if(this._isTransformedDemonWarrior)
         {
            this._isTransformedDemonWarrior = false;
            return;
         }
         if(this.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_UNDEAD && this.metaActor.metaUnit.playerEquipement.armorEquip.modelEquipement.id == ModelEquipementEnum.ARMOR_IMMORTALARMOR.id && this._skeletonRaise == true)
         {
            this._skeletonRaise = false;
            animationContainer.visible = true;
            if(this.metaActor.teamId == MiscConstants.TEAM2 && BC_Game.instance.isSurvival)
            {
               px -= 500;
            }
            if(BC_VersionInfo.isBitMapMode)
            {
               this._actorViewBitmap.SetSkeletonWarriorRaise();
            }
            else
            {
               this._actorViewVector.SetSkeletonWarriorRaise();
            }
            this.CheckUndeadRaiseYasurMythic();
            return;
         }
         if(this.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_UNDEAD && this._skeletonRaise == true)
         {
            this._skeletonRaise = false;
            animationContainer.visible = true;
            if(this.metaActor.teamId == MiscConstants.TEAM2 && BC_Game.instance.isSurvival)
            {
               px -= 500;
            }
            if(BC_VersionInfo.isBitMapMode)
            {
               this._actorViewBitmap.SetSkeletonRaise();
            }
            else
            {
               this._actorViewVector.SetSkeletonRaise();
            }
            this.CheckUndeadRaiseYasurMythic();
            return;
         }
         if(this.metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_DEMON && this._skeletonRaise == true)
         {
            this._skeletonRaise = false;
            animationContainer.visible = true;
            if(this.metaActor.teamId == MiscConstants.TEAM2 && BC_Game.instance.isSurvival)
            {
               px -= 500;
            }
            g = BC_Game.instance.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_DARKBALL_EXPLODE,GameEffectContainerId.ABOVE,px,py,BC_Game.instance.actionLayer.metaLayer) as GameEffect;
            g.py -= 5;
            g.animationContainer.scaleX = 1.25;
            g.animationContainer.scaleY = 1.25;
            if(BC_VersionInfo.isBitMapMode)
            {
               this._actorViewBitmap.SetIdle();
            }
            else
            {
               this._actorViewVector.SetIdle();
            }
            return;
         }
         if(this._larva)
         {
            if(this._canDie)
            {
               this.AfterDead();
               return;
            }
            if(BC_VersionInfo.isBitMapMode)
            {
               this._actorViewBitmap.SetLarva();
            }
            else
            {
               this._actorViewVector.SetLarva();
            }
            return;
         }
         if(this._canDie)
         {
            if(BC_VersionInfo.isBitMapMode)
            {
               this._actorViewBitmap.SetDie(new Callback(this.AfterDead,this,null));
            }
            else
            {
               this._actorViewVector.SetDie(new Callback(this.AfterDead,this,null));
            }
            return;
         }
         if(this._startChargeUpTime > 0)
         {
            if(!this._chargingUp)
            {
               if(this._canMove)
               {
                  if(BC_VersionInfo.isBitMapMode)
                  {
                     this._actorViewBitmap.SetReloadWalk();
                  }
                  else
                  {
                     this._actorViewVector.SetReloadWalk();
                  }
               }
               else if(BC_VersionInfo.isBitMapMode)
               {
                  this._actorViewBitmap.SetReloadIdle();
               }
               else
               {
                  this._actorViewVector.SetReloadIdle();
               }
               this._chargingUp = true;
               --this._chargeUpTime;
               return;
            }
            if(this._chargeUpTime <= 0)
            {
               if(this._canAttack)
               {
                  if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_MELEEAOESPELL || this._modelEffect.effectType == ModelProjectileEffect.TYPE_MELEERANDOMATTACK)
                  {
                     if(this._canMove)
                     {
                        if(BC_VersionInfo.isBitMapMode)
                        {
                           this._actorViewBitmap.SetDashAttack(new AnimationCallback(30,this.SpecialHitTarget,this,[this._modelEffect.dmgList]));
                        }
                        else
                        {
                           this._actorViewVector.SetDashAttack(new AnimationCallback(30,this.SpecialHitTarget,this,[this._modelEffect.dmgList]));
                        }
                        this.SelectTarget();
                     }
                     else
                     {
                        if(BC_VersionInfo.isBitMapMode)
                        {
                           this._actorViewBitmap.SetAttack(new AnimationCallback(30,this.SpecialHitTarget,this,[this._modelEffect.dmgList]));
                        }
                        else
                        {
                           this._actorViewVector.SetAttack(new AnimationCallback(30,this.SpecialHitTarget,this,[this._modelEffect.dmgList]));
                        }
                        this.SelectTarget();
                     }
                     this.Cast();
                     this._chargeUpTime = this._maxChargeUpTime;
                     if(this._chargeUpTime < 2)
                     {
                        this._chargeUpTime = 2;
                     }
                     this._chargingUp = false;
                     return;
                  }
                  if(this._modelEffect.effectType == ModelProjectileEffect.TYPE_RAISEUNDEAD)
                  {
                     if(this._canMove)
                     {
                        if(BC_VersionInfo.isBitMapMode)
                        {
                           this._actorViewBitmap.SetDashAttack(new AnimationCallback(30,this.SpecialHitTarget,this,[this._modelEffect.dmgList]));
                        }
                        else
                        {
                           this._actorViewVector.SetDashAttack(new AnimationCallback(30,this.SpecialHitTarget,this,[this._modelEffect.dmgList]));
                        }
                     }
                     else if(BC_VersionInfo.isBitMapMode)
                     {
                        this._actorViewBitmap.SetAttack(new AnimationCallback(30,this.SpecialHitTarget,this,[this._modelEffect.dmgList]));
                     }
                     else
                     {
                        this._actorViewVector.SetAttack(new AnimationCallback(30,this.SpecialHitTarget,this,[this._modelEffect.dmgList]));
                     }
                     if(this._teamId == MiscConstants.TEAM1)
                     {
                        this.CheckAttackRightSummon();
                     }
                     else
                     {
                        this.CheckAttackLeftSummon();
                     }
                     if(this._focusTarget)
                     {
                        this.SelectTarget();
                        this.Cast();
                     }
                     this._context.roundManager.AddSummon(this._teamId,0,Summon.TYPE_UNDEAD,true);
                     this._context.PlaySound(this._modelEffect.modelAttackSound.initialSound,1);
                     this._chargeUpTime = this._maxChargeUpTime;
                     if(this._chargeUpTime < 2)
                     {
                        this._chargeUpTime = 2;
                     }
                     this._chargingUp = false;
                     return;
                  }
                  if(this._modelEffect.dmgList == null)
                  {
                     if(this._canMove)
                     {
                        if(BC_VersionInfo.isBitMapMode)
                        {
                           this._actorViewBitmap.SetDashAttack(new AnimationCallback(30,this.HitTarget,this,null));
                        }
                        else
                        {
                           this._actorViewVector.SetDashAttack(new AnimationCallback(30,this.HitTarget,this,null));
                        }
                        this.SelectTarget();
                     }
                     else
                     {
                        if(BC_VersionInfo.isBitMapMode)
                        {
                           this._actorViewBitmap.SetAttack(new AnimationCallback(30,this.HitTarget,this,null));
                        }
                        else
                        {
                           this._actorViewVector.SetAttack(new AnimationCallback(30,this.HitTarget,this,null));
                        }
                        this.SelectTarget();
                     }
                     this.Cast();
                     this._chargeUpTime = this._maxChargeUpTime;
                     if(this._chargeUpTime < 2)
                     {
                        this._chargeUpTime = 2;
                     }
                     this._chargingUp = false;
                     return;
                  }
                  if(this._canMove)
                  {
                     if(BC_VersionInfo.isBitMapMode)
                     {
                        this._actorViewBitmap.SetDashAttack(new AnimationCallback(30,this.SpecialHitTarget,this,[this._modelEffect.dmgList]));
                     }
                     else
                     {
                        this._actorViewVector.SetDashAttack(new AnimationCallback(30,this.SpecialHitTarget,this,[this._modelEffect.dmgList]));
                     }
                     this.SelectTarget();
                  }
                  else
                  {
                     if(BC_VersionInfo.isBitMapMode)
                     {
                        this._actorViewBitmap.SetAttack(new AnimationCallback(30,this.SpecialHitTarget,this,[this._modelEffect.dmgList]));
                     }
                     else
                     {
                        this._actorViewVector.SetAttack(new AnimationCallback(30,this.SpecialHitTarget,this,[this._modelEffect.dmgList]));
                     }
                     this.SelectTarget();
                  }
                  this.Cast();
                  this._chargeUpTime = this._maxChargeUpTime;
                  if(this._chargeUpTime < 2)
                  {
                     this._chargeUpTime = 2;
                  }
                  this._chargingUp = false;
                  return;
               }
               m = this.metaActor.metaUnit.playerEquipement.attack;
               if(m.type == ModelAttack.TYPE_BUFFSQUAD_SINGLEATTACK)
               {
                  if(this.teamId == MiscConstants.TEAM1)
                  {
                     BA = this._context.roundManager.team1;
                  }
                  else
                  {
                     BA = this._context.roundManager.team2;
                  }
                  SQ = BA.getSquad(this.squadId);
                  for(i = 0; i < SQ.unitList.length; i++)
                  {
                     if(this.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.id == ModelEquipementEnum.WEAPON_CORALSTAFF.id)
                     {
                        SQ.unitList[i].hp += 10;
                        if(SQ.unitList[i].hp >= SQ.unitList[i].maxHp)
                        {
                           SQ.unitList[i].hp = SQ.unitList[i].maxHp;
                        }
                        context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_ANGELIC_BUFF,GameEffectContainerId.ABOVE,SQ.unitList[i].px,SQ.unitList[i].py,context.actionLayer.metaLayer);
                     }
                     else if(this.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.id == ModelEquipementEnum.WEAPON_ANGELICSTAFF.id)
                     {
                        SQ.unitList[i].hp += 10;
                        if(SQ.unitList[i].hp >= SQ.unitList[i].maxHp)
                        {
                           SQ.unitList[i].hp = SQ.unitList[i].maxHp;
                        }
                        context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_ANGELIC_BUFF,GameEffectContainerId.ABOVE,SQ.unitList[i].px,SQ.unitList[i].py,context.actionLayer.metaLayer);
                     }
                     else if(this.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.id == ModelEquipementEnum.WEAPON_DEMONICSTAFF.id)
                     {
                        SQ.unitList[i].metaStatsListAura.AddValue(10,ModelStatsEnum.ATTACK_DARK);
                        context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_DEMONIC_BUFF,GameEffectContainerId.ABOVE,SQ.unitList[i].px,SQ.unitList[i].py,context.actionLayer.metaLayer);
                     }
                  }
                  if(this._canMove)
                  {
                     if(BC_VersionInfo.isBitMapMode)
                     {
                        this._actorViewBitmap.SetDashAttack(new AnimationCallback(30,this.HitTarget,this,null));
                     }
                     else
                     {
                        this._actorViewVector.SetDashAttack(new AnimationCallback(30,this.HitTarget,this,null));
                     }
                  }
                  else if(BC_VersionInfo.isBitMapMode)
                  {
                     this._actorViewBitmap.SetAttack(new AnimationCallback(30,this.HitTarget,this,null));
                  }
                  else
                  {
                     this._actorViewVector.SetAttack(new AnimationCallback(30,this.HitTarget,this,null));
                  }
                  this._chargeUpTime = this._maxChargeUpTime;
                  if(this._chargeUpTime < 2)
                  {
                     this._chargeUpTime = 2;
                  }
                  this._chargingUp = false;
                  return;
               }
               if(this._canMove)
               {
                  if(BC_VersionInfo.isBitMapMode)
                  {
                     this._actorViewBitmap.SetChargeUpWalk();
                  }
                  else
                  {
                     this._actorViewVector.SetChargeUpWalk();
                  }
               }
               else if(BC_VersionInfo.isBitMapMode)
               {
                  this._actorViewBitmap.SetChargeUpIdle();
               }
               else
               {
                  this._actorViewVector.SetChargeUpIdle();
               }
               return;
            }
            if(this.metaActor.metaUnit.playerEquipement.weaponEquip.IsAttackCastWeapon() && this._canAttack)
            {
               if(this._canMove)
               {
                  if(BC_VersionInfo.isBitMapMode)
                  {
                     this._actorViewBitmap.SetDashAttack(new AnimationCallback(30,this.HitTarget,this,null));
                  }
                  else
                  {
                     this._actorViewVector.SetDashAttack(new AnimationCallback(30,this.HitTarget,this,null));
                  }
                  this.SelectTarget();
               }
               else
               {
                  if(BC_VersionInfo.isBitMapMode)
                  {
                     this._actorViewBitmap.SetAttack(new AnimationCallback(30,this.HitTarget,this,null));
                  }
                  else
                  {
                     this._actorViewVector.SetAttack(new AnimationCallback(30,this.HitTarget,this,null));
                  }
                  this.SelectTarget();
               }
               this.PlayMeleeSound();
               return;
            }
            if(this._canMove)
            {
               if(BC_VersionInfo.isBitMapMode)
               {
                  this._actorViewBitmap.SetChargeUpWalk();
               }
               else
               {
                  this._actorViewVector.SetChargeUpWalk();
               }
            }
            else if(BC_VersionInfo.isBitMapMode)
            {
               this._actorViewBitmap.SetChargeUpIdle();
            }
            else
            {
               this._actorViewVector.SetChargeUpIdle();
            }
            --this._chargeUpTime;
            return;
         }
         if(this.metaActor.metaUnit.playerEquipement.weaponEquip.isFlag())
         {
            while(this._targetToHit.length > 0)
            {
               this._targetToHit.shift();
            }
            if(this._teamId == MiscConstants.TEAM1)
            {
               this._targetToHit.push(this.CheckCasterAttackRight());
            }
            else
            {
               this._targetToHit.push(this.CheckCasterAttackLeft());
            }
            if(this._canMove)
            {
               if(this._targetToHit[0] != null)
               {
                  if(BC_VersionInfo.isBitMapMode)
                  {
                     this._actorViewBitmap.SetReloadWalk(new AnimationCallback(30,this.HitTarget,this,null));
                  }
                  else
                  {
                     this._actorViewVector.SetReloadWalk(new AnimationCallback(30,this.HitTarget,this,null));
                  }
               }
               else if(BC_VersionInfo.isBitMapMode)
               {
                  this._actorViewBitmap.SetMove();
               }
               else
               {
                  this._actorViewVector.SetMove();
               }
            }
            else if(this._targetToHit[0] != null)
            {
               if(BC_VersionInfo.isBitMapMode)
               {
                  this._actorViewBitmap.SetReloadIdle(new AnimationCallback(30,this.HitTarget,this,null));
               }
               else
               {
                  this._actorViewVector.SetReloadIdle(new AnimationCallback(30,this.HitTarget,this,null));
               }
            }
            else if(BC_VersionInfo.isBitMapMode)
            {
               this._actorViewBitmap.SetIdle();
            }
            else
            {
               this._actorViewVector.SetIdle();
            }
            return;
         }
         if(this._canAttack)
         {
            if(this._canMove)
            {
               if(BC_VersionInfo.isBitMapMode)
               {
                  this._actorViewBitmap.SetDashAttack(new AnimationCallback(30,this.HitTarget,this,null));
               }
               else
               {
                  this._actorViewVector.SetDashAttack(new AnimationCallback(30,this.HitTarget,this,null));
               }
               this.SelectTarget();
            }
            else
            {
               if(BC_VersionInfo.isBitMapMode)
               {
                  this._actorViewBitmap.SetAttack(new AnimationCallback(30,this.HitTarget,this,null));
               }
               else
               {
                  this._actorViewVector.SetAttack(new AnimationCallback(30,this.HitTarget,this,null));
               }
               this.SelectTarget();
            }
            this._specialEffectManager.CastOnAttack();
            this.Cast();
            this.PlayMeleeSound();
            return;
         }
         if(this._canMove)
         {
            if(BC_VersionInfo.isBitMapMode)
            {
               this._actorViewBitmap.SetMove();
            }
            else
            {
               this._actorViewVector.SetMove();
            }
         }
         else if(BC_VersionInfo.isBitMapMode)
         {
            this._actorViewBitmap.SetIdle();
         }
         else
         {
            this._actorViewVector.SetIdle();
         }
      }
      
      public function Die() : void
      {
         var team:BattleArmy = null;
         var i:int = 0;
         var j:int = 0;
         this._canDie = true;
         this._specialEffectManager.CastDieEffect();
         if(this.metaActor.metaUnit.playerEquipement.specialEquip.modelEquipement.id == ModelEquipementEnum.SPECIAL_DEATHNECKLACE.id)
         {
            if(this._teamId == MiscConstants.TEAM1)
            {
               team = BC_Game.instance.roundManager.team1;
            }
            else
            {
               team = BC_Game.instance.roundManager.team2;
            }
            for(i = 0; i < team.squadQueue.length; i++)
            {
               for(j = 0; j < team.squadQueue[i].unitList.length; j++)
               {
                  if(team.squadQueue[i].unitList[j].metaActor != null)
                  {
                     team.squadQueue[i].unitList[j].SelfKillAfterTurn();
                  }
               }
            }
         }
      }
      
      public function set IsDead(isDead:Boolean) : void
      {
         this._isDead = isDead;
      }
      
      private function PlayInitialSound() : void
      {
         if(this._modelEffect.modelAttackSound.initialSound != -1)
         {
            this._context.PlaySound(this._modelEffect.modelAttackSound.initialSound,1);
         }
      }
      
      public function CheckDie() : Boolean
      {
         if(this._hp <= 0 && this._canDie == false)
         {
            this.Die();
            return true;
         }
         return false;
      }
      
      public function get canDie() : Boolean
      {
         return this._canDie;
      }
      
      public function GoTo(gridCase:GridCase) : void
      {
         this._canMove = true;
         this._toMove = this._context.grid.gridCasePosition(gridCase);
         if(gridCase.gridPos.y != this._gridCase.gridPos.y)
         {
            this._changedRow = true;
         }
         this._startPosition.x = px;
         this._startPosition.y = py;
         this._direction.x = this._toMove.x - this._startPosition.x;
         this._direction.y = this._toMove.y - this._startPosition.y;
         this._direction.x /= 100;
         this._direction.y /= 100;
         gridCase.actor = this;
         this._gridCase.actor = null;
         this._gridCase = gridCase;
         this._gridCase.actor = gridCase.actor;
         this._gridCase.gridPos = gridCase.gridPos;
         this.DeleteSupGridCase();
         this.AddSupGridCase();
         this._gridCase.Refresh();
      }
      
      public function CheckAttackRightSummon() : void
      {
         var i:int = 0;
         var toCheckCase:GridCase = null;
         var a:BC_Actor = null;
         for(var j:int = 0; j < 1; j++)
         {
            for(i = 1; i <= 15; i++)
            {
               toCheckCase = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x + i,this._gridCase.gridPos.y + j);
               if(toCheckCase == null)
               {
                  return;
               }
               if(toCheckCase.gridPos.x > 45 || toCheckCase.gridPos.x < 0)
               {
                  return;
               }
               if(toCheckCase.gridPos.y > 5 || toCheckCase.gridPos.y < 0)
               {
                  return;
               }
               a = this.grid.CheckAttackCase(this.teamId,toCheckCase);
               if(a)
               {
                  this._focusTarget = a;
                  if(!this._focusTarget.canDie)
                  {
                     this._canAttack = true;
                     return;
                  }
                  this._canAttack = false;
               }
               else
               {
                  this._canAttack = false;
               }
            }
         }
      }
      
      public function CreateAttackOkKoraz(animID:int, targetList:Vector.<BC_Actor>, dmgList:MetaStatsList) : void
      {
         var m:GameEffect = null;
         for(var i:int = 0; i < targetList.length; i++)
         {
            m = (context.gameEffectManager as BC_GameEffectManager).CreateStaticFx(animID,GameEffectContainerId.ABOVE,targetList[i].px,targetList[i].py,context.actionLayer.metaLayer);
            if(this.teamId == MiscConstants.TEAM2)
            {
               m.animation.scaleX *= -1;
            }
            targetList[i].specialHit(dmgList,this);
         }
      }
      
      private function onRollOut(event:MouseEvent) : void
      {
         BC_Game.instance.HideUnitPopup();
      }
      
      public function CheckAttackRight() : void
      {
         var i:int = 0;
         var toCheckCase:GridCase = null;
         var a:BC_Actor = null;
         for(var j:int = 0; j < this.metaActor.metaUnit.playerEquipement.hauteur; j++)
         {
            for(i = 1; i <= this._range; i++)
            {
               toCheckCase = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x + i,this._gridCase.gridPos.y + j);
               if(toCheckCase == null)
               {
                  return;
               }
               if(toCheckCase.gridPos.x > 45 || toCheckCase.gridPos.x < 0)
               {
                  return;
               }
               if(toCheckCase.gridPos.y > 5 || toCheckCase.gridPos.y < 0)
               {
                  return;
               }
               a = this.grid.CheckAttackCase(this.teamId,toCheckCase);
               if(a)
               {
                  this._focusTarget = a;
                  if(!this._focusTarget.canDie)
                  {
                     this._canAttack = true;
                     return;
                  }
                  this._canAttack = false;
               }
               else
               {
                  this._canAttack = false;
               }
            }
         }
      }
      
      public function get maxChargeUpTime() : int
      {
         return this._maxChargeUpTime;
      }
      
      public function SortOnAllY() : void
      {
         var actors:Vector.<FactoryObject> = BC_Game.instance.enemyManager.activeFactoryObjects;
         var actorsToCheck:Array = new Array();
         for(var i:int = 0; i < actors.length; i++)
         {
            actorsToCheck.push(actors[i] as Actor);
         }
         actorsToCheck.sortOn("py",Array.NUMERIC);
         for(i = int(actors.length - 1); i >= 0; i--)
         {
            this._context.actionLayer.GetEnemyContainer().addChild((actors[i] as Actor).animationContainer);
         }
      }
      
      public function set teamId(teamId:int) : void
      {
         this._teamId = teamId;
      }
      
      public function get canMove() : Boolean
      {
         return this._canMove;
      }
      
      private function CheckUndeadRaiseYasurMythic() : void
      {
         var i:int = 0;
         var j:int = 0;
         var team1:BattleArmy = BC_Game.instance.roundManager.team1;
         var team2:BattleArmy = BC_Game.instance.roundManager.team2;
         for(i = 0; i < team1.squadQueue.length; i++)
         {
            for(j = 0; j < team1.squadQueue[i].unitList.length; j++)
            {
               if(team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.id == ModelEquipementEnum.CREATURE_YASUR_MYTHIC.id)
               {
                  team1.squadQueue[i].unitList[j].metaStatsListAura.AddValue(1,ModelStatsEnum.ATTACK_DARK);
                  ++team1.squadQueue[i].unitList[j].hp;
               }
            }
         }
         for(i = 0; i < team2.squadQueue.length; i++)
         {
            for(j = 0; j < team2.squadQueue[i].unitList.length; j++)
            {
               if(team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.id == ModelEquipementEnum.CREATURE_YASUR_MYTHIC.id)
               {
                  team2.squadQueue[i].unitList[j].metaStatsListAura.AddValue(1,ModelStatsEnum.ATTACK_DARK);
                  ++team2.squadQueue[i].unitList[j].hp;
               }
            }
         }
      }
      
      private function AddSupGridCase() : void
      {
         for(var i:int = 0; i < this._supGridCase.length; i++)
         {
            if(this.teamId == MiscConstants.TEAM1)
            {
               this._supGridCase[i] = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x - this.metaActor.supGridCase[i].x,this._gridCase.gridPos.y + this.metaActor.supGridCase[i].y);
               this._supGridCase[i].actor = this;
            }
            else
            {
               this._supGridCase[i] = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x + this.metaActor.supGridCase[i].x,this._gridCase.gridPos.y + this.metaActor.supGridCase[i].y);
               this._supGridCase[i].actor = this;
            }
         }
      }
      
      public function get positionInSquad() : GridPos
      {
         return this._positionInSquad;
      }
      
      public function get specialEffectManager() : SpecialEffectManager
      {
         return this._specialEffectManager;
      }
      
      private function SwitchBehavior(metaBehavior:MetaBehavior) : void
      {
         this.DestroyBehavior();
         if(metaBehavior == null)
         {
            this._behavior = BC_BehaviorFactory.BEHAVIOR_NULL;
            return;
         }
         this._behavior = context.behaviorManager.CreateBehavior(metaBehavior);
      }
      
      private function SelfKillAfterTurn() : void
      {
         this._selfDmg = 1000000;
      }
      
      public function DamageResolution() : void
      {
         if(this._selfDmg <= 0 && this._selfDmg != -10000)
         {
            return;
         }
         if(this._selfDmg == -10000)
         {
            this.specialHit(this.metaActor.metaUnit.playerEquipement.metaStatsList,this);
            this._selfDmg = 0;
         }
         this._hp -= this._selfDmg;
         if(this.CheckDie())
         {
            this._activateOnKill = true;
         }
         this._selfDmg = 0;
      }
      
      public function set startChargeUpTime(startChargeUpTime:int) : void
      {
         this._startChargeUpTime = startChargeUpTime;
      }
      
      public function get skeletonRaise() : Boolean
      {
         return this._skeletonRaise;
      }
      
      public function get IsDead() : Boolean
      {
         return this._isDead;
      }
      
      public function set handleShoot(handleShoot:Boolean) : void
      {
         this._handleShoot = handleShoot;
      }
      
      private function SelectTarget() : void
      {
         var i:int = 0;
         var j:int = 0;
         var k:int = 0;
         var team1:BattleArmy = null;
         var team2:BattleArmy = null;
         var creatureModelEquip:ModelEquipement = null;
         var enemySquad:BattleSquad = null;
         var squadPos:int = 0;
         var actor:BC_Actor = null;
         var battleArmy:BattleArmy = null;
         var squad:BattleSquad = null;
         var BA:BattleArmy = null;
         var SQ:BattleSquad = null;
         var g:GridCase = null;
         var battleArmy1:BattleArmy = null;
         var battleArmy2:BattleArmy = null;
         var BA_Random:BattleArmy = null;
         var a:BC_Actor = null;
         var numFoundInRow:int = 0;
         var team:BattleArmy = null;
         var gridCase1:GridCase = null;
         var gridCase2:GridCase = null;
         var length:int = 0;
         var squad1:BattleSquad = null;
         var m:ModelAttack = this.metaActor.metaUnit.playerEquipement.attack;
         if(m.type == ModelAttack.TYPE_SINGLEATTACK || m.type == ModelAttack.TYPE_MINEEXPLODE)
         {
            this._targetToHit.push(this._focusTarget);
            if(this.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.id == ModelEquipementEnum.WEAPON_CHEAP_MUSKET.id)
            {
               this._selfDmg = -10000;
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_BUFFSQUAD)
         {
            if(this.teamId == MiscConstants.TEAM1)
            {
               battleArmy = this._context.roundManager.team1;
            }
            else
            {
               battleArmy = this._context.roundManager.team2;
            }
            squad = battleArmy.getSquad(this.squadId);
            for(i = 0; i < squad.unitList.length; i++)
            {
               if(this._modelEffect == ModelProjectileEffectEnum.ANGELICSTAFF)
               {
                  squad.unitList[i].hp += 10;
                  squad.unitList[i].maxHp += 10;
               }
               else if(this._modelEffect == ModelProjectileEffectEnum.DEMONICSTAFF)
               {
                  squad.unitList[i].metaStatsListAura.AddValue(15,ModelStatsEnum.ATTACK_DARK);
               }
               context.gameEffectManager.CreateStaticFx(this._modelEffect.effectAnimId,GameEffectContainerId.ABOVE,squad.unitList[i].px,squad.unitList[i].py,context.actionLayer.metaLayer);
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_BUFFSQUAD_SINGLEATTACK)
         {
            if(this.teamId == MiscConstants.TEAM1)
            {
               BA = this._context.roundManager.team1;
            }
            else
            {
               BA = this._context.roundManager.team2;
            }
            SQ = BA.getSquad(this.squadId);
            for(i = 0; i < SQ.unitList.length; i++)
            {
               if(this.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.id == ModelEquipementEnum.WEAPON_CORALSTAFF.id)
               {
                  SQ.unitList[i].hp += 10;
                  if(SQ.unitList[i].hp >= SQ.unitList[i].maxHp)
                  {
                     SQ.unitList[i].hp = SQ.unitList[i].maxHp;
                  }
                  context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_ANGELIC_BUFF,GameEffectContainerId.ABOVE,SQ.unitList[i].px,SQ.unitList[i].py,context.actionLayer.metaLayer);
               }
               else if(this.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.id == ModelEquipementEnum.WEAPON_ANGELICSTAFF.id)
               {
                  SQ.unitList[i].hp += 10;
                  if(SQ.unitList[i].hp >= SQ.unitList[i].maxHp)
                  {
                     SQ.unitList[i].hp = SQ.unitList[i].maxHp;
                  }
                  context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_ANGELIC_BUFF,GameEffectContainerId.ABOVE,SQ.unitList[i].px,SQ.unitList[i].py,context.actionLayer.metaLayer);
               }
               else if(this.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.id == ModelEquipementEnum.WEAPON_DEMONICSTAFF.id)
               {
                  SQ.unitList[i].metaStatsListAura.AddValue(10,ModelStatsEnum.ATTACK_DARK);
                  context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_DEMONIC_BUFF,GameEffectContainerId.ABOVE,SQ.unitList[i].px,SQ.unitList[i].py,context.actionLayer.metaLayer);
               }
            }
            this._targetToHit.push(this._focusTarget);
            return;
         }
         if(m.type == ModelAttack.TYPE_BUFF_ALL_NON_UNDEAD)
         {
            team1 = this._context.roundManager.team1;
            team2 = this._context.roundManager.team2;
            for(i = 0; i < team1.squadQueue.length; i++)
            {
               for(j = 0; j < team1.squadQueue[i].unitList.length; j++)
               {
                  creatureModelEquip = team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement;
                  if(creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_ALL && creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_UNDEAD && creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_IMMORTAL && creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_DEMON)
                  {
                     team1.squadQueue[i].unitList[j].hp += 10;
                     context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_ANGELIC_BUFF,GameEffectContainerId.ABOVE,team1.squadQueue[i].unitList[j].px,team1.squadQueue[i].unitList[j].py,context.actionLayer.metaLayer);
                  }
               }
            }
            for(i = 0; i < team2.squadQueue.length; i++)
            {
               for(j = 0; j < team2.squadQueue[i].unitList.length; j++)
               {
                  creatureModelEquip = team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement;
                  if(creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_ALL && creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_UNDEAD && creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_IMMORTAL && creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_DEMON)
                  {
                     team2.squadQueue[i].unitList[j].hp += 10;
                     context.gameEffectManager.CreateStaticFx(BC_AnimationFactory.ID_FX_ANGELIC_BUFF,GameEffectContainerId.ABOVE,team2.squadQueue[i].unitList[j].px,team2.squadQueue[i].unitList[j].py,context.actionLayer.metaLayer);
                  }
               }
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_CAST_ALL_NON_UNDEAD)
         {
            team1 = this._context.roundManager.team1;
            team2 = this._context.roundManager.team2;
            for(i = 0; i < team1.squadQueue.length; i++)
            {
               for(j = 0; j < team1.squadQueue[i].unitList.length; j++)
               {
                  creatureModelEquip = team1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement;
                  if(creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_ALL && creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_UNDEAD && creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_IMMORTAL && creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_DEMON)
                  {
                     this._targetToHit.push(team1.squadQueue[i].unitList[j]);
                  }
               }
            }
            for(i = 0; i < team2.squadQueue.length; i++)
            {
               for(j = 0; j < team2.squadQueue[i].unitList.length; j++)
               {
                  creatureModelEquip = team2.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement;
                  if(creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_ALL && creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_UNDEAD && creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_IMMORTAL && creatureModelEquip.genre != ModelEquipement.GENRE_CREATURE_DEMON)
                  {
                     this._targetToHit.push(team2.squadQueue[i].unitList[j]);
                  }
               }
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_MELEESPLASHATTAQUE)
         {
            for(j = m.upSplash * -1; j < m.botSplash; j++)
            {
               for(i = m.rightSplash * -1; i < m.leftSplash; i++)
               {
                  if(!(this._gridCase.gridPos.y + j > 5 || this._gridCase.gridPos.y + j < 0))
                  {
                     if(this.teamId == MiscConstants.TEAM1)
                     {
                        if(!(this._gridCase.gridPos.x + 1 + i > 45 || this._gridCase.gridPos.x + 1 + i < 0))
                        {
                           g = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x + 1 + i,this._gridCase.gridPos.y + j);
                           if(g.actor != null)
                           {
                              this._targetToHit.push(g.actor);
                           }
                        }
                     }
                     else if(!(this._gridCase.gridPos.x - 1 - i > 45 || this._gridCase.gridPos.x - 1 - i < 0))
                     {
                        g = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x - 1 - i,this._gridCase.gridPos.y + j);
                        if(g.actor != null)
                        {
                           this._targetToHit.push(g.actor);
                        }
                     }
                  }
               }
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_SPLASHCANON)
         {
            for(j = 0; j < m.botSplash; j++)
            {
               for(i = 0; i < m.leftSplash; i++)
               {
                  if(!(this._gridCase.gridPos.y + j > 5 || this._gridCase.gridPos.y + j < 0))
                  {
                     if(this.teamId == MiscConstants.TEAM1)
                     {
                        if(!(this._focusTarget.gridCase.gridPos.x + i > 45 || this._focusTarget.gridCase.gridPos.x + i < 0))
                        {
                           g = this._context.grid.GetCaseFromPos(this._focusTarget.gridCase.gridPos.x + i,this._gridCase.gridPos.y + j);
                           if(g.actor != null)
                           {
                              this._targetToHit.push(g.actor);
                           }
                        }
                     }
                     else if(!(this._focusTarget.gridCase.gridPos.x - i > 45 || this._focusTarget.gridCase.gridPos.x - i < 0))
                     {
                        g = this._context.grid.GetCaseFromPos(this._focusTarget.gridCase.gridPos.x - i,this._gridCase.gridPos.y + j);
                        if(g.actor != null)
                        {
                           this._targetToHit.push(g.actor);
                        }
                     }
                  }
               }
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_MELEEAOE)
         {
            battleArmy1 = this._context.roundManager.team1;
            battleArmy2 = this._context.roundManager.team2;
            for(i = 0; i < battleArmy1.squadQueue[0].unitList.length; i++)
            {
               this._targetToHit.push(battleArmy1.squadQueue[0].unitList[i]);
            }
            for(j = 0; j < battleArmy2.squadQueue[0].unitList.length; j++)
            {
               this._targetToHit.push(battleArmy2.squadQueue[0].unitList[j]);
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_MELEE_RANDOM)
         {
            if(this.teamId == MiscConstants.TEAM1)
            {
               BA_Random = this._context.roundManager.team1;
            }
            else
            {
               BA_Random = this._context.roundManager.team2;
            }
            a = BA_Random.GetRandomUnit();
            if(a != null)
            {
               this._targetToHit.push(a);
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_CASTFIRST3LINE)
         {
            if(this.teamId == MiscConstants.TEAM1)
            {
               for(i = 0; i < 6; i++)
               {
                  numFoundInRow = 0;
                  for(k = 0; k < this._context.roundManager.team2.squadQueue.length; k++)
                  {
                     enemySquad = this._context.roundManager.team2.squadQueue[k];
                     squadPos = enemySquad.position;
                     for(j = 0; j <= 2; j++)
                     {
                        if(squadPos + j >= 0 && squadPos + j <= 45)
                        {
                           actor = this._context.grid.GetCaseFromPos(squadPos + j,i).actor;
                           if(actor != null)
                           {
                              this._targetToHit.push(actor);
                              if(++numFoundInRow >= 3)
                              {
                                 break;
                              }
                           }
                        }
                     }
                     if(numFoundInRow >= 3)
                     {
                        break;
                     }
                  }
               }
            }
            else
            {
               for(i = 0; i < 6; i++)
               {
                  numFoundInRow = 0;
                  for(k = 0; k < this._context.roundManager.team1.squadQueue.length; k++)
                  {
                     enemySquad = this._context.roundManager.team1.squadQueue[k];
                     squadPos = enemySquad.position;
                     for(j = 2; j >= 0; j--)
                     {
                        if(squadPos + j >= 0 && squadPos + j <= 45)
                        {
                           actor = this._context.grid.GetCaseFromPos(squadPos + j,i).actor;
                           if(actor != null)
                           {
                              this._targetToHit.push(actor);
                              if(++numFoundInRow >= 3)
                              {
                                 break;
                              }
                           }
                        }
                     }
                     if(numFoundInRow >= 3)
                     {
                        break;
                     }
                  }
               }
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_SQUADFRONTLINE)
         {
            if(this.teamId == MiscConstants.TEAM1)
            {
               enemySquad = this._context.roundManager.team2.squadQueue[0];
               squadPos = enemySquad.position;
               for(i = 0; i < 6; i++)
               {
                  for(j = 0; j <= 2; j++)
                  {
                     if(squadPos + j >= 0 && squadPos + j <= 45)
                     {
                        actor = this._context.grid.GetCaseFromPos(squadPos + j,i).actor;
                        if(actor != null)
                        {
                           this._targetToHit.push(actor);
                           break;
                        }
                     }
                  }
               }
               return;
            }
            enemySquad = this._context.roundManager.team1.squadQueue[0];
            squadPos = enemySquad.position;
            for(i = 0; i < 6; i++)
            {
               for(j = 2; j >= 0; j--)
               {
                  if(squadPos + j >= 0 && squadPos + j <= 45)
                  {
                     actor = this._context.grid.GetCaseFromPos(squadPos + j,i).actor;
                     if(actor != null)
                     {
                        this._targetToHit.push(actor);
                        break;
                     }
                  }
               }
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_ALLUNITS)
         {
            team1 = this._context.roundManager.team1;
            team2 = this._context.roundManager.team2;
            for(i = 0; i < team1.squadQueue.length; i++)
            {
               for(j = 0; j < team1.squadQueue[i].unitList.length; j++)
               {
                  this._targetToHit.push(team1.squadQueue[i].unitList[j]);
               }
            }
            for(i = 0; i < team2.squadQueue.length; i++)
            {
               for(j = 0; j < team2.squadQueue[i].unitList.length; j++)
               {
                  this._targetToHit.push(team2.squadQueue[i].unitList[j]);
               }
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_ALLENEMYUNITS)
         {
            if(this._teamId == MiscConstants.TEAM1)
            {
               team = this._context.roundManager.team2;
            }
            else
            {
               team = this._context.roundManager.team1;
            }
            for(i = 0; i < team.squadQueue.length; i++)
            {
               for(j = 0; j < team.squadQueue[i].unitList.length; j++)
               {
                  this._targetToHit.push(team.squadQueue[i].unitList[j]);
               }
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_FULLLINE)
         {
            for(i = 0; i < 46; i++)
            {
               if(this._teamId == MiscConstants.TEAM1)
               {
                  if(this._gridCase.gridPos.x + 1 + i > 45)
                  {
                     return;
                  }
                  gridCase1 = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x + 1 + i,this._gridCase.gridPos.y);
               }
               else
               {
                  if(this._gridCase.gridPos.x - 1 - i < 0)
                  {
                     return;
                  }
                  gridCase1 = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x - 1 - i,this._gridCase.gridPos.y);
               }
               if(gridCase1.actor != null)
               {
                  this._targetToHit.push(gridCase1.actor);
               }
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_FIRSTTARGET)
         {
            for(i = 0; i < 46; i++)
            {
               if(this._teamId == MiscConstants.TEAM1)
               {
                  if(this._gridCase.gridPos.x + 1 + i > 45)
                  {
                     return;
                  }
                  gridCase2 = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x + 1 + i,this._gridCase.gridPos.y);
               }
               else
               {
                  if(this._gridCase.gridPos.x - 1 - i < 0)
                  {
                     return;
                  }
                  gridCase2 = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x - 1 - i,this._gridCase.gridPos.y);
               }
               if(gridCase2.actor != null)
               {
                  this._targetToHit.push(gridCase2.actor);
                  return;
               }
            }
            return;
         }
         if(m.type == ModelAttack.TYPE_MORPH || m.type == ModelAttack.TYPE_SQUADMORPH)
         {
            Jukebox.instance.PlaySound(this._modelEffect.modelAttackSound.initialSound);
            if(m.type == ModelAttack.TYPE_MORPH)
            {
               this.transformDemonWarrior();
            }
            else if(m.type == ModelAttack.TYPE_SQUADMORPH)
            {
               if(this.teamId == MiscConstants.TEAM1)
               {
                  battleArmy = this._context.roundManager.team1;
               }
               else
               {
                  battleArmy = this._context.roundManager.team2;
               }
               squad1 = battleArmy.getSquad(this.squadId);
               for(i = 0; i < squad1.unitList.length; i++)
               {
                  squad1.unitList[i].transformDemonWarrior();
               }
               this._isTransformedDemonWarrior = false;
            }
            length = int(this._targetToHit.length);
            for(j = 0; j < length; j++)
            {
               this._targetToHit.shift();
            }
            return;
         }
         this._targetToHit.push(this._focusTarget);
      }
      
      public function get handleShoot() : Boolean
      {
         return this._handleShoot;
      }
      
      public function set maxChargeUpTime(maxChargeUpTime:int) : void
      {
         this._maxChargeUpTime = maxChargeUpTime;
      }
      
      public function CheckCasterAttackLeft() : BC_Actor
      {
         var toCheckCase:GridCase = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x - 1,this._gridCase.gridPos.y);
         return this.grid.CheckAttackCase(this.teamId,toCheckCase);
      }
      
      public function get chargeUpTime() : int
      {
         return this._chargeUpTime;
      }
      
      public function get activateOnKill() : Boolean
      {
         return this._activateOnKill;
      }
      
      override public function Destroy() : void
      {
         animationContainer.removeEventListener(MouseEvent.MOUSE_OUT,this.onRollOut);
         animationContainer.removeEventListener(MouseEvent.MOUSE_OVER,this.onRollOver);
         super.Destroy();
         this.DeleteSupGridCase();
         this.EmptyGridCase();
         this._gridCase.actor = null;
         this.DestroyBehavior();
         this._isDead = true;
         if(BC_VersionInfo.isBitMapMode)
         {
            this._actorViewBitmap.Destroy();
         }
         else
         {
            this._actorViewVector.Destroy();
         }
      }
      
      private function BattleMoveRight() : void
      {
         var diffY:int = 0;
         var diffX:int = 0;
         var CaseInFront:GridCase = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x + 1,this._gridCase.gridPos.y);
         if(CaseInFront.actor != null && CaseInFront.actor.teamId != this.teamId)
         {
            return;
         }
         var nearestEnnemy:BC_Actor = this.FindNearestEnnemy(this._context.roundManager.team2FirstSquad());
         if(nearestEnnemy == null)
         {
            return;
         }
         var ennemyCase:GridCase = nearestEnnemy.gridCase;
         var nearestFrontCase:GridCase = this._context.grid.CheckForNearestFrontCase(this._gridCase,this._teamId);
         var directionY:int = 0;
         var directionX:int = 0;
         if(this._gridCase.gridPos.x < this._context.roundManager.team1.squadQueue[0].position + 2)
         {
            if(nearestFrontCase)
            {
               diffY = nearestFrontCase.gridPos.y - this._gridCase.gridPos.y;
               diffX = nearestFrontCase.gridPos.x - this._gridCase.gridPos.x;
               if(diffX > 0 && CaseInFront.actor == null)
               {
                  directionX = this.RIGHT;
               }
               else if(diffY < 0)
               {
                  directionY = this.UP;
               }
               else if(diffY > 0)
               {
                  directionY = this.DOWN;
               }
            }
            else
            {
               directionX = this.RIGHT;
            }
         }
         else
         {
            diffY = ennemyCase.gridPos.y - this._gridCase.gridPos.y;
            diffX = ennemyCase.gridPos.x - 1 - this._gridCase.gridPos.x;
            if(diffY < 0)
            {
               directionY = this.UP;
            }
            else if(diffY > 0)
            {
               directionY = this.DOWN;
            }
         }
         var toCheckCase:GridCase = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x + directionX,this._gridCase.gridPos.y + directionY);
         if(this.grid.CheckMoveCase(toCheckCase))
         {
            if(this._supGridCase.length > 0)
            {
               if(this.CheckSupGridCase(directionX,directionY))
               {
                  this.GoTo(toCheckCase);
               }
            }
            else
            {
               this.GoTo(toCheckCase);
            }
            return;
         }
      }
      
      private function EmptyGridCase() : void
      {
         var l:int = int(this._supGridCase.length);
         for(var i:int = 0; i < l; i++)
         {
            this._supGridCase.shift();
         }
      }
      
      private function HitTarget() : void
      {
         for(var i:int = 0; i < this._targetToHit.length; i++)
         {
            if(this._targetToHit[i] != null)
            {
               this._targetToHit[i].animationContainer.alpha = 0;
               this._targetToHit[i].Hit(this);
            }
         }
         var length:int = int(this._targetToHit.length);
         for(var j:int = 0; j < length; j++)
         {
            this._targetToHit.shift();
         }
         if(this._effect)
         {
            this._effect = null;
         }
      }
      
      public function CheckMoveRight() : void
      {
         var toCheckCase:GridCase = null;
         if(this._finalCase == null)
         {
            this._finalCase = this._gridCase;
         }
         toCheckCase = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x + 1,this._gridCase.gridPos.y);
         if(toCheckCase.gridPos.x > 45 || toCheckCase.gridPos.x < 0)
         {
            return;
         }
         if(this.grid.CheckMoveCase(toCheckCase))
         {
            this._finalCase = toCheckCase;
         }
         else if(toCheckCase.actor.hp <= 0)
         {
            this._finalCase = toCheckCase;
         }
         this.GoTo(this._finalCase);
      }
      
      public function CheckCasterAttackRight() : BC_Actor
      {
         var toCheckCase:GridCase = this._context.grid.GetCaseFromPos(this._gridCase.gridPos.x + 1,this._gridCase.gridPos.y);
         return this.grid.CheckAttackCase(this.teamId,toCheckCase);
      }
      
      private function CreateLineEffect(target:BC_Actor, animID:int) : void
      {
         var g:GameEffect = (this._context.gameEffectManager as BC_GameEffectManager).CreateStaticFx(animID,GameEffectContainerId.ABOVE,target.px,target.py,this._context.actionLayer.metaLayer);
         if(this._teamId == MiscConstants.TEAM2)
         {
            g.animation.scaleX *= -1;
         }
      }
      
      public function set metaStatsListAura(metaStatsListAura:MetaStatsList) : void
      {
         this._metaStatsListAura = metaStatsListAura;
      }
      
      private function onRollOver(event:MouseEvent) : void
      {
         BC_Game.instance.ShowUnitPopup(this.metaActor.metaUnit);
      }
      
      public function Move() : void
      {
         if(this._canDie)
         {
            return;
         }
         if(this._teamId == MiscConstants.TEAM1)
         {
            this.CheckMoveRight();
         }
         else
         {
            this.CheckMoveLeft();
         }
      }
      
      public function get metaStatsListAura() : MetaStatsList
      {
         return this._metaStatsListAura;
      }
      
      public function set activateOnKill(activateOnKill:Boolean) : void
      {
         this._activateOnKill = activateOnKill;
      }
      
      public function get metaActor() : BC_MetaActor
      {
         return BC_MetaActor(metaInfo);
      }
      
      public function ResetAll() : void
      {
         this._canMove = false;
         this._startPosition.x = px;
         this._startPosition.y = py;
         this._direction.x = 0;
         this._direction.y = 0;
         this._toMove.x = 0;
         this._toMove.y = 0;
         this._focusTarget = null;
      }
      
      public function GenerateTimedDefDmg(animID:int, targetList:Vector.<BC_Actor>, defDmg:int) : void
      {
         if(BC_VersionInfo.isBitMapMode)
         {
            if(this._actorViewBitmap.specialAnim)
            {
               return;
            }
         }
         for(var i:int = 0; i < targetList.length; i++)
         {
            targetList[i].hp -= defDmg;
            targetList[i].maxHp -= defDmg;
            targetList[i].CheckDie();
            if(animID != -1)
            {
               (context.gameEffectManager as BC_GameEffectManager).CreateStaticFx(animID,GameEffectContainerId.ABOVE,targetList[i].px,targetList[i].py,context.actionLayer.metaLayer);
            }
         }
      }
      
      public function set chargeUpTime(chargeUpTime:int) : void
      {
         this._chargeUpTime = chargeUpTime;
      }
      
      public function OnOwnerHit(victimCol:IHeurtable, attackerCol:IHeurtable, oCol:Collision) : void
      {
      }
   }
}

