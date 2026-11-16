package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.BitMapLoader;
   import com.battlecry.enemy.BC_EnemyManager;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.BC_MetaSquad;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.meta.model.ModelBitMapAnimation;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   
   public class LoadGameScreen extends BC_Screen
   {
      
      private var _metaArmy:BC_MetaArmy;
      
      private var _fakeLoading:Number;
      
      private var _loadAnim:Boolean;
      
      private var _bitLoaderArray:Array;
      
      public function LoadGameScreen()
      {
         super();
      }
      
      public function SetEnemyArmy(metaArmy:BC_MetaArmy) : void
      {
         var i:int = 0;
         this._metaArmy = metaArmy;
         var squadVector:Vector.<BC_MetaSquad> = new Vector.<BC_MetaSquad>();
         squadVector.push(BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad1,BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad2,BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad3,BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad4,BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad5);
         for(var j:int = 0; j < squadVector.length; j++)
         {
            for(i = 0; i < squadVector[j].unitVector.length; i++)
            {
               squadVector[j].unitVector[i].modelBitmapAnimationGroup = null;
            }
         }
         var squadVector2:Vector.<BC_MetaSquad> = new Vector.<BC_MetaSquad>();
         squadVector2.push(this._metaArmy.metaSquad1,this._metaArmy.metaSquad2,this._metaArmy.metaSquad3,this._metaArmy.metaSquad4,this._metaArmy.metaSquad5);
         for(j = 0; j < squadVector2.length; j++)
         {
            for(i = 0; i < squadVector2[j].unitVector.length; i++)
            {
               squadVector2[j].unitVector[i].modelBitmapAnimationGroup = null;
            }
         }
         if(BC_VersionInfo.isBitMapMode)
         {
            this.InitAllAnimation();
         }
      }
      
      public function set metaArmy(metaArmy:BC_MetaArmy) : void
      {
         this._metaArmy = metaArmy;
      }
      
      override public function Update(context:MainGame) : void
      {
         var i:int = 0;
         var j:int = 0;
         super.Update(context);
         if(BC_VersionInfo.isBitMapMode)
         {
            if(this._loadAnim)
            {
               for(i = 0; i < this._bitLoaderArray.length; i++)
               {
                  (this._bitLoaderArray[i] as BitMapLoader).Update();
               }
               if(this.CheckAllLoaded())
               {
                  this._loadAnim = false;
                  for(j = 0; j < this._bitLoaderArray.length; j++)
                  {
                     (this._bitLoaderArray[j] as BitMapLoader).Destroy();
                  }
               }
            }
         }
         else if(this._fakeLoading > 0)
         {
            --this._fakeLoading;
         }
      }
      
      private function DisposeSummonBitmap() : void
      {
         var i:int = 0;
         var j:int = 0;
         var bma:ModelBitMapAnimation = null;
         if(BC_Game.instance.skeleton)
         {
            for(i = 0; i < BC_Game.instance.skeleton.modelBitmapAnimationGroup.bitmapAnimationGroup.length; i++)
            {
               bma = BC_Game.instance.skeleton.modelBitmapAnimationGroup.bitmapAnimationGroup[i];
               for(j = 0; j < bma.bitMapDataArray.length; j++)
               {
                  bma.bitMapDataArray[j].bmd.dispose();
                  bma.bitMapDataArray[j].rect = null;
                  bma.bitMapDataArray.splice(j,1);
                  j--;
               }
               BC_Game.instance.skeleton.modelBitmapAnimationGroup.bitmapAnimationGroup.splice(i,1);
               i--;
            }
         }
         if(BC_Game.instance.immortalWarrior)
         {
            for(i = 0; i < BC_Game.instance.immortalWarrior.modelBitmapAnimationGroup.bitmapAnimationGroup.length; i++)
            {
               bma = BC_Game.instance.immortalWarrior.modelBitmapAnimationGroup.bitmapAnimationGroup[i];
               for(j = 0; j < bma.bitMapDataArray.length; j++)
               {
                  bma.bitMapDataArray[j].bmd.dispose();
                  bma.bitMapDataArray[j].rect = null;
                  bma.bitMapDataArray.splice(j,1);
                  j--;
               }
               BC_Game.instance.immortalWarrior.modelBitmapAnimationGroup.bitmapAnimationGroup.splice(i,1);
               i--;
            }
         }
         if(BC_Game.instance.demonWarrior)
         {
            for(i = 0; i < BC_Game.instance.demonWarrior.modelBitmapAnimationGroup.bitmapAnimationGroup.length; i++)
            {
               bma = BC_Game.instance.demonWarrior.modelBitmapAnimationGroup.bitmapAnimationGroup[i];
               for(j = 0; j < bma.bitMapDataArray.length; j++)
               {
                  bma.bitMapDataArray[j].bmd.dispose();
                  bma.bitMapDataArray[j].rect = null;
                  bma.bitMapDataArray.splice(j,1);
                  j--;
               }
               BC_Game.instance.demonWarrior.modelBitmapAnimationGroup.bitmapAnimationGroup.splice(i,1);
               i--;
            }
         }
      }
      
      public function get metaArmy() : BC_MetaArmy
      {
         return this._metaArmy;
      }
      
      private function InitAllAnimation() : void
      {
         var bitMapLoader:BitMapLoader = null;
         var m:BC_MetaUnit = null;
         var x:Number = 0;
         var y:Number = 550;
         for(var i:int = 0; i < BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad1.unitVector.length; i++)
         {
            m = BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad1.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2 || this.CheckAlreadyExisting(m)))
            {
               bitMapLoader = new BitMapLoader(x,y,m);
               this._bitLoaderArray.push(bitMapLoader);
               x += bitMapLoader.rollAnim.animContainer.scaleX + 250;
            }
         }
         for(i = 0; i < BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad2.unitVector.length; i++)
         {
            m = BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad2.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2 || this.CheckAlreadyExisting(m)))
            {
               bitMapLoader = new BitMapLoader(x,y,m);
               this._bitLoaderArray.push(bitMapLoader);
               x += bitMapLoader.rollAnim.animContainer.scaleX + 250;
            }
         }
         for(i = 0; i < BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad3.unitVector.length; i++)
         {
            m = BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad3.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2 || this.CheckAlreadyExisting(m)))
            {
               bitMapLoader = new BitMapLoader(x,y,m);
               this._bitLoaderArray.push(bitMapLoader);
               x += bitMapLoader.rollAnim.animContainer.scaleX + 250;
            }
         }
         for(i = 0; i < BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad4.unitVector.length; i++)
         {
            m = BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad4.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2 || this.CheckAlreadyExisting(m)))
            {
               bitMapLoader = new BitMapLoader(x,y,m);
               this._bitLoaderArray.push(bitMapLoader);
               x += bitMapLoader.rollAnim.animContainer.scaleX + 250;
            }
         }
         for(i = 0; i < BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad5.unitVector.length; i++)
         {
            m = BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad5.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2 || this.CheckAlreadyExisting(m)))
            {
               bitMapLoader = new BitMapLoader(x,y,m);
               this._bitLoaderArray.push(bitMapLoader);
               x += bitMapLoader.rollAnim.animContainer.scaleX + 250;
            }
         }
         for(i = 0; i < this._metaArmy.metaSquad1.unitVector.length; i++)
         {
            m = this._metaArmy.metaSquad1.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2 || this.CheckAlreadyExisting(m)))
            {
               bitMapLoader = new BitMapLoader(x,y,m);
               this._bitLoaderArray.push(bitMapLoader);
               x += bitMapLoader.rollAnim.animContainer.scaleX + 250;
            }
         }
         for(i = 0; i < this._metaArmy.metaSquad2.unitVector.length; i++)
         {
            m = this._metaArmy.metaSquad2.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2 || this.CheckAlreadyExisting(m)))
            {
               bitMapLoader = new BitMapLoader(x,y,m);
               this._bitLoaderArray.push(bitMapLoader);
               x += bitMapLoader.rollAnim.animContainer.scaleX + 250;
            }
         }
         for(i = 0; i < this._metaArmy.metaSquad3.unitVector.length; i++)
         {
            m = this._metaArmy.metaSquad3.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2 || this.CheckAlreadyExisting(m)))
            {
               bitMapLoader = new BitMapLoader(x,y,m);
               this._bitLoaderArray.push(bitMapLoader);
               x += bitMapLoader.rollAnim.animContainer.scaleX + 250;
            }
         }
         for(i = 0; i < this._metaArmy.metaSquad4.unitVector.length; i++)
         {
            m = this._metaArmy.metaSquad4.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2 || this.CheckAlreadyExisting(m)))
            {
               bitMapLoader = new BitMapLoader(x,y,m);
               this._bitLoaderArray.push(bitMapLoader);
               x += bitMapLoader.rollAnim.animContainer.scaleX + 250;
            }
         }
         for(i = 0; i < this._metaArmy.metaSquad5.unitVector.length; i++)
         {
            m = this._metaArmy.metaSquad5.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2 || this.CheckAlreadyExisting(m)))
            {
               bitMapLoader = new BitMapLoader(x,y,m);
               this._bitLoaderArray.push(bitMapLoader);
               x += bitMapLoader.rollAnim.animContainer.scaleX + 250;
            }
         }
         this.DisposeSummonBitmap();
         BC_Game.instance.skeleton = (_context.enemyManager as BC_EnemyManager).CreateMetaSkeleton();
         bitMapLoader = new BitMapLoader(x,y,BC_Game.instance.skeleton);
         this._bitLoaderArray.push(bitMapLoader);
         x += bitMapLoader.rollAnim.animContainer.scaleX + 250;
         BC_Game.instance.immortalWarrior = (_context.enemyManager as BC_EnemyManager).CreateMetaImmortalWarrior();
         bitMapLoader = new BitMapLoader(x,y,BC_Game.instance.immortalWarrior);
         this._bitLoaderArray.push(bitMapLoader);
         x += bitMapLoader.rollAnim.animContainer.scaleX + 250;
         BC_Game.instance.demonWarrior = (_context.enemyManager as BC_EnemyManager).CreateMetaDemon();
         bitMapLoader = new BitMapLoader(x,y,BC_Game.instance.demonWarrior);
         this._bitLoaderArray.push(bitMapLoader);
         x += bitMapLoader.rollAnim.animContainer.scaleX + 250;
      }
      
      public function CheckAlreadyExisting(unitToCompare:BC_MetaUnit) : Boolean
      {
         var m:BC_MetaUnit = null;
         var allMetaUnit:Vector.<BC_MetaUnit> = new Vector.<BC_MetaUnit>();
         for(var i:int = 0; i < BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad1.unitVector.length; i++)
         {
            m = BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad1.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2))
            {
               allMetaUnit.push(m);
            }
         }
         for(i = 0; i < BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad2.unitVector.length; i++)
         {
            m = BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad2.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2))
            {
               allMetaUnit.push(m);
            }
         }
         for(i = 0; i < BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad3.unitVector.length; i++)
         {
            m = BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad3.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2))
            {
               allMetaUnit.push(m);
            }
         }
         for(i = 0; i < BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad4.unitVector.length; i++)
         {
            m = BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad4.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2))
            {
               allMetaUnit.push(m);
            }
         }
         for(i = 0; i < BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad5.unitVector.length; i++)
         {
            m = BC_GameProgress.gameProgess.CurrentSelectedArmy().metaSquad5.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2))
            {
               allMetaUnit.push(m);
            }
         }
         for(i = 0; i < this._metaArmy.metaSquad1.unitVector.length; i++)
         {
            m = this._metaArmy.metaSquad1.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2))
            {
               allMetaUnit.push(m);
            }
         }
         for(i = 0; i < this._metaArmy.metaSquad2.unitVector.length; i++)
         {
            m = this._metaArmy.metaSquad2.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2))
            {
               allMetaUnit.push(m);
            }
         }
         for(i = 0; i < this._metaArmy.metaSquad3.unitVector.length; i++)
         {
            m = this._metaArmy.metaSquad3.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2))
            {
               allMetaUnit.push(m);
            }
         }
         for(i = 0; i < this._metaArmy.metaSquad4.unitVector.length; i++)
         {
            m = this._metaArmy.metaSquad4.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2))
            {
               allMetaUnit.push(m);
            }
         }
         for(i = 0; i < this._metaArmy.metaSquad5.unitVector.length; i++)
         {
            m = this._metaArmy.metaSquad5.unitVector[i] as BC_MetaUnit;
            if(!(m.id == -1 || m.id == -2))
            {
               allMetaUnit.push(m);
            }
         }
         for(i = 0; i < allMetaUnit.length; i++)
         {
            if(allMetaUnit[i].modelBitmapAnimationGroup != null && unitToCompare.Compare(allMetaUnit[i]))
            {
               unitToCompare.modelAnim = allMetaUnit[i].modelAnim;
               unitToCompare.modelBitmapAnimationGroup = allMetaUnit[i].modelBitmapAnimationGroup;
               return true;
            }
         }
         return false;
      }
      
      override public function CreateVisual() : Animation
      {
         if(BC_Game.instance.isRanked)
         {
            return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_LOADGAME_SCREEN);
         }
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_LOADGAMEFRIEND_SCREEN);
      }
      
      public function CheckAllLoaded() : Boolean
      {
         var i:int = 0;
         if(BC_VersionInfo.isBitMapMode)
         {
            for(i = 0; i < this._bitLoaderArray.length; i++)
            {
               if(!(this._bitLoaderArray[i] as BitMapLoader).finishLoading)
               {
                  return false;
               }
            }
            return true;
         }
         if(this._fakeLoading <= 0)
         {
            return true;
         }
         return false;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._bitLoaderArray = new Array();
         this._loadAnim = true;
         this._fakeLoading = 30;
      }
   }
}

