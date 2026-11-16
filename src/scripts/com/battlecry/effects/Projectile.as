package com.battlecry.effects
{
   import com.battlecry.BC_Game;
   import com.battlecry.constants.MiscConstants;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.effects.GameEffect;
   import com.lachhhEngine.games.effects.GameEffectContainerId;
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class Projectile extends BC_GameEffect
   {
      
      private var _TotalFrame:int;
      
      private var _init:Boolean;
      
      private var _CurrentFrame:int;
      
      private var _distance:int;
      
      private var _startingX:Number;
      
      private var _startingY:Number;
      
      private var _team:int;
      
      private var _finalSound:int;
      
      public function Projectile()
      {
         super();
      }
      
      public function get team() : int
      {
         return this._team;
      }
      
      public function set team(team:int) : void
      {
         this._team = team;
      }
      
      override public function Update(context:Game) : void
      {
         var perc:Number = NaN;
         var a:Number = NaN;
         var middle:Number = NaN;
         var distance:Number = NaN;
         var y:Number = NaN;
         var g:GameEffect = null;
         super.Update(context);
         if(ready)
         {
            if(this._init)
            {
               this._init = false;
               this._distance = (target.px - px) / 13 + 1;
               if(this._distance >= 20)
               {
                  this._distance = 20;
               }
               this._TotalFrame = Math.ceil(this._distance * 36 / 20);
               if(this._TotalFrame < 0)
               {
                  this._TotalFrame *= -1;
               }
               if(owner.teamId == MiscConstants.TEAM2)
               {
                  animation.scaleX *= -1;
               }
            }
            this._CurrentFrame += BC_Game.instance.speedManager.GetSpeed();
            perc = this._CurrentFrame / this._TotalFrame;
            if(owner.teamId == MiscConstants.TEAM1)
            {
               animation.rotation = -30 + perc * 60;
               middle = (target.px - this._startingX) / 2;
               a = yOffSet / ((middle - 0) * (middle - target.px - this._startingX));
               distance = (target.px - this._startingX) / this._TotalFrame * this._CurrentFrame;
               y = a * (distance - 0) * (distance - (target.px - this._startingX));
               y *= -1;
               px = this._startingX + distance;
               py = this._startingY + y - startingOffSetY;
            }
            else
            {
               animation.rotation = 30 - perc * 60;
               middle = (this._startingX - target.px) / 2;
               a = yOffSet / ((middle - 0) * (middle - this._startingX - target.px));
               distance = (this._startingX - target.px) / this._TotalFrame * this._CurrentFrame;
               y = a * (distance - 0) * (distance - (this._startingX - target.px));
               y *= -1;
               px = this._startingX - distance;
               py = this._startingY + y - startingOffSetY;
            }
            if(this._CurrentFrame > this._TotalFrame)
            {
               if(onHitAnimId >= 0)
               {
                  g = (context.gameEffectManager as BC_GameEffectManager).CreateStaticFx(onHitAnimId,GameEffectContainerId.ABOVE,target.px,owner.py,context.actionLayer.metaLayer);
                  if(owner.teamId == MiscConstants.TEAM2)
                  {
                     g.animation.scaleX *= -1;
                  }
               }
               (context as BC_Game).PlaySound(this._finalSound,2);
               context.gameEffectManager.DestroyGameEffect(this);
            }
         }
      }
      
      public function set finalSound(finalSound:int) : void
      {
         this._finalSound = finalSound;
      }
      
      public function get finalSound() : int
      {
         return this._finalSound;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._startingX = px;
         this._startingY = py;
         this._CurrentFrame = 0;
         this._init = true;
      }
   }
}

