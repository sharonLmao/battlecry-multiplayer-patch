package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.GameManagers;
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class MetaGame extends MetaObject
   {
      
      private var _height:int;
      
      private var _width:int;
      
      private var _debug:Boolean = false;
      
      private var _gameManagers:GameManagers;
      
      public function MetaGame()
      {
         super();
      }
      
      public function set width(width:int) : void
      {
         this._width = width;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function set gameManagers(gameManagers:GameManagers) : void
      {
         this._gameManagers = gameManagers;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get gameManagers() : GameManagers
      {
         return this._gameManagers;
      }
      
      public function get debug() : Boolean
      {
         return this._debug;
      }
      
      public function set height(height:int) : void
      {
         this._height = height;
      }
      
      public function set debug(debug:Boolean) : void
      {
         this._debug = debug;
      }
   }
}

