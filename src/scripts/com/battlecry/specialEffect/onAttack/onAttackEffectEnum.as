package com.battlecry.specialEffect.onAttack
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.meta.model.ModelAttack;
   import com.battlecry.meta.model.ModelAttackEnum;
   
   public class onAttackEffectEnum
   {
      
      private static var _id:int = 0;
      
      public static var EFFECT_NULL:onAttackEffect = new onAttackEffect(-1,0,-1,ModelAttackEnum.ATTACK_NULL,null,-1);
      
      public static var ALL:Vector.<onAttackEffect> = new Vector.<onAttackEffect>();
      
      public static var PYRO_BLADE:onAttackEffect = CreateOnAttackEffect(_id++,2,BC_AnimationFactory.ID_FX_PYROBLADE,ModelAttackEnum.ONATTACKLINE,new MetaStatsList(0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),BC_SfxFactory.ID_SFX_FIREBLASTSTAFF);
      
      public static var BOLT_HAMMER:onAttackEffect = CreateOnAttackEffect(_id++,2,BC_AnimationFactory.ID_FX_BOLTHAMMER,ModelAttackEnum.ONATTACKLINE,new MetaStatsList(0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0),BC_SfxFactory.ID_SFX_LIGHTNINGSTAFF);
      
      public static var PLAGUE_SPIKE:onAttackEffect = CreateOnAttackEffect(_id++,2,BC_AnimationFactory.ID_FX_PLAGUESPIKE,ModelAttackEnum.ONATTACKLINE,new MetaStatsList(0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0),BC_SfxFactory.ID_SFX_ACIDRAINSTAFF);
      
      public static var FROST_AXE:onAttackEffect = CreateOnAttackEffect(_id++,2,BC_AnimationFactory.ID_FX_FROSTAXE,ModelAttackEnum.ONATTACKLINE,new MetaStatsList(0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0),BC_SfxFactory.ID_SFX_FROSTBITESTAFF);
      
      public static var OKKORAZHAMMER:onAttackEffect = CreateOnAttackEffect(_id++,2,BC_AnimationFactory.ID_FX_LIGHTNINGBALL_EXPLODE,ModelAttackEnum.CASTAOEMELEE,new MetaStatsList(0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0),BC_SfxFactory.ID_SFX_LIGHTNINGSTAFF);
      
      public static var BATTLE_HAMMER:onAttackEffect = CreateOnAttackEffect(_id++,0,BC_AnimationFactory.ID_FX_BOLTHAMMER,ModelAttackEnum.BATTLE_HAMMER,new MetaStatsList(0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0),BC_SfxFactory.ID_SFX_LIGHTNINGSTAFF);
      
      public function onAttackEffectEnum()
      {
         super();
      }
      
      private static function CreateOnAttackEffect(id:int, waitingTime:int, effectID:int, modelAttack:ModelAttack, dmgList:MetaStatsList, sfxId:int) : onAttackEffect
      {
         var c:onAttackEffect = new onAttackEffect(id,waitingTime,effectID,modelAttack,dmgList,sfxId);
         ALL.push(c);
         return c;
      }
      
      public static function Reset() : void
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            ALL[i].Reset();
         }
      }
      
      public static function GetFromId(id:int) : onAttackEffect
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            if(id == ALL[i].id)
            {
               return ALL[i];
            }
         }
         return EFFECT_NULL;
      }
   }
}

