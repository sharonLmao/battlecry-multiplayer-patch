package com.lachhhEngine.games.ammo
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.heurtable.CircleCollision;
   import com.lachhhEngine.games.heurtable.IHeurtable;
   import com.lachhhEngine.games.heurtable.IHeurtableContainer;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaAmmo;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.games.physique.Circle;
   import com.lachhhEngine.games.physique.Collision;
   import com.lachhhEngine.games.physique.EquationVecto;
   import com.lachhhEngine.utils.Utils;
   import flash.geom.Point;
   
   public class Ammo extends Actor implements IAmmo
   {
      
      private var _tabTarget:Array = null;
      
      private var _isExplosive:Boolean;
      
      private var _owner:IHeurtableContainer = null;
      
      private var _dmg:Number;
      
      private var _knockBack:Number = 0;
      
      private var _vitesse:int;
      
      public var nTeam:int = 0;
      
      private var _context:Game = null;
      
      public function Ammo()
      {
         super();
         _nGravite = 0;
         this._vitesse = 0;
      }
      
      public function set dmg(dmg:Number) : void
      {
         this._dmg = dmg;
      }
      
      protected function get tabTarget() : Array
      {
         return this._tabTarget;
      }
      
      public function GetVitesse() : int
      {
         return this._vitesse;
      }
      
      public function OnHit(h:IHeurtable, oCol:Collision) : void
      {
         if(this._owner != null)
         {
            this._owner.OnOwnerHit(h,this,oCol);
         }
      }
      
      public function SetVitesse(n:int) : void
      {
         this._vitesse = n;
      }
      
      override public function OnAdd(context:Game) : void
      {
         super.OnAdd(context);
      }
      
      public function GetExplosionForce() : Number
      {
         return -1;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._context = context;
         var metaAmmo:MetaAmmo = MetaAmmo(metaObject);
         this._owner = metaAmmo.owner;
         this._dmg = metaAmmo.dmg;
         this.SetTarget(metaAmmo.targetTeam,false);
         SetRayon(metaAmmo.rayon);
      }
      
      public function SetIsExplosive(b:Boolean) : void
      {
         this._isExplosive = b;
      }
      
      public function IsExplosive() : Boolean
      {
         return false;
      }
      
      public function SetKnockBack(n:Number) : void
      {
         this._knockBack = n;
      }
      
      protected function MakeSplashDmg(nRayonCarre:int, removeTargetIfHit:Boolean = false, ignoreOtherRayon:Boolean = true) : Boolean
      {
         var rayonCarreCircle:Number = NaN;
         var l:int = 0;
         var oCircle:CircleCollision = null;
         var hit:Boolean = false;
         for(var i:int = 0; i < this._tabTarget.length; i++)
         {
            oCircle = this._tabTarget[i];
            if(!(oCircle == null || oCircle.metaInfo == null))
            {
               rayonCarreCircle = ignoreOtherRayon ? 0 : oCircle.rayon * oCircle.rayon;
               if(EquationVecto.GetDistAuCarre(oCircle.point,pos) <= nRayonCarre + rayonCarreCircle)
               {
                  l = int(this._tabTarget.length);
                  oCircle.OnHit(this,null);
                  this.OnHit(oCircle,null);
                  if(this._tabTarget.length < l)
                  {
                     i--;
                  }
                  else if(removeTargetIfHit)
                  {
                     this._tabTarget.splice(i,1);
                     i--;
                  }
                  hit = true;
                  if(this._tabTarget == null)
                  {
                     break;
                  }
               }
            }
         }
         return hit;
      }
      
      public function get owner() : IHeurtableContainer
      {
         return this._owner;
      }
      
      public function GetKnockBack() : Number
      {
         return this._knockBack;
      }
      
      public function RemoveTarget(target:Circle) : Boolean
      {
         if(this._tabTarget == null)
         {
            return false;
         }
         return Utils.RemoveFromArray(this._tabTarget,target);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._tabTarget = null;
      }
      
      override public function OnRemove(context:Game) : void
      {
      }
      
      public function GetTargetTeam() : int
      {
         return this.nTeam;
      }
      
      override public function Update(context:Game) : void
      {
         super.Update(context);
      }
      
      public function SetTarget(nTeam:Number, onlyFOVTarget:Boolean = true) : void
      {
         var p:Point = null;
         var i:int = 0;
         var c:CircleCollision = null;
         var owner:IHeurtableContainer = null;
         nTeam = nTeam;
         this._tabTarget = layer.GetTeamCollision(nTeam);
         if(onlyFOVTarget)
         {
            for(i = 0; i < this._tabTarget.length; i++)
            {
               c = this._tabTarget[i];
               owner = c.owner;
               if(owner is Actor)
               {
                  if(!this._context.camera.IsInFieldOfView(Actor(owner)))
                  {
                     this._tabTarget.splice(i,1);
                     i--;
                  }
               }
               else
               {
                  p = new Point();
                  p.x = this._tabTarget[i].x;
                  p.y = this._tabTarget[i].y;
                  if(!this._context.camera.IsPointInFieldOfView(p,layer))
                  {
                     this._tabTarget.splice(i,1);
                     i--;
                  }
               }
            }
         }
      }
      
      public function set owner(h:IHeurtableContainer) : void
      {
         this._owner = h;
      }
      
      public function AddTarget(target:Circle) : void
      {
         if(this._tabTarget == null)
         {
            return;
         }
         Utils.AddInArrayIfNotIn(this._tabTarget,target);
      }
      
      public function get dmg() : Number
      {
         return this._dmg;
      }
      
      public function GetPosition() : Point
      {
         return new Point(px,py);
      }
   }
}

