package com.lachhhEngine.games.debug
{
   public class DebugManagerTreeChild extends DebugTree
   {
      
      private var _class:Class;
      
      public function DebugManagerTreeChild(pClass:Class)
      {
         super();
         this._class = pClass;
      }
      
      public function get myClass() : Class
      {
         return this._class;
      }
   }
}

