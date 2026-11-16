package com.battlecry.screens.view
{
   import com.battlecry.battle.GridPos;
   import com.battlecry.factories.BC_SfxFactory;
   import com.battlecry.meta.BC_MetaSquad;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.meta.metaShadow;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.screens.ArmyCreationScreen;
   import com.battlecry.screens.Units.UnitView;
   import com.battlecry.screens.view.ui.UIEffectFadeOut;
   import com.lachhhEngine.games.sfx.Jukebox;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class SquadView extends BC_ObjectGroupView
   {
      
      private var _armyCreationScreen:ArmyCreationScreen;
      
      private var _metaSquad:BC_MetaSquad;
      
      public function SquadView(visual:MovieClip)
      {
         super(visual);
         AddView(new UnitView(this.unit0,true));
         AddView(new UnitView(this.unit1,true));
         AddView(new UnitView(this.unit2,true));
         AddView(new UnitView(this.unit3,true));
         AddView(new UnitView(this.unit4,true));
         AddView(new UnitView(this.unit5,true));
         AddView(new UnitView(this.unit6,true));
         AddView(new UnitView(this.unit7,true));
         AddView(new UnitView(this.unit8,true));
         AddView(new UnitView(this.unit9,true));
         AddView(new UnitView(this.unit10,true));
         AddView(new UnitView(this.unit11,true));
         AddView(new UnitView(this.unit12,true));
         AddView(new UnitView(this.unit13,true));
         AddView(new UnitView(this.unit14,true));
         AddView(new UnitView(this.unit15,true));
         AddView(new UnitView(this.unit16,true));
         AddView(new UnitView(this.unit17,true));
         if(this.speedBtn)
         {
            this.SpeedText.mouseEnabled = false;
            this.speedBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
            this.speedBtn.addEventListener(MouseEvent.MOUSE_DOWN,this.onSpeedBtn);
         }
         this._armyCreationScreen = null;
      }
      
      public function get unit7() : MovieClip
      {
         return visual.getChildByName("unit7") as MovieClip;
      }
      
      public function get SpeedText() : TextField
      {
         return this.speedMC.getChildByName("SpeedText") as TextField;
      }
      
      public function GetViewFromShadow(metashadow:metaShadow) : UnitView
      {
         return views[metashadow.posInVector] as UnitView;
      }
      
      public function ShowUsedTile() : void
      {
         this.RefreshUsedSquare();
      }
      
      public function SetArmyCreationScreen(armyCreationScreen:ArmyCreationScreen) : void
      {
         this._armyCreationScreen = armyCreationScreen;
      }
      
      public function set metaSquad(metaSquad:BC_MetaSquad) : void
      {
         this._metaSquad = metaSquad;
      }
      
      public function SetMetaSquad(metaSquad:BC_MetaSquad) : void
      {
         this._metaSquad = metaSquad;
         if(this.speedBtn)
         {
            this.SpeedText.text = this._metaSquad.speed.titleStr;
         }
      }
      
      private function onSpeedBtn(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ONCLICK);
         this._metaSquad.SwitchSpeed();
         this.SpeedText.text = this._metaSquad.speed.titleStr;
         if(this._armyCreationScreen)
         {
            this._armyCreationScreen.CheckActivateSaveArmy();
         }
      }
      
      public function RefreshUsedSquare() : void
      {
         for(var m:int = 0; m < views.length; m++)
         {
            (views[m] as UnitView).RefreshUsedSquare();
         }
      }
      
      public function showHighLight(posInSquad:GridPos, targetView:UnitView) : void
      {
         var j:int = 0;
         this.RemoveAllHighLight();
         if(targetView.metaUnit.id < 0)
         {
            return;
         }
         for(var i:int = 0; i < targetView.metaUnit.playerEquipement.largeur; i++)
         {
            for(j = 0; j < targetView.metaUnit.playerEquipement.hauteur; j++)
            {
               if((posInSquad.x - i) * 6 < 0 || posInSquad.y + j >= 6)
               {
                  this.ShowWrongHighLight(posInSquad,targetView);
                  return;
               }
               if((views[(posInSquad.x - i) * 6 + (posInSquad.y + j)] as UnitView).metaUnit.id != -1 || (views[(posInSquad.x - i) * 6 + (posInSquad.y + j)] as UnitView).metaUnit.id == -2)
               {
                  this.ShowWrongHighLight(posInSquad,targetView);
                  return;
               }
               (views[(posInSquad.x - i) * 6 + (posInSquad.y + j)] as UnitView).ShowDispoSquare();
            }
         }
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         if(this.speedBtn)
         {
            this.speedBtn.removeEventListener(MouseEvent.MOUSE_DOWN,this.onSpeedBtn);
            this.speedBtn.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         }
         for(var i:int = 0; i < views.length; i++)
         {
            (views[0] as UnitView).Destroy();
            RemoveView(views[0]);
         }
      }
      
      public function get speedBtn() : ButtonSelect
      {
         return visual.getChildByName("speedBtn") as ButtonSelect;
      }
      
      public function get speedMC() : MovieClip
      {
         return this.speedBtn.getChildByName("speedMC") as MovieClip;
      }
      
      private function onOver(event:MouseEvent) : void
      {
         Jukebox.instance.PlaySound(BC_SfxFactory.ID_SFX_ROLLOVER);
      }
      
      public function get unit10() : MovieClip
      {
         return visual.getChildByName("unit10") as MovieClip;
      }
      
      public function ShowWrongHighLight(posInSquad:GridPos, targetView:UnitView) : void
      {
         var j:int = 0;
         this.RemoveAllHighLight();
         if(targetView.metaUnit.id < 0)
         {
            return;
         }
         for(var i:int = 0; i < targetView.metaUnit.playerEquipement.largeur; i++)
         {
            for(j = 0; j < targetView.metaUnit.playerEquipement.hauteur; j++)
            {
               if(!((posInSquad.x - i) * 6 < 0 || posInSquad.y + j >= 6))
               {
                  (views[(posInSquad.x - i) * 6 + (posInSquad.y + j)] as UnitView).ShowErrorSquare();
               }
            }
         }
      }
      
      public function get unit12() : MovieClip
      {
         return visual.getChildByName("unit12") as MovieClip;
      }
      
      public function get unit13() : MovieClip
      {
         return visual.getChildByName("unit13") as MovieClip;
      }
      
      public function get unit14() : MovieClip
      {
         return visual.getChildByName("unit14") as MovieClip;
      }
      
      public function get unit15() : MovieClip
      {
         return visual.getChildByName("unit15") as MovieClip;
      }
      
      public function get unit16() : MovieClip
      {
         return visual.getChildByName("unit16") as MovieClip;
      }
      
      public function get unit17() : MovieClip
      {
         return visual.getChildByName("unit17") as MovieClip;
      }
      
      public function get unit11() : MovieClip
      {
         return visual.getChildByName("unit11") as MovieClip;
      }
      
      public function get unit1() : MovieClip
      {
         return visual.getChildByName("unit1") as MovieClip;
      }
      
      public function get unit2() : MovieClip
      {
         return visual.getChildByName("unit2") as MovieClip;
      }
      
      public function get unit3() : MovieClip
      {
         return visual.getChildByName("unit3") as MovieClip;
      }
      
      public function get unit4() : MovieClip
      {
         return visual.getChildByName("unit4") as MovieClip;
      }
      
      public function FlashAll(color:int, genre:int) : void
      {
         var u:UnitView = null;
         for(var i:int = 0; i < views.length; i++)
         {
            u = views[i];
            if(genre == 0 || u.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == genre || u.metaUnit.playerEquipement.creatureEquip.modelEquipement.genre == ModelEquipement.GENRE_CREATURE_ALL)
            {
               if(u.anim)
               {
                  UIEffectFadeOut.Create(u.anim,30,color);
               }
            }
         }
      }
      
      public function get unit6() : MovieClip
      {
         return visual.getChildByName("unit6") as MovieClip;
      }
      
      public function get unit0() : MovieClip
      {
         return visual.getChildByName("unit0") as MovieClip;
      }
      
      public function get unit8() : MovieClip
      {
         return visual.getChildByName("unit8") as MovieClip;
      }
      
      public function get unit9() : MovieClip
      {
         return visual.getChildByName("unit9") as MovieClip;
      }
      
      public function RemoveAllHighLight() : void
      {
         for(var m:int = 0; m < views.length; m++)
         {
            (views[m] as UnitView).HideDispoSquare();
            (views[m] as UnitView).HideErrorSquare();
         }
      }
      
      public function get unit5() : MovieClip
      {
         return visual.getChildByName("unit5") as MovieClip;
      }
      
      public function SetUnitGroup(group:Vector.<BC_MetaUnit>) : void
      {
         (views[0] as UnitView).SetMetaUnit(group[0]);
         (views[1] as UnitView).SetMetaUnit(group[1]);
         (views[2] as UnitView).SetMetaUnit(group[2]);
         (views[3] as UnitView).SetMetaUnit(group[3]);
         (views[4] as UnitView).SetMetaUnit(group[4]);
         (views[5] as UnitView).SetMetaUnit(group[5]);
         (views[6] as UnitView).SetMetaUnit(group[6]);
         (views[7] as UnitView).SetMetaUnit(group[7]);
         (views[8] as UnitView).SetMetaUnit(group[8]);
         (views[9] as UnitView).SetMetaUnit(group[9]);
         (views[10] as UnitView).SetMetaUnit(group[10]);
         (views[11] as UnitView).SetMetaUnit(group[11]);
         (views[12] as UnitView).SetMetaUnit(group[12]);
         (views[13] as UnitView).SetMetaUnit(group[13]);
         (views[14] as UnitView).SetMetaUnit(group[14]);
         (views[15] as UnitView).SetMetaUnit(group[15]);
         (views[16] as UnitView).SetMetaUnit(group[16]);
         (views[17] as UnitView).SetMetaUnit(group[17]);
         (views[0] as UnitView).SetIdle();
         (views[1] as UnitView).SetIdle();
         (views[2] as UnitView).SetIdle();
         (views[3] as UnitView).SetIdle();
         (views[4] as UnitView).SetIdle();
         (views[5] as UnitView).SetIdle();
         (views[6] as UnitView).SetIdle();
         (views[7] as UnitView).SetIdle();
         (views[8] as UnitView).SetIdle();
         (views[9] as UnitView).SetIdle();
         (views[10] as UnitView).SetIdle();
         (views[11] as UnitView).SetIdle();
         (views[12] as UnitView).SetIdle();
         (views[13] as UnitView).SetIdle();
         (views[14] as UnitView).SetIdle();
         (views[15] as UnitView).SetIdle();
         (views[16] as UnitView).SetIdle();
         (views[17] as UnitView).SetIdle();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
      }
      
      public function get metaSquad() : BC_MetaSquad
      {
         return this._metaSquad;
      }
   }
}

