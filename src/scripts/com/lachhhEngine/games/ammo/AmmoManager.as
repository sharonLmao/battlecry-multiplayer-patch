package com.lachhhEngine.games.ammo
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.debug.Debug;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import com.lachhhEngine.games.heurtable.CircleCollision;
   import com.lachhhEngine.games.heurtable.IHeurtableContainer;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaAmmo;
   import com.lachhhEngine.games.meta.metaObject.MetaLayer;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.games.physique.Circle;
   import com.lachhhEngine.games.physique.Collision;
   import com.lachhhEngine.games.physique.EquationVecto;
   import com.lachhhEngine.games.physique.PhysicManager;
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   
   public class AmmoManager extends FactoryObjectManager
   {
      
      private var _doDamageArray:Array = new Array();
      
      private var _dmgAmmo:AmmoMelee;
      
      public function AmmoManager(context:Game, ammoFactory:AmmoFactory)
      {
         super(ammoFactory,MetaAmmo,IAmmo,context,"Ammo");
      }
      
      public function DoDamageFromTabTarget(context:Game, px:int, py:int, vx:Number, vy:Number, rayon:int, dmg:int, team:int, owner:IHeurtableContainer, metaLayer:MetaLayer, tabTarget:Array, removeFromTargetOnHit:Boolean) : Boolean
      {
         var metaAmmo:MetaAmmo = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var dist:Number = NaN;
         var objCol:Collision = null;
         var colWithSomething:Boolean = false;
         if(this._dmgAmmo == null)
         {
            metaAmmo = MetaManager.instance.CreateMetaAmmo(AmmoFactory(context.ammoManager.factory).ID_AMMO_MELEE,metaLayer,team,owner);
            metaAmmo.x = px;
            metaAmmo.y = py;
            metaAmmo.vx = vx;
            metaAmmo.vy = vy;
            metaAmmo.dmg = dmg;
            metaAmmo.owner = owner;
            metaAmmo.rayon = rayon;
            this._dmgAmmo = AmmoMelee(this.CreateAmmo(metaAmmo));
            this._dmgAmmo.SetRemoveTargetAfterHit(false);
            Utils.LazyRemoveFromParent(this._dmgAmmo.animationContainer);
            context.camera.RemoveActeur(this._dmgAmmo);
            context.RemoveUpdatable(this._dmgAmmo);
         }
         this._dmgAmmo.px = px;
         this._dmgAmmo.py = py;
         this._dmgAmmo.vx = vx;
         this._dmgAmmo.vy = vy;
         this._dmgAmmo.dmg = dmg;
         this._dmgAmmo.owner = owner;
         this._dmgAmmo.SetRayon(rayon);
         var oCircle:CircleCollision = null;
         var nForce:Number = rayon * rayon;
         for(var i:int = 0; i < tabTarget.length; i++)
         {
            oCircle = tabTarget[i];
            if(!(oCircle == null || oCircle.metaInfo == null))
            {
               dx = oCircle.point.x - px;
               dy = oCircle.point.y - py;
               dist = dx * dx + dy * dy;
               if(dist <= nForce + oCircle.rayon * oCircle.rayon)
               {
                  oCircle.OnHit(this._dmgAmmo,null);
                  this._dmgAmmo.OnHit(oCircle,null);
                  if(!Utils.IsInArray(tabTarget,oCircle))
                  {
                     i--;
                  }
                  else if(removeFromTargetOnHit)
                  {
                     tabTarget.splice(i,1);
                     i--;
                  }
                  colWithSomething = true;
               }
               else if(!(vx == 0 && vy == 0))
               {
                  while(this._doDamageArray.length > 0)
                  {
                     this._doDamageArray.shift();
                  }
                  this._doDamageArray.push(oCircle);
                  objCol = EquationVecto.CheckCollision(this._dmgAmmo,null,this._doDamageArray,1);
                  if(objCol != null)
                  {
                     oCircle.OnHit(this._dmgAmmo,objCol);
                     this._dmgAmmo.OnHit(oCircle,objCol);
                     if(objCol.line != null)
                     {
                        PhysicManager.instance.DestroyPhysicObject(objCol.line);
                     }
                     if(!Utils.IsInArray(tabTarget,oCircle))
                     {
                        i--;
                     }
                     else if(removeFromTargetOnHit)
                     {
                        tabTarget.splice(i,1);
                        i--;
                     }
                     colWithSomething = true;
                  }
               }
            }
         }
         if(Debug.showLines)
         {
            Debug.DessineCircle(context,px,py,rayon,16711680);
            if(vx != 0 || vy != 0)
            {
               Debug.MakeLine(context,px,px + vx,py - rayon,py - rayon + vy);
               Debug.MakeLine(context,px,px + vx,py + rayon,py + rayon + vy);
               Debug.DessineCircle(context,px + vx,py + vy,rayon,16711680);
            }
         }
         return colWithSomething;
      }
      
      public function DestroyAmmo(ammo:Actor) : void
      {
         var cnt:MovieClip = ammo.layer.GetAmmoContainer();
         if(cnt.contains(ammo.animationContainer))
         {
            cnt.removeChild(ammo.animationContainer);
         }
         context.camera.RemoveActeur(ammo);
         context.RemoveUpdatable(ammo);
         Destroy(ammo);
      }
      
      public function AddTargetToAllAmmo(oTarget:Circle, team:Number) : void
      {
         var ammo:IAmmo = null;
         for(var i:int = 0; i < activeFactoryObjects.length; i++)
         {
            ammo = IAmmo(activeFactoryObjects[i]);
            if((ammo.GetTargetTeam() & team) != 0)
            {
               ammo.AddTarget(oTarget);
            }
         }
      }
      
      public function CreateAmmo(metaAmmo:MetaAmmo) : Actor
      {
         var ammo:Actor = Actor(Create(metaAmmo));
         ammo.layer.GetAmmoContainer().addChild(ammo.animationContainer);
         context.camera.AddActeur(ammo);
         context.AddUpdatable(ammo);
         return ammo;
      }
      
      public function RemoveTargetFromAllAmmo(oTarget:Circle, team:Number) : void
      {
         var ammo:IAmmo = null;
         var n:Number = NaN;
         for(var i:int = 0; i < activeFactoryObjects.length; i++)
         {
            ammo = IAmmo(activeFactoryObjects[i]);
            n = ammo.GetTargetTeam() & team;
            if(n != 0)
            {
               ammo.RemoveTarget(oTarget);
            }
         }
      }
      
      public function DoDamageAt(context:Game, px:int, py:int, vx:Number, vy:Number, rayon:int, dmg:int, team:int, owner:IHeurtableContainer, metaLayer:MetaLayer, removeOnHit:Boolean = false) : Boolean
      {
         return this.DoDamageAtTEST(context,px,py,vx,vy,rayon,dmg,team,owner,metaLayer,removeOnHit);
      }
      
      public function DestroyAllAmmo() : void
      {
         while(activeFactoryObjects.length > 0)
         {
            this.DestroyAmmo(activeFactoryObjects[0] as Actor);
         }
      }
      
      public function DoDamageAtTEST(context:Game, px:int, py:int, vx:Number, vy:Number, rayon:int, dmg:int, team:int, owner:IHeurtableContainer, metaLayer:MetaLayer, removeOnHit:Boolean = false) : Boolean
      {
         return this.DoDamageFromTabTarget(context,px,py,vx,vy,rayon,dmg,team,owner,metaLayer,LevelLayer(metaLayer.factoryObject).GetRefCollisionOfTeam(team),removeOnHit);
      }
   }
}

