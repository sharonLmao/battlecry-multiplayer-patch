package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.screens.Units.UnitView;
   import com.battlecry.screens.view.EquipementView;
   import com.battlecry.screens.view.PlayerEquipementView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class NbrUnitScreen extends BC_Screen
   {
      
      private var _metaUnit:BC_MetaUnit;
      
      private var _descriptionScreen:ItemDescriptionScreen;
      
      private var _quantityspeed:Number;
      
      private var _maxWaitTime:Number;
      
      private var _unitView:UnitView;
      
      private var _onUp:Boolean;
      
      private var _onDown:Boolean;
      
      private var _waitTime:Number;
      
      private var _back:Boolean;
      
      private var _moterScreen:BC_Screen;
      
      private var _backUpI:int;
      
      private var _startingTextY:Number;
      
      private var _unitCreationScreen:UnitCreationScreen;
      
      private var _playerEquipementView:PlayerEquipementView;
      
      public function NbrUnitScreen()
      {
         super();
      }
      
      private function onDone(event:MouseEvent) : void
      {
         if(this._metaUnit.quantity <= 0)
         {
            return;
         }
         this._metaUnit.maxQuantity = this._metaUnit.quantity;
         if(this._unitCreationScreen.edit == true)
         {
            (this._moterScreen as ArmyCreationScreen).DeleteUnitAfterEdit(this._unitCreationScreen.editUnit);
            (this._moterScreen as ArmyCreationScreen).CreateAfterEdit(this._metaUnit,this._backUpI);
         }
         else
         {
            (this._moterScreen as ArmyCreationScreen).CreateUnit(this._metaUnit);
         }
         (this._moterScreen as ArmyCreationScreen).unitTransferView.RemoveItemsFromInventory(this._metaUnit);
         this._unitCreationScreen.Back();
         this._unitCreationScreen.edit = false;
         BC_Game.instance.Save();
         this._backUpI = 0;
         this._back = false;
         if(this.IsInTutorial())
         {
            ScreenManager.instance.RemoveScreen(this);
         }
         else
         {
            Close(true,null,false);
         }
      }
      
      override public function Destroy() : void
      {
         var e:EquipementView = null;
         super.Destroy();
         for(var m:int = 0; m < this._playerEquipementView.views.length; m++)
         {
            e = this._playerEquipementView.views[m] as EquipementView;
            e.visual.removeEventListener(MouseEvent.MOUSE_OVER,this.onRollOverItem);
            e.Destroy();
         }
         if(this._descriptionScreen)
         {
            ScreenManager.instance.RemoveScreen(this._descriptionScreen);
         }
         this._unitView.OffSet(0,0);
         this._unitView.animContainer.scaleX = 1;
         this._unitView.animContainer.scaleY = 1;
         this._unitView.Destroy();
         if(this.IsInTutorial())
         {
            if(!this._back)
            {
               ScreenManager.instance.RemoveScreen(this._unitCreationScreen);
            }
         }
         else if(!this._back)
         {
            this._unitCreationScreen.Close(true,null,false);
         }
         this.btnBack.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBack);
         this.btnDone.removeEventListener(MouseEvent.MOUSE_DOWN,this.onDone);
         this.btnArrowDown.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArrowDown);
         this.btnArrowUp.removeEventListener(MouseEvent.MOUSE_DOWN,this.onArrowUp);
      }
      
      public function SetMetaUnit(metaUnit:BC_MetaUnit) : void
      {
         this._metaUnit.Copy(metaUnit);
         this._playerEquipementView.SetGroupEquipement(this._metaUnit.playerEquipement);
         this._playerEquipementView.Refresh();
         for(var i:int = 0; i < this._playerEquipementView.views.length; i++)
         {
            if((this._playerEquipementView.views[i] as EquipementView).metaEquipement.modelEquipement.id >= 0)
            {
               (this._playerEquipementView.views[i] as EquipementView).visual.visible = true;
               (this._playerEquipementView.views[i] as EquipementView).btn_Equipment.Select();
            }
            else
            {
               (this._playerEquipementView.views[i] as EquipementView).visual.visible = false;
            }
         }
         this._unitView.SetMetaUnit(this._metaUnit);
         this._unitView.SetIdle();
         this.unitNameTxt.text = this._metaUnit.unitName;
         this.Refresh();
         this.CheckOffsetUnit();
      }
      
      private function IsInTutorial() : Boolean
      {
         return ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_TUTORIAL_BOOSTER_SCREEN) > 0 || ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_TUTORIAL_CREATE_SCREEN) > 0 || ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_TUTORIAL_FLAG_SCREEN) > 0 || ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_TUTORIAL_INGAME_SCREEN) > 0 || ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_TUTORIAL_MULTIPLAYER_SCREEN) > 0 || ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_TUTORIAL_TIMER_SCREEN) > 0 || ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_TUTORIAL_UNLOCKACT2_SCREEN) > 0 || ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_TUTORIAL_WIZARD_SCREEN) > 0 || ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_TUTORIAL_INITIAL_SCREEN) > 0 || ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_TUTORIAL_ARCHER_SCREEN) > 0;
      }
      
      public function get btnArrowUp() : MovieClip
      {
         return panel.getChildByName("btn_ArrowUp") as MovieClip;
      }
      
      override public function ShowIdle(context:MainGame) : void
      {
         super.ShowIdle(context);
         if(this._onUp || this._onDown)
         {
            if(this._onUp)
            {
               this._quantityspeed += 0.05;
            }
            if(this._onDown)
            {
               this._quantityspeed -= 0.05;
            }
            if(this._quantityspeed > 0)
            {
               this._maxWaitTime = 5 - this._quantityspeed;
            }
            else
            {
               this._maxWaitTime = 5 + this._quantityspeed;
            }
            if(this._maxWaitTime <= 0)
            {
               this._maxWaitTime = 0;
            }
            ++this._waitTime;
            if(this._waitTime >= this._maxWaitTime)
            {
               this._waitTime = 0;
               if(this._quantityspeed > 0)
               {
                  if(this._playerEquipementView.CheckUnitDispo() && this._metaUnit.quantity < 99)
                  {
                     ++this._metaUnit.quantity;
                     this._playerEquipementView.SubUnit();
                  }
               }
               else if(this._metaUnit.quantity > 0)
               {
                  --this._metaUnit.quantity;
                  this._playerEquipementView.returnItems();
               }
            }
         }
         this.SetMetaUnit(this._metaUnit);
      }
      
      public function get Unit0() : MovieClip
      {
         return panel.getChildByName("Unit0") as MovieClip;
      }
      
      public function SetInfo(motherScreen:BC_Screen, unitCreationScreen:UnitCreationScreen, backUpI:int) : void
      {
         this._moterScreen = motherScreen;
         this._unitCreationScreen = unitCreationScreen;
         this._backUpI = backUpI;
      }
      
      public function get playerEquipementView() : MovieClip
      {
         return panel.getChildByName("PlayerEquipementView") as MovieClip;
      }
      
      private function onRollOverItem(event:MouseEvent) : void
      {
         var mc:MovieClip = event.target as MovieClip;
         var v1:EquipementView = this._playerEquipementView.GetViewFromVisual(mc) as EquipementView;
         if(v1 == null)
         {
            return;
         }
         if(v1.metaEquipement.modelEquipement.id < 0)
         {
            return;
         }
         this._descriptionScreen.SetMetaEquipement(v1.metaEquipement);
         this._descriptionScreen.Show();
         v1.visual.addEventListener(MouseEvent.MOUSE_OUT,this.onRollOut);
      }
      
      override public function Show() : void
      {
         super.Show();
         this._descriptionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ITEMDESCRIPTION_SCREEN,false,true) as ItemDescriptionScreen;
         this._descriptionScreen.Hide();
      }
      
      private function onArrowUp(event:MouseEvent) : void
      {
         this._onUp = true;
         this._waitTime = 5;
         visual.stage.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function get metaUnit() : BC_MetaUnit
      {
         return this._metaUnit;
      }
      
      private function onArrowDown(event:MouseEvent) : void
      {
         this._onDown = true;
         this._waitTime = 5;
         visual.stage.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         var e:EquipementView = null;
         super.Init(metaObject,context);
         this._playerEquipementView = new PlayerEquipementView(this.playerEquipementView);
         this._unitView = new UnitView(this.Unit0,true);
         this._back = false;
         this._startingTextY = this.unitNameTxt.y;
         this._backUpI = 0;
         this._metaUnit = new BC_MetaUnit(-1);
         this._quantityspeed = 0;
         this._onUp = false;
         this._onDown = false;
         this._waitTime = 0;
         this._maxWaitTime = 0;
         InitOkBtn(this.btnBack);
         this.btnBack.addEventListener(MouseEvent.MOUSE_DOWN,this.onBack);
         InitOkBtn(this.btnDone);
         this.btnDone.addEventListener(MouseEvent.MOUSE_DOWN,this.onDone);
         InitOkBtn(this.btnArrowDown);
         this.btnArrowDown.addEventListener(MouseEvent.MOUSE_DOWN,this.onArrowDown);
         InitOkBtn(this.btnArrowUp);
         this.btnArrowUp.addEventListener(MouseEvent.MOUSE_DOWN,this.onArrowUp);
         this._descriptionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ITEMDESCRIPTION_SCREEN,false,true) as ItemDescriptionScreen;
         this._descriptionScreen.Hide();
         for(var m:int = 0; m < this._playerEquipementView.views.length; m++)
         {
            e = this._playerEquipementView.views[m] as EquipementView;
            e.visual.addEventListener(MouseEvent.MOUSE_OVER,this.onRollOverItem);
         }
         animation.playChildren = false;
      }
      
      private function onRollOut(event:MouseEvent) : void
      {
         this._descriptionScreen.Hide();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this._unitView.Refresh();
         if(this.unitQuantityTxt)
         {
            this.unitQuantityTxt.text = this._metaUnit.quantity + "";
         }
         this.unitNameTxt.y = this._startingTextY;
         this.unitNameTxt.y += Math.abs((this.unitNameTxt.height - (this.unitNameTxt.textHeight + 5)) / 2);
      }
      
      private function CheckOffsetUnit() : void
      {
         if(this._metaUnit.playerEquipement.creatureEquip.isArtillery6Case())
         {
            this._unitView.OffSet(15,-15);
            this._unitView.animContainer.scaleX = 1;
            this._unitView.animContainer.scaleY = 1;
            return;
         }
         if(this._metaUnit.playerEquipement.creatureEquip.isArtillery3Case())
         {
            this._unitView.OffSet(10,0);
            this._unitView.animContainer.scaleX = 1;
            this._unitView.animContainer.scaleY = 1;
            return;
         }
         if(this._metaUnit.playerEquipement.creatureEquip.isArtillery9Case())
         {
            this._unitView.OffSet(5,-13);
            this._unitView.animContainer.scaleX = 0.4;
            this._unitView.animContainer.scaleY = 0.4;
            return;
         }
         this._unitView.OffSet(0,0);
         this._unitView.animContainer.scaleX = 1;
         this._unitView.animContainer.scaleY = 1;
      }
      
      public function get unitQuantityTxt() : TextField
      {
         return panel.getChildByName("unitQuantityTxt") as TextField;
      }
      
      public function get btnArrowDown() : MovieClip
      {
         return panel.getChildByName("btn_ArrowDown") as MovieClip;
      }
      
      public function get unitNameTxt() : TextField
      {
         return panel.getChildByName("unitNameTxt") as TextField;
      }
      
      private function onUp(event:MouseEvent) : void
      {
         this._quantityspeed = 0;
         this._onUp = false;
         this._onDown = false;
         visual.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      override public function Hide() : void
      {
         super.Hide();
         ScreenManager.instance.RemoveScreen(this._descriptionScreen);
      }
      
      public function get btnBack() : ButtonSelect
      {
         return panel.getChildByName("btn_Back") as ButtonSelect;
      }
      
      private function onBack(event:MouseEvent) : void
      {
         this._playerEquipementView.returnItems(this._metaUnit.quantity);
         this._metaUnit.quantity = 0;
         this._back = true;
         Close(true,null,false);
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(this._playerEquipementView.CheckUnitDispo())
         {
            this.btnArrowUp.visible = true;
         }
         else
         {
            this.btnArrowUp.visible = false;
         }
         if(this._metaUnit.quantity <= 0)
         {
            this.btnArrowDown.visible = false;
            this.btnDone.Select();
         }
         else
         {
            this.btnArrowDown.visible = true;
            this.btnDone.Deselect();
         }
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_NBRUNIT_SCREEN);
      }
      
      public function get btnDone() : ButtonSelect
      {
         return panel.getChildByName("btn_Done") as ButtonSelect;
      }
   }
}

