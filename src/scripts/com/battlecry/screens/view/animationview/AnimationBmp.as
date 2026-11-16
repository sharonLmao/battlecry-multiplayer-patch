package com.battlecry.screens.view.animationview
{
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.draw.CopypixelableBmpData;
   import com.lachhhEngine.games.draw.DrawUtils;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.geom.Matrix;
   import flash.utils.Dictionary;
   
   public class AnimationBmp
   {
      
      private static var EMPTY_COPY:CopypixelableBmpData;
      
      private static var _matrix:Matrix = new Matrix();
      
      private static var IDENTITY:Matrix = new Matrix();
      
      private var _copyBmp:CopypixelableBmpData;
      
      private var _dict:Dictionary;
      
      private var _id:int;
      
      public function AnimationBmp(anim:Animation)
      {
         var d:DisplayObject = null;
         var d2:DisplayObject = null;
         this._dict = new Dictionary();
         super();
         if(!EMPTY_COPY)
         {
            EMPTY_COPY = new CopypixelableBmpData();
            EMPTY_COPY.bmpData = new BitmapData(1,1);
         }
         this._id = anim.metaAnimation.instanceType;
         for(var i:int = 0; i < anim.numChildren; i++)
         {
            d = anim.getChildAt(i);
            if(d.name.indexOf("instance") == -1)
            {
               this.AddCopyChild(d);
               d.visible = false;
            }
         }
         this._copyBmp = DrawUtils.CreateCopypixelableBmpData(anim);
         for(i = 0; i < anim.numChildren; i++)
         {
            d2 = anim.getChildAt(i);
            if(d2.name.indexOf("instance") == -1)
            {
               d2.visible = true;
            }
         }
      }
      
      public function get copyBmp() : CopypixelableBmpData
      {
         return this._copyBmp;
      }
      
      private function AddCopyChild(d:DisplayObject) : void
      {
         d.visible = true;
         _matrix = d.transform.matrix;
         d.transform.matrix = IDENTITY;
         var copy:CopypixelableBmpData = DrawUtils.CreateCopypixelableBmpData(d);
         if(copy)
         {
            this._dict[d.name] = copy;
         }
         else
         {
            this._dict[d.name] = EMPTY_COPY;
         }
         d.transform.matrix = _matrix;
      }
      
      public function GetCopyChild(name:String) : CopypixelableBmpData
      {
         return this._dict[name];
      }
   }
}

