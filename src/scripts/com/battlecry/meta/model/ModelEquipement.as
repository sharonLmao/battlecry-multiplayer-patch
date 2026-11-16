package com.battlecry.meta.model
{
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.specialEffect.SpecialEffect;
   import com.battlecry.specialEffect.timedEffects.TimedEffect;
   import com.battlecry.specialEffect.timedEffects.TimedEffectEnum;
   
   public class ModelEquipement
   {
      
      public static const TYPE_CREATURE:int = 1;
      
      public static const TYPE_WEAPON:int = 2;
      
      public static const TYPE_SHIELD:int = 3;
      
      public static const TYPE_ARMOR:int = 4;
      
      public static const TYPE_SPECIAL:int = 5;
      
      public static const GENRE_1HAND:int = 1;
      
      public static const GENRE_2HAND:int = 2;
      
      public static const GENRE_BOW:int = 3;
      
      public static const GENRE_MUSKET:int = 4;
      
      public static const GENRE_PISTOL:int = 5;
      
      public static const GENRE_SPEAR:int = 6;
      
      public static const GENRE_STAFF:int = 7;
      
      public static const GENRE_ARTILLERY_9CASE:int = 100;
      
      public static const GENRE_ARTILLERY_6CASE:int = 101;
      
      public static const GENRE_ARTILLERY_3CASE:int = 102;
      
      public static const GENRE_CREATURE_HUMAN:int = 103;
      
      public static const GENRE_CREATURE_ORC:int = 104;
      
      public static const GENRE_CREATURE_IMP:int = 105;
      
      public static const GENRE_CREATURE_UNDEAD:int = 106;
      
      public static const GENRE_CREATURE_INSECTOID:int = 107;
      
      public static const GENRE_CREATURE_VERMINE:int = 108;
      
      public static const GENRE_CREATURE_REPTILIAN:int = 109;
      
      public static const GENRE_CREATURE_LYCANTROP:int = 110;
      
      public static const GENRE_CREATURE_GOLEM:int = 111;
      
      public static const GENRE_CREATURE_FISHMAN:int = 112;
      
      public static const GENRE_CREATURE_FIREELEMENTAL:int = 113;
      
      public static const GENRE_CREATURE_WATERELEMENTAL:int = 114;
      
      public static const GENRE_CREATURE_POISONELEMENTAL:int = 115;
      
      public static const GENRE_CREATURE_THUNDERELEMENTAL:int = 116;
      
      public static const GENRE_CREATURE_OCTOPOD:int = 117;
      
      public static const GENRE_CREATURE_DEMON:int = 118;
      
      public static const GENRE_CREATURE_ANGEL:int = 119;
      
      public static const GENRE_CREATURE_FAMINE:int = 120;
      
      public static const GENRE_CREATURE_WAR:int = 121;
      
      public static const GENRE_CREATURE_CONQUEST:int = 122;
      
      public static const GENRE_CREATURE_DEATH:int = 123;
      
      public static const GENRE_CREATURE_IMMORTAL:int = 124;
      
      public static const GENRE_CREATURE_ALL:int = 125;
      
      public static const GENRE_ARTILLERY_1CASE:int = 126;
      
      public static const GENRE_ARMOR:int = 200;
      
      public static const GENRE_SHIELD:int = 300;
      
      public static const GENRE_SPECIAL:int = 500;
      
      public static const GENRE_SPECIAL_HORSE:int = 501;
      
      public static const GENRE_SPECIAL_BOAR:int = 502;
      
      public static const RARITY_COMMUN:int = 1;
      
      public static const RARITY_UNCOMMUN:int = 2;
      
      public static const RARITY_RARE:int = 3;
      
      public static const RARITY_LEGENDARY:int = 4;
      
      private var _defense:int;
      
      private var _genre:int;
      
      private var _modelAttack:ModelAttack;
      
      private var _type:int;
      
      private var _reloadTime:int;
      
      private var _hauteur:int;
      
      private var _cost:int;
      
      private var _itemVisualFrame:int;
      
      private var _range:int;
      
      private var _id:int;
      
      private var _rarity:int;
      
      private var _specialEffectVector:Vector.<SpecialEffect>;
      
      private var _equipementNameId:int;
      
      private var _largeur:int;
      
      private var _modelAnim:ModelAnim;
      
      private var _equipementDescId:int;
      
      private var _metaStatsList:MetaStatsList;
      
      private var _modelEffect:ModelProjectileEffect;
      
      private var _isCastItem:Boolean;
      
      private var _value:int;
      
      private var _setType:int;
      
      public function ModelEquipement(id1:int, rarity1:int, type1:int, genre1:int, largeur1:int, hauteur1:int, equipementNameId1:int, equipementDescId1:int, modelEffect:ModelProjectileEffect, modelAttack:ModelAttack, specialV:Vector.<SpecialEffect>, setType:int, isCastItem:Boolean)
      {
         var i:int = 0;
         this._specialEffectVector = new Vector.<SpecialEffect>();
         super();
         this._id = id1;
         this._type = type1;
         this._rarity = rarity1;
         this._genre = genre1;
         this._setType = setType;
         this._largeur = largeur1;
         this._hauteur = hauteur1;
         this._equipementNameId = equipementNameId1;
         this._equipementDescId = equipementDescId1;
         this._modelAnim = ModelAnimEnum.ANIMATION_NULL;
         this._metaStatsList = new MetaStatsList();
         this._modelEffect = modelEffect;
         this._modelAttack = modelAttack;
         if(specialV != null)
         {
            for(i = 0; i < specialV.length; i++)
            {
               this._specialEffectVector[i] = specialV[i];
            }
         }
         this._isCastItem = isCastItem;
      }
      
      public function set defense(defense:int) : void
      {
         this._defense = defense;
      }
      
      public function set itemVisualFrame(itemVisualFrame:int) : void
      {
         this._itemVisualFrame = itemVisualFrame;
      }
      
      public function set genre(genre:int) : void
      {
         this._genre = genre;
      }
      
      public function set isCastItem(isCastItem:Boolean) : void
      {
         this._isCastItem = isCastItem;
      }
      
      public function get itemVisualFrame() : int
      {
         return this._itemVisualFrame;
      }
      
      public function set equipementNameId(equipementNameId:int) : void
      {
         this._equipementNameId = equipementNameId;
      }
      
      public function get hauteur() : int
      {
         return this._hauteur;
      }
      
      public function get reloadTime() : int
      {
         var i:int = 0;
         if(this._reloadTime <= 0)
         {
            for(i = 0; i < this._specialEffectVector.length; i++)
            {
               if(Boolean(this._specialEffectVector[i] as TimedEffect) && TimedEffectEnum.IsCastingTimedEffect((this._specialEffectVector[i] as TimedEffect).id))
               {
                  return (this._specialEffectVector[i] as TimedEffect).maxCoolDown;
               }
            }
         }
         return this._reloadTime;
      }
      
      public function IsRange() : Boolean
      {
         return this._genre == ModelEquipement.GENRE_BOW || this._genre == ModelEquipement.GENRE_MUSKET || this._genre == ModelEquipement.GENRE_PISTOL;
      }
      
      public function get largeur() : int
      {
         return this._largeur;
      }
      
      public function set cost(cost:int) : void
      {
         this._cost = cost;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function isElemental() : Boolean
      {
         return this._genre == ModelEquipement.GENRE_CREATURE_ALL || this._genre == ModelEquipement.GENRE_CREATURE_FIREELEMENTAL || this._genre == ModelEquipement.GENRE_CREATURE_POISONELEMENTAL || this._genre == ModelEquipement.GENRE_CREATURE_THUNDERELEMENTAL || this._genre == ModelEquipement.GENRE_CREATURE_WATERELEMENTAL;
      }
      
      public function get modelEffect() : ModelProjectileEffect
      {
         return this._modelEffect;
      }
      
      public function set modelAttack(modelAttack:ModelAttack) : void
      {
         this._modelAttack = modelAttack;
      }
      
      public function IsMythic() : Boolean
      {
         return this._id == ModelEquipementEnum.CREATURE_AODAN_MYTHIC.id || this._id == ModelEquipementEnum.CREATURE_AZARTIUS_MYTHIC.id || this._id == ModelEquipementEnum.CREATURE_UMENTH_MYTHIC.id || this._id == ModelEquipementEnum.CREATURE_YASUR_MYTHIC.id || this._id == ModelEquipementEnum.CREATURE_XONAX_MYTHIC.id || this._id == ModelEquipementEnum.CREATURE_ZAMAROTH_MYTHIC.id || this._id == ModelEquipementEnum.CREATURE_VASSPOTANAX_MYTHIC.id || this._id == ModelEquipementEnum.CREATURE_RHIGAR_MYTHIC.id || this._id == ModelEquipementEnum.CREATURE_IMRAILH_MYTHIC.id || this._id == ModelEquipementEnum.CREATURE_MISFORM_MYTHIC.id;
      }
      
      public function set range(range:int) : void
      {
         this._range = range;
      }
      
      public function set specialEffectVector(specialEffectVector:Vector.<SpecialEffect>) : void
      {
         this._specialEffectVector = specialEffectVector;
      }
      
      public function set reloadTime(reloadTime:int) : void
      {
         this._reloadTime = reloadTime;
      }
      
      public function Reset() : void
      {
         this._metaStatsList.FeedFromModel(this);
         this._cost = MiscConstants.GetCost(this);
         this._range = MiscConstants.GetRange(this);
         this._defense = MiscConstants.GetDefence(this);
         this._value = MiscConstants.GetValue(this);
         this._itemVisualFrame = MiscConstants.GetVisualFrame(this);
         this._reloadTime = MiscConstants.GetReloadTime(this);
      }
      
      public function set modelEffect(modelEffect:ModelProjectileEffect) : void
      {
         this._modelEffect = modelEffect;
      }
      
      public function set metaStatsList(metaStatsList:MetaStatsList) : void
      {
         this._metaStatsList = metaStatsList;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set largeur(largeur:int) : void
      {
         this._largeur = largeur;
      }
      
      public function get defense() : int
      {
         return this._defense;
      }
      
      public function isArtillery() : Boolean
      {
         return this._genre == ModelEquipement.GENRE_ARTILLERY_3CASE || this._genre == ModelEquipement.GENRE_ARTILLERY_6CASE || this._genre == ModelEquipement.GENRE_ARTILLERY_9CASE;
      }
      
      public function get range() : int
      {
         return this._range;
      }
      
      public function set id(id:int) : void
      {
         this._id = id;
      }
      
      public function get setType() : int
      {
         return this._setType;
      }
      
      public function get rarity() : int
      {
         return this._rarity;
      }
      
      public function get specialEffectVector() : Vector.<SpecialEffect>
      {
         return this._specialEffectVector;
      }
      
      public function get cost() : int
      {
         return this._cost;
      }
      
      public function get genre() : int
      {
         return this._genre;
      }
      
      public function set rarity(rarity:int) : void
      {
         this._rarity = rarity;
      }
      
      public function get metaStatsList() : MetaStatsList
      {
         return this._metaStatsList;
      }
      
      public function set value(value:int) : void
      {
         this._value = value;
      }
      
      public function set hauteur(hauteur:int) : void
      {
         this._hauteur = hauteur;
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get modelAttack() : ModelAttack
      {
         return this._modelAttack;
      }
      
      public function get isCastItem() : Boolean
      {
         return this._isCastItem;
      }
      
      public function set setType(setType:int) : void
      {
         this._setType = setType;
      }
      
      public function get equipementNameId() : int
      {
         return this._equipementNameId;
      }
      
      public function set type(type:int) : void
      {
         this._type = type;
      }
      
      public function set equipementDescId(equipementDescId:int) : void
      {
         this._equipementDescId = equipementDescId;
      }
      
      public function get equipementDescId() : int
      {
         return this._equipementDescId;
      }
   }
}

