package com.lachhhEngine.games.behaviors
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.meta.metaObject.MetaBehavior;
   import com.lachhhEngine.games.physique.Actor;
   import com.lachhhEngine.games.physique.Vector3D;
   import flash.geom.ColorTransform;
   
   public class ObjetMoteurFadeColor extends Behavior
   {
      
      private var m_RGBFrom:Vector3D = new Vector3D(0,0,0);
      
      private var m_alphaTo:Number = 0;
      
      private var m_alphaFrom:Number = 0;
      
      private var m_vitesse:Number = 0;
      
      private var m_RGBTo:Vector3D = new Vector3D(0,0,0);
      
      private var m_colorTransform:ColorTransform = new ColorTransform();
      
      public function ObjetMoteurFadeColor()
      {
         super();
      }
      
      private function SetColor(v:Vector3D, pAlpha:Number, obj:Actor) : void
      {
         this.m_colorTransform.redOffset = v.x;
         this.m_colorTransform.greenOffset = v.y;
         this.m_colorTransform.blueOffset = v.z;
         this.m_colorTransform.alphaMultiplier = pAlpha;
         obj.animationContainer.transform.colorTransform = this.m_colorTransform;
      }
      
      override public function Control(context:Game, obj:IControllable) : void
      {
         if(obj == null || !(obj is Actor))
         {
            throw new Error("The controllable must be a ObjetMoteur");
         }
         this.SetColor(this.m_RGBFrom,this.m_alphaFrom,Actor(obj));
         this.m_RGBFrom.x += (this.m_RGBTo.x - this.m_RGBFrom.x) * this.m_vitesse;
         this.m_RGBFrom.y += (this.m_RGBTo.y - this.m_RGBFrom.y) * this.m_vitesse;
         this.m_RGBFrom.z += (this.m_RGBTo.z - this.m_RGBFrom.z) * this.m_vitesse;
         this.m_alphaFrom += (this.m_alphaTo - this.m_alphaFrom) * this.m_vitesse;
         var da:Number = this.m_alphaTo - this.m_alphaFrom;
         if(Vector3D.DistCarre(this.m_RGBFrom,this.m_RGBTo) <= 10 && da < 0.1 && da > -0.1)
         {
            this.SetColor(this.m_RGBTo,this.m_alphaTo,Actor(obj));
            End(context);
            return;
         }
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         var tabParam:Array = null;
         super.Init(metaObject,context);
         var metaBehavior:MetaBehavior = MetaBehavior(metaObject);
         tabParam = metaBehavior.param;
         if(!this.IsValid(tabParam))
         {
            trace("ERROR :: MoveTo_c :: Init :: Wrong Paramaters : " + tabParam);
            return;
         }
         this.m_RGBFrom.x = tabParam[0];
         this.m_RGBFrom.y = tabParam[1];
         this.m_RGBFrom.z = tabParam[2];
         this.m_alphaFrom = tabParam[3];
         this.m_RGBTo.x = tabParam[4];
         this.m_RGBTo.y = tabParam[5];
         this.m_RGBTo.z = tabParam[6];
         this.m_alphaTo = tabParam[7];
         this.m_vitesse = tabParam[8];
      }
      
      private function IsValid(tabParam:Array) : Boolean
      {
         var invalid:Boolean = false;
         for(var i:int = 0; i < 7; i++)
         {
            invalid ||= tabParam[i] == null || isNaN(tabParam[i]);
         }
         return !invalid;
      }
   }
}

