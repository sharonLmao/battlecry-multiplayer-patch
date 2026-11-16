package com.lachhhEngine.games.meta.metaObject.levelEditor
{
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.meta.metaObject.MetaLevel;
   
   public class MetaCamBoundsHelper extends MetaActor
   {
      
      private var _metaLevel:MetaLevel;
      
      public function MetaCamBoundsHelper()
      {
         super();
      }
      
      public function set metaLevel(metaLevel:MetaLevel) : void
      {
         this._metaLevel = metaLevel;
      }
      
      public function get metaLevel() : MetaLevel
      {
         return this._metaLevel;
      }
   }
}

