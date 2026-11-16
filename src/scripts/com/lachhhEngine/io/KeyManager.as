package com.lachhhEngine.io
{
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.initializers.VersionInfo;
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.events.*;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class KeyManager
   {
      
      private static var _main:MainGame;
      
      private static var _stage:Stage;
      
      private static var tabOldState:Array = new Array();
      
      private static var tabState:Array = new Array(256);
      
      private static var oDefaultKey_1:Object = new Object();
      
      public static var oKeyMap_1:Object = new Object();
      
      public static var oKeyMap_2:Object = new Object();
      
      public static var oKeyMap_3:Object = new Object();
      
      public static var oKeyMap_4:Object = new Object();
      
      public static var m_Instance:KeyManager = null;
      
      private static var _isInit:Boolean = false;
      
      private static var _mouseMove:Point = new Point();
      
      private static var _mousePos:Point = new Point();
      
      private static var _mouseDown:Boolean = false;
      
      private static var _oldMouseDown:Boolean = false;
      
      public function KeyManager()
      {
         super();
      }
      
      private static function MouseDownHandler(evt:MouseEvent) : void
      {
         _mouseDown = true;
      }
      
      public static function IsKeyReleasedAtLeast(a:Array) : Boolean
      {
         var b:Boolean = false;
         var i:int = 0;
         while(i < a.length)
         {
            b ||= IsKeyReleased(a[i]);
            i++;
         }
         return b;
      }
      
      public static function IsKeyDownAtLeast(a:Array) : Boolean
      {
         var b:Boolean = false;
         var i:int = 0;
         while(i < a.length)
         {
            b ||= IsKeyDown(a[i]);
            i++;
         }
         return b;
      }
      
      public static function IsKeyPressedAtLeast(a:Array) : Boolean
      {
         var b:Boolean = false;
         var i:int = 0;
         while(i < a.length)
         {
            b ||= IsKeyPressed(a[i]);
            i++;
         }
         return b;
      }
      
      public static function IsDown(objState:Object) : Boolean
      {
         return objState.bState;
      }
      
      public static function GetMouseMove() : Point
      {
         return _mouseMove;
      }
      
      public static function IsKeyReleased(i:int) : Boolean
      {
         return Boolean(tabOldState[i]) && !tabState[i];
      }
      
      private static function Deactivate(e:Event) : void
      {
         var i:Object = null;
         var j:int = 0;
         for(i in oKeyMap_1)
         {
            oKeyMap_1[i].bState = false;
         }
         for(j = 0; j < 256; j++)
         {
            tabState[j] = false;
         }
         _mouseDown = false;
      }
      
      public static function IsAnyKeyReleased() : Boolean
      {
         for(var i:int = 0; i < tabState.length; i++)
         {
            if(IsKeyReleased(i))
            {
               return true;
            }
         }
         return false;
      }
      
      public static function IsAnyKeyDown() : Boolean
      {
         for(var i:int = 0; i < tabState.length; i++)
         {
            if(IsKeyDown(i))
            {
               return true;
            }
         }
         return false;
      }
      
      public static function IsAnyKeyPressed() : Boolean
      {
         for(var i:int = 0; i < tabState.length; i++)
         {
            if(IsKeyPressed(i))
            {
               return true;
            }
         }
         return false;
      }
      
      public static function IsReleased(objState:Object) : Boolean
      {
         return !objState.bState && Boolean(objState.bOldState);
      }
      
      public static function keyUpHandler(event:KeyboardEvent) : void
      {
         var i:Object = null;
         tabState[event.keyCode] = false;
         for(i in oKeyMap_1)
         {
            if(oKeyMap_1[i].key == event.keyCode)
            {
               oKeyMap_1[i].bState = false;
            }
         }
      }
      
      private static function MouseUpHandler(evt:MouseEvent) : void
      {
         _mouseDown = false;
      }
      
      public static function IsKeyPressed(i:int) : Boolean
      {
         return !tabOldState[i] && Boolean(tabState[i]);
      }
      
      public static function Init(main:MainGame) : void
      {
         var i:Object = null;
         if(_isInit || VersionInfo.noKeyManager)
         {
            return;
         }
         _isInit = true;
         oDefaultKey_1.iKeyLeft = {
            "key":Keyboard.LEFT,
            "bOldState":false,
            "bState":false
         };
         oDefaultKey_1.iKeyRight = {
            "key":Keyboard.RIGHT,
            "bOldState":false,
            "bState":false
         };
         oDefaultKey_1.iKeyDown = {
            "key":Keyboard.DOWN,
            "bOldState":false,
            "bState":false
         };
         oDefaultKey_1.iKeyUp = {
            "key":Keyboard.UP,
            "bOldState":false,
            "bState":false
         };
         oDefaultKey_1.iKeyMortar = {
            "key":Keyboard.CONTROL,
            "bOldState":false,
            "bState":false
         };
         oDefaultKey_1.iKeyShoot = {
            "key":65,
            "bOldState":false,
            "bState":false
         };
         _stage = main.stage;
         _main = main;
         for(i in oDefaultKey_1)
         {
            oKeyMap_1[i] = oDefaultKey_1[i];
         }
         _stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyManager.keyDownHandler);
         _stage.addEventListener(KeyboardEvent.KEY_UP,KeyManager.keyUpHandler);
         _stage.addEventListener(MouseEvent.MOUSE_UP,KeyManager.MouseUpHandler,false,0);
         _stage.addEventListener(MouseEvent.MOUSE_DOWN,KeyManager.MouseDownHandler,false,0);
         _stage.addEventListener(Event.DEACTIVATE,KeyManager.Deactivate);
         _stage.addEventListener(FocusEvent.FOCUS_OUT,KeyManager.Deactivate);
      }
      
      public static function IsMousePressed() : Boolean
      {
         return !_oldMouseDown && _mouseDown;
      }
      
      public static function IsMouseDown() : Boolean
      {
         return _mouseDown;
      }
      
      public static function GetMousePos() : Point
      {
         return _mousePos;
      }
      
      public static function myLocalToMain(mc:MovieClip, p:Point) : Point
      {
         p = mc.localToGlobal(p);
         var m:Matrix = _main.transform.concatenatedMatrix.clone();
         m.invert();
         return m.transformPoint(p);
      }
      
      public static function IsMouseReleased() : Boolean
      {
         return _oldMouseDown && !_mouseDown;
      }
      
      public static function ByPassKeyDown(i:int, b:Boolean) : Boolean
      {
         return tabState[i] = b;
      }
      
      public static function Destroy() : void
      {
         _stage.removeEventListener(KeyboardEvent.KEY_DOWN,KeyManager.keyDownHandler);
         _stage.removeEventListener(KeyboardEvent.KEY_UP,KeyManager.keyUpHandler);
         _stage.removeEventListener(MouseEvent.MOUSE_UP,KeyManager.MouseUpHandler);
         _stage.removeEventListener(MouseEvent.MOUSE_DOWN,KeyManager.MouseDownHandler);
         _stage.removeEventListener(Event.DEACTIVATE,KeyManager.Deactivate);
         _stage.removeEventListener(FocusEvent.FOCUS_OUT,KeyManager.Deactivate);
      }
      
      public static function get isInit() : Boolean
      {
         return _isInit;
      }
      
      public static function keyDownHandler(event:KeyboardEvent) : void
      {
         var i:Object = null;
         var key:uint = event.keyCode;
         if(key < 0 || key >= tabState.length)
         {
            return;
         }
         tabState[event.keyCode] = true;
         for(i in oKeyMap_1)
         {
            if(oKeyMap_1[i].key == event.keyCode)
            {
               oKeyMap_1[i].bState = true;
            }
         }
      }
      
      public static function GetInstance() : KeyManager
      {
         if(m_Instance == null)
         {
            m_Instance = new KeyManager();
         }
         return m_Instance;
      }
      
      public static function Update() : void
      {
         var i:Object = null;
         for(i in oKeyMap_1)
         {
            oKeyMap_1[i].bOldState = oKeyMap_1[i].bState;
         }
         tabOldState = tabState.slice();
         _mouseMove.x = _main.mouseX - _mousePos.x;
         _mouseMove.y = _main.mouseY - _mousePos.y;
         _mousePos.x = _main.mouseX;
         _mousePos.y = _main.mouseY;
         _oldMouseDown = _mouseDown;
      }
      
      public static function IsKeyDown(i:int) : Boolean
      {
         return tabState[i];
      }
      
      public static function IsPressed(objState:Object) : Boolean
      {
         return Boolean(objState.bState) && !objState.bOldState;
      }
   }
}

