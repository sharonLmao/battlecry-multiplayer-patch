package com.lachhhEngine.games.levelEditor
{
   import com.lachhhEngine.games.level.LevelLayer;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class LayerHelper extends MovieClip
   {
      
      private var _layerVisible:TextField;
      
      private var _isSelected:Boolean = false;
      
      private var _layerSelected:TextField;
      
      private var _layerVisibleCnt:MovieClip;
      
      private var _layer:LevelLayer;
      
      private var _layerSelectedCnt:MovieClip;
      
      private var _isVisible:Boolean = true;
      
      private var _layerNameCnt:MovieClip;
      
      private var _layerBrowser:LevelEditorLayerBrowser;
      
      private var _layerName:TextField;
      
      public function LayerHelper(layer:LevelLayer, i:int, browser:LevelEditorLayerBrowser)
      {
         super();
         this._layerBrowser = browser;
         this._layer = layer;
         this._layerName = new TextField();
         this._layerVisible = new TextField();
         this._layerSelected = new TextField();
         this._layerNameCnt = new MovieClip();
         this._layerVisibleCnt = new MovieClip();
         this._layerSelectedCnt = new MovieClip();
         addChild(this._layerNameCnt);
         addChild(this._layerVisibleCnt);
         addChild(this._layerSelectedCnt);
         this._layerNameCnt.addChild(this._layerName);
         this._layerVisibleCnt.addChild(this._layerVisible);
         this._layerSelectedCnt.addChild(this._layerSelected);
         this._layerName.text = "Layer " + i;
         this._layerVisible.text = "Visible";
         this._layerSelected.text = "Selected";
         this._layerName.height = 20;
         this._layerVisible.height = 20;
         this._layerSelected.height = 20;
         this._layerName.selectable = false;
         this._layerVisible.selectable = false;
         this._layerSelected.selectable = false;
         this._layerVisibleCnt.buttonMode = true;
         this._layerSelectedCnt.buttonMode = true;
         this._layerVisibleCnt.mouseChildren = false;
         this._layerSelectedCnt.mouseChildren = false;
         this._layerVisibleCnt.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickVisible);
         this._layerSelectedCnt.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickSelected);
         this._layerVisibleCnt.x = 50;
         this._layerSelectedCnt.x = 100;
         this.UpdateVisual();
      }
      
      private function onClickVisible(e:MouseEvent) : void
      {
         this._isVisible = !this._isVisible;
         this.UpdateVisual();
      }
      
      public function set isSelected(isSelected:Boolean) : void
      {
         this._isSelected = isSelected;
      }
      
      public function get layer() : LevelLayer
      {
         return this._layer;
      }
      
      public function UpdateVisual() : void
      {
         this._layerVisible.textColor = this._isVisible ? 65280 : 16711680;
         this._layerSelected.textColor = this._isSelected ? 65280 : 16711680;
         this._layer.visual.visible = this.isVisible;
      }
      
      public function Destroy() : void
      {
         this._layerVisibleCnt.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickVisible);
         this._layerSelectedCnt.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickSelected);
         this._layer = null;
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function get isVisible() : Boolean
      {
         return this._isVisible;
      }
      
      private function onClickSelected(e:MouseEvent) : void
      {
         this._layerBrowser.SelectLayer(this);
         this.UpdateVisual();
      }
   }
}

