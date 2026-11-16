package BC_Interfaces_fla
{
   import adobe.utils.*;
   import com.battlecry.exported.BTN_CONSUME;
   import com.battlecry.exported.BTN_CRAFTITEM;
   import com.battlecry.exported.BTN_GOLDARROWDOWN;
   import com.battlecry.exported.BTN_GOLDARROWUP;
   import com.battlecry.exported.EQUIPEMENTVIEWSQUARE;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2702")]
   public dynamic class CraftingView_536 extends MovieClip
   {
      
      public var unitQuantityTxt:TextField;
      
      public var btn_ArrowUp:BTN_GOLDARROWUP;
      
      public var AUTO_555:TextField;
      
      public var btn_ArrowDown:BTN_GOLDARROWDOWN;
      
      public var craftMeter:MovieClip;
      
      public var __id297_:MultilingualTextFieldFinder1;
      
      public var clearScare:MovieClip;
      
      public var equipementView:EQUIPEMENTVIEWSQUARE;
      
      public var btn_consume:BTN_CONSUME;
      
      public var AUTO_1:TextField;
      
      public var btn_craftItem:BTN_CRAFTITEM;
      
      public function CraftingView_536()
      {
         super();
         __setProp___id297__CraftingView_Layer1_0();
      }
      
      internal function __setProp___id297__CraftingView_Layer1_0() : *
      {
         try
         {
            __id297_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id297_.textFieldName = "AUTO_555";
         __id297_.textId = "ID_CRAFTING";
         try
         {
            __id297_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

