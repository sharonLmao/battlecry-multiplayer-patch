package com.lachhhEngine.io.encryption
{
   import com.lachhhEngine.games.screens.ScreenManager;
   
   public class SecureNumber
   {
      
      private var _value:Number;
      
      private var _random:Number;
      
      private var _n:Number;
      
      private var _locked:Boolean = true;
      
      public function SecureNumber(n:Number = 0)
      {
         super();
         this._random = Math.random() * 10000;
         this._n = n + this._random;
         this._value = n;
      }
      
      public function set value(n:Number) : void
      {
         if(isNaN(n))
         {
            return;
         }
         this.Test(this._value);
         this._random = Math.random() * 10000;
         this._n = n + this._random;
         this._value = n;
      }
      
      public function get locked() : Boolean
      {
         return this._locked;
      }
      
      public function get value() : Number
      {
         this.Test(this._value);
         return this._value;
      }
      
      public function set locked(locked:Boolean) : void
      {
         this._locked = locked;
      }
      
      public function Test(n:Number) : void
      {
         if(this.locked && this._n != n + this._random)
         {
            ScreenManager.instance.ShowCheatScreen();
            throw new Error("Cheat Detected !");
         }
      }
   }
}

