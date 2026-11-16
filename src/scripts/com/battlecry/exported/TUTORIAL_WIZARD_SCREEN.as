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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3661")]
   public dynamic class TUTORIAL_WIZARD_SCREEN extends Animation
   {
      
      public var __id265_:MultilingualTextFieldFinder1;
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public function TUTORIAL_WIZARD_SCREEN()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      internal function frame1() : *
      {
         if(__setPropDict[__id265_] == undefined || int(__setPropDict[__id265_]) != 1)
         {
            __setPropDict[__id265_] = 1;
            __setProp___id265__Tutorial_Wizard_Screen_Layer7_0();
         }
      }
      
      internal function frame2() : *
      {
         if(__setPropDict[__id265_] == undefined || int(__setPropDict[__id265_]) != 2)
         {
            __setPropDict[__id265_] = 2;
            __setProp___id265__Tutorial_Wizard_Screen_Layer7_1();
         }
      }
      
      internal function __setProp___id265__Tutorial_Wizard_Screen_Layer7_0() : *
      {
         try
         {
            __id265_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id265_.textFieldName = "AUTO_0";
         __id265_.textId = "ID_AUTO_ONE_0";
         try
         {
            __id265_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id265__Tutorial_Wizard_Screen_Layer7_1() : *
      {
         try
         {
            __id265_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id265_.textFieldName = "AUTO_4";
         __id265_.textId = "ID_AUTO_LIKE_1";
         try
         {
            __id265_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

