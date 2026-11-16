package com.battlecry.meta
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaWeapon;
   
   public class BC_MetaHero extends BC_MetaActor
   {
      
      private var _metaWeapon:MetaWeapon;
      
      public function BC_MetaHero()
      {
         super();
      }
      
      public function get metaWeapon() : MetaWeapon
      {
         return this._metaWeapon;
      }
      
      public function set metaWeapon(metaWeapon:MetaWeapon) : void
      {
         this._metaWeapon = metaWeapon;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._metaWeapon = null;
      }
   }
}

