package com.battlecry.screens
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.model.ModelFlag;
   import com.battlecry.meta.model.ModelFlagEnum;
   import com.battlecry.screens.view.SparkGroupView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.io.Callback;
   import flash.display.MovieClip;
   
   public class ChangeRankScreen extends BC_Screen
   {
      
      private var _sparkGroupView:SparkGroupView;
      
      private var _storm1:Boolean;
      
      private var _storm2:Boolean;
      
      private var _storm3:Boolean;
      
      private var _newRank:int;
      
      private var _oldRank:int;
      
      private var _isClose:Boolean;
      
      public function ChangeRankScreen()
      {
         super();
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(this._isClose)
         {
            return;
         }
         if(visual.currentFrame >= 45)
         {
            if(this.armyRankIcon)
            {
               this.armyRankIcon.gotoAndStop(this._newRank);
            }
         }
         else if(this.armyRankIcon)
         {
            this.armyRankIcon.gotoAndStop(this._oldRank);
         }
         if(!this._storm1 && visual.currentFrame >= 40)
         {
            this._storm1 = true;
            this._sparkGroupView.CreateSparkExplosion(50,335,235);
            Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_THUNDERSTORMSTAFF);
         }
         if(!this._storm2 && visual.currentFrame >= 42)
         {
            this._storm2 = true;
            this._sparkGroupView.CreateSparkExplosion(50,360,345);
         }
         if(!this._storm3 && visual.currentFrame >= 44)
         {
            this._storm3 = true;
            this._sparkGroupView.CreateSparkExplosion(50,450,260);
         }
         if(this._sparkGroupView)
         {
            this._sparkGroupView.Update();
         }
         if(visual.currentFrame >= 105)
         {
            this.Close(true,null,false);
         }
      }
      
      public function get armyRankIcon() : MovieClip
      {
         return visual.getChildByName("armyRankIcon") as MovieClip;
      }
      
      override protected function get closeFrame() : int
      {
         return 106;
      }
      
      public function SetRank(oldRank:int, newRank:int) : void
      {
         this._oldRank = oldRank;
         this._newRank = newRank;
         this.CheckFlagUnlock();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._sparkGroupView = new SparkGroupView(visual);
         this._isClose = false;
         this._storm1 = false;
         this._storm2 = false;
         this._storm3 = false;
         animation.playChildren = false;
      }
      
      private function CheckFlagUnlock() : void
      {
         var m:ModelFlag = null;
         for(var i:int = 0; i < ModelFlagEnum.ALL.length; i++)
         {
            m = ModelFlagEnum.ALL[i];
            if(m.lvlToUnlock != -1 && m.lvlToUnlock <= this._newRank)
            {
               BC_GameProgress.gameProgess.flagManager.UnlockFlag(m);
            }
         }
      }
      
      override protected function get idleFrame() : int
      {
         return 105;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_CHANGERANK_SCREEN);
      }
      
      override public function Close(remove:Boolean, c:Callback, quickClose:Boolean) : void
      {
         super.Close(remove,c,quickClose);
         this._isClose = true;
      }
   }
}

