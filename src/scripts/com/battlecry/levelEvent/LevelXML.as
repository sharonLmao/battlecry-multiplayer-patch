package com.battlecry.levelEvent
{
   public class LevelXML
   {
      
      public static var LEVEL_XML:XML = <Level levelEventId="com.battlecry.levelEvent.levelEvent1" Name="MK_Level" visualStaticBack="">
	  <startPos hero1="350~275" cameraPos="300~200~850" cameraBounds="0~800~0~600"/>
	  <Layer Name="LayerAction1" z="0" bDrawable="true" bActionLayer="true" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="0" yOffset="0" fxVisual="" enemyVisual="">
	    <Visual dynamicVisual=""/>
	    <EventSwitch/>
	  </Layer>
	</Level>;
      
      public function LevelXML()
      {
         super();
      }
   }
}

