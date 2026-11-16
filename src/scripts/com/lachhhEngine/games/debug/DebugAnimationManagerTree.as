package com.lachhhEngine.games.debug
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.AnimationManager;
   import flash.utils.getQualifiedClassName;
   
   public class DebugAnimationManagerTree extends DebugTree
   {
      
      private var _mgrChild:Array;
      
      public function DebugAnimationManagerTree()
      {
         var child:DebugManagerTreeChild = null;
         super();
         this._mgrChild = new Array();
         for(var i:int = 0; i < AnimationManager.factory.nbClass; i++)
         {
            child = new DebugManagerTreeChild(AnimationManager.factory.GetClassAt(i));
            child.name = getQualifiedClassName(AnimationManager.factory.GetClassAt(i));
            this._mgrChild.push(child);
         }
      }
      
      override public function Update(context:Game) : void
      {
         var inCache:int = 0;
         var active:int = 0;
         var child:DebugManagerTreeChild = null;
         super.Update(context);
         var totActive:int = 0;
         var totInCache:int = 0;
         for(var i:int = 0; i < AnimationManager.factory.nbClass; i++)
         {
            inCache = AnimationManager.factoryCache.GetNbInCacheById(i);
            active = AnimationManager.instance.GetNbActiveById(i);
            child = this._mgrChild[i];
            if(inCache + active > 0)
            {
               AddChild(child);
               child.name = getQualifiedClassName(child.myClass).split("::")[1] + " (" + active + "/" + inCache + ")";
            }
            else
            {
               RemoveChild(child);
            }
            totActive += active;
            totInCache += inCache;
         }
         name = "Animation : " + " (" + totActive + "/" + totInCache + ")";
      }
   }
}

