package com.lachhhEngine.games.levelEditor
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.LevelEditor;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.Screen;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.levelEditor.exported.BTN_ADD_EVENT_SWITCH;
   import com.lachhhEngine.levelEditor.exported.BTN_ADD_LINE;
   import com.lachhhEngine.levelEditor.exported.BTN_ADD_POINT;
   import com.lachhhEngine.levelEditor.exported.BTN_SEE_EVENT;
   import com.lachhhEngine.levelEditor.exported.BTN_SEE_LINE;
   import com.lachhhEngine.levelEditor.exported.BTN_SEE_POINT;
   import com.lachhhEngine.levelEditor.exported.POPUP_SAVE_COMPLETE;
   import com.lachhhEngine.levelEditor.exported.TOOL_BAR;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   
   public class LevelEditorToolBar extends Screen
   {
      
      private var _levelEditor:LevelEditor;
      
      private var _isPopupSaveVisible:Boolean = false;
      
      private var _popupSaveComplete:POPUP_SAVE_COMPLETE;
      
      private var _callback:Callback;
      
      private var _addStuffGroup:ButtonSelectGroup;
      
      private var _popupLoad:LevelEditorLoadLevel;
      
      public function LevelEditorToolBar()
      {
         super();
      }
      
      private function ClickButton(b:ButtonSelect) : void
      {
         if(this._addStuffGroup.Contains(b))
         {
            if(b == this._addStuffGroup.selectedButton)
            {
               this._addStuffGroup.Deselect();
            }
            else
            {
               this._addStuffGroup.SelectButton(b);
            }
         }
         else if(b.isSelected)
         {
            b.Deselect();
         }
         else
         {
            b.Select();
         }
         this._callback.DoCallback();
      }
      
      public function get isPopupSaveVisible() : Boolean
      {
         return this._isPopupSaveVisible;
      }
      
      public function ToggleAddPoint() : void
      {
         this.ClickButton(visual.addLine);
      }
      
      public function get addLine() : Boolean
      {
         return BTN_ADD_LINE(visual.addLine).isSelected;
      }
      
      public function ToggleShowEvent() : void
      {
         this.ClickButton(visual.showEvent);
      }
      
      public function get typedVisual() : TOOL_BAR
      {
         return TOOL_BAR(visual);
      }
      
      private function onClickSave(e:MouseEvent) : void
      {
         var path:String = this._levelEditor.game.levelManager.metaLevel.name;
         var str:* = "<?php" + "\n";
         str += "$fp = fopen( \'" + path + ".xml\', \'wb\' );" + "\n";
         str += "fwrite( $fp, $GLOBALS[ \'HTTP_RAW_POST_DATA\' ]  );" + "\n";
         str += "fclose( $fp );" + "\n";
         str += "?>";
         var myXMLBinary:ByteArray = new ByteArray();
         myXMLBinary.writeUTFBytes(str);
         var request:URLRequest = new URLRequest("http://127.0.0.1/Workspace/SavePHP.php");
         var loader:URLLoader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,this.SaveXml);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.onSaveError);
         request.contentType = "application/octet-stream";
         request.method = URLRequestMethod.POST;
         request.data = myXMLBinary;
         loader.load(request);
         this._popupSaveComplete.quit.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickPopupSave);
         this._popupSaveComplete.msg.text = "Loading";
         this._popupSaveComplete.path.text = "";
         this._popupSaveComplete.error.text = this._levelEditor.GetCompleteXML();
         TextField(this._popupSaveComplete.error).setSelection(0,0);
         this._isPopupSaveVisible = true;
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         if(this._isPopupSaveVisible)
         {
            this._popupSaveComplete.visible = true;
            this._popupSaveComplete.alpha += 0.05;
            if(this._popupSaveComplete.alpha >= 1)
            {
               this._popupSaveComplete.alpha = 1;
            }
         }
         else
         {
            this._popupSaveComplete.alpha -= 0.05;
            if(this._popupSaveComplete.alpha <= 0)
            {
               this._popupSaveComplete.alpha = 0;
               this._popupSaveComplete.visible = false;
            }
         }
         this._popupLoad.Update();
      }
      
      public function get showPoint() : Boolean
      {
         return BTN_SEE_POINT(visual.showPoint).isSelected;
      }
      
      public function ToggleAddEvent() : void
      {
         this.ClickButton(visual.addEvent);
      }
      
      private function onSaveComplete(e:Event) : void
      {
         var path:* = "c:/Workspace/SavedFiles/" + this._levelEditor.game.levelManager.metaLevel.name + ".xml";
         this._popupSaveComplete.msg.text = "Level Saved at :";
         this._popupSaveComplete.path.text = path;
         this._popupSaveComplete.quit.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickPopupSave);
      }
      
      private function onButtonClick(e:MouseEvent) : void
      {
         var b:ButtonSelect = ButtonSelect(e.target);
         this.ClickButton(b);
      }
      
      public function get showLine() : Boolean
      {
         return BTN_SEE_LINE(visual.showLine).isSelected;
      }
      
      public function get setOffset() : Boolean
      {
         return visual.setOffset.isSelected;
      }
      
      private function onClickPreview(e:MouseEvent) : void
      {
         this._levelEditor.Preview();
      }
      
      private function onClickPopupSave(e:MouseEvent) : void
      {
         this._isPopupSaveVisible = false;
         this._popupSaveComplete.quit.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickPopupSave);
      }
      
      public function ShowLoadLevel(metaLevels:Array, callbackLevelLoaded:Callback) : void
      {
         this._popupLoad.Init(metaLevels);
         this._popupLoad.Show(callbackLevelLoaded);
      }
      
      public function ToggleShowLine() : void
      {
         this.ClickButton(visual.showLine);
      }
      
      public function ToggleAddLine() : void
      {
         this.ClickButton(visual.addLine);
      }
      
      private function onSaveError(e:Event) : void
      {
         this._popupSaveComplete.msg.text = "Error";
         this._popupSaveComplete.path.text = e.toString();
         this._popupSaveComplete.quit.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickPopupSave);
      }
      
      private function onClickLoad(e:MouseEvent) : void
      {
         this.ShowLoadLevel(this._levelEditor.possibleLevels,this._levelEditor.levelLoadedCallback);
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._addStuffGroup = new ButtonSelectGroup();
         this._addStuffGroup.AddButton(visual.addEvent);
         this._addStuffGroup.AddButton(visual.addLine);
         this._addStuffGroup.AddButton(visual.addPoint);
         this._addStuffGroup.AddButton(visual.setOffset);
         visual.addEvent.addEventListener(MouseEvent.MOUSE_DOWN,this.onButtonClick);
         visual.addLine.addEventListener(MouseEvent.MOUSE_DOWN,this.onButtonClick);
         visual.addPoint.addEventListener(MouseEvent.MOUSE_DOWN,this.onButtonClick);
         visual.showEvent.addEventListener(MouseEvent.MOUSE_DOWN,this.onButtonClick);
         visual.showLine.addEventListener(MouseEvent.MOUSE_DOWN,this.onButtonClick);
         visual.showPoint.addEventListener(MouseEvent.MOUSE_DOWN,this.onButtonClick);
         visual.showEvent.Select();
         visual.showLine.Select();
         visual.showPoint.Select();
         visual.btnSave.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickSave);
         visual.btnLoad.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickLoad);
         visual.btnPreview.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickPreview);
         visual.setOffset.addEventListener(MouseEvent.MOUSE_DOWN,this.onButtonClick);
         this._popupSaveComplete = new POPUP_SAVE_COMPLETE();
         visual.addChild(this._popupSaveComplete);
         this._popupSaveComplete.x = 512;
         this._popupSaveComplete.y = 384;
         this._popupSaveComplete.alpha = 0;
         state = STATE_IDLE;
      }
      
      public function get showEvent() : Boolean
      {
         return BTN_SEE_EVENT(visual.showEvent).isSelected;
      }
      
      public function TurnOffAdd() : void
      {
         this._addStuffGroup.Deselect();
      }
      
      public function InitFromLevelEditor(callback:Callback, levelEditor:LevelEditor) : void
      {
         this._levelEditor = levelEditor;
         this._callback = callback;
         this._popupLoad = new LevelEditorLoadLevel(this._levelEditor);
         visual.addChild(this._popupLoad.visual);
      }
      
      public function get addEvent() : Boolean
      {
         return BTN_ADD_EVENT_SWITCH(visual.addEvent).isSelected;
      }
      
      private function SaveXml(e:Event) : void
      {
         var myXMLBinary:ByteArray = new ByteArray();
         myXMLBinary.writeUTFBytes(this._levelEditor.GetCompleteXML());
         var request:URLRequest = new URLRequest("http://127.0.0.1/Workspace/xmlWithPath.php");
         var loader:URLLoader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,this.onSaveComplete);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.onSaveError);
         request.contentType = "application/octet-stream";
         request.method = URLRequestMethod.POST;
         request.data = myXMLBinary;
         loader.load(request);
      }
      
      override public function CreateVisual() : Animation
      {
         return new TOOL_BAR();
      }
      
      public function get addPoint() : Boolean
      {
         return BTN_ADD_POINT(visual.addPoint).isSelected;
      }
      
      public function ToggleShowPoint() : void
      {
         this.ClickButton(visual.showPoint);
      }
   }
}

