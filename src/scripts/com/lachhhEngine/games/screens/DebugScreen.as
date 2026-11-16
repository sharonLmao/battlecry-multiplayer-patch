package com.lachhhEngine.games.screens
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.debug.DebugTree;
   import com.lachhhEngine.games.debug.GameTree;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.io.KeyManager;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.ui.Keyboard;
   
   public class DebugScreen extends Screen
   {
      
      private var _txtDebug:TextField;
      
      private var _height:int = -1;
      
      private var _context:Game;
      
      public function DebugScreen()
      {
         super();
         this._txtDebug = new TextField();
         this._txtDebug.type = TextFieldType.INPUT;
         this._txtDebug.multiline = false;
         this._txtDebug.height = 20;
         this._txtDebug.width = 350;
         this._txtDebug.background = true;
         this._txtDebug.backgroundColor = 6710886;
         this._txtDebug.textColor = 16777215;
      }
      
      override public function ShowOpen(context:MainGame) : void
      {
         visual.x += -visual.x * 0.2;
         if(visual.x > -2)
         {
            visual.x = 0;
            state = STATE_IDLE;
         }
         this.SetHeight();
         this.ShowTree(context.game);
      }
      
      private function SetHeight() : void
      {
         if(visual.stage != null && this._height != visual.stage.stageHeight)
         {
            visual.graphics.clear();
            visual.graphics.beginFill(0,0.5);
            visual.graphics.drawRect(0,0,350,visual.stage.height);
            visual.graphics.endFill();
         }
         this._txtDebug.y = visual.stage.stageHeight - this._txtDebug.height;
      }
      
      override public function ShowClose(context:MainGame) : void
      {
         visual.x += (-400 - visual.x) * 0.1;
         if(visual.x < -350)
         {
            ScreenManager.instance.RemoveScreen(this);
         }
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         this.SetHeight();
         this.ShowTree(context.game);
         if(KeyManager.IsKeyPressed(Keyboard.ENTER))
         {
            GameTree.DoCallback(this._txtDebug.text);
            this._txtDebug.text = "";
         }
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         state = STATE_OPENING;
         visual.x = -350;
         this._context = context;
         visual.addChild(this._txtDebug);
      }
      
      override protected function get trackMetrics() : Boolean
      {
         return false;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         var debugTree:DebugTree = GameTree.GetTree(this._context);
         if(visual.contains(debugTree.visual))
         {
            visual.removeChild(debugTree.visual);
         }
         visual.removeChild(this._txtDebug);
         this._context = null;
      }
      
      private function ShowTree(context:Game) : void
      {
         if(context == null)
         {
            return;
         }
         GameTree.Update(context);
         var debugTree:DebugTree = GameTree.GetTree(context);
         if(!visual.contains(debugTree.visual))
         {
            visual.addChild(debugTree.visual);
         }
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_EMPTY);
      }
   }
}

