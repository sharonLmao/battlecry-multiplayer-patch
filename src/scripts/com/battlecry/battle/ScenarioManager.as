package com.battlecry.battle
{
   public class ScenarioManager
   {
      
      private var _castAura:Boolean;
      
      private var _army1:BattleArmy;
      
      private var _army2:BattleArmy;
      
      public function ScenarioManager()
      {
         super();
      }
      
      public function Init(army1:BattleArmy, army2:BattleArmy) : void
      {
         this._army1 = army1;
         this._army2 = army2;
         this._castAura = true;
      }
      
      public function Update() : void
      {
      }
      
      public function Destroy() : void
      {
         this._army1.Destroy();
         this._army2.Destroy();
      }
      
      public function NewTurn() : void
      {
         if(this._castAura)
         {
            this._castAura = false;
            this._army1.CastAura();
            this._army2.CastAura();
         }
         this._army1.UpdateVisual();
         this._army2.UpdateVisual();
      }
   }
}

