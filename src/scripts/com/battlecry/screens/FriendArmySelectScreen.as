package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.MetaEnemyLoaded;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
   import com.lachhhEngine.io.Callback;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class FriendArmySelectScreen extends BC_Screen
   {
      
      private var _friendArmyGroup:Vector.<BC_MetaArmy>;
      
      private var _battleFieldScreen:BC_Screen;
      
      private var _friendArmySelected:int;
      
      private var _mySelectedArmy:ButtonSelectGroup;
      
      private var _friendSelectedArmy:ButtonSelectGroup;
      
      private var _friendArmyVisualToPlay:int;
      
      private var _myArmySelected:int;
      
      private var _enemyProgress:BC_GameProgress;
      
      private var _fullFriendName:String;
      
      private var _myArmyGroup:Vector.<BC_MetaArmy>;
      
      private var _myArmyVisualToPlay:int;
      
      private var _friendName:String;
      
      public function FriendArmySelectScreen()
      {
         super();
      }
      
      public function get btn_myArmy1() : ButtonSelect
      {
         return this.myArmy.getChildByName("btn_myArmy1") as ButtonSelect;
      }
      
      public function get btn_myArmy3() : ButtonSelect
      {
         return this.myArmy.getChildByName("btn_myArmy3") as ButtonSelect;
      }
      
      public function get btn_myArmy4() : ButtonSelect
      {
         return this.myArmy.getChildByName("btn_myArmy4") as ButtonSelect;
      }
      
      public function SetInfo(enemyProgress:BC_GameProgress, battleFieldScreen:BC_Screen, friendName:String, fullFriendName:String) : void
      {
         this._enemyProgress = enemyProgress;
         this._battleFieldScreen = battleFieldScreen;
         this._friendName = friendName;
         this._fullFriendName = fullFriendName;
         this.CheckSelectedArmy();
      }
      
      public function get btn_myArmy2() : ButtonSelect
      {
         return this.myArmy.getChildByName("btn_myArmy2") as ButtonSelect;
      }
      
      public function get btn_myArmy1_Txt() : TextField
      {
         return (this.btn_myArmy1.getChildByName("txt_ArmySelect") as MovieClip).getChildByName("armyTxt") as TextField;
      }
      
      public function get btn_myArmy2_Txt() : TextField
      {
         return (this.btn_myArmy2.getChildByName("txt_ArmySelect") as MovieClip).getChildByName("armyTxt") as TextField;
      }
      
      public function get btn_myArmy3_Txt() : TextField
      {
         return (this.btn_myArmy3.getChildByName("txt_ArmySelect") as MovieClip).getChildByName("armyTxt") as TextField;
      }
      
      public function get btn_myArmy4_Txt() : TextField
      {
         return (this.btn_myArmy4.getChildByName("txt_ArmySelect") as MovieClip).getChildByName("armyTxt") as TextField;
      }
      
      private function onOk(event:MouseEvent) : void
      {
         if(this.btn_OK.isSelected)
         {
            return;
         }
         Close(true,new Callback(this.AfterClose,this,null),false);
      }
      
      private function AfterClose() : void
      {
         BC_Game.instance.currentCampaign = null;
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(this._myArmyGroup[this._myArmySelected].teamId);
         BC_Game.instance.friendArmy = this._friendArmyGroup[this._friendArmySelected];
         BC_Game.instance.metaEnemyLoaded = new MetaEnemyLoaded();
         BC_Game.instance.metaEnemyLoaded.fullArmyName = this._fullFriendName;
         BC_Game.instance.metaEnemyLoaded.enemyName = this._friendName;
         BC_Game.instance.metaEnemyLoaded.metaFlag = this._enemyProgress.metaFlag;
         BC_Game.instance.isFriendBattle = true;
         BC_Game.instance.TransitionTo(this._battleFieldScreen,BC_ScreenFactory.ID_LOADGAME_INFOS_SCREEN);
      }
      
      public function get btn_OK() : ButtonSelect
      {
         return panel.getChildByName("btn_OK") as ButtonSelect;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_Cancel);
         this.btn_Cancel.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         InitOkBtn(this.btn_X);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         InitOkBtn(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
         InitOkBtn(this.btn_myArmy1);
         this.btn_myArmy1.addEventListener(MouseEvent.MOUSE_DOWN,this.myArmy1);
         InitOkBtn(this.btn_myArmy2);
         this.btn_myArmy2.addEventListener(MouseEvent.MOUSE_DOWN,this.myArmy2);
         InitOkBtn(this.btn_myArmy3);
         this.btn_myArmy3.addEventListener(MouseEvent.MOUSE_DOWN,this.myArmy3);
         InitOkBtn(this.btn_myArmy4);
         this.btn_myArmy4.addEventListener(MouseEvent.MOUSE_DOWN,this.myArmy4);
         InitOkBtn(this.btn_friendArmy1);
         this.btn_friendArmy1.addEventListener(MouseEvent.MOUSE_DOWN,this.friendArmy1);
         InitOkBtn(this.btn_friendArmy2);
         this.btn_friendArmy2.addEventListener(MouseEvent.MOUSE_DOWN,this.friendArmy2);
         InitOkBtn(this.btn_friendArmy3);
         this.btn_friendArmy3.addEventListener(MouseEvent.MOUSE_DOWN,this.friendArmy3);
         InitOkBtn(this.btn_friendArmy4);
         this.btn_friendArmy4.addEventListener(MouseEvent.MOUSE_DOWN,this.friendArmy4);
         this._myArmySelected = -1;
         this._friendArmySelected = -1;
         this._mySelectedArmy = new ButtonSelectGroup();
         this._mySelectedArmy.AddButton(this.btn_myArmy1);
         this._mySelectedArmy.AddButton(this.btn_myArmy2);
         this._mySelectedArmy.AddButton(this.btn_myArmy3);
         this._mySelectedArmy.AddButton(this.btn_myArmy4);
         this._friendSelectedArmy = new ButtonSelectGroup();
         this._friendSelectedArmy.AddButton(this.btn_friendArmy1);
         this._friendSelectedArmy.AddButton(this.btn_friendArmy2);
         this._friendSelectedArmy.AddButton(this.btn_friendArmy3);
         this._friendSelectedArmy.AddButton(this.btn_friendArmy4);
         animation.playChildren = false;
      }
      
      private function friendArmy1(event:MouseEvent) : void
      {
         this._friendArmySelected = 0;
         this._friendSelectedArmy.SelectButton(this.btn_friendArmy1);
      }
      
      private function friendArmy2(event:MouseEvent) : void
      {
         this._friendArmySelected = 1;
         this._friendSelectedArmy.SelectButton(this.btn_friendArmy2);
      }
      
      private function friendArmy3(event:MouseEvent) : void
      {
         this._friendArmySelected = 2;
         this._friendSelectedArmy.SelectButton(this.btn_friendArmy3);
      }
      
      private function friendArmy4(event:MouseEvent) : void
      {
         this._friendArmySelected = 3;
         this._friendSelectedArmy.SelectButton(this.btn_friendArmy4);
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.myArmy.gotoAndStop(this._myArmyVisualToPlay);
         this.friendArmy.gotoAndStop(this._friendArmyVisualToPlay);
         var myArmyBtnTexts:Vector.<TextField> = Vector.<TextField>([this.btn_myArmy1_Txt,this.btn_myArmy2_Txt,this.btn_myArmy3_Txt,this.btn_myArmy4_Txt]);
         for(var i:int = 0; i < this._myArmyGroup.length; i++)
         {
            myArmyBtnTexts[i].text = this._myArmyGroup[i].teamId + "";
         }
         var friendBtnTexts:Vector.<TextField> = Vector.<TextField>([this.btn_friendArmy1_Txt,this.btn_friendArmy2_Txt,this.btn_friendArmy3_Txt,this.btn_friendArmy4_Txt]);
         for(i = 0; i < this._friendArmyGroup.length; i++)
         {
            friendBtnTexts[i].text = this._friendArmyGroup[i].teamId + "";
         }
      }
      
      public function get btn_X() : ButtonSelect
      {
         return panel.getChildByName("btn_X") as ButtonSelect;
      }
      
      public function get btn_friendArmy1() : ButtonSelect
      {
         return this.friendArmy.getChildByName("btn_friendArmy1") as ButtonSelect;
      }
      
      public function get btn_friendArmy2() : ButtonSelect
      {
         return this.friendArmy.getChildByName("btn_friendArmy2") as ButtonSelect;
      }
      
      public function get btn_friendArmy3() : ButtonSelect
      {
         return this.friendArmy.getChildByName("btn_friendArmy3") as ButtonSelect;
      }
      
      private function onX(event:MouseEvent) : void
      {
         BC_Game.instance.friendArmy = null;
         Close(true,null,false);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_Cancel.removeEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         this.btn_X.removeEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         this.btn_OK.removeEventListener(MouseEvent.MOUSE_DOWN,this.onOk);
         this.btn_myArmy1.removeEventListener(MouseEvent.MOUSE_DOWN,this.myArmy1);
         this.btn_myArmy2.removeEventListener(MouseEvent.MOUSE_DOWN,this.myArmy2);
         this.btn_myArmy3.removeEventListener(MouseEvent.MOUSE_DOWN,this.myArmy3);
         this.btn_myArmy4.removeEventListener(MouseEvent.MOUSE_DOWN,this.myArmy4);
         this.btn_friendArmy1.removeEventListener(MouseEvent.MOUSE_DOWN,this.friendArmy1);
         this.btn_friendArmy2.removeEventListener(MouseEvent.MOUSE_DOWN,this.friendArmy2);
         this.btn_friendArmy3.removeEventListener(MouseEvent.MOUSE_DOWN,this.friendArmy3);
         this.btn_friendArmy4.removeEventListener(MouseEvent.MOUSE_DOWN,this.friendArmy4);
      }
      
      public function get friendArmy() : MovieClip
      {
         return panel.getChildByName("friendArmy") as MovieClip;
      }
      
      public function get btn_Cancel() : ButtonSelect
      {
         return panel.getChildByName("btn_Cancel") as ButtonSelect;
      }
      
      private function CheckSelectedArmy() : void
      {
         this._myArmyGroup = Vector.<BC_MetaArmy>([BC_GameProgress.gameProgess.metaArmy1,BC_GameProgress.gameProgess.metaArmy2,BC_GameProgress.gameProgess.metaArmy3,BC_GameProgress.gameProgess.metaArmy4]);
         for(var i:int = int(this._myArmyGroup.length - 1); i >= 0; i--)
         {
            if(this._myArmyGroup[i].IsEmpty() || this._myArmyGroup[i].teamId == 5 && this._myArmyGroup[i].GetArmyValue() > 500 || this._myArmyGroup[i].teamId != 5 && this._myArmyGroup[i].GetArmyValue() > 1000)
            {
               this._myArmyGroup.splice(i,1);
            }
         }
         this._myArmyVisualToPlay = this._myArmyGroup.length;
         this._friendArmyGroup = Vector.<BC_MetaArmy>([this._enemyProgress.metaArmy1,this._enemyProgress.metaArmy2,this._enemyProgress.metaArmy3,this._enemyProgress.metaArmy4]);
         for(i = int(this._friendArmyGroup.length - 1); i >= 0; i--)
         {
            if(this._friendArmyGroup[i].IsEmpty() || this._friendArmyGroup[i].GetArmyValue() > 1000)
            {
               this._friendArmyGroup.splice(i,1);
            }
         }
         this._friendArmyVisualToPlay = this._friendArmyGroup.length;
         this.Refresh();
      }
      
      public function get btn_friendArmy1_Txt() : TextField
      {
         return (this.btn_friendArmy1.getChildByName("txt_ArmySelect") as MovieClip).getChildByName("armyTxt") as TextField;
      }
      
      public function get btn_friendArmy4_Txt() : TextField
      {
         return (this.btn_friendArmy4.getChildByName("txt_ArmySelect") as MovieClip).getChildByName("armyTxt") as TextField;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(this._myArmySelected == -1 || this._friendArmySelected == -1)
         {
            this.btn_OK.Select();
         }
         else
         {
            this.btn_OK.Deselect();
         }
      }
      
      private function myArmy4(event:MouseEvent) : void
      {
         this._myArmySelected = 3;
         this._mySelectedArmy.SelectButton(this.btn_myArmy4);
      }
      
      public function get btn_friendArmy2_Txt() : TextField
      {
         return (this.btn_friendArmy2.getChildByName("txt_ArmySelect") as MovieClip).getChildByName("armyTxt") as TextField;
      }
      
      public function get btn_friendArmy3_Txt() : TextField
      {
         return (this.btn_friendArmy3.getChildByName("txt_ArmySelect") as MovieClip).getChildByName("armyTxt") as TextField;
      }
      
      public function get btn_friendArmy4() : ButtonSelect
      {
         return this.friendArmy.getChildByName("btn_friendArmy4") as ButtonSelect;
      }
      
      private function myArmy1(event:MouseEvent) : void
      {
         this._myArmySelected = 0;
         this._mySelectedArmy.SelectButton(this.btn_myArmy1);
      }
      
      private function myArmy2(event:MouseEvent) : void
      {
         this._myArmySelected = 1;
         this._mySelectedArmy.SelectButton(this.btn_myArmy2);
      }
      
      public function get myArmy() : MovieClip
      {
         return panel.getChildByName("myArmy") as MovieClip;
      }
      
      private function myArmy3(event:MouseEvent) : void
      {
         this._myArmySelected = 2;
         this._mySelectedArmy.SelectButton(this.btn_myArmy3);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_FRIENDARMYSELECT_SCREEN);
      }
   }
}

