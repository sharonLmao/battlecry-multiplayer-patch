package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.Main;
   import com.battlecry.battle.GridPos;
   import com.battlecry.exported.UNITEQUIPDETAIL;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.BC_MetaSquad;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.meta.metaShadow;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelEquipementEnum;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.screens.ArmyCreationScreen;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.QuestionScreen;
   import com.battlecry.screens.Units.UnitView;
   import com.battlecry.specialEffect.aura.Aura;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.io.KeyManager;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   
   public class UnitTransferView extends ObjectView
   {
      
      private var _armyView:ArmyView;
      
      private var _armyCreationScreen:ArmyCreationScreen;
      
      private var _UnitGroupView:UnitGroupView;
      
      private var _pendingUnitView:UnitView;
      
      private var _onOverActive:Boolean;
      
      private var _controlKey:Boolean;
      
      private var _metaArmy:BC_MetaArmy;
      
      private var _context:BC_Game;
      
      public function UnitTransferView(visual:MovieClip, group1:UnitGroupView, group2:ArmyView, context:BC_Game, armyCreationScreen:ArmyCreationScreen)
      {
         var s:SquadView = null;
         var j:int = 0;
         var u:UnitView = null;
         super(visual);
         this._context = context;
         this._onOverActive = false;
         this._controlKey = false;
         this._armyCreationScreen = armyCreationScreen;
         this._pendingUnitView = new UnitView(AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_EMPTY),true);
         this._pendingUnitView.visual.visible = false;
         this._pendingUnitView.visual.mouseEnabled = false;
         this._pendingUnitView.visual.mouseChildren = false;
         this._pendingUnitView.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
         this._pendingUnitView.SetIdle();
         visual.addChild(this._pendingUnitView.visual);
         this._UnitGroupView = group1;
         this._metaArmy = BC_GameProgress.gameProgess.CurrentSelectedArmy();
         this._UnitGroupView.Init(this._metaArmy.unitInventory);
         this._armyView = group2;
         this._armyView.SetArmy(this._metaArmy);
         for(var i:int = 0; i < this._armyView.views.length; i++)
         {
            s = this._armyView.views[i] as SquadView;
            s.SetArmyCreationScreen(armyCreationScreen);
            for(j = 0; j < s.views.length; j++)
            {
               u = s.views[j] as UnitView;
               u.hitArea.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickInView);
            }
         }
      }
      
      public function set unitGroupView(unitGroupView:UnitGroupView) : void
      {
         this._UnitGroupView = unitGroupView;
      }
      
      private function AddUnitToArmy(mc:MovieClip, unitView:UnitView) : Boolean
      {
         var metaUnit:BC_MetaUnit = unitView.metaUnit;
         if(metaUnit.playerEquipement.Value > this._metaArmy.totalPoint)
         {
            return false;
         }
         var metaSquad:BC_MetaSquad = (this._armyView.GetViewFromVisual(mc.parent as MovieClip) as SquadView).metaSquad;
         var posInSquad:GridPos = this.GetPosInSquad(unitView);
         return this._metaArmy.AddUnitToArmy(posInSquad,metaUnit,metaSquad);
      }
      
      public function ShowHighLight(mc:MovieClip, unitView:UnitView, targetView:UnitView) : void
      {
         var squadView:SquadView = this._armyView.GetViewFromVisual(mc.parent as MovieClip) as SquadView;
         var posInSquad:GridPos = this.GetPosInSquad(unitView);
         squadView.showHighLight(posInSquad,targetView);
      }
      
      public function SwitchArmy() : void
      {
         this._controlKey = false;
         this._pendingUnitView.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
         this._pendingUnitView.SetIdle();
      }
      
      private function DropUnit(e:MouseEvent) : void
      {
         var v2:UnitView = null;
         var tempoID:int = 0;
         var tempoMetaUnit:BC_MetaUnit = null;
         var tempoMetaPos:int = 0;
         var q:QuestionScreen = null;
         visual.stage.removeEventListener(MouseEvent.MOUSE_UP,this.DropUnit);
         var mc:MovieClip = e.target as MovieClip;
         var v1:UnitView = this._UnitGroupView.GetViewFromVisual(mc) as UnitView;
         if(Boolean(mc) && v1 == null)
         {
            mc = mc.parent as MovieClip;
            if(mc is UNITEQUIPDETAIL)
            {
               v2 = (this._armyView.GetViewFromVisual(mc.parent as MovieClip) as SquadView).GetViewFromVisual(mc) as UnitView;
            }
         }
         if(this._pendingUnitView.metaUnit.id < 0)
         {
            return;
         }
         if(Boolean(v2) && v2.metaUnit.id < 0)
         {
            tempoID = v2.metaUnit.id;
            if(tempoID == -2)
            {
               tempoMetaUnit = (v2.metaUnit as metaShadow).root;
               tempoMetaPos = (v2.metaUnit as metaShadow).posInVector;
            }
            v2.SetMetaUnit(this._pendingUnitView.metaUnit);
            if(!this.AddUnitToArmy(mc,v2))
            {
               if(v2.metaUnit.playerEquipement.Value > this._metaArmy.totalPoint)
               {
                  q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
                  q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_NOT_BELLOW_0));
               }
               this._UnitGroupView.returnUnit(this._pendingUnitView);
               if(tempoID == -1)
               {
                  v2.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
               }
               else
               {
                  v2.SetMetaUnit(new metaShadow(tempoMetaUnit,tempoMetaPos));
               }
               v2.Refresh();
            }
            else
            {
               this.CheckFlashEffect(mc,this._pendingUnitView.metaUnit,false);
               this._armyView.SetArmy(this._metaArmy);
            }
         }
         else
         {
            this._UnitGroupView.returnUnit(this._pendingUnitView);
         }
         this._pendingUnitView.visual.visible = false;
         this._pendingUnitView.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
         this._pendingUnitView.SetIdle();
         if(this._onOverActive)
         {
            this.RemoveRollOver();
         }
         this.Refresh();
         this._armyCreationScreen.CheckActivateSaveArmy();
      }
      
      private function GetPosInSquad(unitView:UnitView) : GridPos
      {
         var name:String = unitView.visual.name;
         switch(name)
         {
            case "unit0":
               return new GridPos(0,0);
            case "unit1":
               return new GridPos(0,1);
            case "unit2":
               return new GridPos(0,2);
            case "unit3":
               return new GridPos(0,3);
            case "unit4":
               return new GridPos(0,4);
            case "unit5":
               return new GridPos(0,5);
            case "unit6":
               return new GridPos(1,0);
            case "unit7":
               return new GridPos(1,1);
            case "unit8":
               return new GridPos(1,2);
            case "unit9":
               return new GridPos(1,3);
            case "unit10":
               return new GridPos(1,4);
            case "unit11":
               return new GridPos(1,5);
            case "unit12":
               return new GridPos(2,0);
            case "unit13":
               return new GridPos(2,1);
            case "unit14":
               return new GridPos(2,2);
            case "unit15":
               return new GridPos(2,3);
            case "unit16":
               return new GridPos(2,4);
            case "unit17":
               return new GridPos(2,5);
            default:
               return new GridPos(0,0);
         }
      }
      
      private function RemoveUnitFromArmy(mc:MovieClip, unitView:UnitView) : void
      {
         var metaUnit:BC_MetaUnit = unitView.metaUnit;
         var metaSquad:BC_MetaSquad = (this._armyView.GetViewFromVisual(mc.parent as MovieClip) as SquadView).metaSquad;
         var posInSquad:GridPos = this.GetPosInSquad(unitView);
         this._metaArmy.RemoveUnitFromArmy(posInSquad,metaUnit,metaSquad);
      }
      
      private function onOver(e:MouseEvent) : void
      {
         var v2:UnitView = null;
         this._onOverActive = true;
         var mc:MovieClip = (e.target as MovieClip).parent as MovieClip;
         if(mc is UNITEQUIPDETAIL)
         {
            v2 = (this._armyView.GetViewFromVisual(mc.parent as MovieClip) as SquadView).GetViewFromVisual(mc) as UnitView;
            this.ShowHighLight(mc,v2,this._pendingUnitView);
         }
      }
      
      public function set pendingUnitView(pendingUnitView:UnitView) : void
      {
         this._pendingUnitView = pendingUnitView;
      }
      
      private function GetFlashColor(m:ModelEquipement, remove:Boolean) : int
      {
         var color:int = 16777215;
         if(remove)
         {
            color = 6697728;
         }
         else if(m.id == ModelEquipementEnum.SPECIAL_STATICORB.id || m.id == ModelEquipementEnum.CREATURE_FAMINE.id || m.id == ModelEquipementEnum.SHIELD_AODANSHIELD.id || m.id == ModelEquipementEnum.SHIELD_ULTRASHIELD.id || m.id == ModelEquipementEnum.SPECIAL_APOCALYPSEHORSE.id || m.id == ModelEquipementEnum.SPECIAL_ANTIMAGICFIELD.id || m.id == ModelEquipementEnum.SPECIAL_ULTRARING.id)
         {
            color = 16711680;
         }
         return color;
      }
      
      public function RemoveClickListener() : void
      {
         var v:UnitView = null;
         for(var m:int = 0; m < this._UnitGroupView.views.length; m++)
         {
            v = this._UnitGroupView.views[m] as UnitView;
            v.visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickInView);
         }
      }
      
      private function CheckFlashEffect(mc:MovieClip, metaUnit:BC_MetaUnit, remove:Boolean) : void
      {
         var i:int = 0;
         var a:Aura = null;
         for(i = 0; i < metaUnit.playerEquipement.creatureEquip.modelEquipement.specialEffectVector.length; i++)
         {
            a = metaUnit.playerEquipement.creatureEquip.modelEquipement.specialEffectVector[i] as Aura;
            if(a)
            {
               if(a.range == Aura.RANGE_SQUAD)
               {
                  (this._armyView.GetViewFromVisual(mc.parent as MovieClip) as SquadView).FlashAll(this.GetFlashColor(metaUnit.playerEquipement.creatureEquip.modelEquipement,remove),a.genreCreature);
               }
               else if(a.range == Aura.RANGE_ARMY || a.range == Aura.RANGE_ALL || a.range == Aura.RANGE_ALL_ELEMENTAL && metaUnit.playerEquipement.creatureEquip.modelEquipement.isElemental())
               {
                  this._armyView.FlashAllSquad(this.GetFlashColor(metaUnit.playerEquipement.creatureEquip.modelEquipement,remove),a.genreCreature);
               }
            }
         }
         for(i = 0; i < metaUnit.playerEquipement.weaponEquip.modelEquipement.specialEffectVector.length; i++)
         {
            a = metaUnit.playerEquipement.weaponEquip.modelEquipement.specialEffectVector[i] as Aura;
            if(a)
            {
               if(a.range == Aura.RANGE_SQUAD)
               {
                  (this._armyView.GetViewFromVisual(mc.parent as MovieClip) as SquadView).FlashAll(this.GetFlashColor(metaUnit.playerEquipement.weaponEquip.modelEquipement,remove),a.genreCreature);
               }
               else if(a.range == Aura.RANGE_ARMY || a.range == Aura.RANGE_ALL || a.range == Aura.RANGE_ALL_ELEMENTAL && metaUnit.playerEquipement.creatureEquip.modelEquipement.isElemental())
               {
                  this._armyView.FlashAllSquad(this.GetFlashColor(metaUnit.playerEquipement.weaponEquip.modelEquipement,remove),a.genreCreature);
               }
            }
         }
         for(i = 0; i < metaUnit.playerEquipement.shieldEquip.modelEquipement.specialEffectVector.length; i++)
         {
            a = metaUnit.playerEquipement.shieldEquip.modelEquipement.specialEffectVector[i] as Aura;
            if(a)
            {
               if(a.range == Aura.RANGE_SQUAD)
               {
                  (this._armyView.GetViewFromVisual(mc.parent as MovieClip) as SquadView).FlashAll(this.GetFlashColor(metaUnit.playerEquipement.shieldEquip.modelEquipement,remove),a.genreCreature);
               }
               else if(a.range == Aura.RANGE_ARMY || a.range == Aura.RANGE_ALL || a.range == Aura.RANGE_ALL_ELEMENTAL && metaUnit.playerEquipement.creatureEquip.modelEquipement.isElemental())
               {
                  this._armyView.FlashAllSquad(this.GetFlashColor(metaUnit.playerEquipement.shieldEquip.modelEquipement,remove),a.genreCreature);
               }
            }
         }
         for(i = 0; i < metaUnit.playerEquipement.armorEquip.modelEquipement.specialEffectVector.length; i++)
         {
            a = metaUnit.playerEquipement.armorEquip.modelEquipement.specialEffectVector[i] as Aura;
            if(a)
            {
               if(a.range == Aura.RANGE_SQUAD)
               {
                  (this._armyView.GetViewFromVisual(mc.parent as MovieClip) as SquadView).FlashAll(this.GetFlashColor(metaUnit.playerEquipement.armorEquip.modelEquipement,remove),a.genreCreature);
               }
               else if(a.range == Aura.RANGE_ARMY || a.range == Aura.RANGE_ALL || a.range == Aura.RANGE_ALL_ELEMENTAL && metaUnit.playerEquipement.creatureEquip.modelEquipement.isElemental())
               {
                  this._armyView.FlashAllSquad(this.GetFlashColor(metaUnit.playerEquipement.armorEquip.modelEquipement,remove),a.genreCreature);
               }
            }
         }
         for(i = 0; i < metaUnit.playerEquipement.specialEquip.modelEquipement.specialEffectVector.length; i++)
         {
            a = metaUnit.playerEquipement.specialEquip.modelEquipement.specialEffectVector[i] as Aura;
            if(a)
            {
               if(a.range == Aura.RANGE_SQUAD)
               {
                  (this._armyView.GetViewFromVisual(mc.parent as MovieClip) as SquadView).FlashAll(this.GetFlashColor(metaUnit.playerEquipement.specialEquip.modelEquipement,remove),a.genreCreature);
               }
               else if(a.range == Aura.RANGE_ARMY || a.range == Aura.RANGE_ALL || a.range == Aura.RANGE_ALL_ELEMENTAL && metaUnit.playerEquipement.creatureEquip.modelEquipement.isElemental())
               {
                  this._armyView.FlashAllSquad(this.GetFlashColor(metaUnit.playerEquipement.specialEquip.modelEquipement,remove),a.genreCreature);
               }
            }
         }
      }
      
      public function AddClickListener() : void
      {
         var v:UnitView = null;
         for(var m:int = 0; m < this._UnitGroupView.views.length; m++)
         {
            v = this._UnitGroupView.views[m] as UnitView;
            v.visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickInView);
         }
      }
      
      public function set metaArmy(metaArmy:BC_MetaArmy) : void
      {
         this._metaArmy = metaArmy;
      }
      
      public function AddItemsToInventory(metaUnit:BC_MetaUnit) : void
      {
         this._metaArmy.ReturnUnitItems(metaUnit);
      }
      
      public function get metaArmy() : BC_MetaArmy
      {
         return this._metaArmy;
      }
      
      public function get unitGroupView() : UnitGroupView
      {
         return this._UnitGroupView;
      }
      
      override public function Destroy() : void
      {
         var s:SquadView = null;
         var j:int = 0;
         var u:UnitView = null;
         var v:UnitView = null;
         this._pendingUnitView.Destroy();
         super.Destroy();
         for(var i:int = 0; i < this._armyView.views.length; i++)
         {
            s = this._armyView.views[i] as SquadView;
            for(j = 0; j < s.views.length; j++)
            {
               u = s.views[j] as UnitView;
               u.visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickInView);
               u.Destroy();
               u = null;
            }
         }
         for(var m:int = 0; m < this._UnitGroupView.views.length; m++)
         {
            v = this._UnitGroupView.views[m] as UnitView;
            v.visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickInView);
            v.Destroy();
            v = null;
         }
         this._UnitGroupView.Destroy();
         this._armyView.Destroy();
      }
      
      public function RemoveUnitFromInventory(metaUnit:BC_MetaUnit) : void
      {
         if(metaUnit.id < 0)
         {
            return;
         }
         this._metaArmy.ReturnUnitFromArmyToInventory(metaUnit);
         this._metaArmy.ReturnUnitItems(metaUnit);
         this._metaArmy.RemoveUnitFromInventory(metaUnit);
         this.SetMetaArmy(this._metaArmy);
         this.Refresh();
      }
      
      public function SetMetaArmy(armyMeta:BC_MetaArmy) : void
      {
         this.RemoveClickListener();
         this._metaArmy = armyMeta;
         this.RefreshUnitInventory();
         this._armyView.SetArmy(this._metaArmy);
         this.AddClickListener();
      }
      
      public function ResetArmy() : void
      {
         var s:SquadView = null;
         var j:int = 0;
         var u:UnitView = null;
         BC_GameProgress.gameProgess.CurrentSelectedArmy().ResetArmy();
         for(var i:int = 0; i < this._armyView.views.length; i++)
         {
            s = this._armyView.views[i] as SquadView;
            for(j = 0; j < s.views.length; j++)
            {
               u = s.views[j];
               this._UnitGroupView.returnUnit(u);
               u.SetMetaUnit(new BC_MetaUnit(-1));
            }
         }
         this._pendingUnitView.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
         this._pendingUnitView.SetIdle();
         this.Refresh();
      }
      
      private function CreateRollOver() : void
      {
         var s:SquadView = null;
         var j:int = 0;
         var u:UnitView = null;
         for(var i:int = 0; i < this._armyView.views.length; i++)
         {
            s = this._armyView.views[i] as SquadView;
            for(j = 0; j < s.views.length; j++)
            {
               u = s.views[j] as UnitView;
               u.visual.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
               u.visual.addEventListener(MouseEvent.MOUSE_OUT,this.onOut);
            }
         }
      }
      
      private function onOut(e:MouseEvent) : void
      {
         this.RemoveAllHighLight();
      }
      
      public function get pendingUnitView1() : MovieClip
      {
         return visual.getChildByName("pendingUnitView") as MovieClip;
      }
      
      private function RemoveRollOver() : void
      {
         var s:SquadView = null;
         var j:int = 0;
         var u:UnitView = null;
         this.RemoveAllHighLight();
         for(var i:int = 0; i < this._armyView.views.length; i++)
         {
            s = this._armyView.views[i] as SquadView;
            for(j = 0; j < s.views.length; j++)
            {
               u = s.views[j] as UnitView;
               u.visual.removeEventListener(MouseEvent.MOUSE_OVER,this.onOver);
               u.visual.removeEventListener(MouseEvent.MOUSE_OUT,this.onOut);
               this._onOverActive = false;
            }
         }
      }
      
      public function RemoveItemsFromInventory(metaUnit:BC_MetaUnit) : void
      {
         this._metaArmy.RemoveUnitItems(metaUnit);
      }
      
      override public function Update() : void
      {
         super.Update();
         this._pendingUnitView.Update();
         this._pendingUnitView.FollowMouse(this._context);
         this._UnitGroupView.Update();
         this._armyView.Update();
         if(KeyManager.IsKeyDown(Keyboard.CONTROL))
         {
            if(this._controlKey)
            {
               return;
            }
            if(this._UnitGroupView.selectedMetaUnit.quantity > 0 && this._UnitGroupView.selectedMetaUnit.id > 0)
            {
            }
            this._controlKey = true;
            this._pendingUnitView.SetMetaUnit(this._UnitGroupView.selectedMetaUnit);
            this._pendingUnitView.SetIdle();
            this.CreateRollOver();
            this.Refresh();
         }
         else
         {
            if(!this._controlKey)
            {
               return;
            }
            this._controlKey = false;
            this._pendingUnitView.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
            this._pendingUnitView.SetIdle();
            this.RemoveRollOver();
            this.Refresh();
         }
      }
      
      public function get pendingUnitView() : UnitView
      {
         return this._pendingUnitView;
      }
      
      private function onClickInView(e:Event) : void
      {
         var tempoID:int = 0;
         var tempoMetaUnit:BC_MetaUnit = null;
         var tempoMetaPos:int = 0;
         var q:QuestionScreen = null;
         var v2:UnitView = null;
         var mc:MovieClip = e.target as MovieClip;
         var v1:UnitView = this._UnitGroupView.GetViewFromVisual(mc) as UnitView;
         if(v1 == null)
         {
            if(mc is UNITEQUIPDETAIL)
            {
               v2 = (this._armyView.GetViewFromVisual(mc.parent as MovieClip) as SquadView).GetViewFromVisual(mc) as UnitView;
            }
            else
            {
               mc = mc.parent as MovieClip;
               if(mc is UNITEQUIPDETAIL)
               {
                  v2 = (this._armyView.GetViewFromVisual(mc.parent as MovieClip) as SquadView).GetViewFromVisual(mc) as UnitView;
               }
            }
         }
         if(this._pendingUnitView.metaUnit.id >= 0 && !this._controlKey)
         {
            if(Boolean(v2) && v2.metaUnit.id < 0)
            {
               tempoID = v2.metaUnit.id;
               if(tempoID == -2)
               {
                  tempoMetaUnit = (v2.metaUnit as metaShadow).root;
                  tempoMetaPos = (v2.metaUnit as metaShadow).posInVector;
               }
               v2.SetMetaUnit(this._pendingUnitView.metaUnit);
               if(!this.AddUnitToArmy(mc,v2))
               {
                  if(v2.metaUnit.playerEquipement.Value > this._metaArmy.totalPoint)
                  {
                     q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
                     q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_NOT_BELLOW_0));
                  }
                  this._UnitGroupView.returnUnit(this._pendingUnitView);
                  if(tempoID == -1)
                  {
                     v2.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
                  }
                  else
                  {
                     v2.SetMetaUnit(new metaShadow(tempoMetaUnit,tempoMetaPos));
                  }
                  v2.Refresh();
               }
               else
               {
                  this.CheckFlashEffect(mc,this._pendingUnitView.metaUnit,false);
                  this._armyView.SetArmy(this._metaArmy);
               }
            }
            else
            {
               this._UnitGroupView.returnUnit(this._pendingUnitView);
            }
            this._pendingUnitView.visual.visible = false;
            this._pendingUnitView.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
            this._pendingUnitView.SetIdle();
            if(this._onOverActive)
            {
               this.RemoveRollOver();
            }
            this.Refresh();
            this._armyCreationScreen.CheckActivateSaveArmy();
            return;
         }
         if(!this._controlKey)
         {
            if(v1 != null)
            {
               if(v1.metaUnit.id < 0)
               {
                  return;
               }
               this._UnitGroupView.SetSelectView(v1.metaUnit);
               if(v1.metaUnit.quantity <= 0)
               {
                  return;
               }
               this._pendingUnitView.SetMetaUnit(v1.metaUnit);
               this._pendingUnitView.SetIdle();
               --v1.metaUnit.quantity;
               visual.stage.addEventListener(MouseEvent.MOUSE_UP,this.DropUnit);
               this.CreateRollOver();
            }
            else if(v2)
            {
               if(v2.metaUnit.id == -1)
               {
                  return;
               }
               if(v2.metaUnit.id == -2)
               {
                  v2 = (this._armyView.GetViewFromVisual(mc.parent as MovieClip) as SquadView).GetViewFromShadow(v2.metaUnit as metaShadow);
                  if(v2 == null)
                  {
                     return;
                  }
               }
               this._UnitGroupView.SetSelectView(v2.metaUnit);
               this._pendingUnitView.SetMetaUnit(v2.metaUnit);
               this._pendingUnitView.SetIdle();
               this.CheckFlashEffect(mc,this._pendingUnitView.metaUnit,true);
               this.RemoveUnitFromArmy(mc,v2);
               this._armyView.SetArmy(this._metaArmy);
               visual.stage.addEventListener(MouseEvent.MOUSE_UP,this.DropUnit);
               this.CreateRollOver();
            }
         }
         else if(v2)
         {
            if(this._pendingUnitView.metaUnit.id < 0 || this._pendingUnitView.metaUnit.quantity <= 0)
            {
               return;
            }
            if(Boolean(v2) && v2.metaUnit.id < 0)
            {
               tempoID = v2.metaUnit.id;
               if(tempoID == -2)
               {
                  tempoMetaUnit = (v2.metaUnit as metaShadow).root;
                  tempoMetaPos = (v2.metaUnit as metaShadow).posInVector;
               }
               v2.SetMetaUnit(this._pendingUnitView.metaUnit);
               v2.SetIdle();
               if(!this.AddUnitToArmy(mc,v2))
               {
                  if(v2.metaUnit.playerEquipement.Value > this._metaArmy.totalPoint)
                  {
                     q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN) as QuestionScreen;
                     q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_NOT_BELLOW_0));
                  }
                  if(tempoID == -1)
                  {
                     v2.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
                  }
                  else
                  {
                     v2.SetMetaUnit(new metaShadow(tempoMetaUnit,tempoMetaPos));
                  }
                  v2.SetIdle();
                  v2.Refresh();
               }
               else
               {
                  this.CheckFlashEffect(mc,this._pendingUnitView.metaUnit,false);
                  --this._pendingUnitView.metaUnit.quantity;
                  this._armyView.SetArmy(this._metaArmy);
               }
               if(this._onOverActive)
               {
                  this.RemoveRollOver();
               }
               this.CreateRollOver();
               this._armyCreationScreen.CheckActivateSaveArmy();
            }
         }
         this.Refresh();
      }
      
      override public function Refresh() : void
      {
         var s:SquadView = null;
         super.Refresh();
         for(var i:int = 0; i < this._armyView.views.length; i++)
         {
            s = this._armyView.views[i] as SquadView;
            s.ShowUsedTile();
         }
         this._pendingUnitView.Refresh();
         this._UnitGroupView.Refresh();
         this._armyView.Refresh();
      }
      
      public function RemoveUnitFromInventoryAfterEdit(metaUnit:BC_MetaUnit) : void
      {
         if(metaUnit.id < 0)
         {
            return;
         }
         this._metaArmy.ReturnUnitFromArmyToInventory(metaUnit);
         this._metaArmy.RemoveUnitFromInventory(metaUnit);
         this.SetMetaArmy(this._metaArmy);
         this.Refresh();
      }
      
      public function RefreshUnitInventory() : void
      {
         Main.instance.ClearAllCaches();
         for(var k:int = int(this._metaArmy.unitInventory.length - 1); k >= 0; k--)
         {
            if(this._metaArmy.unitInventory[k].id < 0)
            {
               this._metaArmy.unitInventory.splice(k,1);
            }
         }
         this.RemoveClickListener();
         this._UnitGroupView.SetGroupUnit(this._metaArmy.unitInventory);
         this._UnitGroupView.SetSelectView(BC_MetaUnit.EMPTY_UNIT);
         this.AddClickListener();
      }
      
      public function RemoveAllHighLight() : void
      {
         this._armyView.RemoveAllHighLight();
      }
   }
}

