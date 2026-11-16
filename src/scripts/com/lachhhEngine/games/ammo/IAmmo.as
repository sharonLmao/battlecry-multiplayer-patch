package com.lachhhEngine.games.ammo
{
   import com.lachhhEngine.games.heurtable.IHeurtable;
   import com.lachhhEngine.games.physique.Circle;
   
   public interface IAmmo extends IHeurtable
   {
      
      function AddTarget(param1:Circle) : void;
      
      function GetTargetTeam() : int;
      
      function RemoveTarget(param1:Circle) : Boolean;
      
      function get dmg() : Number;
   }
}

