package com.battlecry.specialEffect.onAttack
{
   import com.battlecry.BC_Game;
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.battle.BattleArmy;
   import com.battlecry.battle.GridCase;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.meta.model.ModelAttack;
   import com.battlecry.meta.model.ModelAttackEnum;
   import com.battlecry.specialEffect.SpecialEffect;
   import com.lachhhEngine.games.animation.AnimationCallback;
   
   public class onAttackEffect extends SpecialEffect
   {
      
      private var _sfxId:int;
      
      private var _dmgList:MetaStatsList;
      
      private var _id:int;
      
      private var _effectID:int;
      
      private var _modelAttack:ModelAttack;
      
      private var _counterTime:int;
      
      private var _owner:BC_Actor;
      
      private var _waitingTime:int;
      
      public function onAttackEffect(id:int, waitingTime:int, effectID:int, modelAttack:ModelAttack, dmgList:MetaStatsList, sfxId:int)
      {
         super();
         this._id = id;
         this._waitingTime = waitingTime;
         this._counterTime = 0;
         this._effectID = effectID;
         this._modelAttack = modelAttack;
         this._dmgList = dmgList;
         this._sfxId = sfxId;
      }
      
      public function get sfxId() : int
      {
         return this._sfxId;
      }
      
      public function set waitingTime(waitingTime:int) : void
      {
         this._waitingTime = waitingTime;
      }
      
      public function SetOwner(owner:BC_Actor) : void
      {
         this._owner = owner;
      }
      
      public function get owner() : BC_Actor
      {
         return this._owner;
      }
      
      public function UseEffect() : void
      {
         var j:int = 0;
         var i:int = 0;
         var g:GridCase = null;
         var battleArmy1:BattleArmy = null;
         var battleArmy2:BattleArmy = null;
         var targetList:Vector.<BC_Actor> = new Vector.<BC_Actor>();
         if(this._modelAttack.id == ModelAttackEnum.CASTAOEMELEE.id)
         {
            battleArmy1 = BC_Game.instance.roundManager.team1;
            battleArmy2 = BC_Game.instance.roundManager.team2;
            for(i = 0; i < battleArmy1.squadQueue[0].unitList.length; i++)
            {
               targetList.push(battleArmy1.squadQueue[0].unitList[i]);
            }
            for(j = 0; j < battleArmy2.squadQueue[0].unitList.length; j++)
            {
               targetList.push(battleArmy2.squadQueue[0].unitList[j]);
            }
            this._owner.actorViewVector.anim.AddCallbackAt(new AnimationCallback(25,this._owner.CreateAttackOkKoraz,this._owner,[this._effectID,targetList,this._dmgList]));
            return;
         }
         for(j = this._modelAttack.upSplash * -1; j < this._modelAttack.botSplash; j++)
         {
            for(i = this._modelAttack.rightSplash * -1; i < this._modelAttack.leftSplash; i++)
            {
               if(!(this._owner.targetToHit[0].gridCase.gridPos.y + j > 5 || this._owner.targetToHit[0].gridCase.gridPos.y + j < 0))
               {
                  if(this._owner.teamId == MiscConstants.TEAM1)
                  {
                     if(!(this._owner.targetToHit[0].gridCase.gridPos.x + i > 45 || this._owner.targetToHit[0].gridCase.gridPos.x + i < 0))
                     {
                        g = context.grid.GetCaseFromPos(this._owner.targetToHit[0].gridCase.gridPos.x + i,this._owner.targetToHit[0].gridCase.gridPos.y + j);
                        if(g.actor != null)
                        {
                           targetList.push(g.actor);
                        }
                     }
                  }
                  else if(!(this._owner.targetToHit[0].gridCase.gridPos.x - i > 45 || this._owner.targetToHit[0].gridCase.gridPos.x - i < 0))
                  {
                     g = context.grid.GetCaseFromPos(this._owner.targetToHit[0].gridCase.gridPos.x - i,this._owner.targetToHit[0].gridCase.gridPos.y + j);
                     if(g.actor != null)
                     {
                        targetList.push(g.actor);
                     }
                  }
               }
            }
         }
         if(BC_VersionInfo.isBitMapMode)
         {
            this._owner.actorViewBitmap.AddCallbackAt(new AnimationCallback(25,this._owner.createAttackEffect,this._owner,[this._effectID,targetList,this._dmgList]));
         }
         else
         {
            this._owner.actorViewVector.anim.AddCallbackAt(new AnimationCallback(25,this._owner.createAttackEffect,this._owner,[this._effectID,targetList,this._dmgList]));
         }
         if(this._sfxId != -1)
         {
            BC_Game.instance.PlaySound(this._sfxId);
         }
      }
      
      public function set counterTime(counterTime:int) : void
      {
         this._counterTime = counterTime;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get waitingTime() : int
      {
         return this._waitingTime;
      }
      
      public function Cast() : void
      {
         ++this._counterTime;
         if(this._counterTime >= this._waitingTime)
         {
            this._counterTime = 0;
            this.UseEffect();
         }
      }
      
      public function get modelAttack() : ModelAttack
      {
         return this._modelAttack;
      }
      
      public function set modelAttack(modelAttack:ModelAttack) : void
      {
         this._modelAttack = modelAttack;
      }
      
      public function set owner(owner:BC_Actor) : void
      {
         this._owner = owner;
      }
      
      public function set effectID(effectID:int) : void
      {
         this._effectID = effectID;
      }
      
      public function get counterTime() : int
      {
         return this._counterTime;
      }
      
      public function get effectID() : int
      {
         return this._effectID;
      }
      
      public function Reset() : void
      {
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function set dmgList(dmgList:MetaStatsList) : void
      {
         this._dmgList = dmgList;
      }
      
      public function get dmgList() : MetaStatsList
      {
         return this._dmgList;
      }
   }
}

