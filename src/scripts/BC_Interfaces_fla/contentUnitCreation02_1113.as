package BC_Interfaces_fla
{
   import adobe.utils.*;
   import com.battlecry.exported.BTN_FILTER_ALL;
   import com.battlecry.exported.BTN_FILTER_ARMORS;
   import com.battlecry.exported.BTN_FILTER_SHIELDS;
   import com.battlecry.exported.BTN_FILTER_SPECIALS;
   import com.battlecry.exported.BTN_FILTER_WEAPONS;
   import com.battlecry.exported.BTN_LANGUAGEARROW;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4390")]
   public dynamic class contentUnitCreation02_1113 extends MovieClip
   {
      
      public var btn_UnitCreationSpecials:BTN_FILTER_SPECIALS;
      
      public var btn_NextRarity:BTN_LANGUAGEARROW;
      
      public var btn_UnitCreationShields:BTN_FILTER_SHIELDS;
      
      public var rarityTxt:TextField;
      
      public var ItemInventoryView:MovieClip;
      
      public var btn_PrevRarity:BTN_LANGUAGEARROW;
      
      public var btn_UnitCreationWeapons:BTN_FILTER_WEAPONS;
      
      public var CreatureInventoryView:MovieClip;
      
      public var __id134_:MultilingualTextFieldFinder1;
      
      public var btn_UnitCreationArmors:BTN_FILTER_ARMORS;
      
      public var btn_UnitCreationAll:BTN_FILTER_ALL;
      
      public function contentUnitCreation02_1113()
      {
         super();
         __setProp___id134__contentUnitCreation02_Layer8_0();
      }
      
      internal function __setProp___id134__contentUnitCreation02_Layer8_0() : *
      {
         try
         {
            __id134_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id134_.textFieldName = "rarityTxt";
         __id134_.textId = "";
         try
         {
            __id134_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

