package com.battlecry.specialEffect.dieEffects
{
   import com.battlecry.BC_Game;
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.meta.MetaStatsList;
   import com.lachhhEngine.games.effects.GameEffectContainerId;
   
   public class ExplodeDie extends DieEffects
   {
      
      private var _sfxID:int;
      
      private var _explodeID:int;
      
      private var _hauteur:int;
      
      private var _largeur:int;
      
      private var _dmgList:MetaStatsList;
      
      public function ExplodeDie(id:int, explodeID:int, largeur:int, hauteur:int, dmgList:MetaStatsList, sfxID:int)
      {
         super(id);
         this._explodeID = explodeID;
         this._largeur = largeur;
         this._hauteur = hauteur;
         this._dmgList = dmgList;
         this._sfxID = sfxID;
         if(this._sfxID != -1)
         {
         }
      }
      
      public function get sfxID() : int
      {
         return this._sfxID;
      }
      
      public function get dmgList() : MetaStatsList
      {
         return this._dmgList;
      }
      
      public function set dmgList(dmgList:MetaStatsList) : void
      {
         this._dmgList = dmgList;
      }
      
      public function get largeur() : int
      {
         return this._largeur;
      }
      
      public function get hauteur() : int
      {
         return this._hauteur;
      }
      
      public function set largeur(largeur:int) : void
      {
         this._largeur = largeur;
      }
      
      public function set hauteur(hauteur:int) : void
      {
         this._hauteur = hauteur;
      }
      
      public function set explodeID(explodeID:int) : void
      {
         this._explodeID = explodeID;
      }
      
      public function get explodeID() : int
      {
         return this._explodeID;
      }
      
      override public function Cast() : void
      {
         var i:int = 0;
         var j:int = 0;
         var posX:int = 0;
         var posY:int = 0;
         super.Cast();
         var a:Vector.<BC_Actor> = new Vector.<BC_Actor>();
         if(this._explodeID == DieEffectEnum.SMALL_MINE.id || this._explodeID == DieEffectEnum.POWER_MINE.id)
         {
            posX = owner.gridCase.gridPos.x;
            posY = owner.gridCase.gridPos.y;
            if(owner.teamId == MiscConstants.TEAM1)
            {
               if(posX + 1 >= 0 && posX + 1 <= 45 && posY >= 0 && posY <= 5)
               {
                  if(context.grid.GetCaseFromPos(posX + 1,posY).actor != null)
                  {
                     a.push(context.grid.GetCaseFromPos(posX + 1,posY).actor);
                     context.gameEffectManager.CreateStaticFx(this._explodeID,GameEffectContainerId.ABOVE,context.grid.GetCaseFromPos(posX + 1,posY).actor.px,context.grid.GetCaseFromPos(posX + 1,posY).actor.py,context.actionLayer.metaLayer);
                  }
               }
            }
            else if(posX - 1 >= 0 && posX - 1 <= 45 && posY >= 0 && posY <= 5)
            {
               if(context.grid.GetCaseFromPos(posX - 1,posY).actor != null)
               {
                  a.push(context.grid.GetCaseFromPos(posX - 1,posY).actor);
                  context.gameEffectManager.CreateStaticFx(this._explodeID,GameEffectContainerId.ABOVE,context.grid.GetCaseFromPos(posX - 1,posY).actor.px,context.grid.GetCaseFromPos(posX - 1,posY).actor.py,context.actionLayer.metaLayer);
               }
            }
         }
         else
         {
            context.gameEffectManager.CreateStaticFx(this._explodeID,GameEffectContainerId.ABOVE,owner.px,owner.py,context.actionLayer.metaLayer);
            for(i = this._largeur * -1; i <= this._largeur; i++)
            {
               for(j = this._hauteur * -1; j <= this._hauteur; j++)
               {
                  if(!(i == 0 && j == 0))
                  {
                     posX = owner.gridCase.gridPos.x + i;
                     posY = owner.gridCase.gridPos.y + j;
                     if(posX >= 0 && posX <= 45 && posY >= 0 && posY <= 5)
                     {
                        if(context.grid.GetCaseFromPos(posX,posY).actor != null)
                        {
                           a.push(context.grid.GetCaseFromPos(posX,posY).actor);
                        }
                     }
                  }
               }
            }
         }
         if(this._sfxID != -1)
         {
            BC_Game.instance.PlaySound(this._sfxID,1);
         }
         for(var k:int = 0; k < a.length; k++)
         {
            a[k].specialHit(this._dmgList,owner);
         }
      }
   }
}

