package com.lachhhEngine.games.screens.view
{
   import com.lachhhEngine.games.screens.Screen;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   
   public class ObjectView
   {
      
      private var _visualMc:MovieClip;
      
      private var _visual:DisplayObjectContainer;
      
      public function ObjectView(visual:DisplayObjectContainer)
      {
         super();
         this._visual = visual;
         this._visualMc = visual as MovieClip;
      }
      
      public function get visual() : DisplayObjectContainer
      {
         return this._visual;
      }
      
      public function get visualMc() : MovieClip
      {
         return this._visualMc;
      }
      
      public function Update() : void
      {
      }
      
      public function Destroy() : void
      {
      }
      
      public function Refresh() : void
      {
      }
      
      public function onAddedOnScreen(s:Screen) : void
      {
      }
   }
}

