package com.battlecry.screens
{
   import com.battlecry.BC_Game;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.games.screens.OpenCloseScreen;
   import com.lachhhEngine.games.screens.ScreenManager;
   import flash.display.MovieClip;
   
   public class BC_Screen extends OpenCloseScreen
   {
      
      public var _context:BC_Game;
      
      public function BC_Screen()
      {
         super();
      }
      
      public function RecurPlay(mc:MovieClip) : void
      {
         var m:MovieClip = null;
         mc.play();
         for(var i:int = 0; i < mc.numChildren; i++)
         {
            m = mc.getChildAt(i) as MovieClip;
            if(m)
            {
               this.RecurPlay(m);
            }
         }
      }
      
      public function Hide() : void
      {
         visual.visible = false;
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._context = context as BC_Game;
      }
      
      public function get getContext() : BC_Game
      {
         return this._context;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
      }
      
      public function close() : void
      {
         ScreenManager.instance.RemoveScreen(this);
      }
      
      public function Show() : void
      {
         visual.visible = true;
      }
   }
}

