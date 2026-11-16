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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4148")]
   public dynamic class TUTORIAL_INGAME_SCREEN extends Animation
   {
      
      public var __id270_:MultilingualTextFieldFinder1;
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public function TUTORIAL_INGAME_SCREEN()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4);
      }
      
      internal function frame1() : *
      {
         if(__setPropDict[__id270_] == undefined || int(__setPropDict[__id270_]) != 1)
         {
            __setPropDict[__id270_] = 1;
            __setProp___id270__Tutorial_InGame_Screen_Layer6_0();
         }
      }
      
      internal function frame2() : *
      {
         if(__setPropDict[__id270_] == undefined || int(__setPropDict[__id270_]) != 2)
         {
            __setPropDict[__id270_] = 2;
            __setProp___id270__Tutorial_InGame_Screen_Layer6_1();
         }
      }
      
      internal function frame3() : *
      {
         if(__setPropDict[__id270_] == undefined || int(__setPropDict[__id270_]) != 3)
         {
            __setPropDict[__id270_] = 3;
            __setProp___id270__Tutorial_InGame_Screen_Layer6_2();
         }
      }
      
      internal function frame4() : *
      {
         if(__setPropDict[__id270_] == undefined || int(__setPropDict[__id270_]) != 4)
         {
            __setPropDict[__id270_] = 4;
            __setProp___id270__Tutorial_InGame_Screen_Layer6_3();
         }
      }
      
      internal function __setProp___id270__Tutorial_InGame_Screen_Layer6_0() : *
      {
         try
         {
            __id270_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id270_.textFieldName = "AUTO_0";
         __id270_.textId = "ID_AUTO_G_DAY_0";
         try
         {
            __id270_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id270__Tutorial_InGame_Screen_Layer6_1() : *
      {
         try
         {
            __id270_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id270_.textFieldName = "AUTO_1";
         __id270_.textId = "ID_AUTO_YOU_3";
         try
         {
            __id270_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id270__Tutorial_InGame_Screen_Layer6_2() : *
      {
         try
         {
            __id270_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id270_.textFieldName = "AUTO_2";
         __id270_.textId = "ID_AUTO_IN_0";
         try
         {
            __id270_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id270__Tutorial_InGame_Screen_Layer6_3() : *
      {
         try
         {
            __id270_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id270_.textFieldName = "AUTO_3";
         __id270_.textId = "ID_AUTO_ONCE_1";
         try
         {
            __id270_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

