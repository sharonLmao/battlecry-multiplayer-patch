package com.battlecry.screens
{
   import com.battlecry.factories.BC_AnimationFactory;
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.meta.MetaObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class ArmyInfoScreen extends BC_Screen
   {
      
      public function ArmyInfoScreen()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this.btnQuit.addEventListener(MouseEvent.MOUSE_DOWN,this.onQuit);
      }
      
      public function get armyInfoTxt() : TextField
      {
         return visual.getChildByName("armyInfoTxt") as TextField;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this.btnQuit.removeEventListener(MouseEvent.MOUSE_DOWN,this.onQuit);
      }
      
      public function get btnQuit() : MovieClip
      {
         return visual.getChildByName("quit") as MovieClip;
      }
      
      override public function CreateVisual() : Animation
      {
         return AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_ARMYINFOSCREEN);
      }
      
      private function onQuit(event:MouseEvent) : void
      {
         close();
      }
      
      public function SetText(s:String) : void
      {
         this.armyInfoTxt.text = s;
      }
   }
}

