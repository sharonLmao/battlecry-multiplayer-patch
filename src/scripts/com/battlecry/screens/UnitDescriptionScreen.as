package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.BC_MetaUnit;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.battlecry.screens.Units.UnitView;
   import com.battlecry.screens.view.AttackStatsView;
   import com.battlecry.screens.view.DefenceStatsView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class UnitDescriptionScreen extends BC_Screen
   {
      
      private var _defenceStatsView:DefenceStatsView;
      
      private var _unitView:UnitView;
      
      private var _attackStatsView:AttackStatsView;
      
      public function UnitDescriptionScreen()
      {
         super();
      }
      
      public function get unit() : MovieClip
      {
         return visual.getChildByName("unit") as MovieClip;
      }
      
      public function get castTimeValue() : TextField
      {
         return visual.getChildByName("castTimeValue") as TextField;
      }
      
      public function SetView(unitView:UnitView) : void
      {
         this._unitView.visual.visible = true;
         this._unitView.SetMetaUnit(unitView.metaUnit);
         this._unitView.SetIdle();
         this._attackStatsView.SetGroupStats(this._unitView.metaUnit.playerEquipement);
         this._attackStatsView.rangeValue.text = unitView.metaUnit.playerEquipement.Range + "";
         this._attackStatsView.Refresh();
         this._defenceStatsView.SetGroupStats(this._unitView.metaUnit.playerEquipement);
         this._defenceStatsView.defenceValue.text = unitView.metaUnit.playerEquipement.Defense + "";
         this._defenceStatsView.Refresh();
         this.CheckOffsetUnit();
         this.unitName.text = this._unitView.metaUnit.unitName;
         this.nameList.text = this._unitView.metaUnit.playerEquipement.NameList;
         this.pointValueText.text = this._unitView.metaUnit.playerEquipement.Value + "";
         if(this._unitView.metaUnit.playerEquipement.weaponEquip.modelEquipement.isCastItem)
         {
            this.reloadTxt.text = TextFactory.instance.GetMsg(BC_TextFactory.ID_CASTING_TIME_TXT);
            this.castTimeValue.text = this._unitView.metaUnit.playerEquipement.GetCastingTime();
         }
         else
         {
            this.reloadTxt.text = TextFactory.instance.GetMsg(BC_TextFactory.ID_RELOAD_TIME_TXT);
            this.castTimeValue.text = this._unitView.metaUnit.playerEquipement.GetReloadTime();
         }
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         var mousex:Number = BC_Game.instance.mouseX;
         if(mousex >= 350)
         {
            visual.x = mousex - (visual.width + 50);
         }
         else
         {
            visual.x = mousex + 50;
         }
      }
      
      public function get attackView() : MovieClip
      {
         return visual.getChildByName("attackView") as MovieClip;
      }
      
      public function get pointValueText() : TextField
      {
         return visual.getChildByName("PointValueText") as TextField;
      }
      
      public function get unitName() : TextField
      {
         return visual.getChildByName("unitName") as TextField;
      }
      
      public function get resistView() : MovieClip
      {
         return visual.getChildByName("resistView") as MovieClip;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._unitView = new UnitView(this.unit,true);
         this._unitView.SetMetaUnit(BC_MetaUnit.EMPTY_UNIT);
         this._unitView.SetIdle();
         this._attackStatsView = new AttackStatsView(this.attackView);
         this._defenceStatsView = new DefenceStatsView(this.resistView);
      }
      
      public function get nameList() : TextField
      {
         return visual.getChildByName("nameList") as TextField;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         if(this._unitView)
         {
            this._unitView.Destroy();
         }
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_UNITDESCRIPTION_SCREEN);
      }
      
      public function get reloadTxt() : TextField
      {
         return visual.getChildByName("reloadTxt") as TextField;
      }
      
      private function CheckOffsetUnit() : void
      {
         if(this._unitView.metaUnit.playerEquipement.creatureEquip.isArtillery6Case())
         {
            this._unitView.OffSet(15,-15);
            return;
         }
         if(this._unitView.metaUnit.playerEquipement.creatureEquip.isArtillery3Case())
         {
            this._unitView.OffSet(10,0);
            return;
         }
         if(this._unitView.metaUnit.playerEquipement.creatureEquip.isArtillery9Case())
         {
            this._unitView.OffSet(5,-13);
            this._unitView.animContainer.scaleX = 0.4;
            this._unitView.animContainer.scaleY = 0.4;
            return;
         }
         this._unitView.OffSet(0,0);
         this._unitView.animContainer.scaleX = 1;
         this._unitView.animContainer.scaleY = 1;
      }
   }
}

