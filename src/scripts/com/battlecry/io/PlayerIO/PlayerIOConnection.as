package com.battlecry.io.PlayerIO
{
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.QuestionScreen;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.savefileAPI.ISaveFileAPI;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import playerio.Client;
   import playerio.DatabaseObject;
   
   public class PlayerIOConnection implements ISaveFileAPI
   {
      
      private var _error:Callback;
      
      private var _connected:Boolean;
      
      private var _lastError:String;
      
      private var _debugMode:Boolean = false;
      
      private var _root:DisplayObject;
      
      private var _success:Callback;
      
      public var partner:String;
      
      private var _gameId:String;
      
      private var _onSaveSuccessCallback:Callback;
      
      private var _myPlayerObjectLoaded:Boolean;
      
      private var _dataLoadedCallback:Callback;
      
      private var _client:Client;
      
      private var _myPlayerObject:DatabaseObject;
      
      private var _connectPending:Boolean;
      
      private var _debugName:String;
      
      public function PlayerIOConnection(gameId:String, root:DisplayObject, debugMode:Boolean, debugName:String)
      {
         super();
         this._debugName = debugName;
         this._myPlayerObjectLoaded = false;
         this._gameId = gameId;
         this._root = root;
         this._connected = false;
         this._debugMode = debugMode;
         this._lastError = "";
         this._connectPending = false;
      }
      
      public function Connect(root:MovieClip, success:Callback = null, error:Callback = null) : void
      {
      }
      
      public function get nameOfSystem() : String
      {
         return "playerio";
      }
      
      public function get debugMode() : Boolean
      {
         return this._debugMode;
      }
      
      public function LoadAfterConnect() : void
      {
         this.LoadMyData(this._success,this._error);
      }
      
      public function TraceMsg(str:String) : void
      {
         trace("PlayerIOConnection (" + this._debugName + ") : " + str);
      }
      
      public function get connected() : Boolean
      {
         return this._connected;
      }
      
      public function LoadMyData(success:Callback, error:Callback) : void
      {
         if(!this.connected)
         {
            return;
         }
         this._client.bigDB.loadMyPlayerObject(function(ob:DatabaseObject):void
         {
            onBigDBLoaded(ob);
            if(success)
            {
               success.DoCallback();
            }
         },function():void
         {
            onBigDBLoadedError();
            if(error)
            {
               error.DoCallback();
            }
         });
         this.TraceMsg("Loading Data...");
      }
      
      private function onBigDBLoadedError() : void
      {
      }
      
      protected function SetCallbacks(success:Callback, error:Callback) : void
      {
         this._success = success;
         this._error = error;
      }
      
      public function get gameId() : String
      {
         return this._gameId;
      }
      
      public function SetClient(client:Client) : void
      {
         this._client = client;
         this._connected = true;
         this._connectPending = false;
      }
      
      protected function onConnectError(e:Error) : void
      {
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_OK,e.message);
         this._lastError = e.getStackTrace();
         this.DeclareError();
      }
      
      public function get isEmpty() : Boolean
      {
         return this.myPlayerObject.savefile == null || this.myPlayerObject.savefile == "";
      }
      
      public function get loggedIn() : Boolean
      {
         return this.connected;
      }
      
      private function onBigDBLoaded(ob:DatabaseObject) : void
      {
         this._myPlayerObject = ob;
         this._myPlayerObjectLoaded = true;
         if(this._dataLoadedCallback)
         {
            this._dataLoadedCallback.DoCallback();
         }
         this.TraceMsg("Data Loaded SUCCESS!");
      }
      
      public function get dataLoaded() : Boolean
      {
         return this.myPlayerObjectLoaded;
      }
      
      public function get savedData() : String
      {
         return this.myPlayerObject.savefile;
      }
      
      public function get client() : Client
      {
         return this._client;
      }
      
      protected function DeclareSuccess(client:Client, autoLoadData:Boolean) : void
      {
         this._client = client;
         this._connected = true;
         this._connectPending = false;
         if(autoLoadData)
         {
            this.LoadMyData(this._success,this._error);
         }
         else if(this._success)
         {
            this._success.DoCallback();
         }
      }
      
      public function get myPlayerObject() : DatabaseObject
      {
         return this._myPlayerObject;
      }
      
      public function get connectPending() : Boolean
      {
         return this._connectPending;
      }
      
      protected function DeclareError() : void
      {
         this._connected = false;
         this._connectPending = false;
         this.TraceMsg(this._lastError);
         if(this._error)
         {
            this._error.DoCallback();
         }
      }
      
      public function get root() : DisplayObject
      {
         return this._root;
      }
      
      public function set onDataLoadedCallback(c:Callback) : void
      {
         this._dataLoadedCallback = c;
      }
      
      public function SaveData(s:String, onDone:Callback) : void
      {
         if(!this.myPlayerObject)
         {
            return;
         }
         this._onSaveSuccessCallback = onDone;
         this.myPlayerObject.savefile = s;
         this.myPlayerObject.save(false,false,function():void
         {
            if(onDone)
            {
               onDone.DoCallback();
            }
         });
      }
      
      protected function DeclarePending() : void
      {
         this._connected = false;
         this._connectPending = true;
      }
      
      public function get myPlayerObjectLoaded() : Boolean
      {
         return this._myPlayerObjectLoaded;
      }
      
      private function onSaveSuccess() : void
      {
         if(this._onSaveSuccessCallback)
         {
            this._onSaveSuccessCallback.DoCallback();
         }
      }
      
      public function ClearData() : void
      {
         this.SaveData("",null);
      }
   }
}

