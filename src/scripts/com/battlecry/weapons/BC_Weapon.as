package com.battlecry.weapons
{
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.meta.BC_MetaWeapon;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.effects.GameEffectContainerId;
   import com.lachhhEngine.games.heurtable.IHeurtableContainer;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.games.physique.EquationVecto;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.games.sfx.Sound2D;
   import com.lachhhEngine.games.weapon.Weapon;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class BC_Weapon extends Weapon
   {
      
      private var _loopSound:Sound2D;
      
      private var _point:Point = new Point();
      
      private var _isShooting:Boolean;
      
      private var _gunVisuel:MovieClip;
      
      private var _context:Game;
      
      private var _loopFx:Actor;
      
      public function BC_Weapon()
      {
         super();
      }
      
      public function get metaWeapon() : BC_MetaWeapon
      {
         return BC_MetaWeapon(metaInfo);
      }
      
      public function set waitTime(value:Number) : void
      {
         this.metaWeapon.waitTime = value;
      }
      
      public function Unshoot(stopSound:Boolean = true) : void
      {
         if(stopSound)
         {
            this.DestroySound();
         }
         this.UpdateCoolDownAndWait();
         this._isShooting = false;
         if(this._gunVisuel != null)
         {
            this._gunVisuel.gotoAndStop(0);
         }
         this.DestroyLoopFx();
      }
      
      public function set gunVisuel(gunVisuel:MovieClip) : void
      {
         this._gunVisuel = gunVisuel;
      }
      
      public function get coolDown() : Number
      {
         return this.metaWeapon.coolDown;
      }
      
      private function DestroyLoopFx() : void
      {
         if(this._loopFx != null)
         {
            this.context.gameEffectManager.DestroyGameEffect(this._loopFx);
            this._loopFx = null;
         }
      }
      
      public function DestroySound() : void
      {
         if(this._loopSound != null)
         {
            if(this._loopSound.isPlaying)
            {
               this._loopSound.Stop();
            }
            Jukebox.instance.DestroySound(this._loopSound);
            this._loopSound = null;
         }
      }
      
      public function set coolDown(value:Number) : void
      {
         this.metaWeapon.coolDown = value;
      }
      
      override public function Destroy() : void
      {
         this.DestroySound();
         this.DestroyLoopFx();
         super.Destroy();
      }
      
      public function get enoughCoolDown() : Boolean
      {
         return this.coolDown >= this.metaWeapon.coolDownCost;
      }
      
      public function get gunVisuel() : MovieClip
      {
         return this._gunVisuel;
      }
      
      public function PlaySoundLoop(emetteur:Actor) : void
      {
         if(this._loopSound == null && this.metaWeapon.idSoundLoop != -1)
         {
            this._loopSound = Jukebox.instance.PlaySound2D(this.metaWeapon.idSoundLoop,emetteur,true);
         }
         else if(this._loopSound != null && !this._loopSound.isPlaying)
         {
            this._loopSound.Play(true);
         }
      }
      
      public function set isShooting(isShooting:Boolean) : void
      {
         this._isShooting = isShooting;
      }
      
      public function get metaMKWeapon() : BC_MetaWeapon
      {
         return BC_MetaWeapon(metaInfo);
      }
      
      public function get frameBetweenShotWaited() : Boolean
      {
         return this.waitTime <= 0;
      }
      
      protected function ShootAmmo(endOfGun:MovieClip = null) : void
      {
         var rot:Number = NaN;
         var lenght:int = 0;
         var fx:Actor = null;
         this._isShooting = true;
         this.waitTime = this.metaWeapon.waitBetweenShot;
         this.coolDown -= this.metaWeapon.coolDownCost * this.context.speedManager.GetSpeed();
         if(this.metaWeapon.angleErreur != 0)
         {
            rot = EquationVecto.GetRotation(this.metaWeapon.metaAmmo.vx,0,this.metaWeapon.metaAmmo.vy,0) + Math.random() * this.metaWeapon.angleErreur - this.metaWeapon.angleErreur / 2;
            lenght = 0;
            this._point.x = this.metaWeapon.metaAmmo.vx;
            this._point.y = this.metaWeapon.metaAmmo.vy;
            lenght = this._point.length;
            this.metaWeapon.metaAmmo.vx = EquationVecto.MyCos(rot) * this._point.length;
            this.metaWeapon.metaAmmo.vy = EquationVecto.MySin(rot) * this._point.length;
         }
         if(this.metaWeapon.idFx != -1)
         {
            fx = this.context.gameEffectManager.CreateStaticFx(this.metaWeapon.idFx,GameEffectContainerId.ABOVE,this.metaWeapon.metaAmmo.x,this.metaWeapon.metaAmmo.y,this.metaWeapon.metaAmmo.metaLayer);
            fx.animationContainer.rotation = EquationVecto.GetRotation(0,this.metaWeapon.metaAmmo.vx,0,this.metaWeapon.metaAmmo.vy) + 180;
         }
         if(this.metaWeapon.idFxLoop != -1)
         {
            if(this._loopFx != null)
            {
               this._loopFx.px = this.metaWeapon.metaAmmo.x;
               this._loopFx.py = this.metaWeapon.metaAmmo.y;
               this._loopFx.animationContainer.rotation = EquationVecto.GetRotation(0,this.metaWeapon.metaAmmo.vx,0,this.metaWeapon.metaAmmo.vy) + 180;
            }
            else
            {
               this._loopFx = this.context.gameEffectManager.CreateStaticFx(this.metaWeapon.idFxLoop,GameEffectContainerId.ABOVE,this.metaWeapon.metaAmmo.x,this.metaWeapon.metaAmmo.y,this.metaWeapon.metaAmmo.metaLayer,-1,true);
               this._loopFx.animationContainer.rotation = EquationVecto.GetRotation(0,this.metaWeapon.metaAmmo.vx,0,this.metaWeapon.metaAmmo.vy) + 180;
            }
         }
      }
      
      public function get canShoot() : Boolean
      {
         return this.frameBetweenShotWaited && this.enoughCoolDown && this.canStartShooting;
      }
      
      public function get waitTime() : Number
      {
         return this.metaWeapon.waitTime;
      }
      
      public function get isShooting() : Boolean
      {
         return this._isShooting;
      }
      
      public function get canStartShooting() : Boolean
      {
         return this._isShooting || this.coolDown >= this.metaWeapon.coolDownMinToStartShooting;
      }
      
      public function get context() : Game
      {
         return this._context;
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         super.Init(metaInfo,context);
         this._context = context;
      }
      
      public function UpdateCoolDownAndWait() : void
      {
         if(!this.frameBetweenShotWaited)
         {
            this.waitTime -= this.context.speedManager.GetSpeed();
         }
         if(this.coolDown < 1)
         {
            this.coolDown += this.context.speedManager.GetSpeed() * this.metaWeapon.coolDownRegen;
            this.coolDown = Math.min(1,this.coolDown);
         }
      }
      
      public function Shoot(owner:Actor, px:int, py:int, vx:int = 0, vy:int = 0, endOfGun:MovieClip = null) : void
      {
         if(!owner is IHeurtableContainer)
         {
            throw new Error("Shooter must be IHeurtableContainer");
         }
         this.metaWeapon.metaAmmo.owner = IHeurtableContainer(owner);
         this.metaWeapon.metaAmmo.metaLayer = owner.layer.metaLayer;
         this.metaWeapon.metaAmmo.targetTeam = BC_Actor(owner).metaActor.targetTeam;
         this.metaWeapon.metaAmmo.x = px;
         this.metaWeapon.metaAmmo.y = py;
         this.metaWeapon.metaAmmo.vx = vx;
         this.metaWeapon.metaAmmo.vy = vy;
         if(!this.canShoot)
         {
            if(this.enoughCoolDown && this.canStartShooting)
            {
               this.Unshoot(false);
            }
            else
            {
               this.Unshoot(true);
            }
            return;
         }
         this.UpdateCoolDownAndWait();
         this.ShootAmmo(endOfGun);
         if(this.metaWeapon.idSound != -1)
         {
            if(this.metaWeapon.metaAmmo.owner is Actor)
            {
               Jukebox.instance.PlaySound2D(this.metaWeapon.idSound,Actor(this.metaWeapon.metaAmmo.owner),false,200,1500);
            }
         }
         if(!this.context.camera.isShaking && this.metaMKWeapon.nShakeCamera > 0)
         {
            this.context.camera.ShakeCamera(this.metaMKWeapon.nShakeCamera);
         }
         this.PlaySoundLoop(Actor(this.metaWeapon.metaAmmo.owner));
      }
   }
}

