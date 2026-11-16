package com.battlecry.meta
{
   import com.battlecry.meta.model.ModelAttack;
   import com.battlecry.meta.model.ModelAttackEnum;
   import com.battlecry.meta.model.ModelProjectileEffect;
   import com.battlecry.meta.model.ModelProjectileEffectEnum;
   import com.battlecry.specialEffect.SpecialEffect;
   import com.battlecry.specialEffect.statsModifier.StatsModifier;
   import com.lachhhEngine.multilingual.TextFactory;
   
   public class MetaPlayerEquipement
   {
      
      public static var EMPTY_PLAYER_EQUIPEMENT:MetaPlayerEquipement = new MetaPlayerEquipement(MetaEquipement.EMPTY_EQUIPEMENT,MetaEquipement.EMPTY_EQUIPEMENT,MetaEquipement.EMPTY_EQUIPEMENT,MetaEquipement.EMPTY_EQUIPEMENT,MetaEquipement.EMPTY_EQUIPEMENT);
      
      private var _shieldEquip:MetaEquipement;
      
      private var _weaponEquip:MetaEquipement;
      
      private var _creatureEquip:MetaEquipement;
      
      private const SEPARATOR:String = "[PE]";
      
      private var _armorEquip:MetaEquipement;
      
      private var _specialEquip:MetaEquipement;
      
      private var _metaStatsList:MetaStatsList;
      
      public function MetaPlayerEquipement(creature:MetaEquipement, weapon:MetaEquipement, shield:MetaEquipement, armor:MetaEquipement, special:MetaEquipement)
      {
         super();
         this._creatureEquip = creature;
         this._weaponEquip = weapon;
         this._shieldEquip = shield;
         this._armorEquip = armor;
         this._specialEquip = special;
         this._metaStatsList = new MetaStatsList();
         this._metaStatsList.FeedFromPlayerEquipement(this);
      }
      
      public function get PierceResist() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.piercingResist + this._weaponEquip.modelEquipement.metaStatsList.piercingResist + this._shieldEquip.modelEquipement.metaStatsList.piercingResist + this._armorEquip.modelEquipement.metaStatsList.piercingResist + this._specialEquip.modelEquipement.metaStatsList.piercingResist;
      }
      
      public function get SlashAttack() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.slashAttack + this._weaponEquip.modelEquipement.metaStatsList.slashAttack + this._shieldEquip.modelEquipement.metaStatsList.slashAttack + this._armorEquip.modelEquipement.metaStatsList.slashAttack + this._specialEquip.modelEquipement.metaStatsList.slashAttack;
      }
      
      public function get reloadTime() : int
      {
         return this._creatureEquip.modelEquipement.reloadTime + this._weaponEquip.modelEquipement.reloadTime + this._shieldEquip.modelEquipement.reloadTime + this._armorEquip.modelEquipement.reloadTime + this._specialEquip.modelEquipement.reloadTime;
      }
      
      public function get CastTimeReduction() : int
      {
         var c:StatsModifier = null;
         var c1:StatsModifier = null;
         var CastTimeReduction:int = 0;
         var v:Vector.<SpecialEffect> = this.specialEffect;
         for(var i:int = 0; i < v.length; i++)
         {
            if(v[i] is StatsModifier)
            {
               c = v[i] as StatsModifier;
               c1 = new StatsModifier(c.id,c.type,c.value,c.limit);
               if(c1.type == StatsModifier.TYPE_CASTINGTIME)
               {
                  CastTimeReduction += c1.value;
               }
            }
         }
         return CastTimeReduction;
      }
      
      public function get HolyResist() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.holyResist + this._weaponEquip.modelEquipement.metaStatsList.holyResist + this._shieldEquip.modelEquipement.metaStatsList.holyResist + this._armorEquip.modelEquipement.metaStatsList.holyResist + this._specialEquip.modelEquipement.metaStatsList.holyResist;
      }
      
      public function Decode(s:String) : void
      {
         var params:Array = s.split(this.SEPARATOR);
         this._creatureEquip.Decode(params.shift());
         this._weaponEquip.Decode(params.shift());
         this._shieldEquip.Decode(params.shift());
         this._armorEquip.Decode(params.shift());
         this._specialEquip.Decode(params.shift());
         this._metaStatsList.FeedFromPlayerEquipement(this);
      }
      
      public function get effect() : ModelProjectileEffect
      {
         if(this._creatureEquip.modelEquipement.modelEffect != ModelProjectileEffectEnum.EFFECT_NULL)
         {
            return this._creatureEquip.modelEquipement.modelEffect;
         }
         if(this._specialEquip.modelEquipement.modelEffect != ModelProjectileEffectEnum.EFFECT_NULL)
         {
            return this._specialEquip.modelEquipement.modelEffect;
         }
         if(this._weaponEquip.modelEquipement.modelEffect != ModelProjectileEffectEnum.EFFECT_NULL)
         {
            return this._weaponEquip.modelEquipement.modelEffect;
         }
         return ModelProjectileEffectEnum.EFFECT_NULL;
      }
      
      public function get IceAttack() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.iceAttack + this._weaponEquip.modelEquipement.metaStatsList.iceAttack + this._shieldEquip.modelEquipement.metaStatsList.iceAttack + this._armorEquip.modelEquipement.metaStatsList.iceAttack + this._specialEquip.modelEquipement.metaStatsList.iceAttack;
      }
      
      public function Copy(metaPlayerEquipement:MetaPlayerEquipement) : void
      {
         this._creatureEquip.copy(metaPlayerEquipement.creatureEquip);
         this._weaponEquip.copy(metaPlayerEquipement.weaponEquip);
         this._shieldEquip.copy(metaPlayerEquipement.shieldEquip);
         this._armorEquip.copy(metaPlayerEquipement.armorEquip);
         this._specialEquip.copy(metaPlayerEquipement.specialEquip);
         this._metaStatsList.FeedFromPlayerEquipement(this);
      }
      
      public function get PoisonAttack() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.poisonAttack + this._weaponEquip.modelEquipement.metaStatsList.poisonAttack + this._shieldEquip.modelEquipement.metaStatsList.poisonAttack + this._armorEquip.modelEquipement.metaStatsList.poisonAttack + this._specialEquip.modelEquipement.metaStatsList.poisonAttack;
      }
      
      public function get largeur() : int
      {
         return this._creatureEquip.modelEquipement.largeur + this._weaponEquip.modelEquipement.largeur + this._shieldEquip.modelEquipement.largeur + this._armorEquip.modelEquipement.largeur + this._specialEquip.modelEquipement.largeur;
      }
      
      public function GetCastingTime() : String
      {
         if(this.reloadTime <= 0)
         {
            return "N/A";
         }
         var castingTime:int = this.reloadTime + this.CastTimeReduction;
         if(castingTime <= 2)
         {
            castingTime = 2;
         }
         return castingTime + "s.";
      }
      
      public function get BluntResist() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.bluntResist + this._weaponEquip.modelEquipement.metaStatsList.bluntResist + this._shieldEquip.modelEquipement.metaStatsList.bluntResist + this._armorEquip.modelEquipement.metaStatsList.bluntResist + this._specialEquip.modelEquipement.metaStatsList.bluntResist;
      }
      
      public function get Range() : int
      {
         return this._creatureEquip.modelEquipement.range + this._weaponEquip.modelEquipement.range + this._shieldEquip.modelEquipement.range + this._armorEquip.modelEquipement.range + this._specialEquip.modelEquipement.range;
      }
      
      public function get ExplosionAttack() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.explosionAttack + this._weaponEquip.modelEquipement.metaStatsList.explosionAttack + this._shieldEquip.modelEquipement.metaStatsList.explosionAttack + this._armorEquip.modelEquipement.metaStatsList.explosionAttack + this._specialEquip.modelEquipement.metaStatsList.explosionAttack;
      }
      
      public function set shieldEquip(shieldEquip:MetaEquipement) : void
      {
         this._shieldEquip = shieldEquip;
         this._metaStatsList.FeedFromPlayerEquipement(this);
      }
      
      public function get DarkResist() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.darkResist + this._weaponEquip.modelEquipement.metaStatsList.darkResist + this._shieldEquip.modelEquipement.metaStatsList.darkResist + this._armorEquip.modelEquipement.metaStatsList.darkResist + this._specialEquip.modelEquipement.metaStatsList.darkResist;
      }
      
      public function get specialEffect() : Vector.<SpecialEffect>
      {
         var v:Vector.<SpecialEffect> = new Vector.<SpecialEffect>();
         var i:int = 0;
         for(i = 0; i < this._creatureEquip.modelEquipement.specialEffectVector.length; i++)
         {
            v.push(this._creatureEquip.modelEquipement.specialEffectVector[i]);
         }
         for(i = 0; i < this._weaponEquip.modelEquipement.specialEffectVector.length; i++)
         {
            v.push(this._weaponEquip.modelEquipement.specialEffectVector[i]);
         }
         for(i = 0; i < this._shieldEquip.modelEquipement.specialEffectVector.length; i++)
         {
            v.push(this._shieldEquip.modelEquipement.specialEffectVector[i]);
         }
         for(i = 0; i < this._armorEquip.modelEquipement.specialEffectVector.length; i++)
         {
            v.push(this._armorEquip.modelEquipement.specialEffectVector[i]);
         }
         for(i = 0; i < this._specialEquip.modelEquipement.specialEffectVector.length; i++)
         {
            v.push(this._specialEquip.modelEquipement.specialEffectVector[i]);
         }
         return v;
      }
      
      public function get SlashResist() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.slashResist + this._weaponEquip.modelEquipement.metaStatsList.slashResist + this._shieldEquip.modelEquipement.metaStatsList.slashResist + this._armorEquip.modelEquipement.metaStatsList.slashResist + this._specialEquip.modelEquipement.metaStatsList.slashResist;
      }
      
      public function get Defense() : int
      {
         return this._creatureEquip.modelEquipement.defense + this._weaponEquip.modelEquipement.defense + this._shieldEquip.modelEquipement.defense + this._armorEquip.modelEquipement.defense + this._specialEquip.modelEquipement.defense;
      }
      
      public function set metaStatsList(metaStatsList:MetaStatsList) : void
      {
         this._metaStatsList = metaStatsList;
      }
      
      public function get creatureEquip() : MetaEquipement
      {
         return this._creatureEquip;
      }
      
      public function get PoisonResist() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.poisonResist + this._weaponEquip.modelEquipement.metaStatsList.poisonResist + this._shieldEquip.modelEquipement.metaStatsList.poisonResist + this._armorEquip.modelEquipement.metaStatsList.poisonResist + this._specialEquip.modelEquipement.metaStatsList.poisonResist;
      }
      
      public function get LightningResist() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.lightningResist + this._weaponEquip.modelEquipement.metaStatsList.lightningResist + this._shieldEquip.modelEquipement.metaStatsList.lightningResist + this._armorEquip.modelEquipement.metaStatsList.lightningResist + this._specialEquip.modelEquipement.metaStatsList.lightningResist;
      }
      
      public function Reset() : void
      {
         this._metaStatsList.FeedFromPlayerEquipement(this);
      }
      
      public function get armorEquip() : MetaEquipement
      {
         return this._armorEquip;
      }
      
      public function get IceResist() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.iceResist + this._weaponEquip.modelEquipement.metaStatsList.iceResist + this._shieldEquip.modelEquipement.metaStatsList.iceResist + this._armorEquip.modelEquipement.metaStatsList.iceResist + this._specialEquip.modelEquipement.metaStatsList.iceResist;
      }
      
      public function Encode() : String
      {
         return this._creatureEquip.Encode() + this.SEPARATOR + this._weaponEquip.Encode() + this.SEPARATOR + this._shieldEquip.Encode() + this.SEPARATOR + this._armorEquip.Encode() + this.SEPARATOR + this._specialEquip.Encode();
      }
      
      public function get FireAttack() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.fireAttack + this._weaponEquip.modelEquipement.metaStatsList.fireAttack + this._shieldEquip.modelEquipement.metaStatsList.fireAttack + this._armorEquip.modelEquipement.metaStatsList.fireAttack + this._specialEquip.modelEquipement.metaStatsList.fireAttack;
      }
      
      public function get ExplosionResist() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.explosionResist + this._weaponEquip.modelEquipement.metaStatsList.explosionResist + this._shieldEquip.modelEquipement.metaStatsList.explosionResist + this._armorEquip.modelEquipement.metaStatsList.explosionResist + this._specialEquip.modelEquipement.metaStatsList.explosionResist;
      }
      
      public function get shieldEquip() : MetaEquipement
      {
         return this._shieldEquip;
      }
      
      public function get attack() : ModelAttack
      {
         if(this._creatureEquip.modelEquipement.modelAttack != ModelAttackEnum.ATTACK_NULL)
         {
            return this._creatureEquip.modelEquipement.modelAttack;
         }
         return this._weaponEquip.modelEquipement.modelAttack;
      }
      
      public function get Value() : int
      {
         return this._creatureEquip.modelEquipement.value + this._weaponEquip.modelEquipement.value + this._shieldEquip.modelEquipement.value + this._armorEquip.modelEquipement.value + this._specialEquip.modelEquipement.value;
      }
      
      public function get PierceAttack() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.piercingAttack + this._weaponEquip.modelEquipement.metaStatsList.piercingAttack + this._shieldEquip.modelEquipement.metaStatsList.piercingAttack + this._armorEquip.modelEquipement.metaStatsList.piercingAttack + this._specialEquip.modelEquipement.metaStatsList.piercingAttack;
      }
      
      public function get metaStatsList() : MetaStatsList
      {
         return this._metaStatsList;
      }
      
      public function GetReloadTime() : String
      {
         if(this.reloadTime <= 0)
         {
            return "N/A";
         }
         var castingTime:int = this.reloadTime;
         if(castingTime <= 2)
         {
            castingTime = 2;
         }
         return castingTime + "s.";
      }
      
      public function get FireResist() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.fireResist + this._weaponEquip.modelEquipement.metaStatsList.fireResist + this._shieldEquip.modelEquipement.metaStatsList.fireResist + this._armorEquip.modelEquipement.metaStatsList.fireResist + this._specialEquip.modelEquipement.metaStatsList.fireResist;
      }
      
      public function set creatureEquip(creatureEquip:MetaEquipement) : void
      {
         this._creatureEquip = creatureEquip;
         this._metaStatsList.FeedFromPlayerEquipement(this);
      }
      
      public function get HolyAttack() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.holyAttack + this._weaponEquip.modelEquipement.metaStatsList.holyAttack + this._shieldEquip.modelEquipement.metaStatsList.holyAttack + this._armorEquip.modelEquipement.metaStatsList.holyAttack + this._specialEquip.modelEquipement.metaStatsList.holyAttack;
      }
      
      public function set weaponEquip(weaponEquip:MetaEquipement) : void
      {
         this._weaponEquip = weaponEquip;
         this._metaStatsList.FeedFromPlayerEquipement(this);
      }
      
      public function get NameList() : String
      {
         var string:String = "";
         if(this._creatureEquip.modelEquipement.id >= 0)
         {
            string += TextFactory.instance.GetMsg(this._creatureEquip.modelEquipement.equipementNameId) + "\n";
         }
         if(this._weaponEquip.modelEquipement.id >= 0)
         {
            string += TextFactory.instance.GetMsg(this._weaponEquip.modelEquipement.equipementNameId) + "\n";
         }
         if(this._shieldEquip.modelEquipement.id >= 0)
         {
            string += TextFactory.instance.GetMsg(this._shieldEquip.modelEquipement.equipementNameId) + "\n";
         }
         if(this._armorEquip.modelEquipement.id >= 0)
         {
            string += TextFactory.instance.GetMsg(this._armorEquip.modelEquipement.equipementNameId) + "\n";
         }
         if(this._specialEquip.modelEquipement.id >= 0)
         {
            string += TextFactory.instance.GetMsg(this._specialEquip.modelEquipement.equipementNameId) + "\n";
         }
         return string;
      }
      
      public function get hauteur() : int
      {
         return this._creatureEquip.modelEquipement.hauteur + this._weaponEquip.modelEquipement.hauteur + this._shieldEquip.modelEquipement.hauteur + this._armorEquip.modelEquipement.hauteur + this._specialEquip.modelEquipement.hauteur;
      }
      
      public function set specialEquip(specialEquip:MetaEquipement) : void
      {
         this._specialEquip = specialEquip;
         this._metaStatsList.FeedFromPlayerEquipement(this);
      }
      
      public function get Lightningattack() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.lightningAttack + this._weaponEquip.modelEquipement.metaStatsList.lightningAttack + this._shieldEquip.modelEquipement.metaStatsList.lightningAttack + this._armorEquip.modelEquipement.metaStatsList.lightningAttack + this._specialEquip.modelEquipement.metaStatsList.lightningAttack;
      }
      
      public function get weaponEquip() : MetaEquipement
      {
         return this._weaponEquip;
      }
      
      public function get specialEquip() : MetaEquipement
      {
         return this._specialEquip;
      }
      
      public function get BluntAttack() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.bluntAttack + this._weaponEquip.modelEquipement.metaStatsList.bluntAttack + this._shieldEquip.modelEquipement.metaStatsList.bluntAttack + this._armorEquip.modelEquipement.metaStatsList.bluntAttack + this._specialEquip.modelEquipement.metaStatsList.bluntAttack;
      }
      
      public function set armorEquip(armorEquip:MetaEquipement) : void
      {
         this._armorEquip = armorEquip;
         this._metaStatsList.FeedFromPlayerEquipement(this);
      }
      
      public function get DarkAttack() : int
      {
         return this._creatureEquip.modelEquipement.metaStatsList.darkAttack + this._weaponEquip.modelEquipement.metaStatsList.darkAttack + this._shieldEquip.modelEquipement.metaStatsList.darkAttack + this._armorEquip.modelEquipement.metaStatsList.darkAttack + this._specialEquip.modelEquipement.metaStatsList.darkAttack;
      }
   }
}

