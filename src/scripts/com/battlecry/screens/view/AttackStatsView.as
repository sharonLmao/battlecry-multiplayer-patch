package com.battlecry.screens.view
{
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.MetaPlayerEquipement;
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.meta.MetaType;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class AttackStatsView extends BC_ObjectGroupView
   {
      
      private var _typeVector:Vector.<MetaType> = new Vector.<MetaType>();
      
      public function AttackStatsView(visual:MovieClip)
      {
         super(visual);
         AddView(new TypeView(this.type1));
         AddView(new TypeView(this.type2));
         AddView(new TypeView(this.type3));
         AddView(new TypeView(this.type4));
         AddView(new TypeView(this.type5));
         AddView(new TypeView(this.type6));
         AddView(new TypeView(this.type7));
         AddView(new TypeView(this.type8));
         AddView(new TypeView(this.type9));
         AddView(new TypeView(this.type10));
      }
      
      public function get type10() : MovieClip
      {
         return visual.getChildByName("type10") as MovieClip;
      }
      
      public function SetGroupStats(metaPlayerEquipement:MetaPlayerEquipement) : void
      {
         this.ClearView();
         this.CalculateAllStats(metaPlayerEquipement);
         for(var i:int = 0; i < this._typeVector.length; i++)
         {
            (views[i] as TypeView).SetMetaType(this._typeVector[i]);
         }
      }
      
      public function get type6() : MovieClip
      {
         return visual.getChildByName("type6") as MovieClip;
      }
      
      private function CalculateAllStats(metaPlayerEquipement:MetaPlayerEquipement) : void
      {
         var j:int = 0;
         if(metaPlayerEquipement.SlashAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_SLASHING,metaPlayerEquipement.SlashAttack);
            j++;
         }
         if(metaPlayerEquipement.BluntAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_BLUNT,metaPlayerEquipement.BluntAttack);
            j++;
         }
         if(metaPlayerEquipement.PierceAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_PIERCING,metaPlayerEquipement.PierceAttack);
            j++;
         }
         if(metaPlayerEquipement.ExplosionAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_EXPLOSION,metaPlayerEquipement.ExplosionAttack);
            j++;
         }
         if(metaPlayerEquipement.FireAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_FIRE,metaPlayerEquipement.FireAttack);
            j++;
         }
         if(metaPlayerEquipement.IceAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_ICE,metaPlayerEquipement.IceAttack);
            j++;
         }
         if(metaPlayerEquipement.PoisonAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_POISON,metaPlayerEquipement.PoisonAttack);
            j++;
         }
         if(metaPlayerEquipement.Lightningattack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_LIGHTNING,metaPlayerEquipement.Lightningattack);
            j++;
         }
         if(metaPlayerEquipement.DarkAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_DARK,metaPlayerEquipement.DarkAttack);
            j++;
         }
         if(metaPlayerEquipement.HolyAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_HOLY,metaPlayerEquipement.HolyAttack);
            j++;
         }
      }
      
      private function CalculateEquipementStats(metaEquipement:MetaEquipement) : void
      {
         var j:int = 0;
         var metaStatsList:MetaStatsList = metaEquipement.modelEquipement.metaStatsList;
         if(metaStatsList.slashAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_SLASHING,metaStatsList.slashAttack);
            j++;
         }
         if(metaStatsList.bluntAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_BLUNT,metaStatsList.bluntAttack);
            j++;
         }
         if(metaStatsList.piercingAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_PIERCING,metaStatsList.piercingAttack);
            j++;
         }
         if(metaStatsList.explosionAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_EXPLOSION,metaStatsList.explosionAttack);
            j++;
         }
         if(metaStatsList.fireAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_FIRE,metaStatsList.fireAttack);
            j++;
         }
         if(metaStatsList.iceAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_ICE,metaStatsList.iceAttack);
            j++;
         }
         if(metaStatsList.poisonAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_POISON,metaStatsList.poisonAttack);
            j++;
         }
         if(metaStatsList.lightningAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_LIGHTNING,metaStatsList.lightningAttack);
            j++;
         }
         if(metaStatsList.darkAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_DARK,metaStatsList.darkAttack);
            j++;
         }
         if(metaStatsList.holyAttack != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_HOLY,metaStatsList.holyAttack);
            j++;
         }
      }
      
      public function get type9() : MovieClip
      {
         return visual.getChildByName("type9") as MovieClip;
      }
      
      public function SetGroupStats2(metaEquipement:MetaEquipement) : void
      {
         this.ClearView();
         this.CalculateEquipementStats(metaEquipement);
         for(var i:int = 0; i < this._typeVector.length; i++)
         {
            (views[i] as TypeView).SetMetaType(this._typeVector[i]);
         }
      }
      
      private function ClearView() : void
      {
         for(var i:int = 0; i < this._typeVector.length; i++)
         {
            this._typeVector[i] = MetaType.EMPTY_TYPE;
         }
      }
      
      public function get rangeValue() : TextField
      {
         return visual.getChildByName("rangeValue") as TextField;
      }
      
      public function get type1() : MovieClip
      {
         return visual.getChildByName("type1") as MovieClip;
      }
      
      public function get type3() : MovieClip
      {
         return visual.getChildByName("type3") as MovieClip;
      }
      
      public function get type4() : MovieClip
      {
         return visual.getChildByName("type4") as MovieClip;
      }
      
      public function get type5() : MovieClip
      {
         return visual.getChildByName("type5") as MovieClip;
      }
      
      public function get type7() : MovieClip
      {
         return visual.getChildByName("type7") as MovieClip;
      }
      
      public function get type8() : MovieClip
      {
         return visual.getChildByName("type8") as MovieClip;
      }
      
      public function get type2() : MovieClip
      {
         return visual.getChildByName("type2") as MovieClip;
      }
   }
}

