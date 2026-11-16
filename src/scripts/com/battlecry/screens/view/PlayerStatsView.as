package com.battlecry.screens.view
{
   import com.battlecry.meta.MetaPlayerEquipement;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class PlayerStatsView extends ObjectView
   {
      
      private var _defenceStatsView:DefenceStatsView;
      
      private var _metaPlayerEquipement:MetaPlayerEquipement;
      
      private var _attackStatsView:AttackStatsView;
      
      public function PlayerStatsView(visual:MovieClip)
      {
         super(visual);
         this._attackStatsView = new AttackStatsView(this.attackView);
         this._defenceStatsView = new DefenceStatsView(this.defenceView);
      }
      
      public function get castTimeValue() : TextField
      {
         return visual.getChildByName("castTimeValue") as TextField;
      }
      
      public function SetMetaPlayerEquipement(metaEquipement:MetaPlayerEquipement) : void
      {
         this._metaPlayerEquipement = metaEquipement;
         this._attackStatsView.SetGroupStats(this._metaPlayerEquipement);
         this._defenceStatsView.SetGroupStats(this._metaPlayerEquipement);
      }
      
      public function get attackView() : MovieClip
      {
         return visual.getChildByName("AttackView") as MovieClip;
      }
      
      public function get defenceView() : MovieClip
      {
         return visual.getChildByName("DefenceView") as MovieClip;
      }
      
      public function get reloadTxt() : TextField
      {
         return visual.getChildByName("reloadTxt") as TextField;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._attackStatsView.Destroy();
         this._defenceStatsView.Destroy();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this._attackStatsView.Refresh();
         this._attackStatsView.rangeValue.text = this._metaPlayerEquipement.Range + "";
         this._defenceStatsView.Refresh();
         this._defenceStatsView.defenceValue.text = this._metaPlayerEquipement.Defense + "";
         if(this._metaPlayerEquipement.weaponEquip.modelEquipement.isCastItem)
         {
            this.reloadTxt.text = TextFactory.instance.GetMsg(BC_TextFactory.ID_CASTING_TIME_TXT);
            this.castTimeValue.text = this._metaPlayerEquipement.GetCastingTime();
         }
         else
         {
            this.reloadTxt.text = TextFactory.instance.GetMsg(BC_TextFactory.ID_RELOAD_TIME_TXT);
            this.castTimeValue.text = this._metaPlayerEquipement.GetReloadTime();
         }
      }
   }
}

