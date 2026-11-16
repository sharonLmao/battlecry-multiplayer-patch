package com.lachhhEngine.games.factory
{
   import com.lachhhEngine.games.meta.MetaObject;
   import flash.utils.getQualifiedClassName;
   
   public class ObjectFactory
   {
      
      private var _dict:Array;
      
      public function ObjectFactory()
      {
         super();
         this._dict = new Array();
      }
      
      final public function CreateFactoryObjectInstance(metaObject:MetaObject) : FactoryObject
      {
         var i:int = metaObject.instanceType;
         if(this._dict[i] == null)
         {
            throw new Error("Invalid ID");
         }
         var factoryObjectClass:Class = this._dict[i];
         return new factoryObjectClass();
      }
      
      final public function GetClassAt(i:int) : Class
      {
         return this._dict[i];
      }
      
      final public function PushClassLink(pClass:Class) : int
      {
         this._dict.push(pClass);
         return this._dict.length - 1;
      }
      
      final public function get nbClass() : int
      {
         return this._dict.length;
      }
      
      final public function FindIdByString(className:String) : int
      {
         var theClass:Class = null;
         var exportedClassName:String = null;
         var importedClassName:String = null;
         for(var i:int = 0; i < this._dict.length; i++)
         {
            theClass = this._dict[i];
            exportedClassName = getQualifiedClassName(theClass).split("::").join(".");
            importedClassName = exportedClassName.split(".imported.").join(".exported.");
            if(exportedClassName == className)
            {
               return i;
            }
            if(importedClassName == className)
            {
               return i;
            }
         }
         return -1;
      }
      
      final public function ReplaceClassLinkDEBUG(pClass:Class, i:int) : void
      {
         if(this._dict[i] == null)
         {
            throw new Error("Class at " + i + "is null. Can\'t replace");
         }
         this._dict[i] = pClass;
      }
   }
}

