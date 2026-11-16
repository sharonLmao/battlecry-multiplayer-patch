package com.battlecry.meta.model
{
   import com.battlecry.meta.MetaStatsList;
   
   public class ModelProjectileEffect
   {
      
      public static const TYPE_PROJECTILE:int = 0;
      
      public static const TYPE_IDLESPELL:int = 1;
      
      public static const TYPE_MELEEAOESPELL:int = 2;
      
      public static const TYPE_SQUADFRONTLINE:int = 3;
      
      public static const TYPE_MELEESPLASHATTACK:int = 4;
      
      public static const TYPE_BUFFSQUAD:int = 5;
      
      public static const TYPE_ALLUNITS:int = 6;
      
      public static const TYPE_ALLENEMYUNITS:int = 7;
      
      public static const TYPE_FULLLINE:int = 8;
      
      public static const TYPE_MORPH:int = 9;
      
      public static const TYPE_BUFFEVERYONE:int = 10;
      
      public static const TYPE_RAISEUNDEAD:int = 11;
      
      public static const TYPE_ALLUNITS_SINGLE:int = 12;
      
      public static const TYPE_MELEERANDOMATTACK:int = 13;
      
      public static const TYPE_FIRST3LANE:int = 14;
      
      public static const TYPE_ALL_NON_UNDEAD:int = 15;
      
      private var _dmgList:MetaStatsList;
      
      private var _offSetY:Number;
      
      private var _effectType:int;
      
      private var _id:int;
      
      private var _effectAnimId:int;
      
      private var _modelAttackSound:ModelAttackSound;
      
      private var _onHitAnimId:int;
      
      private var _startOffSetY:Number;
      
      public function ModelProjectileEffect(id:int, effectAnimId:int, onHitAnimId:int, effectType:int, offSetY:Number, startOffSetY:Number, dmgList:MetaStatsList, modelAttackSound:ModelAttackSound)
      {
         super();
         this._id = id;
         this._effectAnimId = effectAnimId;
         this._onHitAnimId = onHitAnimId;
         this._effectType = effectType;
         this._offSetY = offSetY;
         this._startOffSetY = startOffSetY;
         this._dmgList = dmgList;
         this._modelAttackSound = modelAttackSound;
      }
      
      public function set onHitAnimId(onHitAnimId:int) : void
      {
         this._onHitAnimId = onHitAnimId;
      }
      
      public function set modelAttackSound(modelAttackSound:ModelAttackSound) : void
      {
         this._modelAttackSound = modelAttackSound;
      }
      
      public function set startOffSetY(startOffSetY:Number) : void
      {
         this._startOffSetY = startOffSetY;
      }
      
      public function get startOffSetY() : Number
      {
         return this._startOffSetY;
      }
      
      public function set offSetY(offSetY:Number) : void
      {
         this._offSetY = offSetY;
      }
      
      public function get offSetY() : Number
      {
         return this._offSetY;
      }
      
      public function set dmgList(dmgList:MetaStatsList) : void
      {
         this._dmgList = dmgList;
      }
      
      public function set effectType(effectType:int) : void
      {
         this._effectType = effectType;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get onHitAnimId() : int
      {
         return this._onHitAnimId;
      }
      
      public function get effectType() : int
      {
         return this._effectType;
      }
      
      public function Reset() : void
      {
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function set effectAnimId(effectAnimId:int) : void
      {
         this._effectAnimId = effectAnimId;
      }
      
      public function get dmgList() : MetaStatsList
      {
         return this._dmgList;
      }
      
      public function get effectAnimId() : int
      {
         return this._effectAnimId;
      }
      
      public function get modelAttackSound() : ModelAttackSound
      {
         return this._modelAttackSound;
      }
      
      public function isInfiniteRange() : Boolean
      {
         return this._effectType == TYPE_MELEEAOESPELL || this._effectType == TYPE_SQUADFRONTLINE || this._effectType == TYPE_FIRST3LANE || this._effectType == TYPE_BUFFSQUAD || this._effectType == TYPE_ALLUNITS || this._effectType == TYPE_ALLENEMYUNITS || this._effectType == TYPE_FULLLINE || this._effectType == TYPE_MORPH || this._effectType == TYPE_BUFFEVERYONE || this._effectType == TYPE_RAISEUNDEAD || this._effectType == TYPE_ALL_NON_UNDEAD || this._id == ModelProjectileEffectEnum.LIFE_STAFF.id;
      }
   }
}

