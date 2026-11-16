package com.lachhhEngine.games.debug
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.utils.Utils;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.utils.getQualifiedClassName;
   
   public class DebugMovieClipTree extends DebugTree
   {
      
      private var _movieClip:MovieClip;
      
      private var _containerName:String;
      
      private var _childs:Array;
      
      public function DebugMovieClipTree(mc:MovieClip)
      {
         super();
         this._movieClip = mc;
         this._childs = new Array();
      }
      
      override public function Update(context:Game) : void
      {
         var debugTree:DebugMovieClipClassTree = null;
         var child:DisplayObject = null;
         var className:String = null;
         var indexFound:int = 0;
         super.Update(context);
         this.PutToZero();
         for(var i:int = 0; i < this._movieClip.numChildren; i++)
         {
            child = this._movieClip.getChildAt(i);
            className = getQualifiedClassName(child).split("::")[1];
            indexFound = this.findInArray(className);
            if(indexFound != -1)
            {
               debugTree = this._childs[indexFound];
               ++debugTree.nb;
            }
            else
            {
               debugTree = new DebugMovieClipClassTree(className);
               debugTree.nb = 1;
               AddChild(debugTree);
               this._childs.push(debugTree);
            }
         }
         name = this._containerName + "(" + this._movieClip.numChildren + ")";
         this.RemoveUnusedClass();
      }
      
      public function get containerName() : String
      {
         return this._containerName;
      }
      
      private function PutToZero() : void
      {
         var child:DebugMovieClipClassTree = null;
         for(var i:int = 0; i < this._childs.length; i++)
         {
            child = this._childs[i];
            child.nb = 0;
         }
      }
      
      public function set containerName(containerName:String) : void
      {
         this._containerName = containerName;
      }
      
      private function findInArray(str:String) : int
      {
         var child:DebugMovieClipClassTree = null;
         for(var i:int = 0; i < this._childs.length; i++)
         {
            child = this._childs[i];
            if(child.className == str)
            {
               return i;
            }
         }
         return -1;
      }
      
      private function RemoveUnusedClass() : void
      {
         var child:DebugMovieClipClassTree = null;
         for(var i:int = 0; i < this._childs.length; i++)
         {
            child = this._childs[i];
            if(child.nb <= 0)
            {
               Utils.RemoveFromArray(this._childs,child);
               RemoveChild(child);
               i--;
            }
         }
      }
   }
}

