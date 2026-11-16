package com.battlecry.battle
{
   import com.battlecry.BC_Game;
   import com.battlecry.actor.BC_Actor;
   import com.lachhhEngine.games.Game;
   
   public class GridCase
   {
      
      private var _gridPos:GridPos;
      
      private var _context:BC_Game;
      
      private var _showRedSquare:Boolean;
      
      private var _actor:BC_Actor;
      
      public function GridCase(gridPos:GridPos)
      {
         super();
         this._gridPos = gridPos;
         this._actor = null;
         this._showRedSquare = true;
      }
      
      public function Refresh() : void
      {
         if(!this._showRedSquare)
         {
            return;
         }
         if(this._actor == null)
         {
         }
      }
      
      public function set actor(actor:BC_Actor) : void
      {
         this._actor = actor;
         this.Refresh();
      }
      
      public function get gridPos() : GridPos
      {
         return this._gridPos;
      }
      
      public function ShowRedSquare() : void
      {
         this._showRedSquare = true;
         this.Refresh();
      }
      
      public function get actor() : BC_Actor
      {
         return this._actor;
      }
      
      public function Init(context:Game) : void
      {
         this._context = context as BC_Game;
         this.Refresh();
      }
      
      public function Destroy() : void
      {
         this._gridPos = null;
      }
      
      public function HideRedSquare() : void
      {
         this._showRedSquare = false;
         this.Refresh();
      }
      
      public function set gridPos(gridPos:GridPos) : void
      {
         this._gridPos = gridPos;
      }
   }
}

