package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.level.levelEvents.LevelEventFactory;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.utils.Utils;
   import flash.geom.Point;
   
   public class MetaLevel extends MetaObject
   {
      
      private var _metaLayers:Array;
      
      private var _levelEventId:int;
      
      private var _camBoundsLeft:Number;
      
      private var _levelEventStr:String;
      
      private var _camPos:Point;
      
      private var _camBoundsUp:Number;
      
      private var _name:String;
      
      private var _camBoundsDown:Number;
      
      private var _visualStaticBack:String;
      
      private var _camBoundsRight:Number;
      
      private var _heroPos:Point;
      
      public function MetaLevel()
      {
         super();
         this._heroPos = new Point();
         this._camPos = new Point();
         this._metaLayers = new Array();
      }
      
      public function get camPos() : Point
      {
         return this._camPos;
      }
      
      public function get camBoundsLeft() : Number
      {
         return this._camBoundsLeft;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get visualStaticBack() : String
      {
         return this._visualStaticBack;
      }
      
      public function set camBoundsLeft(camBoundsLeft:Number) : void
      {
         this._camBoundsLeft = camBoundsLeft;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         Utils.ClearArray(this._metaLayers);
      }
      
      public function set camBoundsDown(camBoundsDown:Number) : void
      {
         this._camBoundsDown = camBoundsDown;
      }
      
      public function set name(name:String) : void
      {
         this._name = name;
      }
      
      public function get camBoundsRight() : Number
      {
         return this._camBoundsRight;
      }
      
      public function get levelEventStr() : String
      {
         return this._levelEventStr;
      }
      
      public function set levelEventId(levelEventId:int) : void
      {
         this._levelEventId = levelEventId;
      }
      
      public function get camBoundsUp() : Number
      {
         return this._camBoundsUp;
      }
      
      public function get camBoundsDown() : Number
      {
         return this._camBoundsDown;
      }
      
      public function set camBoundsRight(camBoundsRight:Number) : void
      {
         this._camBoundsRight = camBoundsRight;
      }
      
      public function get levelEventId() : int
      {
         return this._levelEventId;
      }
      
      public function LoadFromXML(lvlXml:XML, context:Game) : void
      {
         var metaLayer:MetaLayer = null;
         var xmlLayers:XMLList = lvlXml.Layer;
         var heroPos:Array = lvlXml.startPos.@hero1.split("~");
         var camPos:Array = lvlXml.startPos.@cameraPos.split("~");
         var camBounds:Array = lvlXml.startPos.@cameraBounds.split("~");
         this._visualStaticBack = lvlXml.@visualStaticBack;
         this._levelEventStr = lvlXml.@levelEventId;
         this._name = lvlXml.@Name;
         if(isNaN(Number(this._levelEventStr)))
         {
            this._levelEventId = LevelEventFactory(context.levelEventManager.factory).FindIdByString(this._levelEventStr);
            if(this._levelEventId == -1)
            {
               throw new Error("Can\'t find the class : " + this._levelEventId + " Be sure to put it in your LevelEventFactory");
            }
         }
         else
         {
            this._levelEventId = int(lvlXml.@levelEventId);
         }
         this._heroPos.x = Number(heroPos[0]);
         this._heroPos.y = Number(heroPos[1]);
         this._camPos.x = Number(camPos[0]);
         this._camPos.y = Number(camPos[1]);
         this._camBoundsLeft = Number(camBounds[0]);
         this._camBoundsRight = Number(camBounds[1]);
         this._camBoundsUp = Number(camBounds[2]);
         this._camBoundsDown = Number(camBounds[3]);
         for(var i:int = 0; i < xmlLayers.length(); i++)
         {
            metaLayer = MetaManager.instance.CreateMetaLayer(xmlLayers[i],context);
            this._metaLayers.push(metaLayer);
         }
      }
      
      public function get heroPos() : Point
      {
         return this._heroPos;
      }
      
      public function set camBoundsUp(camBoundsUp:Number) : void
      {
         this._camBoundsUp = camBoundsUp;
      }
      
      public function get metaLayers() : Array
      {
         return this._metaLayers;
      }
   }
}

