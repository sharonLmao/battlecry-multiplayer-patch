package com.lachhhEngine.games
{
   import com.berzerkstudio.exported.DO_NOT_PUBLISH;
   import com.lachhhEngine.games.ammo.AmmoFactory;
   import com.lachhhEngine.games.ammo.AmmoManager;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.behaviors.BehaviorFactory;
   import com.lachhhEngine.games.behaviors.BehaviorManager;
   import com.lachhhEngine.games.debug.GameTree;
   import com.lachhhEngine.games.effects.GameEffectFactory;
   import com.lachhhEngine.games.effects.GameEffectManager;
   import com.lachhhEngine.games.enemy.EnemyFactory;
   import com.lachhhEngine.games.enemy.EnemyManager;
   import com.lachhhEngine.games.factory.AnimationFactory;
   import com.lachhhEngine.games.factory.SfxFactory;
   import com.lachhhEngine.games.hero.HeroFactory;
   import com.lachhhEngine.games.hero.HeroManager;
   import com.lachhhEngine.games.items.ItemFactory;
   import com.lachhhEngine.games.items.ItemManager;
   import com.lachhhEngine.games.level.levelEvents.LevelEventFactory;
   import com.lachhhEngine.games.level.levelEvents.LevelEventManager;
   import com.lachhhEngine.games.meta.MetaFactory;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaGame;
   import com.lachhhEngine.games.physique.Moteur;
   import com.lachhhEngine.games.physique.PhysicFactory;
   import com.lachhhEngine.games.physique.PhysicManager;
   import com.lachhhEngine.games.screens.ScreenFactory;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.games.sfx.SfxManager;
   import com.lachhhEngine.games.teams.TeamFactory;
   import com.lachhhEngine.games.weapon.WeaponFactory;
   import com.lachhhEngine.games.weapon.WeaponManager;
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.KeyManager;
   import com.lachhhEngine.io.SiteLocking;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.files.FileManager;
   import com.lachhhEngine.io.files.GameProgressFactory;
   import com.lachhhEngine.multilingual.TextFactory;
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   
   public class MainGame extends Sprite
   {
      
      private static var _instance:MainGame;
      
      protected var _fileMgr:FileManager;
      
      protected var _animMgr:AnimationManager;
      
      protected var _physicMgr:PhysicManager;
      
      protected var _game:Game;
      
      protected var _screenMgr:ScreenManager;
      
      protected var _gameManagers:GameManagers;
      
      protected var _textFactory:TextFactory;
      
      protected var _jukeBox:Jukebox;
      
      protected var _metaGame:MetaGame;
      
      private var _cannotPublishSticker:DO_NOT_PUBLISH;
      
      private var _banned:int = -1;
      
      public function MainGame()
      {
         super();
         _instance = this;
      }
      
      public static function get instance() : MainGame
      {
         return _instance;
      }
      
      protected function afterSavedFiledRetreived() : void
      {
         if(ExternalAPIManager.getSavedFileAPI().isEmpty)
         {
            if(VersionInfo.autoTransferFileOnConnect)
            {
               FileManager.instance.TransferSaveFileToExternalAPI();
            }
         }
         else
         {
            FileManager.instance.LoadFromSaveAPI();
         }
      }
      
      public function ClearAllCaches() : void
      {
         AnimationManager.factoryCache.ClearCache();
         ScreenManager.instance.factoryCache.ClearCache();
         SfxManager.factoryCache.ClearCache();
         PhysicManager.instance.factoryCache.ClearCache();
         this._gameManagers.ammoMgr.factoryCache.ClearCache();
         this._gameManagers.behaviorMgr.factoryCache.ClearCache();
         this._gameManagers.enemyMgr.factoryCache.ClearCache();
         this._gameManagers.gameFxMgr.factoryCache.ClearCache();
         this._gameManagers.heroMgr.factoryCache.ClearCache();
         this._gameManagers.itemMgr.factoryCache.ClearCache();
         this._gameManagers.levelEventMgr.factoryCache.ClearCache();
         this._gameManagers.metaMgr.factoryCache.ClearCache();
         this._gameManagers.weaponMgr.factoryCache.ClearCache();
      }
      
      protected function onItemPurchased() : void
      {
      }
      
      protected function onAddSticker(sticker:MovieClip) : void
      {
         sticker.mouseEnabled = sticker.mouseChildren = false;
      }
      
      public function Draw() : void
      {
         this._game.Draw();
      }
      
      protected function CreateManagers() : void
      {
         this._game = new Game();
         this._animMgr = new AnimationManager(new AnimationFactory());
         this._jukeBox = new Jukebox(new SfxFactory());
         this._screenMgr = new ScreenManager(this,this,new ScreenFactory(),this._game);
         this._physicMgr = new PhysicManager(this._game,new PhysicFactory());
         this._textFactory = new TextFactory();
         this._fileMgr = new FileManager(this,new GameProgressFactory(),3,"Game");
         this._gameManagers = new GameManagers(new AmmoManager(this._game,new AmmoFactory()),new BehaviorManager(this._game,new BehaviorFactory()),new GameEffectManager(this._game,new GameEffectFactory()),new EnemyManager(this._game,new EnemyFactory()),new LevelEventManager(this._game,new LevelEventFactory()),new HeroManager(this._game,new HeroFactory()),new ItemManager(this._game,new ItemFactory()),new MetaManager(this._game,new MetaFactory()),new SpeedManager(),new WeaponManager(this._game,new WeaponFactory()),new TeamFactory());
         this._metaGame = MetaManager.instance.CreateMetaGame(700,550);
         this._metaGame.debug = false;
         this._metaGame.gameManagers = this._gameManagers;
         this._game.Init(this._metaGame);
         addChild(this._game);
      }
      
      public function Reset() : void
      {
      }
      
      public function Init() : void
      {
         if(!VersionInfo.dontTouchStage)
         {
            if(VersionInfo.debugVersion)
            {
               stage.scaleMode = StageScaleMode.NO_SCALE;
            }
            else if(VersionInfo.defaultScaleMode != null)
            {
               stage.scaleMode = VersionInfo.defaultScaleMode;
            }
         }
         this.CreateManagers();
         KeyManager.Init(this);
         Moteur.Init();
         GameLoop.instance.Init(this);
         GameTree.Init(this._game);
         if(!ExternalAPIManager.getSavedFileAPI().dataLoaded)
         {
            ExternalAPIManager.getSavedFileAPI().onDataLoadedCallback = new Callback(this.afterSavedFiledRetreived,this,null);
         }
         else
         {
            this.afterSavedFiledRetreived();
         }
         if(ExternalAPIManager.getPremiumAPI())
         {
            ExternalAPIManager.getPremiumAPI().onPurchaseCallback = new Callback(this.onItemPurchased,this,null);
         }
         if(!VersionInfo.useSiteLock && SiteLocking.IsBanned(root))
         {
            this._banned = 0;
         }
      }
      
      public function Destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.Update);
         KeyManager.Destroy();
      }
      
      public function CreateGame() : void
      {
         this._game.Init(this._metaGame);
         addChildAt(this._game,0);
         addEventListener(Event.ENTER_FRAME,this.Update);
      }
      
      public function Update(evt:Event) : void
      {
         ScreenManager.instance.Update(this);
         this._game.Update();
         Jukebox.instance.Update(this);
         if(!VersionInfo.noKeyManager)
         {
            KeyManager.Update();
         }
         if(VersionInfo.showCannotPublishSticker)
         {
            if(this._cannotPublishSticker == null)
            {
               this._cannotPublishSticker = new DO_NOT_PUBLISH();
               this.onAddSticker(this._cannotPublishSticker);
            }
            stage.addChild(this._cannotPublishSticker);
         }
         else if(this._cannotPublishSticker != null)
         {
            Utils.LazyRemoveFromParent(this._cannotPublishSticker);
            this._cannotPublishSticker = null;
         }
         if(this._banned != -1)
         {
            ++this._banned;
            if(this._banned > 1000)
            {
               ScreenManager.instance.ShowCheatScreen();
               this._banned = -1;
            }
         }
      }
      
      public function get game() : Game
      {
         return this._game;
      }
   }
}

