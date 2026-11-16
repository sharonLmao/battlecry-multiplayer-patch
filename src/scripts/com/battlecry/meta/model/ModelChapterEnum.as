package com.battlecry.meta.model
{
   import com.battlecry.multilingual.BC_TextFactory;
   
   public class ModelChapterEnum
   {
      
      private static var _id:int = 0;
      
      public static var CHAPTER_NULL:ModelChapter = new ModelChapter(-1,-1,-1);
      
      public static var ALL:Vector.<ModelChapter> = new Vector.<ModelChapter>();
      
      public static var CHAPTER1:ModelChapter = CreateModelChapter(_id++,BC_TextFactory.ID_CHAPTER1_NAME,1);
      
      public static var CHAPTER2:ModelChapter = CreateModelChapter(_id++,BC_TextFactory.ID_CHAPTER2_NAME,2);
      
      public static var CHAPTER3:ModelChapter = CreateModelChapter(_id++,BC_TextFactory.ID_CHAPTER3_NAME,3);
      
      public function ModelChapterEnum()
      {
         super();
      }
      
      private static function CreateModelChapter(id:int, nameID:int, act:int) : ModelChapter
      {
         var m:ModelChapter = new ModelChapter(id,nameID,act);
         ALL.push(m);
         return m;
      }
      
      public static function Init() : void
      {
      }
      
      public static function GetFromId(id:int) : ModelChapter
      {
         for(var i:int = 0; i < ALL.length; i++)
         {
            if(id == ALL[i].id)
            {
               return ALL[i];
            }
         }
         return CHAPTER_NULL;
      }
   }
}

