package com.lachhhEngine.games.meta.metaObject.levelEditor
{
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.meta.metaObject.MetaCircle;
   
   public class MetaCircleHelper extends MetaActor
   {
      
      private var _metaCircle:MetaCircle;
      
      public function MetaCircleHelper()
      {
         super();
      }
      
      public function set metaCircle(metaCircle:MetaCircle) : void
      {
         this._metaCircle = metaCircle;
      }
      
      public function get metaCircle() : MetaCircle
      {
         return this._metaCircle;
      }
   }
}

