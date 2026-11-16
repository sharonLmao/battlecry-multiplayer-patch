package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.BC_MetaArmy;
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.model.ModelBoosterPackEnum;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.CollectionScreen;
   import com.battlecry.screens.QuestionScreen;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class CraftView extends ObjectView
   {
      
      private var _onDown:Boolean;
      
      private var _waitTime:Number;
      
      private var _collectionScreen:CollectionScreen;
      
      private var _maxQuantity:int;
      
      private var _metaEquipement:MetaEquipement;
      
      private var _quantityspeed:Number;
      
      private var _currentQuantity:int;
      
      private var _maxWaitTime:Number;
      
      private var _craftMeter:CraftMeter;
      
      private var _selectedEquipement:MetaEquipement;
      
      private var _equipementView:EquipementView;
      
      private var _onUp:Boolean;
      
      public function CraftView(visual:DisplayObjectContainer, collectionScreen:CollectionScreen)
      {
         super(visual);
         this._collectionScreen = collectionScreen;
         this._craftMeter = new CraftMeter(this.craftMeter);
         this._equipementView = new EquipementView(this.equipementView);
         this._metaEquipement = MetaEquipement.EMPTY_EQUIPEMENT;
         this._equipementView.setMetaEquipement(this._metaEquipement);
         this._quantityspeed = 0;
         this._onUp = false;
         this._onDown = false;
         this._waitTime = 0;
         this._maxWaitTime = 0;
         this.btn_ArrowDown.addEventListener(MouseEvent.MOUSE_DOWN,this.onArrowDown);
         this.btn_ArrowUp.addEventListener(MouseEvent.MOUSE_DOWN,this.onArrowUp);
         this.btn_consume.addEventListener(MouseEvent.MOUSE_DOWN,this.onConsume);
         this.btn_craftItem.addEventListener(MouseEvent.MOUSE_DOWN,this.onCraft);
         this.clearScare.useHandCursor = true;
         this.clearScare.addEventListener(MouseEvent.MOUSE_DOWN,this.onClear);
      }
      
      private function SetMaxQuantity(metaEquipement:MetaEquipement) : void
      {
         var j:int = 0;
         var m:BC_MetaArmy = null;
         this._maxQuantity = metaEquipement.quantity;
         for(var i:int = 0; i < 6; i++)
         {
            j = 0;
            m = BC_GameProgress.gameProgess.getArmy(i);
            if(metaEquipement.modelEquipement.type == ModelEquipement.TYPE_CREATURE)
            {
               for(j = 0; j < m.creatureInventory.length; j++)
               {
                  if(m.creatureInventory[j].modelEquipement.id == metaEquipement.modelEquipement.id)
                  {
                     if(this._maxQuantity > m.creatureInventory[j].quantity)
                     {
                        this._maxQuantity = m.creatureInventory[j].quantity;
                     }
                  }
               }
            }
            else
            {
               for(j = 0; j < m.itemInventory.length; j++)
               {
                  if(m.itemInventory[j].modelEquipement.id == metaEquipement.modelEquipement.id)
                  {
                     if(this._maxQuantity > m.itemInventory[j].quantity)
                     {
                        this._maxQuantity = m.itemInventory[j].quantity;
                     }
                  }
               }
            }
         }
      }
      
      private function onCraft(event:MouseEvent) : void
      {
         if(this.btn_craftItem.isSelected)
         {
            return;
         }
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_YES_NO,TextFactory.instance.GetMsg(BC_TextFactory.ID_ARE_YOU_SURE_YOU_WANT_TO_CRAFT),new Callback(this.Craft,this,null),null);
      }
      
      private function Craft() : void
      {
         if(BC_GameProgress.gameProgess.craftPoint >= 9850)
         {
            BC_Game.instance.BuyBoosterPack(ModelBoosterPackEnum.CRAFT_LEGENDARY,0);
         }
         else if(BC_GameProgress.gameProgess.craftPoint >= 6500)
         {
            BC_Game.instance.BuyBoosterPack(ModelBoosterPackEnum.CRAFT_RARE,0);
         }
         else if(BC_GameProgress.gameProgess.craftPoint >= 1000)
         {
            BC_Game.instance.BuyBoosterPack(ModelBoosterPackEnum.CRAFT_UNCOMMUN,0);
         }
         else
         {
            if(BC_GameProgress.gameProgess.craftPoint < 100)
            {
               return;
            }
            BC_Game.instance.BuyBoosterPack(ModelBoosterPackEnum.CRAFT_COMMUN,0);
         }
         this._collectionScreen.RefreshCollection();
         BC_GameProgress.gameProgess.craftPoint = 0;
         BC_Game.instance.Save();
      }
      
      public function get equipementView() : MovieClip
      {
         return visual.getChildByName("equipementView") as MovieClip;
      }
      
      public function get unitQuantityTxt() : TextField
      {
         return visual.getChildByName("unitQuantityTxt") as TextField;
      }
      
      private function onArrowUp(event:MouseEvent) : void
      {
         if(this.btn_ArrowUp.isSelected)
         {
            return;
         }
         this._onUp = true;
         this._waitTime = 5;
         visual.stage.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      private function onUp(event:MouseEvent) : void
      {
         this._quantityspeed = 0;
         this._onUp = false;
         this._onDown = false;
         visual.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function get btn_ArrowUp() : ButtonSelect
      {
         return visual.getChildByName("btn_ArrowUp") as ButtonSelect;
      }
      
      private function onConsume(event:MouseEvent) : void
      {
         var j:int = 0;
         var m:BC_MetaArmy = null;
         if(this.btn_consume.isSelected)
         {
            return;
         }
         for(var i:int = 1; i < 6; i++)
         {
            j = 0;
            m = BC_GameProgress.gameProgess.getArmy(i);
            if(this._metaEquipement.modelEquipement.type == ModelEquipement.TYPE_CREATURE)
            {
               for(j = 0; j < m.creatureInventory.length; j++)
               {
                  if(m.creatureInventory[j].modelEquipement.id == this._metaEquipement.modelEquipement.id)
                  {
                     m.creatureInventory[j].quantity -= this._currentQuantity;
                  }
               }
            }
            else
            {
               for(j = 0; j < m.itemInventory.length; j++)
               {
                  if(m.itemInventory[j].modelEquipement.id == this._metaEquipement.modelEquipement.id)
                  {
                     m.itemInventory[j].quantity -= this._currentQuantity;
                  }
               }
            }
         }
         for(i = 0; i < BC_GameProgress.gameProgess.metaCollection.collectionInventory.length; i++)
         {
            if(BC_GameProgress.gameProgess.metaCollection.collectionInventory[i].modelEquipement.id == this._metaEquipement.modelEquipement.id)
            {
               BC_GameProgress.gameProgess.metaCollection.collectionInventory[i].quantity -= this._currentQuantity;
            }
         }
         var craftPoint:int = 0;
         switch(this._metaEquipement.modelEquipement.rarity)
         {
            case ModelEquipement.RARITY_COMMUN:
               craftPoint = this._currentQuantity * 75;
               break;
            case ModelEquipement.RARITY_UNCOMMUN:
               craftPoint = this._currentQuantity * 400;
               break;
            case ModelEquipement.RARITY_RARE:
               craftPoint = this._currentQuantity * 2000;
               break;
            case ModelEquipement.RARITY_LEGENDARY:
               craftPoint = this._currentQuantity * 3500;
         }
         this._collectionScreen.RefreshCollection();
         BC_GameProgress.gameProgess.craftPoint += craftPoint;
         if(BC_GameProgress.gameProgess.craftPoint >= 10000)
         {
            BC_GameProgress.gameProgess.craftPoint = 10000;
         }
         this.Clear();
      }
      
      override public function Update() : void
      {
         var q:QuestionScreen = null;
         super.Update();
         this._craftMeter.Update();
         if(this._metaEquipement.modelEquipement.id == -1 || this._currentQuantity <= 0)
         {
            this.btn_consume.Select();
         }
         else
         {
            this.btn_consume.Deselect();
         }
         if(this._metaEquipement.modelEquipement.id == -1)
         {
            this.btn_ArrowDown.Select();
            this.btn_ArrowUp.Select();
         }
         else
         {
            this.btn_ArrowDown.Deselect();
            this.btn_ArrowUp.Deselect();
         }
         if(BC_GameProgress.gameProgess.craftPoint < 100)
         {
            this.btn_craftItem.Select();
         }
         else
         {
            this.btn_craftItem.Deselect();
         }
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
                  if(this._currentQuantity < this._maxQuantity)
                  {
                     ++this._currentQuantity;
                  }
                  else if(this._maxQuantity != this._selectedEquipement.quantity)
                  {
                     if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_QUESTION_SCREEN) <= 0)
                     {
                        q = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
                        q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_CANT_CONSUME_MORE));
                     }
                  }
               }
               else if(this._currentQuantity > 0)
               {
                  --this._currentQuantity;
               }
            }
            this.Refresh();
         }
      }
      
      public function get btn_ArrowDown() : ButtonSelect
      {
         return visual.getChildByName("btn_ArrowDown") as ButtonSelect;
      }
      
      public function get craftMeter() : MovieClip
      {
         return visual.getChildByName("craftMeter") as MovieClip;
      }
      
      private function onArrowDown(event:MouseEvent) : void
      {
         if(this.btn_ArrowDown.isSelected)
         {
            return;
         }
         this._onDown = true;
         this._waitTime = 5;
         visual.stage.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function get btn_craftItem() : ButtonSelect
      {
         return visual.getChildByName("btn_craftItem") as ButtonSelect;
      }
      
      public function get btn_consume() : ButtonSelect
      {
         return visual.getChildByName("btn_consume") as ButtonSelect;
      }
      
      public function Clear() : void
      {
         this.SetMetaEquipement(MetaEquipement.EMPTY_EQUIPEMENT);
         this._currentQuantity = 0;
         this._collectionScreen.DeselectSelected();
         this.Refresh();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.unitQuantityTxt.text = this._currentQuantity + "";
      }
      
      public function SetMetaEquipement(m:MetaEquipement) : void
      {
         this._currentQuantity = 0;
         this._selectedEquipement = m;
         this._metaEquipement = new MetaEquipement(0,m.modelEquipement);
         this._equipementView.setMetaEquipement(this._metaEquipement);
         this._equipementView.quantityTxt.visible = false;
         this._equipementView.quantity_BlackBack.visible = false;
         this.SetMaxQuantity(m);
         this.Refresh();
      }
      
      private function onClear(event:MouseEvent) : void
      {
         this.Clear();
      }
      
      public function get clearScare() : MovieClip
      {
         return visual.getChildByName("clearScare") as MovieClip;
      }
   }
}

