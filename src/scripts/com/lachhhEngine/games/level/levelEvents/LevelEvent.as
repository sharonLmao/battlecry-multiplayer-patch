package com.lachhhEngine.games.level.levelEvents
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.factory.FactoryObject;
   import com.lachhhEngine.games.level.LevelLayer;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaLayer;
   import com.lachhhEngine.games.physique.Circle;
   import com.lachhhEngine.games.physique.Line;
   import com.lachhhEngine.games.physique.PhysicManager;
   import com.lachhhEngine.utils.Utils;
   import flash.display.DisplayObject;
   
   public class LevelEvent extends FactoryObject
   {
      
      private var _lines:Array;
      
      private var _circles:Array;
      
      private var _context:Game;
      
      public function LevelEvent()
      {
         super();
         this._lines = new Array();
         this._circles = new Array();
      }
      
      public function DoAction(context:Game, action:int) : void
      {
      }
      
      public function IsCleared() : Boolean
      {
         return false;
      }
      
      public function OnMessage(context:Game, msg:String) : void
      {
         trace("Msg refceived : " + msg);
      }
      
      protected function DestroyAllCollision() : void
      {
         while(this._lines.length > 0)
         {
            this.RemoveLine(this._context.actionLayer,this._lines[0]);
         }
         while(this._circles.length > 0)
         {
            this.RemoveCircle(this._context.actionLayer,this._circles[0]);
         }
      }
      
      protected function CreateFxFromAnimation(animId:int, metaLayer:MetaLayer) : void
      {
         var child:DisplayObject = null;
         var anim:Animation = AnimationManager.instance.CreateAnimation(animId);
         anim.canBeCached = false;
         for(var i:int = 0; i < anim.numChildren; i++)
         {
            child = anim.getChildAt(i);
            this.CreateFx(metaLayer,child);
         }
         AnimationManager.instance.Destroy(anim);
      }
      
      protected function CreateEnemyFromAnimation(animId:int, metaLayer:MetaLayer) : void
      {
         var child:DisplayObject = null;
         var anim:Animation = AnimationManager.instance.CreateAnimation(animId);
         anim.canBeCached = false;
         for(var i:int = 0; i < anim.numChildren; i++)
         {
            child = anim.getChildAt(i);
            this.CreateEnemy(metaLayer,child);
         }
         AnimationManager.instance.Destroy(anim);
      }
      
      protected function CreateEnemy(metaLayer:MetaLayer, child:DisplayObject) : void
      {
      }
      
      protected function RemoveCircle(layer:LevelLayer, circle:Circle) : void
      {
         layer.RemoveCircle(circle);
         PhysicManager.instance.DestroyPhysicObject(circle);
         Utils.RemoveFromArray(this._circles,circle);
      }
      
      protected function AddLine(layer:LevelLayer, x1:Number, y1:Number, x2:Number, y2:Number, canDrop:Boolean = false, canWallCkick:Boolean = false) : Line
      {
         var line:Line = PhysicManager.instance.CreateLine(x1,x2,y1,y2,canDrop,canWallCkick);
         layer.AddLine(line);
         this._lines.push(line);
         return line;
      }
      
      protected function CreateActors() : void
      {
         var ml:MetaLayer = null;
         var idFxAnim:int = 0;
         var idEnemyAnim:int = 0;
         for(var i:int = 0; i < this.context.metaLevel.metaLayers.length; i++)
         {
            ml = this.context.metaLevel.metaLayers[i];
            if(ml.fxVisual != "")
            {
               idFxAnim = AnimationManager.factory.FindIdByString(ml.fxVisual);
               if(idFxAnim == -1)
               {
                  throw new Error("Can\'t find the class : " + ml.fxVisual + " Be sure to put it in AnimationFactory");
               }
               this.CreateFxFromAnimation(idFxAnim,ml);
            }
            if(ml.enemyVisual != "")
            {
               idEnemyAnim = AnimationManager.factory.FindIdByString(ml.enemyVisual);
               if(idEnemyAnim == -1)
               {
                  throw new Error("Can\'t find the class : " + ml.enemyVisual + " Be sure to put it in AnimationFactory");
               }
               this.CreateEnemyFromAnimation(AnimationManager.factory.FindIdByString(ml.enemyVisual),ml);
            }
         }
      }
      
      public function UpdateLevel(context:Game) : void
      {
      }
      
      protected function ConnectLines(layer:LevelLayer) : void
      {
         layer.ConnectLine(this._lines);
      }
      
      protected function CreateFx(metaLayer:MetaLayer, child:DisplayObject) : void
      {
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.DestroyAllCollision();
         this._context = null;
      }
      
      protected function get context() : Game
      {
         return this._context;
      }
      
      override public function Init(metaLevelEvent:MetaObject, context:Game) : void
      {
         super.Init(metaLevelEvent,context);
         this._context = context;
         this.CreateActors();
      }
      
      protected function AddCircle(layer:LevelLayer, x:Number, y:Number, rayon:Number) : Circle
      {
         var circle:Circle = PhysicManager.instance.CreateCircle(x,y,rayon);
         circle.SetIsDynamic(true);
         layer.AddCircle(circle);
         this._circles.push(circle);
         return circle;
      }
      
      protected function RemoveLine(layer:LevelLayer, line:Line) : void
      {
         layer.RemoveLine(line);
         PhysicManager.instance.DestroyPhysicObject(line);
         Utils.RemoveFromArray(this._lines,line);
      }
   }
}

