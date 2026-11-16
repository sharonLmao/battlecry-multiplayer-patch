package com.battlecry.screens.view
{
   import com.battlecry.BedUtil.ScrollBarPanelView;
   import com.battlecry.factories.BC_AnimationFactory;
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.MetaFlag;
   import com.battlecry.meta.model.ModelFlag;
   import com.battlecry.screens.view.scrollItem.FlagViewSquare;
   import com.lachhhEngine.games.animation.AnimationManager;
   import flash.display.MovieClip;
   
   public class FlagSelectionView extends BC_ObjectGroupView
   {
      
      private var _scrollBarPanelView:ScrollBarPanelView;
      
      private var _totalFlag:Vector.<ModelFlag> = new Vector.<ModelFlag>();
      
      public function FlagSelectionView(visual:MovieClip)
      {
         super(visual);
         this._scrollBarPanelView = new ScrollBarPanelView(visual);
         this._scrollBarPanelView.Init(5,0,false,0,0);
         this._scrollBarPanelView.Refresh();
      }
      
      override public function Update() : void
      {
         super.Update();
         this._scrollBarPanelView.Update();
      }
      
      private function BuildView(v:Vector.<ModelFlag>) : void
      {
         var e:FlagViewSquare = null;
         for(var i:int = 0; i < v.length; i++)
         {
            e = new FlagViewSquare(AnimationManager.instance.CreateAnimation(BC_AnimationFactory.ID_FLAGVIEWSQUARE));
            AddView(new FlagPartView(e.visualMc));
            this._scrollBarPanelView.Add(e);
         }
         for(i = 0; i < views.length; i++)
         {
            (views[i] as FlagPartView).SetModelFlag(v[i]);
         }
      }
      
      public function InitSelect(metaFlag:MetaFlag) : void
      {
         var f:ModelFlag = null;
         this.ClearAllSelection();
         for(var i:int = 0; i < this._totalFlag.length; i++)
         {
            f = this._totalFlag[i];
            if(f.id == metaFlag.fond.id)
            {
               this._totalFlag[i].selected = true;
            }
            if(f.id == metaFlag.symbole1.id)
            {
               this._totalFlag[i].selected = true;
            }
            if(f.id == metaFlag.symbole2.id)
            {
               this._totalFlag[i].selected = true;
            }
         }
      }
      
      public function Init(group:Vector.<ModelFlag>) : void
      {
         var result:Vector.<ModelFlag> = new Vector.<ModelFlag>();
         for(var i:int = int(group.length - 1); i >= 0; i--)
         {
            if(BC_GameProgress.gameProgess.flagManager.IsFlagUnlock(group[i]))
            {
               result.unshift(group[i]);
            }
         }
         for(i = 0; i < group.length; i++)
         {
            if(!BC_GameProgress.gameProgess.flagManager.IsFlagUnlock(group[i]))
            {
               result.push(group[i]);
            }
         }
         this.BuildView(result);
         for(i = 0; i < result.length; i++)
         {
            this._totalFlag[i] = result[i];
         }
      }
      
      public function ClearAllSelection() : void
      {
         for(var i:int = 0; i < this._totalFlag.length; i++)
         {
            this._totalFlag[i].selected = false;
         }
      }
      
      override public function Destroy() : void
      {
         super.Destroy();
         this._scrollBarPanelView.Destroy();
      }
      
      override public function Refresh() : void
      {
         super.Refresh();
         this._scrollBarPanelView.Refresh();
      }
      
      public function Select(flagPartView:FlagPartView) : Boolean
      {
         var i:int = 0;
         if(BC_GameProgress.gameProgess.flagManager.IsFlagUnlock(flagPartView.modelFlag))
         {
            this.ClearAllSelection();
            for(i = 0; i < this._totalFlag.length; i++)
            {
               if(flagPartView.modelFlag.id == this._totalFlag[i].id)
               {
                  this._totalFlag[i].selected = true;
               }
            }
            this.Refresh();
            return true;
         }
         return false;
      }
   }
}

