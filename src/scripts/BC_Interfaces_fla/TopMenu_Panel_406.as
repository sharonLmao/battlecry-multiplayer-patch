package BC_Interfaces_fla
{
   import adobe.utils.*;
   import com.battlecry.exported.BTN_ARMY;
   import com.battlecry.exported.BTN_BATTLEFIELD;
   import com.battlecry.exported.BTN_BATTLEFIELDLOCK;
   import com.battlecry.exported.BTN_BOOSTERLOCK;
   import com.battlecry.exported.BTN_BOOSTERPACK;
   import com.battlecry.exported.BTN_CAMPAIGN;
   import com.battlecry.exported.BTN_COLLECTION;
   import com.battlecry.exported.BTN_COLLECTIONLOCKED;
   import com.battlecry.exported.BTN_FLAG;
   import com.battlecry.exported.BTN_FLAGLOCKED;
   import com.battlecry.exported.BTN_MOARMONEY;
   import com.battlecry.exported.BTN_OPTION;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2266")]
   public dynamic class TopMenu_Panel_406 extends MovieClip
   {
      
      public var btn_flagLock:BTN_FLAGLOCKED;
      
      public var btn_BoosterPack:BTN_BOOSTERPACK;
      
      public var __id350_:MultilingualTextFieldFinder1;
      
      public var moneyTxt:TextField;
      
      public var btn_campaign:BTN_CAMPAIGN;
      
      public var btn_BoosterLock:BTN_BOOSTERLOCK;
      
      public var flagGlow:MovieClip;
      
      public var btn_plus:BTN_MOARMONEY;
      
      public var btn_battlefield:BTN_BATTLEFIELD;
      
      public var btn_collection:BTN_COLLECTION;
      
      public var btn_Option:BTN_OPTION;
      
      public var btn_BattleFieldLock:BTN_BATTLEFIELDLOCK;
      
      public var btn_collectionLock:BTN_COLLECTIONLOCKED;
      
      public var battlefieldGlow:MovieClip;
      
      public var btn_flag:BTN_FLAG;
      
      public var btn_army:BTN_ARMY;
      
      public var boosterGlow:MovieClip;
      
      public function TopMenu_Panel_406()
      {
         super();
         __setProp___id350__TopMenu_Panel_Layer1_0();
      }
      
      internal function __setProp___id350__TopMenu_Panel_Layer1_0() : *
      {
         try
         {
            __id350_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id350_.textFieldName = "moneyTxt";
         __id350_.textId = "";
         try
         {
            __id350_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

