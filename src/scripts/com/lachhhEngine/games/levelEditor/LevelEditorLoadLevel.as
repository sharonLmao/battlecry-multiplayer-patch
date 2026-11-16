package com.lachhhEngine.games.levelEditor
{
   import com.lachhhEngine.games.LevelEditor;
   import com.lachhhEngine.games.meta.metaObject.MetaLevel;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.levelEditor.exported.POPUP_LOAD;
   
   public class LevelEditorLoadLevel
   {
      
      private const X_GAP:int = 200;
      
      private const Y_GAP:int = 50;
      
      private var _levelEditor:LevelEditor;
      
      private const Y_END:int = 630;
      
      private const X_START:int = 130;
      
      private const Y_START:int = 85;
      
      private var _visual:POPUP_LOAD;
      
      private var _callback:Callback;
      
      private var _isVisible:Boolean = false;
      
      private var _btnLoads:Array;
      
      public function LevelEditorLoadLevel(levelEditor:LevelEditor)
      {
         super();
         this._visual = new POPUP_LOAD();
         this._btnLoads = new Array();
         this._levelEditor = levelEditor;
         this._visual.x = 512;
         this._visual.y = 384;
         this._visual.visible = false;
         this._visual.alpha = 0;
      }
      
      public function get visual() : POPUP_LOAD
      {
         return this._visual;
      }
      
      public function Destroy() : void
      {
         var btnLoad:LevelEditorLoadLevelBtn = null;
         while(this._btnLoads.length > 0)
         {
            btnLoad = this._btnLoads.shift();
            btnLoad.Destroy();
            this._visual.frame.removeChild(btnLoad.visual);
         }
      }
      
      public function Show(callback:Callback) : void
      {
         this._isVisible = true;
         this._callback = callback;
      }
      
      public function Hide() : void
      {
         this._isVisible = false;
      }
      
      public function Update() : void
      {
         if(this._isVisible)
         {
            this._visual.visible = true;
            this._visual.alpha += 0.05;
            if(this._visual.alpha > 1)
            {
               this._visual.alpha = 1;
            }
         }
         else
         {
            this._visual.alpha -= 0.05;
            if(this._visual.alpha < 0)
            {
               this._visual.alpha = 0;
               this._visual.visible = false;
            }
         }
      }
      
      public function onClickBtn(metaLevel:MetaLevel) : void
      {
         this._levelEditor.ReInit(metaLevel,this._callback,null);
         this.Hide();
      }
      
      public function Init(metaLevels:Array) : void
      {
         var metaLevel:MetaLevel = null;
         var btnLoad:LevelEditorLoadLevelBtn = null;
         var x:int = this.X_START;
         var y:int = this.Y_START;
         for(var i:int = 0; i < metaLevels.length; i++)
         {
            metaLevel = metaLevels[i];
            btnLoad = new LevelEditorLoadLevelBtn(metaLevel,new Callback(this.onClickBtn,this,[metaLevel]));
            btnLoad.visual.x = x;
            btnLoad.visual.y = y;
            y += this.Y_GAP;
            if(y > this.Y_END)
            {
               y = this.Y_START;
               x += this.X_GAP;
            }
            this._visual.frame.addChild(btnLoad.visual);
            this._btnLoads.push(btnLoad);
         }
      }
   }
}

