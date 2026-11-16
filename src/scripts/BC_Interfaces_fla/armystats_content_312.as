package BC_Interfaces_fla
{
   import adobe.utils.*;
   import com.battlecry.exported.BTN_ACTIVATEMULTIPLAYER;
   import com.battlecry.exported.BTN_DEACTIVATEMULTIPLAYER;
   import com.battlecry.exported.BTN_RANKEDMATCH;
   import com.battlecry.exported.BTN_REFRESH_MULTIPLAYER;
   import com.battlecry.exported.BTN_RESETARMYRANK;
   import com.battlecry.exported.BTN_SHOWLADER;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4334")]
   public dynamic class armystats_content_312 extends MovieClip
   {
      
      public var armyDraw:TextField;
      
      public var __id378_:MultilingualTextFieldFinder1;
      
      public var __id386_:MultilingualTextFieldFinder1;
      
      public var __id382_:MultilingualTextFieldFinder1;
      
      public var armyRankIcon:MovieClip;
      
      public var AUTO_1:TextField;
      
      public var AUTO_2:TextField;
      
      public var AUTO_3:TextField;
      
      public var AUTO_4:TextField;
      
      public var AUTO_5:TextField;
      
      public var AUTO_6:TextField;
      
      public var AUTO_7:TextField;
      
      public var AUTO_8:TextField;
      
      public var AUTO_9:TextField;
      
      public var __id383_:MultilingualTextFieldFinder1;
      
      public var btn_activateArmy:BTN_ACTIVATEMULTIPLAYER;
      
      public var __id379_:MultilingualTextFieldFinder1;
      
      public var btn_ResetArmy:BTN_RESETARMYRANK;
      
      public var __id384_:MultilingualTextFieldFinder1;
      
      public var __id380_:MultilingualTextFieldFinder1;
      
      public var btn_rankedMatch:BTN_RANKEDMATCH;
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public var btn_desactivateArmy:BTN_DEACTIVATEMULTIPLAYER;
      
      public var rankingName:TextField;
      
      public var btn_showLadder:BTN_SHOWLADER;
      
      public var __id377_:MultilingualTextFieldFinder1;
      
      public var armyLost:TextField;
      
      public var armyRank:TextField;
      
      public var __id385_:MultilingualTextFieldFinder1;
      
      public var __id381_:MultilingualTextFieldFinder1;
      
      public var btn_Refresh:BTN_REFRESH_MULTIPLAYER;
      
      public var armyWin:TextField;
      
      public function armystats_content_312()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         __setProp___id377__armystats_content_Layer9_0();
         __setProp___id378__armystats_content_Layer8_0();
         __setProp___id381__armystats_content_Content_0();
         __setProp___id382__armystats_content_Content_0();
         __setProp___id384__armystats_content_Content_0();
         __setProp___id386__armystats_content_Layer5_0();
      }
      
      internal function __setProp___id379__armystats_content_Content_0() : *
      {
         try
         {
            __id379_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id379_.textFieldName = "AUTO_1";
         __id379_.textId = "ID_AUTO_LOSSES_0";
         try
         {
            __id379_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id379__armystats_content_Content_1() : *
      {
         try
         {
            __id379_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id379_.textFieldName = "AUTO_6";
         __id379_.textId = "ID_AUTO_LOSSES_0";
         try
         {
            __id379_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id383__armystats_content_Content_0() : *
      {
         try
         {
            __id383_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id383_.textFieldName = "AUTO_3";
         __id383_.textId = "ID_AUTO_DRAWS_0";
         try
         {
            __id383_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id383__armystats_content_Content_1() : *
      {
         try
         {
            __id383_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id383_.textFieldName = "AUTO_8";
         __id383_.textId = "ID_AUTO_DRAWS_0";
         try
         {
            __id383_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id386__armystats_content_Layer5_0() : *
      {
         try
         {
            __id386_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id386_.textFieldName = "AUTO_5";
         __id386_.textId = "ID_AUTO_REFRESH_0";
         try
         {
            __id386_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id384__armystats_content_Content_0() : *
      {
         try
         {
            __id384_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id384_.textFieldName = "armyDraw";
         __id384_.textId = "";
         try
         {
            __id384_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id380__armystats_content_Content_0() : *
      {
         try
         {
            __id380_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id380_.textFieldName = "AUTO_2";
         __id380_.textId = "ID_AUTO_WINS_0";
         try
         {
            __id380_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id380__armystats_content_Content_1() : *
      {
         try
         {
            __id380_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id380_.textFieldName = "AUTO_7";
         __id380_.textId = "ID_AUTO_WINS_0";
         try
         {
            __id380_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id378__armystats_content_Layer8_0() : *
      {
         try
         {
            __id378_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id378_.textFieldName = "armyRank";
         __id378_.textId = "";
         try
         {
            __id378_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id385__armystats_content_Content_1() : *
      {
         try
         {
            __id385_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id385_.textFieldName = "AUTO_9";
         __id385_.textId = "ID_AUTO_DEACTIVATE_0";
         try
         {
            __id385_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id385__armystats_content_Content_0() : *
      {
         try
         {
            __id385_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id385_.textFieldName = "AUTO_4";
         __id385_.textId = "ID_AUTO_ACTIVATE_0";
         try
         {
            __id385_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame2() : *
      {
         if(__setPropDict[__id385_] == undefined || int(__setPropDict[__id385_]) != 2)
         {
            __setPropDict[__id385_] = 2;
            __setProp___id385__armystats_content_Content_1();
         }
         if(__setPropDict[__id383_] == undefined || int(__setPropDict[__id383_]) != 2)
         {
            __setPropDict[__id383_] = 2;
            __setProp___id383__armystats_content_Content_1();
         }
         if(__setPropDict[__id380_] == undefined || int(__setPropDict[__id380_]) != 2)
         {
            __setPropDict[__id380_] = 2;
            __setProp___id380__armystats_content_Content_1();
         }
         if(__setPropDict[__id379_] == undefined || int(__setPropDict[__id379_]) != 2)
         {
            __setPropDict[__id379_] = 2;
            __setProp___id379__armystats_content_Content_1();
         }
      }
      
      internal function frame1() : *
      {
         if(__setPropDict[__id385_] == undefined || int(__setPropDict[__id385_]) != 1)
         {
            __setPropDict[__id385_] = 1;
            __setProp___id385__armystats_content_Content_0();
         }
         if(__setPropDict[__id383_] == undefined || int(__setPropDict[__id383_]) != 1)
         {
            __setPropDict[__id383_] = 1;
            __setProp___id383__armystats_content_Content_0();
         }
         if(__setPropDict[__id380_] == undefined || int(__setPropDict[__id380_]) != 1)
         {
            __setPropDict[__id380_] = 1;
            __setProp___id380__armystats_content_Content_0();
         }
         if(__setPropDict[__id379_] == undefined || int(__setPropDict[__id379_]) != 1)
         {
            __setPropDict[__id379_] = 1;
            __setProp___id379__armystats_content_Content_0();
         }
      }
      
      internal function __setProp___id381__armystats_content_Content_0() : *
      {
         try
         {
            __id381_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id381_.textFieldName = "armyLost";
         __id381_.textId = "";
         try
         {
            __id381_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id382__armystats_content_Content_0() : *
      {
         try
         {
            __id382_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id382_.textFieldName = "armyWin";
         __id382_.textId = "";
         try
         {
            __id382_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id377__armystats_content_Layer9_0() : *
      {
         try
         {
            __id377_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id377_.textFieldName = "rankingName";
         __id377_.textId = "";
         try
         {
            __id377_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

