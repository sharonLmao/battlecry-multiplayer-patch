package com.battlecry.effects
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.meta.MetaObject;
   import flash.text.TextField;
   
   public class FloatingText extends BC_GameEffect
   {
      
      private var _lifeTime:Number;
      
      public function FloatingText()
      {
         super();
      }
      
      override public function Init(metaObject:MetaObject, context:Game) : void
      {
         super.Init(metaObject,context);
         this._lifeTime = 36;
      }
      
      public function get floatingText() : TextField
      {
         return animation.getChildByName("floatingText") as TextField;
      }
      
      override public function Update(context:Game) : void
      {
         super.Update(context);
         --this._lifeTime;
         py = py - 1;
         if(this._lifeTime <= 0)
         {
            context.gameEffectManager.DestroyGameEffect(this);
         }
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
      }
      
      public function SetText(s:String) : void
      {
         this.floatingText.text = s;
      }
   }
}

