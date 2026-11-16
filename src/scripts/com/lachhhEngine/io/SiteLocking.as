package com.lachhhEngine.io
{
   import com.lachhhEngine.initializers.VersionInfo;
   import flash.display.DisplayObject;
   
   public class SiteLocking
   {
      
      public function SiteLocking()
      {
         super();
      }
      
      public static function IsBanned(root:DisplayObject) : Boolean
      {
         return false;
      }
      
      public static function IsInSites(root:DisplayObject, a:Array) : Boolean
      {
         for(var i:int = 0; i < a.length; i++)
         {
            if(a[i] != null)
            {
               if(IsInSite(root,a[i]))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public static function IsInSite(root:DisplayObject, site:String) : Boolean
      {
         var siteURL:String = null;
         var i:int = 0;
         var domain:String = null;
         if(site == "")
         {
            i = int(root.loaderInfo.url.indexOf("file:///"));
            return i != -1;
         }
         siteURL = root.loaderInfo.url;
         domain = siteURL.split("/")[2];
         if(domain == null)
         {
            return false;
         }
         if(domain.indexOf(site) == -1)
         {
            return false;
         }
         if(VersionInfo.ignoreExtensionDomain)
         {
            domain = domain.substring(domain.indexOf(site),domain.length);
            domain = domain.split(".")[0];
         }
         if(domain.indexOf(site) == domain.length - site.length)
         {
            return true;
         }
         return false;
      }
   }
}

