package com.lachhhEngine.games.meta.metaObject
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.physique.Actor;
   
   public class MetaSound2D extends MetaSfx
   {
      
      private var _mcEmetteur:Actor;
      
      private var _loop:Boolean;
      
      private var _limitToAddPerFrame:int = -1;
      
      private var _distPan:Number = 400;
      
      private var _msStart:Number = 0;
      
      private var _distVolume:Number = 120;
      
      public function MetaSound2D()
      {
         super();
      }
      
      public function set distVolume(distVolume:Number) : void
      {
         this._distVolume = distVolume;
      }
      
      public function set loop(loop:Boolean) : void
      {
         this._loop = loop;
      }
      
      public function get distPan() : Number
      {
         return this._distPan;
      }
      
      public function get limitToAddPerFrame() : int
      {
         return this._limitToAddPerFrame;
      }
      
      public function get msStart() : Number
      {
         return this._msStart;
      }
      
      public function get distVolume() : Number
      {
         return this._distVolume;
      }
      
      public function get mcEmetteur() : Actor
      {
         return this._mcEmetteur;
      }
      
      public function get loop() : Boolean
      {
         return this._loop;
      }
      
      public function set distPan(distPan:Number) : void
      {
         this._distPan = distPan;
      }
      
      public function set mcEmetteur(mcEmetteur:Actor) : void
      {
         this._mcEmetteur = mcEmetteur;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._loop = false;
         this._distPan = 400;
         this._distVolume = 120;
         this._msStart = 0;
         this._mcEmetteur = null;
         this._limitToAddPerFrame = -1;
      }
      
      public function set msStart(msStart:Number) : void
      {
         this._msStart = msStart;
      }
      
      public function set limitToAddPerFrame(limitToAddPerFrame:int) : void
      {
         this._limitToAddPerFrame = limitToAddPerFrame;
      }
   }
}

