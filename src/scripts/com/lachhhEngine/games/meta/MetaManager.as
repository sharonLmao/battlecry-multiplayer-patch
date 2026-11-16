package com.lachhhEngine.games.meta
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import com.lachhhEngine.games.heurtable.IHeurtableContainer;
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
   
   public class MetaManager extends FactoryObjectManager
   {
      
      private static var _instance:MetaManager;
      
      public function MetaManager(context:Game, metaFactory:MetaFactory)
      {
         super(metaFactory,MetaObject,MetaObject,context,"Meta");
         if(_instance != null)
         {
            throw new Error("Instance Already made, call MetaManager.instance");
         }
         _instance = this;
      }
      
      public static function get instance() : MetaManager
      {
         return _instance;
      }
      
      public function get typedFactory() : MetaFactory
      {
         return MetaFactory(factory);
      }
      
      public function CreateMetaCircleCollision(x:Number, y:Number, rayon:Number) : MetaCircleCollision
      {
         var metaCircleCol:MetaCircleCollision = MetaCircleCollision(this.CreateMetaData(this.typedFactory.META_CIRCLE_COLLISION));
         metaCircleCol.x = x;
         metaCircleCol.y = y;
         metaCircleCol.rayon = rayon;
         return metaCircleCol;
      }
      
      public function CreateMetaAnimation(idAnim:int) : MetaAnimation
      {
         var metaObj:MetaObject = this.CreateMetaData(this.typedFactory.META_ANIMATION);
         var metaAnim:MetaAnimation = MetaAnimation(metaObj);
         metaAnim.instanceType = idAnim;
         return metaAnim;
      }
      
      public function CreateMetaGameEffect(idGameFx:int, idAnim:int, idContainer:int, px:int, py:int, repeat:int, loop:Boolean, metaLayer:MetaLayer) : MetaGameEffect
      {
         var metaGameEffect:MetaGameEffect = MetaGameEffect(this.CreateMetaData(this.typedFactory.META_GAME_EFFECT));
         metaGameEffect.instanceType = idGameFx;
         metaGameEffect.idAnim = idAnim;
         metaGameEffect.idContainer = idContainer;
         metaGameEffect.metaLayer = metaLayer;
         metaGameEffect.repeat = repeat;
         metaGameEffect.loop = loop;
         metaGameEffect.x = px;
         metaGameEffect.y = py;
         return metaGameEffect;
      }
      
      public function DestroyMetaData(m:MetaObject) : void
      {
         Destroy(m);
      }
      
      public function CreateMetaLevel(lvlXml:XML, context:Game) : MetaLevel
      {
         var metaLevel:MetaLevel = MetaLevel(this.CreateMetaData(this.typedFactory.META_LEVEL));
         metaLevel.LoadFromXML(lvlXml,context);
         return metaLevel;
      }
      
      public function CreateMetaData(metaDataType:int) : MetaObject
      {
         var m:MetaObject = new MetaObject();
         m.canBeCached = false;
         m.instanceType = metaDataType;
         return MetaObject(Create(m));
      }
      
      public function CreateMetaScreen(idScreen:int) : MetaScreen
      {
         var metaScreen:MetaScreen = MetaScreen(this.CreateMetaData(this.typedFactory.META_SCREEN));
         metaScreen.instanceType = idScreen;
         return metaScreen;
      }
      
      public function CreateMetaLayer(layerXML:XML, context:Game) : MetaLayer
      {
         var metaLayer:MetaLayer = MetaLayer(this.CreateMetaData(this.typedFactory.META_LAYER));
         metaLayer.LoadFromXml(layerXML,context);
         return metaLayer;
      }
      
      public function CreateMetaGame(w:Number, h:Number) : MetaGame
      {
         var metaGame:MetaGame = MetaGame(this.CreateMetaData(this.typedFactory.META_GAME));
         metaGame.width = w;
         metaGame.height = h;
         return metaGame;
      }
      
      public function CreateMetaLine(x1:Number, x2:Number, y1:Number, y2:Number, canDrop:Boolean, canWallKick:Boolean) : MetaLine
      {
         var metaLine:MetaLine = MetaLine(this.CreateMetaData(this.typedFactory.META_LINE));
         metaLine.x1 = x1;
         metaLine.x2 = x2;
         metaLine.y1 = y1;
         metaLine.y2 = y2;
         metaLine.canDrop = canDrop;
         metaLine.canWallKick = canWallKick;
         return metaLine;
      }
      
      public function CreateMetaLevelEvent(idLevelEvent:int) : MetaLevelEvent
      {
         var metaLevelEvent:MetaLevelEvent = MetaLevelEvent(this.CreateMetaData(this.typedFactory.META_LEVEL_EVENT));
         metaLevelEvent.instanceType = idLevelEvent;
         return metaLevelEvent;
      }
      
      public function CreateMetaGameEventSwitch(metaLayer:MetaLayer, x:Number, y:Number, nRayon:Number, strTeam:String) : MetaGameEventSwitch
      {
         var metaGameEventSwitch:MetaGameEventSwitch = MetaGameEventSwitch(this.CreateMetaData(this.typedFactory.META_GAME_EVENT_SWITCH));
         metaGameEventSwitch.metaLayer = metaLayer;
         metaGameEventSwitch.x = x;
         metaGameEventSwitch.y = y;
         metaGameEventSwitch.rayon = nRayon;
         metaGameEventSwitch.team = strTeam;
         return metaGameEventSwitch;
      }
      
      public function CreateMetaLineCollision(x1:Number, x2:Number, y1:Number, y2:Number, canDrop:Boolean, canWallKick:Boolean, owner:IHeurtableContainer) : MetaLineCollision
      {
         var metaLineCol:MetaLineCollision = MetaLineCollision(this.CreateMetaData(this.typedFactory.META_LINE_COLLISION));
         metaLineCol.x1 = x1;
         metaLineCol.x2 = x2;
         metaLineCol.y1 = y1;
         metaLineCol.y2 = y2;
         metaLineCol.canDrop = canDrop;
         metaLineCol.canWallKick = canWallKick;
         metaLineCol.owner = owner;
         return metaLineCol;
      }
      
      public function CreateMetaSound2D(idSfx:int) : MetaSound2D
      {
         var metaSound2D:MetaSound2D = MetaSound2D(this.CreateMetaData(this.typedFactory.META_SOUND));
         metaSound2D.instanceType = idSfx;
         return metaSound2D;
      }
      
      public function CreateMetaSwitchHelper(x:int, y:int, metaLayer:MetaLayer, metaGameSwitch:MetaGameEventSwitch) : MetaSwitchHelper
      {
         var metaSwitchHelper:MetaSwitchHelper = MetaSwitchHelper(this.CreateMetaData(this.typedFactory.META_SWITCH_HELPER));
         metaSwitchHelper.metaCircle = metaGameSwitch;
         metaSwitchHelper.x = x;
         metaSwitchHelper.y = y;
         metaSwitchHelper.metaLayer = metaLayer;
         return metaSwitchHelper;
      }
      
      public function CreateMetaMusic(idSfx:int) : MetaMusic
      {
         var metaMusic:MetaMusic = MetaMusic(this.CreateMetaData(this.typedFactory.META_MUSIC));
         metaMusic.instanceType = idSfx;
         return metaMusic;
      }
      
      public function CreateMetaLineHelper(x:int, y:int, metaLayer:MetaLayer, metaLine:MetaLine) : MetaLineHelper
      {
         var metaLineHelper:MetaLineHelper = MetaLineHelper(this.CreateMetaData(this.typedFactory.META_LINE_HELPER));
         metaLineHelper.metaLine = metaLine;
         metaLineHelper.x = x;
         metaLineHelper.y = y;
         metaLineHelper.metaLayer = metaLayer;
         return metaLineHelper;
      }
      
      public function CreateMetaAmmo(idAmmo:int, metaLayer:MetaLayer, targetTeam:int, owner:IHeurtableContainer) : MetaAmmo
      {
         var metaAmmo:MetaAmmo = MetaAmmo(this.CreateMetaData(this.typedFactory.META_AMMO));
         metaAmmo.instanceType = idAmmo;
         metaAmmo.metaLayer = metaLayer;
         metaAmmo.targetTeam = targetTeam;
         metaAmmo.owner = owner;
         return metaAmmo;
      }
      
      public function CreateMetaCircle(x:Number, y:Number, rayon:Number) : MetaCircle
      {
         var metaCircle:MetaCircle = MetaCircle(this.CreateMetaData(this.typedFactory.META_CIRCLE));
         metaCircle.x = x;
         metaCircle.y = y;
         metaCircle.rayon = rayon;
         return metaCircle;
      }
      
      public function CreateMetaCamBounds(metaLayer:MetaLayer, metaLevel:MetaLevel) : MetaCamBoundsHelper
      {
         var metaCamBounds:MetaCamBoundsHelper = MetaCamBoundsHelper(this.CreateMetaData(this.typedFactory.META_CAM_BOUNDS_HELPER));
         metaCamBounds.metaLayer = metaLayer;
         metaCamBounds.metaLevel = metaLevel;
         return metaCamBounds;
      }
      
      public function CreateMetaBehavior(idBehavior:int, params:Array) : MetaBehavior
      {
         var metaBehavior:MetaBehavior = MetaBehavior(this.CreateMetaData(this.typedFactory.META_BEHAVIOR));
         metaBehavior.param = params;
         metaBehavior.instanceType = idBehavior;
         return metaBehavior;
      }
      
      public function CreateMetaActor(metaLayer:MetaLayer) : MetaActor
      {
         var metaActor:MetaActor = MetaActor(this.CreateMetaData(this.typedFactory.META_ACTOR));
         metaActor.metaLayer = metaLayer;
         return metaActor;
      }
      
      public function CreateMetaItem(idItem:int, metaLayer:MetaLayer) : MetaItem
      {
         var metaItem:MetaItem = MetaItem(this.CreateMetaData(this.typedFactory.META_ITEM));
         metaItem.instanceType = idItem;
         metaItem.metaLayer = metaLayer;
         return metaItem;
      }
      
      public function CreateMetaWeapon(idWeapon:int) : MetaWeapon
      {
         var metaWeapon:MetaWeapon = MetaWeapon(this.CreateMetaData(this.typedFactory.META_WEAPON));
         metaWeapon.instanceType = idWeapon;
         return metaWeapon;
      }
      
      public function CreateMetaCircleHelper(x:int, y:int, metaLayer:MetaLayer, metaCircle:MetaCircle) : MetaCircleHelper
      {
         var metaCircleHelper:MetaCircleHelper = MetaCircleHelper(this.CreateMetaData(this.typedFactory.META_CIRCLE_HELPER));
         metaCircleHelper.metaCircle = metaCircle;
         metaCircleHelper.x = x;
         metaCircleHelper.y = y;
         metaCircleHelper.metaLayer = metaLayer;
         return metaCircleHelper;
      }
   }
}

