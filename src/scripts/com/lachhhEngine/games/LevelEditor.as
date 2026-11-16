package com.lachhhEngine.games
{
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.levelEditor.CircleHelper;
   import com.lachhhEngine.games.levelEditor.LevelEditorHelperFactory;
   import com.lachhhEngine.games.levelEditor.LevelEditorHelperManager;
   import com.lachhhEngine.games.levelEditor.LevelEditorLayerBrowser;
   import com.lachhhEngine.games.levelEditor.LevelEditorToolBar;
   import com.lachhhEngine.games.levelEditor.LineHelper;
   import com.lachhhEngine.games.levelEditor.SwitchHelper;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaActor;
   import com.lachhhEngine.games.meta.metaObject.MetaCircle;
   import com.lachhhEngine.games.meta.metaObject.MetaGameEventSwitch;
   import com.lachhhEngine.games.meta.metaObject.MetaLevel;
   import com.lachhhEngine.games.meta.metaObject.MetaLine;
   import com.lachhhEngine.games.physique.Circle;
   import com.lachhhEngine.games.physique.Line;
   import com.lachhhEngine.games.physique.PhysicManager;
   import com.lachhhEngine.games.scenario.GameEventSwitch;
   import com.lachhhEngine.games.screens.ScreenFactory;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.KeyManager;
   import com.lachhhEngine.utils.Utils;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.SharedObject;
   import flash.ui.Keyboard;
   
   public class LevelEditor
   {
      
      public static var LINE_COL_GAP:int = 10;
      
      private const AUTOSAVE_PREFIX:String = "(AS)";
      
      private var _preview:Boolean;
      
      private var _lineHelperManager:LevelEditorHelperManager;
      
      private var _toolBar:LevelEditorToolBar;
      
      private var _saveObject:SharedObject;
      
      private var _levelLoadedCallback:Callback;
      
      private var _game:Game;
      
      private var _isDraggingHero:Boolean = false;
      
      private var _frameAutoSave:int = 360;
      
      private var _possibleLevels:Array;
      
      private var _selectedLayer:LevelLayer;
      
      private var _keyBoardLock:Boolean = false;
      
      private var _layerBrowser:LevelEditorLayerBrowser;
      
      public function LevelEditor(game:Game)
      {
         var lastLevel:XML;
         var metaLevel:MetaLevel = null;
         super();
         this._preview = false;
         this._game = game;
         this._layerBrowser = LevelEditorLayerBrowser(ScreenManager.instance.ShowScreen(ScreenFactory.LEVEL_EDITOR_LAYER_BROWSER));
         this._layerBrowser.InitLevelEditor(this);
         this._toolBar = LevelEditorToolBar(ScreenManager.instance.ShowScreen(ScreenFactory.LEVEL_EDITOR_TOOL_BAR));
         this._toolBar.InitFromLevelEditor(new Callback(this.UpdateFromToolBar,this,[]),this);
         this._lineHelperManager = new LevelEditorHelperManager(this._game,new LevelEditorHelperFactory(),this);
         this._possibleLevels = new Array();
         this._game.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
         this._game.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this._saveObject = SharedObject.getLocal("LEVEL_EDITOR");
         lastLevel = this._saveObject.data.lastLevel;
         try
         {
            if(lastLevel != null)
            {
               metaLevel = MetaManager.instance.CreateMetaLevel(lastLevel,this._game);
               this._possibleLevels.push(metaLevel);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public function ReInit(metaLevel:MetaLevel, callBackLevelLoaded:Callback, callbackProgress:Callback) : void
      {
         if(this._game.GetPlayer1() != null)
         {
            this._game.GetPlayer1().animationContainer.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickHero);
         }
         this._layerBrowser.DestroyLevel();
         this._lineHelperManager.DestroyAll();
         this._game.ReInit(metaLevel,new Callback(this.DoCallBackAndInit,this,[callBackLevelLoaded]),callbackProgress);
      }
      
      public function GetCompleteXML() : XML
      {
         var tabAllLayer:Array = this._game.levelManager.GetAllLayers();
         var oLevelXml:XML = <Level></Level>;
         var oStartPosXml:XML = <startPos></startPos>;
         oLevelXml.@levelEventId = this._game.levelManager.metaLevel.levelEventStr;
         oLevelXml.@Name = this._game.levelManager.metaLevel.name.split(this.AUTOSAVE_PREFIX).join("");
         oLevelXml.@visualStaticBack = this._game.levelManager.metaLevel.visualStaticBack;
         oStartPosXml.@hero1 = Math.round(this._game.GetPlayer1().px) + "~" + Math.round(this._game.GetPlayer1().py);
         oStartPosXml.@cameraPos = Math.round(this._game.camera.GetX()) + "~" + Math.round(this._game.camera.GetY()) + "~" + Math.round(this._game.camera.GetZ());
         oStartPosXml.@cameraBounds = this._game.levelManager.metaLevel.camBoundsLeft + "~" + this._game.levelManager.metaLevel.camBoundsRight + "~" + this._game.levelManager.metaLevel.camBoundsUp + "~" + this._game.levelManager.metaLevel.camBoundsDown;
         oLevelXml.appendChild(oStartPosXml);
         for(var i:int = 0; i < tabAllLayer.length; i++)
         {
            oLevelXml.appendChild(tabAllLayer[i].GetXmlLayer());
         }
         return oLevelXml;
      }
      
      private function AddAllHelpers() : void
      {
         var j:int = 0;
         var layer:LevelLayer = null;
         var allMetaLines:Array = null;
         var allMetaCircles:Array = null;
         var allMetaSwitch:Array = null;
         var metaLine:MetaLine = null;
         var metaCircle:MetaCircle = null;
         var metaSwitch:MetaGameEventSwitch = null;
         var allLayers:Array = this._game.levelManager.GetAllLayers();
         for(var i:int = 0; i < allLayers.length; i++)
         {
            j = 0;
            layer = allLayers[i];
            allMetaLines = layer.metaLayer.metaLines;
            allMetaCircles = layer.metaLayer.metaCircles;
            allMetaSwitch = layer.metaLayer.metaSwitch;
            for(j = 0; j < allMetaLines.length; j++)
            {
               metaLine = allMetaLines[j];
               this._lineHelperManager.AddLine(metaLine,layer.metaLayer);
            }
            for(j = 0; j < allMetaCircles.length; j++)
            {
               metaCircle = allMetaCircles[j];
               this._lineHelperManager.AddCircle(metaCircle,layer.metaLayer);
            }
            for(j = 0; j < allMetaSwitch.length; j++)
            {
               metaSwitch = allMetaSwitch[j];
               this._lineHelperManager.AddSwitch(metaSwitch,layer.metaLayer);
            }
         }
         this._lineHelperManager.CreateCamBounds();
      }
      
      public function SelectLayer(layer:LevelLayer) : void
      {
         var l:LevelLayer = null;
         var allLayers:Array = this._game.levelManager.GetAllLayers();
         for(var i:int = 0; i < allLayers.length; i++)
         {
            l = allLayers[i];
            l.visual.mouseChildren = l == layer;
            l.visual.mouseEnabled = l == layer;
         }
         this._selectedLayer = layer;
      }
      
      private function onAddSwitch(e:MouseEvent) : void
      {
         var mc:DisplayObject = DisplayObject(e.target);
         if(mc != this._selectedLayer.GetLevelPartContainer())
         {
            return;
         }
         if(this._keyBoardLock)
         {
            return;
         }
         var p:Point = KeyManager.GetMousePos();
         p = this._game.camera.ConvertPointToMoteur(p,this._game.actionLayer);
         var metaGameEventSwitch:MetaGameEventSwitch = MetaManager.instance.CreateMetaGameEventSwitch(this._selectedLayer.metaLayer,p.x,p.y,20,"ALLY_EVENT_TEAM");
         metaGameEventSwitch.canBeCached = false;
         metaGameEventSwitch.metaInfo.canBeCached = false;
         var gameEventSwitch:GameEventSwitch = this._game.gameEventManager.CreateGameEventSwitch(metaGameEventSwitch);
         var switchHelper:SwitchHelper = this._lineHelperManager.AddSwitch(metaGameEventSwitch,this._selectedLayer.metaLayer);
         this._selectedLayer.AddSwitch(gameEventSwitch);
         switchHelper.ScaleCircle();
      }
      
      public function AddPossibleLevel(metaLevel:MetaLevel) : void
      {
         this._possibleLevels.push(metaLevel);
      }
      
      private function onClickHero(e:MouseEvent) : void
      {
         this._isDraggingHero = true;
      }
      
      public function get levelLoadedCallback() : Callback
      {
         return this._levelLoadedCallback;
      }
      
      public function get keyBoardLock() : Boolean
      {
         return this._keyBoardLock;
      }
      
      public function Preview() : void
      {
         this._preview = !this._preview;
         if(this._preview)
         {
            this._game.Pause(false);
            this._game.camera.isManual = false;
            this._game.camera.SetBounds(this.game.metaLevel.camBoundsLeft,this.game.metaLevel.camBoundsRight,this.game.metaLevel.camBoundsUp,this.game.metaLevel.camBoundsDown);
         }
         else
         {
            this._game.Pause(true);
            this._game.camera.isManual = true;
            this._game.camera.Goto(this._game,this._game.GetPlayer1().px,this._game.GetPlayer1().py,1000);
            this._game.camera.SetBounds(-2000,10000,-2000,10000);
         }
      }
      
      public function set keyBoardLock(keyBoardLock:Boolean) : void
      {
         this._keyBoardLock = keyBoardLock;
      }
      
      private function UpdateFromToolBar() : void
      {
         if(this._toolBar.showLine)
         {
            this._lineHelperManager.ShowAllLines();
         }
         else
         {
            this._lineHelperManager.HideAllLines();
         }
         if(this._toolBar.showPoint)
         {
            this._lineHelperManager.ShowAllCircles();
         }
         else
         {
            this._lineHelperManager.HideAllCircles();
         }
         if(this._toolBar.showEvent)
         {
            this._lineHelperManager.ShowAllSwitch();
         }
         else
         {
            this._lineHelperManager.HideAllSwitchircles();
         }
         if(this._toolBar.addLine)
         {
            this._game.addEventListener(MouseEvent.MOUSE_DOWN,this.onAddLine);
            this._game.buttonMode = true;
         }
         else
         {
            this._game.removeEventListener(MouseEvent.MOUSE_DOWN,this.onAddLine);
            this._game.buttonMode = false;
         }
         if(this._toolBar.addPoint)
         {
            this._game.addEventListener(MouseEvent.MOUSE_DOWN,this.onAddPoint);
            this._game.buttonMode = true;
         }
         else
         {
            this._game.removeEventListener(MouseEvent.MOUSE_DOWN,this.onAddPoint);
            this._game.buttonMode = false;
         }
         if(this._toolBar.addEvent)
         {
            this._game.addEventListener(MouseEvent.MOUSE_DOWN,this.onAddSwitch);
            this._game.buttonMode = true;
         }
         else
         {
            this._game.removeEventListener(MouseEvent.MOUSE_DOWN,this.onAddSwitch);
            this._game.buttonMode = false;
         }
         if(this._toolBar.setOffset)
         {
            this._game.buttonMode = true;
         }
         else
         {
            this._game.buttonMode = false;
         }
      }
      
      public function AddPlayerFromMeta(metaHero:MetaActor, fromLevelLoaded:Boolean) : void
      {
         this._game.AddPlayerFromMeta(metaHero,fromLevelLoaded);
         this._game.GetPlayer1().animationContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickHero);
         this._game.GetPlayer1().animationContainer.buttonMode = true;
         this._game.camera.SetDynamicFollow(this._game.GetPlayer1());
      }
      
      private function InitLevel() : void
      {
         this._game.Pause(true);
         this._game.camera.isManual = true;
         this._game.camera.Goto(this._game,this._game.metaLevel.heroPos.x,this._game.metaLevel.heroPos.y,1000);
         this._game.camera.SetBounds(-2000,10000,-2000,10000);
         this._layerBrowser.InitLevel(this._game.levelManager.GetAllLayers());
         this.AddAllHelpers();
      }
      
      private function DoCallBackAndInit(c:Callback) : void
      {
         this.InitLevel();
         c.DoCallback();
      }
      
      public function get possibleLevels() : Array
      {
         return this._possibleLevels;
      }
      
      private function onMouseUp(e:MouseEvent) : void
      {
         this._isDraggingHero = false;
      }
      
      private function UpdateKeyboardShortcut() : void
      {
         if(KeyManager.IsKeyPressed(86))
         {
            this._toolBar.ToggleAddLine();
         }
      }
      
      public function get toolBar() : LevelEditorToolBar
      {
         return this._toolBar;
      }
      
      private function onAddLine(e:MouseEvent) : void
      {
         if(this._keyBoardLock)
         {
            return;
         }
         var p:Point = KeyManager.GetMousePos();
         if(p.x > 700 || p.y > 550)
         {
            return;
         }
         p = this._game.camera.ConvertPointToMoteur(p,this._game.actionLayer);
         p.x = Utils.RoundOn(p.x,LINE_COL_GAP);
         p.y = Utils.RoundOn(p.y,LINE_COL_GAP);
         var line:Line = PhysicManager.instance.CreateLine(p.x,p.x,p.y,p.y,false,false);
         line.canBeCached = false;
         line.metaInfo.canBeCached = false;
         var lineHelper:LineHelper = this._lineHelperManager.AddLine(MetaLine(line.metaInfo),this._selectedLayer.metaLayer);
         this._selectedLayer.AddLine(line);
         lineHelper.DragPoint(lineHelper.point2);
      }
      
      public function Update() : void
      {
         var mousePos:Point = null;
         var pos:Point = null;
         if(!this._game.isInit)
         {
            return;
         }
         var vx:int = 0;
         var vy:int = 0;
         if(!this._keyBoardLock && !this._preview)
         {
            if(KeyManager.IsKeyDown(37) || KeyManager.IsKeyDown(65))
            {
               vx = -20;
            }
            if(KeyManager.IsKeyDown(38) || KeyManager.IsKeyDown(87))
            {
               vy = -20;
            }
            if(KeyManager.IsKeyDown(39) || KeyManager.IsKeyDown(68))
            {
               vx = 20;
            }
            if(KeyManager.IsKeyDown(40) || KeyManager.IsKeyDown(83))
            {
               vy = 20;
            }
            this._game.camera.MoveOf(this._game,vx,vy,0,1,1,1);
            this._selectedLayer.visual.buttonMode = KeyManager.IsKeyDown(Keyboard.SPACE);
            if(KeyManager.IsKeyDown(Keyboard.SPACE) && KeyManager.IsMouseDown() && !this._isDraggingHero)
            {
               this._game.camera.MoveOf(this._game,-KeyManager.GetMouseMove().x * (this._game.camera.GetZ() / 1000),-KeyManager.GetMouseMove().y * (this._game.camera.GetZ() / 1000),0,1,1,1);
            }
            if(KeyManager.IsMouseDown() && this._toolBar.setOffset)
            {
               this._selectedLayer.xOffset += KeyManager.GetMouseMove().x;
               this._selectedLayer.yOffset += KeyManager.GetMouseMove().y;
            }
         }
         if(this._isDraggingHero)
         {
            mousePos = KeyManager.GetMousePos();
            pos = this._game.camera.ConvertPointToMoteur(mousePos,this._game.GetPlayer1().layer);
            this._game.GetPlayer1().px = pos.x;
            this._game.GetPlayer1().py = pos.y;
         }
         this._lineHelperManager.Update(this._game);
         if(!this._keyBoardLock)
         {
            if(this._lineHelperManager.selectedLine != null)
            {
               if(KeyManager.IsKeyPressed(Keyboard.DELETE))
               {
                  this._lineHelperManager.DestroyLine(this._lineHelperManager.selectedLine);
               }
            }
            if(this._lineHelperManager.selectedCircle != null)
            {
               if(KeyManager.IsKeyPressed(Keyboard.DELETE))
               {
                  this._lineHelperManager.DestroyCircle(this._lineHelperManager.selectedCircle);
               }
            }
            if(this._lineHelperManager.selectedSwitch != null)
            {
               if(KeyManager.IsKeyPressed(Keyboard.DELETE))
               {
                  this._lineHelperManager.DestroySwitch(this._lineHelperManager.selectedSwitch);
               }
            }
            this.UpdateKeyboardShortcut();
         }
         --this._frameAutoSave;
         if(this._frameAutoSave < 0)
         {
            this._frameAutoSave = 360;
            this.SaveLastLevel();
         }
      }
      
      public function ShowLoadLevelScreen(callbackLevelLoaded:Callback) : void
      {
         this._levelLoadedCallback = callbackLevelLoaded;
         this._toolBar.ShowLoadLevel(this._possibleLevels,this._levelLoadedCallback);
      }
      
      private function onAddPoint(e:MouseEvent) : void
      {
         var mc:DisplayObject = DisplayObject(e.target);
         if(mc != this._selectedLayer.GetLevelPartContainer())
         {
            return;
         }
         if(this._keyBoardLock)
         {
            return;
         }
         var p:Point = KeyManager.GetMousePos();
         p = this._game.camera.ConvertPointToMoteur(p,this._game.actionLayer);
         p.x = Utils.RoundOn(p.x,LINE_COL_GAP);
         p.y = Utils.RoundOn(p.y,LINE_COL_GAP);
         var circle:Circle = PhysicManager.instance.CreateCircle(p.x,p.y,20);
         circle.canBeCached = false;
         circle.metaInfo.canBeCached = false;
         var circleHelper:CircleHelper = this._lineHelperManager.AddCircle(MetaCircle(circle.metaInfo),this._selectedLayer.metaLayer);
         this._selectedLayer.AddCircle(circle);
         circleHelper.ScaleCircle();
      }
      
      public function SaveLastLevel() : void
      {
         var lastLevel:XML = this.GetCompleteXML().copy();
         var levelName:String = lastLevel.@Name;
         if(levelName.indexOf(this.AUTOSAVE_PREFIX) == -1)
         {
            lastLevel.@Name = this.AUTOSAVE_PREFIX + lastLevel.@Name;
         }
         this._saveObject.data.lastLevel = lastLevel;
         this._saveObject.flush();
      }
      
      public function get game() : Game
      {
         return this._game;
      }
      
      private function onSetOffset(e:MouseEvent) : void
      {
      }
      
      private function onMouseWheel(e:MouseEvent) : void
      {
         var delta:int = e.delta;
         if(KeyManager.IsMouseDown())
         {
            this._selectedLayer.SetZ(this._selectedLayer.GetZ() - delta * 50);
         }
         else
         {
            this._game.camera.MoveOf(this._game,0,0,-delta * 50,1,1,1);
         }
      }
   }
}

