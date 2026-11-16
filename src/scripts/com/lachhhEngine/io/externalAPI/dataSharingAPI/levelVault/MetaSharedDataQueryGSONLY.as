package com.lachhhEngine.io.externalAPI.dataSharingAPI.levelVault
{
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.gamerSafe.GamerSafe;
   
   public class MetaSharedDataQueryGSONLY
   {
      
      public static const STATE_NULL:int = -1;
      
      public static const STATE_IDLE:int = 0;
      
      public static const STATE_PENDING:int = 1;
      
      public static const STATE_SUCCEED:int = 2;
      
      public static const STATE_ERROR:int = 3;
      
      private var _success:Callback;
      
      private var _error:Callback;
      
      private var _state:int = -1;
      
      private var _errorMsg:String;
      
      private var _debugName:String;
      
      public function MetaSharedDataQueryGSONLY(success:Callback = null, error:Callback = null, debugName:String = "")
      {
         super();
         this._success = success;
         this._error = error;
         debugName = this._debugName;
         this._state = STATE_IDLE;
      }
      
      public function get errorMsg() : String
      {
         return this._errorMsg;
      }
      
      private function onError(error:Error) : void
      {
         this.SetError(error.message);
      }
      
      public function SetError(errorMsg:String) : void
      {
         this._state = STATE_ERROR;
         this._errorMsg = errorMsg;
         if(this._error != null)
         {
            this._error.DoCallback();
         }
      }
      
      public function set errorMsg(errorMsg:String) : void
      {
         this._errorMsg = errorMsg;
      }
      
      private function ConvertArray(values:Array) : Array
      {
         var data:LevelVaultSharedData = null;
         var result:Array = new Array();
         for(var i:int = 0; i < values.length; i++)
         {
            data = new LevelVaultSharedData();
            data.Init(values[i]);
            result.push(data);
         }
         return result;
      }
      
      public function LaunchCall() : void
      {
         if(this._state != STATE_IDLE)
         {
            return;
         }
         this._state = STATE_PENDING;
         GamerSafe.api.levelVaultRegisterCallback(this.onSuccess);
         GamerSafe.api.levelVaultRegisterErrorCallback(this.onError);
      }
      
      private function onSuccess(params:*) : void
      {
         this._state = STATE_SUCCEED;
         if(this._success != null)
         {
            if(params is Array)
            {
               params = this.ConvertArray(params);
               this._success.DoCallbackWithParams([params]);
            }
            else
            {
               this._success.DoCallback();
            }
         }
      }
   }
}

