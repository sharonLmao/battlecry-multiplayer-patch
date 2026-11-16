package com.lachhhEngine.io
{
   import com.berzerkstudio.exported.FLASHNEEDED;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   
   public class FlashPlayerVersion
   {
      
      private static var browserType:int = -1;
      
      public static const BROWSER_UNKNOWN:int = browserType++;
      
      public static const BROWSER_UNAVAILABLE:int = browserType++;
      
      public static const BROWSER_IE5:int = browserType++;
      
      public static const BROWSER_IE6:int = browserType++;
      
      public static const BROWSER_IE7:int = browserType++;
      
      public static const BROWSER_IE8:int = browserType++;
      
      public static const BROWSER_FF2:int = browserType++;
      
      public static const BROWSER_FF3:int = browserType++;
      
      public function FlashPlayerVersion()
      {
         super();
      }
      
      public static function get browserString() : String
      {
         var str:String = null;
         if(ExternalInterface.available)
         {
            str = "";
            try
            {
               str = ExternalInterface.call("function getBrowser() { return navigator.userAgent; }");
            }
            catch(e:Error)
            {
            }
            return str;
         }
         return "";
      }
      
      public static function get flashPlayerMinorVersion() : Number
      {
         var versionNumber:String = Capabilities.version;
         var versionArray:Array = versionNumber.split(",");
         return parseInt(versionArray[1]);
      }
      
      public static function get browser() : int
      {
         var agent:String = browserString;
         if(agent == null || agent == "")
         {
            return BROWSER_UNAVAILABLE;
         }
         if(agent.toLowerCase().indexOf("msie 5.0") != -1)
         {
            return BROWSER_IE5;
         }
         if(agent.toLowerCase().indexOf("msie 6.0") != -1)
         {
            return BROWSER_IE6;
         }
         if(agent.toLowerCase().indexOf("msie 7.0") != -1)
         {
            return BROWSER_IE7;
         }
         if(agent.toLowerCase().indexOf("msie 8.0") != -1)
         {
            return BROWSER_IE8;
         }
         if(agent.toLowerCase().indexOf("firefox/2") != -1)
         {
            return BROWSER_FF2;
         }
         if(agent.toLowerCase().indexOf("firefox/3") != -1)
         {
            return BROWSER_FF3;
         }
         return BROWSER_UNKNOWN;
      }
      
      public static function get flashPlayerMajorVersion() : Number
      {
         var versionNumber:String = Capabilities.version;
         var versionArray:Array = versionNumber.split(",");
         var platformAndVersion:Array = versionArray[0].split(" ");
         return parseInt(platformAndVersion[1]);
      }
      
      public static function ValidatePlayer10(context:MovieClip, w:Number, h:Number) : Boolean
      {
         var mc:FLASHNEEDED = null;
         var versionNumber:String = Capabilities.version;
         var versionArray:Array = versionNumber.split(",");
         var platformAndVersion:Array = versionArray[0].split(" ");
         var majorVersion:Number = parseInt(platformAndVersion[1]);
         if(majorVersion < 10)
         {
            mc = new FLASHNEEDED();
            mc.x = w / 2;
            mc.y = h / 2;
            context.addChild(mc);
         }
         return majorVersion >= 10;
      }
   }
}

