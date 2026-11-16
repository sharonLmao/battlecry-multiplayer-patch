package com.battlecry.screens.view
{
   import com.battlecry.BC_Game;
   import com.battlecry.BedUtil.ScrollBarPanelView;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.model.ModelBoosterPack;
   import com.battlecry.screens.BC_ScreenFactory;
   import com.battlecry.screens.BoosterPackScreen;
   import com.battlecry.screens.ItemDescriptionScreen;
   import com.battlecry.screens.view.scrollItem.BoosterViewSquare;
   import com.battlecry.screens.view.scrollItem.DailyBoosterViewSquare;
   import com.lachhhEngine.games.animation.Animation;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.screens.ScreenManager;
   import com.lachhhEngine.utils.Utils;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class BoosterPackSetView extends BC_ObjectGroupView
   {
      
      private var _scrollBarPanelView:ScrollBarPanelView;
      
      private var _spacing:Animation;
      
      private var _backBooster2:Animation;
      
      private var _boosterPackScreen:BoosterPackScreen;
      
      private var _descriptionScreen:ItemDescriptionScreen;
      
      private var _dailyBoosterView:DailyBoosterPackView;
      
      private var _backBooster:Animation;
      
      private var _totalItem:Vector.<ModelBoosterPack> = new Vector.<ModelBoosterPack>();
      
      public function BoosterPackSetView(visual:MovieClip, boosterPackScreen:BoosterPackScreen)
      {
         super(visual);
         this._boosterPackScreen = boosterPackScreen;
         this._scrollBarPanelView = new ScrollBarPanelView(visual);
         this._scrollBarPanelView.Init(20,0,false,0,0);
         this._scrollBarPanelView.Refresh();
      }
      
      private function onRollOverDaily(event:MouseEvent) : void
      {
         this._descriptionScreen.SetMetaEquipement(this._dailyBoosterView.dailyModelBoosterPack.itemArray[0]);
         this._descriptionScreen.Show();
         this._dailyBoosterView.dailyRollOver.addEventListener(MouseEvent.MOUSE_OUT,this.onRollOut);
      }
      
      public function SetGroupItem(group:Vector.<ModelBoosterPack>) : void
      {
      }
      
      private function onRollOverWeekly(event:MouseEvent) : void
      {
         this._descriptionScreen.SetMetaEquipement(this._dailyBoosterView.weeklyModelBoosterPack.itemArray[0]);
         this._descriptionScreen.Show();
         this._dailyBoosterView.weeklyRollOver.addEventListener(MouseEvent.MOUSE_OUT,this.onRollOut);
      }
      
      public function BuildView(v:Vector.<ModelBoosterPack>) : void
      {
         var d:DailyBoosterViewSquare = null;
         var e:BoosterViewSquare = null;
         this.Clear();
         if(BC_Game.instance.isConnected)
         {
            d = new DailyBoosterViewSquare(AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_DAILYBOOSTERVIEW));
            this._dailyBoosterView = new DailyBoosterPackView(d.visualMc,this._boosterPackScreen);
            this._dailyBoosterView.SetDailyBoosterPack(this._boosterPackScreen.dailyPack);
            this._dailyBoosterView.SetWeeklyBoosterPack(this._boosterPackScreen.weeklyPack);
            this._dailyBoosterView.Refresh();
            this._scrollBarPanelView.Add(d);
            this._dailyBoosterView.dailyRollOver.addEventListener(MouseEvent.MOUSE_OVER,this.onRollOverDaily);
            this._dailyBoosterView.weeklyRollOver.addEventListener(MouseEvent.MOUSE_OVER,this.onRollOverWeekly);
         }
         for(var i:int = 0; i < v.length; i++)
         {
            e = new BoosterViewSquare(AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_BOOSTERVIEWSQUARE));
            AddView(new BoosterPackView(e.visualMc));
            this._scrollBarPanelView.Add(e);
         }
         this._spacing = AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_SCROLLBARSPACING);
         this._spacing.scaleX = 1;
         this._scrollBarPanelView.AddSpacing(this._spacing);
         this._backBooster = AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_FX_BACKBOOSTER);
         this._scrollBarPanelView.AddBackBooster(this._backBooster);
         this._backBooster2 = AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_FX_BACKBOOSTER);
         this._scrollBarPanelView.AddBackBooster(this._backBooster2);
         for(i = 0; i < views.length; i++)
         {
            (views[i] as BoosterPackView).setModelBoosterPack(v[i],this._boosterPackScreen);
         }
         this._scrollBarPanelView.Refresh();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         if(this._dailyBoosterView)
         {
            this._dailyBoosterView.Destroy();
         }
         this._scrollBarPanelView.Destroy();
         ScreenManager.instance.RemoveScreen(this._descriptionScreen);
         if(this._spacing)
         {
            Utils.LazyRemoveFromParent(this._spacing);
            this._spacing = null;
         }
         if(this._backBooster)
         {
            Utils.LazyRemoveFromParent(this._backBooster);
            this._backBooster = null;
         }
         if(this._backBooster2)
         {
            Utils.LazyRemoveFromParent(this._backBooster2);
            this._backBooster2 = null;
         }
      }
      
      public function get viewSquare() : MovieClip
      {
         return visual.getChildByName("viewSquare") as MovieClip;
      }
      
      override public function Update() : void
      {
         super.Update();
         for(var i:int = 0; i < views.length; i++)
         {
            (views[i] as BoosterPackView).Update();
         }
         if(this._dailyBoosterView)
         {
            this._dailyBoosterView.Update();
         }
         this._scrollBarPanelView.Update();
      }
      
      private function Clear() : void
      {
         this._scrollBarPanelView.removeAll();
         while(views.length)
         {
            (views[0] as BoosterPackView).Destroy();
            RemoveView(views[0]);
         }
         if(this._spacing)
         {
            Utils.LazyRemoveFromParent(this._spacing);
            this._spacing = null;
         }
         if(this._backBooster)
         {
            Utils.LazyRemoveFromParent(this._backBooster);
            this._backBooster = null;
         }
      }
      
      private function onRollOut(event:MouseEvent) : void
      {
         this._descriptionScreen.Hide();
      }
      
      public function SetScrollBarPrct(prct:Number) : void
      {
         this._scrollBarPanelView.scrollBarView.scrollPrc = prct;
         this._scrollBarPanelView.Refresh();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         if(this._dailyBoosterView)
         {
            this._dailyBoosterView.Refresh();
         }
      }
      
      public function Init(group:Vector.<ModelBoosterPack>) : void
      {
         if(!this._descriptionScreen)
         {
            this._descriptionScreen = ScreenManager.instance.ShowScreen(BC_ScreenFactory.ID_ITEMDESCRIPTION_SCREEN,false,true) as ItemDescriptionScreen;
            this._descriptionScreen.Hide();
         }
         this.BuildView(group);
         for(var i:int = 0; i < group.length; i++)
         {
            this._totalItem[i] = group[i];
         }
      }
   }
}

