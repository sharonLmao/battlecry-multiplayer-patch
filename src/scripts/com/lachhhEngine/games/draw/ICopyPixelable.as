package com.lachhhEngine.games.draw
{
   import flash.display.DisplayObject;
   import flash.display.IBitmapDrawable;
   
   public interface ICopyPixelable extends IBitmapDrawable
   {
      
      function CreateCopypixelableBmpData() : CopypixelableBmpData;
      
      function GetTransformId() : String;
      
      function get displayObject() : DisplayObject;
   }
}

