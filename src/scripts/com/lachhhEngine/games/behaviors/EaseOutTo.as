package com.lachhhEngine.games.behaviors
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaBehavior;
   import com.lachhhEngine.games.physique.Vector3D;
   
   public class EaseOutTo extends Behavior
   {
      
      private var m_v:Vector3D = null;
      
      private var m_vitesse:Number = 0.05;
      
      private var m_Endy:Number = 0;
      
      private var m_Endz:Number = 0;
      
      private var m_Endx:Number = 0;
      
      private var m_vitesseCarre:Number = 0;
      
      public function EaseOutTo()
      {
         super();
         this.m_v = new Vector3D(0,0,0);
      }
      
      override public function Control(context:Game, controllable:IControllable) : void
      {
         var p:Vector3D = null;
         if(controllable == null)
         {
            throw new Error("ERROR : contrallable must be non-null");
         }
         p = controllable.GetPosition3D();
         if((p.x - this.m_Endx) * (p.x - this.m_Endx) + (p.y - this.m_Endy) * (p.y - this.m_Endy) + (p.z - this.m_Endz) * (p.z - this.m_Endz) <= 20)
         {
            p.x = this.m_Endx;
            p.y = this.m_Endy;
            p.z = this.m_Endz;
            controllable.SetPosition3D(p);
            End(context);
            return;
         }
         this.m_v.x = this.m_Endx - p.x;
         this.m_v.y = this.m_Endy - p.y;
         this.m_v.z = this.m_Endz - p.z;
         p.x += this.m_v.x * this.m_vitesse * context.speedManager.GetSpeed();
         p.y += this.m_v.y * this.m_vitesse * context.speedManager.GetSpeed();
         p.z += this.m_v.z * this.m_vitesse * context.speedManager.GetSpeed();
         controllable.SetPosition3D(p);
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         var metaBehavior:MetaBehavior = MetaBehavior(metaObject);
         var tabParam:Array = metaBehavior.param;
         if(tabParam[0] == null || isNaN(tabParam[0]) || tabParam[1] == null || isNaN(tabParam[1]))
         {
            throw new Error("ERROR :: MoveTo_c :: Init :: Wrong Paramaters : " + tabParam);
         }
         this.m_Endx = tabParam[0];
         this.m_Endy = tabParam[1];
         if(tabParam[2] != null)
         {
            if(isNaN(tabParam[2]))
            {
               throw new Error("ERROR: MoveTo :: Init :: Wrong Parameters : " + tabParam);
            }
            this.m_Endz = tabParam[2];
         }
         else
         {
            this.m_Endz = 0;
         }
         if(tabParam[3] != null)
         {
            if(isNaN(tabParam[3]))
            {
               throw new Error("ERROR: MoveTo :: Init :: Wrong Parameters" + tabParam);
            }
            this.m_vitesse = Number(tabParam[3]);
         }
         this.m_vitesseCarre = this.m_vitesse * this.m_vitesse;
      }
   }
}

