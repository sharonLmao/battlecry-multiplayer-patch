package BC_Interfaces_fla
{
   import adobe.utils.*;
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4251")]
   public dynamic class contentRewardCampain_1217 extends MovieClip
   {
      
      public var equipement3:EQUIPEMENTVIEWSQUARE;
      
      public var equipement4:EQUIPEMENTVIEWSQUARE;
      
      public var __id46_:MultilingualTextFieldFinder1;
      
      public var equipement1:EQUIPEMENTVIEWSQUARE;
      
      public var equipement5:EQUIPEMENTVIEWSQUARE;
      
      public var goldReward_Txt:TextField;
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public var packReward_Txt:TextField;
      
      public var equipement0:EQUIPEMENTVIEWSQUARE;
      
      public var equipement2:EQUIPEMENTVIEWSQUARE;
      
      public function contentRewardCampain_1217()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      internal function __setProp___id46__contentRewardCampain_Layer1_0() : *
      {
         try
         {
            __id46_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id46_.textFieldName = "goldReward_Txt";
         __id46_.textId = "";
         try
         {
            __id46_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id46__contentRewardCampain_Layer1_1() : *
      {
         try
         {
            __id46_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id46_.textFieldName = "packReward_Txt";
         __id46_.textId = "";
         try
         {
            __id46_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame1() : *
      {
         if(__setPropDict[__id46_] == undefined || int(__setPropDict[__id46_]) != 1)
         {
            __setPropDict[__id46_] = 1;
            __setProp___id46__contentRewardCampain_Layer1_0();
         }
      }
      
      internal function frame2() : *
      {
         if(__setPropDict[__id46_] == undefined || int(__setPropDict[__id46_]) != 2)
         {
            __setPropDict[__id46_] = 2;
            __setProp___id46__contentRewardCampain_Layer1_1();
         }
      }
   }
}

