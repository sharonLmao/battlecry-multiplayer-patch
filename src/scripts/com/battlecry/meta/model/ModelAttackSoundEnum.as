package com.battlecry.meta.model
{
   import com.battlecry.factories.BC_SfxFactory;
   
   public class ModelAttackSoundEnum
   {
      
      private static var _id:int = 0;
      
      public static var ATTACKSOUND_NULL:ModelAttackSound = new ModelAttackSound(-1,-1,-1,-1);
      
      public static var ALL:Vector.<ModelAttackSound> = new Vector.<ModelAttackSound>();
      
      public static var BOW:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_BOW,5,BC_SfxFactory.ID_SFX_BOWHIT);
      
      public static var MUSKET:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_MUSKET,5,-1);
      
      public static var PISTOL:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_MUSKET,13,-1);
      
      public static var BALISTA:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_BALLISTASHOOT,5,BC_SfxFactory.ID_SFX_BLAZINGSTAFF);
      
      public static var CATAPULT:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_CATAPULT,5,BC_SfxFactory.ID_SFX_BLAZINGSTAFF);
      
      public static var CANNON:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_CANNON,7,BC_SfxFactory.ID_SFX_BLAZINGSTAFF);
      
      public static var GIANTFLAMER:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_GIANTFLAMER,1,-1);
      
      public static var BEHEMOT:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_BEHEMOTHATTACK,1,-1);
      
      public static var POISON_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_SPELLPROJECTILE,2,BC_SfxFactory.ID_SFX_ACIDRAINSTAFF);
      
      public static var FIRE_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_SPELLPROJECTILE,2,BC_SfxFactory.ID_SFX_BLAZINGSTAFF);
      
      public static var ICE_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_SPELLPROJECTILE,2,BC_SfxFactory.ID_SFX_ICESTORM);
      
      public static var THUNDER_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_SPELLPROJECTILE,2,BC_SfxFactory.ID_SFX_LIGHTNINGSTAFF);
      
      public static var DARK_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_SPELLPROJECTILE,2,BC_SfxFactory.ID_SFX_DARK);
      
      public static var HOLY_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_SPELLPROJECTILE,2,BC_SfxFactory.ID_SFX_HOLYBALL);
      
      public static var FIREBLAST_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_FIREBLASTSTAFF,2,-1);
      
      public static var BLAZING_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_BLAZINGSTAFF,2,-1);
      
      public static var ICESTORM_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_ICESTORM,2,-1);
      
      public static var FROSTBITE_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_FROSTBITESTAFF,2,-1);
      
      public static var ACIDRAIN_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_ACIDRAINSTAFF,2,-1);
      
      public static var PLAGUE_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_ACIDRAINSTAFF,2,-1);
      
      public static var LIGHTNING_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_LIGHTNINGSTAFF,2,-1);
      
      public static var THUNDERSTORM_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_THUNDERSTORMSTAFF,2,-1);
      
      public static var ANGELIC_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_IMARAIL,2,-1);
      
      public static var DEMONIC_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_ZAMAROTH,2,-1);
      
      public static var YASUR_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_YASURSTAFF,2,-1);
      
      public static var XONAX_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_XONAXSTAFF,2,-1);
      
      public static var SOLAR_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_SOLARSTAFF,2,-1);
      
      public static var ARMAGEDDON_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_ARMAGEDDONSTAFF,2,-1);
      
      public static var OKKORAZ_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_OKKORAZ,2,-1);
      
      public static var ORYTH_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_ZAMAROTH,2,-1);
      
      public static var VASSPOTANAX_STAFF:ModelAttackSound = CreateModelAttackSound(_id++,BC_SfxFactory.ID_SFX_VASSPOTANAXSTAFF,2,-1);
      
      public function ModelAttackSoundEnum()
      {
         super();
      }
      
      private static function CreateModelAttackSound(id1:int, initialSound1:int, frameOfInitialSound1:int, finalSound1:int) : ModelAttackSound
      {
         var m:ModelAttackSound = new ModelAttackSound(id1,initialSound1,frameOfInitialSound1,finalSound1);
         ALL.push(m);
         return m;
      }
      
      public static function GetFromId(id:int) : ModelAttackSound
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            if(id == ALL[i].id)
            {
               return ALL[i];
            }
         }
         return ATTACKSOUND_NULL;
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
   }
}

