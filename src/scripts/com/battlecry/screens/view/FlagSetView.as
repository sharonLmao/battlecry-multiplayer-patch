package com.battlecry.screens.view
{
   import com.battlecry.io.BC_GameProgress;
   import com.battlecry.meta.MetaFlag;
   import com.battlecry.meta.model.ModelFlagEnum;
   import com.lachhhEngine.games.screens.view.ObjectView;
   import com.lachhhEngine.interfaces.forms.ButtonSelect;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class FlagSetView extends ObjectView
   {
      
      private var _FondSelection:FlagSelectionView;
      
      private var _flagView:FlagView;
      
      private var _Symbol2Selection:FlagSelectionView;
      
      private var _Symbol1Selection:FlagSelectionView;
      
      private var _metaFlag:MetaFlag;
      
      public function FlagSetView(visual:MovieClip)
      {
         var i:int = 0;
         var e:FlagPartView = null;
         super(visual);
         this._metaFlag = new MetaFlag();
         this._metaFlag.Copy(BC_GameProgress.gameProgess.metaFlag);
         this._Symbol1Selection = new FlagSelectionView(this.symbole1View);
         this._Symbol1Selection.Init(ModelFlagEnum.SYMBOLE1);
         this._Symbol1Selection.InitSelect(this._metaFlag);
         this._Symbol1Selection.Refresh();
         this._Symbol2Selection = new FlagSelectionView(this.symbole2View);
         this._Symbol2Selection.Init(ModelFlagEnum.SYMBOLE2);
         this._Symbol2Selection.InitSelect(this._metaFlag);
         this._Symbol2Selection.Refresh();
         this._FondSelection = new FlagSelectionView(this.fondView);
         this._FondSelection.Init(ModelFlagEnum.FOND);
         this._FondSelection.InitSelect(this._metaFlag);
         this._FondSelection.Refresh();
         this._flagView = new FlagView(this.flagView);
         this._flagView.SetMetaFlag(this._metaFlag);
         for(i = 0; i < this._Symbol1Selection.views.length; i++)
         {
            e = this._Symbol1Selection.views[i];
            e.visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickSymbole1);
         }
         for(i = 0; i < this._Symbol2Selection.views.length; i++)
         {
            e = this._Symbol2Selection.views[i];
            e.visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickSymbole2);
         }
         for(i = 0; i < this._FondSelection.views.length; i++)
         {
            e = this._FondSelection.views[i];
            e.visual.addEventListener(MouseEvent.MOUSE_DOWN,this.onClickFond);
         }
      }
      
      public function get symbole1View() : MovieClip
      {
         return visual.getChildByName("symbole1View") as MovieClip;
      }
      
      public function get metaFlag() : MetaFlag
      {
         return this._metaFlag;
      }
      
      private function onClickFond(event:MouseEvent) : void
      {
         var mc:MovieClip = null;
         if(event.target as ButtonSelect)
         {
            mc = (event.target as ButtonSelect).parent as MovieClip;
         }
         else
         {
            mc = event.target as MovieClip;
         }
         var v1:FlagPartView = this._FondSelection.GetViewFromVisual(mc) as FlagPartView;
         if(this._FondSelection.Select(v1))
         {
            this._metaFlag.fond = v1.modelFlag;
            this._flagView.SetMetaFlag(this._metaFlag);
         }
      }
      
      override public function Update() : void
      {
         super.Update();
         this._Symbol1Selection.Update();
         this._Symbol2Selection.Update();
         this._FondSelection.Update();
      }
      
      public function get symbole2View() : MovieClip
      {
         return visual.getChildByName("symbole2View") as MovieClip;
      }
      
      public function get fondView() : MovieClip
      {
         return visual.getChildByName("fondView") as MovieClip;
      }
      
      private function onClickSymbole1(event:MouseEvent) : void
      {
         var mc:MovieClip = null;
         if(event.target as ButtonSelect)
         {
            mc = (event.target as ButtonSelect).parent as MovieClip;
         }
         else
         {
            mc = event.target as MovieClip;
         }
         var v1:FlagPartView = this._Symbol1Selection.GetViewFromVisual(mc) as FlagPartView;
         if(this._Symbol1Selection.Select(v1))
         {
            this._metaFlag.symbole1 = v1.modelFlag;
            this._flagView.SetMetaFlag(this._metaFlag);
         }
      }
      
      public function set metaFlag(metaFlag:MetaFlag) : void
      {
         this._metaFlag = metaFlag;
      }
      
      private function onClickSymbole2(event:MouseEvent) : void
      {
         var mc:MovieClip = null;
         if(event.target as ButtonSelect)
         {
            mc = (event.target as ButtonSelect).parent as MovieClip;
         }
         else
         {
            mc = event.target as MovieClip;
         }
         var v1:FlagPartView = this._Symbol2Selection.GetViewFromVisual(mc) as FlagPartView;
         if(this._Symbol2Selection.Select(v1))
         {
            this._metaFlag.symbole2 = v1.modelFlag;
            this._flagView.SetMetaFlag(this._metaFlag);
         }
      }
      
      public function ClearAllSelection() : void
      {
         this._Symbol1Selection.ClearAllSelection();
         this._Symbol2Selection.ClearAllSelection();
         this._FondSelection.ClearAllSelection();
      }
      
      override public function Destroy() : void
      {
         var i:int = 0;
         var e:FlagPartView = null;
         for(i = 0; i < this._Symbol1Selection.views.length; i++)
         {
            e = this._Symbol1Selection.views[i];
            e.visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickSymbole1);
         }
         for(i = 0; i < this._Symbol2Selection.views.length; i++)
         {
            e = this._Symbol2Selection.views[i];
            e.visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickSymbole2);
         }
         for(i = 0; i < this._FondSelection.views.length; i++)
         {
            e = this._FondSelection.views[i];
            e.visual.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClickFond);
         }
         this._Symbol1Selection.Destroy();
         this._Symbol2Selection.Destroy();
         this._FondSelection.Destroy();
         this._flagView.Destroy();
         super.Destroy();
      }
      
      public function get flagView() : MovieClip
      {
         return visual.getChildByName("flagView") as MovieClip;
      }
   }
}

