package com.lachhhEngine.games.levelEditor
{
   import com.lachhhEngine.games.meta.metaObject.MetaLevel;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.levelEditor.exported.BTN_LEVEL;
   import flash.events.MouseEvent;
   
   public class LevelEditorLoadLevelBtn
   {
      
      private var _metaLevel:MetaLevel;
      
      private var _callback:Callback;
      
      private var _visual:BTN_LEVEL;
      
      public function LevelEditorLoadLevelBtn(metaLevel:MetaLevel, callback:Callback)
      {
         super();
         this._visual = new BTN_LEVEL();
         this._metaLevel = metaLevel;
         this._callback = callback;
         this._visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
         this._visual.txt.text = metaLevel.name;
      }
      
      public function get visual() : BTN_LEVEL
      {
         return this._visual;
      }
      
      public function get metaLevel() : MetaLevel
      {
         return this._metaLevel;
      }
      
      private function onClick(e:MouseEvent) : void
      {
         this._callback.DoCallback();
      }
      
      public function Destroy() : void
      {
         this._metaLevel = null;
         this._visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
      }
   }
}

