package com.lachhhEngine.games.heurtable
{
   import com.lachhhEngine.games.physique.Collision;
   
   public interface IHeurtable
   {
      
      function get owner() : IHeurtableContainer;
      
      function OnHit(param1:IHeurtable, param2:Collision) : void;
      
      function set owner(param1:IHeurtableContainer) : void;
   }
}

