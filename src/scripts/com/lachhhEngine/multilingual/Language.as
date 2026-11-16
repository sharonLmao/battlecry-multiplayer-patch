package com.lachhhEngine.multilingual
{
   import com.lachhhEngine.initializers.VersionInfo;
   import flash.text.TextFormat;
   
   public class Language
   {
      
      private var _locale:String;
      
      private var _fontUsed:String = "[DEFAULT]";
      
      private var _fullName:String;
      
      private var _fontReplace:Array = new Array();
      
      private var _texts:Array = new Array();
      
      private var _frame:int = -1;
      
      public function Language(locale:String, fullName:String, useFont:String = "[DEFAULT]")
      {
         super();
         this._locale = locale;
         this._fullName = fullName;
         this._fontUsed = useFont;
      }
      
      public function EncodeXML() : XML
      {
         var text:String = null;
         var nameOfVar:String = null;
         var xml:XML = <Language/>;
         xml.setName(this.locale);
         for(var i:int = 0; i < this._texts.length; i++)
         {
            if(this.HaveText(i))
            {
               text = this.GetText(i);
               nameOfVar = i + "~" + TextFactory.DEBUGGetNameOfVarForI(i);
               xml[nameOfVar] = text;
            }
         }
         return xml;
      }
      
      public function GetText(id:int) : String
      {
         if(this._texts[id] == null)
         {
            throw new Error("text not found: " + id);
         }
         return this._texts[id];
      }
      
      public function get useSystemFont() : Boolean
      {
         return this._fontUsed != "[DEFAULT]";
      }
      
      public function ExportInAS3() : String
      {
         var text:String = null;
         var nameOfVar:String = null;
         var part1:* = "LANGUAGE_" + this.locale.toUpperCase() + ".AddText(";
         var part2:String = ", \"";
         var part3:String = "\");\n";
         var result:String = "";
         for(var i:int = 0; i < this.nbTexts; i++)
         {
            if(this.HaveText(i))
            {
               text = this.GetText(i).split("\n").join("\\n").split("\"").join("\'");
               nameOfVar = TextFactory.DEBUGGetNameOfVarForI(i);
               result += part1 + nameOfVar + part2 + text + part3;
            }
         }
         return result;
      }
      
      public function get nbTexts() : int
      {
         return this._texts.length;
      }
      
      public function FindFontReplace(tf:TextFormat) : LanguageFontReplace
      {
         var l:LanguageFontReplace = null;
         for(var i:int = 0; i < this._fontReplace.length; i++)
         {
            l = this._fontReplace[i];
            if(l.IsEquals(tf))
            {
               return l;
            }
         }
         return null;
      }
      
      public function AddText(id:int, text:String) : void
      {
         if(this._texts[id] != null)
         {
            throw new Error("Unilingual Text Duplicate : " + text + "/" + this._texts[id]);
         }
         this._texts[id] = text;
      }
      
      public function set fontUsed(fontUsed:String) : void
      {
         this._fontUsed = fontUsed;
      }
      
      public function set frame(frame:int) : void
      {
         this._frame = frame;
      }
      
      public function DecodeFromXML(xml:XML) : void
      {
         var attName:String = null;
         var name:String = null;
         var value:String = null;
         var id:int = 0;
         var attNamesList:XMLList = xml.@*;
         for(var i:int = 0; i < attNamesList.length(); i++)
         {
            attName = attNamesList[i].name();
            name = attName.split("~")[1];
            value = String(xml.attribute(attName));
            id = TextFactory.instance.GetId(name);
            value = value.split("\\n").join("\n");
            value = value.split("\\r").join("\r");
            if(this._texts[id] == null)
            {
               this.AddText(id,value);
            }
            else
            {
               this.ReplaceText(id,value);
            }
         }
      }
      
      public function ReplaceText(id:int, text:String) : void
      {
         if(this._texts[id] == null)
         {
            throw new Error("No Text at: " + id);
         }
         this._texts[id] = text;
      }
      
      public function AddFontReplace(l:LanguageFontReplace) : void
      {
         this._fontReplace.push(l);
      }
      
      public function get fontReplace() : Array
      {
         return this._fontReplace;
      }
      
      public function GetTextWithSlashCode(id:int) : String
      {
         var text:String = this.GetText(id).split("\n").join("\\n").split("\"").join("\'");
         return text.split("\r").join("\\n");
      }
      
      public function get locale() : String
      {
         return this._locale;
      }
      
      public function FindIdFromText(s:String) : int
      {
         for(var i:int = 0; i < this._texts.length; i++)
         {
            if(this._texts[i] == s)
            {
               return i;
            }
         }
         return -1;
      }
      
      public function get fontUsed() : String
      {
         return this._fontUsed;
      }
      
      public function HaveText(i:int) : Boolean
      {
         return this._texts[i] != null;
      }
      
      public function get frame() : int
      {
         return this._frame;
      }
      
      public function Validate(nbText:int) : Array
      {
         var result:Array = new Array();
         for(var i:int = 0; i < nbText; i++)
         {
            if(this._texts[i] == null)
            {
               result.push(i);
            }
         }
         return result;
      }
      
      public function get fullName() : String
      {
         return this._fullName;
      }
      
      public function ExportInXML() : String
      {
         var text:String = null;
         var nameOfVar:String = null;
         var result:String = "<LANG" + "\n";
         for(var i:int = 0; i < this.nbTexts; i++)
         {
            if(this.HaveText(i))
            {
               text = this.GetText(i).split("\n").join("\\n").split("\"").join("\'");
               text = text.split("\r").join("\\n");
               nameOfVar = i + "~" + TextFactory.DEBUGGetNameOfVarForI(i);
               result += nameOfVar + "=\"" + text + "\"\n";
            }
         }
         return result + "/>";
      }
      
      public function get isAvailable() : Boolean
      {
         var locale:String = null;
         for(var i:int = 0; i < VersionInfo.languageAvailables.length; i++)
         {
            locale = VersionInfo.languageAvailables[i];
            if(locale.toLowerCase() == locale.toLowerCase())
            {
               return true;
            }
         }
         return false;
      }
   }
}

