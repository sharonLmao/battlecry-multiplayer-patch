package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class MetaBehavior extends MetaObject
   {
      
      private var _param:Array;
      
      public function MetaBehavior()
      {
         super();
      }
      
      public function set param(param:Array) : void
      {
         this._param = param;
      }
      
      public function get param() : Array
      {
         return this._param;
      }
   }
}

