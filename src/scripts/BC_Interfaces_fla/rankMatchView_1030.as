package BC_Interfaces_fla
{
   import adobe.utils.*;
   import com.battlecry.exported.BTN_CLOSE;
   import com.battlecry.exported.BTN_RANKEDFIGHT;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4872")]
   public dynamic class rankMatchView_1030 extends MovieClip
   {
      
      public var __id215_:MultilingualTextFieldFinder1;
      
      public var __id213_:MultilingualTextFieldFinder1;
      
      public var playerName:TextField;
      
      public var AUTO_0:TextField;
      
      public var AUTO_1:TextField;
      
      public var __id216_:MultilingualTextFieldFinder1;
      
      public var __id214_:MultilingualTextFieldFinder1;
      
      public var allyflagView:MovieClip;
      
      public var btn_fight:BTN_RANKEDFIGHT;
      
      public var btn_Close:BTN_CLOSE;
      
      public var ennemyName:TextField;
      
      public var ennemyflagView:MovieClip;
      
      public function rankMatchView_1030()
      {
         super();
         __setProp___id213__rankMatchView_Layer1_0();
         __setProp___id214__rankMatchView_Layer1_0();
         __setProp___id215__rankMatchView_Layer1_0();
         __setProp___id216__rankMatchView_Layer1_0();
      }
      
      internal function __setProp___id213__rankMatchView_Layer1_0() : *
      {
         try
         {
            __id213_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id213_.textFieldName = "AUTO_0";
         __id213_.textId = "ID_AUTO_VS_0";
         try
         {
            __id213_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id216__rankMatchView_Layer1_0() : *
      {
         try
         {
            __id216_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id216_.textFieldName = "AUTO_1";
         __id216_.textId = "ID_AUTO_RANKED_0";
         try
         {
            __id216_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id214__rankMatchView_Layer1_0() : *
      {
         try
         {
            __id214_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id214_.textFieldName = "playerName";
         __id214_.textId = "";
         try
         {
            __id214_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id215__rankMatchView_Layer1_0() : *
      {
         try
         {
            __id215_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id215_.textFieldName = "ennemyName";
         __id215_.textId = "";
         try
         {
            __id215_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

