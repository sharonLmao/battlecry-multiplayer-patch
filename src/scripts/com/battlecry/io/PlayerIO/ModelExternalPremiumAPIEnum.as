package com.battlecry.io.PlayerIO
{
   public class ModelExternalPremiumAPIEnum
   {
      
      private static var _id:int = 0;
      
      public static var ALL:Array = new Array();
      
      public static var NULL:ModelExternalPremiumAPI = new ModelExternalPremiumAPI(-1,"");
      
      public static var GAMERSAFE:ModelExternalPremiumAPI = Create(_id++,"GS_");
      
      public static var KONGREGATE:ModelExternalPremiumAPI = Create(_id++,"KG_");
      
      public static var ARMORGAMES:ModelExternalPremiumAPI = Create(_id++,"AG_");
      
      public function ModelExternalPremiumAPIEnum()
      {
         super();
      }
      
      public static function GetFromId(id:int) : ModelExternalPremiumAPI
      {
         var g:ModelExternalPremiumAPI = null;
         for(var i:int = 0; i < ALL.length; i++)
         {
            g = ALL[i];
            if(id == g.id)
            {
               return g;
            }
         }
         return NULL;
      }
      
      public static function RemovePlatFormPrefixFromString(str:String) : String
      {
         var modelExternal:ModelExternalPremiumAPI = null;
         for(var i:int = 0; i < ModelExternalPremiumAPIEnum.ALL.length; i++)
         {
            modelExternal = ModelExternalPremiumAPIEnum.GetFromId(i);
            str = RemovePrefix(str,modelExternal.prefixId);
         }
         return str;
      }
      
      public static function Create(id:int, prefixId:String) : ModelExternalPremiumAPI
      {
         var m:ModelExternalPremiumAPI = new ModelExternalPremiumAPI(id,prefixId);
         ALL.push(m);
         return m;
      }
      
      private static function RemovePrefix(strToManipulate:String, prefixToRemove:String) : String
      {
         var index:int = int(strToManipulate.indexOf(prefixToRemove));
         if(index == 0)
         {
            strToManipulate = strToManipulate.substr(prefixToRemove.length,strToManipulate.length - prefixToRemove.length);
         }
         return strToManipulate;
      }
   }
}

