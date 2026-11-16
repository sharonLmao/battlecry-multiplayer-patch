package com.battlecry.specialEffect
{
   import com.battlecry.BC_Game;
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.specialEffect.aura.Aura;
   import com.battlecry.specialEffect.dieEffects.DieEffects;
   import com.battlecry.specialEffect.dieEffects.DieStats;
   import com.battlecry.specialEffect.dieEffects.ExplodeDie;
   import com.battlecry.specialEffect.dieEffects.RaiseDead;
   import com.battlecry.specialEffect.onAttack.onAttackEffect;
   import com.battlecry.specialEffect.onKill.onKillEffect;
   import com.battlecry.specialEffect.onKill.onKillHeal;
   import com.battlecry.specialEffect.onKill.onKillRaiseUndead;
   import com.battlecry.specialEffect.onKill.onKillStats;
   import com.battlecry.specialEffect.onRaiseUndead.onRaiseUndead;
   import com.battlecry.specialEffect.onRaiseUndead.onRaiseUndeadBuff;
   import com.battlecry.specialEffect.onRaiseUndead.onRaiseUndeadRaiseAdd;
   import com.battlecry.specialEffect.onStartEffect.onStartEffect;
   import com.battlecry.specialEffect.onStartEffect.onStartEffectMythic;
   import com.battlecry.specialEffect.statsModifier.StatsModifier;
   import com.battlecry.specialEffect.timedEffects.LifeEffect;
   import com.battlecry.specialEffect.timedEffects.TimedDead;
   import com.battlecry.specialEffect.timedEffects.TimedDmg;
   import com.battlecry.specialEffect.timedEffects.TimedEffect;
   import com.battlecry.specialEffect.timedEffects.TimedEffectEnum;
   import com.battlecry.specialEffect.timedEffects.TimedMorphLarva;
   import com.battlecry.specialEffect.timedEffects.TimedStatsBoost;
   
   public class SpecialEffectManager
   {
      
      private var _chargeUpModifier:Vector.<StatsModifier>;
      
      private var _onStartEffectMythic:Vector.<onStartEffectMythic>;
      
      private var _onAttackEffect:Vector.<onAttackEffect>;
      
      private var _lifeModifier:Vector.<StatsModifier>;
      
      private var _timedEffect:Vector.<TimedEffect>;
      
      private var _onKillEffect:Vector.<onKillEffect>;
      
      private var _context:BC_Game;
      
      private var _dieEffect:Vector.<DieEffects>;
      
      private var _owner:BC_Actor;
      
      private var _onStartEffect:Vector.<onStartEffect>;
      
      private var _auraModifier:Vector.<Aura>;
      
      public function SpecialEffectManager(actor:BC_Actor, v:Vector.<SpecialEffect>, context:BC_Game)
      {
         var l:LifeEffect = null;
         var l1:LifeEffect = null;
         var t:TimedMorphLarva = null;
         var t1:TimedMorphLarva = null;
         var d:TimedDead = null;
         var d1:TimedDead = null;
         var tDmg:TimedDmg = null;
         var tDmg1:TimedDmg = null;
         var tSB:TimedStatsBoost = null;
         var tSB1:TimedStatsBoost = null;
         var c:StatsModifier = null;
         var c1:StatsModifier = null;
         var a:Aura = null;
         var a1:Aura = null;
         var r:RaiseDead = null;
         var r1:RaiseDead = null;
         var e:ExplodeDie = null;
         var e1:ExplodeDie = null;
         var ds:DieStats = null;
         var ds1:DieStats = null;
         var o:onAttackEffect = null;
         var o1:onAttackEffect = null;
         var ok:onKillRaiseUndead = null;
         var ok1:onKillRaiseUndead = null;
         var okh:onKillHeal = null;
         var okh1:onKillHeal = null;
         var oks:onKillStats = null;
         var oks1:onKillStats = null;
         var oSE:onStartEffect = null;
         var oSE1:onStartEffect = null;
         var oSEM:onStartEffectMythic = null;
         var oSEM1:onStartEffectMythic = null;
         var oRUB:onRaiseUndeadBuff = null;
         var oRUB1:onRaiseUndeadBuff = null;
         var oRURA:onRaiseUndeadRaiseAdd = null;
         var oRURA1:onRaiseUndeadRaiseAdd = null;
         this._timedEffect = new Vector.<TimedEffect>();
         this._chargeUpModifier = new Vector.<StatsModifier>();
         this._lifeModifier = new Vector.<StatsModifier>();
         this._auraModifier = new Vector.<Aura>();
         this._dieEffect = new Vector.<DieEffects>();
         this._onAttackEffect = new Vector.<onAttackEffect>();
         this._onKillEffect = new Vector.<onKillEffect>();
         this._onStartEffect = new Vector.<onStartEffect>();
         this._onStartEffectMythic = new Vector.<onStartEffectMythic>();
         super();
         this._context = context;
         this._owner = actor;
         for(var i:int = 0; i < v.length; i++)
         {
            if(v[i] is TimedEffect)
            {
               if(v[i] is LifeEffect)
               {
                  l = v[i] as LifeEffect;
                  l1 = new LifeEffect(l.id,l.type,l.duration,l.coolDown,l.value,l.maxLimit);
                  l1.SetOwner(actor);
                  this._timedEffect.push(l1);
               }
               else if(v[i] is TimedMorphLarva)
               {
                  t = v[i] as TimedMorphLarva;
                  t1 = new TimedMorphLarva(t.id,t.type,t.duration,t.coolDown);
                  t1.SetOwner(actor);
                  this._timedEffect.push(t1);
               }
               else if(v[i] is TimedDead)
               {
                  d = v[i] as TimedDead;
                  d1 = new TimedDead(d.id,d.type,d.duration,d.coolDown);
                  d1.SetOwner(actor);
                  this._timedEffect.push(d1);
               }
               else if(v[i] is TimedDmg)
               {
                  tDmg = v[i] as TimedDmg;
                  tDmg1 = new TimedDmg(tDmg.id,tDmg.type,tDmg.duration,tDmg.coolDown,tDmg.range,tDmg.dmgList,tDmg.effectID,tDmg.dmgType,tDmg.defDmg,tDmg.creatureType,tDmg.dontAffectCreature,tDmg.casterEffect);
                  tDmg1.SetOwner(actor);
                  this._timedEffect.push(tDmg1);
               }
               else if(v[i] is TimedStatsBoost)
               {
                  tSB = v[i] as TimedStatsBoost;
                  tSB1 = new TimedStatsBoost(tSB.id,tSB.type,tSB.duration,tSB.coolDown,tSB.statsBoostList,tSB.creatureType,tSB.range,tSB.fxID);
                  tSB1.SetOwner(actor);
                  this._timedEffect.push(tSB1);
               }
            }
            if(v[i] is StatsModifier)
            {
               c = v[i] as StatsModifier;
               c1 = new StatsModifier(c.id,c.type,c.value,c.limit);
               if(c1.type == StatsModifier.TYPE_CASTINGTIME)
               {
                  this._chargeUpModifier.push(c1);
               }
               else if(c1.type == StatsModifier.TYPE_LIFE)
               {
                  this._lifeModifier.push(c1);
               }
            }
            if(v[i] is Aura)
            {
               a = v[i] as Aura;
               a1 = new Aura(a.id,a.range,a.statsModifier,a.defModifier,a.rangeModifier,a.castingTimeModifier,a.reloadTimeModifier,a.genreCreature);
               a1.SetOwner(actor);
               this._auraModifier.push(a1);
            }
            if(v[i] is DieEffects)
            {
               if(v[i] is RaiseDead)
               {
                  r = v[i] as RaiseDead;
                  r1 = new RaiseDead(r.id,r.raiseTimer,r.type);
                  r1.SetOwner(actor);
                  this._dieEffect.push(r1);
               }
               if(v[i] is ExplodeDie)
               {
                  e = v[i] as ExplodeDie;
                  e1 = new ExplodeDie(e.id,e.explodeID,e.largeur,e.hauteur,e.dmgList,e.sfxID);
                  e1.SetOwner(actor);
                  this._dieEffect.push(e1);
               }
               if(v[i] is DieStats)
               {
                  ds = v[i] as DieStats;
                  ds1 = new DieStats(ds.id,ds.genreCreature,ds.range,ds.modelStats,ds.value,ds.defenseBoost);
                  ds1.SetOwner(actor);
                  this._dieEffect.push(ds1);
               }
            }
            if(v[i] is onAttackEffect)
            {
               o = v[i] as onAttackEffect;
               o1 = new onAttackEffect(o.id,o.waitingTime,o.effectID,o.modelAttack,o.dmgList,o.sfxId);
               o1.SetOwner(actor);
               this._onAttackEffect.push(o1);
            }
            if(v[i] is onKillEffect)
            {
               if(v[i] is onKillRaiseUndead)
               {
                  ok = v[i] as onKillRaiseUndead;
                  ok1 = new onKillRaiseUndead(ok.id,ok.raiseTimer,ok.type);
                  ok1.SetOwner(actor);
                  this._onKillEffect.push(ok1);
               }
               else if(v[i] is onKillHeal)
               {
                  okh = v[i] as onKillHeal;
                  okh1 = new onKillHeal(okh.id,okh.value,okh.type,okh.target);
                  okh1.SetOwner(actor);
                  this._onKillEffect.push(okh1);
               }
               else if(v[i] is onKillStats)
               {
                  oks = v[i] as onKillStats;
                  oks1 = new onKillStats(oks.id,oks.ammount,oks.modelStats);
                  oks1.SetOwner(actor);
                  this._onKillEffect.push(oks1);
               }
            }
            if(v[i] is onStartEffect)
            {
               oSE = v[i] as onStartEffect;
               oSE1 = new onStartEffect(oSE.id,oSE.creatureType,oSE.value,oSE.count);
               oSE1.SetOwner(actor);
               this._onStartEffect.push(oSE1);
            }
            if(v[i] is onStartEffectMythic)
            {
               oSEM = v[i] as onStartEffectMythic;
               oSEM1 = new onStartEffectMythic(oSEM.id,oSEM.modelStats,oSEM.value,oSEM.defenseBoost);
               oSEM1.SetOwner(actor);
               this._onStartEffectMythic.push(oSEM1);
            }
            if(v[i] is onRaiseUndead)
            {
               if(v[i] is onRaiseUndeadBuff)
               {
                  oRUB = v[i] as onRaiseUndeadBuff;
                  oRUB1 = new onRaiseUndeadBuff(oRUB.id,oRUB.statsList,oRUB.defModifier,oRUB.range,oRUB.creatureType);
                  oRUB1.SetOwner(actor);
                  this._context.roundManager.summonManager.onSummonList.push(oRUB1);
               }
               else if(v[i] is onRaiseUndeadRaiseAdd)
               {
                  oRURA = v[i] as onRaiseUndeadRaiseAdd;
                  oRURA1 = new onRaiseUndeadRaiseAdd(oRURA.id);
                  oRURA1.SetOwner(actor);
                  this._context.roundManager.summonManager.onSummonList.push(oRURA1);
               }
            }
         }
      }
      
      public function CastOnAttack() : void
      {
         for(var i:int = 0; i < this._onAttackEffect.length; i++)
         {
            this._onAttackEffect[i].Cast();
         }
      }
      
      public function RemoveOnRaise() : void
      {
         for(var i:int = int(this._context.roundManager.summonManager.onSummonList.length - 1); i >= 0; i--)
         {
            if(this._context.roundManager.summonManager.onSummonList[i].owner == this._owner)
            {
               this._context.roundManager.summonManager.onSummonList.splice(i,1);
            }
         }
      }
      
      private function CastLifeChange(owner:BC_Actor) : void
      {
         var limit:int = -1;
         var modifier:int = owner.maxHp;
         for(var i:int = 0; i < this._lifeModifier.length; i++)
         {
            if(limit == -1)
            {
               limit = this._lifeModifier[i].limit;
            }
            else if(limit < this._lifeModifier[i].limit)
            {
               limit = this._lifeModifier[i].limit;
            }
            modifier += this._lifeModifier[i].value;
         }
         if(modifier < limit)
         {
            modifier = limit;
         }
         owner.maxHp = owner.hp = modifier;
      }
      
      public function SetCastTimeModifier(castingTimeModifier:Number) : void
      {
         var t:TimedEffect = null;
         for(var i:int = 0; i < this._timedEffect.length; i++)
         {
            t = this._timedEffect[i];
            if(TimedEffectEnum.IsCastingTimedEffect(t.id))
            {
               t.maxCoolDown += castingTimeModifier;
               if(castingTimeModifier <= 0)
               {
                  t.coolDown += castingTimeModifier;
                  if(t.coolDown <= 2)
                  {
                     t.coolDown = 2;
                  }
               }
               else
               {
                  t.coolDown += castingTimeModifier;
                  if(t.coolDown >= t.maxCoolDown)
                  {
                     t.coolDown = t.maxCoolDown;
                  }
               }
            }
         }
      }
      
      public function set timedEffect(timedEffect:Vector.<TimedEffect>) : void
      {
         this._timedEffect = timedEffect;
      }
      
      public function CastModifier(owner:BC_Actor) : void
      {
         if(owner.metaActor.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
         {
            this.CastChargeUp(owner);
         }
         this.CastLifeChange(owner);
      }
      
      public function CastTimed() : void
      {
         for(var i:int = 0; i < this._timedEffect.length; i++)
         {
            this._timedEffect[i].Cast();
         }
      }
      
      public function CastOnKill() : void
      {
         for(var i:int = 0; i < this._onKillEffect.length; i++)
         {
            this._onKillEffect[i].Cast();
         }
      }
      
      public function CastDieEffect() : void
      {
         while(this._dieEffect.length > 0)
         {
            this._dieEffect[0].Cast();
            this._dieEffect.shift();
         }
      }
      
      public function CastAura() : void
      {
         for(var i:int = 0; i < this._auraModifier.length; i++)
         {
            this._auraModifier[i].Cast();
         }
      }
      
      public function RemoveAura() : void
      {
         for(var i:int = 0; i < this._auraModifier.length; i++)
         {
            this._auraModifier[i].RemoveAura();
         }
      }
      
      public function get timedEffect() : Vector.<TimedEffect>
      {
         return this._timedEffect;
      }
      
      public function set auraModifier(auraModifier:Vector.<Aura>) : void
      {
         this._auraModifier = auraModifier;
      }
      
      public function get auraModifier() : Vector.<Aura>
      {
         return this._auraModifier;
      }
      
      private function CastChargeUp(owner:BC_Actor) : void
      {
         var t:TimedEffect = null;
         var limit:int = -1;
         var modifier:int = owner.maxChargeUpTime;
         var timedEffect:int = 0;
         for(var i:int = 0; i < this._chargeUpModifier.length; i++)
         {
            if(this._chargeUpModifier[i].type == StatsModifier.TYPE_CASTINGTIME)
            {
               if(limit == -1)
               {
                  limit = this._chargeUpModifier[i].limit;
               }
               else if(this._chargeUpModifier[i].limit < limit)
               {
                  limit = this._chargeUpModifier[i].limit;
               }
               modifier += this._chargeUpModifier[i].value;
               timedEffect -= this._chargeUpModifier[i].value;
            }
         }
         if(modifier < limit)
         {
            modifier = limit;
         }
         owner.maxChargeUpTime = owner.chargeUpTime = owner.startChargeUpTime = modifier;
         for(i = 0; i < this._timedEffect.length; i++)
         {
            t = this._timedEffect[i];
            if(TimedEffectEnum.IsCastingTimedEffect(t.id))
            {
               t.maxCoolDown -= timedEffect;
               t.coolDown -= timedEffect;
               if(t.maxCoolDown <= 2)
               {
                  t.maxCoolDown = 2;
               }
               if(t.coolDown <= 2)
               {
                  t.coolDown = 2;
               }
            }
         }
      }
      
      public function CastStartUp() : void
      {
         var i:int = 0;
         for(i = 0; i < this._onStartEffect.length; i++)
         {
            this._onStartEffect[i].Cast();
         }
         for(i = 0; i < this._onStartEffectMythic.length; i++)
         {
            this._onStartEffectMythic[i].Cast();
         }
      }
   }
}

