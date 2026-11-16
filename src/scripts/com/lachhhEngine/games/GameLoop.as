package com.lachhhEngine.games
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class GameLoop
   {
      
      private static var _instance:GameLoop;
      
      public static var FRAME_RATE:int = 40;
      
      private var _sleepTime:int = 0;
      
      private var _afterTime:int = 0;
      
      private var _beforeTime:int = 0;
      
      private var _overSleepTime:int = 0;
      
      private var _skippedDraw:int = 0;
      
      private var _timeDiff:int = 0;
      
      private var _excess:int = 0;
      
      private var _skippedTimes:int = 0;
      
      private var _main:MainGame;
      
      private var _period:Number = 1000 / FRAME_RATE;
      
      private var _fpsChanged:Boolean;
      
      private var _gameTimer:Timer;
      
      public function GameLoop()
      {
         super();
      }
      
      public static function get instance() : GameLoop
      {
         if(_instance == null)
         {
            _instance = new GameLoop();
         }
         return _instance;
      }
      
      public function SetFPS(fps:int) : void
      {
         FRAME_RATE = Math.max(fps,18);
         this._period = 1000 / FRAME_RATE;
         this._beforeTime = 0;
         this._afterTime = 0;
         this._timeDiff = 0;
         this._sleepTime = 0;
         this._overSleepTime = 0;
         this._excess = 0;
         this._fpsChanged = true;
         this._gameTimer.reset();
         this._gameTimer.delay = this._period;
         this._gameTimer.start();
      }
      
      private function UpdateTimer(e:TimerEvent) : void
      {
         this._beforeTime = getTimer();
         this._overSleepTime = this._beforeTime - this._afterTime - this._sleepTime;
         this._main.Update(null);
         this._main.Draw();
         this._afterTime = getTimer();
         this._timeDiff = this._afterTime - this._beforeTime;
         this._sleepTime = this._period - this._timeDiff - this._overSleepTime;
         if(this._sleepTime <= 0)
         {
            this._excess -= this._sleepTime;
            this._sleepTime = 2;
         }
         this._gameTimer.reset();
         this._gameTimer.delay = this._sleepTime;
         this._gameTimer.start();
         while(this._excess > this._period)
         {
            this._main.Update(null);
            this._excess -= this._period;
         }
         e.updateAfterEvent();
      }
      
      public function Init(main:MainGame) : void
      {
         this._main = main;
         this._main.addEventListener(Event.ENTER_FRAME,this.UpdateEnterFrame);
      }
      
      private function UpdateEnterFrame(e:Event) : void
      {
         this._main.Update(null);
      }
   }
}

