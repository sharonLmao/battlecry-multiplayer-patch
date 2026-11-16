package com.lachhhEngine.io.files
{
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.ISaveObject;
   import com.lachhhEngine.io.encryption.MetaDataEncryption;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import flash.net.SharedObject;
   
   public class FileManager implements ISaveObject
   {
      
      private static var _instance:FileManager;
      
      public static var DATA_NAME:String = "GameData";
      
      private static const SEPARATOR:String = "~*~";
      
      public static const EMPTY_FILE:String = "[EMPTY]";
      
      private var _isEmpty:Boolean;
      
      private var _firstPlay:Boolean;
      
      private var _fileName:String;
      
      private var _gameProgressFactory:GameProgressFactory;
      
      private var _main:MainGame;
      
      private var _gameProgress:Array;
      
      private var _crntGameProgress:GameProgress;
      
      private var _metaDataEncryption:MetaDataEncryption;
      
      private var _transferDoneCallback:Callback;
      
      private var _lastEncoded:String = "";
      
      private var _gamePrefs:GamePrefs;
      
      private var _sharedObject:SharedObject;
      
      private var _numFiles:int;
      
      public function FileManager(main:MainGame, gameProgressFactory:GameProgressFactory, numFiles:int, fileName:String)
      {
         super();
         if(_instance != null)
         {
            throw new Error("FileManager already instanciated");
         }
         _instance = this;
         this._main = main;
         this._gameProgressFactory = gameProgressFactory;
         this._sharedObject = SharedObject.getLocal(fileName);
         this._firstPlay = this._sharedObject.data[DATA_NAME] == "" || this._sharedObject.data[DATA_NAME] == null;
         this._metaDataEncryption = new MetaDataEncryption(this,this._sharedObject,DATA_NAME);
         this._numFiles = numFiles;
         this._fileName = fileName;
         this.CreateGame();
         this.Load();
      }
      
      public static function get instance() : FileManager
      {
         if(_instance == null)
         {
            throw new Error("FileManager not initialized, called FileManager.Init()");
         }
         return _instance;
      }
      
      public function get firstPlay() : Boolean
      {
         return this._firstPlay;
      }
      
      private function Load() : void
      {
         var saveString:String = null;
         if(VersionInfo.useEncryptionForSaveFile)
         {
            saveString = this._metaDataEncryption.EncryptedLoad();
         }
         else
         {
            saveString = this._metaDataEncryption.LoadWithoutEncrypt();
         }
         if(saveString == null || saveString == "")
         {
            this._isEmpty = true;
         }
         else
         {
            this._isEmpty = false;
            this.Decode(saveString);
         }
      }
      
      public function Decode(s:String) : void
      {
         var i:int;
         var error:Error = null;
         var gameProgress:GameProgress = null;
         var loadedString:String = null;
         var params:Array = s.split(SEPARATOR);
         var gamePrefsCode:String = params.shift();
         if(params.length != this._numFiles)
         {
            error = new Error("Incorrect number of files detected");
         }
         this._gamePrefs.Decode(gamePrefsCode);
         for(i = 0; i < this._numFiles; i++)
         {
            gameProgress = this.GetGameProgress(i);
            loadedString = params.shift();
            if(loadedString != EMPTY_FILE && loadedString != null)
            {
               gameProgress.isEmpty = false;
               try
               {
                  gameProgress.Decode(loadedString);
               }
               catch(e:Error)
               {
                  gameProgress.isEmpty = true;
                  error = e;
               }
               continue;
            }
            gameProgress.isEmpty = true;
         }
         if(error != null)
         {
            if(VersionInfo.debugVersion)
            {
               ExternalAPIManager.getSavedFileAPI().ClearData();
            }
            this.SaveToSharedObject();
            throw new Error("Conflicted File, file deleted" + error.message);
         }
      }
      
      public function set isDirty(value:Boolean) : void
      {
      }
      
      private function onTransferDone() : void
      {
         this.LoadFromSaveAPI();
         if(this._transferDoneCallback)
         {
            this._transferDoneCallback.DoCallback();
         }
      }
      
      public function SaveToSharedObject() : void
      {
         if(VersionInfo.useEncryptionForSaveFile)
         {
            this._metaDataEncryption.EncryptedSave();
         }
         else
         {
            this._metaDataEncryption.SaveWithoutEncrypt();
         }
         this._isEmpty = false;
      }
      
      private function SetCurrentAndSave(iFile:int = -1) : void
      {
         var iGameFile:int = iFile == -1 ? this._crntGameProgress.id : iFile;
         if(iGameFile == -1)
         {
            throw new Error("GameProgress must not equal -1");
         }
         this.SetGameProgress(iGameFile,this._crntGameProgress,true,true);
      }
      
      public function SetGameProgress(iFile:int, gameProgress:GameProgress, save:Boolean = true, copy:Boolean = true) : void
      {
         var savedGameProgress:GameProgress = null;
         var saveString:String = gameProgress.Encode();
         if(saveString.indexOf(SEPARATOR) != -1)
         {
            throw new Error("File separator found in GameProgress Encode String (" + SEPARATOR + "). You must use something else.");
         }
         if(copy)
         {
            savedGameProgress = this.CloneGameProgress(gameProgress,saveString);
         }
         else
         {
            savedGameProgress = gameProgress;
         }
         savedGameProgress.isEmpty = false;
         savedGameProgress.id = iFile;
         if(this._gameProgress[iFile] != null)
         {
            this.DestroyGameProgress(this._gameProgress[iFile]);
         }
         this._gameProgress[iFile] = savedGameProgress;
         if(save)
         {
            this.SaveToSharedObject();
         }
      }
      
      public function CloneGameProgress(gp:GameProgress, savedCode:String = null) : GameProgress
      {
         var newGp:GameProgress = this._gameProgressFactory.GetNewInstance();
         newGp.id = gp.id;
         if(!gp.isEmpty)
         {
            if(savedCode == null)
            {
               newGp.Decode(gp.Encode());
            }
            else
            {
               newGp.Decode(savedCode);
            }
            newGp.isEmpty = false;
         }
         return newGp;
      }
      
      public function GetGameProgress(iFile:int) : GameProgress
      {
         return this._gameProgress[iFile];
      }
      
      public function Clear() : void
      {
         this._gamePrefs = this._gameProgressFactory.GetNewGamePrefs(this._main);
         for(var i:int = 0; i < this._numFiles; i++)
         {
            this.GetGameProgress(i).Clear();
         }
         this._isEmpty = true;
         this.SaveToSharedObject();
      }
      
      private function CreateGame() : void
      {
         var newInstance:GameProgress = null;
         this._gameProgress = new Array();
         this._gamePrefs = this._gameProgressFactory.GetNewGamePrefs(this._main);
         for(var i:int = 0; i < this._numFiles; i++)
         {
            newInstance = this._gameProgressFactory.GetNewInstance();
            this.SetGameProgress(i,newInstance,false,false);
            newInstance.isEmpty = true;
         }
         this._isEmpty = true;
      }
      
      public function Encode() : String
      {
         var gp:GameProgress = null;
         var savedString:String = null;
         var saveCode:String = "";
         saveCode += this._gamePrefs.Encode() + SEPARATOR;
         for(var i:int = 0; i < this._numFiles; i++)
         {
            gp = this._gameProgress[i];
            savedString = gp.isEmpty ? EMPTY_FILE : gp.Encode();
            if(i < this._numFiles - 1)
            {
               saveCode += savedString + SEPARATOR;
            }
            else
            {
               saveCode += savedString;
            }
         }
         this._lastEncoded = saveCode;
         return saveCode;
      }
      
      public function SaveToExternalAPI(placeCurrent:Boolean = true) : void
      {
         var saveCode:String = null;
         if(ExternalAPIManager.getSavedFileAPI().loggedIn)
         {
            if(placeCurrent)
            {
               this.SetGameProgress(this.crntGameProgress.id,this.crntGameProgress,false,true);
            }
            saveCode = this.Encode();
            ExternalAPIManager.getSavedFileAPI().SaveData(saveCode,null);
         }
         else if(!this.gamePrefs.haveASaveFileOnPremiumAPI)
         {
            if(placeCurrent)
            {
               this.SetCurrentAndSave();
            }
            else
            {
               this.SaveToSharedObject();
            }
         }
         else if(placeCurrent)
         {
            this.SetGameProgress(this.crntGameProgress.id,this.crntGameProgress,false);
         }
      }
      
      public function DestroyGameProgress(gp:GameProgress) : void
      {
         if(gp == null)
         {
            return;
         }
         gp.Destroy();
      }
      
      public function get main() : MainGame
      {
         return this._main;
      }
      
      public function LoadFromExternString(s:String) : void
      {
         if(s == null || s == "" || s == "null")
         {
            this._isEmpty = true;
            this.Clear();
         }
         else
         {
            this._isEmpty = false;
            this.Decode(s);
         }
      }
      
      public function SelectNewGameProgress(id:int) : void
      {
         this.DestroyGameProgress(this._crntGameProgress);
         this._crntGameProgress = this._gameProgressFactory.GetNewInstance();
         this._crntGameProgress.id = id;
         this._crntGameProgress.isEmpty = false;
      }
      
      public function get isDirty() : Boolean
      {
         return true;
      }
      
      public function get isEmpty() : Boolean
      {
         return this._isEmpty;
      }
      
      public function get crntGameProgress() : GameProgress
      {
         return this._crntGameProgress;
      }
      
      public function Destroy() : void
      {
         this.Clear();
         this._sharedObject.clear();
      }
      
      public function get gamePrefs() : GamePrefs
      {
         return this._gamePrefs;
      }
      
      public function LoadFromSaveAPI() : void
      {
         this.Destroy();
         FileManager.instance.gamePrefs.haveASaveFileOnPremiumAPI = true;
         this.SaveToSharedObject();
         this.LoadFromExternString(ExternalAPIManager.getSavedFileAPI().savedData);
         this._main.Reset();
      }
      
      public function TransferSaveFileToExternalAPI(transferDone:Callback = null) : void
      {
         this._transferDoneCallback = transferDone;
         ExternalAPIManager.getSavedFileAPI().SaveData(this.Encode(),new Callback(this.onTransferDone,this,null));
      }
      
      public function SelectGameProgress(gp:GameProgress) : void
      {
         this.DestroyGameProgress(this._crntGameProgress);
         gp.isEmpty = false;
         this._crntGameProgress = this.CloneGameProgress(gp);
      }
   }
}

