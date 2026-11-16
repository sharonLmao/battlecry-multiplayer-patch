package com.battlecry.screens.view
{
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.MetaPlayerEquipement;
   import flash.display.MovieClip;
   
   public class PlayerEquipementView extends BC_ObjectGroupView
   {
      
      public function PlayerEquipementView(visual:MovieClip)
      {
         super(visual);
         AddView(new EquipementView(this.CreatureSlot));
         AddView(new EquipementView(this.WeaponsSlot));
         AddView(new EquipementView(this.ShieldsSlot));
         AddView(new EquipementView(this.ArmorsSlot));
         AddView(new EquipementView(this.SpecialsSlot));
      }
      
      public function returnItems(quantity:int = 1) : void
      {
         var i:int = 0;
         for(var j:int = 0; j < quantity; j++)
         {
            for(i = 0; i < views.length; i++)
            {
               ++(views[i] as EquipementView).metaEquipement.quantity;
            }
         }
      }
      
      public function CheckUnitDispo() : Boolean
      {
         var meta:MetaEquipement = null;
         for(var i:int = 0; i < views.length; i++)
         {
            meta = (views[i] as EquipementView).metaEquipement;
            if(meta.modelEquipement.id >= 0)
            {
               if(meta.quantity <= 0)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public function get ArmorsSlot() : MovieClip
      {
         return visual.getChildByName("ArmorsSlot") as MovieClip;
      }
      
      public function SubUnit() : void
      {
         var meta:MetaEquipement = null;
         for(var i:int = 0; i < views.length; i++)
         {
            meta = (views[i] as EquipementView).metaEquipement;
            if(meta.modelEquipement.id >= 0)
            {
               --meta.quantity;
            }
         }
      }
      
      public function get WeaponsSlot() : MovieClip
      {
         return visual.getChildByName("WeaponsSlot") as MovieClip;
      }
      
      public function SetGroupEquipement(metaPlayerEquipement:MetaPlayerEquipement) : void
      {
         (views[0] as EquipementView).setMetaEquipement(metaPlayerEquipement.creatureEquip);
         (views[1] as EquipementView).setMetaEquipement(metaPlayerEquipement.weaponEquip);
         (views[2] as EquipementView).setMetaEquipement(metaPlayerEquipement.shieldEquip);
         (views[3] as EquipementView).setMetaEquipement(metaPlayerEquipement.armorEquip);
         (views[4] as EquipementView).setMetaEquipement(metaPlayerEquipement.specialEquip);
      }
      
      public function get ShieldsSlot() : MovieClip
      {
         return visual.getChildByName("ShieldsSlot") as MovieClip;
      }
      
      public function get CreatureSlot() : MovieClip
      {
         return visual.getChildByName("CreatureSlot") as MovieClip;
      }
      
      public function get equipementDropZone() : MovieClip
      {
         return visual.getChildByName("EquipementDropZone") as MovieClip;
      }
      
      public function get SpecialsSlot() : MovieClip
      {
         return visual.getChildByName("SpecialsSlot") as MovieClip;
      }
   }
}

