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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2804")]
   public dynamic class TUTORIAL_INITIAL_SCREEN extends Animation
   {
      
      public var __id262_:MultilingualTextFieldFinder1;
      
      public var __id261_:MultilingualTextFieldFinder1;
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public function TUTORIAL_INITIAL_SCREEN()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4);
      }
      
      internal function frame1() : *
      {
         if(__setPropDict[__id261_] == undefined || int(__setPropDict[__id261_]) != 1)
         {
            __setPropDict[__id261_] = 1;
            __setProp___id261__Tutorial_Initial_Screen_Layer7_0();
         }
      }
      
      internal function frame2() : *
      {
         if(__setPropDict[__id261_] == undefined || int(__setPropDict[__id261_]) != 2)
         {
            __setPropDict[__id261_] = 2;
            __setProp___id261__Tutorial_Initial_Screen_Layer7_1();
         }
      }
      
      internal function __setProp___id261__Tutorial_Initial_Screen_Layer7_0() : *
      {
         try
         {
            __id261_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id261_.textFieldName = "AUTO_0";
         __id261_.textId = "ID_TUTO_INIT_PAGE_1";
         try
         {
            __id261_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id261__Tutorial_Initial_Screen_Layer7_1() : *
      {
         try
         {
            __id261_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id261_.textFieldName = "AUTO_7";
         __id261_.textId = "ID_TUTO_INIT_PAGE_2";
         try
         {
            __id261_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id262__Tutorial_Initial_Screen_Layer7_2() : *
      {
         try
         {
            __id262_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id262_.textFieldName = "AUTO_7";
         __id262_.textId = "ID_TUTO_INIT_PAGE_3";
         try
         {
            __id262_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id262__Tutorial_Initial_Screen_Layer7_3() : *
      {
         try
         {
            __id262_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id262_.textFieldName = "AUTO_8";
         __id262_.textId = "ID_TUTO_INIT_PAGE_4";
         try
         {
            __id262_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame4() : *
      {
         if(__setPropDict[__id262_] == undefined || int(__setPropDict[__id262_]) != 4)
         {
            __setPropDict[__id262_] = 4;
            __setProp___id262__Tutorial_Initial_Screen_Layer7_3();
         }
      }
      
      internal function frame3() : *
      {
         if(__setPropDict[__id262_] == undefined || int(__setPropDict[__id262_]) != 3)
         {
            __setPropDict[__id262_] = 3;
            __setProp___id262__Tutorial_Initial_Screen_Layer7_2();
         }
      }
   }
}

