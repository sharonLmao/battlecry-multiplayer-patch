package com.battlecry.meta
{
   import com.battlecry.battle.GridPos;
   import com.battlecry.meta.model.ModelAnim;
   import com.battlecry.meta.model.ModelAnimEnum;
   import com.battlecry.meta.model.ModelBitMapAnimation;
   import com.battlecry.meta.model.ModelBitmapAnimationsGroup;
   import com.battlecry.meta.model.ModelEquipementEnum;
   
   public class BC_MetaUnit
   {
      
      public static var EMPTY_UNIT:BC_MetaUnit = new BC_MetaUnit(-1);
      
      private var _posInSquad:GridPos;
      
      private var _id:int;
      
      private const SEPARATOR:String = "[U]";
      
      private var _speed:MetaSquadSpeed;
      
      private var _unitName:String;
      
      private var _maxQuantity:int;
      
      private var _modelAnim:ModelAnim;
      
      private var _metaArmy:BC_MetaArmy;
      
      private var _quantity:int;
      
      private var _modelBitmapAnimationGroup:ModelBitmapAnimationsGroup;
      
      private var _playerEquipement:MetaPlayerEquipement;
      
      public function BC_MetaUnit(id:int)
      {
         super();
         this._id = id;
         this._metaArmy = this.metaArmy;
         this._modelAnim = ModelAnimEnum.ANIMATION_NULL;
         this._unitName = "Unit";
         this._quantity = 0;
         this._maxQuantity = this.quantity;
         this._posInSquad = new GridPos(0,0);
         this._speed = MetaSquadSpeedEnum.SPEED_HOLD;
         this._playerEquipement = new MetaPlayerEquipement(new MetaEquipement(-1,ModelEquipementEnum.EQUIPEMENT_NULL),new MetaEquipement(-1,ModelEquipementEnum.EQUIPEMENT_NULL),new MetaEquipement(-1,ModelEquipementEnum.EQUIPEMENT_NULL),new MetaEquipement(-1,ModelEquipementEnum.EQUIPEMENT_NULL),new MetaEquipement(-1,ModelEquipementEnum.EQUIPEMENT_NULL));
      }
      
      public function set modelAnim(modelAnim:ModelAnim) : void
      {
         this._modelAnim = modelAnim;
      }
      
      public function set metaArmy(metaArmy:BC_MetaArmy) : void
      {
         this._metaArmy = metaArmy;
      }
      
      public function ClearBitmapData() : void
      {
         var bma:ModelBitMapAnimation = null;
         var j:int = 0;
         if(this._modelBitmapAnimationGroup == null)
         {
            return;
         }
         for(var i:int = int(this._modelBitmapAnimationGroup.bitmapAnimationGroup.length - 1); i >= 0; i--)
         {
            bma = this._modelBitmapAnimationGroup.bitmapAnimationGroup[i];
            for(j = int(bma.bitMapDataArray.length - 1); j >= 0; j--)
            {
               bma.bitMapDataArray[j].bmd.dispose();
               bma.bitMapDataArray[j].rect = null;
               bma.bitMapDataArray.splice(j,1);
            }
            this._modelBitmapAnimationGroup.bitmapAnimationGroup.splice(i,1);
         }
         this._modelBitmapAnimationGroup = null;
      }
      
      public function IsEquipped(metaEquipement:MetaEquipement) : Boolean
      {
         if(this._playerEquipement.creatureEquip.modelEquipement.id == metaEquipement.modelEquipement.id || this._playerEquipement.weaponEquip.modelEquipement.id == metaEquipement.modelEquipement.id || this._playerEquipement.shieldEquip.modelEquipement.id == metaEquipement.modelEquipement.id || this._playerEquipement.armorEquip.modelEquipement.id == metaEquipement.modelEquipement.id || this._playerEquipement.specialEquip.modelEquipement.id == metaEquipement.modelEquipement.id)
         {
            return true;
         }
         return false;
      }
      
      public function get quantity() : int
      {
         return this._quantity;
      }
      
      public function Compare(unitToCompare:BC_MetaUnit) : Boolean
      {
         if(unitToCompare.playerEquipement.creatureEquip.modelEquipement.id == this._playerEquipement.creatureEquip.modelEquipement.id && unitToCompare.playerEquipement.weaponEquip.modelEquipement.id == this._playerEquipement.weaponEquip.modelEquipement.id && unitToCompare.playerEquipement.shieldEquip.modelEquipement.id == this._playerEquipement.shieldEquip.modelEquipement.id && unitToCompare.playerEquipement.armorEquip.modelEquipement.id == this._playerEquipement.armorEquip.modelEquipement.id && unitToCompare.playerEquipement.specialEquip.modelEquipement.id == this._playerEquipement.specialEquip.modelEquipement.id)
         {
            return true;
         }
         return false;
      }
      
      public function get maxQuantity() : int
      {
         return this._maxQuantity;
      }
      
      public function set posInSquad(posInSquad:GridPos) : void
      {
         this._posInSquad = posInSquad;
      }
      
      public function Copy(metaUnit:BC_MetaUnit) : void
      {
         this._id = metaUnit.id;
         this._metaArmy = metaUnit.metaArmy;
         this._posInSquad.x = metaUnit.posInSquad.x;
         this._posInSquad.y = metaUnit.posInSquad.y;
         this._modelAnim = ModelAnimEnum.GetFromId(metaUnit.modelAnim.id);
         this._speed = metaUnit.speed;
         this._unitName = metaUnit.unitName;
         this._quantity = metaUnit.quantity;
         this._maxQuantity = metaUnit.maxQuantity;
         this._playerEquipement.Copy(metaUnit.playerEquipement);
         if(metaUnit.modelBitmapAnimationGroup)
         {
            this._modelBitmapAnimationGroup = new ModelBitmapAnimationsGroup();
            this._modelBitmapAnimationGroup.Copy(metaUnit.modelBitmapAnimationGroup);
         }
         else
         {
            this._modelBitmapAnimationGroup = null;
         }
      }
      
      public function get speed() : MetaSquadSpeed
      {
         return this._speed;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function ChooseAnimSet() : void
      {
         if(this._playerEquipement.creatureEquip.isArtillery())
         {
            if(this._playerEquipement.creatureEquip.modelEquipement == ModelEquipementEnum.CREATURE_BALISTA)
            {
               this._modelAnim = ModelAnimEnum.ANIM_BALISTA;
            }
            if(this._playerEquipement.creatureEquip.modelEquipement == ModelEquipementEnum.CREATURE_CATAPULT)
            {
               this._modelAnim = ModelAnimEnum.ANIM_CATAPULT;
            }
            if(this._playerEquipement.creatureEquip.modelEquipement == ModelEquipementEnum.CREATURE_CANNON)
            {
               this._modelAnim = ModelAnimEnum.ANIM_CANNON;
            }
            if(this._playerEquipement.creatureEquip.modelEquipement == ModelEquipementEnum.CREATURE_UNDEAD_CATAPULT)
            {
               this._modelAnim = ModelAnimEnum.ANIM_UNDEADCATAPULT;
            }
            if(this._playerEquipement.creatureEquip.modelEquipement == ModelEquipementEnum.CREATURE_STEAM_CHARIOT)
            {
               this._modelAnim = ModelAnimEnum.ANIM_STEAMCHARIOT;
            }
            if(this._playerEquipement.creatureEquip.modelEquipement == ModelEquipementEnum.CREATURE_PLAGUE_CANON)
            {
               this._modelAnim = ModelAnimEnum.ANIM_PLAGUECANNON;
            }
            if(this._playerEquipement.creatureEquip.modelEquipement == ModelEquipementEnum.CREATURE_GIANT_FLAMER)
            {
               this._modelAnim = ModelAnimEnum.ANIM_GIANTFLAMER;
            }
            if(this._playerEquipement.creatureEquip.modelEquipement == ModelEquipementEnum.CREATURE_STEAM_BEHEMOT)
            {
               this._modelAnim = ModelAnimEnum.ANIM_STEAMBEHEMOTH;
            }
            if(this._playerEquipement.creatureEquip.modelEquipement.id == ModelEquipementEnum.CREATURE_MACHINE_CATAPULT.id)
            {
               this._modelAnim = ModelAnimEnum.ANIM_AUTOCATAPULT;
            }
            if(this._playerEquipement.creatureEquip.modelEquipement.id == ModelEquipementEnum.CREATURE_RUSTY_CANON.id)
            {
               this._modelAnim = ModelAnimEnum.ANIM_RUSTYCANNON;
            }
         }
         else if(this._playerEquipement.specialEquip.isHorse())
         {
            if(this._playerEquipement.weaponEquip.is1Hand() || this._id == -3 || this._id != -1 && this._id != -2 && this._playerEquipement.weaponEquip.quantity == -1)
            {
               this._modelAnim = ModelAnimEnum.ANIM_1HANDEDWEAPON_HORSE;
            }
            if(this._playerEquipement.weaponEquip.is2Hand())
            {
               this._modelAnim = ModelAnimEnum.ANIM_2HANDEDWEAPON_HORSE;
            }
            if(this._playerEquipement.weaponEquip.isSpear())
            {
               this._modelAnim = ModelAnimEnum.ANIM_SPEAR_HORSE;
            }
            if(this._playerEquipement.weaponEquip.isStaff())
            {
               this._modelAnim = ModelAnimEnum.ANIM_STAFF_HORSE;
            }
            if(this._playerEquipement.weaponEquip.isPistol())
            {
               this._modelAnim = ModelAnimEnum.ANIM_PISTOL_HORSE;
            }
            if(this._playerEquipement.weaponEquip.isBow())
            {
               this._modelAnim = ModelAnimEnum.ANIM_BOW_HORSE;
            }
            if(this._playerEquipement.weaponEquip.isMusket())
            {
               this._modelAnim = ModelAnimEnum.ANIM_MUSKET_HORSE;
            }
         }
         else if(this._playerEquipement.specialEquip.isBoar())
         {
            if(this._playerEquipement.weaponEquip.is1Hand() || this._id == -3 || this._id != -1 && this._id != -2 && this._playerEquipement.weaponEquip.quantity == -1)
            {
               this._modelAnim = ModelAnimEnum.ANIM_1HANDEDWEAPON_BOAR;
            }
            if(this._playerEquipement.weaponEquip.is2Hand())
            {
               this._modelAnim = ModelAnimEnum.ANIM_2HANDEDWEAPON_BOAR;
            }
            if(this._playerEquipement.weaponEquip.isSpear())
            {
               this._modelAnim = ModelAnimEnum.ANIM_SPEAR_BOAR;
            }
            if(this._playerEquipement.weaponEquip.isStaff())
            {
               this._modelAnim = ModelAnimEnum.ANIM_STAFF_BOAR;
            }
            if(this._playerEquipement.weaponEquip.isPistol())
            {
               this._modelAnim = ModelAnimEnum.ANIM_PISTOL_BOAR;
            }
            if(this._playerEquipement.weaponEquip.isBow())
            {
               this._modelAnim = ModelAnimEnum.ANIM_BOW_BOAR;
            }
            if(this._playerEquipement.weaponEquip.isMusket())
            {
               this._modelAnim = ModelAnimEnum.ANIM_MUSKET_BOAR;
            }
         }
         else
         {
            if(this._playerEquipement.weaponEquip.is1Hand() || this._id == -3 || this._id != -1 && this._id != -2 && this._playerEquipement.weaponEquip.quantity == -1)
            {
               this._modelAnim = ModelAnimEnum.ANIM_1HANDEDWEAPON;
            }
            if(this._playerEquipement.weaponEquip.is2Hand())
            {
               this._modelAnim = ModelAnimEnum.ANIM_2HANDEDWEAPON;
            }
            if(this._playerEquipement.weaponEquip.isSpear())
            {
               this._modelAnim = ModelAnimEnum.ANIM_SPEAR;
            }
            if(this._playerEquipement.weaponEquip.isStaff())
            {
               this._modelAnim = ModelAnimEnum.ANIM_STAFF;
            }
            if(this._playerEquipement.weaponEquip.isPistol())
            {
               this._modelAnim = ModelAnimEnum.ANIM_PISTOL;
            }
            if(this._playerEquipement.weaponEquip.isBow())
            {
               this._modelAnim = ModelAnimEnum.ANIM_BOW;
            }
            if(this._playerEquipement.weaponEquip.isMusket())
            {
               this._modelAnim = ModelAnimEnum.ANIM_MUSKET;
            }
         }
         if(this._modelAnim == ModelAnimEnum.ANIMATION_NULL)
         {
         }
      }
      
      public function Decode(s:String, creatureInventory:Vector.<MetaEquipement>, itemInventory:Vector.<MetaEquipement>) : void
      {
         var params:Array = s.split(this.SEPARATOR);
         this._id = params.shift();
         this._posInSquad.Decode(params.shift());
         this._modelAnim = ModelAnimEnum.GetFromId(params.shift());
         this._speed = MetaSquadSpeedEnum.GetFromId(params.shift());
         this._unitName = params.shift();
         this._quantity = params.shift();
         this._maxQuantity = params.shift();
         this._playerEquipement.Decode(params.shift());
         for(var i:int = 0; i < creatureInventory.length; i++)
         {
            if(this._playerEquipement.creatureEquip.modelEquipement.id == creatureInventory[i].modelEquipement.id)
            {
               this._playerEquipement.creatureEquip = creatureInventory[i];
            }
         }
         for(i = 0; i < itemInventory.length; i++)
         {
            if(this._playerEquipement.weaponEquip.modelEquipement.id == itemInventory[i].modelEquipement.id)
            {
               this._playerEquipement.weaponEquip = itemInventory[i];
            }
            if(this._playerEquipement.shieldEquip.modelEquipement.id == itemInventory[i].modelEquipement.id)
            {
               this._playerEquipement.shieldEquip = itemInventory[i];
            }
            if(this._playerEquipement.armorEquip.modelEquipement.id == itemInventory[i].modelEquipement.id)
            {
               this._playerEquipement.armorEquip = itemInventory[i];
            }
            if(this._playerEquipement.specialEquip.modelEquipement.id == itemInventory[i].modelEquipement.id)
            {
               this._playerEquipement.specialEquip = itemInventory[i];
            }
         }
      }
      
      public function set unitName(unitName:String) : void
      {
         this._unitName = unitName;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get playerEquipement() : MetaPlayerEquipement
      {
         return this._playerEquipement;
      }
      
      public function get metaArmy() : BC_MetaArmy
      {
         return this._metaArmy;
      }
      
      public function set quantity(quantity:int) : void
      {
         this._quantity = quantity;
      }
      
      public function get modelAnim() : ModelAnim
      {
         return this._modelAnim;
      }
      
      public function get modelBitmapAnimationGroup() : ModelBitmapAnimationsGroup
      {
         return this._modelBitmapAnimationGroup;
      }
      
      public function set maxQuantity(maxQuantity:int) : void
      {
         this._maxQuantity = maxQuantity;
      }
      
      public function get unitName() : String
      {
         return this._unitName;
      }
      
      public function get posInSquad() : GridPos
      {
         return this._posInSquad;
      }
      
      public function set speed(speed:MetaSquadSpeed) : void
      {
         this._speed = speed;
      }
      
      public function set modelBitmapAnimationGroup(modelBitmapAnimationGroup:ModelBitmapAnimationsGroup) : void
      {
         this._modelBitmapAnimationGroup = modelBitmapAnimationGroup;
      }
      
      public function set playerEquipement(playerEquipement:MetaPlayerEquipement) : void
      {
         this._playerEquipement = playerEquipement;
      }
      
      public function Encode() : String
      {
         return this._id + this.SEPARATOR + this._posInSquad.Encode() + this.SEPARATOR + this._modelAnim.id + this.SEPARATOR + this._speed.id + this.SEPARATOR + this._unitName + this.SEPARATOR + this._quantity + this.SEPARATOR + this._maxQuantity + this.SEPARATOR + this._playerEquipement.Encode();
      }
   }
}

