package BC_Interfaces_fla
{
   import adobe.utils.*;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2525")]
   public dynamic class rankScoreView_1031 extends MovieClip
   {
      
      public var rankingText:TextField;
      
      public var currentRank:MovieClip;
      
      public var __id212_:MultilingualTextFieldFinder1;
      
      public var __id211_:MultilingualTextFieldFinder1;
      
      public var lowerRank:MovieClip;
      
      public var upperRank:MovieClip;
      
      public var AUTO_0:TextField;
      
      public function rankScoreView_1031()
      {
         super();
         __setProp___id211__rankScoreView_Layer1_0();
         __setProp___id212__rankScoreView_Layer1_0();
      }
      
      internal function __setProp___id211__rankScoreView_Layer1_0() : *
      {
         try
         {
            __id211_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id211_.textFieldName = "rankingText";
         __id211_.textId = "";
         try
         {
            __id211_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id212__rankScoreView_Layer1_0() : *
      {
         try
         {
            __id212_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id212_.textFieldName = "AUTO_0";
         __id212_.textId = "ID_AUTO_RANK_0";
         try
         {
            __id212_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

