package com.lachhhEngine.games.behaviors
{
   import com.lachhhEngine.games.physique.Vector3D;
   
   public interface IControllable
   {
      
      function GetPosition3D() : Vector3D;
      
      function SetPosition3D(param1:Vector3D) : void;
   }
}

