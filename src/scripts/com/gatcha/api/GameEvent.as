package com.gatcha.api
{
   import flash.events.Event;
   
   public class GameEvent extends Event
   {
      
      public static const WRAPPER_LOG_THIS:String = "request.game.Log";
      
      public static const WRAPPER_PAUSE:String = "request.game.Pause";
      
      public static const GET_PLAYERINFO:String = "request.game.PlayerInfo";
      
      public static const GET_ONLINE_FRIENDS:String = "request.game.Onine.friends";
      
      public static const ACHIEVEMENT_REACHED:String = "request.game.achievement.reached";
      
      public static const GET_ACHIEVEMENTS:String = "request.game.get.achievements";
      
      public static const PUT_PERSISTENT_STORAGE:String = "request.game.put.persistent.storage";
      
      public static const GET_PERSISTENT_STORAGE:String = "request.game.get.persistent.storage";
      
      public static const DELETE_PERSISTENT_STORAGE:String = "request.game.delete.persistent.storage";
      
      public static const SINGLEPLAYER_START_GAME:String = "request.game.Start";
      
      public static const SINGLEPLAYER_END_GAME:String = "request.game.End";
      
      public static const SINGLEPLAYER_UPDATE_HIGHSCORE:String = "request.game.UpdateHighScore";
      
      public static const MULTIPLAYER_GIVE_SMARTFOXCLIENT:String = "request.game.SmartFoxClient";
      
      public static const MULTIPLAYER_JOIN_LOBBY:String = "request.game.Lobby.Room";
      
      public static const MULTIPLAYER_JOIN_AWESOME_ROOM:String = "request.game.Awesome.Room";
      
      public static const MULTIPLAYER_CREATE_ROOM:String = "request.game.Create.Room";
      
      public static const MULTIPLAYER_PLAY_AGAIN:String = "request.game.play.again";
      
      public static const MULTIPLAYER_UPDATE_RANKINGS:String = "request.game.update.rankings";
      
      public static const MULTIPLAYER_END_GAME:String = "request.game.end.game";
      
      public static const GET_CREDITS:String = "request.payment.get.credits";
      
      public static const WRAPPER_PAUSED:String = "response.game.Paused";
      
      public static const WRAPPER_UNPAUSED:String = "response.game.UnPaused";
      
      public static const GET_PLAYERINFO_RESULT:String = "response.Player.Info.Result";
      
      public static const GET_ONLINE_FRIENDS_RESULT:String = "response.Online.friends.Result";
      
      public static const ACHIEVEMENT_REACHED_RESULT:String = "response.achievement.reached.Result";
      
      public static const ACHIEVEMENT_REACHED_FAIL:String = "response.achievement.reached.Fail";
      
      public static const GET_ACHIEVEMENTS_RESULT:String = "response.wrapper.getAchievements.Result";
      
      public static const GET_ACHIEVEMENTS_FAIL:String = "response.wrapper.getAchievements.Fail";
      
      public static const GET_PERSISTENT_STORAGE_RESULT:String = "response.wrapper.getPersistentStorage.Result";
      
      public static const GET_PERSISTENT_STORAGE_FAIL:String = "response.wrapper.getPersistentStorage.Fail";
      
      public static const PUT_PERSISTENT_STORAGE_RESULT:String = "response.wrapper.putPersistentStorage.Result";
      
      public static const PUT_PERSISTENT_STORAGE_FAIL:String = "response.wrapper.putPersistentStorage.Fail";
      
      public static const DELETE_PERSISTENT_STORAGE_RESULT:String = "response.wrapper.deletePersistentStorage.Result";
      
      public static const DELETE_PERSISTENT_STORAGE_FAIL:String = "response.wrapper.deletePersistentStorage.Fail";
      
      public static const SINGLEPLAYER_START_GAME_RESULT:String = "response.game.Start";
      
      public static const SINGLEPLAYER_START_GAME_FAIL:String = "response.game.Start.Fail";
      
      public static const SINGLEPLAYER_END_GAME_RESULT:String = "response.game.End";
      
      public static const SINGLEPLAYER_END_GAME_FAIL:String = "response.game.End.Fail";
      
      public static const SINGLEPLAYER_UPDATE_HIGHSCORE_RESULT:String = "response.game.UpdateSore";
      
      public static const SINGLEPLAYER_UPDATE_HIGHSCORE_FAIL:String = "response.game.Update.Fail";
      
      public static const MULTIPLAYER_GIVE_SMARTFOXCLIENT_RESULT:String = "response.smartfox.Client.Result";
      
      public static const MULTIPLAYER_JOIN_AWESOME_ROOM_RESULT:String = "response.joinAwesomeRoom.Result";
      
      public static const MULTIPLAYER_JOIN_AWESOME_ROOM_FAIL:String = "response.joinAwesomeRoom.Fail";
      
      public static const MULTIPLAYER_START_GAME_RESULT:String = "response.wrapper.startGame.Result";
      
      public static const MULTIPLAYER_START_GAME_FAIL:String = "response.wrapper.startGame.Fail";
      
      public static const MULTIPLAYER_END_GAME_RESULT:String = "response.wrapper.endGame.Result";
      
      public static const MULTIPLAYER_END_GAME_FAIL:String = "response.wrapper.endGame.Fail";
      
      public static const GET_CREDITS_RESULT:String = "response.payment.get.credits.result";
      
      public static const GET_CREDITS_FAIL:String = "response.payment.get.credits.fail";
      
      public var data:*;
      
      public function GameEvent(type:String, data:* = null, bubbles:Boolean = true, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
         this.data = data;
      }
      
      override public function clone() : Event
      {
         return new GameEvent(type,data,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("GameEvent","type","data","bubbles","cancelable","eventPhase");
      }
   }
}

