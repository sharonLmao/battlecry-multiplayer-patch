package com.battlecry.meta.model
{
   import com.battlecry.factories.BC_AnimationFactory;
   
   public class ModelAnimEnum
   {
      
      private static var _id:int = 0;
      
      public static var ANIMATION_NULL:ModelAnim = new ModelAnim(-1,-1,-1,-1,-1,-1,-1,-1,-1,Vector.<int>([-1]),-1,-1);
      
      public static var ALL:Vector.<ModelAnim> = new Vector.<ModelAnim>();
      
      public static var ANIM_1HANDEDWEAPON:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON,BC_AnimationFactory.ID_RUN_1HANDEDWEAPON,BC_AnimationFactory.ID_DIE,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON,Vector.<int>([BC_AnimationFactory.ID_ATTACK_1HANDEDWEAPON_01,BC_AnimationFactory.ID_ATTACK_1HANDEDWEAPON_02,BC_AnimationFactory.ID_ATTACK_1HANDEDWEAPON_03]),BC_AnimationFactory.ID_WALKATTACK_1HANDEDWEAPON,BC_AnimationFactory.ID_DASHATTACK_1HANDEDWEAPON);
      
      public static var ANIM_1HANDEDWEAPON_HORSE:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_DIE_HORSE,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,Vector.<int>([BC_AnimationFactory.ID_ATTACK_1HANDEDWEAPON_HORSE]),BC_AnimationFactory.ID_WALKATTACK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALKATTACK_1HANDEDWEAPON_HORSE);
      
      public static var ANIM_1HANDEDWEAPON_BOAR:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_DIE_BOAR,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,Vector.<int>([BC_AnimationFactory.ID_ATTACK_1HANDEDWEAPON_BOAR]),BC_AnimationFactory.ID_WALKATTACK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALKATTACK_1HANDEDWEAPON_BOAR);
      
      public static var ANIM_2HANDEDWEAPON:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_2HANDEDWEAPON,BC_AnimationFactory.ID_WALK_2HANDEDWEAPON,BC_AnimationFactory.ID_RUN_2HANDEDWEAPON,BC_AnimationFactory.ID_DIE,BC_AnimationFactory.ID_IDLE_2HANDEDWEAPON,BC_AnimationFactory.ID_WALK_2HANDEDWEAPON,BC_AnimationFactory.ID_IDLE_2HANDEDWEAPON,BC_AnimationFactory.ID_WALK_2HANDEDWEAPON,Vector.<int>([BC_AnimationFactory.ID_ATTACK_2HANDEDWEAPON_01,BC_AnimationFactory.ID_ATTACK_2HANDEDWEAPON_02,BC_AnimationFactory.ID_ATTACK_2HANDEDWEAPON_03]),BC_AnimationFactory.ID_WALKATTACK_2HANDEDWEAPON,BC_AnimationFactory.ID_DASHATTACK_2HANDEDWEAPON);
      
      public static var ANIM_2HANDEDWEAPON_HORSE:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_DIE_HORSE,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,Vector.<int>([BC_AnimationFactory.ID_ATTACK_2HANDEDWEAPON_HORSE]),BC_AnimationFactory.ID_WALKATTACK_2HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALKATTACK_2HANDEDWEAPON_HORSE);
      
      public static var ANIM_2HANDEDWEAPON_BOAR:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_DIE_BOAR,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,Vector.<int>([BC_AnimationFactory.ID_ATTACK_2HANDEDWEAPON_BOAR]),BC_AnimationFactory.ID_WALKATTACK_2HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALKATTACK_2HANDEDWEAPON_BOAR);
      
      public static var ANIM_BOW:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_BOW,BC_AnimationFactory.ID_WALK_BOW,BC_AnimationFactory.ID_RUN_BOW,BC_AnimationFactory.ID_DIE,BC_AnimationFactory.ID_AIM_BOW,BC_AnimationFactory.ID_WALKAIM_BOW,BC_AnimationFactory.ID_IDLERELOAD_BOW,BC_AnimationFactory.ID_WALKRELOAD_BOW,Vector.<int>([BC_AnimationFactory.ID_ATTACK_BOW]),BC_AnimationFactory.ID_WALKATTACK_BOW,BC_AnimationFactory.ID_WALKATTACK_BOW);
      
      public static var ANIM_BOW_HORSE:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_BOW_HORSE,BC_AnimationFactory.ID_WALK_BOW_HORSE,BC_AnimationFactory.ID_WALK_BOW_HORSE,BC_AnimationFactory.ID_DIE_HORSE,BC_AnimationFactory.ID_AIM_BOW_HORSE,BC_AnimationFactory.ID_WALKAIM_BOW_HORSE,BC_AnimationFactory.ID_IDLERELOAD_BOW_HORSE,BC_AnimationFactory.ID_WALKRELOAD_BOW_HORSE,Vector.<int>([BC_AnimationFactory.ID_ATTACK_BOW_HORSE]),BC_AnimationFactory.ID_WALKATTACK_BOW_HORSE,BC_AnimationFactory.ID_WALKATTACK_BOW_HORSE);
      
      public static var ANIM_BOW_BOAR:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_BOW_BOAR,BC_AnimationFactory.ID_WALK_BOW_BOAR,BC_AnimationFactory.ID_WALK_BOW_BOAR,BC_AnimationFactory.ID_DIE_BOAR,BC_AnimationFactory.ID_AIM_BOW_BOAR,BC_AnimationFactory.ID_WALKAIM_BOW_BOAR,BC_AnimationFactory.ID_IDLERELOAD_BOW_BOAR,BC_AnimationFactory.ID_WALKRELOAD_BOW_BOAR,Vector.<int>([BC_AnimationFactory.ID_ATTACK_BOW_BOAR]),BC_AnimationFactory.ID_WALKATTACK_BOW_BOAR,BC_AnimationFactory.ID_WALKATTACK_BOW_BOAR);
      
      public static var ANIM_STAFF:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_SPEAR,BC_AnimationFactory.ID_WALK_SPEAR,BC_AnimationFactory.ID_RUN_SPEAR,BC_AnimationFactory.ID_DIE,BC_AnimationFactory.ID_IDLE_GATHERMAGIC,BC_AnimationFactory.ID_WALK_GATHERMAGIC,BC_AnimationFactory.ID_IDLE_GATHERMAGIC,BC_AnimationFactory.ID_WALK_GATHERMAGIC,Vector.<int>([BC_AnimationFactory.ID_ATTACK_MAGIC]),BC_AnimationFactory.ID_ATTACK_MAGIC,BC_AnimationFactory.ID_ATTACK_MAGIC);
      
      public static var ANIM_STAFF_HORSE:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_DIE_HORSE,BC_AnimationFactory.ID_IDLE_GATHERMAGIC_HORSE,BC_AnimationFactory.ID_WALK_GATHERMAGIC_HORSE,BC_AnimationFactory.ID_IDLE_GATHERMAGIC_HORSE,BC_AnimationFactory.ID_WALK_GATHERMAGIC_HORSE,Vector.<int>([BC_AnimationFactory.ID_ATTACKIDLE_MAGIC_HORSE]),BC_AnimationFactory.ID_ATTACKWALK_MAGIC_HORSE,BC_AnimationFactory.ID_ATTACKWALK_MAGIC_HORSE);
      
      public static var ANIM_STAFF_BOAR:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_DIE_BOAR,BC_AnimationFactory.ID_IDLE_GATHERMAGIC_BOAR,BC_AnimationFactory.ID_WALK_GATHERMAGIC_BOAR,BC_AnimationFactory.ID_IDLE_GATHERMAGIC_BOAR,BC_AnimationFactory.ID_WALK_GATHERMAGIC_BOAR,Vector.<int>([BC_AnimationFactory.ID_ATTACKIDLE_MAGIC_BOAR]),BC_AnimationFactory.ID_ATTACKWALK_MAGIC_BOAR,BC_AnimationFactory.ID_ATTACKWALK_MAGIC_BOAR);
      
      public static var ANIM_MUSKET:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_MUSKET,BC_AnimationFactory.ID_WALK_MUSKET,BC_AnimationFactory.ID_RUN_MUSKET,BC_AnimationFactory.ID_DIE,BC_AnimationFactory.ID_AIM_MUSKET,BC_AnimationFactory.ID_WALKAIM_MUSKET,BC_AnimationFactory.ID_IDLERELOAD_MUSKET,BC_AnimationFactory.ID_WALKRELOAD_MUSKET,Vector.<int>([BC_AnimationFactory.ID_ATTACK_MUSKET_01,BC_AnimationFactory.ID_ATTACK_MUSKET_02,BC_AnimationFactory.ID_ATTACK_MUSKET_03]),BC_AnimationFactory.ID_WALKATTACK_MUSKET,BC_AnimationFactory.ID_WALKATTACK_MUSKET);
      
      public static var ANIM_MUSKET_HORSE:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_DIE_HORSE,BC_AnimationFactory.ID_AIM_MUSKET_HORSE,BC_AnimationFactory.ID_WALKAIM_MUSKET_HORSE,BC_AnimationFactory.ID_IDLERELOAD_MUSKET_HORSE,BC_AnimationFactory.ID_WALKRELOAD_MUSKET_HORSE,Vector.<int>([BC_AnimationFactory.ID_ATTACK_MUSKET_HORSE]),BC_AnimationFactory.ID_WALKATTACK_MUSKET_HORSE,BC_AnimationFactory.ID_WALKATTACK_MUSKET_HORSE);
      
      public static var ANIM_MUSKET_BOAR:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_DIE_BOAR,BC_AnimationFactory.ID_AIM_MUSKET_BOAR,BC_AnimationFactory.ID_WALKAIM_MUSKET_BOAR,BC_AnimationFactory.ID_IDLERELOAD_MUSKET_BOAR,BC_AnimationFactory.ID_WALKRELOAD_MUSKET_BOAR,Vector.<int>([BC_AnimationFactory.ID_ATTACK_MUSKET_BOAR]),BC_AnimationFactory.ID_WALKATTACK_MUSKET_BOAR,BC_AnimationFactory.ID_WALKATTACK_MUSKET_BOAR);
      
      public static var ANIM_PISTOL:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON,BC_AnimationFactory.ID_RUN_1HANDEDWEAPON,BC_AnimationFactory.ID_DIE,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON,Vector.<int>([BC_AnimationFactory.ID_ATTACK_PISTOL_01,BC_AnimationFactory.ID_ATTACK_PISTOL_02,BC_AnimationFactory.ID_ATTACK_PISTOL_03]),BC_AnimationFactory.ID_WALKATTACK_PISTOL,BC_AnimationFactory.ID_WALKATTACK_PISTOL);
      
      public static var ANIM_PISTOL_HORSE:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_DIE_HORSE,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,Vector.<int>([BC_AnimationFactory.ID_ATTACK_PISTOL_HORSE]),BC_AnimationFactory.ID_WALKATTACK_PISTOL_HORSE,BC_AnimationFactory.ID_WALKATTACK_PISTOL_HORSE);
      
      public static var ANIM_PISTOL_BOAR:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_DIE_BOAR,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,Vector.<int>([BC_AnimationFactory.ID_ATTACK_PISTOL_BOAR]),BC_AnimationFactory.ID_WALKATTACK_PISTOL_BOAR,BC_AnimationFactory.ID_WALKATTACK_PISTOL_BOAR);
      
      public static var ANIM_SPEAR:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_SPEAR,BC_AnimationFactory.ID_WALK_SPEAR,BC_AnimationFactory.ID_RUN_SPEAR,BC_AnimationFactory.ID_DIE,BC_AnimationFactory.ID_IDLE_SPEAR,BC_AnimationFactory.ID_WALK_SPEAR,BC_AnimationFactory.ID_ATTACK_2HANDEDWEAPON_01,BC_AnimationFactory.ID_WALKATTACK_2HANDEDWEAPON,Vector.<int>([BC_AnimationFactory.ID_ATTACK_SPEAR_01,BC_AnimationFactory.ID_ATTACK_SPEAR_02,BC_AnimationFactory.ID_ATTACK_SPEAR_03]),BC_AnimationFactory.ID_WALKATTACK_SPEAR,BC_AnimationFactory.ID_ATTACKDASH_SPEAR);
      
      public static var ANIM_SPEAR_HORSE:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_DIE_HORSE,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_ATTACK_2HANDEDWEAPON_HORSE,BC_AnimationFactory.ID_WALKATTACK_2HANDEDWEAPON_HORSE,Vector.<int>([BC_AnimationFactory.ID_ATTACK_SPEAR_HORSE]),BC_AnimationFactory.ID_WALKATTACK_SPEAR_HORSE,BC_AnimationFactory.ID_WALKATTACK_SPEAR_HORSE);
      
      public static var ANIM_SPEAR_BOAR:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_DIE_BOAR,BC_AnimationFactory.ID_IDLE_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALK_1HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_ATTACK_2HANDEDWEAPON_BOAR,BC_AnimationFactory.ID_WALKATTACK_2HANDEDWEAPON_BOAR,Vector.<int>([BC_AnimationFactory.ID_ATTACK_SPEAR_BOAR]),BC_AnimationFactory.ID_WALKATTACK_SPEAR_BOAR,BC_AnimationFactory.ID_WALKATTACK_SPEAR_BOAR);
      
      public static var ANIM_BALISTA:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_BALISTA,BC_AnimationFactory.ID_WALK_BALISTA,BC_AnimationFactory.ID_WALK_BALISTA,BC_AnimationFactory.ID_DIE_BALISTA,BC_AnimationFactory.ID_IDLE_BALISTA,BC_AnimationFactory.ID_WALK_BALISTA,BC_AnimationFactory.ID_RELOAD_BALISTA,BC_AnimationFactory.ID_WALKRELOAD_BALISTA,Vector.<int>([BC_AnimationFactory.ID_ATTACK_BALISTA]),BC_AnimationFactory.ID_WALKATTACK_BALISTA,BC_AnimationFactory.ID_WALKATTACK_BALISTA);
      
      public static var ANIM_CATAPULT:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_CATAPULT,BC_AnimationFactory.ID_WALK_CATAPULT,BC_AnimationFactory.ID_WALK_CATAPULT,BC_AnimationFactory.ID_DIE_CATAPULT,BC_AnimationFactory.ID_IDLE_CATAPULT,BC_AnimationFactory.ID_WALK_CATAPULT,BC_AnimationFactory.ID_RELOAD_CATAPULT,BC_AnimationFactory.ID_WALKRELOAD_CATAPULT,Vector.<int>([BC_AnimationFactory.ID_ATTACK_CATAPULT]),BC_AnimationFactory.ID_WALKATTACK_CATAPULT,BC_AnimationFactory.ID_WALKATTACK_CATAPULT);
      
      public static var ANIM_CANNON:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_CANNON,BC_AnimationFactory.ID_WALK_CANNON,BC_AnimationFactory.ID_WALK_CANNON,BC_AnimationFactory.ID_DIE_CANNON,BC_AnimationFactory.ID_IDLE_CANNON,BC_AnimationFactory.ID_WALK_CANNON,BC_AnimationFactory.ID_RELOAD_CANNON,BC_AnimationFactory.ID_WALKRELOAD_CANNON,Vector.<int>([BC_AnimationFactory.ID_ATTACK_CANNON]),BC_AnimationFactory.ID_WALKATTACK_CANNON,BC_AnimationFactory.ID_WALKATTACK_CANNON);
      
      public static var ANIM_UNDEADCATAPULT:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_UNDEADCATAPULT,BC_AnimationFactory.ID_WALK_UNDEADCATAPULT,BC_AnimationFactory.ID_WALK_UNDEADCATAPULT,BC_AnimationFactory.ID_DIE_UNDEADCATAPULT,BC_AnimationFactory.ID_IDLE_UNDEADCATAPULT,BC_AnimationFactory.ID_WALK_UNDEADCATAPULT,BC_AnimationFactory.ID_RELOAD_UNDEADCATAPULT,BC_AnimationFactory.ID_WALKRELOAD_UNDEADCATAPULT,Vector.<int>([BC_AnimationFactory.ID_ATTACK_UNDEADCATAPULT]),BC_AnimationFactory.ID_WALKATTACK_UNDEADCATAPULT,BC_AnimationFactory.ID_WALKATTACK_UNDEADCATAPULT);
      
      public static var ANIM_STEAMCHARIOT:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_STEAMCHARIOT,BC_AnimationFactory.ID_WALK_STEAMCHARIOT,BC_AnimationFactory.ID_WALK_STEAMCHARIOT,BC_AnimationFactory.ID_DIE_STEAMCHARIOT,BC_AnimationFactory.ID_IDLE_STEAMCHARIOT,BC_AnimationFactory.ID_WALK_STEAMCHARIOT,BC_AnimationFactory.ID_IDLE_STEAMCHARIOT,BC_AnimationFactory.ID_WALK_STEAMCHARIOT,Vector.<int>([BC_AnimationFactory.ID_WALK_STEAMCHARIOT]),BC_AnimationFactory.ID_WALK_STEAMCHARIOT,BC_AnimationFactory.ID_WALK_STEAMCHARIOT);
      
      public static var ANIM_PLAGUECANNON:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_PLAGUECANNON,BC_AnimationFactory.ID_WALK_PLAGUECANNON,BC_AnimationFactory.ID_WALK_PLAGUECANNON,BC_AnimationFactory.ID_DIE_PLAGUECANNON,BC_AnimationFactory.ID_IDLE_PLAGUECANNON,BC_AnimationFactory.ID_WALK_PLAGUECANNON,BC_AnimationFactory.ID_RELOAD_PLAGUECANNON,BC_AnimationFactory.ID_WALKRELOAD_PLAGUECANNON,Vector.<int>([BC_AnimationFactory.ID_ATTACK_PLAGUECANNON]),BC_AnimationFactory.ID_WALKATTACK_PLAGUECANNON,BC_AnimationFactory.ID_WALKATTACK_PLAGUECANNON);
      
      public static var ANIM_GIANTFLAMER:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_GIANTFLAMER,BC_AnimationFactory.ID_WALK_GIANTFLAMER,BC_AnimationFactory.ID_WALK_GIANTFLAMER,BC_AnimationFactory.ID_DIE_GIANTFLAMER,BC_AnimationFactory.ID_IDLE_GIANTFLAMER,BC_AnimationFactory.ID_WALK_GIANTFLAMER,BC_AnimationFactory.ID_RELOAD_GIANTFLAMER,BC_AnimationFactory.ID_WALKRELOAD_GIANTFLAMER,Vector.<int>([BC_AnimationFactory.ID_ATTACK_GIANTFLAMER]),BC_AnimationFactory.ID_WALKATTACK_GIANTFLAMER,BC_AnimationFactory.ID_WALKATTACK_GIANTFLAMER);
      
      public static var ANIM_STEAMBEHEMOTH:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_STEAMBEHEMOTH,BC_AnimationFactory.ID_WALK_STEAMBEHEMOTH,BC_AnimationFactory.ID_WALK_STEAMBEHEMOTH,BC_AnimationFactory.ID_DIE_STEAMBEHEMOTH,BC_AnimationFactory.ID_IDLE_STEAMBEHEMOTH,BC_AnimationFactory.ID_WALK_STEAMBEHEMOTH,BC_AnimationFactory.ID_IDLE_STEAMBEHEMOTH,BC_AnimationFactory.ID_WALK_STEAMBEHEMOTH,Vector.<int>([BC_AnimationFactory.ID_ATTACK_STEAMBEHEMOTH]),BC_AnimationFactory.ID_WALKATTACK_STEAMBEHEMOTH,BC_AnimationFactory.ID_WALKATTACK_STEAMBEHEMOTH);
      
      public static var ANIM_AUTOCATAPULT:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_AUTOCATAPULT,BC_AnimationFactory.ID_WALK_AUTOCATAPULT,BC_AnimationFactory.ID_WALK_AUTOCATAPULT,BC_AnimationFactory.ID_DIE_AUTOCATAPULT,BC_AnimationFactory.ID_IDLE_AUTOCATAPULT,BC_AnimationFactory.ID_WALK_AUTOCATAPULT,BC_AnimationFactory.ID_RELOAD_AUTOCATAPULT,BC_AnimationFactory.ID_WALKRELOAD_AUTOCATAPULT,Vector.<int>([BC_AnimationFactory.ID_ATTACK_AUTOCATAPULT]),BC_AnimationFactory.ID_WALKATTACK_AUTOCATAPULT,BC_AnimationFactory.ID_WALKATTACK_AUTOCATAPULT);
      
      public static var ANIM_RUSTYCANNON:ModelAnim = CreateModelAnim(_id++,BC_AnimationFactory.ID_IDLE_RUSTYCANNON,BC_AnimationFactory.ID_WALK_RUSTYCANNON,BC_AnimationFactory.ID_WALK_RUSTYCANNON,BC_AnimationFactory.ID_DIE_RUSTYCANNON,BC_AnimationFactory.ID_IDLE_RUSTYCANNON,BC_AnimationFactory.ID_WALK_RUSTYCANNON,BC_AnimationFactory.ID_RELOAD_RUSTYCANNON,BC_AnimationFactory.ID_WALKRELOAD_RUSTYCANNON,Vector.<int>([BC_AnimationFactory.ID_ATTACK_RUSTYCANNON]),BC_AnimationFactory.ID_WALKATTACK_RUSTYCANNON,BC_AnimationFactory.ID_WALKATTACK_RUSTYCANNON);
      
      public function ModelAnimEnum()
      {
         super();
      }
      
      private static function CreateModelAnim(id:int, animIdle:int, animWalkIdle:int, animRunIdle:int, animDie:int, animChargeUpIdle:int, animChargeUpWalk:int, animReloadIdle:int, animReloadWalk:int, animAttack:Vector.<int>, animAttackWalk:int, animAttackDash:int) : ModelAnim
      {
         var m:ModelAnim = new ModelAnim(id,animIdle,animWalkIdle,animRunIdle,animDie,animChargeUpIdle,animChargeUpWalk,animReloadIdle,animReloadWalk,animAttack,animAttackWalk,animAttackDash);
         ALL.push(m);
         return m;
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
      
      public static function GetFromId(id:int) : ModelAnim
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            if(id == ALL[i].id)
            {
               return ALL[i];
            }
         }
         return ANIMATION_NULL;
      }
   }
}

