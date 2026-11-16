package com.battlecry.items
{
   import com.lachhhEngine.games.Game;
   import com.lachhhEngine.games.items.ItemFactory;
   import com.lachhhEngine.games.items.ItemManager;
   
   public class BC_ItemManager extends ItemManager
   {
      
      public function BC_ItemManager(context:Game, itemFactory:ItemFactory)
      {
         super(context,itemFactory);
      }
   }
}

