package com.lachhhEngine.games.physique
{
   public class Vector3D
   {
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var z:Number = 0;
      
      public function Vector3D(newX:Number, newY:Number, newZ:Number)
      {
         super();
         this.x = newX;
         this.y = newY;
         this.z = newZ;
      }
      
      public static function DistCarre(v1:Vector3D, v2:Vector3D) : Number
      {
         var dx:Number = v1.x - v2.x;
         var dy:Number = v1.y - v2.y;
         var dz:Number = v1.z - v2.z;
         return dx * dx + dy * dy + dz * dz;
      }
      
      public static function Dist(v1:Vector3D, v2:Vector3D) : Number
      {
         return Math.sqrt(DistCarre(v1,v2));
      }
      
      public function Normalize() : void
      {
         var dist:Number = Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
         if(dist < 1e-13)
         {
            this.x = 0;
            this.y = 0;
            this.z = 0;
            return;
         }
         this.x /= dist;
         this.y /= dist;
         this.z /= dist;
      }
   }
}

