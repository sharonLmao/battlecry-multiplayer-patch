package com.battlecry.constants
{
   import com.battlecry.meta.model.ModelEquipement;
   import com.battlecry.meta.model.ModelStats;
   import flash.xml.XMLDocument;
   
   public class MiscConstants extends ExternalConstants
   {
      
      public static var _xDoc:XMLDocument;
      
      private static const _embedXML:Class = MiscConstants__embedXML;
      
      private static var _instance:MiscConstants = new MiscConstants();
      
      public static var TEAM1:int = 1;
      
      public static var TEAM2:int = 2;
      
      public static var ARMY1:String = "Armée Des Caca[A]1[A]832[A]1[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]0[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]9[S]9[S]9[S]9[S]9[S]9[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY2:String = "Armée Des Caca[A]1[A]832[A]1[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]0[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]9[S]9[S]9[S]9[S]9[S]9[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY3:String = "Armée Des Caca[A]1[A]832[A]1[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]0[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]9[S]9[S]9[S]9[S]9[S]9[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY4:String = "Armée Des Caca[A]1[A]832[A]1[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]0[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]9[S]9[S]9[S]9[S]9[S]9[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY5:String = "Armée Des Caca[A]1[A]832[A]1[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]0[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]9[S]9[S]9[S]9[S]9[S]9[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY6:String = "Armée Des Caca[A]1[A]832[A]1[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]0[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]9[S]9[S]9[S]9[S]9[S]9[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY7:String = "Armée Des Caca[A]1[A]832[A]1[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]0[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]9[S]9[S]9[S]9[S]9[S]9[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY8:String = "Armée Des Caca[A]1[A]832[A]1[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]0[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]9[S]9[S]9[S]9[S]9[S]9[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY9:String = "Armée Des Caca[A]1[A]832[A]1[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]0[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]9[S]9[S]9[S]9[S]9[S]9[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY10:String = "GROS MAGE SALE[A]1[A]601[A]5[A]23[U]0[GP]0[U]9[U]0[U]Unit15[U]0[U]1[U]9[M]21[PE]2[M]99[PE]-1[M]-1[PE]2[M]223[PE]1[M]255[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]6[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]10[U]0[GP]0[U]19[U]0[U]Unit10[U]5[U]5[U]0[M]25[PE]3[M]90[PE]-1[M]-1[PE]1[M]205[PE]1[M]228[A]14[U]0[GP]0[U]28[U]0[U]Unit14[U]7[U]7[U]0[M]24[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]19[U]0[GP]0[U]0[U]0[U]Unit19[U]0[U]24[U]86[M]0[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]19[S]19[S]19[S]19[S]19[S]19[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]19[S]19[S]19[S]19[S]19[S]19[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]19[S]19[S]19[S]19[S]19[S]19[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]19[S]19[S]19[S]19[S]19[S]19[S][A]5[S]0[S]0[S]-1[S]-1[S]23[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY11:String = "Armée Des Caca[A]1[A]832[A]1[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]0[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]9[S]9[S]9[S]9[S]9[S]9[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY12:String = "Armée Des Caca[A]1[A]832[A]1[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]0[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]9[S]9[S]9[S]9[S]9[S]9[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY13:String = "Armée Des Caca[A]1[A]832[A]1[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]0[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]9[S]9[S]9[S]9[S]9[S]9[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY14:String = "Angelic Squad[A]1[A]9[A]2[A]37[U]0[GP]0[U]1[U]0[U]Unit37[U]0[U]6[U]1[M]23[PE]0[M]92[PE]0[M]131[PE]0[M]207[PE]0[M]263[A]38[U]0[GP]0[U]18[U]0[U]Unit38[U]0[U]1[U]0[M]23[PE]0[M]62[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]1[S]12[S]0[S]-1[S]-1[S]38[S]-1[S]-1[S]-1[S]-2[S]-2[S]-2[S]-2[S]-2[S]-2[S]37[S]37[S]37[S]37[S]37[S]37[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var ARMY15:String = "Death Knights[A]1[A]24[A]2[A]9[U]0[GP]0[U]9[U]0[U]Unit9[U]6[U]6[U]110[M]0[PE]8[M]44[PE]-1[M]-1[PE]-1[M]-1[PE]-1[M]-1[A]10[U]0[GP]0[U]19[U]0[U]Unit10[U]1[U]5[U]0[M]25[PE]3[M]90[PE]-1[M]-1[PE]1[M]205[PE]1[M]228[A]1[S]12[S]2[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-2[S]-2[S]-2[S]-2[S]-1[S]-1[S]10[S]10[S]10[S]10[S]-1[S][A]2[S]9[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]3[S]6[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]4[S]3[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]5[S]0[S]0[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S]-1[S][A]";
      
      public static var GRIDCASE_EMPTY:int = 0;
      
      public static var GRIDCASE_OCCUPIED:int = 1;
      
      public function MiscConstants()
      {
         super();
      }
      
      public static function GetStats(modelStats:ModelStats, modelEquipement:ModelEquipement) : int
      {
         if(modelStats.id < 0 || modelEquipement.id < 0)
         {
            return 0;
         }
         return _xDoc.firstChild.childNodes[modelEquipement.id].childNodes[modelStats.type].childNodes[0];
      }
      
      public static function ReadData() : void
      {
         var xmlData:XML = _embedXML.data as XML;
         _xDoc = new XMLDocument();
         _xDoc.ignoreWhite = true;
         _xDoc.parseXML(xmlData.toXMLString());
      }
      
      public static function get instance() : MiscConstants
      {
         return _instance;
      }
      
      public static function GetCost(modelEquipement:ModelEquipement) : int
      {
         if(_xDoc == null)
         {
            return 0;
         }
         return _xDoc.firstChild.childNodes[modelEquipement.id].childNodes[0].childNodes[0];
      }
      
      public static function GetRange(modelEquipement:ModelEquipement) : int
      {
         if(_xDoc == null)
         {
            return 0;
         }
         return _xDoc.firstChild.childNodes[modelEquipement.id].childNodes[11].childNodes[0];
      }
      
      public static function GetDefence(modelEquipement:ModelEquipement) : int
      {
         if(_xDoc == null)
         {
            return 0;
         }
         return _xDoc.firstChild.childNodes[modelEquipement.id].childNodes[12].childNodes[0];
      }
      
      public static function GetValue(modelEquipement:ModelEquipement) : int
      {
         if(_xDoc == null)
         {
            return 0;
         }
         return _xDoc.firstChild.childNodes[modelEquipement.id].childNodes[23].childNodes[0];
      }
      
      public static function GetReloadTime(modelEquipement:ModelEquipement) : int
      {
         if(_xDoc == null)
         {
            return 0;
         }
         return _xDoc.firstChild.childNodes[modelEquipement.id].childNodes[25].childNodes[0];
      }
      
      public static function GetVisualFrame(modelEquipement:ModelEquipement) : int
      {
         if(_xDoc == null)
         {
            return 0;
         }
         return _xDoc.firstChild.childNodes[modelEquipement.id].childNodes[24].childNodes[0];
      }
   }
}

