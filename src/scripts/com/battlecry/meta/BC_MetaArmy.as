package com.battlecry.meta
{
   import com.battlecry.battle.GridPos;
   import com.battlecry.multilingual.BC_TextFactory;
   
   public class BC_MetaArmy
   {
      
      private var _multiPlayerLost:int;
      
      private var _multiPlayerRank:int;
      
      private var _itemInventory:Vector.<MetaEquipement>;
      
      private var _multiPlayerDraw:int;
      
      private var _multiPlayerWin:int;
      
      private var _multiPlayerCurrentRankCount:int;
      
      private var _armyName:String;
      
      private var _unitInventory:Vector.<BC_MetaUnit>;
      
      private var _metaSquad1:BC_MetaSquad;
      
      private var _metaSquad3:BC_MetaSquad;
      
      private var _metaSquad5:BC_MetaSquad;
      
      private var _metaSquad2:BC_MetaSquad;
      
      private const SEPARATOR:String = "[A]";
      
      private var _totalPoint:int;
      
      private var _metaSquad4:BC_MetaSquad;
      
      private var _multiPlayerActivated:int;
      
      private var _creatureInventory:Vector.<MetaEquipement>;
      
      private var _teamId:int;
      
      public function BC_MetaArmy(teamId:int)
      {
         super();
         this._armyName = "";
         this._teamId = teamId;
         if(this._teamId == 5)
         {
            this._totalPoint = 500;
         }
         else
         {
            this._totalPoint = 1000;
         }
         this._multiPlayerActivated = 0;
         this._multiPlayerWin = 0;
         this._multiPlayerLost = 0;
         this._multiPlayerDraw = 0;
         this._multiPlayerRank = 1;
         this._multiPlayerCurrentRankCount = 0;
         this._metaSquad1 = new BC_MetaSquad(1,this,12);
         this._metaSquad2 = new BC_MetaSquad(2,this,9);
         this._metaSquad3 = new BC_MetaSquad(3,this,6);
         this._metaSquad4 = new BC_MetaSquad(4,this,3);
         this._metaSquad5 = new BC_MetaSquad(5,this,0);
         this._unitInventory = new Vector.<BC_MetaUnit>();
         this._creatureInventory = new Vector.<MetaEquipement>();
         this._itemInventory = new Vector.<MetaEquipement>();
      }
      
      public function get multiPlayerWin() : int
      {
         return this._multiPlayerWin;
      }
      
      public function set multiPlayerLost(multiPlayerLost:int) : void
      {
         this._multiPlayerLost = multiPlayerLost;
      }
      
      public function set multiPlayerWin(multiPlayerWin:int) : void
      {
         this._multiPlayerWin = multiPlayerWin;
      }
      
      public function get itemInventory() : Vector.<MetaEquipement>
      {
         return this._itemInventory;
      }
      
      public function AddUnitToArmyDecode(gridPos:GridPos, metaUnit:BC_MetaUnit, metaSquad:BC_MetaSquad) : Boolean
      {
         return metaSquad.AddUnit(gridPos,metaUnit);
      }
      
      public function set multiPlayerRank(multiPlayerRank:int) : void
      {
         this._multiPlayerRank = multiPlayerRank;
      }
      
      public function get multiPlayerActivated() : int
      {
         return this._multiPlayerActivated;
      }
      
      public function set armyName(armyName:String) : void
      {
         this._armyName = armyName;
      }
      
      public function AddInventoryUnitAt(metaUnit:BC_MetaUnit, i:int) : void
      {
         this._unitInventory.splice(i,0,metaUnit);
      }
      
      public function Copy(metaArmy:BC_MetaArmy) : void
      {
         this._armyName = metaArmy.armyName;
         this._teamId = metaArmy.teamId;
         this._totalPoint = metaArmy.totalPoint;
         this._multiPlayerActivated = metaArmy.multiPlayerActivated;
         this._multiPlayerWin = metaArmy.multiPlayerWin;
         this._multiPlayerLost = metaArmy.multiPlayerLost;
         this._multiPlayerDraw = metaArmy.multiPlayerDraw;
         this._multiPlayerRank = metaArmy.multiPlayerRank;
         this._multiPlayerCurrentRankCount = metaArmy.multiPlayerCurrentRankCount;
         this._metaSquad1.Copy(metaArmy.metaSquad1);
         this._metaSquad2.Copy(metaArmy.metaSquad2);
         this._metaSquad3.Copy(metaArmy.metaSquad3);
         this._metaSquad4.Copy(metaArmy.metaSquad4);
         this._metaSquad5.Copy(metaArmy.metaSquad5);
      }
      
      public function GetNumUnitInArmy() : int
      {
         var count:int = 0;
         for(var i:int = 0; i < this._metaSquad1.unitVector.length; i++)
         {
            if(this._metaSquad1.unitVector[i].id >= 0)
            {
               count++;
            }
         }
         for(i = 0; i < this._metaSquad2.unitVector.length; i++)
         {
            if(this._metaSquad2.unitVector[i].id >= 0)
            {
               count++;
            }
         }
         for(i = 0; i < this._metaSquad3.unitVector.length; i++)
         {
            if(this._metaSquad3.unitVector[i].id >= 0)
            {
               count++;
            }
         }
         for(i = 0; i < this._metaSquad4.unitVector.length; i++)
         {
            if(this._metaSquad4.unitVector[i].id >= 0)
            {
               count++;
            }
         }
         for(i = 0; i < this._metaSquad5.unitVector.length; i++)
         {
            if(this._metaSquad5.unitVector[i].id >= 0)
            {
               count++;
            }
         }
         return count;
      }
      
      public function set itemInventory(itemInventory:Vector.<MetaEquipement>) : void
      {
         this._itemInventory = itemInventory;
      }
      
      public function get metaSquad1() : BC_MetaSquad
      {
         return this._metaSquad1;
      }
      
      public function get metaSquad3() : BC_MetaSquad
      {
         return this._metaSquad3;
      }
      
      public function get metaSquad5() : BC_MetaSquad
      {
         return this._metaSquad5;
      }
      
      public function IsEmpty() : Boolean
      {
         for(var i:int = 0; i < this._metaSquad1.unitVector.length; i++)
         {
            if(this._metaSquad1.unitVector[i].id >= 0)
            {
               return false;
            }
         }
         for(i = 0; i < this._metaSquad2.unitVector.length; i++)
         {
            if(this._metaSquad2.unitVector[i].id >= 0)
            {
               return false;
            }
         }
         for(i = 0; i < this._metaSquad3.unitVector.length; i++)
         {
            if(this._metaSquad3.unitVector[i].id >= 0)
            {
               return false;
            }
         }
         for(i = 0; i < this._metaSquad4.unitVector.length; i++)
         {
            if(this._metaSquad4.unitVector[i].id >= 0)
            {
               return false;
            }
         }
         for(i = 0; i < this._metaSquad5.unitVector.length; i++)
         {
            if(this._metaSquad5.unitVector[i].id >= 0)
            {
               return false;
            }
         }
         return true;
      }
      
      public function get metaSquad2() : BC_MetaSquad
      {
         return this._metaSquad2;
      }
      
      public function Decode(s:String) : void
      {
         var m:BC_MetaUnit = null;
         var params:Array = s.split(this.SEPARATOR);
         this._teamId = params.shift();
         this._totalPoint = params.shift();
         this._armyName = params.shift();
         this._multiPlayerActivated = params.shift();
         this._multiPlayerWin = params.shift();
         this._multiPlayerLost = params.shift();
         this._multiPlayerDraw = params.shift();
         this._multiPlayerRank = params.shift();
         this._multiPlayerCurrentRankCount = params.shift();
         var lenght:int = int(params.shift());
         for(var i:int = 0; i < lenght; i++)
         {
            m = new BC_MetaUnit(-1);
            m.Decode(params.shift() as String,this._creatureInventory,this._itemInventory);
            this._unitInventory[i] = m;
         }
         if(params.length > 0)
         {
            this._metaSquad1.Decode(params.shift());
         }
         if(params.length > 0)
         {
            this._metaSquad2.Decode(params.shift());
         }
         if(params.length > 0)
         {
            this._metaSquad3.Decode(params.shift());
         }
         if(params.length > 0)
         {
            this._metaSquad4.Decode(params.shift());
         }
         if(params.length > 0)
         {
            this._metaSquad5.Decode(params.shift());
         }
      }
      
      public function ReturnUnitItems(metaUnit:BC_MetaUnit) : void
      {
         var numInArmy:int = 0;
         numInArmy = this.GetNumUnitInArmyOfType(metaUnit);
         for(var i:int = 0; i < this._creatureInventory.length; i++)
         {
            if(this._creatureInventory[i].modelEquipement.id >= 0)
            {
               if(this._creatureInventory[i].modelEquipement.id == metaUnit.playerEquipement.creatureEquip.modelEquipement.id)
               {
                  this._creatureInventory[i].quantity += metaUnit.maxQuantity;
               }
            }
         }
         for(i = 0; i < this._itemInventory.length; i++)
         {
            if(this._itemInventory[i].modelEquipement.id >= 0)
            {
               if(this._itemInventory[i].modelEquipement.id == metaUnit.playerEquipement.weaponEquip.modelEquipement.id)
               {
                  this._itemInventory[i].quantity += metaUnit.maxQuantity;
               }
               if(this._itemInventory[i].modelEquipement.id == metaUnit.playerEquipement.shieldEquip.modelEquipement.id)
               {
                  this._itemInventory[i].quantity += metaUnit.maxQuantity;
               }
               if(this._itemInventory[i].modelEquipement.id == metaUnit.playerEquipement.armorEquip.modelEquipement.id)
               {
                  this._itemInventory[i].quantity += metaUnit.maxQuantity;
               }
               if(this._itemInventory[i].modelEquipement.id == metaUnit.playerEquipement.specialEquip.modelEquipement.id)
               {
                  this._itemInventory[i].quantity += metaUnit.maxQuantity;
               }
            }
         }
      }
      
      public function GetRankName(rank:int) : int
      {
         switch(rank)
         {
            case 1:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_1;
            case 2:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_2;
            case 3:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_3;
            case 4:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_4;
            case 5:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_5;
            case 6:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_6;
            case 7:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_7;
            case 8:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_8;
            case 9:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_9;
            case 10:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_10;
            case 11:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_11;
            case 12:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_12;
            case 13:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_13;
            case 14:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_14;
            case 15:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_15;
            case 16:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_16;
            case 17:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_17;
            case 18:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_18;
            case 19:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_19;
            case 20:
               return BC_TextFactory.ID_MULTIPLAYER_RANK_NAME_20;
            default:
               return 0;
         }
      }
      
      public function get metaSquad4() : BC_MetaSquad
      {
         return this._metaSquad4;
      }
      
      public function IsMultiplayer() : Boolean
      {
         return this._multiPlayerActivated > 0;
      }
      
      public function get multiPlayerLost() : int
      {
         return this._multiPlayerLost;
      }
      
      public function CopySquad(metaArmy:BC_MetaArmy) : void
      {
         this._metaSquad1.Copy(metaArmy.metaSquad1);
         this._metaSquad2.Copy(metaArmy.metaSquad2);
         this._metaSquad3.Copy(metaArmy.metaSquad3);
         this._metaSquad4.Copy(metaArmy.metaSquad4);
         this._metaSquad5.Copy(metaArmy.metaSquad5);
      }
      
      public function ReturnUnitFromArmyToInventory(metaUnit:BC_MetaUnit) : void
      {
         for(var i:int = 0; i < this._metaSquad1.unitVector.length; i++)
         {
            if(metaUnit.id == this._metaSquad1.unitVector[i].id)
            {
               this.totalPoint += metaUnit.playerEquipement.Value;
               this._metaSquad1.RemoveUnit(this._metaSquad1.GetPosInSquad(i),metaUnit);
               ++metaUnit.quantity;
            }
         }
         for(i = 0; i < this._metaSquad2.unitVector.length; i++)
         {
            if(metaUnit.id == this._metaSquad2.unitVector[i].id)
            {
               this.totalPoint += metaUnit.playerEquipement.Value;
               this._metaSquad2.RemoveUnit(this._metaSquad2.GetPosInSquad(i),metaUnit);
               ++metaUnit.quantity;
            }
         }
         for(i = 0; i < this._metaSquad3.unitVector.length; i++)
         {
            if(metaUnit.id == this._metaSquad3.unitVector[i].id)
            {
               this.totalPoint += metaUnit.playerEquipement.Value;
               this._metaSquad3.RemoveUnit(this._metaSquad3.GetPosInSquad(i),metaUnit);
               ++metaUnit.quantity;
            }
         }
         for(i = 0; i < this._metaSquad4.unitVector.length; i++)
         {
            if(metaUnit.id == this._metaSquad4.unitVector[i].id)
            {
               this.totalPoint += metaUnit.playerEquipement.Value;
               this._metaSquad4.RemoveUnit(this._metaSquad4.GetPosInSquad(i),metaUnit);
               ++metaUnit.quantity;
            }
         }
         for(i = 0; i < this._metaSquad5.unitVector.length; i++)
         {
            if(metaUnit.id == this._metaSquad5.unitVector[i].id)
            {
               this.totalPoint += metaUnit.playerEquipement.Value;
               this._metaSquad5.RemoveUnit(this._metaSquad5.GetPosInSquad(i),metaUnit);
               ++metaUnit.quantity;
            }
         }
      }
      
      public function Encode() : String
      {
         var returnString:String = "";
         returnString += this._teamId + this.SEPARATOR + this._totalPoint + this.SEPARATOR + this._armyName + this.SEPARATOR + this._multiPlayerActivated + this.SEPARATOR + this._multiPlayerWin + this.SEPARATOR + this._multiPlayerLost + this.SEPARATOR + this._multiPlayerDraw + this.SEPARATOR + this._multiPlayerRank + this.SEPARATOR + this._multiPlayerCurrentRankCount + this.SEPARATOR;
         returnString += this._unitInventory.length + this.SEPARATOR;
         for(var i:int = 0; i < this._unitInventory.length; i++)
         {
            returnString += this._unitInventory[i].Encode() + this.SEPARATOR;
         }
         return returnString + (this._metaSquad1.Encode() + this.SEPARATOR + this._metaSquad2.Encode() + this.SEPARATOR + this._metaSquad3.Encode() + this.SEPARATOR + this._metaSquad4.Encode() + this.SEPARATOR + this._metaSquad5.Encode());
      }
      
      public function set teamId(teamId:int) : void
      {
         this._teamId = teamId;
      }
      
      public function set metaSquad1(metaSquad1:BC_MetaSquad) : void
      {
         this._metaSquad1 = metaSquad1;
      }
      
      public function GetArmyValue() : int
      {
         var m:BC_MetaUnit = null;
         var armyValue:int = 0;
         for(var i:int = 0; i < this._metaSquad1.unitVector.length; i++)
         {
            if(this._metaSquad1.unitVector[i].id >= 0)
            {
               m = this._metaSquad1.unitVector[i];
               armyValue += m.playerEquipement.Value;
            }
         }
         for(i = 0; i < this._metaSquad2.unitVector.length; i++)
         {
            if(this._metaSquad2.unitVector[i].id >= 0)
            {
               m = this._metaSquad2.unitVector[i];
               armyValue += m.playerEquipement.Value;
            }
         }
         for(i = 0; i < this._metaSquad3.unitVector.length; i++)
         {
            if(this._metaSquad3.unitVector[i].id >= 0)
            {
               m = this._metaSquad3.unitVector[i];
               armyValue += m.playerEquipement.Value;
            }
         }
         for(i = 0; i < this._metaSquad4.unitVector.length; i++)
         {
            if(this._metaSquad4.unitVector[i].id >= 0)
            {
               m = this._metaSquad4.unitVector[i];
               armyValue += m.playerEquipement.Value;
            }
         }
         for(i = 0; i < this._metaSquad5.unitVector.length; i++)
         {
            if(this._metaSquad5.unitVector[i].id >= 0)
            {
               m = this._metaSquad5.unitVector[i];
               armyValue += m.playerEquipement.Value;
            }
         }
         return armyValue;
      }
      
      public function set metaSquad5(metaSquad5:BC_MetaSquad) : void
      {
         this._metaSquad5 = metaSquad5;
      }
      
      public function set metaSquad2(metaSquad2:BC_MetaSquad) : void
      {
         this._metaSquad2 = metaSquad2;
      }
      
      public function AddUnitToArmy(gridPos:GridPos, metaUnit:BC_MetaUnit, metaSquad:BC_MetaSquad) : Boolean
      {
         if(metaSquad.AddUnit(gridPos,metaUnit))
         {
            this._totalPoint -= metaUnit.playerEquipement.Value;
            return true;
         }
         return false;
      }
      
      public function get multiPlayerRank() : int
      {
         return this._multiPlayerRank;
      }
      
      public function get unitInventory() : Vector.<BC_MetaUnit>
      {
         return this._unitInventory;
      }
      
      public function get armyName() : String
      {
         return this._armyName;
      }
      
      public function set creatureInventory(creatureInventory:Vector.<MetaEquipement>) : void
      {
         this._creatureInventory = creatureInventory;
      }
      
      public function RemoveUnitFromArmy(gridPos:GridPos, metaUnit:BC_MetaUnit, metaSquad:BC_MetaSquad) : void
      {
         metaSquad.RemoveUnit(gridPos,metaUnit);
         this._totalPoint += metaUnit.playerEquipement.Value;
      }
      
      public function set metaSquad3(metaSquad3:BC_MetaSquad) : void
      {
         this._metaSquad3 = metaSquad3;
      }
      
      public function set multiPlayerCurrentRankCount(multiPlayerCurrentRankCount:int) : void
      {
         this._multiPlayerCurrentRankCount = multiPlayerCurrentRankCount;
      }
      
      public function RemoveUnitItems(metaUnit:BC_MetaUnit) : void
      {
         for(var i:int = 0; i < this._creatureInventory.length; i++)
         {
            if(this._creatureInventory[i].modelEquipement.id >= 0)
            {
               if(this._creatureInventory[i].modelEquipement.id == metaUnit.playerEquipement.creatureEquip.modelEquipement.id)
               {
                  this._creatureInventory[i].quantity -= metaUnit.maxQuantity;
               }
            }
         }
         for(i = 0; i < this._itemInventory.length; i++)
         {
            if(this._itemInventory[i].modelEquipement.id >= 0)
            {
               if(this._itemInventory[i].modelEquipement.id == metaUnit.playerEquipement.weaponEquip.modelEquipement.id)
               {
                  this._itemInventory[i].quantity -= metaUnit.maxQuantity;
               }
               if(this._itemInventory[i].modelEquipement.id == metaUnit.playerEquipement.shieldEquip.modelEquipement.id)
               {
                  this._itemInventory[i].quantity -= metaUnit.maxQuantity;
               }
               if(this._itemInventory[i].modelEquipement.id == metaUnit.playerEquipement.armorEquip.modelEquipement.id)
               {
                  this._itemInventory[i].quantity -= metaUnit.maxQuantity;
               }
               if(this._itemInventory[i].modelEquipement.id == metaUnit.playerEquipement.specialEquip.modelEquipement.id)
               {
                  this._itemInventory[i].quantity -= metaUnit.maxQuantity;
               }
            }
         }
      }
      
      public function get totalPoint() : int
      {
         return this._totalPoint;
      }
      
      public function set totalPoint(totalPoint:int) : void
      {
         this._totalPoint = totalPoint;
      }
      
      public function get creatureInventory() : Vector.<MetaEquipement>
      {
         return this._creatureInventory;
      }
      
      public function get teamId() : int
      {
         return this._teamId;
      }
      
      public function get multiPlayerCurrentRankCount() : int
      {
         return this._multiPlayerCurrentRankCount;
      }
      
      public function get multiPlayerDraw() : int
      {
         return this._multiPlayerDraw;
      }
      
      public function GetNumUnitInArmyOfType(metaUnit:BC_MetaUnit) : int
      {
         var count:int = 0;
         for(var i:int = 0; i < this._metaSquad1.unitVector.length; i++)
         {
            if(metaUnit.id == this._metaSquad1.unitVector[i].id)
            {
               count++;
            }
         }
         for(i = 0; i < this._metaSquad2.unitVector.length; i++)
         {
            if(metaUnit.id == this._metaSquad2.unitVector[i].id)
            {
               count++;
            }
         }
         for(i = 0; i < this._metaSquad3.unitVector.length; i++)
         {
            if(metaUnit.id == this._metaSquad3.unitVector[i].id)
            {
               count++;
            }
         }
         for(i = 0; i < this._metaSquad4.unitVector.length; i++)
         {
            if(metaUnit.id == this._metaSquad4.unitVector[i].id)
            {
               count++;
            }
         }
         for(i = 0; i < this._metaSquad5.unitVector.length; i++)
         {
            if(metaUnit.id == this._metaSquad5.unitVector[i].id)
            {
               count++;
            }
         }
         return count;
      }
      
      public function set multiPlayerDraw(multiPlayerDraw:int) : void
      {
         this._multiPlayerDraw = multiPlayerDraw;
      }
      
      public function RemoveUnitFromInventory(metaUnit:BC_MetaUnit) : void
      {
         var m:BC_MetaUnit = null;
         for(var i:int = int(this._unitInventory.length - 1); i >= 0; i--)
         {
            m = this._unitInventory[i];
            if(metaUnit.id == m.id)
            {
               this._unitInventory.splice(i,1);
            }
         }
      }
      
      public function set metaSquad4(metaSquad4:BC_MetaSquad) : void
      {
         this._metaSquad4 = metaSquad4;
      }
      
      public function ResetArmy() : void
      {
         this._metaSquad1.ResetSquad();
         this._metaSquad2.ResetSquad();
         this._metaSquad3.ResetSquad();
         this._metaSquad4.ResetSquad();
         this._metaSquad5.ResetSquad();
         if(this._teamId == 5)
         {
            this._totalPoint = 500;
         }
         else
         {
            this._totalPoint = 1000;
         }
      }
      
      public function set unitInventory(unitInventory:Vector.<BC_MetaUnit>) : void
      {
         this._unitInventory = unitInventory;
      }
      
      public function set multiPlayerActivated(multiPlayerActivated:int) : void
      {
         this._multiPlayerActivated = multiPlayerActivated;
      }
      
      public function AddInventoryUnit(metaUnit:BC_MetaUnit) : void
      {
         for(var i:int = 0; i < this._unitInventory.length; i++)
         {
            if(this._unitInventory[i].id < 0)
            {
               this._unitInventory[i] = metaUnit;
               return;
            }
         }
         this._unitInventory.unshift(metaUnit);
      }
   }
}

