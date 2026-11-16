package com.battlecry.screens.view
{
   import com.battlecry.BedUtil.ScrollBarPanelView;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.meta.model.ModelCampaign;
   import com.battlecry.screens.BC_Screen;
   import com.battlecry.screens.view.scrollItem.CampaignViewSquare;
   import com.lachhhEngine.games.animation.AnimationManager;
   import flash.display.MovieClip;
   
   public class CampaignGroupView extends BC_ObjectGroupView
   {
      
      private var _screenToClose:BC_Screen;
      
      private var _scrollBarPanelView:ScrollBarPanelView;
      
      public function CampaignGroupView(visual:MovieClip, screenToClose:BC_Screen)
      {
         super(visual);
         this._screenToClose = screenToClose;
         this._scrollBarPanelView = new ScrollBarPanelView(visual);
         this._scrollBarPanelView.Init(0,5,true,0,0);
         this._scrollBarPanelView.Refresh();
      }
      
      override public function Update() : void
      {
         super.Update();
         this._scrollBarPanelView.Update();
      }
      
      public function BuildView(v:Vector.<ModelCampaign>) : void
      {
         var e:CampaignViewSquare = null;
         this.Clear();
         for(var i:int = 0; i < v.length; i++)
         {
            e = new CampaignViewSquare(AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_CAMPAIGNVIEWSQUARE));
            AddView(new CampaignView(e.visualMc,this._screenToClose));
            this._scrollBarPanelView.Add(e);
         }
         for(i = 0; i < views.length; i++)
         {
            (views[i] as CampaignView).SetModelCampaign(v[i]);
         }
         this._scrollBarPanelView.Refresh();
      }
      
      public function set scrollBarPanelView(scrollBarPanelView:ScrollBarPanelView) : void
      {
         this._scrollBarPanelView = scrollBarPanelView;
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._scrollBarPanelView.Destroy();
         while(views.length)
         {
            (views[0] as CampaignView).Destroy();
            RemoveView(views[0]);
         }
      }
      
      public function get scrollBarPanelView() : ScrollBarPanelView
      {
         return this._scrollBarPanelView;
      }
      
      private function Clear() : void
      {
         this._scrollBarPanelView.removeAll();
         while(views.length)
         {
            (views[0] as CampaignView).Destroy();
            RemoveView(views[0]);
         }
      }
   }
}

