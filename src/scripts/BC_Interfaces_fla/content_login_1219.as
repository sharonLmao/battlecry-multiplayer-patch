package BC_Interfaces_fla
{
   import adobe.utils.*;
   import com.battlecry.exported.BTN_CANCEL;
   import com.battlecry.exported.BTN_OK;
   import com.battlecry.exported.BTN_X;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3909")]
   public dynamic class content_login_1219 extends MovieClip
   {
      
      public var __id44_:MultilingualTextFieldFinder1;
      
      public var username:TextField;
      
      public var password:TextField;
      
      public var btn_Cancel:BTN_CANCEL;
      
      public var btn_OK:BTN_OK;
      
      public var AUTO_0:TextField;
      
      public var AUTO_1:TextField;
      
      public var AUTO_2:TextField;
      
      public var __id45_:MultilingualTextFieldFinder1;
      
      public var __id43_:MultilingualTextFieldFinder1;
      
      public var btn_X:BTN_X;
      
      public function content_login_1219()
      {
         super();
         __setProp___id43__content_login_Layer1_0();
         __setProp___id44__content_login_Layer1_0();
         __setProp___id45__content_login_Layer1_0();
      }
      
      internal function __setProp___id43__content_login_Layer1_0() : *
      {
         try
         {
            __id43_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id43_.textFieldName = "AUTO_0";
         __id43_.textId = "ID_AUTO_LOGIN_0";
         try
         {
            __id43_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id45__content_login_Layer1_0() : *
      {
         try
         {
            __id45_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id45_.textFieldName = "AUTO_2";
         __id45_.textId = "ID_AUTO_PASSWORD_0";
         try
         {
            __id45_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id44__content_login_Layer1_0() : *
      {
         try
         {
            __id44_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id44_.textFieldName = "AUTO_1";
         __id44_.textId = "ID_AUTO_USERNAME_0";
         try
         {
            __id44_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

