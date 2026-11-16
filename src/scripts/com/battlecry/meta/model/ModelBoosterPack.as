package com.battlecry.meta.model
{
   import com.battlecry.meta.MetaEquipement;
   
   public class ModelBoosterPack
   {
      
      public static const TYPE_PRIME:int = 1;
      
      public static const TYPE_EXPANSION1:int = 2;
      
      public static const TYPE_MYTHIC:int = 3;
      
      public static const TYPE_DAILY:int = 4;
      
      public static const TYPE_CRAFT:int = 5;
      
      private var _itemArray:Vector.<MetaEquipement>;
      
      private var _price:Number;
      
      private var _visualFrame:int;
      
      private var _nbRare:int;
      
      private var _nbCommun:int;
      
      private var _nbLegendary:int;
      
      private var _boosterType:int;
      
      private var _nbUncommun:int;
      
      private var _id:int;
      
      private var _boosterName:int;
      
      public function ModelBoosterPack(id:int, visualFrame:int, price:Number, nbLegendary:int, nbRare:int, nbUncommun:int, nbCommun:int, boosterType:int, boosterName:int, itemArray:Vector.<MetaEquipement>)
      {
         super();
         this._id = id;
         this._price = price;
         this._nbLegendary = nbLegendary;
         this._nbRare = nbRare;
         this._nbUncommun = nbUncommun;
         this._nbCommun = nbCommun;
         this._visualFrame = visualFrame;
         this._boosterType = boosterType;
         this._boosterName = boosterName;
         this._itemArray = itemArray;
      }
      
      public function get boosterType() : int
      {
         return this._boosterType;
      }
      
      public function set boosterName(boosterName:int) : void
      {
         this._boosterName = boosterName;
      }
      
      public function get itemArray() : Vector.<MetaEquipement>
      {
         return this._itemArray;
      }
      
      public function get price() : Number
      {
         return this._price;
      }
      
      public function set itemArray(itemArray:Vector.<MetaEquipement>) : void
      {
         this._itemArray = itemArray;
      }
      
      public function get visualFrame() : int
      {
         return this._visualFrame;
      }
      
      public function set price(price:Number) : void
      {
         this._price = price;
      }
      
      public function get nbUncommun() : int
      {
         return this._nbUncommun;
      }
      
      public function set visualFrame(visualFrame:int) : void
      {
         this._visualFrame = visualFrame;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set boosterType(boosterType:int) : void
      {
         this._boosterType = boosterType;
      }
      
      public function set nbUncommun(nbUncommun:int) : void
      {
         this._nbUncommun = nbUncommun;
      }
      
      public function set nbLegendary(nbLegendary:int) : void
      {
         this._nbLegendary = nbLegendary;
      }
      
      public function get nbLegendary() : int
      {
         return this._nbLegendary;
      }
      
      public function set nbRare(nbRare:int) : void
      {
         this._nbRare = nbRare;
      }
      
      public function Reset() : void
      {
      }
      
      public function set nbCommun(nbCommun:int) : void
      {
         this._nbCommun = nbCommun;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function get nbCommun() : int
      {
         return this._nbCommun;
      }
      
      public function get boosterName() : int
      {
         return this._boosterName;
      }
      
      public function get nbRare() : int
      {
         return this._nbRare;
      }
   }
}

