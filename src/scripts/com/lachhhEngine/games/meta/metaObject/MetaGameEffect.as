package com.lachhhEngine.games.meta.metaObject
{
   public class MetaGameEffect extends MetaActor
   {
      
      private var _loop:Boolean = false;
      
      private var _idContainer:int;
      
      private var _idAnim:int;
      
      private var _repeat:int = 1;
      
      public function MetaGameEffect()
      {
         super();
      }
      
      public function get loop() : Boolean
      {
         return this._loop;
      }
      
      public function set loop(loop:Boolean) : void
      {
         this._loop = loop;
      }
      
      public function set idContainer(idContainer:int) : void
      {
         this._idContainer = idContainer;
      }
      
      public function get idContainer() : int
      {
         return this._idContainer;
      }
      
      public function set repeat(repeat:int) : void
      {
         this._repeat = repeat;
      }
      
      public function set idAnim(idAnim:int) : void
      {
         this._idAnim = idAnim;
      }
      
      public function get idAnim() : int
      {
         return this._idAnim;
      }
      
      public function get repeat() : int
      {
         return this._repeat;
      }
   }
}

