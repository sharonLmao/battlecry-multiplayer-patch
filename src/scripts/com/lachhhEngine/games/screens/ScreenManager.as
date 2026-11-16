package com.lachhhEngine.games.screens
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaScreen;
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.utils.Utils;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.net.URLRequest;
   import flash.ui.ContextMenu;
   
   public class ScreenManager extends FactoryObjectManager
   {
      
      private static var _instance:ScreenManager;
      
      private var _screenSuitePlaying:Screen;
      
      private var _playingSuite:Boolean = false;
      
      private var _suiteScreens:Array;
      
      private var _topScreens:MovieClip;
      
      private var _ciDebug:ContextMenuItemWithCallback;
      
      private var _contextMenuItems:Array;
      
      private var _bottomScreens:MovieClip;
      
      private var _debugScreen:DebugScreen;
      
      private var _ciBerzerkStudio:ContextMenuItemWithCallback;
      
      private var _aScreen:Array;
      
      private var _middleScreens:MovieClip;
      
      private var _screenContainer:DisplayObjectContainer;
      
      public function ScreenManager(context:MainGame, screenContainer:DisplayObjectContainer, screenFactory:ScreenFactory, game:Game)
      {
         var cm:ContextMenu = null;
         var version:ContextMenuItemWithCallback = null;
         this._aScreen = new Array();
         this._suiteScreens = new Array();
         super(screenFactory,MetaScreen,Screen,game,"Screen");
         if(_instance != null)
         {
            throw new Error("ScreenManager already instanciated : Use ScreenManager.instance");
         }
         _instance = this;
         this._contextMenuItems = new Array();
         this._screenContainer = screenContainer;
         this._topScreens = new MovieClip();
         this._middleScreens = new MovieClip();
         this._bottomScreens = new MovieClip();
         this._screenContainer.addChild(this._bottomScreens);
         this._screenContainer.addChild(this._middleScreens);
         this._screenContainer.addChild(this._topScreens);
         if(!VersionInfo.isIphoneVersion)
         {
            cm = new ContextMenu();
            cm.hideBuiltInItems();
            context.contextMenu = cm;
            if(VersionInfo.versionInfo != "")
            {
               version = new ContextMenuItemWithCallback("Version " + VersionInfo.versionInfo,false,false);
               this.AddContextMenuItem(context,version);
            }
            this._ciBerzerkStudio = new ContextMenuItemWithCallback("Developed by Berzerk Studio",true,true,true,new Callback(this.OnBerzerkStudio,this,null));
            this._ciDebug = new ContextMenuItemWithCallback("Show Lachhh debug",true,true,true,new Callback(this.OnDebug,this,null));
            if(VersionInfo.debugVersion)
            {
               this.AddContextMenuItem(context,this._ciDebug);
            }
            this.AddContextMenuItem(context,this._ciBerzerkStudio);
            this.AddContextMenuItem(context,VersionInfo.sponsorContextMenuItem);
         }
      }
      
      public static function get instance() : ScreenManager
      {
         return _instance;
      }
      
      public function CloseScreen(s:Screen) : void
      {
         s.state = Screen.STATE_CLOSING;
         s.RemoveListeners();
      }
      
      public function CreateFlashScreen(color:uint, frame:int) : FlashScreen
      {
         var f:FlashScreen = FlashScreen(this.ShowScreen(ScreenFactory.FLASH_SCREEN));
         f.InitFlash(color,frame);
         return f;
      }
      
      public function GetContextMenuItem(context:MainGame, i:int) : ContextMenuItemWithCallback
      {
         if(i < 0 || i >= context.contextMenu.customItems.length)
         {
            return null;
         }
         return context.contextMenu.customItems[i];
      }
      
      public function CreateMetaScreen(iScreen:int, belowAll:Boolean = false, alwaysOnTop:Boolean = false) : MetaScreen
      {
         var metaScreen:MetaScreen = MetaManager.instance.CreateMetaScreen(iScreen);
         metaScreen.belowAll = belowAll;
         metaScreen.aboveAll = alwaysOnTop;
         return metaScreen;
      }
      
      private function OnDebug() : void
      {
         if(this._debugScreen == null)
         {
            this._debugScreen = DebugScreen(this.ShowScreen(ScreenFactory.DEBUG_SCREEN,false,true));
            this._ciDebug.contextMenuItem.caption = "Hide Lachhh debug";
         }
         else
         {
            this.CloseScreen(this._debugScreen);
            this._debugScreen = null;
            this._ciDebug.contextMenuItem.caption = "Show Lachhh debug";
         }
      }
      
      public function ShowSuiteScreenFromMeta(metaScreens:Array) : void
      {
         this._suiteScreens = this._suiteScreens.concat(metaScreens);
         this.StartSuite();
      }
      
      private function RemoveScreenFromArray(s:Screen) : void
      {
         for(var i:int = 0; i < this._aScreen.length; i++)
         {
            if(this._aScreen[i] == s)
            {
               this._aScreen.splice(i,1);
               return;
            }
         }
      }
      
      public function ShowCheatScreen() : void
      {
         if(GetNbActiveById(ScreenFactory.CHEAT_SCREEN) <= 0)
         {
            this.ShowScreen(ScreenFactory.CHEAT_SCREEN,false,true);
         }
      }
      
      public function ShowScreenFromMeta(metaScreen:MetaScreen) : Screen
      {
         var s:Screen = Screen(Create(metaScreen));
         if(metaScreen.belowAll)
         {
            this._bottomScreens.addChildAt(s.visual,0);
         }
         else if(metaScreen.aboveAll)
         {
            this._topScreens.addChild(s.visual);
         }
         else
         {
            this._middleScreens.addChild(s.visual);
         }
         this._aScreen.push(s);
         return s;
      }
      
      public function StartSuite() : void
      {
         if(this._playingSuite)
         {
            return;
         }
         this._playingSuite = true;
         this.ShowNextScreen();
      }
      
      private function OnBerzerkStudio() : void
      {
         if(VersionInfo.canHaveExternalLinks)
         {
            Utils.navigateToURLAndRecord(new URLRequest(VersionInfo.URL_SITE_BERZERK),"_blank");
         }
      }
      
      private function RemoveScreenFromContainer(s:Screen) : void
      {
         Utils.LazyRemoveFromParent(s.visual);
      }
      
      public function AddContextMenuItem(context:MainGame, contextMenuItem:ContextMenuItemWithCallback) : void
      {
         var cm:ContextMenu = context.contextMenu;
         cm.customItems.push(contextMenuItem.contextMenuItem);
         this._contextMenuItems.push(contextMenuItem);
      }
      
      public function ShowScreen(iScreen:int, belowAll:Boolean = false, alwaysOnTop:Boolean = false) : Screen
      {
         var metaScreen:MetaScreen = this.CreateMetaScreen(iScreen,belowAll,alwaysOnTop);
         return this.ShowScreenFromMeta(metaScreen);
      }
      
      public function IsOnStage(s:Screen) : Boolean
      {
         return Utils.IsInArray(this._aScreen,s);
      }
      
      public function RemoveScreen(s:Screen) : void
      {
         if(s.visual != null && s.metaInfo != null)
         {
            this.RemoveScreenFromArray(s);
            this.RemoveScreenFromContainer(s);
            Destroy(s);
            if(s == this._screenSuitePlaying)
            {
               this.ShowNextScreen();
            }
         }
      }
      
      public function Update(context:MainGame) : void
      {
         var s:Screen = null;
         for(var i:int = 0; i < this._aScreen.length; i++)
         {
            s = this._aScreen[i];
            s.Update(context);
         }
      }
      
      private function ShowNextScreen() : void
      {
         var metaScreen:MetaScreen = null;
         if(this._suiteScreens.length <= 0)
         {
            this._playingSuite = false;
         }
         else
         {
            metaScreen = this._suiteScreens.shift();
            this._screenSuitePlaying = this.ShowScreenFromMeta(metaScreen);
         }
      }
      
      public function RefreshAll() : void
      {
         var s:Screen = null;
         for(var i:int = 0; i < this._aScreen.length; i++)
         {
            s = this._aScreen[i];
            s.Refresh();
         }
      }
      
      public function ShowSuiteScreen(iScreens:Array) : void
      {
         var metaScreen:MetaScreen = null;
         var metaScreens:Array = new Array();
         for(var i:int = 0; i < iScreens.length; i++)
         {
            metaScreen = this.CreateMetaScreen(iScreens[i],false,false);
            metaScreens.push(metaScreen);
         }
         this._suiteScreens = this._suiteScreens.concat(metaScreens);
         this.StartSuite();
      }
   }
}

