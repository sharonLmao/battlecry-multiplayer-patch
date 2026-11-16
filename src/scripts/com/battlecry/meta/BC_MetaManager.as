package com.battlecry.meta
{
   import com.battlecry.enemy.BC_EnemyManager;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaFactory;
   import com.lachhhEngine.games.meta.MetaManager;
   import com.lachhhEngine.games.meta.metaObject.MetaLayer;
   
   public class BC_MetaManager extends MetaManager
   {
      
      public function BC_MetaManager(context:Game, metaFactory:MetaFactory)
      {
         super(context,metaFactory);
      }
      
      public static function get typedInstance() : BC_MetaManager
      {
         return BC_MetaManager(instance);
      }
      
      public function CreateMetaMKWeaponCircle() : MetaWeaponCircle
      {
         return MetaWeaponCircle(CreateMetaData(BC_MetaFactory.ID_META_MK_WEAPON_CIRCLE));
      }
      
      public function CreateCustomMetaMKActor(metaDataFactoryId:int, logicInstanceFactoryId:int, px:int, py:int, vx:int, vy:int, team:int, targetTeam:int, metaLayer:MetaLayer, squadId:int, teamId:int, metaUnit:BC_MetaUnit) : BC_MetaActor
      {
         var metaMkActor:BC_MetaActor = BC_MetaActor(CreateMetaData(metaDataFactoryId));
         metaMkActor.instanceType = logicInstanceFactoryId;
         metaMkActor.hp = 0;
         metaMkActor.x = px;
         metaMkActor.y = py;
         metaMkActor.vx = vx;
         metaMkActor.vy = vy;
         metaMkActor.team = team;
         metaMkActor.targetTeam = targetTeam;
         metaMkActor.metaLayer = metaLayer;
         metaMkActor.squadId = squadId;
         metaMkActor.teamId = teamId;
         metaMkActor.metaUnit.Copy(metaUnit);
         return metaMkActor;
      }
      
      public function CreateMetaSquad(squadPos:int, metaArmy:BC_MetaArmy, squadId:int) : BC_MetaSquad
      {
         var metaSquad:BC_MetaSquad = CreateMetaData(BC_MetaFactory.ID_META_SQUAD) as BC_MetaSquad;
         metaSquad.squadId = squadId;
         metaSquad.squadPosition = squadPos;
         metaSquad.metaArmy = metaArmy;
         return metaSquad as BC_MetaSquad;
      }
      
      public function CreateMetaMKWeapon() : BC_MetaWeapon
      {
         return BC_MetaWeapon(CreateMetaData(BC_MetaFactory.ID_META_MK_WEAPON));
      }
      
      public function CreateMetaMKWeaponWall() : MetaWeaponWall
      {
         return MetaWeaponWall(CreateMetaData(BC_MetaFactory.ID_META_MK_WEAPON_WALL));
      }
      
      public function CreateMetaArmy(teamName:String, teamId:int) : BC_MetaArmy
      {
         var metaArmy:BC_MetaArmy = CreateMetaData(BC_MetaFactory.ID_META_ARMY) as BC_MetaArmy;
         metaArmy.armyName = teamName;
         metaArmy.teamId = teamId;
         metaArmy.metaSquad1 = this.CreateMetaSquad(0,metaArmy,1);
         metaArmy.metaSquad2 = this.CreateMetaSquad(3,metaArmy,2);
         metaArmy.metaSquad3 = this.CreateMetaSquad(6,metaArmy,3);
         metaArmy.metaSquad4 = this.CreateMetaSquad(9,metaArmy,4);
         metaArmy.metaSquad5 = this.CreateMetaSquad(12,metaArmy,5);
         var enemyManager:BC_EnemyManager = context.enemyManager as BC_EnemyManager;
         metaArmy.unitInventory.push(enemyManager.CreateMetaUnitNull());
         metaArmy.unitInventory.push(enemyManager.CreateMetaUnitNull());
         metaArmy.unitInventory.push(enemyManager.CreateMetaUnitNull());
         metaArmy.unitInventory.push(enemyManager.CreateMetaUnitNull());
         metaArmy.unitInventory.push(enemyManager.CreateMetaUnitNull());
         metaArmy.unitInventory.push(enemyManager.CreateMetaUnitNull());
         metaArmy.unitInventory.push(enemyManager.CreateMetaUnitNull());
         metaArmy.unitInventory.push(enemyManager.CreateMetaUnitNull());
         return metaArmy;
      }
      
      public function CreateMetaMKWeaponSpread() : MetaWeaponSpread
      {
         return MetaWeaponSpread(CreateMetaData(BC_MetaFactory.ID_META_MK_WEAPON_SPREAD));
      }
   }
}

