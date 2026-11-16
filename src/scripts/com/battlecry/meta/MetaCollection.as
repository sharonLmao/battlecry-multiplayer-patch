package com.battlecry.meta
{
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelEquipementEnum;
   
   public class MetaCollection
   {
      
      private const SEPARATOR:String = "[C]";
      
      private var _collectionInventory:Vector.<MetaEquipement>;
      
      public function MetaCollection()
      {
         super();
         this._collectionInventory = new Vector.<MetaEquipement>();
         for(var i:int = 0; i < ModelEquipementEnum.ALL.length; i++)
         {
            this._collectionInventory.push(new MetaEquipement(0,ModelEquipementEnum.ALL[i]));
         }
      }
      
      public function AddItemToCollection(m:MetaEquipement) : void
      {
         for(var i:int = 0; i < this._collectionInventory.length; i++)
         {
            if(m.modelEquipement.id == this._collectionInventory[i].modelEquipement.id)
            {
               this._collectionInventory[i].quantity += m.quantity;
               return;
            }
         }
      }
      
      public function Decode(s:String) : void
      {
         var m1:MetaEquipement = null;
         var params:Array = s.split(this.SEPARATOR);
         var length:int = int(params.shift());
         for(var i:int = 0; i < length; i++)
         {
            m1 = new MetaEquipement(0,ModelEquipementEnum.EQUIPEMENT_NULL);
            m1.Decode(params.shift());
            this._collectionInventory[i] = m1;
         }
      }
      
      public function GetNumUnlocked() : Number
      {
         var numUnlocked:Number = 0;
         for(var i:int = 0; i < this._collectionInventory.length; i++)
         {
            if(this._collectionInventory[i].quantity > 0)
            {
               numUnlocked++;
            }
         }
         return numUnlocked;
      }
      
      public function GetCollectionMetaEquipment(m:ModelEquipement) : MetaEquipement
      {
         for(var i:int = 0; i < this._collectionInventory.length; i++)
         {
            if(m.id == this._collectionInventory[i].modelEquipement.id)
            {
               return this._collectionInventory[i];
            }
         }
         return null;
      }
      
      public function Encode() : String
      {
         var returnValue:String = "";
         returnValue += this._collectionInventory.length + this.SEPARATOR;
         for(var i:int = 0; i < this._collectionInventory.length; i++)
         {
            returnValue += this._collectionInventory[i].Encode() + this.SEPARATOR;
         }
         return returnValue;
      }
      
      public function set collectionInventory(collectionInventory:Vector.<MetaEquipement>) : void
      {
         this._collectionInventory = collectionInventory;
      }
      
      public function get collectionInventory() : Vector.<MetaEquipement>
      {
         return this._collectionInventory;
      }
   }
}

