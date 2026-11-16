package BC_Interfaces_fla
{
   import adobe.utils.*;
   import com.battlecry.exported.BTN_GOLDARROWSIDE;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3559")]
   public dynamic class StoryPagination_287 extends MovieClip
   {
      
      public var AUTO_0:TextField;
      
      public var btn_NextPage:BTN_GOLDARROWSIDE;
      
      public var currentPage:TextField;
      
      public var btn_PreviousPage:BTN_GOLDARROWSIDE;
      
      public var __id395_:MultilingualTextFieldFinder1;
      
      public var __id394_:MultilingualTextFieldFinder1;
      
      public var __id396_:MultilingualTextFieldFinder1;
      
      public var MaxPage:TextField;
      
      public function StoryPagination_287()
      {
         super();
         __setProp___id394__StoryPagination_Layer1_0();
         __setProp___id395__StoryPagination_Layer1_0();
         __setProp___id396__StoryPagination_Layer1_0();
      }
      
      internal function __setProp___id394__StoryPagination_Layer1_0() : *
      {
         try
         {
            __id394_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id394_.textFieldName = "currentPage";
         __id394_.textId = "";
         try
         {
            __id394_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id395__StoryPagination_Layer1_0() : *
      {
         try
         {
            __id395_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id395_.textFieldName = "AUTO_0";
         __id395_.textId = "ID_AUTO___3";
         try
         {
            __id395_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id396__StoryPagination_Layer1_0() : *
      {
         try
         {
            __id396_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id396_.textFieldName = "MaxPage";
         __id396_.textId = "";
         try
         {
            __id396_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

