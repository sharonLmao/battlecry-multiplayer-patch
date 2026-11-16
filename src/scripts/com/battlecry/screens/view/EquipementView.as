package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelEquipementEnum;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class EquipementView extends ObjectView
   {
      
      private var _metaEquipement:MetaEquipement;
      
      public function EquipementView(visual:MovieClip)
      {
         super(visual);
      }
      
      public function get specials() : MovieClip
      {
         return this.itemEquipement.getChildByName("SpecialsFrame") as MovieClip;
      }
      
      public function IsEmpty() : Boolean
      {
         return this._metaEquipement.modelEquipement.id == -1;
      }
      
      public function get quantityTxt() : TextField
      {
         return visual.getChildByName("quantity_text") as TextField;
      }
      
      public function get itemEquipement() : MovieClip
      {
         return visual.getChildByName("itemEquipement") as MovieClip;
      }
      
      public function RefreshText() : void
      {
         if(this.quantityTxt)
         {
            this.quantityTxt.text = "x" + this._metaEquipement.quantity;
            if(this._metaEquipement.modelEquipement.id < 0)
            {
               this.quantity_BlackBack.visible = false;
               this.quantityTxt.visible = false;
            }
            else
            {
               this.quantity_BlackBack.visible = true;
               this.quantityTxt.visible = true;
            }
         }
      }
      
      public function get shields() : MovieClip
      {
         return this.itemEquipement.getChildByName("ShieldsFrame") as MovieClip;
      }
      
      public function get lock() : MovieClip
      {
         return visual.getChildByName("lock") as MovieClip;
      }
      
      public function get armors() : MovieClip
      {
         return this.itemEquipement.getChildByName("ArmorsFrame") as MovieClip;
      }
      
      public function get btn_Equipment() : ButtonSelect
      {
         return visual.getChildByName("btn_Equipment") as ButtonSelect;
      }
      
      public function set metaEquipement(metaEquipement:MetaEquipement) : void
      {
         this._metaEquipement = metaEquipement;
      }
      
      public function get quantity_BlackBack() : MovieClip
      {
         return visual.getChildByName("quantity_BlackBack") as MovieClip;
      }
      
      public function FollowMouse(context:BC_Game) : void
      {
         visual.x = context.mouseX;
         visual.y = context.mouseY;
      }
      
      public function get metaEquipement() : MetaEquipement
      {
         return this._metaEquipement;
      }
      
      public function setMetaEquipement(metaEquipement:MetaEquipement) : void
      {
         this._metaEquipement = metaEquipement;
         if(metaEquipement.quantity > 0)
         {
            visual.visible = true;
         }
         if(this.quantity_BlackBack)
         {
            this.quantity_BlackBack.mouseChildren = false;
            this.quantity_BlackBack.mouseEnabled = false;
         }
         if(this.quantityTxt)
         {
            this.quantityTxt.mouseEnabled = false;
         }
         this.itemEquipement.mouseChildren = false;
         this.itemEquipement.mouseEnabled = false;
         if(this.btn_Equipment)
         {
            this.btn_Equipment.mouseChildren = false;
            this.btn_Equipment.mouseEnabled = false;
         }
         if(this._metaEquipement.quantity > 0)
         {
            Utils.SetColor(this.itemEquipement);
         }
         this.Refresh();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         if(this._metaEquipement == null)
         {
            return;
         }
         if(this._metaEquipement.modelEquipement.id < 0)
         {
            this.itemEquipement.visible = false;
         }
         else
         {
            this.itemEquipement.visible = true;
         }
         this.itemEquipement.gotoAndStop(this._metaEquipement.modelEquipement.type);
         switch(this._metaEquipement.modelEquipement.type)
         {
            case ModelEquipement.TYPE_CREATURE:
               this.creature.gotoAndStop(this._metaEquipement.modelEquipement.itemVisualFrame);
               break;
            case ModelEquipement.TYPE_WEAPON:
               this.weapons.gotoAndStop(this._metaEquipement.modelEquipement.itemVisualFrame);
               break;
            case ModelEquipement.TYPE_SHIELD:
               this.shields.gotoAndStop(this._metaEquipement.modelEquipement.itemVisualFrame);
               break;
            case ModelEquipement.TYPE_ARMOR:
               this.armors.gotoAndStop(this._metaEquipement.modelEquipement.itemVisualFrame);
               break;
            case ModelEquipement.TYPE_SPECIAL:
               this.specials.gotoAndStop(this._metaEquipement.modelEquipement.itemVisualFrame);
         }
         this.RefreshText();
         if(this.lock)
         {
            this.lock.visible = false;
            if(ModelEquipementEnum.IsItemLocked(this._metaEquipement.modelEquipement))
            {
               this.btn_Equipment.Select();
               this.quantity_BlackBack.visible = false;
               this.quantityTxt.visible = false;
               this.itemEquipement.visible = false;
               this.lock.visible = true;
            }
         }
      }
      
      public function get weapons() : MovieClip
      {
         return this.itemEquipement.getChildByName("WeaponsFrame") as MovieClip;
      }
      
      public function get creature() : MovieClip
      {
         return this.itemEquipement.getChildByName("CreatureFrame") as MovieClip;
      }
   }
}

