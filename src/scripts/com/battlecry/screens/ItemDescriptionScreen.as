package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.screens.view.AttackStatsView;
   import com.battlecry.screens.view.DefenceStatsView;
   import com.battlecry.screens.view.EquipementView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.multilingual.TextFactory;
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class ItemDescriptionScreen extends BC_Screen
   {
      
      private var _defenceStatsView:DefenceStatsView;
      
      private var _equipementView:EquipementView;
      
      private var _attackStatsView:AttackStatsView;
      
      public function ItemDescriptionScreen()
      {
         super();
      }
      
      public function get defenceView() : MovieClip
      {
         return visual.getChildByName("defenceView") as MovieClip;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         var mousex:Number = BC_Game.instance.mouseX;
         var mousey:Number = BC_Game.instance.mouseY;
         if(mousey > 150)
         {
            if(mousey + visual.height / 2 >= 400)
            {
               visual.y = 400 - visual.height;
            }
            else
            {
               visual.y = mousey - visual.height / 2;
            }
         }
         else if(mousey - visual.height / 2 <= 0)
         {
            visual.y = 0;
         }
         else
         {
            visual.y = mousey - visual.height / 2;
         }
         if(mousex >= 350)
         {
            visual.x = mousex - (visual.width + 30);
         }
         else
         {
            visual.x = mousex + 25;
         }
      }
      
      public function get item() : MovieClip
      {
         return visual.getChildByName("item") as MovieClip;
      }
      
      public function get attackView() : MovieClip
      {
         return visual.getChildByName("attackView") as MovieClip;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._equipementView = new EquipementView(this.item);
         this._equipementView.setMetaEquipement(MetaEquipement.EMPTY_EQUIPEMENT);
         this._attackStatsView = new AttackStatsView(this.attackView);
         this._defenceStatsView = new DefenceStatsView(this.defenceView);
      }
      
      public function SetMetaEquipement(metaEquipement:MetaEquipement) : void
      {
         this._equipementView.visual.visible = true;
         this._equipementView.setMetaEquipement(metaEquipement);
         this._equipementView.Refresh();
         this._attackStatsView.SetGroupStats2(metaEquipement);
         this._attackStatsView.rangeValue.text = metaEquipement.modelEquipement.range + "";
         this._attackStatsView.Refresh();
         this._defenceStatsView.SetGroupStats2(metaEquipement);
         this._defenceStatsView.defenceValue.text = metaEquipement.modelEquipement.defense + "";
         this._defenceStatsView.Refresh();
         this.itemName.text = TextFactory.instance.GetMsg(metaEquipement.modelEquipement.equipementNameId);
         this.itemDescription.text = TextFactory.instance.GetMsg(metaEquipement.modelEquipement.equipementDescId);
         this.pointValueText.text = metaEquipement.modelEquipement.value + "";
         this.rarityText.text = BC_TextFactory.GetRarityMsg(metaEquipement.modelEquipement.rarity);
         switch(metaEquipement.modelEquipement.rarity)
         {
            case ModelEquipement.RARITY_COMMUN:
               Utils.SetColor2(this.itemName,16777215);
               Utils.SetColor2(this.rarityText,16777215);
               break;
            case ModelEquipement.RARITY_UNCOMMUN:
               Utils.SetColor2(this.itemName,642311);
               Utils.SetColor2(this.rarityText,642311);
               break;
            case ModelEquipement.RARITY_RARE:
               Utils.SetColor2(this.itemName,314622);
               Utils.SetColor2(this.rarityText,314622);
               break;
            case ModelEquipement.RARITY_LEGENDARY:
               Utils.SetColor2(this.itemName,16750848);
               Utils.SetColor2(this.rarityText,16750848);
         }
      }
      
      public function get pointValueText() : TextField
      {
         return visual.getChildByName("PointValueText") as TextField;
      }
      
      public function get itemDescription() : TextField
      {
         return visual.getChildByName("ItemDescription") as TextField;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._equipementView.Destroy();
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ITEMDESCRIPTION_SCREEN);
      }
      
      public function get itemName() : TextField
      {
         return visual.getChildByName("ItemName") as TextField;
      }
      
      public function get rarityText() : TextField
      {
         return visual.getChildByName("rarityText") as TextField;
      }
   }
}

