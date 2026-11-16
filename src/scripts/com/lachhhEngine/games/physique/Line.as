package com.lachhhEngine.games.physique
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.factory.FactoryObject;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaLine;
   import flash.geom.Point;
   
   public class Line extends FactoryObject
   {
      
      private var nAngle:Number;
      
      private var m_myLinkedLine2:Line = null;
      
      private var nRayonCarre:Number = -1;
      
      private var m_myLinkedLine1:Line = null;
      
      private var m_bDynamic:Boolean = false;
      
      private var nA:Number = -1;
      
      private var nB:Number = -1;
      
      private var nC:Number = -1;
      
      private var m_normVx:Number;
      
      private var m_normVy:Number;
      
      private var m_nFriction:Number;
      
      protected var p1:Point;
      
      protected var p2:Point;
      
      private var vy:Number;
      
      private var m_myJoint1:Circle = null;
      
      private var m_myJoint2:Circle = null;
      
      private var vx:Number;
      
      private var nRayon:Number = -1;
      
      private var pCentre:Point;
      
      private var m_iIndex:int = -1;
      
      public function Line()
      {
         super();
         this.p1 = new Point();
         this.p2 = new Point();
      }
      
      public function ReInit() : void
      {
         this.InitLine(this.metaLine);
      }
      
      public function GetLinkedLine2() : Line
      {
         return this.m_myLinkedLine2;
      }
      
      public function GetVy() : Number
      {
         return this.vy;
      }
      
      public function SetIsDynamic(b:Boolean) : void
      {
         this.m_bDynamic = b;
      }
      
      public function IsAFloor() : Boolean
      {
         return this.Angle() < 60 && this.Angle() > -60;
      }
      
      public function GetLinkedLine1() : Line
      {
         return this.m_myLinkedLine1;
      }
      
      public function get normVy() : Number
      {
         return this.m_normVy;
      }
      
      public function get metaLine() : MetaLine
      {
         return MetaLine(metaInfo);
      }
      
      public function get normVx() : Number
      {
         return this.m_normVx;
      }
      
      public function GetVx() : Number
      {
         return this.vx;
      }
      
      public function GetCenterPoint() : Point
      {
         return this.pCentre;
      }
      
      public function GetNormLine() : Line
      {
         var x:Number = this.pCentre.x;
         var y:Number = this.pCentre.y;
         var vx:Number = this.m_normVx * 20;
         var vy:Number = this.m_normVy * 20;
         var x2:Number = x + vx;
         var y2:Number = y + vy;
         return PhysicManager.instance.CreateLine(x,x2,y,y2,false,false);
      }
      
      public function get canWallKick() : Boolean
      {
         return this.metaLine.canWallKick;
      }
      
      public function set y2(n:Number) : void
      {
         this.metaLine.y2 = n;
         this.InitLine(this.metaLine);
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         var metaLine:MetaLine = MetaLine(metaObject);
         this.InitLine(metaLine);
         this.m_myJoint1 = null;
         this.m_myJoint2 = null;
         this.m_myLinkedLine1 = null;
         this.m_myLinkedLine2 = null;
         this.m_bDynamic = false;
      }
      
      public function IsMoving() : Boolean
      {
         return false;
      }
      
      public function get x1() : Number
      {
         return this.metaLine.x1;
      }
      
      public function Angle() : Number
      {
         return this.nAngle;
      }
      
      public function IsPointInPositiveSide(x:Number, y:Number) : Boolean
      {
         return this.nA * x + this.nB * y + this.nC > 0;
      }
      
      public function GetJoint1() : Circle
      {
         return this.m_myJoint1;
      }
      
      public function GetJoint2() : Circle
      {
         return this.m_myJoint2;
      }
      
      public function IsACeiling(tolerance:int = 60) : Boolean
      {
         return this.Angle() > 90 + tolerance || this.Angle() < -(90 + tolerance);
      }
      
      public function set canWallKick(b:Boolean) : void
      {
         this.metaLine.canWallKick = b;
      }
      
      private function InitLine(metaLine:MetaLine) : void
      {
         if(metaLine.x1 == metaLine.x2 && metaLine.y1 == metaLine.y2)
         {
         }
         this.m_nFriction = 0;
         this.pCentre = new Point((metaLine.x2 - metaLine.x1) / 2 + metaLine.x1,(metaLine.y2 - metaLine.y1) / 2 + metaLine.y1);
         this.nRayon = Math.sqrt(Math.pow(metaLine.x2 - metaLine.x1,2) + Math.pow(metaLine.y2 - metaLine.y1,2)) / 2;
         this.nRayonCarre = this.nRayon * this.nRayon;
         var sinaTemp:Number = this.nRayon != 0 ? (metaLine.y2 - metaLine.y1) / (this.nRayon * 2) : 0;
         var cosaTemp:Number = this.nRayon != 0 ? (metaLine.x2 - metaLine.x1) / (this.nRayon * 2) : 0;
         var Lox:Number = this.pCentre.x;
         var Loy:Number = this.pCentre.y;
         var Lvx:Number = cosaTemp;
         var Lvy:Number = sinaTemp;
         this.p1.x = metaLine.x1;
         this.p1.y = metaLine.y1;
         this.p2.x = metaLine.x2;
         this.p2.y = metaLine.y2;
         this.m_normVx = sinaTemp;
         this.m_normVy = -cosaTemp;
         this.nAngle = EquationVecto.GetRotation(metaLine.x2,metaLine.x1,metaLine.y2,metaLine.y1);
         this.nA = Lvy;
         this.nB = -Lvx;
         this.nC = Lvx * Loy - Lvy * Lox;
         this.vx = cosaTemp;
         this.vy = sinaTemp;
      }
      
      public function A() : Number
      {
         return this.nA;
      }
      
      public function SetJoint1(oCircle:Circle, line:Line) : void
      {
         this.m_myJoint1 = oCircle;
         this.m_myLinkedLine1 = line;
      }
      
      public function SetJoint2(oCircle:Circle, line:Line) : void
      {
         this.m_myJoint2 = oCircle;
         this.m_myLinkedLine2 = line;
      }
      
      public function GetVelocity() : Point
      {
         return new Point();
      }
      
      public function set canDrop(b:Boolean) : void
      {
         this.metaLine.canDrop = b;
      }
      
      public function IsDynamic() : Boolean
      {
         return this.m_bDynamic;
      }
      
      public function GetFriction() : Number
      {
         return this.m_nFriction;
      }
      
      public function C() : Number
      {
         return this.nC;
      }
      
      public function GetRayonCarre() : Number
      {
         return this.nRayonCarre;
      }
      
      public function get y1() : Number
      {
         return this.metaLine.y1;
      }
      
      public function get y2() : Number
      {
         return this.metaLine.y2;
      }
      
      public function B() : Number
      {
         return this.nB;
      }
      
      public function get x2() : Number
      {
         return this.metaLine.x2;
      }
      
      public function set y1(n:Number) : void
      {
         this.metaLine.y1 = n;
         this.InitLine(this.metaLine);
      }
      
      public function get canDrop() : Boolean
      {
         return this.metaLine.canDrop;
      }
      
      public function DestroyJoint1() : void
      {
         this.m_myJoint1 = null;
         this.m_myLinkedLine1 = null;
      }
      
      public function GetIndexAAA() : int
      {
         return this.m_iIndex;
      }
      
      public function GetDistanceWithCircle(c:Circle) : Number
      {
         return this.nA * c.x + this.nB * c.y + this.nC;
      }
      
      public function DestroyJoint2() : void
      {
         this.m_myJoint2 = null;
         this.m_myLinkedLine2 = null;
      }
      
      public function SetIndexAAA(i:int) : void
      {
         this.m_iIndex = i;
      }
      
      public function set x1(n:Number) : void
      {
         this.metaLine.x1 = n;
         this.InitLine(this.metaLine);
      }
      
      public function GetRayon() : Number
      {
         return this.nRayon;
      }
      
      public function set x2(n:Number) : void
      {
         this.metaLine.x2 = n;
         this.InitLine(this.metaLine);
      }
      
      public function IsPointInNegativeSide(x:Number, y:Number) : Boolean
      {
         return this.nA * x + this.nB * y + this.nC < 0;
      }
      
      public function IsPointInOnLine(x:Number, y:Number) : Boolean
      {
         return this.nA * x + this.nB * y + this.nC == 0;
      }
   }
}

