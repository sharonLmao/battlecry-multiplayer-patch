package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import playerio.DatabaseObject;
   import playerio.PlayerIOError;
   
   public class SearchingFriendScreen extends BC_Screen
   {
      
      private var _screenToClose:BC_Screen;
      
      public function SearchingFriendScreen()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
      }
      
      public function get anim() : MovieClip
      {
         return visual.getChildByName("anim") as MovieClip;
      }
      
      public function Search(friendName:String, screenToClose:BC_Screen) : void
      {
         this._screenToClose = screenToClose;
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.bigDB.load("PlayerObjects",friendName,this.SuccessFindPlayer,this.FailFindPlayer);
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_LOADING_SCREEN);
      }
      
      private function SuccessFindPlayer(o:DatabaseObject) : void
      {
         var q:QuestionScreen = null;
         if(o)
         {
            this._screenToClose.Close(true,null,false);
            BC_GameProgress.gameProgess.friendList.push(o.key);
            ScreenManager.instance.RefreshAll();
            BC_Game.instance.RefreshFriendList();
            BC_Game.instance.Save();
         }
         else
         {
            q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
            q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_FRIEND_WASNT_FOUND));
         }
         Close(true,null,false);
      }
      
      private function FailFindPlayer(p:PlayerIOError) : void
      {
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_FRIEND_WASNT_FOUND));
         this._screenToClose.Close(true,null,false);
         Close(true,null,false);
      }
   }
}

