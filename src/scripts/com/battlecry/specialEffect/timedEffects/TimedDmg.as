package com.battlecry.specialEffect.timedEffects
{
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.battle.BattleArmy;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.effects.BC_GameEffectManager;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.meta.model.ModelEquipement;
   import com.lachhhEngine.games.animation.AnimationCallback;
   import com.lachhhEngine.games.effects.GameEffectContainerId;
   
   public class TimedDmg extends TimedEffect
   {
      
      public static const RANGE_SELF:int = 0;
      
      public static const RANGE_SQUAD:int = 1;
      
      public static const RANGE_ARMY:int = 2;
      
      public static const RANGE_EVERYONE:int = 3;
      
      public static const DMGTYPE_SPECIAL:int = 0;
      
      public static const DMGTYPE_DEF:int = 1;
      
      private var _dontAffectCreature:int;
      
      private var _creatureType:int;
      
      private var _effectID:int;
      
      private var _dmgList:MetaStatsList;
      
      private var _dmgType:int;
      
      private var _defDmg:int;
      
      private var _casterEffect:int;
      
      private var _range:int;
      
      public function TimedDmg(id:int, type:int, duration:int, coolDown:int, range:int, dmgList:MetaStatsList, effectID:int, dmgType:int, defDmg:int, creatureType:int, dontAffectCreature:int, casterEffect:int)
      {
         super(id,type,duration,coolDown);
         this._range = range;
         this._dmgList = dmgList;
         this._effectID = effectID;
         this._dmgType = dmgType;
         this._defDmg = defDmg;
         this._creatureType = creatureType;
         this._dontAffectCreature = dontAffectCreature;
         this._casterEffect = casterEffect;
      }
      
      public function get dmgList() : MetaStatsList
      {
         return this._dmgList;
      }
      
      public function set casterEffect(casterEffect:int) : void
      {
         this._casterEffect = casterEffect;
      }
      
      public function set defDmg(defDmg:int) : void
      {
         this._defDmg = defDmg;
      }
      
      override public function CastEffect() : void
      {
         var army:BattleArmy = null;
         var army1:BattleArmy = null;
         var i:int = 0;
         var j:int = 0;
         super.CastEffect();
         var targetList:Vector.<BC_Actor> = new Vector.<BC_Actor>();
         if(this._casterEffect != -1)
         {
            if(this._range == RANGE_EVERYONE)
            {
               (context.gameEffectManager as BC_GameEffectManager).CreateStaticFx(this._casterEffect,GameEffectContainerId.ABOVE,0,0,context.actionLayer.metaLayer);
            }
            else
            {
               (context.gameEffectManager as BC_GameEffectManager).CreateStaticFx(this._casterEffect,GameEffectContainerId.ABOVE,owner.px,owner.py,context.actionLayer.metaLayer);
            }
         }
         if(this._range == RANGE_ARMY)
         {
            if(owner.teamId == MiscConstants.TEAM1)
            {
               army = context.roundManager.team1;
            }
            else
            {
               army = context.roundManager.team2;
            }
            for(i = 0; i < army.squadQueue.length; i++)
            {
               for(j = 0; j < army.squadQueue[i].unitList.length; j++)
               {
                  if(this._creatureType == 0 || this._creatureType == army.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre || army.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                  {
                     if(army.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre != this._dontAffectCreature || this._dontAffectCreature == 0)
                     {
                        targetList.push(army.squadQueue[i].unitList[j]);
                     }
                  }
               }
            }
            if(this._dmgType == DMGTYPE_SPECIAL)
            {
               if(BC_VersionInfo.isBitMapMode)
               {
                  owner.actorViewBitmap.AddCallbackAt(new AnimationCallback(10,owner.GenerateTimedDmg,owner,[this._effectID,targetList,this._dmgList]));
               }
               else
               {
                  owner.actorViewVector.anim.AddCallbackAt(new AnimationCallback(10,owner.GenerateTimedDmg,owner,[this._effectID,targetList,this._dmgList]));
               }
            }
            else if(this._dmgType == DMGTYPE_DEF)
            {
               if(BC_VersionInfo.isBitMapMode)
               {
                  owner.actorViewBitmap.AddCallbackAt(new AnimationCallback(10,owner.GenerateTimedDefDmg,owner,[this._effectID,targetList,this._defDmg]));
               }
               else
               {
                  owner.actorViewVector.anim.AddCallbackAt(new AnimationCallback(10,owner.GenerateTimedDefDmg,owner,[this._effectID,targetList,this._defDmg]));
               }
            }
         }
         else if(this._range == RANGE_EVERYONE)
         {
            army = context.roundManager.team1;
            army1 = context.roundManager.team2;
            for(i = 0; i < army.squadQueue.length; i++)
            {
               for(j = 0; j < army.squadQueue[i].unitList.length; j++)
               {
                  if(this._creatureType == 0 || this._creatureType == army.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre || army.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                  {
                     if(army.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre != this._dontAffectCreature || this._dontAffectCreature == 0)
                     {
                        targetList.push(army.squadQueue[i].unitList[j]);
                     }
                  }
               }
            }
            for(i = 0; i < army1.squadQueue.length; i++)
            {
               for(j = 0; j < army1.squadQueue[i].unitList.length; j++)
               {
                  if(this._creatureType == 0 || this._creatureType == army1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre || army1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
                  {
                     if(army1.squadQueue[i].unitList[j].metaActor.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre != this._dontAffectCreature || this._dontAffectCreature == 0)
                     {
                        targetList.push(army1.squadQueue[i].unitList[j]);
                     }
                  }
               }
            }
            if(this._dmgType == DMGTYPE_SPECIAL)
            {
               if(BC_VersionInfo.isBitMapMode)
               {
                  owner.actorViewBitmap.AddCallbackAt(new AnimationCallback(10,owner.GenerateTimedDmg,owner,[this._effectID,targetList,this._dmgList]));
               }
               else
               {
                  owner.actorViewVector.anim.AddCallbackAt(new AnimationCallback(10,owner.GenerateTimedDmg,owner,[this._effectID,targetList,this._dmgList]));
               }
            }
            else if(this._dmgType == DMGTYPE_DEF)
            {
               if(BC_VersionInfo.isBitMapMode)
               {
                  owner.actorViewBitmap.AddCallbackAt(new AnimationCallback(10,owner.GenerateTimedDefDmg,owner,[this._effectID,targetList,this._defDmg]));
               }
               else
               {
                  owner.actorViewVector.anim.AddCallbackAt(new AnimationCallback(10,owner.GenerateTimedDefDmg,owner,[this._effectID,targetList,this._defDmg]));
               }
            }
         }
      }
      
      public function set dontAffectCreature(dontAffectCreature:int) : void
      {
         this._dontAffectCreature = dontAffectCreature;
      }
      
      public function set dmgType(dmgType:int) : void
      {
         this._dmgType = dmgType;
      }
      
      public function get dmgType() : int
      {
         return this._dmgType;
      }
      
      public function get casterEffect() : int
      {
         return this._casterEffect;
      }
      
      public function set effectID(effectID:int) : void
      {
         this._effectID = effectID;
      }
      
      public function get creatureType() : int
      {
         return this._creatureType;
      }
      
      public function get dontAffectCreature() : int
      {
         return this._dontAffectCreature;
      }
      
      public function set creatureType(creatureType:int) : void
      {
         this._creatureType = creatureType;
      }
      
      public function get effectID() : int
      {
         return this._effectID;
      }
      
      public function set dmgList(dmgList:MetaStatsList) : void
      {
         this._dmgList = dmgList;
      }
      
      public function get defDmg() : int
      {
         return this._defDmg;
      }
      
      public function set range(range:int) : void
      {
         this._range = range;
      }
      
      public function get range() : int
      {
         return this._range;
      }
   }
}

