package com.lachhhEngine.games.screens.view
{
   import com.lachhhEngine.utils.Utils;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ObjectGroupView extends ObjectView
   {
      
      private var _views:Array;
      
      public function ObjectGroupView(visual:MovieClip)
      {
         super(visual);
         this._views = new Array();
      }
      
      public function GetViewFromVisual(mc:DisplayObject) : ObjectView
      {
         var v:ObjectView = null;
         for(var i:int = 0; i < this._views.length; i++)
         {
            v = this._views[i];
            if(v.visual == mc)
            {
               return v;
            }
         }
         return null;
      }
      
      public function AddView(v:ObjectView) : void
      {
         this._views.push(v);
         v.visual.addEventListener(MouseEvent.MOUSE_DOWN,this.OnClickViewVisual);
         v.visual.addEventListener(MouseEvent.MOUSE_OVER,this.OnRollOverViewVisual);
         v.visual.addEventListener(MouseEvent.MOUSE_OUT,this.OnRollOutViewVisual);
      }
      
      public function get views() : Array
      {
         return this._views;
      }
      
      public function RemoveView(v:ObjectView) : void
      {
         Utils.RemoveFromArray(this._views,v);
         v.visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.OnClickViewVisual);
         v.visual.removeEventListener(MouseEvent.MOUSE_OVER,this.OnRollOverViewVisual);
         v.visual.removeEventListener(MouseEvent.MOUSE_OUT,this.OnRollOutViewVisual);
      }
      
      protected function OnClickView(v:ObjectView) : void
      {
      }
      
      protected function OnRollOutView(v:ObjectView) : void
      {
      }
      
      override public function Update() : void
      {
         var v:ObjectView = null;
         super.Update();
         for(var i:int = 0; i < this._views.length; i++)
         {
            v = this._views[i];
            v.Update();
         }
      }
      
      protected function OnRollOverView(v:ObjectView) : void
      {
      }
      
      protected function OnRollOutViewVisual(e:MouseEvent) : void
      {
         var v:ObjectView = this.GetViewFromVisual(e.target as DisplayObject);
         if(v)
         {
            this.OnRollOutView(v);
         }
      }
      
      override public function Destroy() : void
      {
         var v:ObjectView = null;
         super.Destroy();
         while(this._views.length)
         {
            v = this._views.shift();
            v.visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.OnClickViewVisual);
            v.visual.removeEventListener(MouseEvent.MOUSE_OVER,this.OnRollOverViewVisual);
            v.visual.removeEventListener(MouseEvent.MOUSE_OUT,this.OnRollOutViewVisual);
            v.Destroy();
         }
      }
      
      override public function Refresh() : void
      {
         var v:ObjectView = null;
         super.Refresh();
         for(var i:int = 0; i < this._views.length; i++)
         {
            v = this._views[i];
            v.Refresh();
         }
      }
      
      protected function OnRollOverViewVisual(e:Event) : void
      {
         var v:ObjectView = this.GetViewFromVisual(e.target as DisplayObject);
         if(v)
         {
            this.OnRollOverView(v);
         }
      }
      
      protected function OnClickViewVisual(e:Event) : void
      {
         var v:ObjectView = this.GetViewFromVisual(e.target as DisplayObject);
         if(v)
         {
            this.OnClickView(v);
         }
      }
   }
}

