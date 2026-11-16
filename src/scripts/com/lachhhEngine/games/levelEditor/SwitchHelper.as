package com.lachhhEngine.games.levelEditor
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaGameEventSwitch;
   import com.lachhhEngine.games.meta.metaObject.levelEditor.MetaSwitchHelper;
   import flash.events.FocusEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class SwitchHelper extends CircleHelper
   {
      
      private var _txtTeam:TextField;
      
      private var _txtMessage:TextField;
      
      private var _mgr:LevelEditorHelperManager;
      
      public function SwitchHelper()
      {
         super();
         this._txtTeam = new TextField();
         this._txtMessage = new TextField();
         this._txtTeam.type = TextFieldType.INPUT;
         this._txtMessage.type = TextFieldType.INPUT;
         this._txtTeam.background = true;
         this._txtMessage.background = true;
         this._txtTeam.multiline = false;
         this._txtMessage.multiline = false;
         this._txtTeam.height = 20;
         this._txtMessage.height = 20;
      }
      
      public function get metaSwitch() : MetaSwitchHelper
      {
         return MetaSwitchHelper(metaInfo);
      }
      
      override protected function UpdateVisual() : void
      {
         super.UpdateVisual();
         this._txtTeam.y = -circle.rayon - 50;
         this._txtMessage.y = -circle.rayon - 20;
         this._txtTeam.x = -this._txtTeam.width / 2;
         this._txtMessage.x = -this._txtMessage.width / 2;
      }
      
      public function get mgr() : LevelEditorHelperManager
      {
         return this._mgr;
      }
      
      override public function Update(context:Game) : void
      {
         super.Update(context);
         this.metaGameEventSwitch.team = this._txtTeam.text;
         this.metaGameEventSwitch.message = this._txtMessage.text;
      }
      
      override public function Init(metaInfo:MetaObject, context:Game) : void
      {
         super.Init(metaInfo,context);
         animationContainer.addChild(this._txtTeam);
         animationContainer.addChild(this._txtMessage);
         this._txtTeam.text = this.metaGameEventSwitch.team;
         this._txtMessage.text = this.metaGameEventSwitch.message == "" ? "MESSAGE" : this.metaGameEventSwitch.message;
         this._txtTeam.addEventListener(FocusEvent.FOCUS_IN,this.onFocusIn);
         this._txtTeam.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
         this._txtMessage.addEventListener(FocusEvent.FOCUS_IN,this.onFocusIn);
         this._txtMessage.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
         this.UpdateVisual();
      }
      
      private function onFocusOut(e:FocusEvent) : void
      {
         this.mgr.levelEditor.keyBoardLock = false;
      }
      
      public function get metaGameEventSwitch() : MetaGameEventSwitch
      {
         return MetaGameEventSwitch(this.metaSwitch.metaCircle);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         animationContainer.removeChild(this._txtTeam);
         animationContainer.removeChild(this._txtMessage);
         this._txtTeam.removeEventListener(FocusEvent.FOCUS_IN,this.onFocusIn);
         this._txtTeam.removeEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
         this._txtMessage.removeEventListener(FocusEvent.FOCUS_IN,this.onFocusIn);
         this._txtMessage.removeEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
      }
      
      private function onFocusIn(e:FocusEvent) : void
      {
         this.mgr.levelEditor.keyBoardLock = true;
         this.mgr.levelEditor.toolBar.TurnOffAdd();
      }
      
      public function set mgr(mgr:LevelEditorHelperManager) : void
      {
         this._mgr = mgr;
      }
   }
}

