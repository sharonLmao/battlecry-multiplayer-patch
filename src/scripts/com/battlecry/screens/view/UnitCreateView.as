package com.battlecry.screens.view
{
   import com.battlecry.SelectionColor;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.MetaPlayerEquipement;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelEquipementEnum;
   import com.battlecry.screens.Units.UnitView;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.games.sfx.Jukebox;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class UnitCreateView extends ObjectView
   {
      
      private var _weaponLock:LockView;
      
      private var _armorLock:LockView;
      
      private var _metaUnit:BC_MetaUnit;
      
      private var _unitView:UnitView;
      
      private var _playerStatsView:PlayerStatsView;
      
      private var _specialLock:LockView;
      
      private var _shieldLock:LockView;
      
      private var _creatureLock:LockView;
      
      private var _startingUnitNameTxtY:Number;
      
      private var _playerEquipementView:PlayerEquipementView;
      
      public function UnitCreateView(visual:MovieClip)
      {
         super(visual);
         this._startingUnitNameTxtY = this.unitNameTxt.y;
         this._metaUnit = BC_MetaUnit.EMPTY_UNIT;
         this.unitNameTxt.text = "Unit";
         this._unitView = new UnitView(this.Unit0,true);
         this._unitView.quantityText.visible = false;
         this._unitView.shadow.visible = false;
         this._playerEquipementView = new PlayerEquipementView(this.playerEquipement);
         this._playerStatsView = new PlayerStatsView(this.playerStats);
         this._creatureLock = new LockView(this.creatureLock);
         this._weaponLock = new LockView(this.weaponLock);
         this._shieldLock = new LockView(this.shieldLock);
         this._armorLock = new LockView(this.armorLock);
         this._specialLock = new LockView(this.specialLock);
         SelectionColor.setFieldSelectionColor(this.unitNameTxt,16513529);
         this.SetMetaUnit(this._metaUnit);
      }
      
      public function get specialLock() : MovieClip
      {
         return visual.getChildByName("specialLock") as MovieClip;
      }
      
      public function UnequipAll() : void
      {
         this._metaUnit.playerEquipement.creatureEquip = MetaEquipement.EMPTY_EQUIPEMENT;
         this._metaUnit.playerEquipement.weaponEquip = MetaEquipement.EMPTY_EQUIPEMENT;
         this._metaUnit.playerEquipement.shieldEquip = MetaEquipement.EMPTY_EQUIPEMENT;
         this._metaUnit.playerEquipement.armorEquip = MetaEquipement.EMPTY_EQUIPEMENT;
         this._metaUnit.playerEquipement.specialEquip = MetaEquipement.EMPTY_EQUIPEMENT;
         this._playerEquipementView.SetGroupEquipement(this._metaUnit.playerEquipement);
         this.SetMetaUnit(this._metaUnit);
      }
      
      public function SetMetaUnit(metaUnit:BC_MetaUnit) : void
      {
         this._metaUnit = metaUnit;
         this._metaUnit.ChooseAnimSet();
         this._unitView.SetMetaUnit(this._metaUnit);
         this._unitView.SetIdle();
         this._playerEquipementView.SetGroupEquipement(this._metaUnit.playerEquipement);
         this._playerStatsView.SetMetaPlayerEquipement(this._metaUnit.playerEquipement);
         this.Refresh();
      }
      
      public function get Unit0() : MovieClip
      {
         return visual.getChildByName("Unit0") as MovieClip;
      }
      
      private function RefreshText() : void
      {
         this.unitValueTxt.text = this._metaUnit.playerEquipement.Value + "";
      }
      
      public function get creatureLock() : MovieClip
      {
         return visual.getChildByName("creatureLock") as MovieClip;
      }
      
      public function UnlockAll() : void
      {
         this._creatureLock.UnLock();
         this._weaponLock.UnLock();
         this._shieldLock.UnLock();
         this._armorLock.UnLock();
         this._specialLock.UnLock();
         for(var i:int = 0; i < this._playerEquipementView.views.length; i++)
         {
            (this._playerEquipementView.views[i] as EquipementView).visualMc.visible = true;
         }
      }
      
      public function get playerEquipementView() : PlayerEquipementView
      {
         return this._playerEquipementView;
      }
      
      public function get armorLock() : MovieClip
      {
         return visual.getChildByName("armorLock") as MovieClip;
      }
      
      public function RefreshLockSlot(metaUnit:BC_MetaUnit) : void
      {
         this.UnlockAll();
         this.LockSlot(metaUnit.playerEquipement.creatureEquip);
         this.LockSlot(metaUnit.playerEquipement.weaponEquip);
         this.LockSlot(metaUnit.playerEquipement.shieldEquip);
         this.LockSlot(metaUnit.playerEquipement.armorEquip);
         this.LockSlot(metaUnit.playerEquipement.specialEquip);
         for(var i:int = 0; i < this._playerEquipementView.views.length; i++)
         {
            if((this._playerEquipementView.views[i] as EquipementView).metaEquipement.modelEquipement.id < 0)
            {
               (this._playerEquipementView.views[i] as EquipementView).visualMc.visible = false;
            }
         }
      }
      
      public function AddUnit() : void
      {
         ++this._metaUnit.quantity;
         this.SetMetaUnit(this._metaUnit);
      }
      
      public function CheckCreatureEquip() : Boolean
      {
         if(this._metaUnit.playerEquipement.creatureEquip.modelEquipement.id >= 0)
         {
            return true;
         }
         return false;
      }
      
      public function CheckAnyEquip() : Boolean
      {
         var playerEquipement:MetaPlayerEquipement = this._metaUnit.playerEquipement;
         if(playerEquipement.creatureEquip.modelEquipement.id >= 0 || playerEquipement.weaponEquip.modelEquipement.id >= 0 || playerEquipement.shieldEquip.modelEquipement.id >= 0 || playerEquipement.armorEquip.modelEquipement.id >= 0 || playerEquipement.specialEquip.modelEquipement.id >= 0)
         {
            return true;
         }
         return false;
      }
      
      public function get metaUnit() : BC_MetaUnit
      {
         return this._metaUnit;
      }
      
      public function set playerEquipementView(playerEquipementView:PlayerEquipementView) : void
      {
         this._playerEquipementView = playerEquipementView;
      }
      
      public function get shieldLock() : MovieClip
      {
         return visual.getChildByName("shieldLock") as MovieClip;
      }
      
      public function removeEquipement(metaEquipement:MetaEquipement) : void
      {
         if(metaEquipement.modelEquipement.id < 0)
         {
            return;
         }
         switch(metaEquipement.modelEquipement.type)
         {
            case ModelEquipement.TYPE_CREATURE:
               this._metaUnit.playerEquipement.creatureEquip = MetaEquipement.EMPTY_EQUIPEMENT;
               break;
            case ModelEquipement.TYPE_WEAPON:
               this._metaUnit.playerEquipement.weaponEquip = MetaEquipement.EMPTY_EQUIPEMENT;
               break;
            case ModelEquipement.TYPE_SHIELD:
               this._metaUnit.playerEquipement.shieldEquip = MetaEquipement.EMPTY_EQUIPEMENT;
               break;
            case ModelEquipement.TYPE_ARMOR:
               this._metaUnit.playerEquipement.armorEquip = MetaEquipement.EMPTY_EQUIPEMENT;
               break;
            case ModelEquipement.TYPE_SPECIAL:
               this._metaUnit.playerEquipement.specialEquip = MetaEquipement.EMPTY_EQUIPEMENT;
         }
         this.SetMetaUnit(this._metaUnit);
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this._playerEquipementView.Refresh();
         this._playerStatsView.Refresh();
         this._unitView.Refresh();
         this.CheckOffsetUnit();
         this.RefreshLockSlot(this._metaUnit);
         this.RefreshText();
      }
      
      public function get playerStats() : MovieClip
      {
         return visual.getChildByName("PlayerStats") as MovieClip;
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
      
      public function get unitNameTxt() : TextField
      {
         return visual.getChildByName("unitNameTxt") as TextField;
      }
      
      public function SubUnit() : void
      {
         --this._metaUnit.quantity;
         this.SetMetaUnit(this._metaUnit);
      }
      
      public function CheckLockSlot(metaEquipement:MetaEquipement) : Boolean
      {
         switch(metaEquipement.modelEquipement.type)
         {
            case ModelEquipement.TYPE_CREATURE:
               if(this._creatureLock.isLocked())
               {
                  return true;
               }
               break;
            case ModelEquipement.TYPE_WEAPON:
               if(this._weaponLock.isLocked())
               {
                  return true;
               }
               break;
            case ModelEquipement.TYPE_SHIELD:
               if(this._shieldLock.isLocked())
               {
                  return true;
               }
               break;
            case ModelEquipement.TYPE_ARMOR:
               if(this._armorLock.isLocked())
               {
                  return true;
               }
               break;
            case ModelEquipement.TYPE_SPECIAL:
               if(this._specialLock.isLocked())
               {
                  return true;
               }
         }
         return false;
      }
      
      public function get playerEquipement() : MovieClip
      {
         return visual.getChildByName("PlayerEquipementView") as MovieClip;
      }
      
      public function set metaUnit(metaUnit:BC_MetaUnit) : void
      {
         this._metaUnit = metaUnit;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._playerEquipementView.Destroy();
         this._playerStatsView.Destroy();
         this._unitView.OffSet(0,0);
         this._unitView.animContainer.scaleX = 1;
         this._unitView.animContainer.scaleY = 1;
         this._unitView.quantityText.visible = true;
         this._unitView.shadow.visible = true;
         this._unitView.Destroy();
         this._creatureLock.Destroy();
         this._weaponLock.Destroy();
         this._shieldLock.Destroy();
         this._armorLock.Destroy();
         this._specialLock.Destroy();
      }
      
      public function get unitValueTxt() : TextField
      {
         return visual.getChildByName("unitValueTxt") as TextField;
      }
      
      public function get weaponLock() : MovieClip
      {
         return visual.getChildByName("weaponLock") as MovieClip;
      }
      
      public function LockSlot(metaEquipement:MetaEquipement) : void
      {
         if(metaEquipement.is2Hand() || metaEquipement.isSpear() || metaEquipement.isBow() || metaEquipement.isMusket() || metaEquipement.isStaff())
         {
            this._shieldLock.Lock();
            this._playerEquipementView.ShieldsSlot.visible = false;
            this.removeEquipement(this._metaUnit.playerEquipement.shieldEquip);
         }
         if(metaEquipement.isArtillery())
         {
            this._weaponLock.Lock();
            this._playerEquipementView.WeaponsSlot.visible = false;
            this.removeEquipement(this._metaUnit.playerEquipement.weaponEquip);
            this._shieldLock.Lock();
            this._playerEquipementView.ShieldsSlot.visible = false;
            this.removeEquipement(this._metaUnit.playerEquipement.shieldEquip);
            this._armorLock.Lock();
            this._playerEquipementView.ArmorsSlot.visible = false;
            this.removeEquipement(this._metaUnit.playerEquipement.armorEquip);
            this._specialLock.Lock();
            this._playerEquipementView.SpecialsSlot.visible = false;
            this.removeEquipement(this._metaUnit.playerEquipement.specialEquip);
         }
      }
      
      override public function Update() : void
      {
         super.Update();
         this.unitNameTxt.y = this._startingUnitNameTxtY;
         this.unitNameTxt.y += Math.abs((this.unitNameTxt.height - (this.unitNameTxt.textHeight + 5)) / 2);
      }
      
      public function AddEquipement(metaEquipement:MetaEquipement, playSound:Boolean) : MetaEquipement
      {
         if(metaEquipement.modelEquipement.id < 0)
         {
            return MetaEquipement.EMPTY_EQUIPEMENT;
         }
         if(this.CheckLockSlot(metaEquipement))
         {
            return MetaEquipement.EMPTY_EQUIPEMENT;
         }
         if(playSound)
         {
            Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_EQUIPITEM);
         }
         var returnEquipement:MetaEquipement = new MetaEquipement(0,ModelEquipementEnum.EQUIPEMENT_NULL);
         switch(metaEquipement.modelEquipement.type)
         {
            case ModelEquipement.TYPE_CREATURE:
               returnEquipement.copy(this._metaUnit.playerEquipement.creatureEquip);
               this._metaUnit.playerEquipement.creatureEquip = metaEquipement;
               break;
            case ModelEquipement.TYPE_WEAPON:
               returnEquipement.copy(this._metaUnit.playerEquipement.weaponEquip);
               this._metaUnit.playerEquipement.weaponEquip = metaEquipement;
               break;
            case ModelEquipement.TYPE_SHIELD:
               returnEquipement.copy(this._metaUnit.playerEquipement.shieldEquip);
               this._metaUnit.playerEquipement.shieldEquip = metaEquipement;
               break;
            case ModelEquipement.TYPE_ARMOR:
               returnEquipement.copy(this._metaUnit.playerEquipement.armorEquip);
               this._metaUnit.playerEquipement.armorEquip = metaEquipement;
               break;
            case ModelEquipement.TYPE_SPECIAL:
               returnEquipement.copy(this._metaUnit.playerEquipement.specialEquip);
               this._metaUnit.playerEquipement.specialEquip = metaEquipement;
         }
         this._playerEquipementView.SetGroupEquipement(this._metaUnit.playerEquipement);
         this.SetMetaUnit(this._metaUnit);
         return returnEquipement;
      }
   }
}

