package com.lachhhEngine.games.debug
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.utils.Utils;
   
   public class DebugLevelTree extends DebugTree
   {
      
      private var _layersChild:Array;
      
      public function DebugLevelTree()
      {
         super();
         this._layersChild = new Array();
         name = "Visual";
      }
      
      override public function Update(context:Game) : void
      {
         var layerChild:DebugLayerTree = null;
         var layer:LevelLayer = null;
         var actionPrefix:String = null;
         super.Update(context);
         var allLayers:Array = context.levelManager.GetAllLayers();
         for(var i:int = 0; i < allLayers.length; i++)
         {
            layer = allLayers[i];
            actionPrefix = layer.IsActionLayer() ? "(A)" : "";
            if(this._layersChild[i] == null)
            {
               layerChild = new DebugLayerTree(layer);
               layerChild.layerName = actionPrefix + "Layer";
               this._layersChild[i] = layerChild;
               AddChild(layerChild);
            }
            else if(this._layersChild[i].layer != layer)
            {
               layerChild = this._layersChild[i];
               RemoveChild(layerChild);
               layerChild = new DebugLayerTree(layer);
               layerChild.layerName = actionPrefix + "Layer";
               this._layersChild[i] = layerChild;
               AddChild(layerChild);
            }
         }
         while(i < this._layersChild.length)
         {
            layerChild = this._layersChild[i];
            RemoveChild(layerChild);
            Utils.RemoveFromArray(this._layersChild,layerChild);
         }
      }
   }
}

