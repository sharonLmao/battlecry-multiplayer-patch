package com.battlecry.screens.view
{
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.screens.Units.UnitView;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class ArmyView extends BC_ObjectGroupView
   {
      
      private var _metaArmy:BC_MetaArmy;
      
      public function ArmyView(visual:MovieClip)
      {
         super(visual);
         AddView(new SquadView(this.squad0));
         AddView(new SquadView(this.squad1));
         AddView(new SquadView(this.squad2));
         AddView(new SquadView(this.squad3));
         AddView(new SquadView(this.squad4));
         if(this.armyPoint)
         {
            this.armyPoint.mouseEnabled = false;
         }
      }
      
      public function set metaArmy(metaArmy:BC_MetaArmy) : void
      {
         this._metaArmy = metaArmy;
      }
      
      override public function Update() : void
      {
         super.Update();
      }
      
      public function get armyPoint() : TextField
      {
         return visual.getChildByName("armyPoint") as TextField;
      }
      
      public function FlashAllSquad(color:int, genre:int) : void
      {
         (views[0] as SquadView).FlashAll(color,genre);
         (views[1] as SquadView).FlashAll(color,genre);
         (views[2] as SquadView).FlashAll(color,genre);
         (views[3] as SquadView).FlashAll(color,genre);
         (views[4] as SquadView).FlashAll(color,genre);
      }
      
      public function get metaArmy() : BC_MetaArmy
      {
         return this._metaArmy;
      }
      
      private function SortDepthOnY() : void
      {
         for(var i:int = 0; i < views.length; i++)
         {
            if(((views[i] as SquadView).views[0] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[0] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[6] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[6] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[12] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[12] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[1] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[1] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[7] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[7] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[13] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[13] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[2] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[2] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[8] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[8] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[14] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[14] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[3] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[3] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[9] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[9] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[15] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[15] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[4] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[4] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[10] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[10] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[16] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[16] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[5] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[5] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[11] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[11] as UnitView).visual);
            }
            if(((views[i] as SquadView).views[17] as UnitView).metaUnit.id >= 0)
            {
               (views[i] as SquadView).visual.addChild(((views[i] as SquadView).views[17] as UnitView).visual);
            }
         }
      }
      
      public function get squad0() : MovieClip
      {
         return visual.getChildByName("squad0") as MovieClip;
      }
      
      public function RemoveAllHighLight() : void
      {
         for(var i:int = 0; i < views.length; i++)
         {
            (views[i] as SquadView).RemoveAllHighLight();
         }
      }
      
      public function get squad2() : MovieClip
      {
         return visual.getChildByName("squad2") as MovieClip;
      }
      
      public function get squad3() : MovieClip
      {
         return visual.getChildByName("squad3") as MovieClip;
      }
      
      public function get squad4() : MovieClip
      {
         return visual.getChildByName("squad4") as MovieClip;
      }
      
      override public function Refresh() : void
      {
         var s:SquadView = null;
         super.Refresh();
         if(this.armyPoint)
         {
            this.armyPoint.text = this._metaArmy.totalPoint + "";
         }
         for(var i:int = 0; i < views.length; i++)
         {
            s = views[i] as SquadView;
            s.ShowUsedTile();
         }
      }
      
      public function get squad1() : MovieClip
      {
         return visual.getChildByName("squad1") as MovieClip;
      }
      
      public function SetArmy(metaArmy:BC_MetaArmy) : void
      {
         this._metaArmy = metaArmy;
         if(this._metaArmy.teamId == 5)
         {
            this.squad0.visible = false;
            this.squad1.visible = false;
            this.squad4.visible = false;
         }
         else
         {
            this.squad0.visible = true;
            this.squad1.visible = true;
            this.squad4.visible = true;
         }
         (views[0] as SquadView).SetMetaSquad(metaArmy.metaSquad1);
         (views[1] as SquadView).SetMetaSquad(metaArmy.metaSquad2);
         (views[2] as SquadView).SetMetaSquad(metaArmy.metaSquad3);
         (views[3] as SquadView).SetMetaSquad(metaArmy.metaSquad4);
         (views[4] as SquadView).SetMetaSquad(metaArmy.metaSquad5);
         (views[0] as SquadView).SetUnitGroup(metaArmy.metaSquad1.unitVector);
         (views[1] as SquadView).SetUnitGroup(metaArmy.metaSquad2.unitVector);
         (views[2] as SquadView).SetUnitGroup(metaArmy.metaSquad3.unitVector);
         (views[3] as SquadView).SetUnitGroup(metaArmy.metaSquad4.unitVector);
         (views[4] as SquadView).SetUnitGroup(metaArmy.metaSquad5.unitVector);
         this.SortDepthOnY();
      }
   }
}

