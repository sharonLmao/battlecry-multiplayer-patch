package com.battlecry.meta
{
   import com.battlecry.battle.GridPos;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.meta.metaObject.MetaBehavior;
   
   public class BC_MetaActor extends MetaActor
   {
      
      private var _team:int;
      
      private var _supGridCase:Vector.<GridPos> = new Vector.<GridPos>();
      
      private var _metaUnit:BC_MetaUnit;
      
      private var _metaBehavior:MetaBehavior;
      
      private var _chargeupTime:int;
      
      private var _hp:int;
      
      private var _targetTeam:int;
      
      private var _teamId:int;
      
      private var _squadId:int;
      
      private var _range:int;
      
      public function BC_MetaActor()
      {
         super();
      }
      
      public function set range(range:int) : void
      {
         this._range = range;
      }
      
      public function get squadId() : int
      {
         return this._squadId;
      }
      
      public function get metaBehavior() : MetaBehavior
      {
         return this._metaBehavior;
      }
      
      public function set chargeupTime(chargeupTime:int) : void
      {
         this._chargeupTime = chargeupTime;
      }
      
      public function get chargeupTime() : int
      {
         return this._chargeupTime;
      }
      
      public function get range() : int
      {
         return this._range;
      }
      
      public function get hp() : int
      {
         return this._hp;
      }
      
      public function set metaUnit(metaUnit:BC_MetaUnit) : void
      {
         this._metaUnit = metaUnit;
      }
      
      public function get supGridCase() : Vector.<GridPos>
      {
         return this._supGridCase;
      }
      
      public function get targetTeam() : int
      {
         return this._targetTeam;
      }
      
      public function set hp(hp:int) : void
      {
         this._hp = hp;
      }
      
      public function get teamId() : int
      {
         return this._teamId;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         var l:int = int(this._supGridCase.length);
         for(var j:int = 0; j < l; j++)
         {
            this._supGridCase.shift();
         }
      }
      
      public function set targetTeam(targetTeam:int) : void
      {
         this._targetTeam = targetTeam;
      }
      
      public function get team() : int
      {
         return this._team;
      }
      
      public function set supGridCase(supGridCase:Vector.<GridPos>) : void
      {
         this._supGridCase = supGridCase;
      }
      
      public function get metaUnit() : BC_MetaUnit
      {
         return this._metaUnit;
      }
      
      public function set squadId(squadId:int) : void
      {
         this._squadId = squadId;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._hp = 0;
         this._team = -1;
         this._targetTeam = -1;
         this._metaBehavior = null;
         this._metaUnit = new BC_MetaUnit(-1);
      }
      
      public function set metaBehavior(metaBehavior:MetaBehavior) : void
      {
         this._metaBehavior = metaBehavior;
      }
      
      public function set team(team:int) : void
      {
         this._team = team;
      }
      
      public function set teamId(teamId:int) : void
      {
         this._teamId = teamId;
      }
   }
}

