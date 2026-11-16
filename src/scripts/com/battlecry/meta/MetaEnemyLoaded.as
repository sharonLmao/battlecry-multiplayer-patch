package com.battlecry.meta
{
   public class MetaEnemyLoaded
   {
      
      private var _metaArmy:BC_MetaArmy;
      
      private var _metaFlag:MetaFlag;
      
      private var _enemyName:String;
      
      private var _fullArmyName:String;
      
      public function MetaEnemyLoaded()
      {
         super();
      }
      
      public function set metaArmy(metaArmy:BC_MetaArmy) : void
      {
         this._metaArmy = metaArmy;
      }
      
      public function set enemyName(enemyName:String) : void
      {
         this._enemyName = enemyName;
      }
      
      public function get metaArmy() : BC_MetaArmy
      {
         return this._metaArmy;
      }
      
      public function set fullArmyName(fullArmyName:String) : void
      {
         this._fullArmyName = fullArmyName;
      }
      
      public function set metaFlag(metaFlag:MetaFlag) : void
      {
         this._metaFlag = metaFlag;
      }
      
      public function get metaFlag() : MetaFlag
      {
         return this._metaFlag;
      }
      
      public function get fullArmyName() : String
      {
         return this._fullArmyName;
      }
      
      public function get enemyName() : String
      {
         return this._enemyName;
      }
   }
}

