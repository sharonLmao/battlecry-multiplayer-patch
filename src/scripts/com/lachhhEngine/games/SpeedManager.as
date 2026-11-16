package com.lachhhEngine.games
{
   import com.lachhhEngine.io.Callback;
   
   public class SpeedManager implements IUpdatable
   {
      
      public static var NB_FRAMES:Number = 1;
      
      private var _enabled:Boolean = true;
      
      private var _mod:Number = 1;
      
      private var _oldSpeed:Number;
      
      private var _endZoom:int;
      
      private var _vitesse:Number = 1;
      
      private var _speedTo:Number = 1;
      
      private var _callback:Callback;
      
      private var _modVitesse:Number = 1;
      
      private var _fadeOut:Boolean = false;
      
      private var _pausing:Boolean = false;
      
      private var _pauseFrame:Number = 1;
      
      public function SpeedManager()
      {
         super();
      }
      
      public function SetSpeed(n:Number) : void
      {
         this._vitesse = n;
      }
      
      private function DoCallback() : void
      {
         if(this._callback != null)
         {
            this._callback.DoCallback();
         }
         this._callback = null;
      }
      
      public function SetEnable(b:Boolean) : void
      {
         this._enabled = b;
      }
      
      public function SetModSpeed(n:Number) : void
      {
         this._modVitesse = n;
      }
      
      public function IsEnabled() : Boolean
      {
         return this._enabled;
      }
      
      public function OnAdd(context:Game) : void
      {
      }
      
      public function Update(context:Game) : void
      {
         if(this._pausing)
         {
            this._pauseFrame -= this._oldSpeed;
            if(this._pauseFrame <= 0)
            {
               this.SetSpeed(this._oldSpeed);
               this._pausing = false;
               context.camera.SetZoom(this._endZoom);
               this.DoCallback();
               this._fadeOut = false;
            }
            return;
         }
         if(this._fadeOut)
         {
            this._vitesse += this._mod;
            this._mod *= 1.1;
            this.SetSpeed(this._vitesse);
            if(Math.abs(this._vitesse - this._speedTo) <= Math.abs(this._mod))
            {
               this.SetSpeed(this._speedTo);
               this._fadeOut = false;
            }
         }
      }
      
      public function OnRemove(context:Game) : void
      {
      }
      
      public function GetSpeed() : Number
      {
         return this._vitesse * this._modVitesse;
      }
      
      public function GetFrameSpeed() : Number
      {
         return this.GetSpeed() * NB_FRAMES;
      }
      
      public function GetModSpeed() : Number
      {
         return this._modVitesse;
      }
      
      public function FreezeSpeedForXFrames(context:Game, speed:Number, frames:Number, initZoom:int = 500, endZoom:int = 1000, callback:Callback = null) : void
      {
         if(this._pausing)
         {
            return;
         }
         this._pausing = true;
         this._pauseFrame = frames;
         this._oldSpeed = this.GetSpeed();
         this.SetSpeed(speed);
         this._vitesse = speed;
         context.camera.SetZoom(initZoom);
         this._endZoom = endZoom;
         this._callback = callback;
      }
      
      public function FadeOutTime(context:Game, from:Number, to:Number, frames:Number) : void
      {
         this.SetSpeed(from);
         this._speedTo = to;
         this._mod = (to - from) / frames;
         this._fadeOut = true;
      }
   }
}

