package com.lachhhEngine.games.screens
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.factory.FactoryObject;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.games.sfx.SfxManager;
   import com.lachhhEngine.interfaces.forms.Button;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.externalAPI.metricsAPI.MetricGroup;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getQualifiedClassName;
   
   public class Screen extends FactoryObject
   {
      
      public static var STATE_NULL:int = -1;
      
      public static var STATE_OPENING:int = 0;
      
      public static var STATE_IDLE:int = 1;
      
      public static var STATE_CLOSING:int = 2;
      
      protected var _animation:Animation;
      
      private var _longClassName:String;
      
      private var _state:int = STATE_NULL;
      
      private var _metaEvents:Array = new Array();
      
      private var _isRemoved:Boolean;
      
      private var _isDestroyed:Boolean;
      
      private var _shortClassName:String;
      
      private var _isActive:Boolean = false;
      
      private var _objectViews:Array;
      
      public function Screen()
      {
         super();
         this._objectViews = [];
      }
      
      public function get visual() : MovieClip
      {
         return this._animation;
      }
      
      public function Refresh() : void
      {
         var o:ObjectView = null;
         for(var i:int = 0; i < this._objectViews.length; i++)
         {
            o = this._objectViews[i];
            o.Refresh();
         }
      }
      
      private function PlayOkBtnSound(e:Event = null) : void
      {
         if(SfxManager.factory.uiOkSoundId == -1)
         {
            return;
         }
         Jukebox.instance.PlaySound(SfxManager.factory.uiOkSoundId);
      }
      
      public function get animation() : Animation
      {
         return this._animation;
      }
      
      public function ShowOpen(context:MainGame) : void
      {
      }
      
      public function set isActive(b:Boolean) : void
      {
         this._isActive = b;
      }
      
      public function set animation(m:Animation) : void
      {
         this._animation = m;
      }
      
      public function InitOkBtn(b:MovieClip) : void
      {
         this.AddEvent(new MetaScreenBtnEvent(b,this.PlayOkBtnSound,MouseEvent.MOUSE_DOWN));
         this.InitBtn(b);
      }
      
      public function ShowIdle(context:MainGame) : void
      {
      }
      
      public function InitBtn(b:MovieClip) : void
      {
         this.AddEvent(new MetaScreenBtnEvent(b,this.PlayOverBtnSound,MouseEvent.MOUSE_OVER));
      }
      
      public function get isRemoved() : Boolean
      {
         return this._isRemoved;
      }
      
      private function TrackBtnClick(e:MouseEvent) : void
      {
         var m:MovieClip = e.target as MovieClip;
         if(m != null && m.name != "" && m is Button)
         {
            ExternalAPIManager.getMetricsAPI().RecordStats(this._shortClassName + "." + m.name + "::CLICKED",MetricGroup.UI);
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      protected function AddEvent(m:MetaScreenBtnEvent) : void
      {
         m.AddEvent();
         this._metaEvents.push(m);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         AnimationManager.instance.Destroy(this._animation);
         this.visual.stop();
         this.isRemoved = true;
         this._isDestroyed = true;
      }
      
      public function ShowClose(context:MainGame) : void
      {
      }
      
      private function PlayCancelBtnSound(e:Event = null) : void
      {
         if(SfxManager.factory.uiCancelSoundId == -1)
         {
            return;
         }
         Jukebox.instance.PlaySound(SfxManager.factory.uiCancelSoundId);
      }
      
      public function set state(i:int) : void
      {
         this._state = i;
      }
      
      public function Update(context:MainGame) : void
      {
         var o:ObjectView = null;
         if(this._isRemoved)
         {
            return;
         }
         for(var i:int = 0; i < this._objectViews.length; i++)
         {
            o = this._objectViews[i];
            o.Update();
         }
         switch(this._state)
         {
            case STATE_OPENING:
               this.ShowOpen(context);
               break;
            case STATE_IDLE:
               this.ShowIdle(context);
               break;
            case STATE_CLOSING:
               this.ShowClose(context);
         }
      }
      
      public function set isRemoved(b:Boolean) : void
      {
         this._isRemoved = b;
      }
      
      public function AddViews(v:ObjectView) : void
      {
         this._objectViews.push(v);
         v.onAddedOnScreen(this);
      }
      
      public function get isDestroyed() : Boolean
      {
         return this._isDestroyed;
      }
      
      public function InitCancelBtn(b:MovieClip) : void
      {
         this.AddEvent(new MetaScreenBtnEvent(b,this.PlayCancelBtnSound,MouseEvent.MOUSE_DOWN));
         this.InitBtn(b);
      }
      
      public function RemoveListeners() : void
      {
         var m:MetaScreenBtnEvent = null;
         var o:ObjectView = null;
         while(this._metaEvents.length > 0)
         {
            m = this._metaEvents.shift();
            m.RemoveEvent();
         }
         while(this._objectViews.length > 0)
         {
            o = this._objectViews.shift();
            o.Destroy();
         }
      }
      
      public function set isDestroyed(b:Boolean) : void
      {
         this._isDestroyed = b;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._animation = this.CreateVisual();
         this._animation.canBeCached = false;
         this.isRemoved = false;
         this.isDestroyed = false;
         canBeCached = false;
         if(this.visual != null && this.trackMetrics)
         {
            this._longClassName = getQualifiedClassName(this);
            this._shortClassName = this._longClassName.split("::")[1];
            ExternalAPIManager.getMetricsAPI().RecordStats(this._shortClassName + "::OPENED",MetricGroup.UI);
            this.RecurAddTrack(this.visual);
         }
      }
      
      protected function get trackMetrics() : Boolean
      {
         return true;
      }
      
      private function RecurAddTrack(container:DisplayObjectContainer) : void
      {
         var d:DisplayObject = null;
         var index:int = 0;
         if(container == null)
         {
            return;
         }
         for(var i:int = 0; i < container.numChildren; i++)
         {
            d = container.getChildAt(i);
            if(d is Button && d.name != "")
            {
               index = int(d.name.indexOf("instance"));
               if(index == -1)
               {
                  this.AddEvent(new MetaScreenBtnEvent(d as MovieClip,this.TrackBtnClick,MouseEvent.MOUSE_DOWN));
                  continue;
               }
            }
            if(d is DisplayObjectContainer)
            {
               this.RecurAddTrack(d as DisplayObjectContainer);
            }
         }
      }
      
      private function PlayOverBtnSound(e:Event = null) : void
      {
         if(SfxManager.factory.uiRollOverSoundId == -1)
         {
            return;
         }
         Jukebox.instance.PlaySound(SfxManager.factory.uiRollOverSoundId);
      }
      
      public function CreateVisual() : Animation
      {
         return null;
      }
      
      public function get isActive() : Boolean
      {
         return this._isActive;
      }
   }
}

