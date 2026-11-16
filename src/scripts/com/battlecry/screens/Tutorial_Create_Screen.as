package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.model.ModelEquipementEnum;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.Screen;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class Tutorial_Create_Screen extends BC_Screen
   {
      
      private var _stage:int;
      
      public function Tutorial_Create_Screen()
      {
         super();
      }
      
      override public function Update(context:MainGame) : void
      {
         var bcScreen:BC_Screen = null;
         var s:Screen = null;
         var i:int = 0;
         var u:UnitCreationScreen = null;
         super.Update(context);
         visual.gotoAndStop(this._stage);
         switch(this._stage)
         {
            case 1:
               if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_ARMYCREATION_SCREEN) > 0)
               {
                  this._stage = 2;
               }
               break;
            case 2:
               if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_UNITCREATION_SCREEN) > 0)
               {
                  this._stage = 3;
               }
               for(i = 0; i < ScreenManager.instance.activeFactoryObjects.length; i++)
               {
                  bcScreen = ScreenManager.instance.activeFactoryObjects[i] as BC_Screen;
                  if(bcScreen as UnitCreationScreen)
                  {
                     (bcScreen as UnitCreationScreen).Idle();
                  }
               }
               break;
            case 3:
               for(i = 0; i < ScreenManager.instance.activeFactoryObjects.length; i++)
               {
                  s = ScreenManager.instance.activeFactoryObjects[i] as Screen;
                  if(s as UnitCreationScreen)
                  {
                     if((s as UnitCreationScreen).itemTransferView.unitCreateView.metaUnit.playerEquipement.creatureEquip.modelEquipement.id == ModelEquipementEnum.CREATURE_HUMAN.id)
                     {
                        this._stage = 4;
                     }
                  }
               }
               break;
            case 4:
               for(i = 0; i < ScreenManager.instance.activeFactoryObjects.length; i++)
               {
                  s = ScreenManager.instance.activeFactoryObjects[i] as Screen;
                  if(s as UnitCreationScreen)
                  {
                     u = s as UnitCreationScreen;
                     if(u.itemTransferView.unitCreateView.metaUnit.playerEquipement.creatureEquip.modelEquipement.id == ModelEquipementEnum.CREATURE_HUMAN.id && u.itemTransferView.unitCreateView.metaUnit.playerEquipement.weaponEquip.modelEquipement.id == ModelEquipementEnum.WEAPON_IRONSWORD.id && u.itemTransferView.unitCreateView.metaUnit.playerEquipement.shieldEquip.modelEquipement.id == ModelEquipementEnum.SHIELD_BUCKLER.id && u.itemTransferView.unitCreateView.metaUnit.playerEquipement.armorEquip.modelEquipement.id == ModelEquipementEnum.ARMOR_GAMBESON.id && u.itemTransferView.unitCreateView.metaUnit.playerEquipement.specialEquip.modelEquipement.id == ModelEquipementEnum.SPECIAL_HORSE.id)
                     {
                        this._stage = 5;
                     }
                  }
               }
               break;
            case 6:
               if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_NBRUNIT_SCREEN) > 0)
               {
                  this._stage = 7;
               }
               for(i = 0; i < ScreenManager.instance.activeFactoryObjects.length; i++)
               {
                  bcScreen = ScreenManager.instance.activeFactoryObjects[i] as BC_Screen;
                  if(bcScreen as NbrUnitScreen)
                  {
                     (bcScreen as NbrUnitScreen).Idle();
                  }
               }
               break;
            case 7:
               if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_NBRUNIT_SCREEN) <= 0)
               {
                  this.Close(true,null,false);
               }
               else
               {
                  for(i = 0; i < ScreenManager.instance.activeFactoryObjects.length; i++)
                  {
                     bcScreen = ScreenManager.instance.activeFactoryObjects[i] as BC_Screen;
                     if(bcScreen as NbrUnitScreen)
                     {
                        this.arrow1.visible = (bcScreen as NbrUnitScreen).btnArrowUp.visible;
                     }
                  }
               }
         }
         if(this.arrow1)
         {
            this.arrow1.play();
         }
         if(this.arrow2)
         {
            this.arrow2.play();
         }
      }
      
      public function get arrow1() : MovieClip
      {
         return visual.getChildByName("arrow1") as MovieClip;
      }
      
      public function get arrow2() : MovieClip
      {
         return visual.getChildByName("arrow2") as MovieClip;
      }
      
      private function onNextTuto(event:MouseEvent) : void
      {
         ++this._stage;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_NextTuto);
         this.btn_NextTuto.addEventListener(MouseEvent.MOUSE_DOWN,this.onNextTuto);
         this._stage = 1;
      }
      
      public function get btn_NextTuto() : ButtonSelect
      {
         return visual.getChildByName("btn_NextTuto") as ButtonSelect;
      }
      
      override public function Close(remove:Boolean, c:Callback, quickClose:Boolean) : void
      {
         super.Close(remove,c,quickClose);
         BC_Game.instance.Save();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_NextTuto.removeEventListener(MouseEvent.MOUSE_DOWN,this.onNextTuto);
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_TUTORIAL_CREATE_SCREEN);
      }
   }
}

