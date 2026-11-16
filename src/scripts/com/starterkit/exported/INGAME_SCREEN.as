package com.starterkit.exported
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3233")]
   public dynamic class INGAME_SCREEN extends Animation
   {
      
      public var __id427_:MultilingualTextFieldFinder1;
      
      public var __id426_:MultilingualTextFieldFinder1;
      
      public function INGAME_SCREEN()
      {
         super();
         __setProp___id426__Ingame_Screen_Layer6_0();
         __setProp___id427__Ingame_Screen_Layer6_0();
      }
      
      internal function __setProp___id426__Ingame_Screen_Layer6_0() : *
      {
         try
         {
            __id426_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id426_.textFieldName = "AUTO_0";
         __id426_.textId = "ID_AUTO_SPEED_0";
         try
         {
            __id426_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id427__Ingame_Screen_Layer6_0() : *
      {
         try
         {
            __id427_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id427_.textFieldName = "gameTimer";
         __id427_.textId = "";
         try
         {
            __id427_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

