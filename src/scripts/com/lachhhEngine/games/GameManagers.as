package com.lachhhEngine.games
{
   import com.lachhhEngine.games.ammo.AmmoManager;
   import com.lachhhEngine.games.behaviors.BehaviorManager;
   import com.lachhhEngine.games.effects.GameEffectManager;
   import com.lachhhEngine.games.enemy.EnemyManager;
   import com.lachhhEngine.games.hero.HeroManager;
   import com.lachhhEngine.games.items.ItemManager;
   import com.lachhhEngine.games.level.levelEvents.LevelEventManager;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.teams.TeamFactory;
   import com.lachhhEngine.games.weapon.WeaponManager;
   
   public class GameManagers
   {
      
      private var _levelEventMgr:LevelEventManager;
      
      private var _itemMgr:ItemManager;
      
      private var _enemyMgr:EnemyManager;
      
      private var _metaMgr:MetaManager;
      
      private var _gameFxMgr:GameEffectManager;
      
      private var _weaponMgr:WeaponManager;
      
      private var _behaviorMgr:BehaviorManager;
      
      private var _ammoMgr:AmmoManager;
      
      private var _teamFactory:TeamFactory;
      
      private var _speedMgr:SpeedManager;
      
      private var _heroMgr:HeroManager;
      
      public function GameManagers(ammo:AmmoManager, beha:BehaviorManager, gameFx:GameEffectManager, enemy:EnemyManager, levelEvent:LevelEventManager, hero:HeroManager, item:ItemManager, meta:MetaManager, spd:SpeedManager, weapon:WeaponManager, teamFactory:TeamFactory)
      {
         super();
         this._ammoMgr = ammo;
         this._behaviorMgr = beha;
         this._gameFxMgr = gameFx;
         this._enemyMgr = enemy;
         this._heroMgr = hero;
         this._levelEventMgr = levelEvent;
         this._itemMgr = item;
         this._metaMgr = meta;
         this._speedMgr = spd;
         this._weaponMgr = weapon;
         this._teamFactory = teamFactory;
      }
      
      public function get levelEventMgr() : LevelEventManager
      {
         return this._levelEventMgr;
      }
      
      public function get heroMgr() : HeroManager
      {
         return this._heroMgr;
      }
      
      public function get speedMgr() : SpeedManager
      {
         return this._speedMgr;
      }
      
      public function get metaMgr() : MetaManager
      {
         return this._metaMgr;
      }
      
      public function get gameFxMgr() : GameEffectManager
      {
         return this._gameFxMgr;
      }
      
      public function get weaponMgr() : WeaponManager
      {
         return this._weaponMgr;
      }
      
      public function get behaviorMgr() : BehaviorManager
      {
         return this._behaviorMgr;
      }
      
      public function get teamFactory() : TeamFactory
      {
         return this._teamFactory;
      }
      
      public function get ammoMgr() : AmmoManager
      {
         return this._ammoMgr;
      }
      
      public function get itemMgr() : ItemManager
      {
         return this._itemMgr;
      }
      
      public function get enemyMgr() : EnemyManager
      {
         return this._enemyMgr;
      }
   }
}

