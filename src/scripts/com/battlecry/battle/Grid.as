package com.battlecry.battle
{
   import com.battlecry.BC_Game;
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class Grid
   {
      
      private var _cadrier:Array = new Array(6);
      
      private var _context:BC_Game;
      
      private var _anim:Animation;
      
      public function Grid()
      {
         super();
      }
      
      public function gridCasePosition(gridCase:GridCase) : Point
      {
         var prout:Point = new Point();
         prout.x = this.leftCorner.x + 8.7 + gridCase.gridPos.x * 17.4;
         prout.y = this.leftCorner.y + 27 + gridCase.gridPos.y * 32.2;
         return prout;
      }
      
      private function get leftCorner() : MovieClip
      {
         return this._anim.getChildByName("left_corner") as MovieClip;
      }
      
      public function GetCaseFromPos(x:int, y:int) : GridCase
      {
         return this._cadrier[y][x] as GridCase;
      }
      
      public function ReturnFreePosition(squadPos:int, teamID:int) : GridPos
      {
         var i:int = 0;
         var j:int = 0;
         if(squadPos < 0 || squadPos > 42)
         {
            return null;
         }
         if(teamID == MiscConstants.TEAM1)
         {
            for(j = 2; j >= 0; j--)
            {
               for(i = 0; i < 6; i++)
               {
                  if((this._cadrier[i][j + squadPos] as GridCase).actor == null)
                  {
                     return new GridPos(j,i);
                  }
               }
            }
         }
         else
         {
            for(j = 0; j < 3; j++)
            {
               for(i = 0; i < 6; i++)
               {
                  if((this._cadrier[i][j + squadPos] as GridCase).actor == null)
                  {
                     return new GridPos(j,i);
                  }
               }
            }
         }
         return null;
      }
      
      public function GetCase(teamId:int, squadId:int, posInSquad:GridPos) : GridCase
      {
         var team:BattleArmy = null;
         var tempogridCase:GridCase = null;
         var gridCase:GridCase = null;
         if(teamId == MiscConstants.TEAM1)
         {
            team = this._context.team1;
         }
         else
         {
            team = this._context.team2;
         }
         var squad:BattleSquad = team.GetSquad(squadId);
         tempogridCase = this._cadrier[posInSquad.y][squad.position + posInSquad.x] as GridCase;
         return this._cadrier[tempogridCase.gridPos.y][tempogridCase.gridPos.x];
      }
      
      public function CheckMoveCase(gridCase:GridCase) : Boolean
      {
         if((this._cadrier[gridCase.gridPos.y][gridCase.gridPos.x] as GridCase).actor == null)
         {
            return true;
         }
         return false;
      }
      
      public function RedSquare(b:Boolean) : void
      {
         var j:int = 0;
         for(var i:int = 0; i < 6; i++)
         {
            for(j = 0; j < 46; j++)
            {
               if(b)
               {
                  (this._cadrier[i][j] as GridCase).ShowRedSquare();
               }
               else
               {
                  (this._cadrier[i][j] as GridCase).HideRedSquare();
               }
            }
         }
      }
      
      public function CheckAttackCase(teamId:int, gridCase:GridCase) : BC_Actor
      {
         var a:BC_Actor = (this._cadrier[gridCase.gridPos.y][gridCase.gridPos.x] as GridCase).actor;
         if(a == null)
         {
            return null;
         }
         if(a.teamId != teamId)
         {
            return a;
         }
         return null;
      }
      
      public function CheckMoveSupGridCase(gridCase:GridCase, currentActor:BC_Actor) : Boolean
      {
         var actor:BC_Actor = (this._cadrier[gridCase.gridPos.y][gridCase.gridPos.x] as GridCase).actor;
         if(actor == null)
         {
            return true;
         }
         if(actor == currentActor)
         {
            return true;
         }
         return false;
      }
      
      public function Init(context:Game) : void
      {
         var j:int = 0;
         this._context = context as BC_Game;
         this._anim = AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_GRID);
         context.levelManager.actionLayer.GetBackFxContainer().addChild(this._anim);
         for(var i:int = 0; i < 6; i++)
         {
            this._cadrier[i] = new Array();
            for(j = 0; j < 46; j++)
            {
               this._cadrier[i][j] = new GridCase(new GridPos(j,i));
               (this._cadrier[i][j] as GridCase).Init(this._context);
            }
         }
      }
      
      public function Destroy() : void
      {
         var j:int = 0;
         if(this._anim)
         {
            AnimationManager.instance.Destroy(this._anim);
            this._context.levelManager.actionLayer.GetBackFxContainer().removeChild(this._anim);
            this._anim = null;
         }
         for(var i:int = 0; i < 6; i++)
         {
            for(j = 0; j < 46; j++)
            {
               (this._cadrier[i][j] as GridCase).Destroy();
            }
         }
      }
      
      public function Refresh() : void
      {
         var j:int = 0;
         for(var i:int = 0; i < 6; i++)
         {
            for(j = 0; j < 46; j++)
            {
               (this._cadrier[i][j] as GridCase).Refresh();
            }
         }
      }
      
      public function CheckForNearestFrontCase(gridCase:GridCase, teamID:int) : GridCase
      {
         var squadPos:int = 0;
         var i:int = 0;
         var offset:int = 0;
         if(teamID == MiscConstants.TEAM1)
         {
            offset = 2;
            squadPos = this._context.roundManager.team1FirstSquad().position;
         }
         else
         {
            offset = 0;
            squadPos = this._context.roundManager.team2FirstSquad().position;
         }
         for(i = 0; i < 6; i++)
         {
            if(gridCase.gridPos.y + i <= 5)
            {
               if((this._cadrier[gridCase.gridPos.y + i][squadPos + offset] as GridCase).actor == null)
               {
                  return this._cadrier[gridCase.gridPos.y + i][squadPos + offset] as GridCase;
               }
            }
            if(gridCase.gridPos.y - i >= 0)
            {
               if((this._cadrier[gridCase.gridPos.y - i][squadPos + offset] as GridCase).actor == null)
               {
                  return this._cadrier[gridCase.gridPos.y - i][squadPos + offset] as GridCase;
               }
            }
         }
         return null;
      }
   }
}

