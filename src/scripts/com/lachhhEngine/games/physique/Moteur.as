package com.lachhhEngine.games.physique
{
   import com.lachhhEngine.games.Game;
   import flash.geom.Point;
   
   public class Moteur
   {
      
      private static var _isInit:Boolean = false;
      
      private static var MAX_COL:Number = 5;
      
      private static var _nGravite:Number = 2;
      
      public static var MSG_OK:int = 0;
      
      public static var MSG_TOO_MUCH_COLLISION:int = 1;
      
      public function Moteur()
      {
         super();
      }
      
      public static function GetGravite() : Number
      {
         return _nGravite;
      }
      
      public static function set nGravite(nGravite:Number) : void
      {
         _nGravite = nGravite;
      }
      
      public static function Init() : void
      {
         if(_isInit)
         {
            return;
         }
         _isInit = true;
         EquationVecto.Init();
      }
      
      public static function FirstContact(context:Game, ball:Actor, myTabLines:Array, myTabPoint:Array) : void
      {
         ball.vx *= context.speedManager.GetSpeed();
         ball.vy *= context.speedManager.GetSpeed();
         var objCollision:Collision = EquationVecto.CheckCollision(ball,myTabLines,myTabPoint,1);
         ball.lastCol = objCollision;
         ball.isOnFloor = false;
         if(objCollision == null)
         {
            ball.px += ball.vx;
            ball.py += ball.vy;
         }
         else
         {
            ball.px = objCollision.pFirstCollision.x;
            ball.py = objCollision.pFirstCollision.y;
            if(objCollision.line != null)
            {
               ball.isOnFloor = objCollision.line.IsAFloor();
            }
         }
         ball.vx /= context.speedManager.GetSpeed();
         ball.vy /= context.speedManager.GetSpeed();
      }
      
      public static function StickToGround(context:Game, ball:Actor, myTabLines:Array, myTabPoint:Array) : int
      {
         var nCollision:int = 0;
         var oldVX:Number = ball.vx;
         var oldVY:Number = ball.vy;
         ball.vx *= context.speedManager.GetSpeed();
         ball.vy *= context.speedManager.GetSpeed();
         var objCollision:Collision = EquationVecto.CheckCollision(ball,myTabLines,myTabPoint,0);
         ball.lastCol = objCollision;
         ball.isOnFloor = false;
         while(objCollision != null && nCollision < MAX_COL)
         {
            (++ball).vx = objCollision.vecFinal.x;
            ball.vy = objCollision.vecFinal.y;
            ball.px = objCollision.pFirstCollision.x;
            ball.py = objCollision.pFirstCollision.y;
            ball.lastCol = objCollision;
            if(objCollision.line != null)
            {
               ball.isOnFloor = ball.isOnFloor || objCollision.line.IsAFloor();
            }
            objCollision = EquationVecto.CheckCollision(ball,myTabLines,myTabPoint,0);
         }
         if(nCollision >= MAX_COL)
         {
            return MSG_TOO_MUCH_COLLISION;
         }
         if(nCollision > 0)
         {
            ball.isOnLine = true;
            ball.px = ball.lastCol.pFinal.x;
            ball.py = ball.lastCol.pFinal.y;
         }
         else
         {
            ball.isOnLine = false;
            ball.px += ball.vx;
            ball.py += ball.vy;
         }
         ball.vx = oldVX;
         ball.vy = oldVY;
         return MSG_OK;
      }
      
      public static function JustRebound(context:Game, ball:Actor, myTabLines:Array, myTabPoint:Array, bManageSpeed:Boolean = true) : void
      {
         var prct:Number = NaN;
         var vecFinal:Point = null;
         var nCollision:Number = 0;
         if(bManageSpeed)
         {
            ball.vx *= context.speedManager.GetSpeed();
            ball.vy *= context.speedManager.GetSpeed();
         }
         var objCollision:Collision = EquationVecto.CheckCollision(ball,myTabLines,myTabPoint,1);
         ball.lastCol = objCollision;
         ball.isOnFloor = false;
         if(objCollision != null)
         {
            ball.vitesse = objCollision.distV1 + objCollision.distV2;
            prct = objCollision.distV2 / ball.vitesse;
            if(prct > 0.999)
            {
               prct = 1;
            }
            while(objCollision != null && nCollision < MAX_COL)
            {
               nCollision++;
               ball.vx = objCollision.vecFinal.x;
               ball.vy = objCollision.vecFinal.y;
               ball.px = objCollision.pFirstCollision.x;
               ball.py = objCollision.pFirstCollision.y;
               ball.lastCol = objCollision;
               if(objCollision.line != null)
               {
                  ball.isOnFloor = objCollision.line.IsAFloor();
               }
               objCollision = EquationVecto.CheckCollision(ball,myTabLines,myTabPoint,1);
            }
            if(nCollision > 0)
            {
               vecFinal = ball.lastCol.vecFinal;
               vecFinal = EquationVecto.NormalizeVec(vecFinal);
               ball.vx = (ball.vitesse + (1 - prct) * ball.grav - ball.grav * prct) * vecFinal.x * ball.nBounce;
               ball.vy = (ball.vitesse + (1 - prct) * ball.grav - ball.grav * prct) * vecFinal.y * ball.nBounce;
               ball.px = ball.lastCol.pFinal.x;
               ball.py = ball.lastCol.pFinal.y;
            }
            else
            {
               ball.px += ball.vx;
               ball.py += ball.vy;
            }
         }
         else
         {
            ball.px += ball.vx;
            ball.py += ball.vy;
         }
         if(bManageSpeed)
         {
            ball.vx /= context.speedManager.GetSpeed();
            ball.vy /= context.speedManager.GetSpeed();
         }
      }
   }
}

