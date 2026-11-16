package com.battlecry.factories
{
   import com.battlecry.exported.MUSIC_INGAME_1;
   import com.battlecry.exported.MUSIC_INGAME_2;
   import com.battlecry.exported.MUSIC_INGAME_3;
   import com.battlecry.exported.MUSIC_INGAME_4;
   import com.battlecry.exported.MUSIC_INTERFACES;
   import com.battlecry.exported.MUSIC_UI_ARMY;
   import com.battlecry.exported.SFX_ACIDRAINSTAFF;
   import com.battlecry.exported.SFX_ARMAGEDDONSTAFF;
   import com.battlecry.exported.SFX_ARMYWALK;
   import com.battlecry.exported.SFX_AZARATIUSAXE;
   import com.battlecry.exported.SFX_BALLISTASHOOT;
   import com.battlecry.exported.SFX_BEHEMOTHATTACK;
   import com.battlecry.exported.SFX_BEHEMOTHMOVE;
   import com.battlecry.exported.SFX_BLAZINGSTAFF;
   import com.battlecry.exported.SFX_BOLTHAMMER;
   import com.battlecry.exported.SFX_BOW;
   import com.battlecry.exported.SFX_BOWHIT;
   import com.battlecry.exported.SFX_CANNON;
   import com.battlecry.exported.SFX_CASH;
   import com.battlecry.exported.SFX_CATAPULT;
   import com.battlecry.exported.SFX_DARK;
   import com.battlecry.exported.SFX_EQUIPITEM;
   import com.battlecry.exported.SFX_FIREBLASTSTAFF;
   import com.battlecry.exported.SFX_FROSTAXE;
   import com.battlecry.exported.SFX_FROSTBITESTAFF;
   import com.battlecry.exported.SFX_GIANTFLAMER;
   import com.battlecry.exported.SFX_HOLYBALL;
   import com.battlecry.exported.SFX_HORSEWALK;
   import com.battlecry.exported.SFX_ICESTORM;
   import com.battlecry.exported.SFX_IMARAIL;
   import com.battlecry.exported.SFX_IMPACT1;
   import com.battlecry.exported.SFX_IMPACT2;
   import com.battlecry.exported.SFX_IMPACT3;
   import com.battlecry.exported.SFX_IMPACT4;
   import com.battlecry.exported.SFX_KAMIKAZE_EXPLOSION;
   import com.battlecry.exported.SFX_LETTER;
   import com.battlecry.exported.SFX_LIGHTNINGSTAFF;
   import com.battlecry.exported.SFX_LIGHTNINGSTAFF_2;
   import com.battlecry.exported.SFX_MELEELOOP;
   import com.battlecry.exported.SFX_MUSKET;
   import com.battlecry.exported.SFX_OKKORAZ;
   import com.battlecry.exported.SFX_ONCLICK;
   import com.battlecry.exported.SFX_PISTOL;
   import com.battlecry.exported.SFX_PLAGUESPIKE;
   import com.battlecry.exported.SFX_PUNCH;
   import com.battlecry.exported.SFX_PUNCH1;
   import com.battlecry.exported.SFX_PYROBLADE;
   import com.battlecry.exported.SFX_ROLLOVER;
   import com.battlecry.exported.SFX_SHIELDIMPACT;
   import com.battlecry.exported.SFX_SHIELDIMPACT1;
   import com.battlecry.exported.SFX_SOLARSTAFF;
   import com.battlecry.exported.SFX_SPELLPROJECTILE;
   import com.battlecry.exported.SFX_STEAMCHARIOTATTACK;
   import com.battlecry.exported.SFX_THUNDERSTORMSTAFF;
   import com.battlecry.exported.SFX_UNTMORI;
   import com.battlecry.exported.SFX_VASSPOTANAXSTAFF;
   import com.battlecry.exported.SFX_WARMACHINEMOVE;
   import com.battlecry.exported.SFX_XONAXSTAFF;
   import com.battlecry.exported.SFX_YASURSTAFF;
   import com.battlecry.exported.SFX_ZAMAROTH;
   import com.battlecry.exported.STINGER_LOSE;
   import com.battlecry.exported.STINGER_WIN;
   import com.lachhhEngine.games.factory.SfxFactory;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaSound2D;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.games.sfx.Sound2D;
   import com.lachhhEngine.utils.Utils;
   
   public class BC_SfxFactory extends SfxFactory
   {
      
      public static var ID_SFX_ARMAGEDDONSTAFF:int;
      
      public static var ID_SFX_FROSTAXE:int;
      
      public static var ID_MUSIC_UI_ARMY:int;
      
      public static var ID_STINGER_WIN:int;
      
      public static var ID_SFX_ROLLOVER:int;
      
      public static var ID_SFX_ACIDRAINSTAFF:int;
      
      public static var ID_SFX_LIGHTNINGSTAFF:int;
      
      public static var ID_SFX_HOLYBALL:int;
      
      public static var ID_SFX_ARMYWALK:int;
      
      public static var ID_SFX_BEHEMOTHMOVE:int;
      
      public static var ID_SFX_ZAMAROTH:int;
      
      public static var ID_SFX_SHIELDIMPACT:int;
      
      public static var ID_MUSIC_INGAME_1:int;
      
      public static var ID_MUSIC_INGAME_3:int;
      
      public static var ID_SFX_PYROBLADE:int;
      
      public static var ID_SFX_PISTOL:int;
      
      public static var ID_MUSIC_INGAME_2:int;
      
      public static var ID_MUSIC_INGAME_4:int;
      
      public static var ID_SFX_AZARATIUSAXE:int;
      
      public static var ID_SFX_BOWHIT:int;
      
      public static var ID_STINGER_LOSE:int;
      
      public static var ID_SFX_CATAPULT:int;
      
      public static var ID_SFX_BOLTHAMMER:int;
      
      public static var ID_SFX_FIREBLASTSTAFF:int;
      
      public static var ID_SFX_YASURSTAFF:int;
      
      public static var ID_SFX_FROSTBITESTAFF:int;
      
      public static var ID_SFX_MUSKET:int;
      
      public static var ID_SFX_WARMACHINEMOVE:int;
      
      public static var ID_SFX_CASH:int;
      
      public static var ID_MUSIC_INTERFACES:int;
      
      public static var ID_SFX_MELEELOOP:int;
      
      public static var ID_SFX_ICESTORM:int;
      
      public static var ID_SFX_SOLARSTAFF:int;
      
      public static var ID_SFX_BLAZINGSTAFF:int;
      
      public static var ID_SFX_GIANTFLAMER:int;
      
      public static var ID_SFX_HORSEWALK:int;
      
      public static var ID_SFX_VASSPOTANAXSTAFF:int;
      
      public static var ID_SFX_XONAXSTAFF:int;
      
      public static var ID_SFX_BEHEMOTHATTACK:int;
      
      public static var ID_SFX_PUNCH:int;
      
      public static var ID_SFX_PUNCH1:int;
      
      public static var ID_SFX_SHIELDIMPACT1:int;
      
      public static var ID_SFX_EQUIPITEM:int;
      
      public static var ID_SFX_BALLISTASHOOT:int;
      
      public static var ID_SFX_IMPACT1:int;
      
      public static var ID_SFX_STEAMCHARIOTATTACK:int;
      
      public static var ID_SFX_IMPACT3:int;
      
      public static var ID_SFX_IMPACT4:int;
      
      public static var ID_SFX_IMARAIL:int;
      
      public static var ID_SFX_BOW:int;
      
      public static var ID_SFX_DARK:int;
      
      public static var ID_SFX_IMPACT2:int;
      
      public static var ID_SFX_UNTMORI:int;
      
      public static var ID_SFX_CANNON:int;
      
      public static var ID_SFX_LIGHTNINGSTAFF_2:int;
      
      public static var ID_SFX_OKKORAZ:int;
      
      public static var ID_SFX_THUNDERSTORMSTAFF:int;
      
      public static var ID_SFX_LETTER:int;
      
      public static var ID_SFX_KAMIKAZE_EXPLOSION:int;
      
      public static var ID_SFX_ONCLICK:int;
      
      public static var ID_SFX_SPELLPROJECTILE:int;
      
      private static var _instance:BC_SfxFactory;
      
      public static var ID_SFX_PLAGUESPIKE:int;
      
      public static var ImpactSound:Array = new Array();
      
      public static var ShieldImpactSound:Array = new Array();
      
      public static var PunchImpact:Array = new Array();
      
      public function BC_SfxFactory()
      {
         super();
         if(_instance != null)
         {
            throw new Error("instance already created");
         }
         _instance = this;
         ID_SFX_ONCLICK = PushClassLink(SFX_ONCLICK);
         ID_SFX_ROLLOVER = PushClassLink(SFX_ROLLOVER);
         ID_SFX_EQUIPITEM = PushClassLink(SFX_EQUIPITEM);
         ID_SFX_CASH = PushClassLink(SFX_CASH);
         ID_SFX_LETTER = PushClassLink(SFX_LETTER);
         ID_MUSIC_INGAME_1 = PushClassLink(MUSIC_INGAME_1);
         ID_MUSIC_INGAME_2 = PushClassLink(MUSIC_INGAME_2);
         ID_MUSIC_INGAME_3 = PushClassLink(MUSIC_INGAME_3);
         ID_MUSIC_INGAME_4 = PushClassLink(MUSIC_INGAME_4);
         ID_MUSIC_INTERFACES = PushClassLink(MUSIC_INTERFACES);
         ID_MUSIC_UI_ARMY = PushClassLink(MUSIC_UI_ARMY);
         ID_STINGER_LOSE = PushClassLink(STINGER_LOSE);
         ID_STINGER_WIN = PushClassLink(STINGER_WIN);
         ID_SFX_ICESTORM = PushClassLink(SFX_ICESTORM);
         ID_SFX_IMARAIL = PushClassLink(SFX_IMARAIL);
         ID_SFX_LIGHTNINGSTAFF = PushClassLink(SFX_LIGHTNINGSTAFF);
         ID_SFX_LIGHTNINGSTAFF_2 = PushClassLink(SFX_LIGHTNINGSTAFF_2);
         ID_SFX_OKKORAZ = PushClassLink(SFX_OKKORAZ);
         ID_SFX_SOLARSTAFF = PushClassLink(SFX_SOLARSTAFF);
         ID_SFX_THUNDERSTORMSTAFF = PushClassLink(SFX_THUNDERSTORMSTAFF);
         ID_SFX_VASSPOTANAXSTAFF = PushClassLink(SFX_VASSPOTANAXSTAFF);
         ID_SFX_XONAXSTAFF = PushClassLink(SFX_XONAXSTAFF);
         ID_SFX_YASURSTAFF = PushClassLink(SFX_YASURSTAFF);
         ID_SFX_ZAMAROTH = PushClassLink(SFX_ZAMAROTH);
         ID_SFX_ACIDRAINSTAFF = PushClassLink(SFX_ACIDRAINSTAFF);
         ID_SFX_ARMAGEDDONSTAFF = PushClassLink(SFX_ARMAGEDDONSTAFF);
         ID_SFX_AZARATIUSAXE = PushClassLink(SFX_AZARATIUSAXE);
         ID_SFX_BLAZINGSTAFF = PushClassLink(SFX_BLAZINGSTAFF);
         ID_SFX_FIREBLASTSTAFF = PushClassLink(SFX_FIREBLASTSTAFF);
         ID_SFX_FROSTBITESTAFF = PushClassLink(SFX_FROSTBITESTAFF);
         ID_SFX_HOLYBALL = PushClassLink(SFX_HOLYBALL);
         ID_SFX_DARK = PushClassLink(SFX_DARK);
         ID_SFX_SPELLPROJECTILE = PushClassLink(SFX_SPELLPROJECTILE);
         ID_SFX_BOW = PushClassLink(SFX_BOW);
         ID_SFX_BOWHIT = PushClassLink(SFX_BOWHIT);
         ID_SFX_PISTOL = PushClassLink(SFX_PISTOL);
         ID_SFX_MUSKET = PushClassLink(SFX_MUSKET);
         ID_SFX_ARMYWALK = PushClassLink(SFX_ARMYWALK);
         ID_SFX_HORSEWALK = PushClassLink(SFX_HORSEWALK);
         ID_SFX_MELEELOOP = PushClassLink(SFX_MELEELOOP);
         ID_SFX_IMPACT1 = PushClassLink(SFX_IMPACT1);
         ID_SFX_IMPACT2 = PushClassLink(SFX_IMPACT2);
         ID_SFX_IMPACT3 = PushClassLink(SFX_IMPACT3);
         ID_SFX_IMPACT4 = PushClassLink(SFX_IMPACT4);
         ID_SFX_SHIELDIMPACT = PushClassLink(SFX_SHIELDIMPACT);
         ID_SFX_SHIELDIMPACT1 = PushClassLink(SFX_SHIELDIMPACT1);
         ID_SFX_PUNCH = PushClassLink(SFX_PUNCH);
         ID_SFX_PUNCH1 = PushClassLink(SFX_PUNCH1);
         ID_SFX_KAMIKAZE_EXPLOSION = PushClassLink(SFX_KAMIKAZE_EXPLOSION);
         ID_SFX_PLAGUESPIKE = PushClassLink(SFX_PLAGUESPIKE);
         ID_SFX_PYROBLADE = PushClassLink(SFX_PYROBLADE);
         ID_SFX_BOLTHAMMER = PushClassLink(SFX_BOLTHAMMER);
         ID_SFX_FROSTAXE = PushClassLink(SFX_FROSTAXE);
         ID_SFX_UNTMORI = PushClassLink(SFX_UNTMORI);
         ID_SFX_STEAMCHARIOTATTACK = PushClassLink(SFX_STEAMCHARIOTATTACK);
         ID_SFX_WARMACHINEMOVE = PushClassLink(SFX_WARMACHINEMOVE);
         ID_SFX_BALLISTASHOOT = PushClassLink(SFX_BALLISTASHOOT);
         ID_SFX_BEHEMOTHATTACK = PushClassLink(SFX_BEHEMOTHATTACK);
         ID_SFX_BEHEMOTHMOVE = PushClassLink(SFX_BEHEMOTHMOVE);
         ID_SFX_CANNON = PushClassLink(SFX_CANNON);
         ID_SFX_CATAPULT = PushClassLink(SFX_CATAPULT);
         ID_SFX_GIANTFLAMER = PushClassLink(SFX_GIANTFLAMER);
         ImpactSound.push(ID_SFX_IMPACT1,ID_SFX_IMPACT2,ID_SFX_IMPACT3,ID_SFX_IMPACT4);
         ShieldImpactSound.push(ID_SFX_IMPACT1,ID_SFX_IMPACT2,ID_SFX_IMPACT3,ID_SFX_IMPACT4,ID_SFX_SHIELDIMPACT,ID_SFX_SHIELDIMPACT1);
         PunchImpact.push(ID_SFX_PUNCH,ID_SFX_PUNCH1);
      }
      
      public static function getRandomMusic() : int
      {
         var a:Array = new Array(ID_MUSIC_INGAME_1,ID_MUSIC_INGAME_2,ID_MUSIC_INGAME_3,ID_MUSIC_INGAME_4);
         return Utils.PickRandomIn(a) as int;
      }
      
      public static function PlayMeleeSound() : void
      {
      }
      
      public static function PlaySoundLimitedToOnePerFrame(idSfx:int, perFrame:int) : Sound2D
      {
         var result:Sound2D = null;
         var metaSound:MetaSound2D = MetaManager.instance.CreateMetaSound2D(idSfx);
         metaSound.limitToAddPerFrame = perFrame;
         result = Jukebox.instance.PlaySoundFromMeta(metaSound);
         if(result == null)
         {
            MetaManager.instance.DestroyMetaData(metaSound);
         }
         return result;
      }
      
      public static function get instance() : BC_SfxFactory
      {
         return _instance;
      }
      
      override public function get uiOkSoundId() : int
      {
         return ID_SFX_ONCLICK;
      }
      
      override public function get uiRollOverSoundId() : int
      {
         return ID_SFX_ROLLOVER;
      }
   }
}

