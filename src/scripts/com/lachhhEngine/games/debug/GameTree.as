package com.lachhhEngine.games.debug
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.physique.PhysicManager;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.files.FileManager;
   import com.lachhhEngine.io.stats.StatsGroup;
   import flash.geom.Point;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class GameTree
   {
      
      private static var _text:String;
      
      private static var _callbacks:Array;
      
      private static var _miscChild:DebugTree;
      
      private static var _debugTree:DebugTree;
      
      private static var _msChild:DebugTree;
      
      private static var _fpsChild:DebugTree;
      
      private static var _statsChild:DebugTree;
      
      private static var _memChild:DebugTree;
      
      private static var _objPos:Point;
      
      private static var _logicChild:DebugTree;
      
      private static var _nFrame:Number;
      
      private static var _initTime:Number = -1;
      
      private static var _timeNow:Number = -1;
      
      private static var _timeDif:Number = -1;
      
      private static var _nFPS:Number = 60;
      
      public function GameTree()
      {
         super();
      }
      
      private static function NbUpdatable(context:Game, child:DebugTree) : void
      {
         child.name = "IUpdatable : " + context.GetNBUpdatable();
      }
      
      public static function AddChildWithCallBack(fct:Function, scope:Object, context:Game) : void
      {
         if(_miscChild == null)
         {
            Init(context);
         }
         var child:DebugTree = AddChildAt("",_miscChild);
         child.updateCallBack = new Callback(fct,scope,[context,child]);
      }
      
      private static function LoaderInfo(context:Game, child:DebugTree) : void
      {
         if(context.root != null && context.root.loaderInfo != null)
         {
            child.name = "SiteUrl : " + context.root.loaderInfo.url;
         }
      }
      
      public static function Update(context:Game) : void
      {
         var i:int = 0;
         if(context == null)
         {
            return;
         }
         Init(context);
         _debugTree.Update(context);
         _timeDif = getTimer() - _timeNow;
         _timeNow = getTimer();
         var strMem:* = Number(System.totalMemory / 1024 / 1024).toFixed(2) + " Mb";
         _fpsChild.name = "FPS : " + _nFPS;
         _memChild.name = "MEM : " + strMem;
         ++_nFrame;
         if(_timeNow - _initTime >= 1000)
         {
            _nFPS = _nFrame;
            _initTime = getTimer();
            _nFrame = 0;
         }
         if(StatsGroup.allStatsGroup.length > _statsChild.numChild)
         {
            _statsChild.RemoveAllChild();
            for(i = 0; i < StatsGroup.allStatsGroup.length; i++)
            {
               AddStats(StatsGroup.allStatsGroup[i]);
            }
         }
      }
      
      public static function DoCallback(msg:String) : void
      {
         var d:DebugCallback = null;
         for(var i:int = 0; i < _callbacks.length; i++)
         {
            d = _callbacks[i];
            if(msg.toLowerCase().indexOf(d.msg.toLowerCase()) != -1)
            {
               d.DoCallbackWithMsg(msg);
               return;
            }
         }
      }
      
      private static function MousePos(context:Game, child:DebugTree) : void
      {
         _objPos.x = context.mouseX;
         _objPos.y = context.mouseY;
         if(context.actionLayer != null && context.actionLayer.metaLayer != null)
         {
            _objPos = context.camera.ConvertPointToMoteur(_objPos,context.actionLayer);
         }
         child.name = "Mouse Position : " + "(" + Math.round(_objPos.x) + "," + Math.round(_objPos.y) + "," + Math.round(context.camera.GetZ()) + ")";
      }
      
      public static function AddSfxChild() : void
      {
         var child:DebugSfxManagerTree = new DebugSfxManagerTree();
         _logicChild.AddChild(child);
      }
      
      private static function NbHeroLineInView(context:Game, child:DebugTree) : void
      {
         if(context.GetPlayer1() != null)
         {
            child.name = "Hero Lines : " + context.GetPlayer1().GetLineInView().length;
         }
      }
      
      public static function get msChild() : DebugTree
      {
         return _msChild;
      }
      
      public static function AddManagerChild(manager:FactoryObjectManager) : void
      {
         var child:DebugManagerTree = new DebugManagerTree(manager);
         child.managerName = manager.name;
         _logicChild.AddChild(child);
      }
      
      public static function AddAnimationChild() : void
      {
         var child:DebugAnimationManagerTree = new DebugAnimationManagerTree();
         _logicChild.AddChild(child);
      }
      
      public static function AddStats(statsGroup:StatsGroup) : void
      {
         _statsChild.AddChild(new DebugStatsTree(statsGroup));
      }
      
      private static function AddChildAt(name:String, parent:DebugTree) : DebugTree
      {
         var child:DebugTree = new DebugTree();
         child.name = name;
         parent.AddChild(child);
         return child;
      }
      
      private static function NbHeroCircleInView(context:Game, child:DebugTree) : void
      {
         if(context.GetPlayer1() != null)
         {
            child.name = "Hero Circles : " + context.GetPlayer1().GetPointInView().length;
         }
      }
      
      private static function ClearSaveFile(s:String) : void
      {
         FileManager.instance.Clear();
         ExternalAPIManager.getSavedFileAPI().ClearData();
      }
      
      public static function Init(context:Game) : void
      {
         if(_debugTree != null)
         {
            return;
         }
         _debugTree = new DebugTree();
         _debugTree.name = "Debug";
         _debugTree.Open();
         var visualChild:DebugLevelTree = new DebugLevelTree();
         AddChildAt("Logical Managers",_debugTree);
         _debugTree.AddChild(visualChild);
         AddChildAt("Misc.",_debugTree);
         AddChildAt("Stats.",_debugTree);
         AddChildAt("Time Profiler",_debugTree);
         _logicChild = _debugTree.GetChildAt(0);
         _miscChild = _debugTree.GetChildAt(2);
         _statsChild = _debugTree.GetChildAt(3);
         _msChild = _debugTree.GetChildAt(4);
         AddAnimationChild();
         AddManagerChild(context.ammoManager);
         AddManagerChild(context.behaviorManager);
         AddManagerChild(context.gameEffectManager);
         AddManagerChild(context.enemyManager);
         AddManagerChild(PhysicManager.instance);
         AddManagerChild(context.heroManager);
         AddManagerChild(context.itemManager);
         AddManagerChild(context.gameEventManager);
         AddSfxChild();
         AddManagerChild(MetaManager.instance);
         AddManagerChild(ScreenManager.instance);
         AddManagerChild(context.weaponManager);
         _fpsChild = new DebugTree();
         _miscChild.AddChild(_fpsChild);
         _memChild = new DebugTree();
         _miscChild.AddChild(_memChild);
         AddChildWithCallBack(NbUpdatable,GameTree,context);
         AddChildWithCallBack(MousePos,GameTree,context);
         AddChildWithCallBack(NbLevelPart,GameTree,context);
         AddChildWithCallBack(NbHeroLineInView,GameTree,context);
         AddChildWithCallBack(NbHeroCircleInView,GameTree,context);
         AddChildWithCallBack(LoaderInfo,GameTree,context);
         for(var i:int = 0; i < StatsGroup.allStatsGroup.length; i++)
         {
            AddStats(StatsGroup.allStatsGroup[i]);
         }
         _miscChild.Open();
         _objPos = new Point();
         _initTime = getTimer();
         _timeNow = getTimer();
         _timeDif = getTimer();
         _callbacks = new Array();
         AddDebugCallback(new DebugCallback("clearsave",ClearSaveFile,GameTree,[null]));
      }
      
      private static function NbLevelPart(context:Game, child:DebugTree) : void
      {
         if(context.actionLayer != null)
         {
            child.name = "Level Parts : " + context.actionLayer.GetLevelPartContainer().numChildren;
         }
      }
      
      public static function AddDebugCallback(d:DebugCallback) : void
      {
         _callbacks.push(d);
      }
      
      public static function GetTree(context:Game) : DebugTree
      {
         Init(context);
         return _debugTree;
      }
   }
}

