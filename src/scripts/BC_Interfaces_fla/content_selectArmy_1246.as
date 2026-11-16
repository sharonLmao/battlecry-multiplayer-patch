package BC_Interfaces_fla
{
   import adobe.utils.*;
   import com.battlecry.exported.BTN_ARMYSELECT;
   import com.battlecry.exported.BTN_CANCEL;
   import com.battlecry.exported.BTN_OK;
   import com.battlecry.exported.BTN_X;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4341")]
   public dynamic class content_selectArmy_1246 extends MovieClip
   {
      
      public var btn_army1:BTN_ARMYSELECT;
      
      public var btn_army2:BTN_ARMYSELECT;
      
      public var btn_army3:BTN_ARMYSELECT;
      
      public var btn_army4:BTN_ARMYSELECT;
      
      public var btn_Cancel:BTN_CANCEL;
      
      public var __id17_:MultilingualTextFieldFinder1;
      
      public var btn_OK:BTN_OK;
      
      public var AUTO_0:TextField;
      
      public var AUTO_1:TextField;
      
      public var btn_X:BTN_X;
      
      public var __id18_:MultilingualTextFieldFinder1;
      
      public function content_selectArmy_1246()
      {
         super();
         __setProp___id17__content_selectArmy_Layer1_0();
         __setProp___id18__content_selectArmy_Layer1_0();
      }
      
      internal function __setProp___id18__content_selectArmy_Layer1_0() : *
      {
         try
         {
            __id18_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id18_.textFieldName = "AUTO_1";
         __id18_.textId = "ID_AUTO_BEFORE_1";
         try
         {
            __id18_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id17__content_selectArmy_Layer1_0() : *
      {
         try
         {
            __id17_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id17_.textFieldName = "AUTO_0";
         __id17_.textId = "ID_AUTO_ARMY_0";
         try
         {
            __id17_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

