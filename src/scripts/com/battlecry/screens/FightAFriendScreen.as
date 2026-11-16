package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.MetaEnemyLoaded;
   import com.battlecry.meta.model.ModelCampaignEnum;
   import com.battlecry.screens.view.ArmyView;
   import com.battlecry.screens.view.FlagView;
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
   
   public class FightAFriendScreen extends BC_Screen
   {
      
      private var _btnArmyGroup:ButtonSelectGroup;
      
      private var _flagView:FlagView;
      
      private var _ArmyView:ArmyView;
      
      private var _metaArmy:BC_MetaArmy;
      
      private var _checkReferencial:Boolean;
      
      public function FightAFriendScreen()
      {
         super();
      }
      
      public function get flagView() : MovieClip
      {
         return visual.getChildByName("flagView") as MovieClip;
      }
      
      public function get btn_army1_Activated() : ButtonSelect
      {
         return visual.getChildByName("btn_army1_Activated") as ButtonSelect;
      }
      
      public function get btn_army2_Activated() : ButtonSelect
      {
         return visual.getChildByName("btn_army2_Activated") as ButtonSelect;
      }
      
      public function get btn_army4_Activated() : ButtonSelect
      {
         return visual.getChildByName("btn_army4_Activated") as ButtonSelect;
      }
      
      public function get challengerName() : TextField
      {
         return visual.getChildByName("challengerName") as TextField;
      }
      
      private function AfterSaveInit() : void
      {
         BC_Game.instance.currentCampaign = ModelCampaignEnum.CAMPAIGN1_1_1;
         BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_STORY_SCREEN);
      }
      
      public function get btn_army3_Activated() : ButtonSelect
      {
         return visual.getChildByName("btn_army3_Activated") as ButtonSelect;
      }
      
      public function get btn_Fight() : ButtonSelect
      {
         return visual.getChildByName("btn_fight") as ButtonSelect;
      }
      
      public function get btn_army2() : ButtonSelect
      {
         return visual.getChildByName("btn_army2") as ButtonSelect;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.challengerName.text = BC_Game.instance.metaEnemyChallenge.enemyName;
         this._flagView.SetMetaFlag(BC_Game.instance.metaEnemyChallenge.metaFlag);
         this._ArmyView.SetArmy(BC_GameProgress.gameProgess.CurrentSelectedArmy());
         this._ArmyView.Refresh();
         this._ArmyView.armyPoint.visible = false;
         this.myArmyName.text = BC_GameProgress.gameProgess.CurrentSelectedArmy().armyName;
         this._metaArmy = BC_Game.instance.metaEnemyChallenge.metaArmy;
      }
      
      private function InitArmyButtons() : void
      {
         this._btnArmyGroup = new ButtonSelectGroup();
         this._btnArmyGroup.AddButton(this.btn_army1);
         this._btnArmyGroup.AddButton(this.btn_army1_Activated);
         this.btn_army1.visible = false;
         this.btn_army1_Activated.visible = false;
         this.btn_army2.visible = false;
         this.btn_army2_Activated.visible = false;
         this.btn_army2_Locked.visible = false;
         this.btn_army3.visible = false;
         this.btn_army3_Activated.visible = false;
         this.btn_army3_Locked.visible = false;
         this.btn_army4.visible = false;
         this.btn_army4_Activated.visible = false;
         this.btn_army4_Locked.visible = false;
         if(BC_Game.instance.IsInFirstAct())
         {
            this.btn_army1.visible = true;
            this.btn_army2_Locked.visible = true;
            this.btn_army3_Locked.visible = true;
            this.btn_army4_Locked.visible = true;
            this.btn_army1.Select();
            this.armySelect1(null);
         }
         else
         {
            this._btnArmyGroup.AddButton(this.btn_army2);
            this._btnArmyGroup.AddButton(this.btn_army2_Activated);
            this._btnArmyGroup.AddButton(this.btn_army3);
            this._btnArmyGroup.AddButton(this.btn_army3_Activated);
            this._btnArmyGroup.AddButton(this.btn_army4);
            this._btnArmyGroup.AddButton(this.btn_army4_Activated);
            if(BC_GameProgress.gameProgess.metaArmy1.IsMultiplayer())
            {
               this.btn_army1_Activated.visible = true;
            }
            else
            {
               this.btn_army1.visible = true;
            }
            if(BC_GameProgress.gameProgess.metaArmy2.IsMultiplayer())
            {
               this.btn_army2_Activated.visible = true;
            }
            else
            {
               this.btn_army2.visible = true;
            }
            if(BC_GameProgress.gameProgess.metaArmy3.IsMultiplayer())
            {
               this.btn_army3_Activated.visible = true;
            }
            else
            {
               this.btn_army3.visible = true;
            }
            if(BC_GameProgress.gameProgess.metaArmy4.IsMultiplayer())
            {
               this.btn_army4_Activated.visible = true;
            }
            else
            {
               this.btn_army4.visible = true;
            }
            switch(this._metaArmy.teamId)
            {
               case 1:
                  this.armySelect1(null);
                  break;
               case 2:
                  this.armySelect2(null);
                  break;
               case 3:
                  this.armySelect3(null);
                  break;
               case 4:
                  this.armySelect4(null);
            }
         }
      }
      
      public function get fightafriendload() : MovieClip
      {
         return visual.getChildByName("fightafriendload") as MovieClip;
      }
      
      public function get btn_army3_Locked() : ButtonSelect
      {
         return visual.getChildByName("btn_army3_Locked") as ButtonSelect;
      }
      
      public function get btn_army4_Locked() : ButtonSelect
      {
         return visual.getChildByName("btn_army4_Locked") as ButtonSelect;
      }
      
      private function armySelect1(event:MouseEvent) : void
      {
         if(this.btn_army1.isSelected || this.btn_army1_Activated.isSelected)
         {
            return;
         }
         if(this.btn_army1.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army1);
         }
         if(this.btn_army1_Activated.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army1_Activated);
         }
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(1);
         this._metaArmy = BC_GameProgress.gameProgess.CurrentSelectedArmy();
         this.Refresh();
      }
      
      private function onX(event:MouseEvent) : void
      {
         BC_Game.instance.metaEnemyChallenge = null;
         if(BC_GameProgress.gameProgess.metaCampaignProgress.heroesCampaignLvl == 1)
         {
            BC_GameProgress.gameProgess.SetCurrentSelectedArmy(1);
            BC_Game.instance.Save(new Callback(this.AfterSaveInit,this,null));
            return;
         }
         BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_ARMYCREATION_SCREEN);
      }
      
      private function armySelect3(event:MouseEvent) : void
      {
         if(this.btn_army3.isSelected || this.btn_army3_Activated.isSelected)
         {
            return;
         }
         if(this.btn_army3.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army3);
         }
         if(this.btn_army3_Activated.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army3_Activated);
         }
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(3);
         this._metaArmy = BC_GameProgress.gameProgess.CurrentSelectedArmy();
         this.Refresh();
      }
      
      private function armySelect4(event:MouseEvent) : void
      {
         if(this.btn_army4.isSelected || this.btn_army4_Activated.isSelected)
         {
            return;
         }
         if(this.btn_army4.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army4);
         }
         if(this.btn_army4_Activated.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army4_Activated);
         }
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(4);
         this._metaArmy = BC_GameProgress.gameProgess.CurrentSelectedArmy();
         this.Refresh();
      }
      
      public function get myArmyName() : TextField
      {
         return visual.getChildByName("myArmyName") as TextField;
      }
      
      public function get anim() : MovieClip
      {
         return this.fightafriendload.getChildByName("anim") as MovieClip;
      }
      
      public function get btn_customize() : ButtonSelect
      {
         return visual.getChildByName("btn_customize") as ButtonSelect;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(this.anim)
         {
            this.anim.play();
         }
      }
      
      public function get btn_army3() : ButtonSelect
      {
         return visual.getChildByName("btn_army3") as ButtonSelect;
      }
      
      public function get btn_army4() : ButtonSelect
      {
         return visual.getChildByName("btn_army4") as ButtonSelect;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._checkReferencial = true;
         InitOkBtn(this.btn_Fight);
         this.btn_Fight.addEventListener(MouseEvent.MOUSE_DOWN,this.onFight);
         InitOkBtn(this.btn_X);
         this.btn_X.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         InitOkBtn(this.btn_customize);
         this.btn_customize.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         InitOkBtn(this.btn_army1);
         this.btn_army1.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect1);
         InitOkBtn(this.btn_army1_Activated);
         this.btn_army1_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect1);
         InitOkBtn(this.btn_army2);
         this.btn_army2.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect2);
         InitOkBtn(this.btn_army2_Activated);
         this.btn_army2_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect2);
         InitOkBtn(this.btn_army3);
         this.btn_army3.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect3);
         InitOkBtn(this.btn_army3_Activated);
         this.btn_army3_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect3);
         InitOkBtn(this.btn_army4);
         this.btn_army4.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect4);
         InitOkBtn(this.btn_army4_Activated);
         this.btn_army4_Activated.addEventListener(MouseEvent.MOUSE_DOWN,this.armySelect4);
         this.fightafriendload.visible = false;
         this._flagView = new FlagView(this.flagView);
         this._ArmyView = new ArmyView(this.armyView);
         this.Refresh();
         this.InitArmyButtons();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_Fight.removeEventListener(MouseEvent.MOUSE_DOWN,this.onFight);
         this.btn_X.removeEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         this.btn_customize.removeEventListener(MouseEvent.MOUSE_DOWN,this.onX);
      }
      
      private function AfterFight() : void
      {
      }
      
      public function get btn_X() : ButtonSelect
      {
         return visual.getChildByName("btn_X") as ButtonSelect;
      }
      
      public function get btn_army2_Locked() : ButtonSelect
      {
         return visual.getChildByName("btn_army2_Locked") as ButtonSelect;
      }
      
      private function onFight(event:MouseEvent) : void
      {
         BC_Game.instance.metaEnemyLoaded = new MetaEnemyLoaded();
         BC_Game.instance.metaEnemyLoaded = BC_Game.instance.metaEnemyChallenge;
         BC_Game.instance.metaEnemyChallenge = null;
         BC_Game.instance.isChallenge = true;
         BC_Game.instance.challengerName = BC_Game.instance.metaEnemyChallenge.fullArmyName;
         BC_Game.instance.TransitionTo(this,BC_ScreenFactory.ID_LOADGAME_INFOS_SCREEN);
      }
      
      public function get armyView() : MovieClip
      {
         return visual.getChildByName("armyView") as MovieClip;
      }
      
      private function armySelect2(event:MouseEvent) : void
      {
         if(this.btn_army2.isSelected || this.btn_army2_Activated.isSelected)
         {
            return;
         }
         if(this.btn_army2.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army2);
         }
         if(this.btn_army2_Activated.visible)
         {
            this._btnArmyGroup.SelectButton(this.btn_army2_Activated);
         }
         BC_GameProgress.gameProgess.SetCurrentSelectedArmy(2);
         this._metaArmy = BC_GameProgress.gameProgess.CurrentSelectedArmy();
         this.Refresh();
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_FIGHTAFRIEND_SCREEN);
      }
      
      public function get btn_army1() : ButtonSelect
      {
         return visual.getChildByName("btn_army1") as ButtonSelect;
      }
   }
}

