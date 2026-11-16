package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.io.Callback;
   
   public class MetaMusic extends MetaSfx
   {
      
      private var _endCallback:Callback;
      
      private var _loop:Boolean;
      
      public function MetaMusic()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._loop = false;
         this._endCallback = null;
      }
      
      public function get loop() : Boolean
      {
         return this._loop;
      }
      
      public function get endCallback() : Callback
      {
         return this._endCallback;
      }
      
      public function set loop(loop:Boolean) : void
      {
         this._loop = loop;
      }
      
      public function set endCallback(endCallback:Callback) : void
      {
         this._endCallback = endCallback;
      }
   }
}

