package com.battlecry.meta
{
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelEquipementEnum;
   
   public class MetaEquipement
   {
      
      public static var EMPTY_EQUIPEMENT:MetaEquipement = new MetaEquipement(0,ModelEquipementEnum.EQUIPEMENT_NULL);
      
      private const SEPARATOR:String = "[M]";
      
      private var _modelEquipement:ModelEquipement;
      
      private var _quantity:int;
      
      public function MetaEquipement(quantity:int, modelEquipement:ModelEquipement)
      {
         super();
         this._quantity = quantity;
         this._modelEquipement = modelEquipement;
      }
      
      public function isBow() : Boolean
      {
         return this._modelEquipement.genre == ModelEquipement.GENRE_BOW;
      }
      
      public function isPistol() : Boolean
      {
         return this._modelEquipement.genre == ModelEquipement.GENRE_PISTOL;
      }
      
      public function isUndead() : Boolean
      {
         return this._modelEquipement == ModelEquipementEnum.CREATURE_UNDEAD;
      }
      
      public function isBoar() : Boolean
      {
         return this._modelEquipement.genre == ModelEquipement.GENRE_SPECIAL_BOAR;
      }
      
      public function get quantity() : int
      {
         return this._quantity;
      }
      
      public function IsAttackCastWeapon() : Boolean
      {
         return this._modelEquipement.id == ModelEquipementEnum.WEAPON_AZARATIUSAXE.id || this._modelEquipement.id == ModelEquipementEnum.WEAPON_IMRAILHMACE.id || this._modelEquipement.id == ModelEquipementEnum.WEAPON_ZAMAROTHSWORD.id;
      }
      
      public function Decode(s:String) : void
      {
         var params:Array = s.split(this.SEPARATOR);
         this._quantity = parseInt(params.shift());
         this._modelEquipement = ModelEquipementEnum.GetFromId(params.shift());
      }
      
      public function isSpear() : Boolean
      {
         return this._modelEquipement.genre == ModelEquipement.GENRE_SPEAR;
      }
      
      public function isArtillery6Case() : Boolean
      {
         return this._modelEquipement.genre == ModelEquipement.GENRE_ARTILLERY_6CASE;
      }
      
      public function isHorse() : Boolean
      {
         return this._modelEquipement.genre == ModelEquipement.GENRE_SPECIAL_HORSE;
      }
      
      public function isArtillery9Case() : Boolean
      {
         return this._modelEquipement.genre == ModelEquipement.GENRE_ARTILLERY_9CASE;
      }
      
      public function isStaff() : Boolean
      {
         return this._modelEquipement.genre == ModelEquipement.GENRE_STAFF;
      }
      
      public function is2Hand() : Boolean
      {
         return this._modelEquipement.genre == ModelEquipement.GENRE_2HAND;
      }
      
      public function get modelEquipement() : ModelEquipement
      {
         return this._modelEquipement;
      }
      
      public function is1Hand() : Boolean
      {
         return this._modelEquipement.genre == ModelEquipement.GENRE_1HAND;
      }
      
      public function isArtillery3Case() : Boolean
      {
         return this._modelEquipement.genre == ModelEquipement.GENRE_ARTILLERY_3CASE;
      }
      
      public function set quantity(quantity:int) : void
      {
         this._quantity = quantity;
      }
      
      public function copy(MetaEquipement:MetaEquipement) : void
      {
         this._quantity = MetaEquipement.quantity;
         this._modelEquipement = ModelEquipementEnum.GetFromId(MetaEquipement.modelEquipement.id);
      }
      
      public function isFlag() : Boolean
      {
         return this._modelEquipement.id == ModelEquipementEnum.WEAPON_SWORDSMAN_FLAG.id || this._modelEquipement.id == ModelEquipementEnum.WEAPON_BARBARIAN_FLAG.id || this._modelEquipement.id == ModelEquipementEnum.WEAPON_PIKEMAN_FLAG.id || this._modelEquipement.id == ModelEquipementEnum.WEAPON_SAPPER_FLAG.id || this._modelEquipement.id == ModelEquipementEnum.WEAPON_FLAME_FLAG.id || this._modelEquipement.id == ModelEquipementEnum.WEAPON_FROST_FLAG.id || this._modelEquipement.id == ModelEquipementEnum.WEAPON_VIPER_FLAG.id || this._modelEquipement.id == ModelEquipementEnum.WEAPON_BOLT_FLAG.id || this._modelEquipement.id == ModelEquipementEnum.WEAPON_CULT_FLAG.id || this._modelEquipement.id == ModelEquipementEnum.WEAPON_CLERIC_FLAG.id || this._modelEquipement.id == ModelEquipementEnum.WEAPON_TOWER_FLAG.id;
      }
      
      public function set modelEquipement(modelEquipement:ModelEquipement) : void
      {
         this._modelEquipement = modelEquipement;
      }
      
      public function isMusket() : Boolean
      {
         return this._modelEquipement.genre == ModelEquipement.GENRE_MUSKET;
      }
      
      public function isArtillery() : Boolean
      {
         return this._modelEquipement.genre == ModelEquipement.GENRE_ARTILLERY_3CASE || this._modelEquipement.genre == ModelEquipement.GENRE_ARTILLERY_6CASE || this._modelEquipement.genre == ModelEquipement.GENRE_ARTILLERY_9CASE;
      }
      
      public function Encode() : String
      {
         return this._quantity + this.SEPARATOR + this._modelEquipement.id;
      }
   }
}

