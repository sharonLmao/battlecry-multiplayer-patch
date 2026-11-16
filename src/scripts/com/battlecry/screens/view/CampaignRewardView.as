package com.battlecry.screens.view
{
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.model.ModelCampaign;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class CampaignRewardView extends ObjectView
   {
      
      private var _modelCampaign:ModelCampaign;
      
      private var _views:Array;
      
      public function CampaignRewardView(visual:DisplayObjectContainer)
      {
         super(visual);
         this._views = new Array();
      }
      
      public function get goldReward_Txt() : TextField
      {
         return visual.getChildByName("goldReward_Txt") as TextField;
      }
      
      public function get equipement5() : MovieClip
      {
         return visual.getChildByName("equipement5") as MovieClip;
      }
      
      public function get equipement3() : MovieClip
      {
         return visual.getChildByName("equipement3") as MovieClip;
      }
      
      public function get equipement4() : MovieClip
      {
         return visual.getChildByName("equipement4") as MovieClip;
      }
      
      public function SetModelCampaign(modelCampaign:ModelCampaign) : void
      {
         this._modelCampaign = modelCampaign;
         this.Refresh();
      }
      
      public function get packReward_Txt() : TextField
      {
         return visual.getChildByName("packReward_Txt") as TextField;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         for(var i:int = 0; i < this._views.length; i++)
         {
            (this._views[i] as EquipementView).Destroy();
         }
      }
      
      override public function Refresh() : void
      {
         var a:Array = null;
         var i:int = 0;
         var metaEquipement:MetaEquipement = null;
         var equipementView:EquipementView = null;
         super.Refresh();
         if(this._modelCampaign.goldReward > 0)
         {
            visualMc.gotoAndStop(1);
            this.goldReward_Txt.text = this._modelCampaign.goldReward + "";
         }
         else if(this._modelCampaign.boosterPackID >= 0)
         {
            visualMc.gotoAndStop(2);
         }
         else
         {
            visualMc.gotoAndStop(3);
            a = new Array(this.equipement0,this.equipement1,this.equipement2,this.equipement3,this.equipement4,this.equipement5);
            for(i = 0; i < a.length; i++)
            {
               (a[i] as MovieClip).visible = false;
            }
            for(i = 0; i < this._modelCampaign.itemReward.length; i++)
            {
               metaEquipement = this._modelCampaign.itemReward[i];
               equipementView = new EquipementView(a[i]);
               equipementView.setMetaEquipement(metaEquipement);
               this._views.push(equipementView);
            }
         }
      }
      
      public function get equipement0() : MovieClip
      {
         return visual.getChildByName("equipement0") as MovieClip;
      }
      
      public function get equipement1() : MovieClip
      {
         return visual.getChildByName("equipement1") as MovieClip;
      }
      
      public function get equipement2() : MovieClip
      {
         return visual.getChildByName("equipement2") as MovieClip;
      }
   }
}

