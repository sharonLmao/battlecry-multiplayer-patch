package com.lachhhEngine.games.physique
{
   import flash.geom.Point;
   
   public class EquationVecto
   {
      
      private static var tabSin:Array = new Array();
      
      private static var tabCos:Array = new Array();
      
      private static var a:Number = 0;
      
      private static var p:Number = Math.PI / 360;
      
      private static var m_bIsInit:Boolean = false;
      
      public function EquationVecto()
      {
         super();
      }
      
      public static function GetNearestCollisionWithPoint(tabCircle:Array, ball:Actor) : Object
      {
         var oLine1:Line = null;
         var oLine2:Line = null;
         var minDist:Number = -1;
         var pReturnFirstCol:Point = new Point(0,0);
         var pReturn:Circle = null;
         var nDistTemp:Number = 0;
         var pFirstCol:Point = null;
         var distTrajectoire:Number = ball.vx * ball.vx + ball.vy * ball.vy;
         var distT:Number = Math.sqrt(distTrajectoire);
         var rayonTraj:Number = 0;
         for(var i:int = 0; i < tabCircle.length; i++)
         {
            if(!(tabCircle[i] == null || Circle(tabCircle[i]).metaInfo == null))
            {
               rayonTraj = (distT / 2 + (ball.rayon + tabCircle[i].rayon)) * (distT / 2 + (ball.rayon + tabCircle[i].rayon));
               pFirstCol = GetGpFromPoint(tabCircle[i].point,ball,distT,tabCircle[i].rayon);
               if(pFirstCol != null)
               {
                  oLine1 = PhysicManager.instance.CreateLine(tabCircle[i].x,pFirstCol.x,tabCircle[i].y,pFirstCol.y,false,false);
                  oLine2 = oLine1.GetNormLine();
                  if(tabCircle[i].AngleIsInRange(oLine2.Angle()))
                  {
                     nDistTemp = (ball.px - pFirstCol.x) * (ball.px - pFirstCol.x) + (ball.py - pFirstCol.y) * (ball.py - pFirstCol.y);
                     if(minDist == -1 || nDistTemp < minDist)
                     {
                        minDist = nDistTemp;
                        pReturnFirstCol.x = pFirstCol.x;
                        pReturnFirstCol.y = pFirstCol.y;
                        pReturn = tabCircle[i];
                     }
                  }
                  PhysicManager.instance.DestroyPhysicObject(oLine1);
                  PhysicManager.instance.DestroyPhysicObject(oLine2);
               }
            }
         }
         if(pReturn != null)
         {
            return {
               "point":pReturn,
               "pFirstCol":pReturnFirstCol
            };
         }
         return null;
      }
      
      public static function GetNearestCollisionWithLine(tabLine:Array, ball:Actor, force:Boolean = false) : Object
      {
         var crntLine:Line = null;
         var vectFirstColx:Number = NaN;
         var vectFirstColy:Number = NaN;
         var minDist:Number = -1;
         var line:Line = null;
         var distFirstCol:Number = 0;
         var vCx:Number = 0;
         var vCy:Number = 0;
         var lA:Number = 0;
         var lB:Number = 0;
         var lC:Number = 0;
         var cx:Number = 0;
         var cy:Number = 0;
         var lCx:Number = 0;
         var lCy:Number = 0;
         var nvx:Number = ball.px + ball.vx;
         var nvy:Number = ball.py + ball.vy;
         var Oox:Number = nvx;
         var Ooy:Number = nvy;
         var Ovx:Number = ball.vx;
         var Ovy:Number = ball.vy;
         var Ab:Number = Ovy;
         var Bb:Number = -Ovx;
         var Cb:Number = Ovx * Ooy - Ovy * Oox;
         var rayon:Number = ball.rayon;
         var sens:Number = 0;
         var dist:Number = 0;
         var sensBallInit:Number = 0;
         for(var i:int = 0; i < tabLine.length; i++)
         {
            crntLine = tabLine[i];
            if(!(crntLine == null || crntLine.metaInfo == null))
            {
               lA = crntLine.A();
               lB = crntLine.B();
               lC = crntLine.C() - rayon;
               if(!(Ab * lB - lA * Bb == 0 && lA * Bb - Ab * lB == 0))
               {
                  if(lA != 0)
                  {
                     lCy = (lA * Cb - Ab * lC) / (Ab * lB - lA * Bb);
                     lCx = (-lB * lCy - lC) / lA;
                  }
                  else
                  {
                     lCx = (lB * Cb - lC * Bb) / (lA * Bb - Ab * lB);
                     lCy = (-lA * lCx - lC) / lB;
                  }
                  if(isNaN(lCx) || !isFinite(lCx))
                  {
                     trace("ERROR:EQUATIONVECTO_c::GetNearestCollisionWithLine");
                     trace("lA : " + lA);
                     trace("lB : " + lB);
                     trace("lC : " + lC);
                     trace("Ab : " + Ab);
                     trace("Bb : " + Bb);
                     trace("Cb : " + Cb);
                     trace("(Ab*lB - lA*Bb) : " + (lA * Bb - Ab * lB));
                     return null;
                  }
                  vectFirstColx = lCx - ball.px;
                  vectFirstColy = lCy - ball.py;
                  distFirstCol = vectFirstColx * vectFirstColx + vectFirstColy * vectFirstColy;
                  vCx = crntLine.GetCenterPoint().x - lCx;
                  vCy = crntLine.GetCenterPoint().y - lCy;
                  sens = lA * Oox + lB * Ooy + lC;
                  dist = sens * sens / (lA * lA + lB * lB);
                  sensBallInit = lA * ball.px + lB * ball.py + lC;
                  if(!(vCx * vCx + vCy * vCy >= Math.pow(crntLine.GetRayon() + rayon / 2,2) && !force))
                  {
                     if(sensBallInit >= 0)
                     {
                        if(sens < 0 || dist < 0)
                        {
                           if(minDist == -1 || distFirstCol < minDist)
                           {
                              minDist = distFirstCol;
                              cx = lCx;
                              cy = lCy;
                              line = crntLine;
                           }
                        }
                     }
                  }
               }
            }
         }
         if(minDist != -1)
         {
            return {
               "line":line,
               "pFirstCol":new Point(cx,cy)
            };
         }
         return null;
      }
      
      public static function GetGpFromPoint(p:Point, ball:Actor, distT:Number, nRayon:Number) : Point
      {
         var distNpCp:Number = NaN;
         var distGpNp:Number = NaN;
         var vecUnTX:Number = NaN;
         var vecUnTY:Number = NaN;
         var nvx:Number = ball.px + ball.vx;
         var nvy:Number = ball.py + ball.vy;
         var Oox:Number = nvx;
         var Ooy:Number = nvy;
         var Ovx:Number = ball.vx;
         var Ovy:Number = ball.vy;
         var Ab:Number = Ovy;
         var Bb:Number = -Ovx;
         var Cb:Number = Ovx * Ooy - Ovy * Oox;
         var Ac:Number = -Ovx;
         var Bc:Number = -Ovy;
         var Cc:Number = Ovy * p.y + Ovx * p.x;
         var Ad:Number = -Ovx;
         var Bd:Number = -Ovy;
         var Cd:Number = Ovy * ball.py + Ovx * ball.px;
         var rayonCarre:Number = (ball.rayon + nRayon) * (ball.rayon + nRayon);
         var sensPoint:Number = Ab * p.x + Bb * p.y + Cb;
         var distPoint:Number = sensPoint * sensPoint / (Ab * Ab + Bb * Bb);
         var sensPointNormale:Number = Ad * p.x + Bd * p.y + Cd;
         var distPointNormale:Number = sensPoint * sensPoint / (Ad * Ad + Bd * Bd);
         var Npx:Number = 0;
         var Npy:Number = 0;
         var gPx:Number = 0;
         var gPy:Number = 0;
         var distPointGp:Number = 0;
         if(distPoint <= rayonCarre && (sensPointNormale < 0 || distPointNormale < 0))
         {
            if(Ac * Bb - Ab * Bc == 0 && Ab * Bc - Ac * Bb == 0)
            {
               trace("HAHA !");
               return null;
            }
            if(Ab != 0)
            {
               Npy = (Ab * Cc - Ac * Cb) / (Ac * Bb - Ab * Bc);
               Npx = (-Bb * Npy - Cb) / Ab;
            }
            else
            {
               Npx = (Bb * Cc - Cb * Bc) / (Ab * Bc - Ac * Bb);
               Npy = (-Ab * Npx - Cb) / Bb;
            }
            distNpCp = (Npx - p.x) * (Npx - p.x) + (Npy - p.y) * (Npy - p.y);
            if(rayonCarre < distNpCp)
            {
               trace("WARNING :: EquationVecto_c :: GetGpFromPoint :: Ok, probleme icitte la");
               trace("distNpCp : " + distNpCp);
               trace("p : " + p);
               trace("Npx : " + Npx + "/" + Npy);
               trace("rayonCarre : " + rayonCarre + "/" + nRayon);
               trace("distPoint : " + distPoint);
               return null;
            }
            distGpNp = Math.sqrt(rayonCarre - distNpCp);
            vecUnTX = ball.vx / distT;
            vecUnTY = ball.vy / distT;
            gPx = Npx - vecUnTX * distGpNp;
            gPy = Npy - vecUnTY * distGpNp;
            if(isNaN(gPx))
            {
               trace("gPx :: " + Npx + "/" + vecUnTX + "/" + distGpNp + "/" + rayonCarre + "/" + distNpCp + "/" + distPoint + "/" + Npx + "/" + Npy + "/" + p);
               return null;
            }
            distPointGp = (ball.px - gPx) * (ball.px - gPx) + (ball.py - gPy) * (ball.py - gPy);
            return new Point(gPx,gPy);
         }
         return null;
      }
      
      public static function GetAllCollisionWithPoint(tabPoint:Array, ball:Actor) : Array
      {
         var distBallPointCentre:Number = NaN;
         var tabCircleCollision:Array = new Array();
         var distTrajectoire:Number = ball.vx * ball.vx + ball.vy * ball.vy;
         var distT:Number = Math.sqrt(distTrajectoire);
         var rayonTraj:Number = 0;
         var nvx:Number = ball.px + ball.vx;
         var nvy:Number = ball.py + ball.vy;
         var pArrive:Point = new Point(nvx,nvy);
         var pBall:Point = new Point(ball.px,ball.py);
         var pCentralTraj:Point = GetPCentral(pBall,pArrive);
         for(var i:int = 0; i < tabPoint.length; i++)
         {
            if(tabPoint[i] != null)
            {
               rayonTraj = (distT / 2 + (ball.rayon + tabPoint[i].rayon)) * (distT / 2 + (ball.rayon + tabPoint[i].rayon));
               distBallPointCentre = GetDistAuCarre(pCentralTraj,tabPoint[i]);
               if(distBallPointCentre <= rayonTraj)
               {
                  tabCircleCollision.push(tabPoint[i]);
               }
            }
         }
         return tabCircleCollision;
      }
      
      public static function AngleToRadians(n:Number) : Number
      {
         return n / 180 * Math.PI;
      }
      
      public static function SetEquilibreInstantane(ball:Actor, objCollision:Collision, prctToAdd:Number) : void
      {
         var modSens:Number = objCollision.sens > 0 ? 1 : (objCollision.sens == 0 ? 0 : -1);
         var prct:Number = GetNorm(objCollision.vecFollowSansPerte) == 0 ? 0 : GetNorm(objCollision.vecFollow) / GetNorm(objCollision.vecFollowSansPerte);
         var energieCinetique:Number = prct * ball.vitesse * modSens;
         var energieAngulaire:Number = ball.vitesseAngulaire / 360 * ball.circonference;
         var equilibre:Number = (energieCinetique + energieAngulaire) / 2;
         if(equilibre / energieCinetique == 1)
         {
            return;
         }
         var nToAdd:Number = energieAngulaire - energieCinetique;
         ball.vitesseAngulaire -= nToAdd * prctToAdd / ball.circonference * 360;
      }
      
      public static function GetDifferenceEnergieAngulaire(ball:Actor, vecFollow:Point, vecFollowSansPerte:Point, sens:Number, nFriction:Number) : Number
      {
         var vitesse:Number = ball.vitesse;
         var modSens:Number = sens > 0 ? 1 : (sens == 0 ? 0 : -1);
         var energieCinetique:Number = vitesse * modSens;
         var energieAngulaire:Number = ball.vitesseAngulaire / 360 * ball.circonference;
         return (energieAngulaire - energieCinetique) * (nFriction / 10);
      }
      
      public static function GetDistAuCarre(p1:Point, p2:Point) : Number
      {
         return (p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y);
      }
      
      public static function GetObjCollision(line:Line, pFirstCol:Point, ball:Actor, nPrctBounce:Number, pointOfCollision:Circle) : Collision
      {
         if(line == null)
         {
            return null;
         }
         var colObj:Collision = new Collision();
         var nvx:Number = ball.px + ball.vx;
         var nvy:Number = ball.py + ball.vy;
         var Oox:Number = nvx;
         var Ooy:Number = nvy;
         var Ovx:Number = ball.vx;
         var Ovy:Number = ball.vy;
         var Ab:Number = Ovy;
         var Bb:Number = -Ovx;
         var Cb:Number = Ovx * Ooy - Ovy * Oox;
         colObj.sens = 0;
         var Np:Point = null;
         var pFinalX:Number = 0;
         var pFinalY:Number = 0;
         var cx:Number = pFirstCol.x;
         var cy:Number = pFirstCol.y;
         var p1:Point = new Point(line.x1,line.y1);
         var p2:Point = new Point(line.x2,line.y2);
         colObj.distV1 = Math.sqrt((ball.px - cx) * (ball.px - cx) + (ball.py - cy) * (ball.py - cy));
         colObj.distV2 = Math.sqrt((nvx - cx) * (nvx - cx) + (nvy - cy) * (nvy - cy));
         var vecVarMinime:Point = new Point(p2.y - p1.y,p1.x - p2.x);
         vecVarMinime = MultiplyVec(NormalizeVec(vecVarMinime),1 / 2000);
         Np = GetNpPoint(line,ball);
         colObj.vecFollow = new Point(Np.x - cx,Np.y - cy);
         colObj.vecFollow = MultiplyVec(NormalizeVec(colObj.vecFollow),GetNorm(colObj.vecFollow) + GetNorm(vecVarMinime));
         colObj.vecFollowSansPerte = MultiplyVec(NormalizeVec(colObj.vecFollow),colObj.distV2);
         colObj.vecRebound = new Point(Np.x - nvx,Np.y - nvy);
         colObj.vecRebound = MultiplyVec(colObj.vecRebound,ball.nBounce * nPrctBounce);
         colObj.vecFinal = new Point(0,0);
         colObj.vecFinal = colObj.vecFollow.add(colObj.vecRebound);
         colObj.pFinal = new Point(0,0);
         colObj.pFinal.x = cx + colObj.vecFinal.x + vecVarMinime.x + line.GetVelocity().x;
         colObj.pFinal.y = cy + colObj.vecFinal.y + vecVarMinime.y + line.GetVelocity().y;
         colObj.sens = Ab * pFinalX + Bb * pFinalY + Cb;
         colObj.vecAng = colObj.vecFollow.clone();
         var energieAngulaire:Number = GetDifferenceEnergieAngulaire(ball,colObj.vecFollow,colObj.vecFollowSansPerte,colObj.sens,line.GetFriction());
         colObj.vecAng.x = line.GetVx() * energieAngulaire * line.GetFriction();
         colObj.vecAng.y = line.GetVy() * energieAngulaire * line.GetFriction();
         colObj.line = line;
         colObj.pFirstCollision = new Point(cx + vecVarMinime.x,cy + vecVarMinime.y);
         colObj.pointOfCollision = pointOfCollision;
         return colObj;
      }
      
      public static function GetNorm(p:Point) : Number
      {
         return Math.sqrt(p.x * p.x + p.y * p.y);
      }
      
      public static function MyCos(n:Number) : Number
      {
         a = n;
         while(a < 0)
         {
            a += 360;
         }
         a = Math.floor(a * 2);
         a = Math.min(Math.max(0,a),719);
         return tabCos[a];
      }
      
      public static function NormalizeCoor(x:Number, y:Number) : Point
      {
         return NormalizeVec(new Point(x,y));
      }
      
      public static function CollisionEntreCercle(b:Actor, tabPoint:Array) : Circle
      {
         var crntPoint:Circle = null;
         if(tabPoint == null || b == null)
         {
            return null;
         }
         for(var i:int = 0; i < tabPoint.length; i++)
         {
            crntPoint = Circle(tabPoint[i]);
            if(!(crntPoint == null || crntPoint.metaInfo == null))
            {
               if(GetDistAuCarre(new Point(b.px,b.py),crntPoint.point) <= Math.pow(b.rayon + crntPoint.rayon,2))
               {
                  return crntPoint;
               }
            }
         }
         return null;
      }
      
      public static function GetRotation(x1:Number, x2:Number, y1:Number, y2:Number) : Number
      {
         var dx:Number = x1 - x2;
         var dy:Number = y1 - y2;
         var rot:Number = Math.atan2(dy,dx);
         return rot / Math.PI * 180;
      }
      
      public static function GetNpPoint(line:Line, ball:Actor) : Point
      {
         var A:Number = line.A();
         var B:Number = line.B();
         var C:Number = line.C() - ball.rayon;
         var nvx:Number = ball.px + ball.vx;
         var nvy:Number = ball.py + ball.vy;
         var Npx:Number = 0;
         var Npy:Number = 0;
         var Ac:Number = B;
         var Bc:Number = -A;
         var Cc:Number = A * nvy - B * nvx;
         if(A != 0)
         {
            Npy = (A * Cc - Ac * C) / (Ac * B - A * Bc);
            Npx = (-B * Npy - C) / A;
         }
         else
         {
            Npx = (B * Cc - C * Bc) / (A * Bc - Ac * B);
            Npy = (-A * Npx - C) / B;
         }
         return new Point(Npx,Npy);
      }
      
      public static function CollisionsEntreCercle(b:Actor, tabPoint:Array) : Array
      {
         var result:Array = null;
         var crntPoint:Circle = null;
         if(tabPoint == null || b == null)
         {
            return null;
         }
         for(var i:int = 0; i < tabPoint.length; i++)
         {
            crntPoint = Circle(tabPoint[i]);
            if(!(crntPoint == null || crntPoint.metaInfo == null))
            {
               if(GetDistAuCarre(new Point(b.px,b.py),crntPoint.point) <= Math.pow(b.rayon + crntPoint.rayon,2))
               {
                  if(result == null)
                  {
                     result = new Array();
                  }
                  result.push(crntPoint);
               }
            }
         }
         return result;
      }
      
      public static function CheckCollision(ball:Actor, tabLine:Array, tabCircle:Array, nY:Number, bTrace:Boolean = false) : Collision
      {
         var linePoint1:Line = null;
         var objLinePoint1:Object = null;
         var linePoint2:Line = null;
         var objLinePoint2:Object = null;
         if(ball.vx == 0 && ball.vy == 0)
         {
            return null;
         }
         var myLine:Object = tabLine == null ? null : GetNearestCollisionWithLine(tabLine,ball);
         var myPoint:Object = tabCircle == null ? null : GetNearestCollisionWithPoint(tabCircle,ball);
         if(bTrace && myPoint != null)
         {
            trace("myLine : " + myLine + "/" + myPoint.point + "/" + myPoint.pFirstCol);
         }
         if(myLine == null && myPoint == null)
         {
            return null;
         }
         if(myPoint == null)
         {
            return GetObjCollision(myLine.line,myLine.pFirstCol,ball,nY,null);
         }
         if(myLine == null)
         {
            linePoint1 = CreateLineFromPoint(myPoint.point,myPoint.pFirstCol);
            objLinePoint1 = GetNearestCollisionWithLine([linePoint1],ball,true);
            if(objLinePoint1 == null)
            {
               PhysicManager.instance.DestroyPhysicObject(linePoint1);
               return null;
            }
            return GetObjCollision(objLinePoint1.line,objLinePoint1.pFirstCol,ball,nY,myPoint.point);
         }
         var distLine:Number = GetDistAuCarre(myLine.pFirstCol,new Point(ball.px,ball.py));
         var distPoint:Number = GetDistAuCarre(myPoint.pFirstCol,new Point(ball.px,ball.py));
         if(distLine < distPoint)
         {
            return GetObjCollision(myLine.line,myLine.pFirstCol,ball,nY,null);
         }
         linePoint2 = CreateLineFromPoint(myPoint.point,myPoint.pFirstCol);
         objLinePoint2 = GetNearestCollisionWithLine([linePoint2],ball,true);
         if(objLinePoint2 == null)
         {
            PhysicManager.instance.DestroyPhysicObject(linePoint2);
            return null;
         }
         return GetObjCollision(objLinePoint2.line,objLinePoint2.pFirstCol,ball,nY,myPoint.point);
      }
      
      public static function MySin(n:Number) : Number
      {
         a = n;
         while(a < 0)
         {
            a += 360;
         }
         a = Math.floor(a * 2);
         a = Math.min(Math.max(0,a),719);
         return tabSin[a];
      }
      
      public static function NormalizeVec(p:Point) : Point
      {
         var dist:Number = Math.sqrt(p.x * p.x + p.y * p.y);
         if(dist < 1e-13)
         {
            return new Point(0,0);
         }
         var X:Number = p.x / dist;
         var Y:Number = p.y / dist;
         return new Point(X,Y);
      }
      
      public static function CreateLineFromPoint(objPoint:Circle, gP:Point) : Line
      {
         var dPoint:Point = new Point(objPoint.x - gP.x,objPoint.y - gP.y);
         var distance2Point:Number = Math.sqrt(dPoint.x * dPoint.x + dPoint.y * dPoint.y);
         if(isNaN(gP.x))
         {
            trace("Putain de probleme");
         }
         var lineTemp:Line = PhysicManager.instance.CreateLine(objPoint.x,gP.x,objPoint.y,gP.y,false,false);
         var x:Number = objPoint.x - objPoint.rayon / distance2Point * dPoint.x;
         var y:Number = objPoint.y - objPoint.rayon / distance2Point * dPoint.y;
         var vx:Number = lineTemp.normVx * -20;
         var vy:Number = lineTemp.normVy * -20;
         var x2:Number = x + vx;
         var y2:Number = y + vy;
         x -= vx;
         y -= vy;
         PhysicManager.instance.DestroyPhysicObject(lineTemp);
         return PhysicManager.instance.CreateLine(x,x2,y,y2,false,false);
      }
      
      public static function Init() : void
      {
         if(m_bIsInit)
         {
            return;
         }
         m_bIsInit = true;
         for(var i:int = 0; i < 720; i++)
         {
            tabCos.push(Math.cos(i * p));
            tabSin.push(Math.sin(i * p));
         }
         tabSin[360] = 0;
      }
      
      public static function GetNearestCircle(obj:Actor, tabCircle:Array) : Circle
      {
         var cReturn:Circle = null;
         var cTemp:Circle = null;
         var minDist:Number = -1;
         var nDistTemp:Number = -1;
         var pObjPos:Point = new Point(obj.px,obj.py);
         for(var i:int = 0; i < tabCircle.length; i++)
         {
            cTemp = tabCircle[i];
            if(cTemp != null)
            {
               nDistTemp = GetDistAuCarre(pObjPos,cTemp.point);
               if(minDist > nDistTemp || minDist == -1)
               {
                  minDist = nDistTemp;
                  cReturn = cTemp;
               }
            }
         }
         return cReturn;
      }
      
      public static function ReduceAngularVelocity(ball:Actor, nFriction:Number) : void
      {
         if(ball.vitesseAngulaire > 0)
         {
            ball.vitesseAngulaire -= nFriction;
         }
         else if(ball.vitesseAngulaire < 0)
         {
            ball.vitesseAngulaire += nFriction;
         }
      }
      
      public static function GetPCentral(p1:Point, p2:Point) : Point
      {
         var X:Number = (p2.x - p1.x) / 2 + p1.x;
         var Y:Number = (p2.y - p1.y) / 2 + p1.y;
         return new Point(X,Y);
      }
      
      public static function MultiplyVec(p:Point, mul:Number) : Point
      {
         return new Point(p.x * mul,p.y * mul);
      }
   }
}

