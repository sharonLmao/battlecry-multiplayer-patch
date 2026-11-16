package com.lachhhEngine.games.debug
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.physique.Circle;
   import com.lachhhEngine.games.physique.Line;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class Debug
   {
      
      public static const GD_LIGNE:Number = 0;
      
      public static const GD_BALL:Number = 1;
      
      public static const GD_HELP:Number = 2;
      
      public static const GD_POINT:Number = 3;
      
      private static var tabGrpDessin:Array = new Array();
      
      private static var tabGrpID:Array = new Array();
      
      private static var _showLines:Boolean = false;
      
      public function Debug()
      {
         super();
      }
      
      public static function DessinePoints(context:Game, tabPoint:Array, color:int = 65280) : void
      {
         var crntPoint:Circle = null;
         var rayon:Number = NaN;
         var px:Number = NaN;
         var py:Number = NaN;
         ChangeCouleur(2,color,1,GD_LIGNE);
         for(var i:int = 0; i < tabPoint.length; i++)
         {
            crntPoint = Circle(tabPoint[i]);
            if(crntPoint != null)
            {
               rayon = crntPoint.rayon;
               px = crntPoint.x + context.camera.GetOffsetX(context.actionLayer);
               py = crntPoint.y + context.camera.GetOffsetY(context.actionLayer);
               tabGrpDessin[GD_LIGNE].graphics.drawCircle(px,py,rayon);
            }
         }
      }
      
      public static function set showLines(showLines:Boolean) : void
      {
         _showLines = showLines;
      }
      
      public static function DessineLigne(context:Game, tabLines:Array, color:int = 65280) : void
      {
         var crntLine:Line = null;
         var j:int = 0;
         var otherLine:Line = null;
         ChangeCouleur(2,color,1,GD_LIGNE);
         var bCheckForDoubleSens:Boolean = false;
         for(var i:int = 0; i < tabLines.length; i++)
         {
            bCheckForDoubleSens = false;
            crntLine = tabLines[i];
            if(!(crntLine == null || crntLine.metaInfo == null))
            {
               for(j = i; j < tabLines.length; j++)
               {
                  if(j != i)
                  {
                     otherLine = tabLines[j];
                     if(!(otherLine == null || otherLine.metaInfo == null))
                     {
                        if(otherLine.x1 == crntLine.x2 && otherLine.y1 == crntLine.y2 && otherLine.x2 == crntLine.x1 && otherLine.y2 == crntLine.y1)
                        {
                           bCheckForDoubleSens = true;
                        }
                     }
                  }
               }
               if(bCheckForDoubleSens)
               {
                  ChangeCouleur(3,16711680,100,GD_LIGNE);
                  MakeLine(context,crntLine.x1,crntLine.x2,crntLine.y1,crntLine.y2,GD_LIGNE);
                  ChangeCouleur(1,65280,100,GD_LIGNE);
               }
               else
               {
                  MakeLine(context,crntLine.x1,crntLine.x2,crntLine.y1,crntLine.y2,GD_LIGNE);
               }
            }
         }
      }
      
      public static function AddDessinGroup(grpId:Number, mcContainer:MovieClip) : Boolean
      {
         if(mcContainer == null)
         {
            return false;
         }
         tabGrpDessin[grpId] = mcContainer;
         tabGrpID.push(grpId);
         EffaceGroupeDessin(grpId);
         return true;
      }
      
      public static function get showLines() : Boolean
      {
         return _showLines;
      }
      
      public static function DessineLineFromPoints(context:Game, p1:Point, p2:Point, color:int = 65280) : void
      {
         ChangeCouleur(2,color,1,GD_LIGNE);
         MakeLine(context,p1.x,p2.x,p1.y,p2.y,GD_LIGNE);
      }
      
      public static function MakeLine(context:Game, x1:Number, x2:Number, y1:Number, y2:Number, grpId:Number = 0) : void
      {
         tabGrpDessin[grpId].graphics.moveTo(x1 + context.camera.GetOffsetX(context.actionLayer),y1 + context.camera.GetOffsetY(context.actionLayer));
         tabGrpDessin[grpId].graphics.lineTo(x2 + context.camera.GetOffsetX(context.actionLayer),y2 + context.camera.GetOffsetY(context.actionLayer));
      }
      
      public static function EffaceGroupeDessin(grpId:Number) : Boolean
      {
         if(tabGrpDessin[grpId] == undefined)
         {
            return false;
         }
         tabGrpDessin[grpId].graphics.clear();
         ChangeCouleur(2,65280,100,grpId);
         return true;
      }
      
      public static function ChangeCouleur(nEpaisseur:Number, hexaCouleur:Number, nAlpha:Number, grpId:Number) : void
      {
         tabGrpDessin[grpId].graphics.lineStyle(nEpaisseur,hexaCouleur,nAlpha);
      }
      
      public static function MakeLineFromMc(context:Game, mc1:MovieClip, mc2:MovieClip, grpId:Number = 0) : void
      {
         MakeLine(context,mc1.x,mc2.x,mc1.y,mc2.y,grpId);
      }
      
      public static function GetContainer() : MovieClip
      {
         return tabGrpDessin[GD_LIGNE];
      }
      
      public static function DessineCircle(context:Game, x:Number, y:Number, rayon:Number, color:int = 65280) : void
      {
         var px:Number = x + context.camera.GetOffsetX(context.actionLayer);
         var py:Number = y + context.camera.GetOffsetY(context.actionLayer);
         ChangeCouleur(2,color,1,GD_LIGNE);
         tabGrpDessin[GD_LIGNE].graphics.drawCircle(px,py,rayon);
      }
   }
}

