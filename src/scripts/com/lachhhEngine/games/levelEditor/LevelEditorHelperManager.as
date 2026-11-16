package com.lachhhEngine.games.levelEditor
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.LevelEditor;
   import com.lachhhEngine.games.factory.FactoryObject;
   import com.lachhhEngine.games.factory.FactoryObjectManager;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaCircle;
   import com.lachhhEngine.games.meta.metaObject.MetaGameEventSwitch;
   import com.lachhhEngine.games.meta.metaObject.MetaLayer;
   import com.lachhhEngine.games.meta.metaObject.MetaLevel;
   import com.lachhhEngine.games.meta.metaObject.MetaLine;
   import com.lachhhEngine.games.meta.metaObject.levelEditor.MetaCamBoundsHelper;
   import com.lachhhEngine.games.meta.metaObject.levelEditor.MetaCircleHelper;
   import com.lachhhEngine.games.meta.metaObject.levelEditor.MetaLineHelper;
   import com.lachhhEngine.games.meta.metaObject.levelEditor.MetaSwitchHelper;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.games.scenario.GameEventSwitch;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.utils.Utils;
   
   public class LevelEditorHelperManager extends FactoryObjectManager
   {
      
      private var _lines:Array;
      
      private var _selectedSwitch:SwitchHelper;
      
      private var _levelEditor:LevelEditor;
      
      private var _selectedLine:LineHelper;
      
      private var _switchs:Array;
      
      private var _circles:Array;
      
      private var _selectedCircle:CircleHelper;
      
      private var _camBoundsHelper:CamBoundsHelper;
      
      public function LevelEditorHelperManager(context:Game, levelEditorFactory:LevelEditorHelperFactory, levelEditor:LevelEditor)
      {
         super(levelEditorFactory,MetaObject,FactoryObject,context);
         this._levelEditor = levelEditor;
         this._lines = new Array();
         this._circles = new Array();
         this._switchs = new Array();
      }
      
      public function HideAllSwitchircles() : void
      {
         this.HideAll(this._switchs);
      }
      
      private function ShowAll(a:Array) : void
      {
         var l:Actor = null;
         for(var i:int = 0; i < a.length; i++)
         {
            l = a[i];
            if(l.animationContainer.parent == null)
            {
               l.layer.GetDebugContainer().addChild(l.animationContainer);
            }
         }
      }
      
      private function CreateLineHelper(x:int, y:int, metaLayer:MetaLayer, metaLine:MetaLine) : LineHelper
      {
         var metaLineHelper:MetaLineHelper = null;
         metaLineHelper = MetaManager.instance.CreateMetaLineHelper(x,y,metaLayer,metaLine);
         metaLineHelper.instanceType = LevelEditorHelperFactory(factory).ID_LINE_HELPER;
         return LineHelper(Create(metaLineHelper));
      }
      
      public function ShowAllCircles() : void
      {
         this.ShowAll(this._circles);
      }
      
      private function onClickCircleHelper(circleHelper:CircleHelper) : void
      {
         this.DeselectAll();
         this._selectedCircle = circleHelper;
         this._selectedCircle.Select();
      }
      
      public function DestroyCircle(circleHelper:CircleHelper) : void
      {
         if(this._selectedCircle == circleHelper)
         {
            this._selectedCircle = null;
         }
         circleHelper.layer.RemoveCircle(circleHelper.circle);
         context.camera.RemoveActeur(circleHelper);
         Utils.LazyRemoveFromParent(circleHelper.animationContainer);
         Utils.RemoveFromArray(this._circles,circleHelper);
         this.DestroyHelperObject(circleHelper);
      }
      
      private function DeselectAll() : void
      {
         if(this._selectedLine != null)
         {
            this._selectedLine.Deselect();
         }
         if(this._selectedCircle != null)
         {
            this._selectedCircle.Deselect();
         }
         if(this._selectedSwitch != null)
         {
            this._selectedSwitch.Deselect();
         }
         this._selectedLine = null;
         this._selectedCircle = null;
         this._selectedSwitch = null;
      }
      
      private function onClickSwitchHelper(switchHelper:SwitchHelper) : void
      {
         this.DeselectAll();
         this._selectedSwitch = switchHelper;
         this._selectedSwitch.Select();
      }
      
      public function HideAllCircles() : void
      {
         this.HideAll(this._circles);
      }
      
      public function DestroyHelperObject(helperObj:FactoryObject) : void
      {
         Destroy(helperObj);
      }
      
      public function get levelEditor() : LevelEditor
      {
         return this._levelEditor;
      }
      
      private function CreateCircleHelper(x:int, y:int, metaLayer:MetaLayer, metaCircle:MetaCircle) : CircleHelper
      {
         var metaCircleHelper:MetaCircleHelper = MetaManager.instance.CreateMetaCircleHelper(x,y,metaLayer,metaCircle);
         metaCircleHelper.instanceType = LevelEditorHelperFactory(factory).ID_CIRCLE_HELPER;
         return CircleHelper(Create(metaCircleHelper));
      }
      
      public function ShowAllLines() : void
      {
         this.ShowAll(this._lines);
      }
      
      private function HideAll(a:Array) : void
      {
         var l:Actor = null;
         for(var i:int = 0; i < a.length; i++)
         {
            l = a[i];
            Utils.LazyRemoveFromParent(l.animationContainer);
         }
      }
      
      public function HideAllLines() : void
      {
         this.HideAll(this._lines);
      }
      
      public function CreateCamBounds() : void
      {
         var camBoundsHelper:CamBoundsHelper = this.CreateCamBoundsHelper(context.actionLayer.metaLayer,context.levelManager.metaLevel);
         var layer:LevelLayer = LevelLayer(context.actionLayer);
         layer.GetDebugContainer().addChild(camBoundsHelper.animationContainer);
         context.camera.AddActeur(camBoundsHelper);
         if(this._camBoundsHelper != null)
         {
            this.DestroyCamBounds();
         }
         this._camBoundsHelper = camBoundsHelper;
      }
      
      public function DestroyAll() : void
      {
         while(this._lines.length > 0)
         {
            this.DestroyHelperObject(this._lines.shift());
         }
         while(this._circles.length > 0)
         {
            this.DestroyHelperObject(this._circles.shift());
         }
         while(this._switchs.length > 0)
         {
            this.DestroyHelperObject(this._switchs.shift());
         }
         this._selectedLine = null;
         this._selectedCircle = null;
         this._selectedSwitch = null;
         this.DestroyCamBounds();
      }
      
      public function get selectedSwitch() : SwitchHelper
      {
         return this._selectedSwitch;
      }
      
      public function Update(context:Game) : void
      {
         var i:int = 0;
         var l:LineHelper = null;
         var c:CircleHelper = null;
         var s:SwitchHelper = null;
         for(i = 0; i < this._lines.length; i++)
         {
            l = this._lines[i];
            l.Update(context);
         }
         for(i = 0; i < this._circles.length; i++)
         {
            c = this._circles[i];
            c.Update(context);
         }
         for(i = 0; i < this._switchs.length; i++)
         {
            s = this._switchs[i];
            s.Update(context);
         }
         if(this._camBoundsHelper != null)
         {
            this._camBoundsHelper.Update(context);
         }
      }
      
      public function AddLine(metaLine:MetaLine, metaLayer:MetaLayer) : LineHelper
      {
         var lineHelper:LineHelper = this.CreateLineHelper(metaLine.x1,metaLine.y1,metaLayer,metaLine);
         var layer:LevelLayer = LevelLayer(metaLayer.factoryObject);
         layer.GetDebugContainer().addChild(lineHelper.animationContainer);
         context.camera.AddActeur(lineHelper);
         lineHelper.clickCallBack = new Callback(this.OnClickLineHelper,this,[lineHelper]);
         lineHelper.mgr = this;
         this._lines.push(lineHelper);
         return lineHelper;
      }
      
      public function DestroyLine(lineHelper:LineHelper) : void
      {
         if(this._selectedLine == lineHelper)
         {
            this._selectedLine = null;
         }
         lineHelper.layer.RemoveLine(lineHelper.line);
         context.camera.RemoveActeur(lineHelper);
         Utils.LazyRemoveFromParent(lineHelper.animationContainer);
         Utils.RemoveFromArray(this._lines,lineHelper);
         this.DestroyHelperObject(lineHelper);
      }
      
      public function get selectedLine() : LineHelper
      {
         return this._selectedLine;
      }
      
      public function ShowAllSwitch() : void
      {
         this.ShowAll(this._switchs);
      }
      
      public function AddCircle(metaCircle:MetaCircle, metaLayer:MetaLayer) : CircleHelper
      {
         var circleHelper:CircleHelper = this.CreateCircleHelper(metaCircle.x,metaCircle.y,metaLayer,metaCircle);
         var layer:LevelLayer = LevelLayer(metaLayer.factoryObject);
         layer.GetDebugContainer().addChild(circleHelper.animationContainer);
         context.camera.AddActeur(circleHelper);
         circleHelper.clickCallBack = new Callback(this.onClickCircleHelper,this,[circleHelper]);
         this._circles.push(circleHelper);
         return circleHelper;
      }
      
      private function OnClickLineHelper(lineHelper:LineHelper) : void
      {
         this.DeselectAll();
         this._selectedLine = lineHelper;
         this._selectedLine.Select();
      }
      
      public function DestroySwitch(switchHelper:SwitchHelper) : void
      {
         if(this._selectedSwitch == switchHelper)
         {
            this._selectedSwitch = null;
         }
         switchHelper.layer.RemoveSwitch(GameEventSwitch(switchHelper.circle));
         context.camera.RemoveActeur(switchHelper);
         Utils.LazyRemoveFromParent(switchHelper.animationContainer);
         Utils.RemoveFromArray(this._switchs,switchHelper);
         this.DestroyHelperObject(switchHelper);
      }
      
      private function CreateCamBoundsHelper(metaLayer:MetaLayer, metaLevel:MetaLevel) : CamBoundsHelper
      {
         var metaCamBounds:MetaCamBoundsHelper = MetaManager.instance.CreateMetaCamBounds(metaLayer,metaLevel);
         metaCamBounds.instanceType = LevelEditorHelperFactory(factory).ID_CAM_BOUNDS_HELPER;
         return CamBoundsHelper(Create(metaCamBounds));
      }
      
      public function AddSwitch(metaSwitch:MetaGameEventSwitch, metaLayer:MetaLayer) : SwitchHelper
      {
         var switchHelper:SwitchHelper = this.CreateSwitchHelper(metaSwitch.x,metaSwitch.y,metaLayer,metaSwitch);
         var layer:LevelLayer = LevelLayer(metaLayer.factoryObject);
         layer.GetDebugContainer().addChild(switchHelper.animationContainer);
         context.camera.AddActeur(switchHelper);
         switchHelper.clickCallBack = new Callback(this.onClickSwitchHelper,this,[switchHelper]);
         switchHelper.mgr = this;
         this._switchs.push(switchHelper);
         return switchHelper;
      }
      
      public function get selectedCircle() : CircleHelper
      {
         return this._selectedCircle;
      }
      
      public function DestroyCamBounds() : void
      {
         if(this._camBoundsHelper == null)
         {
            return;
         }
         context.camera.RemoveActeur(this._camBoundsHelper);
         Utils.LazyRemoveFromParent(this._camBoundsHelper.animationContainer);
         this.DestroyHelperObject(this._camBoundsHelper);
         this._camBoundsHelper = null;
      }
      
      private function CreateSwitchHelper(x:int, y:int, metaLayer:MetaLayer, metaSwitch:MetaGameEventSwitch) : SwitchHelper
      {
         var metaSwitchHelper:MetaSwitchHelper = MetaManager.instance.CreateMetaSwitchHelper(x,y,metaLayer,metaSwitch);
         metaSwitchHelper.instanceType = LevelEditorHelperFactory(factory).ID_SWITCH_HELPER;
         return SwitchHelper(Create(metaSwitchHelper));
      }
      
      public function get lines() : Array
      {
         return this._lines;
      }
   }
}

