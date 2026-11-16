package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.MetaEnemyLoaded;
   import com.battlecry.meta.MetaFlag;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class ArmySurvivalSelectScreen extends BC_Screen
   {
      
      private var _screenToClose:BC_Screen;
      
      private var _visualToPlay:int;
      
      private var _currentSelect:int;
      
      private var _armyGroup:Vector.<BC_MetaArmy>;
      
      private var _init:Boolean;
      
      private var _currentSelectedArmy:ButtonSelectGroup;
      
      public function ArmySurvivalSelectScreen()
      {
         super();
      }
      
      override protected function get idleFrame() : int
      {
         return 15;
      }
      
      public function get btn_X() : ButtonSelect
      {
         return panel.getChildByName("btn_X") as ButtonSelect;
      }
      
      public function SetScreenToClose(screenToClose:BC_Screen) : void
      {
         this._screenToClose = screenToClose;
      }
      
      public function get btn_army1() : ButtonSelect
      {
         return panel.getChildByName("btn_army1") as ButtonSelect;
      }
      
      public function get btn_army2() : ButtonSelect
      {
         return panel.getChildByName("btn_army2") as ButtonSelect;
      }
      
      public function get btn_army3() : ButtonSelect
      {
         return panel.getChildByName("btn_army3") as ButtonSelect;
      }
      
      public function get btn_army4() : ButtonSelect
      {
         return panel.getChildByName("btn_army4") as ButtonSelect;
      }
      
      private function onArmy1(event:MouseEvent) : void
      {
         this._currentSelectedArmy.SelectButton(this.btn_army1);
         this._currentSelect = 0;
      }
      
      private function onArmy3(event:MouseEvent) : void
      {
         this._currentSelectedArmy.SelectButton(this.btn_army3);
         this._currentSelect = 2;
      }
      
      private function onArmy4(event:MouseEvent) : void
      {
         this._currentSelectedArmy.SelectButton(this.btn_army4);
         this._currentSelect = 3;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_Cancel.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCancel);
         this.btn_X.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCancel);
         this.btn_OK.removeEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
         this.btn_army1.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArmy1);
         this.btn_army2.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArmy2);
         this.btn_army3.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArmy3);
         this.btn_army4.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArmy4);
      }
      
      private function onOk(event:MouseEvent) : void
      {
         if(this.btn_OK.isSelected)
         {
            return;
         }
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(this._armyGroup[this._currentSelect].teamId);
         Close(true,null,false);
         BC_Game.instance.isRanked = false;
         BC_Game.instance.isSurvival = true;
         BC_Game.instance.survivalMove = true;
         BC_Game.instance.survivalLevel = 1;
         BC_Game.instance.metaEnemyLoaded = new MetaEnemyLoaded();
         BC_Game.instance.metaEnemyLoaded.enemyName = "SURVIVAL";
         BC_Game.instance.metaEnemyLoaded.fullArmyName = "SURVIVAL";
         BC_Game.instance.metaEnemyLoaded.metaFlag = new MetaFlag();
         BC_Game.instance.TransitionTo(this._screenToClose,BC_ScreenFactory.ID_LOADGAME_SURVIVALINFOS_SCREEN);
      }
      
      private function onArmy2(event:MouseEvent) : void
      {
         this._currentSelectedArmy.SelectButton(this.btn_army2);
         this._currentSelect = 1;
      }
      
      public function get btn_OK() : ButtonSelect
      {
         return panel.getChildByName("btn_OK") as ButtonSelect;
      }
      
      private function CheckSelectedArmy() : void
      {
         var q:QuestionScreen = null;
         this._armyGroup = Vector.<BC_MetaArmy>([BC_GameProgress.gameProgess.metaArmy1,BC_GameProgress.gameProgess.metaArmy2,BC_GameProgress.gameProgess.metaArmy3,BC_GameProgress.gameProgess.metaArmy4]);
         for(var i:int = int(this._armyGroup.length - 1); i >= 0; i--)
         {
            if(this._armyGroup[i].IsEmpty())
            {
               this._armyGroup.splice(i,1);
            }
         }
         if(this._armyGroup.length <= 0)
         {
            q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
            q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_ALL_ARMY_EMPTY));
            Close(true,null,false);
            Hide();
            BC_Game.instance.currentCampaign = null;
            return;
         }
         if(this._armyGroup.length <= 1)
         {
            visual.visible = false;
            this._currentSelect = 0;
            this.onOk(null);
            return;
         }
         switch(this._armyGroup.length)
         {
            case 2:
               this._visualToPlay = 1;
               break;
            case 3:
               this._visualToPlay = 2;
               break;
            case 4:
               this._visualToPlay = 3;
               break;
            default:
               this._visualToPlay = 1;
         }
         this.Refresh();
      }
      
      public function get btn_army1_Txt() : TextField
      {
         return (this.btn_army1.getChildByName("txt_ArmySelect") as MovieClip).getChildByName("armyTxt") as TextField;
      }
      
      public function get btn_army4_Txt() : TextField
      {
         return (this.btn_army4.getChildByName("txt_ArmySelect") as MovieClip).getChildByName("armyTxt") as TextField;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(!this._init)
         {
            this._init = true;
            this.CheckSelectedArmy();
         }
         if(this._currentSelect == -1)
         {
            this.btn_OK.Select();
         }
         else
         {
            this.btn_OK.Deselect();
         }
         panel.gotoAndStop(this._visualToPlay);
      }
      
      public function get btn_army2_Txt() : TextField
      {
         return (this.btn_army2.getChildByName("txt_ArmySelect") as MovieClip).getChildByName("armyTxt") as TextField;
      }
      
      override protected function get closeFrame() : int
      {
         return 30;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._init = false;
         InitOkBtn(this.btn_Cancel);
         this.btn_Cancel.addEventListener(MouseEvent.MOUSE_DOWN,this.onCancel);
         InitOkBtn(this.btn_X);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onCancel);
         InitOkBtn(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
         InitOkBtn(this.btn_army1);
         this.btn_army1.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy1);
         InitOkBtn(this.btn_army2);
         this.btn_army2.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy2);
         InitOkBtn(this.btn_army3);
         this.btn_army3.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy3);
         InitOkBtn(this.btn_army4);
         this.btn_army4.addEventListener(MouseEvent.MOUSE_DOWN,this.onArmy4);
         this._currentSelect = -1;
         this._currentSelectedArmy = new ButtonSelectGroup();
         this._currentSelectedArmy.AddButton(this.btn_army1);
         this._currentSelectedArmy.AddButton(this.btn_army2);
         this._currentSelectedArmy.AddButton(this.btn_army3);
         this._currentSelectedArmy.AddButton(this.btn_army4);
      }
      
      public function get btn_Cancel() : ButtonSelect
      {
         return panel.getChildByName("btn_Cancel") as ButtonSelect;
      }
      
      public function get btn_army3_Txt() : TextField
      {
         return (this.btn_army3.getChildByName("txt_ArmySelect") as MovieClip).getChildByName("armyTxt") as TextField;
      }
      
      private function onCancel(event:MouseEvent) : void
      {
         BC_Game.instance.currentCampaign = null;
         Close(true,null,false);
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         var btnTexts:Vector.<TextField> = Vector.<TextField>([this.btn_army1_Txt,this.btn_army2_Txt,this.btn_army3_Txt,this.btn_army4_Txt]);
         for(var i:int = 0; i < this._armyGroup.length; i++)
         {
            btnTexts[i].text = this._armyGroup[i].teamId + "";
         }
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ARMYSELECT_SCREEN);
      }
   }
}

