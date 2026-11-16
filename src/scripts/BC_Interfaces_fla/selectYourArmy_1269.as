package BC_Interfaces_fla
{
   import adobe.utils.*;
   import com.battlecry.exported.BTN_ARMYSELECT;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4675")]
   public dynamic class selectYourArmy_1269 extends MovieClip
   {
      
      public var AUTO_1:TextField;
      
      public var btn_myArmy1:BTN_ARMYSELECT;
      
      public var btn_myArmy2:BTN_ARMYSELECT;
      
      public var btn_myArmy3:BTN_ARMYSELECT;
      
      public var btn_myArmy4:BTN_ARMYSELECT;
      
      public var __id1_:MultilingualTextFieldFinder1;
      
      public var AUTO_0:TextField;
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public function selectYourArmy_1269()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4);
      }
      
      internal function frame1() : *
      {
         if(__setPropDict[__id1_] == undefined || int(__setPropDict[__id1_]) != 1)
         {
            __setPropDict[__id1_] = 1;
            __setProp___id1__selectYourArmy_Layer1_0();
         }
      }
      
      internal function frame3() : *
      {
         if(__setPropDict[__id1_] == undefined || !(int(__setPropDict[__id1_]) >= 2 && int(__setPropDict[__id1_]) <= 4))
         {
            __setPropDict[__id1_] = currentFrame;
            __setProp___id1__selectYourArmy_Layer1_1();
         }
      }
      
      internal function frame2() : *
      {
         if(__setPropDict[__id1_] == undefined || !(int(__setPropDict[__id1_]) >= 2 && int(__setPropDict[__id1_]) <= 4))
         {
            __setPropDict[__id1_] = currentFrame;
            __setProp___id1__selectYourArmy_Layer1_1();
         }
      }
      
      internal function __setProp___id1__selectYourArmy_Layer1_0() : *
      {
         try
         {
            __id1_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id1_.textFieldName = "AUTO_0";
         __id1_.textId = "ID_AUTO_YOUR_2";
         try
         {
            __id1_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id1__selectYourArmy_Layer1_1() : *
      {
         try
         {
            __id1_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id1_.textFieldName = "AUTO_1";
         __id1_.textId = "ID_AUTO_SELECT_1";
         try
         {
            __id1_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame4() : *
      {
         if(__setPropDict[__id1_] == undefined || !(int(__setPropDict[__id1_]) >= 2 && int(__setPropDict[__id1_]) <= 4))
         {
            __setPropDict[__id1_] = currentFrame;
            __setProp___id1__selectYourArmy_Layer1_1();
         }
      }
   }
}

