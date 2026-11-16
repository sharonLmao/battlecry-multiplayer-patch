package com.lachhhEngine.games.debug
{
   import com.lachhhEngine.games.Game;
   
   public class DebugMovieClipClassTree extends DebugTree
   {
      
      private var _className:String;
      
      private var _nb:int;
      
      public function DebugMovieClipClassTree(className:String)
      {
         super();
         this._className = className;
      }
      
      public function get className() : String
      {
         return this._className;
      }
      
      override public function Update(context:Game) : void
      {
         name = this._className + " : " + this._nb;
      }
      
      public function get nb() : int
      {
         return this._nb;
      }
      
      public function set nb(nb:int) : void
      {
         this._nb = nb;
      }
   }
}

