package com.lachhhEngine.initializers
{
   import com.berzerkstudio.exported.GAMERSAFE_DESC;
   import com.berzerkstudio.exported.SITE_LOCK_WARNING_BERZERK;
   import com.lachhhEngine.initializers.preloader.IPreloader;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.FlashPlayerVersion;
   import com.lachhhEngine.io.KongStats;
   import com.lachhhEngine.io.SiteLocking;
   import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
   import com.lachhhEngine.io.externalAPI.GamerSafeController;
   import com.lachhhEngine.io.externalAPI.metricsAPI.MetricGroup;
   import com.lachhhEngine.io.gamerSafe.GamerSafe;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public dynamic class Initializer extends MovieClip
   {
      
      private var _back:MovieClip;
      
      private var _preloader:IPreloader;
      
      private var _gsDesc:GAMERSAFE_DESC;
      
      public function Initializer()
      {
         super();
         stop();
         addEventListener(Event.ENTER_FRAME,this.Update,false,0,true);
         this._back = this.CreatePreloaderBack();
         if(this._back)
         {
            VersionInfo.transparentBackGroundOnPreloader = true;
            addChild(this._back);
         }
      }
      
      private function OnClick(e:Event) : void
      {
         navigateToURL(new URLRequest(VersionInfo.URL_BERZERK_DISTRIBUTION),"_blank");
         ExternalAPIManager.getMetricsAPI().RecordStats(VersionInfo.URL_BERZERK_DISTRIBUTION,MetricGroup.VIRAL);
      }
      
      protected function CreatePreloaderBack() : MovieClip
      {
         return null;
      }
      
      protected function get canPlay() : Boolean
      {
         var sites:Array = VersionInfo.urlsSiteLocks;
         sites.push(VersionInfo.URL_SITELOCK_BERZERK);
         sites.push(VersionInfo.URL_SITELOCK_BERZERK_LAND);
         return (!VersionInfo.useSiteLock || SiteLocking.IsInSites(root,sites)) && (VersionInfo.canBePlayedOffline || !SiteLocking.IsInSites(root,[""]));
      }
      
      protected function GetMainClassString() : String
      {
         var str:String = getQualifiedClassName(this);
         var params:Array = str.split(".");
         return params[0] + "." + params[1] + ".Main";
      }
      
      public function onClickGsPart(e:Event) : void
      {
         navigateToURL(new URLRequest(VersionInfo.urlSiteGamerSafe),"_blank");
         ExternalAPIManager.getMetricsAPI().RecordStats(VersionInfo.urlSiteGamerSafe,MetricGroup.VIRAL);
      }
      
      private function Update(e:Event) : void
      {
         if(this.loaderInfo == null || this.loaderInfo.url == null || !this.canStart || stage == null)
         {
            return;
         }
         if(!FlashPlayerVersion.ValidatePlayer10(this,stage.stageWidth,stage.stageHeight))
         {
            return;
         }
         removeEventListener(Event.ENTER_FRAME,this.Update);
         var k:KongStats = new KongStats();
         ExternalAPIManager.SetStatsAPI(k);
         this.PreInit();
         k.Init(this);
         this.Init();
         if(ExternalAPIManager.getPremiumAPI() is GamerSafeController && this._preloader != null)
         {
            if(VersionInfo.showGSDescInPreloader)
            {
               this._gsDesc = new GAMERSAFE_DESC();
               this._gsDesc.y = stage.stageHeight;
               if(VersionInfo.gamerSafeLinkInPerloader)
               {
                  this._gsDesc.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickGsPart);
                  this._gsDesc.buttonMode = true;
               }
               addChild(this._gsDesc);
               addEventListener(Event.ENTER_FRAME,this.UpdateGs);
            }
         }
      }
      
      private function PreloaderEnded() : void
      {
         if(this._gsDesc != null && VersionInfo.showGSDescInPreloader)
         {
            removeEventListener(Event.ENTER_FRAME,this.UpdateGs);
            this._gsDesc.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickGsPart);
            removeChild(this._gsDesc);
            this._gsDesc = null;
         }
         removeChild(this._preloader.visual);
         this._preloader = null;
         VersionInfo.preloader = null;
         this.StartMain();
      }
      
      protected function Init() : void
      {
         if(this.canPlay)
         {
            this._preloader = VersionInfo.preloader;
            this._preloader.callback = new Callback(this.PreloaderEnded,this,[]);
            addChild(this._preloader.visual);
            this._preloader.Init();
         }
         else
         {
            this.ShowSiteLockMsg();
         }
      }
      
      protected function ShowSiteLockMsg() : void
      {
         var w:int = stage.stageWidth;
         var h:int = stage.stageHeight;
         var warning:SITE_LOCK_WARNING_BERZERK = new SITE_LOCK_WARNING_BERZERK();
         var mcBack:MovieClip = new MovieClip();
         mcBack.graphics.beginFill(0);
         mcBack.graphics.drawRect(0,0,w,h);
         mcBack.graphics.endFill();
         warning.x = w / 2;
         warning.y = h / 2;
         addChild(mcBack);
         addChild(warning);
         addEventListener(MouseEvent.CLICK,this.OnClick);
         buttonMode = true;
         var tf:TextField = new TextField();
         tf.text = root.loaderInfo.url;
         tf.textColor = 11184810;
         tf.autoSize = TextFieldAutoSize.LEFT;
         addChild(tf);
         if(stage != null)
         {
            tf.y = stage.stageHeight - 20;
         }
      }
      
      protected function PreInit() : void
      {
      }
      
      private function UpdateGs(e:Event) : void
      {
         var percent:Number = NaN;
         if(this._gsDesc != null)
         {
            percent = root.loaderInfo.bytesLoaded / root.loaderInfo.bytesTotal;
            if(percent >= 1)
            {
               this._gsDesc.alpha -= 0.05;
               if(this._gsDesc.alpha <= 0)
               {
                  this._gsDesc.alpha = 0;
                  this._gsDesc.visible = false;
               }
               return;
            }
            if(GamerSafe.api != null && GamerSafe.api.loaded && !GamerSafe.api.loggedIn)
            {
               this._gsDesc.tryItAnim.alpha += 0.05;
            }
            else
            {
               this._gsDesc.tryItAnim.alpha -= 0.05;
            }
         }
      }
      
      protected function get canStart() : Boolean
      {
         return true;
      }
      
      protected function StartMain() : void
      {
         var app:DisplayObject = null;
         gotoAndStop(2);
         var mainClass:Class = Class(getDefinitionByName(this.GetMainClassString()));
         if(mainClass)
         {
            app = new mainClass();
            addChild(app as DisplayObject);
            app["Init"]();
         }
         if(this._back)
         {
            removeChild(this._back);
         }
         this._back = null;
      }
   }
}

