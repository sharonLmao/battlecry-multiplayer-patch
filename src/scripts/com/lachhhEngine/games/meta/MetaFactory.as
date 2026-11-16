package com.lachhhEngine.games.meta
{
   import com.lachhhEngine.games.factory.ObjectFactory;
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.meta.metaObject.MetaAmmo;
   import com.lachhhEngine.games.meta.metaObject.MetaAnimation;
   import com.lachhhEngine.games.meta.metaObject.MetaBehavior;
   import com.lachhhEngine.games.meta.metaObject.MetaCircle;
   import com.lachhhEngine.games.meta.metaObject.MetaCircleCollision;
   import com.lachhhEngine.games.meta.metaObject.MetaGame;
   import com.lachhhEngine.games.meta.metaObject.MetaGameEffect;
   import com.lachhhEngine.games.meta.metaObject.MetaGameEventSwitch;
   import com.lachhhEngine.games.meta.metaObject.MetaItem;
   import com.lachhhEngine.games.meta.metaObject.MetaLayer;
   import com.lachhhEngine.games.meta.metaObject.MetaLevel;
   import com.lachhhEngine.games.meta.metaObject.MetaLevelEvent;
   import com.lachhhEngine.games.meta.metaObject.MetaLine;
   import com.lachhhEngine.games.meta.metaObject.MetaLineCollision;
   import com.lachhhEngine.games.meta.metaObject.MetaMusic;
   import com.lachhhEngine.games.meta.metaObject.MetaScreen;
   import com.lachhhEngine.games.meta.metaObject.MetaSound2D;
   import com.lachhhEngine.games.meta.metaObject.MetaWeapon;
   import com.lachhhEngine.games.meta.metaObject.levelEditor.MetaCamBoundsHelper;
   import com.lachhhEngine.games.meta.metaObject.levelEditor.MetaCircleHelper;
   import com.lachhhEngine.games.meta.metaObject.levelEditor.MetaLineHelper;
   import com.lachhhEngine.games.meta.metaObject.levelEditor.MetaSwitchHelper;
   
   public class MetaFactory extends ObjectFactory
   {
      
      private var _metaAnimation:int;
      
      private var _metaSwitchHelper:int;
      
      private var _metaLevel:int;
      
      private var _metaItem:int;
      
      private var _metaEffect:int;
      
      private var _metaSound2D:int;
      
      private var _metaGameEventSwitch:int;
      
      private var _metaWeapon:int;
      
      private var _metaMusic:int;
      
      private var _metaCircleHelper:int;
      
      private var _metaLineCollision:int;
      
      private var _metaCamBoundsHelper:int;
      
      private var _metaCircleCollision:int;
      
      private var _metaLineHelper:int;
      
      private var _metaLayer:int;
      
      private var _metaAmmo:int;
      
      private var _metaCircle:int;
      
      private var _metaBehavior:int;
      
      private var _metaScreen:int;
      
      private var _metaActor:int;
      
      private var _metaGame:int;
      
      private var _metaLine:int;
      
      private var _metaLevelEvent:int;
      
      public function MetaFactory()
      {
         super();
         this.AddGameClass();
         this.AddEngineClass();
      }
      
      public function get META_LINE_COLLISION() : int
      {
         return this._metaLineCollision;
      }
      
      public function get META_ITEM() : int
      {
         return this._metaItem;
      }
      
      private function AddEngineClass() : void
      {
         this._metaActor = PushClassLink(MetaActor);
         this._metaAnimation = PushClassLink(MetaAnimation);
         this._metaAmmo = PushClassLink(MetaAmmo);
         this._metaBehavior = PushClassLink(MetaBehavior);
         this._metaEffect = PushClassLink(MetaGameEffect);
         this._metaGame = PushClassLink(MetaGame);
         this._metaItem = PushClassLink(MetaItem);
         this._metaLevel = PushClassLink(MetaLevel);
         this._metaLevelEvent = PushClassLink(MetaLevelEvent);
         this._metaLayer = PushClassLink(MetaLayer);
         this._metaScreen = PushClassLink(MetaScreen);
         this._metaSound2D = PushClassLink(MetaSound2D);
         this._metaMusic = PushClassLink(MetaMusic);
         this._metaWeapon = PushClassLink(MetaWeapon);
         this._metaGameEventSwitch = PushClassLink(MetaGameEventSwitch);
         this._metaCircle = PushClassLink(MetaCircle);
         this._metaCircleCollision = PushClassLink(MetaCircleCollision);
         this._metaLine = PushClassLink(MetaLine);
         this._metaLineCollision = PushClassLink(MetaLineCollision);
         this._metaLineHelper = PushClassLink(MetaLineHelper);
         this._metaCircleHelper = PushClassLink(MetaCircleHelper);
         this._metaSwitchHelper = PushClassLink(MetaSwitchHelper);
         this._metaCamBoundsHelper = PushClassLink(MetaCamBoundsHelper);
      }
      
      public function get META_WEAPON() : int
      {
         return this._metaWeapon;
      }
      
      public function get META_ACTOR() : int
      {
         return this._metaActor;
      }
      
      protected function AddGameClass() : void
      {
      }
      
      public function get META_LINE_HELPER() : int
      {
         return this._metaLineHelper;
      }
      
      public function get META_ANIMATION() : int
      {
         return this._metaAnimation;
      }
      
      public function get META_LEVEL() : int
      {
         return this._metaLevel;
      }
      
      public function get META_SOUND() : int
      {
         return this._metaSound2D;
      }
      
      public function get META_LEVEL_EVENT() : int
      {
         return this._metaLevelEvent;
      }
      
      public function get META_CIRCLE_HELPER() : int
      {
         return this._metaCircleHelper;
      }
      
      public function get META_GAME_EVENT_SWITCH() : int
      {
         return this._metaGameEventSwitch;
      }
      
      public function get META_AMMO() : int
      {
         return this._metaAmmo;
      }
      
      public function get META_CIRCLE() : int
      {
         return this._metaCircle;
      }
      
      public function get META_GAME_EFFECT() : int
      {
         return this._metaEffect;
      }
      
      public function get META_BEHAVIOR() : int
      {
         return this._metaBehavior;
      }
      
      public function get META_CAM_BOUNDS_HELPER() : int
      {
         return this._metaCamBoundsHelper;
      }
      
      public function get META_MUSIC() : int
      {
         return this._metaMusic;
      }
      
      public function get META_CIRCLE_COLLISION() : int
      {
         return this._metaCircleCollision;
      }
      
      public function get META_SWITCH_HELPER() : int
      {
         return this._metaSwitchHelper;
      }
      
      public function get META_SCREEN() : int
      {
         return this._metaScreen;
      }
      
      public function get META_LINE() : int
      {
         return this._metaLine;
      }
      
      public function get META_GAME() : int
      {
         return this._metaGame;
      }
      
      public function get META_LAYER() : int
      {
         return this._metaLayer;
      }
   }
}

