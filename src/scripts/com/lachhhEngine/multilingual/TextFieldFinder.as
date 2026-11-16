package com.lachhhEngine.multilingual
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class TextFieldFinder extends MovieClip
   {
      
      private static var _onStageInstances:Array = new Array();
      
      private var _textId:String = "";
      
      private var _numSearch:int = 0;
      
      private var _defaultRotation:Number = -999;
      
      private var _textSize:int = -1;
      
      private var _defaultFont:TextFormat = null;
      
      private var _defaultScaleX:Number = -999;
      
      private var _defaultScaleY:Number = -999;
      
      private var _textFieldName:String;
      
      public function TextFieldFinder()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAdded,false,1,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemove,false,0,true);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown,false,0,true);
         addEventListener(Event.EXIT_FRAME,this.onExitFrame,false,0,true);
         visible = false;
      }
      
      public static function Update() : void
      {
         var t:TextFieldFinder = null;
         for(var i:int = 0; i < _onStageInstances.length; i++)
         {
            t = _onStageInstances[i];
            t.UpdateText();
         }
      }
      
      public static function GetFinder(tf:TextField) : TextFieldFinder
      {
         var t:TextFieldFinder = null;
         for(var i:int = 0; i < _onStageInstances.length; i++)
         {
            t = _onStageInstances[i];
            if(tf == t.textField)
            {
               return t;
            }
         }
         return null;
      }
      
      private function onRemove(e:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemove);
         addEventListener(Event.ADDED_TO_STAGE,this.onAdded,false,1,true);
         for(var i:int = 0; i < _onStageInstances.length; i++)
         {
            if(_onStageInstances[i] == this)
            {
               _onStageInstances.splice(i,1);
               return;
            }
         }
      }
      
      private function onMouseDown(event:Event) : void
      {
         var breakPoint:int = 0;
         breakPoint = breakPoint;
         if(this.textField != null)
         {
            this.SetText(this.textField.text);
         }
      }
      
      public function get textField() : TextField
      {
         if(this._textFieldName == null || parent == null)
         {
            return null;
         }
         return TextField(parent.getChildByName(this._textFieldName));
      }
      
      private function onExitFrame(event:Event) : void
      {
         if(this.textField != null)
         {
            removeEventListener(Event.EXIT_FRAME,this.onExitFrame);
         }
         else
         {
            this.AutoSearchTf();
            ++this._numSearch;
            if(this._numSearch >= 2)
            {
               removeEventListener(Event.EXIT_FRAME,this.onExitFrame);
            }
         }
      }
      
      public function set textFieldName(text:String) : void
      {
         this._textFieldName = text;
         this.InitTextValues();
      }
      
      private function IsOnlyComponentInParent() : Boolean
      {
         var c:DisplayObject = null;
         if(parent == null)
         {
            return false;
         }
         for(var i:int = 0; i < parent.numChildren; i++)
         {
            c = parent.getChildAt(i);
            if(c is TextFieldFinder && c != this)
            {
               return false;
            }
         }
         return true;
      }
      
      private function GetAutoTextFieldInParent() : TextField
      {
         var t:TextField = null;
         if(parent == null)
         {
            return null;
         }
         for(var i:int = 0; i < parent.numChildren; i++)
         {
            t = parent.getChildAt(i) as TextField;
            if(t != null && t.name.indexOf("AUTO_") != -1)
            {
               return t;
            }
         }
         return null;
      }
      
      private function GetRotationTotal(d:DisplayObject) : Number
      {
         var crntDisplay:DisplayObject = d;
         var rot:Number = 0;
         while(crntDisplay != null)
         {
            rot += crntDisplay.rotation;
            crntDisplay = crntDisplay.parent;
         }
         return rot;
      }
      
      private function onAdded(e:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAdded);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemove,false,0,true);
         this.UpdateText();
         _onStageInstances.push(this);
      }
      
      public function get textFieldName() : String
      {
         return this._textFieldName;
      }
      
      public function get textId() : String
      {
         return this._textId;
      }
      
      private function AutoSearchTf() : void
      {
         var t:TextField = this.GetAutoTextFieldInParent();
         if(this.IsOnlyComponentInParent() && t != null)
         {
            this.textFieldName = t.name;
            this.UpdateText();
         }
      }
      
      private function UpdateText() : void
      {
         var id:int = 0;
         if(this._textId != "")
         {
            id = TextFactory.instance.GetId(this._textId);
            if(id != -1)
            {
               this.SetText(TextFactory.instance.GetMsg(id));
            }
            else
            {
               trace("WARNING : TextFieldFinder : Can\'t find id : " + this._textId);
            }
         }
         else if(this.textField != null)
         {
            id = TextFactory.instance.FindIdFromMessage(this.textField.text);
            if(id != -1)
            {
               this.SetText(TextFactory.instance.GetMsg(id));
            }
            else
            {
               this.SetText(this.textField.text);
            }
         }
      }
      
      public function SetText(s:String) : void
      {
         var newFont:LanguageFontReplace = null;
         var maxSize:int = 0;
         var size:int = 0;
         if(this.textField == null || s == null)
         {
            return;
         }
         var textFormat:TextFormat = this.textField.getTextFormat();
         if(this._textSize == -1)
         {
            this.InitTextValues();
         }
         textFormat.size = this._textSize;
         var theLanguage:Language = TextFactory.instance.language;
         if(this._defaultFont == null)
         {
            newFont = theLanguage.FindFontReplace(textFormat);
         }
         else
         {
            newFont = theLanguage.FindFontReplace(this._defaultFont);
         }
         if(theLanguage.useSystemFont || newFont != null)
         {
            if(this._defaultFont == null)
            {
               this._defaultFont = textFormat;
            }
            if(this._defaultRotation == -999)
            {
               this._defaultRotation = this.textField.rotation;
            }
            if(this._defaultScaleX == -999)
            {
               this._defaultScaleX = this.textField.scaleX;
            }
            if(this._defaultScaleY == -999)
            {
               this._defaultScaleY = this.textField.scaleY;
            }
            newFont = theLanguage.FindFontReplace(this._defaultFont);
            if(this.textId == "ID_AUTO_START_0")
            {
            }
            if(newFont)
            {
               textFormat.font = newFont.replaceBy;
               textFormat.bold = newFont.replaceByIsBold;
               textFormat.italic = newFont.replaceByIsItalic;
               this.textField.embedFonts = true;
            }
            else
            {
               textFormat.font = TextFactory.instance.language.fontUsed;
               this.textField.embedFonts = false;
               this.textField.rotation = -this.GetRotationTotal(this.textField);
               this.textField.scaleX = this.textField.scaleY = 1;
            }
         }
         else
         {
            if(this._defaultFont != null)
            {
               textFormat.font = this._defaultFont.font;
               textFormat.bold = this._defaultFont.bold;
               textFormat.italic = this._defaultFont.italic;
               this.textField.embedFonts = true;
               this.textField.gridFitType;
            }
            if(this._defaultRotation != -999)
            {
               this.textField.rotation = this._defaultRotation;
            }
            if(this._defaultScaleX != -999)
            {
               this.textField.scaleX = this._defaultScaleX;
            }
            if(this._defaultScaleY != -999)
            {
               this.textField.scaleY = this._defaultScaleY;
            }
         }
         if(TextFactory.instance.language == TextFactory.instance.LANGUAGE_AR)
         {
            if(textFormat.align == TextFormatAlign.RIGHT)
            {
               this.textField.x -= 5;
            }
            else
            {
               textFormat.align = TextFormatAlign.RIGHT;
               this.textField.x -= (this.textField.width - this.textField.textWidth) / 2;
            }
            this.textField.height += 15;
         }
         this.textField.text = s;
         this.textField.setTextFormat(textFormat);
         if(newFont)
         {
            maxSize = newFont.maxSize;
            size = Math.max(newFont.maxSize,this._textSize);
            textFormat.size = size;
            this.textField.setTextFormat(textFormat);
         }
         else
         {
            maxSize = TextFactory.instance.language.useSystemFont ? 10 : 8;
            size = this._textSize;
         }
         while((this.textField.maxScrollV > 1 || this.textField.maxScrollH > 1) && size > maxSize)
         {
            size--;
            textFormat.size = size;
            this.textField.setTextFormat(textFormat);
         }
         this.textField.height = Math.max(this.textField.textHeight,this.textField.height);
         this.textField.defaultTextFormat = textFormat;
      }
      
      public function set textId(textId:String) : void
      {
         this._textId = textId;
         this.UpdateText();
      }
      
      private function InitTextValues() : void
      {
         if(this.textField == null)
         {
            return;
         }
         var textFormat:TextFormat = this.textField.getTextFormat();
         this._textSize = int(textFormat.size);
      }
   }
}

