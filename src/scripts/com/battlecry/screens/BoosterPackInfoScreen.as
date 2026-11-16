package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.MetaEquipement;
   import com.battlecry.meta.model.ModelBoosterPack;
   import com.battlecry.meta.model.ModelBoosterPackEnum;
   import com.battlecry.screens.view.BoosterPackRewardView;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.KongStats;
   import com.lachhhEngine.io.externalAPI.statsAPI.MetaStatData;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class BoosterPackInfoScreen extends BC_Screen
   {
      
      private var _boosterPackRewardView:BoosterPackRewardView;
      
      private var _modelBoosterPack:ModelBoosterPack;
      
      public function BoosterPackInfoScreen()
      {
         super();
      }
      
      public function get boosterName() : TextField
      {
         return panel.getChildByName("boosterName") as TextField;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_BOOSTERPACKINFO_SCREEN);
      }
      
      public function get btn_OK() : ButtonSelect
      {
         return panel.getChildByName("btn_OK") as ButtonSelect;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         this._boosterPackRewardView.Update();
      }
      
      public function get btnX() : ButtonSelect
      {
         return panel.getChildByName("btn_X") as ButtonSelect;
      }
      
      public function reward(v:Vector.<MetaEquipement>, modelBoosterPack:ModelBoosterPack) : void
      {
         this._boosterPackRewardView.Init(v);
         this._boosterPackRewardView.Refresh();
         BC_Game.instance.Save();
         this._modelBoosterPack = modelBoosterPack;
         this.Refresh();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._boosterPackRewardView = new BoosterPackRewardView(this.boosterPackRewardView);
         InitOkBtn(this.btnX);
         this.btnX.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         InitOkBtn(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         animation.playChildren = false;
      }
      
      public function get boosterSet() : TextField
      {
         return panel.getChildByName("boosterSet") as TextField;
      }
      
      override public function Close(remove:Boolean, c:Callback, quickClose:Boolean) : void
      {
         var collectionSize:MetaStatData = null;
         super.Close(remove,c,quickClose);
         if(BC_VersionInfo.isKongregate)
         {
            collectionSize = new MetaStatData("Collection_Size",BC_GameProgress.gameProgess.metaCollection.GetNumUnlocked());
            KongStats.SubmitData(collectionSize);
         }
      }
      
      private function onX(event:MouseEvent) : void
      {
         this.Close(true,null,false);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._boosterPackRewardView.Destroy();
         this.btnX.removeEventListener(MouseEvent.MOUSE_DOWN,this.onX);
         this.btn_OK.removeEventListener(MouseEvent.MOUSE_DOWN,this.onX);
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.boosterSet.text = TextFactory.instance.GetMsg(ModelBoosterPackEnum.ALL_SET_TEXT[this._modelBoosterPack.boosterType]);
         this.boosterName.text = TextFactory.instance.GetMsg(this._modelBoosterPack.boosterName);
      }
      
      public function get boosterPackRewardView() : MovieClip
      {
         return panel.getChildByName("BoosterPackRewardView") as MovieClip;
      }
   }
}

