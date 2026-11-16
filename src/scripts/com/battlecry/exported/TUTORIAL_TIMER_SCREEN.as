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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2607")]
   public dynamic class TUTORIAL_TIMER_SCREEN extends Animation
   {
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public var __id246_:MultilingualTextFieldFinder1;
      
      public function TUTORIAL_TIMER_SCREEN()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      internal function frame1() : *
      {
         if(__setPropDict[__id246_] == undefined || int(__setPropDict[__id246_]) != 1)
         {
            __setPropDict[__id246_] = 1;
            __setProp___id246__Tutorial_Timer_Screen_Layer7_0();
         }
      }
      
      internal function frame2() : *
      {
         if(__setPropDict[__id246_] == undefined || int(__setPropDict[__id246_]) != 2)
         {
            __setPropDict[__id246_] = 2;
            __setProp___id246__Tutorial_Timer_Screen_Layer7_1();
         }
      }
      
      internal function __setProp___id246__Tutorial_Timer_Screen_Layer7_0() : *
      {
         try
         {
            __id246_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id246_.textFieldName = "AUTO_0";
         __id246_.textId = "ID_AUTO_SIR__2";
         try
         {
            __id246_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id246__Tutorial_Timer_Screen_Layer7_1() : *
      {
         try
         {
            __id246_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id246_.textFieldName = "AUTO_3";
         __id246_.textId = "ID_AUTO_THESE_0";
         try
         {
            __id246_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

