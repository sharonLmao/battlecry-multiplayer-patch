package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class MetaGameEventSwitch extends MetaCircle
   {
      
      private var _message:String;
      
      private var _name:String;
      
      private var _metaLayer:MetaLayer;
      
      private var _destroyable:Boolean = true;
      
      private var _team:String;
      
      public function MetaGameEventSwitch()
      {
         super();
         this._message = "";
      }
      
      public function set team(team:String) : void
      {
         this._team = team;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get metaLayer() : MetaLayer
      {
         return this._metaLayer;
      }
      
      public function set message(message:String) : void
      {
         this._message = message;
      }
      
      public function set destroyable(destroyable:Boolean) : void
      {
         this._destroyable = destroyable;
      }
      
      public function set name(name:String) : void
      {
         this._name = name;
      }
      
      override public function Init(m:MetaObject, context:Game) : void
      {
         super.Init(m,context);
         this._destroyable = true;
      }
      
      public function get destroyable() : Boolean
      {
         return this._destroyable;
      }
      
      public function get team() : String
      {
         return this._team;
      }
      
      public function set metaLayer(layer:MetaLayer) : void
      {
         this._metaLayer = layer;
      }
   }
}

