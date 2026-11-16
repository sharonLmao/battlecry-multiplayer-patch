package BC_Interfaces_fla
{
   import adobe.utils.*;
   import com.battlecry.exported.BTN_CANCEL;
   import com.battlecry.exported.BTN_DONE;
   import com.battlecry.exported.BTN_GOLDARROWDOWN;
   import com.battlecry.exported.BTN_GOLDARROWUP;
   import com.battlecry.exported.INVENTORYVIEWSQUARE2;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1110")]
   public dynamic class contentnbrUnit_1201 extends MovieClip
   {
      
      public var btn_ArrowUp:BTN_GOLDARROWUP;
      
      public var __id56_:MultilingualTextFieldFinder1;
      
      public var btn_ArrowDown:BTN_GOLDARROWDOWN;
      
      public var __id60_:MultilingualTextFieldFinder1;
      
      public var Unit0:INVENTORYVIEWSQUARE2;
      
      public var __id64_:MultilingualTextFieldFinder1;
      
      public var btn_Back:BTN_CANCEL;
      
      public var AUTO_0:TextField;
      
      public var AUTO_1:TextField;
      
      public var AUTO_2:TextField;
      
      public var AUTO_3:TextField;
      
      public var AUTO_4:TextField;
      
      public var AUTO_5:TextField;
      
      public var AUTO_6:TextField;
      
      public var AUTO_7:TextField;
      
      public var __id61_:MultilingualTextFieldFinder1;
      
      public var __id65_:MultilingualTextFieldFinder1;
      
      public var __id57_:MultilingualTextFieldFinder1;
      
      public var btn_Done:BTN_DONE;
      
      public var PlayerEquipementView:MovieClip;
      
      public var unitQuantityTxt:TextField;
      
      public var unitNameTxt:TextField;
      
      public var __id58_:MultilingualTextFieldFinder1;
      
      public var __id62_:MultilingualTextFieldFinder1;
      
      public var __id59_:MultilingualTextFieldFinder1;
      
      public var __id63_:MultilingualTextFieldFinder1;
      
      public function contentnbrUnit_1201()
      {
         super();
         __setProp___id56__contentnbrUnit_Layer1_0();
         __setProp___id57__contentnbrUnit_Layer1_0();
         __setProp___id58__contentnbrUnit_Layer1_0();
         __setProp___id59__contentnbrUnit_Layer1_0();
         __setProp___id60__contentnbrUnit_Layer1_0();
         __setProp___id61__contentnbrUnit_Layer1_0();
         __setProp___id62__contentnbrUnit_Layer1_0();
         __setProp___id63__contentnbrUnit_Layer1_0();
         __setProp___id64__contentnbrUnit_Layer1_0();
         __setProp___id65__contentnbrUnit_Layer1_0();
      }
      
      internal function __setProp___id60__contentnbrUnit_Layer1_0() : *
      {
         try
         {
            __id60_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id60_.textFieldName = "AUTO_4";
         __id60_.textId = "ID_AUTO_SPECIAL_0";
         try
         {
            __id60_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id57__contentnbrUnit_Layer1_0() : *
      {
         try
         {
            __id57_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id57_.textFieldName = "AUTO_1";
         __id57_.textId = "ID_AUTO_SHIELD_0";
         try
         {
            __id57_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id56__contentnbrUnit_Layer1_0() : *
      {
         try
         {
            __id56_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id56_.textFieldName = "AUTO_0";
         __id56_.textId = "ID_AUTO_AMOUNT_0";
         try
         {
            __id56_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id64__contentnbrUnit_Layer1_0() : *
      {
         try
         {
            __id64_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id64_.textFieldName = "AUTO_7";
         __id64_.textId = "ID_AUTO_HOW_0";
         try
         {
            __id64_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id61__contentnbrUnit_Layer1_0() : *
      {
         try
         {
            __id61_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id61_.textFieldName = "AUTO_5";
         __id61_.textId = "ID_AUTO_WEAPON_0";
         try
         {
            __id61_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id65__contentnbrUnit_Layer1_0() : *
      {
         try
         {
            __id65_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id65_.textFieldName = "unitQuantityTxt";
         __id65_.textId = "";
         try
         {
            __id65_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id58__contentnbrUnit_Layer1_0() : *
      {
         try
         {
            __id58_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id58_.textFieldName = "AUTO_2";
         __id58_.textId = "ID_AUTO_ARMOR_0";
         try
         {
            __id58_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id62__contentnbrUnit_Layer1_0() : *
      {
         try
         {
            __id62_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id62_.textFieldName = "AUTO_6";
         __id62_.textId = "ID_AUTO_UNIT_0";
         try
         {
            __id62_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id59__contentnbrUnit_Layer1_0() : *
      {
         try
         {
            __id59_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id59_.textFieldName = "AUTO_3";
         __id59_.textId = "ID_AUTO_CREATURE_0";
         try
         {
            __id59_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id63__contentnbrUnit_Layer1_0() : *
      {
         try
         {
            __id63_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id63_.textFieldName = "unitNameTxt";
         __id63_.textId = "";
         try
         {
            __id63_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

