package com.lachhhEngine.games.debug
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.sfx.SfxManager;
   import flash.utils.getQualifiedClassName;
   
   public class DebugSfxManagerTree extends DebugTree
   {
      
      private var _mgrChild:Array;
      
      public function DebugSfxManagerTree()
      {
         var child:DebugManagerTreeChild = null;
         super();
         this._mgrChild = new Array();
         for(var i:int = 0; i < SfxManager.factory.nbClass; i++)
         {
            child = new DebugManagerTreeChild(SfxManager.factory.GetClassAt(i));
            child.name = getQualifiedClassName(SfxManager.factory.GetClassAt(i));
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
         for(var i:int = 0; i < SfxManager.factory.nbClass; i++)
         {
            inCache = SfxManager.factoryCache.GetNbInCacheById(i);
            active = SfxManager.instance.GetNbActiveById(i);
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
         name = "Sfx : " + " (" + totActive + "/" + totInCache + ")";
      }
   }
}

