package com.battlecry.screens
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.MainGame;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import com.lachhhEngine.io.Callback;
   import com.lachhhEngine.io.files.FileManager;
   import flash.display.MovieClip;
   
   public class SaveScreen extends BC_Screen
   {
      
      private var _endCallBack:Callback;
      
      private var _init:Boolean;
      
      public function SaveScreen()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._init = true;
         this._endCallBack = null;
      }
      
      public function get endCallBack() : Callback
      {
         return this._endCallBack;
      }
      
      public function get anim() : MovieClip
      {
         return visual.getChildByName("anim") as MovieClip;
      }
      
      override public function Update(context:MainGame) : void
      {
         super.Update(context);
         if(this._init && this.anim.currentFrame >= 2)
         {
            FileManager.instance.SaveToExternalAPI();
            this._init = false;
         }
         if(this.anim.currentFrame >= 20)
         {
            Close(true,null,false);
            if(this._endCallBack)
            {
               this._endCallBack.DoCallback();
            }
         }
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_SAVE_SCREEN);
      }
      
      public function set endCallBack(endCallBack:Callback) : void
      {
         this._endCallBack = endCallBack;
      }
   }
}

