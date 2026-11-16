package com.lachhhEngine.games.heurtable
{
   import com.lachhhEngine.games.physique.Collision;
   
   public interface IHeurtableContainer
   {
      
      function IsDead() : Boolean;
      
      function OnOwnerHit(param1:IHeurtable, param2:IHeurtable, param3:Collision) : void;
   }
}

