package com.lachhhEngine.games.levelEditor
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.LevelEditor;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.Screen;
   import com.lachhhEngine.levelEditor.exported.LAYER_BROWSER;
   import flash.events.FocusEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class LevelEditorLayerBrowser extends Screen
   {
      
      private var _levelNameLabel:TextField;
      
      private var _levelName:TextField;
      
      private var _levelEditor:LevelEditor;
      
      private var _layerHelpers:Array;
      
      public function LevelEditorLayerBrowser()
      {
         super();
      }
      
      public function InitLevelEditor(levelEditor:LevelEditor) : void
      {
         this._levelEditor = levelEditor;
      }
      
      private function onNameFocusOut(e:FocusEvent) : void
      {
         this._levelEditor.game.levelManager.metaLevel.name = this._levelName.text;
      }
      
      public function DestroyLevel() : void
      {
         var layerHelper:LayerHelper = null;
         while(this._layerHelpers.length > 0)
         {
            layerHelper = this._layerHelpers.shift();
            this.typedVisual.removeChild(layerHelper);
            layerHelper.Destroy();
         }
         this._levelName.removeEventListener(FocusEvent.FOCUS_OUT,this.onNameFocusOut);
      }
      
      public function DeselectAll() : void
      {
         var layerHelper:LayerHelper = null;
         for(var i:int = 0; i < this._layerHelpers.length; i++)
         {
            layerHelper = this._layerHelpers[i];
            layerHelper.isSelected = false;
            layerHelper.UpdateVisual();
         }
      }
      
      public function InitLevel(layers:Array) : void
      {
         var layer:LevelLayer = null;
         var layerHelper:LayerHelper = null;
         for(var i:int = 0; i < layers.length; i++)
         {
            layer = layers[i];
            layerHelper = new LayerHelper(layer,i,this);
            this.typedVisual.addChild(layerHelper);
            layerHelper.x = 20 + 700;
            layerHelper.y = i * 25 + 50;
            this._layerHelpers.push(layerHelper);
            if(layer.IsActionLayer())
            {
               this.SelectLayer(layerHelper);
            }
         }
         this._levelName.addEventListener(FocusEvent.FOCUS_OUT,this.onNameFocusOut);
         this._levelName.text = this._levelEditor.game.levelManager.metaLevel.name;
      }
      
      public function SelectLayer(layerHelper:LayerHelper) : void
      {
         this.DeselectAll();
         layerHelper.isSelected = true;
         layerHelper.UpdateVisual();
         this._levelEditor.SelectLayer(layerHelper.layer);
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._layerHelpers = new Array();
         this._levelName = new TextField();
         this._levelNameLabel = new TextField();
         this.typedVisual.addChild(this._levelName);
         this.typedVisual.addChild(this._levelNameLabel);
         this._levelNameLabel.selectable = false;
         this._levelNameLabel.x = 10 + 700;
         this._levelNameLabel.y = 20;
         this._levelName.x = 100 + 700;
         this._levelName.y = 20;
         this._levelName.background = true;
         this._levelName.backgroundColor = 15658734;
         this._levelNameLabel.text = "Level Name :";
         this._levelName.type = TextFieldType.INPUT;
         this._levelName.height = 20;
         this._levelNameLabel.height = 20;
      }
      
      public function get typedVisual() : LAYER_BROWSER
      {
         return LAYER_BROWSER(visual);
      }
      
      override public function CreateVisual() : Animation
      {
         return new LAYER_BROWSER();
      }
   }
}

