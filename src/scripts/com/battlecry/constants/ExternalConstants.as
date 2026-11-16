package com.battlecry.constants
{
   import com.battlecry.init.BC_VersionInfo;
   import com.lachhhEngine.io.LachhhXMLLoader;
   import com.lachhhEngine.io.XMLCallback;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class ExternalConstants
   {
      
      private var _shortClassName:String;
      
      private var _longClassName:String;
      
      public function ExternalConstants()
      {
         super();
         this._longClassName = getQualifiedClassName(this);
         this._shortClassName = this._longClassName.split("::")[1];
      }
      
      public function Init() : void
      {
         if(BC_VersionInfo.loadExternalConstant)
         {
            this.LoadExternalDefault();
         }
      }
      
      public function LoadExternal(path:String) : void
      {
         LachhhXMLLoader.LoadXML(path,new XMLCallback(this.LoadFromXML,this,null));
      }
      
      protected function GetValueAt(str:String, i:int) : int
      {
         if(str == null)
         {
            return -1;
         }
         return int(str.split(",")[i]);
      }
      
      public function get shortClassName() : String
      {
         return this._shortClassName;
      }
      
      public function LoadFromXML(xml:XML) : void
      {
         var name:String = null;
         var value:String = null;
         var attNamesList:XMLList = xml.@*;
         var thisClass:Class = Class(getDefinitionByName(this._longClassName));
         var traceResult:* = "CONSTANTS OF : " + this._longClassName + "\n";
         for(var i:int = 0; i < attNamesList.length(); i++)
         {
            name = attNamesList[i].name();
            value = String(xml.attribute(name));
            if(thisClass[name] == null)
            {
               throw new Error("Variable " + this._shortClassName + "." + name + " is not declared");
            }
            thisClass[name] = value;
            if(value.indexOf(",") != -1)
            {
               traceResult += "static public var " + name + ":String = \"" + value + "\";\n";
            }
            else
            {
               traceResult += "static public var " + name + ":Number = " + value + ";\n";
            }
         }
         traceResult += "\n\n";
         if(BC_VersionInfo.traceExternalConstant)
         {
            trace(traceResult);
         }
      }
      
      public function LoadExternalDefault() : void
      {
         this.LoadExternal("GameDesignHelper/" + this._shortClassName + ".xml");
      }
   }
}

