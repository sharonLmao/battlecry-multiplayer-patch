package com.lachhhEngine.games.debug
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.utils.Utils;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class DebugTree implements IDebugTreeChild
   {
      
      private var _parent:DebugTree;
      
      private var _txtContainer:MovieClip;
      
      private var _visual:MovieClip;
      
      private var _name:String;
      
      private var _updateCallBack:Callback;
      
      private var _txt:TextField;
      
      private var _childs:Array;
      
      private var _isOpen:Boolean = false;
      
      public function DebugTree()
      {
         super();
         this._childs = new Array();
         this._txt = new TextField();
         this._txt.textColor = 16777215;
         this._txt.x = 20;
         this._txt.selectable = false;
         this._txt.autoSize = TextFieldAutoSize.LEFT;
         this._txtContainer = new MovieClip();
         this._txtContainer.addChild(this._txt);
         this._txtContainer.buttonMode = true;
         this._txtContainer.useHandCursor = true;
         this._visual = new MovieClip();
         this._visual.addChild(this._txtContainer);
         this.DrawSwitch();
         this._txtContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onClick,false,0,true);
      }
      
      public function get visual() : DisplayObject
      {
         return this._visual;
      }
      
      public function get isOpen() : Boolean
      {
         return this._isOpen;
      }
      
      public function get parent() : DebugTree
      {
         return this._parent;
      }
      
      private function RecurRender() : void
      {
         this.DrawSwitch();
         this.RenderChildren();
         if(this.parent != null)
         {
            this.parent.RecurRender();
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function GetChildHeight() : int
      {
         var child:DebugTree = null;
         if(!this._isOpen)
         {
            return 15;
         }
         var y:int = 15;
         for(var i:int = 0; i < this._childs.length; i++)
         {
            child = this._childs[i];
            if(child.isOpen)
            {
               y += child.GetChildHeight();
            }
            else
            {
               y += 15;
            }
         }
         return y;
      }
      
      public function get updateCallBack() : Callback
      {
         return this._updateCallBack;
      }
      
      private function RenderChildren() : void
      {
         var i:int = 0;
         var child:DebugTree = null;
         var y:int = 0;
         if(this._isOpen)
         {
            y = 15;
            for(i = 0; i < this._childs.length; i++)
            {
               child = this._childs[i];
               child.visual.visible = true;
               child.visual.x = 15;
               child.visual.y = y;
               y += child.GetChildHeight();
            }
         }
         else
         {
            for(i = 0; i < this._childs.length; i++)
            {
               child = this._childs[i];
               child.visual.visible = false;
            }
         }
      }
      
      public function set name(name:String) : void
      {
         this._name = name;
         this._txt.text = name;
      }
      
      public function RemoveChild(child:DebugTree) : void
      {
         if(!Utils.IsInArray(this._childs,child))
         {
            return;
         }
         Utils.RemoveFromArray(this._childs,child);
         this._visual.removeChild(child.visual);
         child.parent = null;
         this.RecurRender();
      }
      
      public function GetChildAt(i:int) : DebugTree
      {
         return this._childs[i];
      }
      
      public function AddChild(child:DebugTree) : void
      {
         if(Utils.IsInArray(this._childs,child))
         {
            return;
         }
         this._childs.push(child);
         this._visual.addChild(child.visual);
         child.parent = this;
         this.RecurRender();
      }
      
      public function set updateCallBack(updateCallBack:Callback) : void
      {
         this._updateCallBack = updateCallBack;
      }
      
      public function Destroy() : void
      {
         this._txtContainer.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
      }
      
      public function set parent(parent:DebugTree) : void
      {
         this._parent = parent;
      }
      
      public function Close() : void
      {
         this._isOpen = false;
         this.DrawSwitch();
         this.RecurRender();
      }
      
      private function onClick(e:MouseEvent) : void
      {
         if(this._isOpen)
         {
            this.Close();
         }
         else
         {
            this.Open();
         }
      }
      
      public function AddChildAt(child:DebugTree, i:int) : void
      {
         if(Utils.IsInArray(this._childs,child))
         {
            return;
         }
         this._childs.splice(i,0,child);
         this._visual.addChild(child.visual);
         child.parent = this;
         this.RecurRender();
      }
      
      public function Update(context:Game) : void
      {
         var child:DebugTree = null;
         for(var i:int = 0; i < this._childs.length; i++)
         {
            child = this._childs[i];
            child.Update(context);
         }
         if(this._updateCallBack != null)
         {
            this._updateCallBack.DoCallback();
         }
      }
      
      private function DrawSwitch() : void
      {
         this._visual.graphics.clear();
         if(this._childs.length > 0)
         {
            if(this._isOpen)
            {
               this._visual.graphics.lineStyle(2,11184895);
               this._visual.graphics.moveTo(5,10);
               this._visual.graphics.lineTo(15,10);
            }
            else
            {
               this._visual.graphics.beginFill(11184895);
               this._visual.graphics.drawCircle(10,10,5);
               this._visual.graphics.endFill();
            }
         }
      }
      
      public function Open() : void
      {
         this._isOpen = true;
         this.DrawSwitch();
         this.RecurRender();
      }
      
      public function get height() : Number
      {
         return this._isOpen ? this._childs.length * 15 + 15 : 15;
      }
      
      public function get numChild() : int
      {
         return this._childs.length;
      }
      
      public function RemoveAllChild() : void
      {
         while(this._childs.length > 0)
         {
            this.RemoveChild(this._childs[0]);
         }
      }
   }
}

