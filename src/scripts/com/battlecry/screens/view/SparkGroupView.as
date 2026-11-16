package com.battlecry.screens.view
{
   import com.lachhhEngine.games.screens.view.ObjectView;
   import flash.display.MovieClip;
   
   public class SparkGroupView extends ObjectView
   {
      
      private var _sparks:Vector.<SparkView> = new Vector.<SparkView>();
      
      public function SparkGroupView(visual:MovieClip)
      {
         super(visual);
      }
      
      override public function Update() : void
      {
         var spark:SparkView = null;
         super.Update();
         for(var i:int = int(this._sparks.length - 1); i >= 0; i--)
         {
            this._sparks[i].Update();
            if(this._sparks[i].destroy)
            {
               spark = this._sparks[i];
               spark.Destroy();
               this._sparks.splice(i,1);
            }
         }
      }
      
      private function CreateSpark(posX:int, posY:int) : SparkView
      {
         var spark:SparkView = new SparkView(visual,posX,posY);
         this._sparks.push(spark);
         return spark;
      }
      
      public function CreateSparkExplosion(num:int, posX:Number, posY:Number) : void
      {
         for(var i:int = 0; i < num; i++)
         {
            this.CreateSpark(posX,posY);
         }
      }
      
      override public function Destroy() : void
      {
         var spark:SparkView = null;
         super.Destroy();
         while(this._sparks.length > 0)
         {
            spark = this._sparks.pop();
            spark.Destroy();
         }
      }
   }
}

