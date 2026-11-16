package com.lachhhEngine.initializers.preloader
{
   import com.lachhhEngine.io.Callback;
   import flash.display.MovieClip;
   
   public interface IPreloader
   {
      
      function get visual() : MovieClip;
      
      function set callback(param1:Callback) : void;
      
      function get callback() : Callback;
      
      function Init() : void;
   }
}

