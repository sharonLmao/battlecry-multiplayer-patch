package com.battlecry.init
{
   import com.battlecry.io.PlayerIO.ModelExternalPremiumAPIEnum;
   import com.berzerkstudio.exported.BERZERK_LOGO;
   import com.lachhhEngine.initializers.FGLNoBsVersionInit;
   import com.lachhhEngine.initializers.VersionInfo;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.externalAPI.GamerSafeController;
   
   public class ViralInit extends FGLNoBsVersionInit
   {
      
      public function ViralInit()
      {
         super();
      }
      
      override protected function PreInit() : void
      {
         var b:BERZERK_LOGO = null;
         super.PreInit();
         BC_VersionInfo.connectPIO = true;
         BC_VersionInfo.isGamerSafe = true;
         BC_VersionInfo.modelExternalAPI = ModelExternalPremiumAPIEnum.GAMERSAFE;
         var gsController:GamerSafeController = new GamerSafeController("eeb86caec26ec616d294ee14cc1143a807981de1","G11b0b69c415aa6b59ba31a0a39bcc8447aaf5cfe4:1303154416");
         ExternalAPIManager.SetPremiumAPI(gsController);
         VersionInfo.canBePlayedOffline = true;
         VersionInfo.useSiteLock = false;
         VersionInfo.debugVersion = false;
         VersionInfo.showGSDescInPreloader = false;
         VersionInfo.canShowBerzerkAnims = true;
         VersionInfo.preloader = new SoGoodPreloader();
         VersionInfo.sponsorSiteUrl = "http://sogood.com";
         VersionInfo.sponsorSiteThisGameUrl = "http://sogood.com";
         VersionInfo.sponsorSiteMoreGamesUrl = "http://sogood.com";
         VersionInfo.sponsorName = "SoGood.com";
         ExternalAPIManager.getPremiumAPI().Connect(this,new Callback(BC_VersionInfo.afterGSConnect,BC_VersionInfo,null));
         VersionInfo.versionInfo = BC_VersionInfo.GetVersion();
         BC_VersionInfo.isBitMapMode = false;
      }
   }
}

