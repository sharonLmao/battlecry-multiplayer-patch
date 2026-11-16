package com.battlecry.screens.view
{
   import com.battlecry.BedUtil.ScrollBarPanelView;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.screens.view.scrollItem.VersionUpdateTextViewSquare;
   import com.lachhhEngine.games.animation.AnimationManager;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   
   public class VersionUpdateView extends ObjectView
   {
      
      private var _scrollBarPanelView:ScrollBarPanelView;
      
      public function VersionUpdateView(visual:DisplayObjectContainer)
      {
         super(visual);
         this._scrollBarPanelView = new ScrollBarPanelView(this.VersionUpdateScrollBar);
         this._scrollBarPanelView.Init(0,0,true,0,0);
         this._scrollBarPanelView.Refresh();
         this.BuildView();
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._scrollBarPanelView.Destroy();
      }
      
      public function get VersionUpdateScrollBar() : MovieClip
      {
         return visual.getChildByName("VersionUpdateScrollBar") as MovieClip;
      }
      
      override public function Update() : void
      {
         super.Update();
         this._scrollBarPanelView.Update();
      }
      
      private function BuildView() : void
      {
         var v:VersionUpdateTextViewSquare = new VersionUpdateTextViewSquare(AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_VERSIONUPDATETEXTVIEWSQUARE));
         this._scrollBarPanelView.Add(v);
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this._scrollBarPanelView.Refresh();
      }
   }
}

