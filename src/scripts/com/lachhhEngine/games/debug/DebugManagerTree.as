package com.lachhhEngine.games.debug
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import flash.utils.getQualifiedClassName;
   
   public class DebugManagerTree extends DebugTree
   {
      
      private var _mgr:FactoryObjectManager;
      
      private var _mgrChild:Array;
      
      private var _managerName:String;
      
      public function DebugManagerTree(mgr:FactoryObjectManager)
      {
         var child:DebugManagerTreeChild = null;
         super();
         this._mgr = mgr;
         this._mgrChild = new Array();
         for(var i:int = 0; i < this._mgr.factory.nbClass; i++)
         {
            child = new DebugManagerTreeChild(this._mgr.factory.GetClassAt(i));
            this._mgrChild.push(child);
         }
      }
      
      public function set managerName(managerName:String) : void
      {
         this._managerName = managerName;
      }
      
      override public function Update(context:Game) : void
      {
         var inCache:int = 0;
         var active:int = 0;
         var child:DebugManagerTreeChild = null;
         super.Update(context);
         var totActive:int = 0;
         var totInCache:int = 0;
         for(var i:int = 0; i < this._mgr.factory.nbClass; i++)
         {
            inCache = this._mgr.factoryCache.GetNbInCacheById(i);
            active = this._mgr.GetNbActiveById(i);
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
         name = this._managerName + " (" + totActive + "/" + totInCache + ")";
      }
      
      public function get managerName() : String
      {
         return this._managerName;
      }
   }
}

