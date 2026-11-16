package com.battlecry.BedUtil
{
   import com.lachhhEngine.io.Callback;
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class Slider
   {
      
      private var _visual:MovieClip;
      
      private var _prct:Number = 1;
      
      private var _slideCallback:Callback;
      
      private var _stage:Stage;
      
      public function Slider(visual:MovieClip, slideCallback:Callback)
      {
         super();
         this._visual = visual;
         this._visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickSlider);
         this._visual.buttonMode = true;
         this._slideCallback = slideCallback;
         this.UpdateVisual();
      }
      
      public function get prct() : Number
      {
         return this._prct;
      }
      
      private function UpdateVisual() : void
      {
         var frame:int = Math.floor(this._prct * (this._visual.totalFrames - 1) + 1);
         this._visual.gotoAndStop(frame);
      }
      
      private function onClickSlider(event:MouseEvent) : void
      {
         if(this._stage == null)
         {
            this._stage = this._visual.stage;
         }
         this._stage.addEventListener(MouseEvent.MOUSE_MOVE,this.SetPrctOnMove);
         this._stage.addEventListener(MouseEvent.MOUSE_UP,this.StopSoundSlider);
         this.SetPrctOnMove();
      }
      
      private function SetPrctOnMove(e:Event = null) : void
      {
         this.prct = this._visual.mouseX / this._visual.width + 1 / this._visual.totalFrames;
         this._slideCallback.DoCallback();
      }
      
      public function set prct(prct:Number) : void
      {
         this._prct = Math.max(0,Math.min(1,prct));
         this.UpdateVisual();
      }
      
      private function StopSoundSlider(e:Event = null) : void
      {
         if(this._stage == null)
         {
            return;
         }
         this._stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.SetPrctOnMove);
         this._stage.removeEventListener(MouseEvent.MOUSE_UP,this.StopSoundSlider);
      }
      
      public function Destroy() : void
      {
         this._visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickSlider);
         this.StopSoundSlider();
         this._stage = null;
         this._visual = null;
         this._slideCallback.Destroy();
         this._slideCallback = null;
      }
   }
}

