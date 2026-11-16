package com.lachhhEngine.games.debug
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.level.LevelLayer;
   
   public class DebugLayerTree extends DebugTree
   {
      
      private var _enemy:DebugMovieClipTree;
      
      private var _foreFx:DebugMovieClipTree;
      
      private var _layer:LevelLayer;
      
      private var _debug:DebugMovieClipTree;
      
      private var _levelPart:DebugMovieClipTree;
      
      private var _hero:DebugMovieClipTree;
      
      private var _ammo:DebugMovieClipTree;
      
      private var _item:DebugMovieClipTree;
      
      private var _layerName:String;
      
      private var _backFx:DebugMovieClipTree;
      
      public function DebugLayerTree(layer:LevelLayer)
      {
         super();
         this._layer = layer;
         this._debug = new DebugMovieClipTree(this._layer.GetDebugContainer());
         this._foreFx = new DebugMovieClipTree(this._layer.GetForeFxContainer());
         this._enemy = new DebugMovieClipTree(this._layer.GetEnemyContainer());
         this._ammo = new DebugMovieClipTree(this._layer.GetAmmoContainer());
         this._hero = new DebugMovieClipTree(this._layer.GetHeroContainer());
         this._backFx = new DebugMovieClipTree(this._layer.GetBackFxContainer());
         this._item = new DebugMovieClipTree(this._layer.GetItemContainer());
         this._levelPart = new DebugMovieClipTree(this._layer.GetLevelPartContainer());
         this._ammo.containerName = "Ammo Container";
         this._debug.containerName = "Debug Container";
         this._enemy.containerName = "Enemy Container";
         this._backFx.containerName = "FX Back Container";
         this._foreFx.containerName = "FX Fore Container";
         this._hero.containerName = "Hero Container";
         this._item.containerName = "Item Container";
         this._levelPart.containerName = "Level Container";
         AddChild(this._debug);
         AddChild(this._foreFx);
         AddChild(this._enemy);
         AddChild(this._ammo);
         AddChild(this._hero);
         AddChild(this._backFx);
         AddChild(this._item);
         AddChild(this._levelPart);
      }
      
      public function get layer() : LevelLayer
      {
         return this._layer;
      }
      
      override public function Update(context:Game) : void
      {
         super.Update(context);
         var sum:int = 0;
         if(this._layer.GetDebugContainer())
         {
            sum += this._layer.GetDebugContainer().numChildren;
         }
         if(this._layer.GetForeFxContainer())
         {
            sum += this._layer.GetForeFxContainer().numChildren;
         }
         if(this._layer.GetEnemyContainer())
         {
            sum += this._layer.GetEnemyContainer().numChildren;
         }
         if(this._layer.GetAmmoContainer())
         {
            sum += this._layer.GetAmmoContainer().numChildren;
         }
         if(this._layer.GetHeroContainer())
         {
            sum += this._layer.GetHeroContainer().numChildren;
         }
         if(this._layer.GetBackFxContainer())
         {
            sum += this._layer.GetBackFxContainer().numChildren;
         }
         if(this._layer.GetItemContainer())
         {
            sum += this._layer.GetItemContainer().numChildren;
         }
         if(this._layer.GetLevelPartContainer())
         {
            sum += this._layer.GetLevelPartContainer().numChildren;
         }
         name = this._layerName + "(" + sum + ")";
      }
      
      public function set layerName(layerName:String) : void
      {
         this._layerName = layerName;
      }
      
      public function get layerName() : String
      {
         return this._layerName;
      }
   }
}

