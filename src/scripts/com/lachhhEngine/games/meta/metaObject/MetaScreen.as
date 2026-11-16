package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class MetaScreen extends MetaObject
   {
      
      private var _aboveAll:Boolean;
      
      private var _belowAll:Boolean;
      
      public function MetaScreen()
      {
         super();
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         super.Init(metaInfo,context);
         this._belowAll = false;
         this._aboveAll = false;
      }
      
      public function get aboveAll() : Boolean
      {
         return this._aboveAll;
      }
      
      public function set aboveAll(aboveAll:Boolean) : void
      {
         this._aboveAll = aboveAll;
      }
      
      public function get belowAll() : Boolean
      {
         return this._belowAll;
      }
      
      public function set belowAll(belowAll:Boolean) : void
      {
         this._belowAll = belowAll;
      }
   }
}

