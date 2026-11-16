package com.lachhhEngine.initializers
{
   import com.lachhhEngine.initializers.preloader.berzerk.NoBsPreloader;
   
   public class FGLNoBsVersionInit extends Initializer
   {
      
      public function FGLNoBsVersionInit()
      {
         super();
      }
      
      public static function SetVersionInfo() : void
      {
         VersionInfo.sponsorName = VersionInfo.NAME_TEMPLATE;
         VersionInfo.sponsorVisualFrame = VersionInfo.FRAME_TEMPLATE;
         VersionInfo.sponsorSiteUrl = VersionInfo.URL_SITE_BERZERK;
         VersionInfo.sponsorSiteMoreGamesUrl = VersionInfo.URL_MORE_GAMES_BERZERK;
         VersionInfo.sponsorSiteThisGameUrl = VersionInfo.URL_THIS_GAME_BERZERK;
         VersionInfo.preloader = new NoBsPreloader();
         VersionInfo.urlsSiteLocks = [VersionInfo.URL_SITELOCK_FGL];
         VersionInfo.canShowBerzerkAnims = true;
         VersionInfo.debugVersion = true;
      }
      
      override protected function PreInit() : void
      {
         super.PreInit();
         SetVersionInfo();
      }
   }
}

