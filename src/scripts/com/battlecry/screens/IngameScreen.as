package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.enemy.BC_EnemyManager;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.interfaces.forms.Button;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.KeyManager;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   
   public class IngameScreen extends BC_Screen
   {
      
      private var _firstPlay:Boolean;
      
      private var _buttonSelect:ButtonSelectGroup = new ButtonSelectGroup();
      
      public function IngameScreen()
      {
         super();
      }
      
      private function get btn_win() : ButtonSelect
      {
         return visual.getChildByName("btn_win") as ButtonSelect;
      }
      
      public function get gameTimer() : TextField
      {
         return visual.getChildByName("gameTimer") as TextField;
      }
      
      private function onEnd(event:MouseEvent) : void
      {
         (getContext.enemyManager as BC_EnemyManager).KillAllUnit();
      }
      
      private function onConcede(event:MouseEvent) : void
      {
         this.onPause(null);
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_YES_NO,TextFactory.instance.GetMsg(BC_TextFactory.ID_ARE_YOU_SURE_YOU_WANT_TO_CONCEDE),new Callback(this.Concede,this,null),new Callback(this.DontConcede,this,null));
      }
      
      private function Concede() : void
      {
         BC_Game.instance.concede = true;
         (getContext.enemyManager as BC_EnemyManager).KillMyUnits();
         BC_Game.instance.roundManager.EmptyMyArmy();
         BC_Game.instance.roundManager.CheckVictorious();
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         super.ShowIdle(context);
      }
      
      public function get backGroundList() : MovieClip
      {
         return visual.getChildByName("backGroundList") as MovieClip;
      }
      
      private function get Play() : Button
      {
         return visual.getChildByName("btn_Play") as Button;
      }
      
      private function get Pause() : Button
      {
         return visual.getChildByName("btn_Pause") as Button;
      }
      
      private function onPause(event:MouseEvent) : void
      {
         this.Play.visible = true;
         this.Pause.visible = false;
         getContext.Pause(true);
      }
      
      private function onx1(event:MouseEvent) : void
      {
         _context.speedManager.SetSpeed(1);
         this._buttonSelect.SelectButton(this.x1);
         BC_Game.instance.battleSpeed = 1;
      }
      
      private function onx2(event:MouseEvent) : void
      {
         _context.speedManager.SetSpeed(2);
         this._buttonSelect.SelectButton(this.x2);
         BC_Game.instance.battleSpeed = 2;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._buttonSelect.Destroy();
         this.Play.removeEventListener(MouseEvent.MOUSE_DOWN,this.onPlay);
         this.Pause.removeEventListener(MouseEvent.MOUSE_DOWN,this.onPause);
         this.x1.removeEventListener(MouseEvent.MOUSE_DOWN,this.onx1);
         this.x2.removeEventListener(MouseEvent.MOUSE_DOWN,this.onx2);
         this.btnEnd.removeEventListener(MouseEvent.MOUSE_DOWN,this.onEnd);
         this.btn_win.removeEventListener(MouseEvent.MOUSE_DOWN,this.onWin);
      }
      
      override public function Show() : void
      {
         super.Show();
      }
      
      private function get btnEnd() : ButtonSelect
      {
         return visual.getChildByName("btn_end") as ButtonSelect;
      }
      
      private function get btn_Concede() : ButtonSelect
      {
         return visual.getChildByName("btn_Concede") as ButtonSelect;
      }
      
      public function reInit() : void
      {
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(VersionInfo.debugVersion)
         {
            if(KeyManager.IsKeyPressed(Keyboard.BACKSPACE))
            {
               this.onWin(null);
            }
         }
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         state = STATE_IDLE;
         this.Play.addEventListener(MouseEvent.MOUSE_DOWN,this.onPlay);
         InitOkBtn(this.Play);
         this.Pause.addEventListener(MouseEvent.MOUSE_DOWN,this.onPause);
         InitOkBtn(this.Pause);
         this.x1.addEventListener(MouseEvent.MOUSE_DOWN,this.onx1);
         InitOkBtn(this.x1);
         this.x2.addEventListener(MouseEvent.MOUSE_DOWN,this.onx2);
         InitOkBtn(this.x2);
         this.btnEnd.addEventListener(MouseEvent.MOUSE_DOWN,this.onEnd);
         InitOkBtn(this.btnEnd);
         this.btn_win.addEventListener(MouseEvent.MOUSE_DOWN,this.onWin);
         InitOkBtn(this.btn_win);
         this.btn_Concede.addEventListener(MouseEvent.MOUSE_DOWN,this.onConcede);
         InitOkBtn(this.btn_Concede);
         this._buttonSelect.AddButton(this.x1);
         this._buttonSelect.AddButton(this.x2);
         if(BC_Game.instance.battleSpeed == 1)
         {
            this.onx1(null);
         }
         else
         {
            this.onx2(null);
         }
         if(!VersionInfo.debugVersion)
         {
            this.btn_win.visible = false;
            this.btnEnd.visible = false;
         }
         this._firstPlay = true;
         this.gameTimer.text = "00:00";
      }
      
      private function onPlay(event:MouseEvent) : void
      {
         if(this._firstPlay)
         {
            this._firstPlay = false;
            _context.StartRound();
         }
         this.Play.visible = false;
         this.Pause.visible = true;
         getContext.Pause(false);
      }
      
      private function DontConcede() : void
      {
         this.onPlay(null);
      }
      
      public function RefreshGameTimer() : void
      {
         var minute:int = 0;
         var seconde:int = 0;
         var minuteText:String = null;
         var secondeText:String = null;
         var gameTime:int = BC_Game.instance.roundManager.gameTimer;
         minute = gameTime / 60;
         seconde = gameTime % 60;
         if(minute < 10)
         {
            minuteText = "0" + minute;
         }
         else
         {
            minuteText = "" + minute;
         }
         if(seconde < 10)
         {
            secondeText = "0" + seconde;
         }
         else
         {
            secondeText = "" + seconde;
         }
         this.gameTimer.text = minuteText + ":" + secondeText;
      }
      
      private function get x1() : ButtonSelect
      {
         return visual.getChildByName("btn_x1") as ButtonSelect;
      }
      
      private function get x2() : ButtonSelect
      {
         return visual.getChildByName("btn_x2") as ButtonSelect;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_INGAME_SCREEN);
      }
      
      private function onWin(event:MouseEvent) : void
      {
         (getContext.enemyManager as BC_EnemyManager).KillEnemyUnits();
      }
   }
}

