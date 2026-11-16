package com.battlecry
{
   import com.battlecry.levelEvent.LevelXML;
   import com.lachhhEngine.games.LevelEditor;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.io.Callback;
   import flash.events.Event;
   
   public class BC_MainLevelEditor extends Main
   {
      
      private var _levelEditor:LevelEditor;
      
      public function BC_MainLevelEditor()
      {
         super();
         Init();
      }
      
      override public function LevelLoaded() : void
      {
         _game.camera.isManual = true;
         _game.camera.SetIfMustRespectBounds(false);
      }
      
      override protected function CreateManagers() : void
      {
         super.CreateManagers();
         _game.levelEditorMode = true;
         this._levelEditor = new LevelEditor(_game);
         this._levelEditor.AddPossibleLevel(MetaManager.instance.CreateMetaLevel(LevelXML.LEVEL_XML,_game));
         this._levelEditor.ShowLoadLevelScreen(new Callback(this.LevelLoaded,this,null));
      }
      
      override public function Update(e:Event) : void
      {
         stage.focus = this;
         this._levelEditor.Update();
         super.Update(e);
      }
   }
}

