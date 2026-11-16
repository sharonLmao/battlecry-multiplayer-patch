package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class MetaSfx extends MetaObject
   {
      
      private var _pitchable:Boolean;
      
      public function MetaSfx()
      {
         super();
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         super.Init(metaInfo,context);
         this._pitchable = false;
      }
      
      public function set pitchable(pitchable:Boolean) : void
      {
         this._pitchable = pitchable;
      }
      
      public function get pitchable() : Boolean
      {
         return this._pitchable;
      }
   }
}

