package BC_Interfaces_fla
{
   import adobe.utils.*;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4362")]
   public dynamic class playerStats_1106 extends MovieClip
   {
      
      public var castTimeValue:TextField;
      
      public var __id143_:MultilingualTextFieldFinder1;
      
      public var __id142_:MultilingualTextFieldFinder1;
      
      public var AttackView:MovieClip;
      
      public var DefenceView:MovieClip;
      
      public var reloadTxt:TextField;
      
      public function playerStats_1106()
      {
         super();
         __setProp___id142__playerStats_Layer1_0();
         __setProp___id143__playerStats_Layer1_0();
      }
      
      internal function __setProp___id142__playerStats_Layer1_0() : *
      {
         try
         {
            __id142_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id142_.textFieldName = "reloadTxt";
         __id142_.textId = "";
         try
         {
            __id142_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id143__playerStats_Layer1_0() : *
      {
         try
         {
            __id143_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id143_.textFieldName = "castTimeValue";
         __id143_.textId = "";
         try
         {
            __id143_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

