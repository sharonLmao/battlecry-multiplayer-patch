package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.ItemDescriptionScreen;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class ItemTransferView extends ObjectView
   {
      
      private var _unitCreateView:UnitCreateView;
      
      private var _currentRarity:int;
      
      private var _descriptionScreen:ItemDescriptionScreen;
      
      private var _metaArmy:BC_MetaArmy;
      
      private var _creatureInventoryView:CreatureInventoryView;
      
      private var _onSelection:Boolean;
      
      private var _rarityArray:Array;
      
      private var _timerToDrag:Number;
      
      private var _itemInventoryView:ItemInventoryView;
      
      private var _pendingItemView:EquipementView;
      
      private var _doubleClickCounter:Number;
      
      private var _context:BC_Game;
      
      private var _doubleClick:Boolean;
      
      public function ItemTransferView(visual:MovieClip, context:BC_Game)
      {
         super(visual);
         this._context = context;
      }
      
      public function get pendingUnitView() : MovieClip
      {
         return visual.getChildByName("pendingUnitView") as MovieClip;
      }
      
      public function getCreatedUnitName() : String
      {
         return this._unitCreateView.unitNameTxt.text;
      }
      
      private function ReturnEquipement(event:MouseEvent) : void
      {
         var v1:EquipementView = null;
         var v2:EquipementView = null;
         this._onSelection = false;
         this._creatureInventoryView.CreatureDropZone.visible = false;
         this._itemInventoryView.ItemDropZone.visible = false;
         visual.stage.removeEventListener(MouseEvent.MOUSE_UP,this.ReturnEquipement);
         var mc:MovieClip = event.target as MovieClip;
         if(this._pendingItemView.metaEquipement.modelEquipement.type == ModelEquipement.TYPE_CREATURE)
         {
            v1 = this._creatureInventoryView.GetViewFromVisual(mc) as EquipementView;
            if(v1 != null)
            {
               this._pendingItemView.setMetaEquipement(MetaEquipement.EMPTY_EQUIPEMENT);
               this.Refresh();
               return;
            }
            if(mc == this._creatureInventoryView.CreatureDropZone || mc == this._itemInventoryView.ItemDropZone)
            {
               this._pendingItemView.setMetaEquipement(MetaEquipement.EMPTY_EQUIPEMENT);
               this.Refresh();
               return;
            }
         }
         else
         {
            v2 = this._itemInventoryView.GetViewFromVisual(mc) as EquipementView;
            if(v2 != null)
            {
               this._pendingItemView.setMetaEquipement(MetaEquipement.EMPTY_EQUIPEMENT);
               this.Refresh();
               return;
            }
            if(mc == this._itemInventoryView.ItemDropZone || mc == this._creatureInventoryView.CreatureDropZone)
            {
               this._pendingItemView.setMetaEquipement(MetaEquipement.EMPTY_EQUIPEMENT);
               this.Refresh();
               return;
            }
         }
         this._unitCreateView.AddEquipement(this._pendingItemView.metaEquipement,false);
         this._pendingItemView.setMetaEquipement(MetaEquipement.EMPTY_EQUIPEMENT);
         this.Refresh();
      }
      
      public function setPlayerUnit(metaUnit:BC_MetaUnit) : void
      {
         this._unitCreateView.SetMetaUnit(metaUnit);
         this.SetMetaArmy(BC_GameProgress.gameProgess.CurrentSelectedArmy());
         this.Refresh();
      }
      
      public function get equipDropZone() : MovieClip
      {
         return this.unitCreateView1.getChildByName("equipDropZone") as MovieClip;
      }
      
      public function get pendingItemView() : EquipementView
      {
         return this._pendingItemView;
      }
      
      public function UnequipAll() : void
      {
         this._unitCreateView.UnequipAll();
         this.Refresh();
      }
      
      public function set metaArmy(metaArmy:BC_MetaArmy) : void
      {
         this._metaArmy = metaArmy;
      }
      
      public function RemoveClickListener() : void
      {
         var v:EquipementView = null;
         for(var m:int = 0; m < this._creatureInventoryView.views.length; m++)
         {
            v = this._creatureInventoryView.views[m] as EquipementView;
            v.visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickInView);
         }
         for(m = 0; m < this._itemInventoryView.views.length; m++)
         {
            v = this._itemInventoryView.views[m] as EquipementView;
            v.visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickInView);
         }
      }
      
      public function get LeftPanel() : MovieClip
      {
         return visual.getChildByName("LeftPanel") as MovieClip;
      }
      
      public function setCreateUnit(metaUnit:BC_MetaUnit) : void
      {
         metaUnit.quantity = 0;
         this._unitCreateView.SetMetaUnit(metaUnit);
         this._unitCreateView.unitNameTxt.text = "Unit";
         this.SetMetaArmy(BC_GameProgress.gameProgess.CurrentSelectedArmy());
         this.Refresh();
      }
      
      public function SetMetaArmy(metaArmy:BC_MetaArmy) : void
      {
         this.RemoveClickListener();
         this._metaArmy = metaArmy;
         this._creatureInventoryView.SetGroupItem(this._metaArmy.creatureInventory);
         this._itemInventoryView.SetGroupItem(this._metaArmy.itemInventory);
         this.AddClickListener();
      }
      
      public function NextRarity() : void
      {
         ++this._currentRarity;
         if(this._currentRarity >= this._rarityArray.length)
         {
            this._currentRarity = 0;
         }
         this._itemInventoryView.SetFilterRarity(this._rarityArray[this._currentRarity]);
         this.Refresh();
      }
      
      public function CheckCreatureEquip() : Boolean
      {
         return this._unitCreateView.CheckCreatureEquip();
      }
      
      private function onRollOverItem(event:MouseEvent) : void
      {
         var mc:MovieClip = null;
         if(this._onSelection)
         {
            return;
         }
         if(event.target as ButtonSelect)
         {
            mc = (event.target as ButtonSelect).parent as MovieClip;
         }
         else
         {
            mc = event.target as MovieClip;
         }
         var v1:EquipementView = this._creatureInventoryView.GetViewFromVisual(mc) as EquipementView;
         if(v1 == null)
         {
            v1 = this._itemInventoryView.GetViewFromVisual(mc) as EquipementView;
            if(v1 == null)
            {
               v1 = this._unitCreateView.playerEquipementView.GetViewFromVisual(mc) as EquipementView;
            }
         }
         if(v1.metaEquipement.modelEquipement.id < 0)
         {
            return;
         }
         this._descriptionScreen.SetMetaEquipement(v1.metaEquipement);
         this._descriptionScreen.Show();
         v1.visual.addEventListener(MouseEvent.MOUSE_OUT,this.onRollOut);
      }
      
      public function CheckAnyEquip() : Boolean
      {
         return this._unitCreateView.CheckAnyEquip();
      }
      
      public function Init() : void
      {
         var m:int = 0;
         var v:EquipementView = null;
         this._onSelection = false;
         this._doubleClick = false;
         this._doubleClickCounter = 0;
         this._metaArmy = BC_GameProgress.gameProgess.CurrentSelectedArmy();
         this._pendingItemView = new EquipementView(this.pendingUnitView);
         this._pendingItemView.visual.visible = false;
         this._pendingItemView.visual.mouseEnabled = false;
         this._pendingItemView.visual.mouseChildren = false;
         visual.addChild(this._pendingItemView.visual);
         this._unitCreateView = new UnitCreateView(this.unitCreateView1);
         this._creatureInventoryView = new CreatureInventoryView(this.creatureInventoryView,this._unitCreateView);
         this._creatureInventoryView.Init(this._metaArmy.creatureInventory);
         this._itemInventoryView = new ItemInventoryView(this.itemInventoryView,this._unitCreateView);
         this._itemInventoryView.Init(this._metaArmy.itemInventory);
         this._currentRarity = 0;
         this._rarityArray = new Array(0,ModelEquipement.RARITY_COMMUN,ModelEquipement.RARITY_UNCOMMUN,ModelEquipement.RARITY_RARE,ModelEquipement.RARITY_LEGENDARY);
         this._itemInventoryView.SetFilterRarity(this._rarityArray[this._currentRarity]);
         this._creatureInventoryView.CreatureDropZone.visible = false;
         this._itemInventoryView.ItemDropZone.visible = false;
         this.AddClickListener();
         this._timerToDrag = 0;
         for(m = 0; m < this._unitCreateView.playerEquipementView.views.length; m++)
         {
            v = this._unitCreateView.playerEquipementView.views[m] as EquipementView;
            v.visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickInView);
         }
         this._descriptionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ITEMDESCRIPTION_SCREEN,false,true) as ItemDescriptionScreen;
         this._descriptionScreen.Hide();
         for(m = 0; m < this._unitCreateView.playerEquipementView.views.length; m++)
         {
            v = this._unitCreateView.playerEquipementView.views[m] as EquipementView;
            v.visual.addEventListener(MouseEvent.MOUSE_OVER,this.onRollOverItem);
         }
         this.Refresh();
      }
      
      public function get creatureInventoryView() : MovieClip
      {
         return this.RightPanel.getChildByName("CreatureInventoryView") as MovieClip;
      }
      
      private function onRollOut(event:MouseEvent) : void
      {
         this._descriptionScreen.Hide();
      }
      
      private function DropUnit(event:MouseEvent) : void
      {
         var addEquip:Boolean = false;
         this._onSelection = false;
         visual.removeEventListener(MouseEvent.MOUSE_UP,this.DropUnit);
         var mc:MovieClip = event.target as MovieClip;
         var v1:EquipementView = this._unitCreateView.playerEquipementView.GetViewFromVisual(mc) as EquipementView;
         if(v1 == null)
         {
            if(mc == this._unitCreateView.playerEquipementView.equipementDropZone || mc.name == "equipDropZone")
            {
               addEquip = true;
            }
         }
         else
         {
            addEquip = true;
         }
         if(addEquip)
         {
            this._unitCreateView.AddEquipement(this._pendingItemView.metaEquipement,true);
         }
         this._pendingItemView.setMetaEquipement(MetaEquipement.EMPTY_EQUIPEMENT);
         this._pendingItemView.Refresh();
         this.Refresh();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this._pendingItemView.Refresh();
         this._creatureInventoryView.Refresh();
         this._itemInventoryView.Refresh();
         this._unitCreateView.Refresh();
         this.rarityTxt.text = TextFactory.instance.GetMsg(BC_TextFactory.ID_RARITY_TEXT_ARRAY[this._currentRarity]);
      }
      
      public function filterInventory(b:ButtonSelect) : void
      {
         switch(b.name)
         {
            case "btn_UnitCreationWeapons":
               this._itemInventoryView.SetFilter(ModelEquipement.TYPE_WEAPON);
               break;
            case "btn_UnitCreationShields":
               this._itemInventoryView.SetFilter(ModelEquipement.TYPE_SHIELD);
               break;
            case "btn_UnitCreationArmors":
               this._itemInventoryView.SetFilter(ModelEquipement.TYPE_ARMOR);
               break;
            case "btn_UnitCreationSpecials":
               this._itemInventoryView.SetFilter(ModelEquipement.TYPE_SPECIAL);
               break;
            case "btn_UnitCreationAll":
               this._itemInventoryView.SetFilter(0);
         }
      }
      
      public function get rarityTxt() : TextField
      {
         return this.RightPanel.getChildByName("rarityTxt") as TextField;
      }
      
      public function get metaArmy() : BC_MetaArmy
      {
         return this._metaArmy;
      }
      
      private function onClickInView(event:MouseEvent) : void
      {
         var v2:EquipementView = null;
         var mc:MovieClip = event.target as MovieClip;
         var v1:EquipementView = this._creatureInventoryView.GetViewFromVisual(mc) as EquipementView;
         if(v1 == null)
         {
            v1 = this._itemInventoryView.GetViewFromVisual(mc) as EquipementView;
            if(v1 == null)
            {
               v2 = this._unitCreateView.playerEquipementView.GetViewFromVisual(mc) as EquipementView;
            }
         }
         if(v1 && v1.metaEquipement.quantity > 0 && !this._unitCreateView.metaUnit.IsEquipped(v1.metaEquipement))
         {
            this._pendingItemView.setMetaEquipement(v1.metaEquipement);
            visual.addEventListener(MouseEvent.MOUSE_UP,this.DropUnit);
            if(this._doubleClick)
            {
               this._doubleClick = false;
               if(this._pendingItemView.metaEquipement.modelEquipement.id == v1.metaEquipement.modelEquipement.id)
               {
                  this._unitCreateView.AddEquipement(v1.metaEquipement,true);
                  this._pendingItemView.setMetaEquipement(MetaEquipement.EMPTY_EQUIPEMENT);
                  this._pendingItemView.Refresh();
                  return;
               }
            }
         }
         if(v2)
         {
            this._pendingItemView.setMetaEquipement(v2.metaEquipement);
            this._unitCreateView.removeEquipement(v2.metaEquipement);
            v2.setMetaEquipement(MetaEquipement.EMPTY_EQUIPEMENT);
            visual.stage.addEventListener(MouseEvent.MOUSE_UP,this.ReturnEquipement);
            this._creatureInventoryView.CreatureDropZone.visible = true;
            this._itemInventoryView.ItemDropZone.visible = true;
            this._timerToDrag = 100;
            if(this._doubleClick)
            {
               this._doubleClick = false;
               if(this._pendingItemView.metaEquipement.modelEquipement.id == v2.metaEquipement.modelEquipement.id)
               {
                  this._unitCreateView.AddEquipement(v2.metaEquipement,true);
                  this._pendingItemView.setMetaEquipement(MetaEquipement.EMPTY_EQUIPEMENT);
                  this._pendingItemView.Refresh();
                  return;
               }
            }
         }
         if(!this._doubleClick)
         {
            this._doubleClick = true;
         }
         this._onSelection = true;
      }
      
      public function EditUnit(metaUnit:BC_MetaUnit, backUpUnit:BC_MetaUnit) : void
      {
         var i:int = 0;
         this._metaArmy.ReturnUnitItems(backUpUnit);
         this._unitCreateView.SetMetaUnit(metaUnit);
         for(i = 0; i < this._metaArmy.creatureInventory.length; i++)
         {
            if(this._metaArmy.creatureInventory[i].modelEquipement.id == backUpUnit.playerEquipement.creatureEquip.modelEquipement.id)
            {
               this._unitCreateView.AddEquipement(this._metaArmy.creatureInventory[i],false);
               break;
            }
         }
         for(i = 0; i < this._metaArmy.itemInventory.length; i++)
         {
            if(this._metaArmy.itemInventory[i].modelEquipement.id == backUpUnit.playerEquipement.weaponEquip.modelEquipement.id)
            {
               this._unitCreateView.AddEquipement(this._metaArmy.itemInventory[i],false);
            }
         }
         for(i = 0; i < this._metaArmy.itemInventory.length; i++)
         {
            if(this._metaArmy.itemInventory[i].modelEquipement.id == backUpUnit.playerEquipement.shieldEquip.modelEquipement.id)
            {
               this._unitCreateView.AddEquipement(this._metaArmy.itemInventory[i],false);
            }
         }
         for(i = 0; i < this._metaArmy.itemInventory.length; i++)
         {
            if(this._metaArmy.itemInventory[i].modelEquipement.id == backUpUnit.playerEquipement.armorEquip.modelEquipement.id)
            {
               this._unitCreateView.AddEquipement(this._metaArmy.itemInventory[i],false);
            }
         }
         for(i = 0; i < this._metaArmy.itemInventory.length; i++)
         {
            if(this._metaArmy.itemInventory[i].modelEquipement.id == backUpUnit.playerEquipement.specialEquip.modelEquipement.id)
            {
               this._unitCreateView.AddEquipement(this._metaArmy.itemInventory[i],false);
            }
         }
         this._unitCreateView.unitNameTxt.text = backUpUnit.unitName;
         this.SetMetaArmy(BC_GameProgress.gameProgess.CurrentSelectedArmy());
         this.Refresh();
      }
      
      public function get itemInventoryView() : MovieClip
      {
         return this.RightPanel.getChildByName("ItemInventoryView") as MovieClip;
      }
      
      override public function Destroy() : void
      {
         var m:int = 0;
         var v:EquipementView = null;
         super.Destroy();
         this.RemoveClickListener();
         for(m = 0; m < this._unitCreateView.playerEquipementView.views.length; m++)
         {
            v = this._unitCreateView.playerEquipementView.views[m] as EquipementView;
            v.visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickInView);
            v.visual.removeEventListener(MouseEvent.MOUSE_OVER,this.onRollOverItem);
         }
         ScreenManager.instance.RemoveScreen(this._descriptionScreen);
         this._pendingItemView.Destroy();
         this._creatureInventoryView.Destroy();
         this._itemInventoryView.Destroy();
         this._unitCreateView.Destroy();
      }
      
      public function AddClickListener() : void
      {
         var v:EquipementView = null;
         for(var m:int = 0; m < this._creatureInventoryView.views.length; m++)
         {
            v = this._creatureInventoryView.views[m] as EquipementView;
            v.visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickInView);
         }
         for(m = 0; m < this._itemInventoryView.views.length; m++)
         {
            v = this._itemInventoryView.views[m] as EquipementView;
            v.visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickInView);
         }
      }
      
      public function PrevRarity() : void
      {
         --this._currentRarity;
         if(this._currentRarity < 0)
         {
            this._currentRarity = this._rarityArray.length - 1;
         }
         this._itemInventoryView.SetFilterRarity(this._rarityArray[this._currentRarity]);
         this.Refresh();
      }
      
      public function get RightPanel() : MovieClip
      {
         return visual.getChildByName("RightPanel") as MovieClip;
      }
      
      override public function Update() : void
      {
         super.Update();
         if(this._doubleClick)
         {
            ++this._doubleClickCounter;
            if(this._doubleClickCounter >= 20)
            {
               this._doubleClick = false;
               this._doubleClickCounter = 0;
            }
         }
         this._pendingItemView.FollowMouse(this._context);
         this._itemInventoryView.Update();
         this._creatureInventoryView.Update();
         this._unitCreateView.Update();
      }
      
      public function get unitCreateView1() : MovieClip
      {
         return this.LeftPanel.getChildByName("UnitCreateView") as MovieClip;
      }
      
      public function get unitCreateView() : UnitCreateView
      {
         return this._unitCreateView;
      }
      
      public function getPlayerUnit() : BC_MetaUnit
      {
         return this._unitCreateView.metaUnit;
      }
   }
}

