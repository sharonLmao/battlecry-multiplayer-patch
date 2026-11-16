package com.lachhhEngine.games.meta.metaObject.levelEditor
{
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.meta.metaObject.MetaLine;
   
   public class MetaLineHelper extends MetaActor
   {
      
      private var _metaLine:MetaLine;
      
      public function MetaLineHelper()
      {
         super();
      }
      
      public function get metaLine() : MetaLine
      {
         return this._metaLine;
      }
      
      public function set metaLine(metaLine:MetaLine) : void
      {
         this._metaLine = metaLine;
      }
   }
}

