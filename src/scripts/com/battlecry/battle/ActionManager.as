package com.battlecry.battle
{
   public class ActionManager
   {
      
      private var _army1:BattleArmy;
      
      private var _army2:BattleArmy;
      
      public function ActionManager()
      {
         super();
      }
      
      public function Init(army1:BattleArmy, army2:BattleArmy) : void
      {
         this._army1 = army1;
         this._army2 = army2;
      }
      
      public function Destroy() : void
      {
         this._army1.Destroy();
         this._army2.Destroy();
      }
      
      public function ResetAll() : void
      {
         this._army1.ResetAll();
         this._army2.ResetAll();
      }
      
      public function Update() : void
      {
      }
      
      public function DamageResolution() : void
      {
         this._army1.DamageResolution();
         this._army2.DamageResolution();
      }
      
      public function NewTurn() : void
      {
         this._army1.Move();
         this._army2.Move();
         this._army1.Move2();
         this._army2.Move2();
         this._army1.Attack();
         this._army2.Attack();
      }
   }
}

