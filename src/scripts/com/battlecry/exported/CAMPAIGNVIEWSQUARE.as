package com.battlecry.exported
{
   import adobe.utils.*;
   import com.lachhhEngine.games.animation.Animation;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4259")]
   public dynamic class CAMPAIGNVIEWSQUARE extends Animation
   {
      
      public var __id48_:MultilingualTextFieldFinder1;
      
      public var __id47_:MultilingualTextFieldFinder1;
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public function CAMPAIGNVIEWSQUARE()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3);
      }
      
      internal function frame1() : *
      {
         if(__setPropDict[__id48_] == undefined || int(__setPropDict[__id48_]) != 1)
         {
            __setPropDict[__id48_] = 1;
            __setProp___id48__CampaignViewSquare_Layer6_0();
         }
         if(__setPropDict[__id47_] == undefined || int(__setPropDict[__id47_]) != 1)
         {
            __setPropDict[__id47_] = 1;
            __setProp___id47__CampaignViewSquare_Layer6_0();
         }
      }
      
      internal function frame2() : *
      {
         if(__setPropDict[__id48_] == undefined || !(int(__setPropDict[__id48_]) >= 2 && int(__setPropDict[__id48_]) <= 3))
         {
            __setPropDict[__id48_] = currentFrame;
            __setProp___id48__CampaignViewSquare_Layer6_1();
         }
         if(__setPropDict[__id47_] == undefined || !(int(__setPropDict[__id47_]) >= 2 && int(__setPropDict[__id47_]) <= 3))
         {
            __setPropDict[__id47_] = currentFrame;
            __setProp___id47__CampaignViewSquare_Layer6_1();
         }
      }
      
      internal function frame3() : *
      {
         if(__setPropDict[__id48_] == undefined || !(int(__setPropDict[__id48_]) >= 2 && int(__setPropDict[__id48_]) <= 3))
         {
            __setPropDict[__id48_] = currentFrame;
            __setProp___id48__CampaignViewSquare_Layer6_1();
         }
         if(__setPropDict[__id47_] == undefined || !(int(__setPropDict[__id47_]) >= 2 && int(__setPropDict[__id47_]) <= 3))
         {
            __setPropDict[__id47_] = currentFrame;
            __setProp___id47__CampaignViewSquare_Layer6_1();
         }
      }
      
      internal function __setProp___id48__CampaignViewSquare_Layer6_0() : *
      {
         try
         {
            __id48_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id48_.textFieldName = "AUTO_0";
         __id48_.textId = "ID_AUTO_REWARD_0";
         try
         {
            __id48_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id48__CampaignViewSquare_Layer6_1() : *
      {
         try
         {
            __id48_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id48_.textFieldName = "campaignName";
         __id48_.textId = "";
         try
         {
            __id48_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id47__CampaignViewSquare_Layer6_1() : *
      {
         try
         {
            __id47_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id47_.textFieldName = "AUTO_1";
         __id47_.textId = "ID_AUTO_REWARD_1";
         try
         {
            __id47_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id47__CampaignViewSquare_Layer6_0() : *
      {
         try
         {
            __id47_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id47_.textFieldName = "campaignName";
         __id47_.textId = "";
         try
         {
            __id47_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

