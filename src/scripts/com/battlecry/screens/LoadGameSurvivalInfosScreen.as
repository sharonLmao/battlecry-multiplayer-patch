package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.screens.view.FlagView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class LoadGameSurvivalInfosScreen extends LoadGameScreen
   {
      
      private var _allyFlagView:FlagView;
      
      private var _coopAllyFlagView:FlagView;
      
      public function LoadGameSurvivalInfosScreen()
      {
         super();
      }
      
      private function get loading() : MovieClip
      {
         return visual.getChildByName("loading") as MovieClip;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(CheckAllLoaded())
         {
            this.loading.visible = false;
            this.btn_fight.visible = true;
         }
      }
      
      private function get playerName() : TextField
      {
         return visual.getChildByName("playerName") as TextField;
      }
      
      private function get btn_fight() : ButtonSelect
      {
         return visual.getChildByName("btn_fight") as ButtonSelect;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_fight);
         this.btn_fight.addEventListener(MouseEvent.MOUSE_DOWN,this.onFight);
         this.btn_fight.visible = false;
         this._allyFlagView = new FlagView(this.allyflagView);
         this._coopAllyFlagView = new FlagView(this.coopAllyflagView);
         if(this.loading)
         {
            this.loading.play();
         }
         this.Refresh();
      }
      
      private function onFight(event:MouseEvent) : void
      {
         var a:BC_MetaArmy = null;
         Close(true,null,false);
         Main.instance.LaunchGame();
         if(BC_Game.instance.survivalCoopArmy)
         {
            a = new BC_MetaArmy(-1);
            a.Copy(BC_GameProgress.gameProgess.getArmy(5));
            a.metaSquad1.ResetSquad();
            if(BC_Game.instance.myArmyBackRow)
            {
               a.metaSquad5.Copy(BC_GameProgress.gameProgess.getArmy(5).metaSquad4);
               a.metaSquad4.Copy(BC_GameProgress.gameProgess.getArmy(5).metaSquad3);
               a.metaSquad3.Copy(BC_Game.instance.survivalCoopArmy.metaSquad4);
               a.metaSquad2.Copy(BC_Game.instance.survivalCoopArmy.metaSquad3);
            }
            else
            {
               a.metaSquad5.Copy(BC_Game.instance.survivalCoopArmy.metaSquad4);
               a.metaSquad4.Copy(BC_Game.instance.survivalCoopArmy.metaSquad3);
               a.metaSquad3.Copy(BC_GameProgress.gameProgess.getArmy(5).metaSquad4);
               a.metaSquad2.Copy(BC_GameProgress.gameProgess.getArmy(5).metaSquad3);
            }
            BC_Game.instance.InitRoundManager(a,metaArmy);
         }
         else
         {
            BC_Game.instance.InitRoundManager(BC_GameProgress.gameProgess.CurrentSelectedArmy(),metaArmy);
         }
      }
      
      private function get coopAllyflagView() : MovieClip
      {
         return visual.getChildByName("coopAllyflagView") as MovieClip;
      }
      
      private function get allyflagView() : MovieClip
      {
         return visual.getChildByName("allyflagView") as MovieClip;
      }
      
      private function get coopPlayerName() : TextField
      {
         return visual.getChildByName("coopPlayerName") as TextField;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_fight.removeEventListener(MouseEvent.MOUSE_DOWN,this.onFight);
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.playerName.text = Main.instance.GetMultiplayerName();
         this._allyFlagView.SetMetaFlag(BC_GameProgress.gameProgess.metaFlag);
         if(BC_Game.instance.isSurvivalCoop)
         {
            this.coopPlayerName.text = BC_Game.instance.metaEnemyLoaded.enemyName.substr(3,BC_Game.instance.metaEnemyLoaded.enemyName.length - 3);
            this._coopAllyFlagView.SetMetaFlag(BC_Game.instance.metaEnemyLoaded.metaFlag);
         }
      }
      
      override public function CreateVisual() : Animation
      {
         if(BC_Game.instance.isSurvivalCoop)
         {
            return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_LOADGAMESURVIVALCOOP_SCREEN);
         }
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_LOADGAMESURVIVALSOLO_SCREEN);
      }
   }
}

