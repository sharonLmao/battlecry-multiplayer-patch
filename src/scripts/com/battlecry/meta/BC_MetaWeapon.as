package com.battlecry.meta
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaWeapon;
   
   public class BC_MetaWeapon extends MetaWeapon
   {
      
      private var _nShakeCamera:int;
      
      public function BC_MetaWeapon()
      {
         super();
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         super.Init(metaInfo,context);
         this.nShakeCamera = 0;
      }
      
      override public function cloneAttributes(metaObject:MetaObject) : void
      {
         super.cloneAttributes(metaObject);
      }
      
      public function set nShakeCamera(nShakeCamera:int) : void
      {
         this._nShakeCamera = nShakeCamera;
      }
      
      public function get nShakeCamera() : int
      {
         return this._nShakeCamera;
      }
   }
}

