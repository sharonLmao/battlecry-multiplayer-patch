package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.model.ModelSurvivalArmyEnum;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.screens.ScreenManager;
   
   public class TransitionScreen extends BC_Screen
   {
      
      private var _screenToClose:BC_Screen;
      
      private var _nextScreen:int;
      
      public function TransitionScreen()
      {
         super();
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         var random:int = 0;
         var m:BC_MetaArmy = null;
         super.ShowIdle(context);
         Main.instance.ClearAllCaches();
         if(BC_Game.instance.isInit)
         {
            BC_Game.instance.DestroyAfterUpdate();
         }
         if(this._screenToClose)
         {
            this._screenToClose.Close(true,null,false);
         }
         var s:BC_Screen = ScreenManager.instance.ShowScreen(this._nextScreen) as BC_Screen;
         if(s as LoadGameScreen)
         {
            if(BC_Game.instance.isRanked)
            {
               (s as LoadGameScreen).SetEnemyArmy(BC_Game.instance.metaEnemyLoaded.metaArmy);
            }
            else if(BC_Game.instance.isSurvival)
            {
               random = Math.floor(Math.random() * ModelSurvivalArmyEnum.SURVIVAL_WAVE_1.length);
               m = ModelSurvivalArmyEnum.SURVIVAL_WAVE_1[random];
               (s as LoadGameScreen).SetEnemyArmy(m);
            }
            else if(BC_Game.instance.currentCampaign)
            {
               (s as LoadGameScreen).SetEnemyArmy(BC_Game.instance.currentCampaign.metaArmy);
            }
            else if(BC_Game.instance.friendArmy)
            {
               (s as LoadGameScreen).SetEnemyArmy(BC_Game.instance.friendArmy);
            }
            else
            {
               (s as LoadGameScreen).SetEnemyArmy(BC_Game.instance.metaEnemyLoaded.metaArmy);
            }
         }
         Close(true,null,false);
      }
      
      public function SetScreen(screenToClose:BC_Screen, nextScreen:int) : void
      {
         this._screenToClose = screenToClose;
         this._nextScreen = nextScreen;
      }
      
      override protected function get idleFrame() : int
      {
         return 6;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_TRANSITIONSCREEN);
      }
      
      override protected function get closeFrame() : int
      {
         return 7;
      }
   }
}

