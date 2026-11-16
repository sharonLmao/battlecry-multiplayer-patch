package com.lachhhEngine.interfaces.forms
{
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class Button extends MovieClip
   {
      
      private var _canGoto:Boolean = true;
      
      public function Button()
      {
         super();
         buttonMode = true;
         useHandCursor = true;
         this.Init();
      }
      
      public function get frameUp() : int
      {
         return this.FindFrame("up");
      }
      
      private function onMouseUp(e:MouseEvent) : void
      {
         if(!this.canGoto)
         {
            return;
         }
         gotoAndPlay("over");
      }
      
      public function get frameOut() : int
      {
         return this.FindFrame("out");
      }
      
      public function set canGoto(b:Boolean) : void
      {
         this._canGoto = b;
         buttonMode = b;
         useHandCursor = b;
      }
      
      private function onMouseDown(e:MouseEvent) : void
      {
         if(!this.canGoto)
         {
            return;
         }
         gotoAndPlay("down");
      }
      
      public function Destroy() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         mouseChildren = false;
         buttonMode = false;
      }
      
      protected function Init() : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver,false,0,true);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut,false,0,true);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown,false,0,true);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp,false,0,true);
         mouseChildren = false;
         this.gotoUp();
      }
      
      public function get canGoto() : Boolean
      {
         return this._canGoto;
      }
      
      public function get frameDown() : int
      {
         return this.FindFrame("down");
      }
      
      private function onMouseOut(e:MouseEvent) : void
      {
         if(!this.canGoto)
         {
            return;
         }
         gotoAndPlay("out");
      }
      
      public function get frameOver() : int
      {
         return this.FindFrame("over");
      }
      
      private function onMouseOver(e:MouseEvent) : void
      {
         if(!this.canGoto)
         {
            return;
         }
         gotoAndPlay("over");
      }
      
      private function FindFrame(frame:String) : int
      {
         var label:FrameLabel = null;
         var labels:Array = currentLabels;
         for(var i:uint = 0; i < labels.length; i++)
         {
            label = labels[i];
            if(label.name == frame)
            {
               return label.frame;
            }
         }
         return -1;
      }
      
      public function gotoUp() : void
      {
         gotoAndPlay("up");
      }
   }
}

