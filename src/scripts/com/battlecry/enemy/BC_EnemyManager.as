package com.battlecry.enemy
{
   import com.battlecry.actor.BC_Actor;
   import com.battlecry.battle.GridPos;
   import com.battlecry.constants.MiscConstants;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.BC_MetaActor;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.BC_MetaFactory;
   import com.battlecry.meta.BC_MetaManager;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.MetaPlayerEquipement;
   import com.battlecry.meta.MetaSquadSpeed;
   import com.battlecry.meta.model.ModelAnimEnum;
   import com.battlecry.meta.model.ModelEquipementEnum;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.enemy.EnemyFactory;
   import com.lachhhEngine.games.enemy.EnemyManager;
   import com.lachhhEngine.games.physique.Actor;
   
   public class BC_EnemyManager extends EnemyManager
   {
      
      public static var id:int = 0;
      
      public function BC_EnemyManager(context:Game, enemyFactory:EnemyFactory)
      {
         super(context,enemyFactory);
      }
      
      public static function getNextId() : int
      {
         return ++id;
      }
      
      public static function UpdateId() : void
      {
         var metaArmy:BC_MetaArmy = null;
         var v:Vector.<BC_MetaUnit> = null;
         var i:int = 0;
         for(var j:int = 1; j < 5; j++)
         {
            metaArmy = BC_GameProgress.gameProgess.getArmy(j);
            v = metaArmy.unitInventory;
            for(i = 0; i < v.length; i++)
            {
               if(v[i].id > id)
               {
                  id = v[i].id;
               }
            }
         }
      }
      
      public function GetNearestEnemy(x:int, y:int) : Actor
      {
         var minEnemy:Actor = null;
         var crntEnemy:Actor = null;
         var dx:int = 0;
         var dy:int = 0;
         var crntDist:int = 0;
         var minDist:int = int.MAX_VALUE;
         for(var i:int = 0; i < activeFactoryObjects.length; i++)
         {
            crntEnemy = Actor(activeFactoryObjects[i]);
            dx = crntEnemy.px - x;
            dy = crntEnemy.py - y;
            crntDist = dx * dx + dy * dy;
            if(crntDist < minDist)
            {
               minEnemy = crntEnemy;
               minDist = crntDist;
            }
         }
         return minEnemy;
      }
      
      public function KillMyUnits() : void
      {
         var lenght:int = int(activeFactoryObjects.length);
         for(var i:int = lenght - 1; i >= 0; i--)
         {
            if((activeFactoryObjects[i] as BC_Actor).teamId == MiscConstants.TEAM1)
            {
               (activeFactoryObjects[i] as BC_Actor).AfterDead();
            }
         }
      }
      
      public function KillEnemyUnits() : void
      {
         var lenght:int = int(activeFactoryObjects.length);
         for(var i:int = lenght - 1; i >= 0; i--)
         {
            if((activeFactoryObjects[i] as BC_Actor).teamId == MiscConstants.TEAM2)
            {
               (activeFactoryObjects[i] as BC_Actor).AfterDead();
            }
         }
      }
      
      public function KillAllUnit() : void
      {
         var lenght:int = int(activeFactoryObjects.length);
         for(var i:int = lenght - 1; i >= 0; i--)
         {
            (activeFactoryObjects[i] as BC_Actor).AfterDead();
         }
      }
      
      public function CreateMetaDemon() : BC_MetaUnit
      {
         var metaUnit:BC_MetaUnit = new BC_MetaUnit(0);
         metaUnit.playerEquipement = new MetaPlayerEquipement(new MetaEquipement(0,ModelEquipementEnum.CREATURE_DEMON),new MetaEquipement(0,ModelEquipementEnum.WEAPON_PYROBLADE),new MetaEquipement(0,ModelEquipementEnum.SHIELD_BAXSHIELD),new MetaEquipement(0,ModelEquipementEnum.ARMOR_CORRUPTEDMAIL),new MetaEquipement(0,ModelEquipementEnum.SPECIAL_CULTISTHANDRELIC));
         metaUnit.modelAnim = ModelAnimEnum.ANIM_1HANDEDWEAPON;
         return metaUnit;
      }
      
      public function CreateMetaActor(instanceType:int, x:int, y:int, vx:int, vy:int, squadId:int, teamId:int, metaUnit:BC_MetaUnit, speed:MetaSquadSpeed) : BC_MetaActor
      {
         var j:int = 0;
         var metaActor:BC_MetaActor = BC_MetaManager.typedInstance.CreateCustomMetaMKActor(BC_MetaFactory.ID_META_MK_ACTOR,instanceType,x,y,vx,vy,context.teamFactory.ALLY1_TEAM,context.teamFactory.ENEMY1_TEAM,context.actionLayer.metaLayer,squadId,teamId,metaUnit);
         metaActor.metaUnit.speed = speed;
         metaActor.range = metaUnit.playerEquipement.Range;
         metaActor.chargeupTime = metaUnit.playerEquipement.reloadTime;
         for(var i:int = 0; i < metaActor.metaUnit.playerEquipement.hauteur; i++)
         {
            for(j = 0; j < metaActor.metaUnit.playerEquipement.largeur; j++)
            {
               if(!(i == 0 && j == 0))
               {
                  metaActor.supGridCase.push(new GridPos(j,i));
               }
            }
         }
         return metaActor;
      }
      
      public function CreateMetaUnitNull() : BC_MetaUnit
      {
         var metaUnit:BC_MetaUnit = new BC_MetaUnit(-1);
         metaUnit.modelAnim = ModelAnimEnum.ANIMATION_NULL;
         return metaUnit;
      }
      
      public function CreateMetaImmortalWarrior() : BC_MetaUnit
      {
         var metaUnit:BC_MetaUnit = new BC_MetaUnit(0);
         metaUnit.playerEquipement = new MetaPlayerEquipement(new MetaEquipement(0,ModelEquipementEnum.CREATURE_UNDEAD),new MetaEquipement(0,ModelEquipementEnum.WEAPON_IRONSWORD),new MetaEquipement(0,ModelEquipementEnum.EQUIPEMENT_NULL),new MetaEquipement(0,ModelEquipementEnum.ARMOR_IMMORTALARMOR),new MetaEquipement(0,ModelEquipementEnum.EQUIPEMENT_NULL));
         metaUnit.modelAnim = ModelAnimEnum.ANIM_1HANDEDWEAPON;
         return metaUnit;
      }
      
      public function CreateMetaSkeleton() : BC_MetaUnit
      {
         var metaUnit:BC_MetaUnit = new BC_MetaUnit(0);
         metaUnit.playerEquipement = new MetaPlayerEquipement(new MetaEquipement(0,ModelEquipementEnum.CREATURE_UNDEAD),new MetaEquipement(0,ModelEquipementEnum.WEAPON_IRONSWORD),new MetaEquipement(0,ModelEquipementEnum.EQUIPEMENT_NULL),new MetaEquipement(0,ModelEquipementEnum.EQUIPEMENT_NULL),new MetaEquipement(0,ModelEquipementEnum.EQUIPEMENT_NULL));
         metaUnit.modelAnim = ModelAnimEnum.ANIM_1HANDEDWEAPON;
         return metaUnit;
      }
      
      public function CreateUnit(metaActor:BC_MetaActor) : BC_Actor
      {
         return CreateActor(metaActor) as BC_Actor;
      }
   }
}

