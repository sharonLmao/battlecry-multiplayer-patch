package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class MetaWeapon extends MetaObject
   {
      
      private var _idFxLoop:int;
      
      private var _coolDownMinToStartShooting:Number;
      
      private var _idVisual:int;
      
      private var _idFx:int;
      
      private var _waitBetweenShot:Number;
      
      private var _angleErreur:Number = 1;
      
      private var _idSoundLoop:int;
      
      private var _waitTime:Number;
      
      private var _metaAmmo:MetaAmmo;
      
      private var _coolDownCost:Number;
      
      private var _coolDown:Number;
      
      private var _coolDownRegen:Number;
      
      private var _idSound:int;
      
      public function MetaWeapon()
      {
         super();
      }
      
      public function get coolDown() : Number
      {
         return this._coolDown;
      }
      
      public function get idFxLoop() : int
      {
         return this._idFxLoop;
      }
      
      public function get angleErreur() : Number
      {
         return this._angleErreur;
      }
      
      override public function cloneAttributes(metaObject:MetaObject) : void
      {
         super.cloneAttributes(metaObject);
         var metaWeapon:MetaWeapon = MetaWeapon(metaObject);
         this.waitBetweenShot = metaWeapon.waitBetweenShot;
         this.waitTime = metaWeapon.waitTime;
         this.idSound = metaWeapon.idSound;
         this.idFx = metaWeapon.idFx;
         this.idSoundLoop = metaWeapon.idSoundLoop;
         this.idFxLoop = metaWeapon.idFxLoop;
         this.idVisual = metaWeapon.idVisual;
         this.angleErreur = metaWeapon.angleErreur;
         this.coolDownRegen = metaWeapon.coolDownRegen;
         this.coolDownCost = metaWeapon.coolDownCost;
         this.coolDown = metaWeapon.coolDown;
         this.coolDownMinToStartShooting = metaWeapon.coolDownMinToStartShooting;
         this.metaAmmo = MetaAmmo(metaWeapon.metaAmmo.clone());
      }
      
      public function set coolDown(coolDown:Number) : void
      {
         this._coolDown = coolDown;
      }
      
      public function set idFx(idFx:int) : void
      {
         this._idFx = idFx;
      }
      
      public function set idFxLoop(idFxLoop:int) : void
      {
         this._idFxLoop = idFxLoop;
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         super.Init(metaInfo,context);
         this._coolDownRegen = 1;
         this._coolDownCost = 0;
         this._coolDown = 0;
         this._waitBetweenShot = 0;
         this._waitTime = 0;
         this._idSound = -1;
         this._idSoundLoop = -1;
         this._idFx = -1;
         this._idFxLoop = -1;
         this._coolDownMinToStartShooting = 0;
         this._metaAmmo = null;
      }
      
      public function get idSound() : int
      {
         return this._idSound;
      }
      
      public function get idVisual() : int
      {
         return this._idVisual;
      }
      
      public function set waitTime(waitTime:Number) : void
      {
         this._waitTime = waitTime;
      }
      
      public function set coolDownMinToStartShooting(coolDownMinToStartShooting:Number) : void
      {
         this._coolDownMinToStartShooting = coolDownMinToStartShooting;
      }
      
      public function get idFx() : int
      {
         return this._idFx;
      }
      
      public function set waitBetweenShot(waitBetweenShot:Number) : void
      {
         this._waitBetweenShot = waitBetweenShot;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         if(this._metaAmmo != null)
         {
            MetaManager.instance.DestroyMetaData(this._metaAmmo);
            this._metaAmmo = null;
         }
      }
      
      public function get waitTime() : Number
      {
         return this._waitTime;
      }
      
      public function get coolDownMinToStartShooting() : Number
      {
         return this._coolDownMinToStartShooting;
      }
      
      public function set coolDownRegen(coolDownRegen:Number) : void
      {
         this._coolDownRegen = coolDownRegen;
      }
      
      public function set angleErreur(angleErreur:Number) : void
      {
         this._angleErreur = angleErreur;
      }
      
      public function set idSound(idSound:int) : void
      {
         this._idSound = idSound;
      }
      
      public function set metaAmmo(metaAmmo:MetaAmmo) : void
      {
         this._metaAmmo = metaAmmo;
      }
      
      public function set coolDownCost(coolDownCost:Number) : void
      {
         this._coolDownCost = coolDownCost;
      }
      
      public function get coolDownRegen() : Number
      {
         return this._coolDownRegen;
      }
      
      public function get waitBetweenShot() : Number
      {
         return this._waitBetweenShot;
      }
      
      public function set idVisual(idVisual:int) : void
      {
         this._idVisual = idVisual;
      }
      
      public function set idSoundLoop(idSoundLoop:int) : void
      {
         this._idSoundLoop = idSoundLoop;
      }
      
      public function get coolDownCost() : Number
      {
         return this._coolDownCost;
      }
      
      public function get metaAmmo() : MetaAmmo
      {
         return this._metaAmmo;
      }
      
      public function get idSoundLoop() : int
      {
         return this._idSoundLoop;
      }
   }
}

