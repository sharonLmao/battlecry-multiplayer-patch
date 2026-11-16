package com.lachhhEngine.games
{
   import com.lachhhEngine.games.ammo.AmmoManager;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.behaviors.BehaviorManager;
   import com.lachhhEngine.games.debug.Debug;
   import com.lachhhEngine.games.debug.TimeProfiler;
   import com.lachhhEngine.games.effects.GameEffectManager;
   import com.lachhhEngine.games.enemy.EnemyManager;
   import com.lachhhEngine.games.factory.FactoryObject;
   import com.lachhhEngine.games.hero.HeroManager;
   import com.lachhhEngine.games.items.ItemManager;
   import com.lachhhEngine.games.level.LevelBmpBank;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.level.LevelManager;
   import com.lachhhEngine.games.level.levelEvents.LevelEventManager;
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.meta.metaObject.MetaGame;
   import com.lachhhEngine.games.meta.metaObject.MetaLevel;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.games.scenario.GameEventFactory;
   import com.lachhhEngine.games.scenario.GameEventManager;
   import com.lachhhEngine.games.teams.TeamFactory;
   import com.lachhhEngine.games.weapon.WeaponManager;
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.KeyManager;
   import com.lachhhEngine.utils.Utils;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.utils.getQualifiedClassName;
   
   public class Game extends Sprite
   {
      
      private var _metaLevel:MetaLevel;
      
      private var _gameMgr:GameManagers;
      
      private var _destroyAfterUpdate:Boolean;
      
      private var _eventManager:GameEventManager;
      
      private var _levelEditorMode:Boolean = false;
      
      private var _timeProfiler2:TimeProfiler;
      
      private var _timeProfiler1:TimeProfiler;
      
      private var _lvlMgr:LevelManager;
      
      private var _mouseOnGame:Point;
      
      private var _waitCallback:Array;
      
      private var _tabUpdate:Vector.<IUpdatable>;
      
      private var _camera:GameCamera;
      
      private var _tabUpdatableToRemove:Vector.<IUpdatable>;
      
      private var _paused:Boolean = false;
      
      private var _inGameUIMgr:IngameUIManager;
      
      private var _metaGame:MetaGame;
      
      private var _isInit:Boolean = false;
      
      private var _actionLayer:LevelLayer = null;
      
      public function Game()
      {
         super();
         this._tabUpdate = new Vector.<IUpdatable>();
         this._tabUpdatableToRemove = new Vector.<IUpdatable>();
         this._waitCallback = new Array();
         this._mouseOnGame = new Point();
         this._timeProfiler1 = new TimeProfiler();
         this._timeProfiler2 = new TimeProfiler();
      }
      
      public function get behaviorManager() : BehaviorManager
      {
         return this._gameMgr.behaviorMgr;
      }
      
      public function ReInit(metaLevel:MetaLevel, callBackLevelLoaded:Callback, callbackProgress:Callback) : void
      {
         this.Destroy();
         this.LoadLevel(metaLevel,callBackLevelLoaded,callbackProgress);
      }
      
      public function get metaLevel() : MetaLevel
      {
         return this._metaLevel;
      }
      
      protected function LevelLoaded(c:Callback) : void
      {
         this._isInit = true;
         if(c != null)
         {
            c.DoCallback();
         }
      }
      
      public function GetVisualContainer() : DisplayObjectContainer
      {
         return this;
      }
      
      public function get enemyManager() : EnemyManager
      {
         return this._gameMgr.enemyMgr;
      }
      
      public function AlterCompression(n:Number) : Number
      {
         return n;
      }
      
      public function get gameEffectManager() : GameEffectManager
      {
         return this._gameMgr.gameFxMgr;
      }
      
      public function get isInit() : Boolean
      {
         return this._isInit;
      }
      
      public function get metaGame() : MetaGame
      {
         return this._metaGame;
      }
      
      public function get levelManager() : LevelManager
      {
         return this._lvlMgr;
      }
      
      public function UpdateAllActorColision() : void
      {
         this.UpdateCollisionInArray(this.ammoManager.activeFactoryObjects);
         this.UpdateCollisionInArray(this.enemyManager.activeFactoryObjects);
         this.UpdateCollisionInArray(this.heroManager.activeFactoryObjects);
         this.UpdateCollisionInArray(this.gameEffectManager.activeFactoryObjects);
         this.UpdateCollisionInArray(this.itemManager.activeFactoryObjects);
      }
      
      public function LoadLevel(metaLevel:MetaLevel, endCallBack:Callback, progressCallback:Callback, autoStartLevelEvent:Boolean = true) : void
      {
         this._destroyAfterUpdate = false;
         this._metaLevel = metaLevel;
         this.camera.SetBounds(metaLevel.camBoundsLeft,metaLevel.camBoundsRight,metaLevel.camBoundsUp,metaLevel.camBoundsDown);
         this.levelManager.LoadLevel(metaLevel,new Callback(this.LevelLoaded,this,[endCallBack]),progressCallback);
         if(!this._levelEditorMode && autoStartLevelEvent)
         {
            this.levelEventManager.InitLevel(this,metaLevel.levelEventId);
         }
         Debug.AddDessinGroup(Debug.GD_LIGNE,this.actionLayer.GetDebugContainer());
      }
      
      public function get itemManager() : ItemManager
      {
         return this._gameMgr.itemMgr;
      }
      
      public function DestroyAfterUpdate() : void
      {
         this._destroyAfterUpdate = true;
      }
      
      public function RemoveWaitCallback(waitCallback:WaitCallback) : void
      {
         this.RemoveUpdatable(waitCallback);
         Utils.RemoveFromArray(this._waitCallback,waitCallback);
      }
      
      public function ClearWaitCallback() : void
      {
         var c:WaitCallback = null;
         while(this._waitCallback.length > 0)
         {
            c = this._waitCallback[0];
            this.RemoveWaitCallback(c);
         }
      }
      
      public function set levelEditorMode(levelEditorMode:Boolean) : void
      {
         this._levelEditorMode = levelEditorMode;
      }
      
      public function UpdateCollisionInArray(a:Vector.<FactoryObject>) : void
      {
         var actor:Actor = null;
         for(var i:int = 0; i < a.length; i++)
         {
            actor = a[i] as Actor;
            actor.UpdateMyCollision();
         }
      }
      
      public function GetNBUpdatable() : int
      {
         return this._tabUpdate.length;
      }
      
      public function get paused() : Boolean
      {
         return this._paused;
      }
      
      public function Init(metaGame:MetaGame) : void
      {
         this._gameMgr = metaGame.gameManagers;
         this._eventManager = new GameEventManager(this,new GameEventFactory());
         this._camera = new GameCamera(this,metaGame.width,metaGame.height);
         this._lvlMgr = new LevelManager(this);
         this._inGameUIMgr = new IngameUIManager(this);
         this._metaGame = metaGame;
         this._destroyAfterUpdate = false;
      }
      
      public function AddPlayerFromMeta(metaHero:MetaActor, fromLevelLoaded:Boolean) : Actor
      {
         var hero:Actor = null;
         if(fromLevelLoaded)
         {
            metaHero.x = this._metaLevel.heroPos.x;
            metaHero.y = this._metaLevel.heroPos.y;
         }
         return this.heroManager.CreateHero(metaHero);
      }
      
      public function RemoveUpdatable(oUpdatable:IUpdatable) : void
      {
         this._tabUpdatableToRemove.push(oUpdatable);
         oUpdatable.SetEnable(false);
      }
      
      public function get actionLayer() : LevelLayer
      {
         return this._lvlMgr.actionLayer;
      }
      
      public function get camera() : GameCamera
      {
         return this._camera;
      }
      
      public function get ingameUIManager() : IngameUIManager
      {
         return this._inGameUIMgr;
      }
      
      public function get gameEventManager() : GameEventManager
      {
         return this._eventManager;
      }
      
      private function ClearUpdatableToRemove() : void
      {
         var u:IUpdatable = null;
         var bFound:Boolean = false;
         var i:int = 0;
         while(this._tabUpdatableToRemove.length > 0)
         {
            u = this._tabUpdatableToRemove.shift();
            bFound = false;
            for(i = 0; i < this._tabUpdate.length; i++)
            {
               if(this._tabUpdate[i] == u)
               {
                  u.OnRemove(this);
                  this._tabUpdate.splice(i,1);
                  bFound = true;
                  break;
               }
            }
            if(!bFound)
            {
               trace("WARNING :: Game_c :: RemoveUpdatable :: Can\'t find the updatable : " + u);
            }
         }
      }
      
      public function get heroManager() : HeroManager
      {
         return this._gameMgr.heroMgr;
      }
      
      public function get levelEditorMode() : Boolean
      {
         return this._levelEditorMode;
      }
      
      protected function get gameMgr() : GameManagers
      {
         return this._gameMgr;
      }
      
      public function Pause(pause:Boolean) : void
      {
         Actor.Pause(pause);
         this._paused = pause;
      }
      
      public function get levelEventManager() : LevelEventManager
      {
         return this._gameMgr.levelEventMgr;
      }
      
      protected function Destroy() : void
      {
         if(!this._isInit)
         {
            return;
         }
         this.ClearWaitCallback();
         this.levelEventManager.DestroyLevel(this);
         this.heroManager.DestroyAllHero();
         this.ammoManager.DestroyAllAmmo();
         this.enemyManager.DestroyAll();
         this.gameEffectManager.DestroyAll();
         this.itemManager.DestroyAll();
         this._eventManager.DestroyAllEventSwitch();
         this.levelManager.DestroyAllLayer();
         this.ingameUIManager.Destroy();
         this._actionLayer = null;
         this._camera.Destroy();
         LevelBmpBank.instance.Destroy();
         this._inGameUIMgr.Destroy();
         this._isInit = false;
      }
      
      public function GetPlayer1() : Actor
      {
         return this.heroManager.GetPlayer1();
      }
      
      public function Draw() : void
      {
      }
      
      public function get speedManager() : SpeedManager
      {
         return this._gameMgr.speedMgr;
      }
      
      public function Update() : void
      {
         var oUpdatable:IUpdatable = null;
         if(!this._isInit)
         {
            return;
         }
         TimeProfiler.RemoveAllChild();
         this._timeProfiler1.StopProfile();
         if(VersionInfo.debugVersion)
         {
            if(KeyManager.IsKeyDown(Keyboard.HOME))
            {
               Debug.EffaceGroupeDessin(Debug.GD_LIGNE);
            }
         }
         this._timeProfiler2.StartProfile("Logic");
         for(var i:int = 0; i < this._tabUpdate.length; i++)
         {
            oUpdatable = this._tabUpdate[i];
            if(oUpdatable.IsEnabled())
            {
               this._timeProfiler1.StartProfile(getQualifiedClassName(oUpdatable).split("::")[1]);
               oUpdatable.Update(this);
               this._timeProfiler1.StopProfile();
            }
         }
         this._timeProfiler2.StopProfile(1);
         this._timeProfiler1.StartProfile("Enemy Manager");
         this.enemyManager.Update();
         this._timeProfiler1.StopProfile();
         this._timeProfiler1.StartProfile("LevelEvent");
         this.levelEventManager.UpdateLevel(this);
         this._timeProfiler1.StopProfile();
         if(this._camera.IsEnabled())
         {
            this._timeProfiler1.StartProfile("Camera");
            this._camera.Update(this);
            this._timeProfiler1.StopProfile();
         }
         if(this._lvlMgr.IsEnabled())
         {
            this._timeProfiler1.StartProfile("Level Manager");
            this._lvlMgr.Update(this);
            this._timeProfiler1.StopProfile();
         }
         if(this.speedManager.IsEnabled())
         {
            this._timeProfiler1.StartProfile("Speed Manager");
            this.speedManager.Update(this);
            this._timeProfiler1.StopProfile();
         }
         this.ClearUpdatableToRemove();
         if(this._destroyAfterUpdate)
         {
            this._destroyAfterUpdate = false;
            this.Destroy();
         }
         if(VersionInfo.debugVersion)
         {
            if(KeyManager.IsKeyDown(Keyboard.HOME))
            {
               Debug.showLines = true;
               if(this.GetPlayer1())
               {
                  Debug.DessineLigne(this,this.GetPlayer1().GetLineInView());
               }
               Debug.DessinePoints(this,this.actionLayer.GetTeamCollision(16777215).concat(this.actionLayer.GetPointsInRange(0,0,-1)));
            }
            else if(KeyManager.IsKeyReleased(Keyboard.HOME))
            {
               Debug.showLines = false;
               Debug.EffaceGroupeDessin(Debug.GD_LIGNE);
            }
         }
         this._timeProfiler1.Reset();
         this._timeProfiler1.StartProfile("Render (Goal = " + (stage != null ? Math.ceil(1000 / stage.frameRate) : -1) + ")");
      }
      
      public function AlterBackGround(backGround:Animation, layer:LevelLayer) : void
      {
      }
      
      public function get teamFactory() : TeamFactory
      {
         return this._gameMgr.teamFactory;
      }
      
      public function get weaponManager() : WeaponManager
      {
         return this._gameMgr.weaponMgr;
      }
      
      public function AddUpdatable(oUpdatable:IUpdatable) : void
      {
         oUpdatable.OnAdd(this);
         this._tabUpdate.push(oUpdatable);
         oUpdatable.SetEnable(true);
      }
      
      public function AddWaitCallback(frame:int, callback:Callback, pausable:Boolean) : WaitCallback
      {
         var waitCallback:WaitCallback = new WaitCallback(this,frame,callback,pausable);
         this.AddUpdatable(waitCallback);
         this._waitCallback.push(waitCallback);
         return waitCallback;
      }
      
      public function get ammoManager() : AmmoManager
      {
         return this._gameMgr.ammoMgr;
      }
   }
}

