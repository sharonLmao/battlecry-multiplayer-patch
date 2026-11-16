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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4678")]
   public dynamic class selectFriendArmy_1270 extends MovieClip
   {
      
      public var AUTO_0:TextField;
      
      public var AUTO_1:TextField;
      
      public var __id0_:MultilingualTextFieldFinder1;
      
      public var btn_friendArmy1:BTN_ARMYSELECT;
      
      public var btn_friendArmy3:BTN_ARMYSELECT;
      
      public var btn_friendArmy4:BTN_ARMYSELECT;
      
      public var btn_friendArmy2:BTN_ARMYSELECT;
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public function selectFriendArmy_1270()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4);
      }
      
      internal function frame1() : *
      {
         if(__setPropDict[__id0_] == undefined || int(__setPropDict[__id0_]) != 1)
         {
            __setPropDict[__id0_] = 1;
            __setProp___id0__selectFriendArmy_Layer3_0();
         }
      }
      
      internal function frame3() : *
      {
         if(__setPropDict[__id0_] == undefined || !(int(__setPropDict[__id0_]) >= 2 && int(__setPropDict[__id0_]) <= 4))
         {
            __setPropDict[__id0_] = currentFrame;
            __setProp___id0__selectFriendArmy_Layer3_1();
         }
      }
      
      internal function frame4() : *
      {
         if(__setPropDict[__id0_] == undefined || !(int(__setPropDict[__id0_]) >= 2 && int(__setPropDict[__id0_]) <= 4))
         {
            __setPropDict[__id0_] = currentFrame;
            __setProp___id0__selectFriendArmy_Layer3_1();
         }
      }
      
      internal function __setProp___id0__selectFriendArmy_Layer3_0() : *
      {
         try
         {
            __id0_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id0_.textFieldName = "AUTO_0";
         __id0_.textId = "ID_AUTO_YOUR_1";
         try
         {
            __id0_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id0__selectFriendArmy_Layer3_1() : *
      {
         try
         {
            __id0_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id0_.textFieldName = "AUTO_1";
         __id0_.textId = "ID_AUTO_SELECT_0";
         try
         {
            __id0_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame2() : *
      {
         if(__setPropDict[__id0_] == undefined || !(int(__setPropDict[__id0_]) >= 2 && int(__setPropDict[__id0_]) <= 4))
         {
            __setPropDict[__id0_] = currentFrame;
            __setProp___id0__selectFriendArmy_Layer3_1();
         }
      }
   }
}

