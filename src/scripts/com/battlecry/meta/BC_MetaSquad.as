package com.battlecry.meta
{
   import com.battlecry.battle.GridPos;
   
   public class BC_MetaSquad
   {
      
      private var _squadPosition:int;
      
      private const SEPARATOR:String = "[S]";
      
      private var _unitVector:Vector.<BC_MetaUnit>;
      
      private var _speed:MetaSquadSpeed = MetaSquadSpeedEnum.SPEED_HOLD;
      
      private var _metaArmy:BC_MetaArmy;
      
      private var _squadId:int;
      
      public function BC_MetaSquad(id:int, metaArmy:BC_MetaArmy, squadPos:int)
      {
         super();
         this._squadId = id;
         this._metaArmy = metaArmy;
         this._squadPosition = squadPos;
         this._unitVector = new Vector.<BC_MetaUnit>(18);
         this._unitVector[0] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[1] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[2] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[3] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[4] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[5] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[6] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[7] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[8] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[9] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[10] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[11] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[12] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[13] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[14] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[15] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[16] = BC_MetaUnit.EMPTY_UNIT;
         this._unitVector[17] = BC_MetaUnit.EMPTY_UNIT;
      }
      
      public function get squadPosition() : int
      {
         return this._squadPosition;
      }
      
      public function get speed() : MetaSquadSpeed
      {
         return this._speed;
      }
      
      public function RemoveUnit(gridPos:GridPos, metaUnit:BC_MetaUnit) : void
      {
         var j:int = 0;
         var k:int = 0;
         for(var i:int = 0; i < metaUnit.playerEquipement.largeur; i++)
         {
            for(j = 0; j < metaUnit.playerEquipement.hauteur; j++)
            {
               k = gridPos.x * 6 - i * 6 + (gridPos.y + j);
               this._unitVector[k] = new BC_MetaUnit(-1);
            }
         }
      }
      
      public function get metaArmy() : BC_MetaArmy
      {
         return this._metaArmy;
      }
      
      public function ResetSquad() : void
      {
         for(var i:int = 0; i < this._unitVector.length; i++)
         {
            this._unitVector[i] = new BC_MetaUnit(-1);
         }
      }
      
      public function set squadPosition(squadPosition:int) : void
      {
         this._squadPosition = squadPosition;
      }
      
      public function Decode(s:String) : void
      {
         var id:int = 0;
         var v:Vector.<BC_MetaUnit> = null;
         var j:int = 0;
         if(s == null)
         {
            trace(s);
         }
         var params:Array = s.split(this.SEPARATOR);
         this._squadId = params.shift();
         this._squadPosition = params.shift();
         this._speed = MetaSquadSpeedEnum.GetFromId(params.shift());
         for(var i:int = 0; i < this._unitVector.length; i++)
         {
            id = int(params.shift());
            v = this._metaArmy.unitInventory;
            for(j = 0; j < v.length; j++)
            {
               if(id == v[j].id)
               {
                  this._metaArmy.AddUnitToArmyDecode(this.GetPosInSquad(i),v[j],this);
               }
            }
         }
      }
      
      public function SwitchSpeed() : void
      {
         if(this._speed == MetaSquadSpeedEnum.SPEED_HOLD)
         {
            this._speed = MetaSquadSpeedEnum.SPEED_SLOW;
         }
         else if(this._speed == MetaSquadSpeedEnum.SPEED_SLOW)
         {
            this._speed = MetaSquadSpeedEnum.SPEED_FAST;
         }
         else
         {
            this._speed = MetaSquadSpeedEnum.SPEED_HOLD;
         }
         for(var i:int = 0; i < this._unitVector.length; i++)
         {
            this._unitVector[i].speed = this._speed;
         }
      }
      
      public function Copy(metaSquad:BC_MetaSquad) : void
      {
         this._metaArmy = metaSquad.metaArmy;
         this._squadId = metaSquad.squadId;
         this._squadPosition = metaSquad.squadPosition;
         this._speed = MetaSquadSpeedEnum.GetFromId(metaSquad.speed.id);
         for(var i:int = 0; i < this._unitVector.length; i++)
         {
            this._unitVector[i] = new BC_MetaUnit(-1);
            this._unitVector[i].Copy(metaSquad.unitVector[i]);
         }
      }
      
      public function set metaArmy(metaArmy:BC_MetaArmy) : void
      {
         this._metaArmy = metaArmy;
      }
      
      public function set unitVector(unitVector:Vector.<BC_MetaUnit>) : void
      {
         this._unitVector = unitVector;
      }
      
      public function AddUnit(gridPos:GridPos, metaUnit:BC_MetaUnit) : Boolean
      {
         var poslargeur:int = 0;
         var posToCheck:int = 0;
         var h:int = 0;
         var posHauteur:int = 0;
         var posToCheck2:int = 0;
         var b:int = 0;
         var i:int = gridPos.x * 6 + gridPos.y;
         for(var l:int = 0; l < metaUnit.playerEquipement.largeur; l++)
         {
            poslargeur = gridPos.x;
            posToCheck = poslargeur - l;
            if(posToCheck < 0)
            {
               return false;
            }
            if(this._unitVector[posToCheck * 6 + gridPos.y].id != -1 || this._unitVector[posToCheck * 6 + gridPos.y].id == -2)
            {
               return false;
            }
            for(h = 0; h < metaUnit.playerEquipement.hauteur; h++)
            {
               posHauteur = gridPos.y;
               posToCheck2 = h + posHauteur;
               if(posToCheck2 > 5)
               {
                  return false;
               }
               if(this._unitVector[posToCheck2 + (gridPos.x - l) * 6].id != -1 || this._unitVector[posToCheck2 + (gridPos.x - l) * 6].id == -2)
               {
                  return false;
               }
            }
         }
         this._unitVector[i] = new BC_MetaUnit(1);
         this._unitVector[i].Copy(metaUnit);
         this._unitVector[i].posInSquad = gridPos;
         for(var a:int = 0; a < metaUnit.playerEquipement.largeur; a++)
         {
            for(b = 0; b < metaUnit.playerEquipement.hauteur; b++)
            {
               if(this._unitVector[i - a * 6 + b].id == -1)
               {
                  this._unitVector[i - a * 6 + b] = new metaShadow(metaUnit,i);
               }
            }
         }
         return true;
      }
      
      public function set speed(speed:MetaSquadSpeed) : void
      {
         this._speed = speed;
      }
      
      public function get unitVector() : Vector.<BC_MetaUnit>
      {
         return this._unitVector;
      }
      
      public function set squadId(squadId:int) : void
      {
         this._squadId = squadId;
      }
      
      public function get squadId() : int
      {
         return this._squadId;
      }
      
      public function GetPosInSquad(i:int) : GridPos
      {
         switch(i)
         {
            case 0:
               return new GridPos(0,0);
            case 1:
               return new GridPos(0,1);
            case 2:
               return new GridPos(0,2);
            case 3:
               return new GridPos(0,3);
            case 4:
               return new GridPos(0,4);
            case 5:
               return new GridPos(0,5);
            case 6:
               return new GridPos(1,0);
            case 7:
               return new GridPos(1,1);
            case 8:
               return new GridPos(1,2);
            case 9:
               return new GridPos(1,3);
            case 10:
               return new GridPos(1,4);
            case 11:
               return new GridPos(1,5);
            case 12:
               return new GridPos(2,0);
            case 13:
               return new GridPos(2,1);
            case 14:
               return new GridPos(2,2);
            case 15:
               return new GridPos(2,3);
            case 16:
               return new GridPos(2,4);
            case 17:
               return new GridPos(2,5);
            default:
               return new GridPos(0,0);
         }
      }
      
      public function Encode() : String
      {
         var returnValue:String = null;
         returnValue = this._squadId + this.SEPARATOR + this._squadPosition + this.SEPARATOR + this._speed.id + this.SEPARATOR;
         for(var i:int = 0; i < this._unitVector.length; i++)
         {
            returnValue += this._unitVector[i].id + this.SEPARATOR;
         }
         return returnValue;
      }
   }
}

