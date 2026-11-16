package com.lachhhEngine.io.encryption
{
   import com.hurlant.crypto.Crypto;
   import com.hurlant.crypto.prng.Random;
   import com.hurlant.crypto.symmetric.ICipher;
   import com.lachhhEngine.io.ISaveObject;
   import flash.net.SharedObject;
   import flash.utils.ByteArray;
   
   public class MetaDataEncryption
   {
      
      private var _sharedObject:SharedObject;
      
      private var _dataName:String;
      
      private var _saveObject:ISaveObject;
      
      public function MetaDataEncryption(saveObject:ISaveObject, sharedObject:SharedObject, dataName:String)
      {
         super();
         this._saveObject = saveObject;
         this._sharedObject = sharedObject;
         this._dataName = dataName;
      }
      
      public static function GetStringFromByteArray(dataToLoad:ByteArray) : String
      {
         var key:ByteArray = new ByteArray();
         dataToLoad.position = 0;
         dataToLoad.readBytes(key,0,16);
         var encryptedBytes:ByteArray = new ByteArray();
         dataToLoad.readBytes(encryptedBytes);
         var aes:ICipher = Crypto.getCipher("aes-ecb",key,Crypto.getPad("pkcs5"));
         aes.decrypt(encryptedBytes);
         encryptedBytes.position = 0;
         return encryptedBytes.readUTF();
      }
      
      public static function GetEncryptedByteArray(code:String) : ByteArray
      {
         var key:ByteArray = new ByteArray();
         var random:Random = new Random();
         random.nextBytes(key,16);
         var cleartextBytes:ByteArray = new ByteArray();
         cleartextBytes.writeUTF(code);
         var aes:ICipher = Crypto.getCipher("aes-ecb",key,Crypto.getPad("pkcs5"));
         aes.encrypt(cleartextBytes);
         var dataToStore:ByteArray = new ByteArray();
         dataToStore.writeBytes(key);
         dataToStore.writeBytes(cleartextBytes);
         return dataToStore;
      }
      
      public function EncryptedSave() : void
      {
         if(!this._saveObject.isDirty)
         {
            return;
         }
         this._saveObject.isDirty = false;
         this._sharedObject.data[this._dataName] = GetEncryptedByteArray(this._saveObject.Encode());
         this._sharedObject.flush();
      }
      
      public function LoadWithoutEncrypt() : String
      {
         return this._sharedObject.data[this._dataName];
      }
      
      public function GetStringData() : String
      {
         return this._saveObject.Encode();
      }
      
      public function EncryptedLoad() : String
      {
         if(this._sharedObject.data[this._dataName] == "" || this._sharedObject.data[this._dataName] == null)
         {
            return "";
         }
         var obj:Object = this._sharedObject.data[this._dataName];
         var dataToLoad:ByteArray = this._sharedObject.data[this._dataName] as ByteArray;
         if(!dataToLoad)
         {
            return "";
         }
         return GetStringFromByteArray(dataToLoad);
      }
      
      public function SaveWithoutEncrypt() : void
      {
         this._sharedObject.data[this._dataName] = this._saveObject.Encode();
         this._sharedObject.flush();
      }
      
      public function SetSaveObject(s:ISaveObject) : void
      {
         this._saveObject = s;
      }
   }
}

