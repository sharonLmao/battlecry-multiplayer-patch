package com.lachhhEngine.games.ammo
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.heurtable.CircleCollision;
   import com.lachhhEngine.games.physique.Circle;
   import com.lachhhEngine.games.physique.Collision;
   import com.lachhhEngine.games.physique.EquationVecto;
   import com.lachhhEngine.games.physique.PhysicManager;
   import flash.geom.Point;
   
   public class AmmoMelee extends Ammo
   {
      
      private var _removeTargetAfterHit:Boolean = true;
      
      private var _p:Point = new Point();
      
      private var _cercleCol:Circle = null;
      
      private var _bIsExplosive:Boolean = false;
      
      private var _targetOneAtTime:Array = new Array();
      
      public function AmmoMelee()
      {
         super();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._cercleCol = null;
      }
      
      override public function Update(context:Game) : void
      {
         super.Update(context);
         this.MakeSplashDmgMelee(context);
      }
      
      public function SetRemoveTargetAfterHit(b:Boolean) : void
      {
         this._removeTargetAfterHit = b;
      }
      
      private function MakeSplashDmgMelee(context:Game) : void
      {
         var objCol:Collision = null;
         var oCircle:CircleCollision = null;
         var nForce:Number = rayon * rayon;
         this._p.x = px;
         this._p.y = py;
         for(var i:int = 0; i < tabTarget.length; i++)
         {
            oCircle = tabTarget[i];
            if(oCircle != null)
            {
               if(EquationVecto.GetDistAuCarre(oCircle.point,this._p) <= nForce + oCircle.rayon * oCircle.rayon)
               {
                  oCircle.OnHit(this,null);
                  this.OnHit(oCircle,null);
                  if(this._removeTargetAfterHit)
                  {
                     if(RemoveTarget(oCircle))
                     {
                        i--;
                     }
                  }
                  if(tabTarget == null)
                  {
                     break;
                  }
               }
               else if(!(vx == 0 && vy == 0))
               {
                  while(this._targetOneAtTime.length > 0)
                  {
                     this._targetOneAtTime.shift();
                  }
                  this._targetOneAtTime.push(oCircle);
                  objCol = EquationVecto.CheckCollision(this,null,this._targetOneAtTime,1);
                  if(objCol != null)
                  {
                     oCircle.OnHit(this,null);
                     this.OnHit(oCircle,null);
                     if(this._removeTargetAfterHit)
                     {
                        if(RemoveTarget(oCircle))
                        {
                           i--;
                        }
                     }
                     if(tabTarget == null)
                     {
                        break;
                     }
                     if(objCol.line != null)
                     {
                        PhysicManager.instance.DestroyPhysicObject(objCol.line);
                     }
                  }
               }
            }
         }
      }
      
      override public function SetIsExplosive(b:Boolean) : void
      {
         this._bIsExplosive = b;
      }
      
      override public function IsExplosive() : Boolean
      {
         return this._bIsExplosive;
      }
   }
}

