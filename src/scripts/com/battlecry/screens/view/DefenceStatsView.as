package com.battlecry.screens.view
{
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.MetaPlayerEquipement;
   import com.battlecry.meta.MetaStatsList;
   import com.battlecry.meta.MetaType;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class DefenceStatsView extends BC_ObjectGroupView
   {
      
      private var _typeVector:Vector.<MetaType> = new Vector.<MetaType>();
      
      public function DefenceStatsView(visual:MovieClip)
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
      
      public function get defenceValue() : TextField
      {
         return visual.getChildByName("defenceValue") as TextField;
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
         if(metaPlayerEquipement.SlashResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_SLASHING,metaPlayerEquipement.SlashResist);
            j++;
         }
         if(metaPlayerEquipement.BluntResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_BLUNT,metaPlayerEquipement.BluntResist);
            j++;
         }
         if(metaPlayerEquipement.PierceResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_PIERCING,metaPlayerEquipement.PierceResist);
            j++;
         }
         if(metaPlayerEquipement.ExplosionResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_EXPLOSION,metaPlayerEquipement.ExplosionResist);
            j++;
         }
         if(metaPlayerEquipement.FireResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_FIRE,metaPlayerEquipement.FireResist);
            j++;
         }
         if(metaPlayerEquipement.IceResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_ICE,metaPlayerEquipement.IceResist);
            j++;
         }
         if(metaPlayerEquipement.PoisonResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_POISON,metaPlayerEquipement.PoisonResist);
            j++;
         }
         if(metaPlayerEquipement.LightningResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_LIGHTNING,metaPlayerEquipement.LightningResist);
            j++;
         }
         if(metaPlayerEquipement.DarkResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_DARK,metaPlayerEquipement.DarkResist);
            j++;
         }
         if(metaPlayerEquipement.HolyResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_HOLY,metaPlayerEquipement.HolyResist);
            j++;
         }
      }
      
      private function CalculateEquipementStats(metaEquipement:MetaEquipement) : void
      {
         var j:int = 0;
         var metaStatsList:MetaStatsList = metaEquipement.modelEquipement.metaStatsList;
         if(metaStatsList.slashResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_SLASHING,metaStatsList.slashResist);
            j++;
         }
         if(metaStatsList.bluntResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_BLUNT,metaStatsList.bluntResist);
            j++;
         }
         if(metaStatsList.piercingResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_PIERCING,metaStatsList.piercingResist);
            j++;
         }
         if(metaStatsList.explosionResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_EXPLOSION,metaStatsList.explosionResist);
            j++;
         }
         if(metaStatsList.fireResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_FIRE,metaStatsList.fireResist);
            j++;
         }
         if(metaStatsList.iceResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_ICE,metaStatsList.iceResist);
            j++;
         }
         if(metaStatsList.poisonResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_POISON,metaStatsList.poisonResist);
            j++;
         }
         if(metaStatsList.lightningResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_LIGHTNING,metaStatsList.lightningResist);
            j++;
         }
         if(metaStatsList.darkResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_DARK,metaStatsList.darkResist);
            j++;
         }
         if(metaStatsList.holyResist != 0)
         {
            this._typeVector[j] = new MetaType(MetaType.TYPE_HOLY,metaStatsList.holyResist);
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

