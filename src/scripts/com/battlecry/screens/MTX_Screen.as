package com.battlecry.screens
{
   import com.battlecry.Main;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.init.BC_VersionInfo;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.io.BC_MetaExternalItemEnum;
   import com.battlecry.io.PlayerIO.PlayerIOBattleCryController;
   import com.battlecry.multilingual.BC_TextFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.multilingual.TextFactory;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class MTX_Screen extends BC_Screen
   {
      
      public function MTX_Screen()
      {
         super();
      }
      
      public function get loading() : MovieClip
      {
         return panel.getChildByName("loading") as MovieClip;
      }
      
      public function get mcBtnBuy5() : MovieClip
      {
         return this.btn_Buy5.getChildByName("buyMC") as MovieClip;
      }
      
      public function get btnBuy5Txt() : TextField
      {
         return this.mcBtnBuy5.getChildByName("buyTxt") as TextField;
      }
      
      public function get btn_ChallengeFacebook() : ButtonSelect
      {
         return panel.getChildByName("btn_ChallengeFacebook") as ButtonSelect;
      }
      
      public function get btnBuy3Txt() : TextField
      {
         return this.mcBtnBuy3.getChildByName("buyTxt") as TextField;
      }
      
      public function get rewardGoldPack1() : TextField
      {
         return panel.getChildByName("rewardGoldPack1") as TextField;
      }
      
      public function get rewardGoldPack2() : TextField
      {
         return panel.getChildByName("rewardGoldPack2") as TextField;
      }
      
      public function get rewardGoldPack3() : TextField
      {
         return panel.getChildByName("rewardGoldPack3") as TextField;
      }
      
      public function get rewardGoldPack4() : TextField
      {
         return panel.getChildByName("rewardGoldPack4") as TextField;
      }
      
      public function get rewardGoldPack5() : TextField
      {
         return panel.getChildByName("rewardGoldPack5") as TextField;
      }
      
      public function get btn_Buy1() : ButtonSelect
      {
         return panel.getChildByName("btn_Buy1") as ButtonSelect;
      }
      
      private function onChallengeTwitter(event:MouseEvent) : void
      {
         Main.instance.TwitterLink();
      }
      
      public function get btnBuy1Txt() : TextField
      {
         return this.mcBtnBuy1.getChildByName("buyTxt") as TextField;
      }
      
      public function get btn_Buy4() : ButtonSelect
      {
         return panel.getChildByName("btn_Buy4") as ButtonSelect;
      }
      
      public function get btn_Buy5() : ButtonSelect
      {
         return panel.getChildByName("btn_Buy5") as ButtonSelect;
      }
      
      private function AfterMTX() : void
      {
         PlayerIOBattleCryController.getInstance().mySecuredConnection.client.payVault.refresh(this.AfterRefresh);
      }
      
      public function get btn_Buy2() : ButtonSelect
      {
         return panel.getChildByName("btn_Buy2") as ButtonSelect;
      }
      
      public function get btn_Buy3() : ButtonSelect
      {
         return panel.getChildByName("btn_Buy3") as ButtonSelect;
      }
      
      public function get nextReferalTxt() : TextField
      {
         return panel.getChildByName("nextReferalTxt") as TextField;
      }
      
      private function onClose(event:MouseEvent) : void
      {
         Close(true,null,false);
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btn_Close.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         this.btn_Buy1.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBuy1);
         this.btn_Buy2.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBuy2);
         this.btn_Buy3.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBuy3);
         this.btn_Buy4.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBuy4);
         this.btn_Buy5.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBuy5);
      }
      
      public function get btn_Link() : ButtonSelect
      {
         return panel.getChildByName("btn_Link") as ButtonSelect;
      }
      
      public function get mcBtnBuy3() : MovieClip
      {
         return this.btn_Buy3.getChildByName("buyMC") as MovieClip;
      }
      
      private function WaitScreen() : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_QUESTION_SCREEN) > 0)
         {
            return;
         }
         var q:QuestionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_QUESTION_SCREEN,false,true) as QuestionScreen;
         q.setInfo(QuestionScreen.TYPE_OK,TextFactory.instance.GetMsg(BC_TextFactory.ID_ARMORGAME_MTX),new Callback(this.AfterMTX,this,null));
      }
      
      public function get btnBuy4Txt() : TextField
      {
         return this.mcBtnBuy4.getChildByName("buyTxt") as TextField;
      }
      
      public function get btnBuy2Txt() : TextField
      {
         return this.mcBtnBuy2.getChildByName("buyTxt") as TextField;
      }
      
      private function ChallengeFacebook(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_SHAREONFACEBOOK_SCREEN) > 0)
         {
            return;
         }
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_SHAREONFACEBOOK_SCREEN,false,true);
      }
      
      private function onBuy1(event:MouseEvent) : void
      {
         if(BC_VersionInfo.isArmorGames)
         {
            PlayerIOBattleCryController.getInstance().ShowItem(BC_MetaExternalItemEnum.MONEY_PACK_1);
            this.WaitScreen();
            return;
         }
         if(!ExternalAPIManager.getPremiumAPI().loggedIn)
         {
            if(BC_VersionInfo.isGamerSafe || BC_VersionInfo.isKongregate)
            {
               Main.instance.canLogin = true;
               ExternalAPIManager.getPremiumAPI().ShowLogin();
               Main.instance.loginScreenToClose = null;
            }
            return;
         }
         ExternalAPIManager.getPremiumAPI().ShowItem(BC_MetaExternalItemEnum.MONEY_PACK_1);
      }
      
      private function onBuy2(event:MouseEvent) : void
      {
         if(BC_VersionInfo.isArmorGames)
         {
            PlayerIOBattleCryController.getInstance().ShowItem(BC_MetaExternalItemEnum.MONEY_PACK_2);
            this.WaitScreen();
            return;
         }
         if(!ExternalAPIManager.getPremiumAPI().loggedIn)
         {
            if(BC_VersionInfo.isGamerSafe || BC_VersionInfo.isKongregate)
            {
               Main.instance.canLogin = true;
               ExternalAPIManager.getPremiumAPI().ShowLogin();
               Main.instance.loginScreenToClose = null;
            }
            return;
         }
         ExternalAPIManager.getPremiumAPI().ShowItem(BC_MetaExternalItemEnum.MONEY_PACK_2);
      }
      
      private function onBuy3(event:MouseEvent) : void
      {
         if(BC_VersionInfo.isArmorGames)
         {
            PlayerIOBattleCryController.getInstance().ShowItem(BC_MetaExternalItemEnum.MONEY_PACK_3);
            this.WaitScreen();
            return;
         }
         if(!ExternalAPIManager.getPremiumAPI().loggedIn)
         {
            if(BC_VersionInfo.isGamerSafe || BC_VersionInfo.isKongregate)
            {
               Main.instance.canLogin = true;
               ExternalAPIManager.getPremiumAPI().ShowLogin();
               Main.instance.loginScreenToClose = null;
            }
            return;
         }
         ExternalAPIManager.getPremiumAPI().ShowItem(BC_MetaExternalItemEnum.MONEY_PACK_3);
      }
      
      private function onBuy4(event:MouseEvent) : void
      {
         if(BC_VersionInfo.isArmorGames)
         {
            PlayerIOBattleCryController.getInstance().ShowItem(BC_MetaExternalItemEnum.MONEY_PACK_4);
            this.WaitScreen();
            return;
         }
         if(!ExternalAPIManager.getPremiumAPI().loggedIn)
         {
            if(BC_VersionInfo.isGamerSafe || BC_VersionInfo.isKongregate)
            {
               Main.instance.canLogin = true;
               ExternalAPIManager.getPremiumAPI().ShowLogin();
               Main.instance.loginScreenToClose = null;
            }
            return;
         }
         ExternalAPIManager.getPremiumAPI().ShowItem(BC_MetaExternalItemEnum.MONEY_PACK_4);
      }
      
      private function onBuy5(event:MouseEvent) : void
      {
         if(BC_VersionInfo.isArmorGames)
         {
            PlayerIOBattleCryController.getInstance().ShowItem(BC_MetaExternalItemEnum.MONEY_PACK_5);
            this.WaitScreen();
            return;
         }
         if(!ExternalAPIManager.getPremiumAPI().loggedIn)
         {
            if(BC_VersionInfo.isGamerSafe || BC_VersionInfo.isKongregate)
            {
               Main.instance.canLogin = true;
               ExternalAPIManager.getPremiumAPI().ShowLogin();
               Main.instance.loginScreenToClose = null;
            }
            return;
         }
         ExternalAPIManager.getPremiumAPI().ShowItem(BC_MetaExternalItemEnum.MONEY_PACK_5);
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         InitOkBtn(this.btn_Close);
         this.btn_Close.addEventListener(MouseEvent.MOUSE_DOWN,this.onClose);
         InitOkBtn(this.btn_Buy1);
         this.btn_Buy1.addEventListener(MouseEvent.MOUSE_DOWN,this.onBuy1);
         InitOkBtn(this.btn_Buy2);
         this.btn_Buy2.addEventListener(MouseEvent.MOUSE_DOWN,this.onBuy2);
         InitOkBtn(this.btn_Buy3);
         this.btn_Buy3.addEventListener(MouseEvent.MOUSE_DOWN,this.onBuy3);
         InitOkBtn(this.btn_Buy4);
         this.btn_Buy4.addEventListener(MouseEvent.MOUSE_DOWN,this.onBuy4);
         InitOkBtn(this.btn_Buy5);
         this.btn_Buy5.addEventListener(MouseEvent.MOUSE_DOWN,this.onBuy5);
         InitOkBtn(this.btn_Link);
         this.btn_Link.addEventListener(MouseEvent.MOUSE_DOWN,this.onLink);
         InitOkBtn(this.btn_ChallengeFacebook);
         this.btn_ChallengeFacebook.addEventListener(MouseEvent.MOUSE_DOWN,this.ChallengeFacebook);
         InitOkBtn(this.btn_ChallengeTwitter);
         this.btn_ChallengeTwitter.addEventListener(MouseEvent.MOUSE_DOWN,this.onChallengeTwitter);
         this.loading.visible = false;
         this.anim.play();
         this.anim.playChildren = true;
         this.Refresh();
      }
      
      public function get mcBtnBuy1() : MovieClip
      {
         return this.btn_Buy1.getChildByName("buyMC") as MovieClip;
      }
      
      public function get mcBtnBuy2() : MovieClip
      {
         return this.btn_Buy2.getChildByName("buyMC") as MovieClip;
      }
      
      public function get btn_ChallengeTwitter() : ButtonSelect
      {
         return panel.getChildByName("btn_ChallengeTwitter") as ButtonSelect;
      }
      
      public function get mcBtnBuy4() : MovieClip
      {
         return this.btn_Buy4.getChildByName("buyMC") as MovieClip;
      }
      
      public function get btn_Close() : ButtonSelect
      {
         return panel.getChildByName("btn_Close") as ButtonSelect;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(BC_VersionInfo.isKongregate)
         {
            this.btnBuy1Txt.text = "20 Kreds";
            this.btnBuy2Txt.text = "50 Kreds";
            this.btnBuy3Txt.text = "100 Kreds";
            this.btnBuy4Txt.text = "150 Kreds";
            this.btnBuy5Txt.text = "500 Kreds";
         }
         else
         {
            this.btnBuy1Txt.text = "$1.99";
            this.btnBuy2Txt.text = "$4.99";
            this.btnBuy3Txt.text = "$9.99";
            this.btnBuy4Txt.text = "$14.99";
            this.btnBuy5Txt.text = "$49.99";
         }
         this.rewardGoldPack1.text = "4,000";
         this.rewardGoldPack2.text = "12,500";
         this.rewardGoldPack3.text = "30,000";
         this.rewardGoldPack4.text = "50,000";
         this.rewardGoldPack5.text = "350,000";
         if(this.anim)
         {
            this.anim.play();
         }
      }
      
      private function onLink(event:MouseEvent) : void
      {
         if(ScreenManager.instance.GetNbActiveById(BC_ScreenFactory.ID_LINK_SCREEN) > 0)
         {
            return;
         }
         ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_LINK_SCREEN);
      }
      
      private function AfterMtxCheck() : void
      {
         this.loading.visible = false;
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this.nextReferalTxt.text = BC_GameProgress.gameProgess.GetReferentialReward(BC_GameProgress.gameProgess.numReferential + 1) + "";
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_MTX_SCREEN);
      }
      
      public function get anim() : MovieClip
      {
         return this.loading.getChildByName("anim") as MovieClip;
      }
      
      private function AfterRefresh() : void
      {
         this.loading.visible = true;
         Main.instance.CheckArmorGamesMTX(new Callback(this.AfterMtxCheck,this,null));
      }
   }
}

