package com.lachhhEngine.io.externalAPI.dataSharingAPI.queries
{
   import com.lachhhEngine.io.Callback;
   import flash.utils.getQualifiedClassName;
   
   public class MetaSharedDataQuery
   {
      
      public static const STATE_NULL:int = -1;
      
      public static const STATE_IDLE:int = 0;
      
      public static const STATE_PENDING:int = 1;
      
      public static const STATE_SUCCEED:int = 2;
      
      public static const STATE_ERROR:int = 3;
      
      private var _timeOut:int;
      
      private var _success:Callback;
      
      private var _additionnalSuccess:Array = new Array();
      
      private var _resultData:Array;
      
      private var _additionnalError:Array = new Array();
      
      private var _state:int = -1;
      
      private var _errorCallback:Callback;
      
      private var _rawData:*;
      
      private var _errorMsg:Error;
      
      private var _debugName:String;
      
      public function MetaSharedDataQuery(timeOut:int = -1, success:Callback = null, error:Callback = null, debugName:String = "")
      {
         super();
         this._success = success;
         this._errorCallback = error;
         debugName = this._debugName;
         this._state = STATE_IDLE;
         this._timeOut = timeOut;
      }
      
      public function get timeOut() : int
      {
         return this._timeOut;
      }
      
      public function get success() : Callback
      {
         return this._success;
      }
      
      public function set timeOut(timeOut:int) : void
      {
         this._timeOut = timeOut;
      }
      
      public function TriggerSuccess(data:Array) : void
      {
         var c:Callback = null;
         if(!this.isPending)
         {
            return;
         }
         this._state = STATE_SUCCEED;
         this._resultData = data;
         if(this._success)
         {
            this._success.DoCallback();
         }
         for(var i:int = 0; i < this._additionnalSuccess.length; i++)
         {
            c = this._additionnalSuccess[i];
            c.DoCallback();
         }
      }
      
      public function set success(success:Callback) : void
      {
         this._success = success;
      }
      
      public function get error() : Callback
      {
         return this._errorCallback;
      }
      
      public function TriggerError(error:Error) : void
      {
         var c:Callback = null;
         if(!this.isPending)
         {
            return;
         }
         this.SetError(error);
         this._state = STATE_ERROR;
         if(this._errorCallback != null)
         {
            this._errorCallback.DoCallback();
         }
         for(var i:int = 0; i < this._additionnalError.length; i++)
         {
            c = this._additionnalError[i];
            c.DoCallback();
         }
      }
      
      public function get debugName() : String
      {
         return this._debugName;
      }
      
      public function set error(error:Callback) : void
      {
         this._errorCallback = error;
      }
      
      public function get errorMsg() : Error
      {
         return this._errorMsg;
      }
      
      public function Cancel() : void
      {
         this.TriggerError(new Error("Query Canceled"));
      }
      
      public function get isIdle() : Boolean
      {
         return this._state == STATE_IDLE;
      }
      
      public function TriggerPending() : void
      {
         if(this._state == STATE_PENDING)
         {
            return;
         }
         this._state = STATE_PENDING;
      }
      
      public function get isError() : Boolean
      {
         return this._state == STATE_ERROR;
      }
      
      public function get isPending() : Boolean
      {
         return this._state == STATE_PENDING;
      }
      
      public function AddSuccessCallback(c:Callback) : void
      {
         if(c == null)
         {
            return;
         }
         this._additionnalSuccess.push(c);
      }
      
      public function set rawData(rawData:*) : void
      {
         this._rawData = rawData;
      }
      
      public function AddErrorCallback(c:Callback) : void
      {
         if(c == null)
         {
            return;
         }
         this._additionnalError.push(c);
      }
      
      public function SetError(errorMsg:Error) : void
      {
         this._state = STATE_ERROR;
         this._errorMsg = errorMsg;
      }
      
      public function get rawData() : *
      {
         return this._rawData;
      }
      
      public function get additionnalSuccess() : Array
      {
         return this._additionnalSuccess;
      }
      
      public function get resultData() : Array
      {
         return this._resultData;
      }
      
      public function get isSuccess() : Boolean
      {
         return this._state == STATE_SUCCEED;
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + " : " + this._debugName;
      }
      
      public function set debugName(debugName:String) : void
      {
         this._debugName = debugName;
      }
   }
}

