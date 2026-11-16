package com.lachhhEngine.games.levelEditor
{
   import com.lachhhEngine.games.factory.ObjectFactory;
   
   public class LevelEditorHelperFactory extends ObjectFactory
   {
      
      private var _instanceCircleHelper:int;
      
      private var _instanceSwitchHelper:int;
      
      private var _instanceLineHelper:int;
      
      private var _instanceCamBoundsHelper:int;
      
      public function LevelEditorHelperFactory()
      {
         super();
         this._instanceLineHelper = PushClassLink(LineHelper);
         this._instanceCircleHelper = PushClassLink(CircleHelper);
         this._instanceSwitchHelper = PushClassLink(SwitchHelper);
         this._instanceCamBoundsHelper = PushClassLink(CamBoundsHelper);
      }
      
      public function get ID_CAM_BOUNDS_HELPER() : int
      {
         return this._instanceCamBoundsHelper;
      }
      
      public function get ID_LINE_HELPER() : int
      {
         return this._instanceLineHelper;
      }
      
      public function get ID_CIRCLE_HELPER() : int
      {
         return this._instanceCircleHelper;
      }
      
      public function get ID_SWITCH_HELPER() : int
      {
         return this._instanceSwitchHelper;
      }
   }
}

