package com.lachhhEngine.interfaces.forms
{
   import com.lachhhEngine.utils.Utils;
   
   public class ButtonSelectGroup
   {
      
      private var _selectedButton:ButtonSelect;
      
      private var _btns:Array;
      
      public function ButtonSelectGroup()
      {
         super();
         this.Init();
      }
      
      public function Destroy() : void
      {
         var b:ButtonSelect = null;
         while(this._btns.length > 0)
         {
            b = this._btns.shift();
            b.Destroy();
         }
         this._btns = null;
      }
      
      public function Deselect() : void
      {
         for(var i:int = 0; i < this._btns.length; i++)
         {
            ButtonSelect(this._btns[i]).Deselect();
         }
         this._selectedButton = null;
      }
      
      public function get length() : int
      {
         return this._btns.length;
      }
      
      public function SelectPrev() : void
      {
         if(this._selectedButton == null)
         {
            return;
         }
         var i:int = this.GetButtonIndex(this._selectedButton) - 1;
         if(i < 0)
         {
            i = int(this._btns.length - 1);
         }
         this.SelectButton(this._btns[i]);
      }
      
      public function GetButton(i:int) : ButtonSelect
      {
         if(i < 0 || i >= this._btns.length)
         {
            throw new Error("index error : " + i);
         }
         return this._btns[i];
      }
      
      public function SelectButtonFromIndex(i:int) : void
      {
         this.SelectButton(this.GetButton(i));
      }
      
      public function GetButtonIndex(b:ButtonSelect) : int
      {
         for(var i:int = 0; i < this._btns.length; i++)
         {
            if(this._btns[i] == b)
            {
               return i;
            }
         }
         return -1;
      }
      
      public function Clear() : void
      {
         this.RemoveAllButton();
      }
      
      public function SelectButton(b:ButtonSelect) : void
      {
         if(!this.Contains(b))
         {
            return;
         }
         if(this._selectedButton != null)
         {
            this._selectedButton.Deselect();
         }
         this._selectedButton = b;
         this._selectedButton.Select();
      }
      
      public function RemoveAllButton() : void
      {
         Utils.ClearArray(this._btns);
      }
      
      private function Init() : void
      {
         this._btns = new Array();
      }
      
      public function get selectedButton() : ButtonSelect
      {
         return this._selectedButton;
      }
      
      public function RemoveButton(b:ButtonSelect) : void
      {
         Utils.RemoveFromArray(this._btns,b);
      }
      
      public function AddButton(b:ButtonSelect) : void
      {
         Utils.AddInArrayIfNotIn(this._btns,b);
      }
      
      public function SelectNext() : void
      {
         if(this._selectedButton == null)
         {
            return;
         }
         var i:int = this.GetButtonIndex(this._selectedButton) + 1;
         if(i >= this._btns.length)
         {
            i = 0;
         }
         this.SelectButton(this._btns[(this.GetButtonIndex(this._selectedButton) + 1) % this._btns.length]);
      }
      
      public function Contains(b:ButtonSelect) : Boolean
      {
         return Utils.IsInArray(this._btns,b);
      }
   }
}

