package com.lachhhEngine.games.physique
{
   import flash.geom.Point;
   
   public class Collision
   {
      
      public var distV1:Number;
      
      public var distV2:Number;
      
      public var vecFinal:Point;
      
      public var vecFollowSansPerte:Point;
      
      public var sens:Number;
      
      public var vecFollow:Point;
      
      public var pFinal:Point;
      
      public var pointOfCollision:Circle;
      
      public var vecAng:Point;
      
      public var pFirstCollision:Point;
      
      public var line:Line;
      
      public var vecRebound:Point;
      
      public function Collision()
      {
         super();
      }
      
      public function IsWithCircle() : Boolean
      {
         return this.pointOfCollision != null;
      }
   }
}

